/*
	patch for MLine00000656
	DB version: 3.37.025
*/
set nocount on
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[usp_TradeByContractAndTrader_Del]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[usp_TradeByContractAndTrader_Del]
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[usp_PositionForReconcile_Get]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[usp_PositionForReconcile_Get]
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[usp_Trade_Clear]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[usp_Trade_Clear]
GO
SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE  PROCEDURE dbo.usp_TradeByContractAndTrader_Del 
	@vcAcronym varchar(12) = null,
    @vcUnderlyingSymbol varchar(20),
    @dtExpiry datetime,
    @fStrike float,
    @tiIsCall tinyint,
    @dtTradeDate datetime = null
AS
/*
	Created by Zaur Nuraliev
	Description: this procedure is delete information from Tub table
	Updated by Mike Malyshkin
*/
	-------------------------------------------------
	set nocount on
	-------------------------------------------------
	declare @error int		set @error = -1


	declare @iTraderID int,
			@iOptionID int,
			@iExpiryID int

	if @vcAcronym is not null
		select @iTraderID = traderID from Trader where acronym = @vcAcronym

	set @iExpiryID = (year(@dtExpiry) - 2000) * 12 + month(@dtExpiry)

	set @fStrike = round(@fStrike, 3)

	select @iOptionID = optionID
		from OptionView (nolock)
				join Contract C (nolock) on C.contractID = OptionView.underlyingContractID
		where C.symbol = @vcUnderlyingSymbol and 
			isCall = @tiIsCall and abs(strike - @fStrike) < 0.009 and expiryID = @iExpiryID

	declare @iTradeID int

	declare Trades_cursor cursor
	read_only
		for Select distinct tradeID 
				from TradeView
				where contractID = @iOptionID 
					and (traderID = @iTraderID or @iTraderID is null)
					and (@dtTradeDate is null or datediff(day,tradeDate,@dtTradeDate) >= 0)


	Begin Transaction

		open Trades_cursor
			fetch next from Trades_cursor into @iTradeID
				while (@@fetch_status <> -1)
					begin
						if (@@fetch_status <> -2)
					begin
						exec usp_Trade_Del @iTradeID
						--select @iTradeID
						if @@error <> 0 begin set @error = 3 if @@TranCount = 1 Rollback Tran goto finish end
					end
					fetch next from Trades_cursor into @iTradeID
				end

		Close Trades_cursor
		Deallocate Trades_cursor

		set @error = @@error
	Commit Transaction

finish:
Return(@error)



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON 
GO


CREATE PROCEDURE dbo.usp_PositionForReconcile_Get
	@tiByTrader tinyint = 0,
	@lastUTCTradeDate datetime = null
AS
	if isnull(@tiByTrader, 0) = 0
	begin
		select 
			c.contractID as iContractID,
			c.contractTypeID as iContractTypeID,
			c.Symbol as vcSymbol,
			null as dtExpiry,
			null as fStrike,
			null as bIsCall,
			c.contractID as iUnderlyingContractID,
			c.contractTypeID as iUnderlyingContractTypeID,
			c.Symbol as vcUnderlyingSymbol,

			cp.lotSize as iLotSize,
			cp.priceClose as fPriceClose,

			null as iTraderID,
			null as vcAcronym,
			sum(tr.quantity * (case when tr.isBuy <> 0 then 1 else -1 end)) as iQty
		
		from TradeView tr 
			inner join ContractView c  on tr.contractID = c.contractID
			inner join ContractPrice cp on c.contractID = cp.contractID and cp.exchangeID is null
		where c.contractTypeID in (1, 2)
			and isnull(tr.isSimulated, 0) = 0 
			and (@lastUTCTradeDate is null or datediff(day,tr.tradeDate,@lastUTCTradeDate) >= 0)
		group by c.contractID, c.contractTypeID, c.Symbol, cp.lotSize, cp.priceClose
		
		union
	
		select 
			c.contractID as iContractID,
			c.contractTypeID as iContractTypeID,
			c.Symbol as vcSymbol,
			EC.expiryDate as dtExpiry,
			o.strike as fStrike,
			o.isCall as bIsCall,
			uc.contractID as iUnderlyingContractID,
			uc.contractTypeID as iUnderlyingContractTypeID,
			uc.Symbol as vcUnderlyingSymbol,

			cp.lotSize as iLotSize,
			cp.priceClose as fPriceClose,

			null as iTraderID,
			null as vcAcronym,
			sum(tr.quantity * (case when tr.isBuy <> 0 then 1 else -1 end)) as iQty

		from TradeView tr 
			inner join ContractView C on tr.contractID = C.contractID
			inner join [Option] o on c.contractID = o.optionID
			inner join Contract UC on o.underlyingContractID = UC.contractID
			inner join ContractPrice cp on c.contractID = cp.contractID and cp.exchangeID is null
			inner join ExpiryInCalendarView EC on O.expiryID = EC.expiryID and EC.expCalendarID = UC.expCalendarID
	
		where c.contractTypeID = 3
			and isnull(tr.isSimulated, 0) = 0 
			and (@lastUTCTradeDate is null or datediff(day,tr.tradeDate,@lastUTCTradeDate) >= 0)
		group by C.contractID, C.contractTypeID, C.Symbol, 
			EC.expiryDate, o.strike, o.isCall, uc.contractID, uc.contractTypeID, uc.Symbol,
			cp.lotSize, cp.priceClose
	
		order by vcSymbol
	end
	else
	begin
		select 
			c.contractID as iContractID,
			c.contractTypeID as iContractTypeID,
			c.Symbol as vcSymbol,
			null as dtExpiry,
			null as fStrike,
			null as bIsCall,
			c.contractID as iUnderlyingContractID,
			c.contractTypeID as iUnderlyingContractTypeID,
			c.Symbol as vcUnderlyingSymbol,

			cp.lotSize as iLotSize,
			cp.priceClose as fPriceClose,

			trdr.TraderID as iTraderID,
			trdr.acronym as vcAcronym,
			sum(tr.quantity * (case when tr.isBuy <> 0 then 1 else -1 end)) as iQty
		
		from TradeView tr 
			inner join ContractView c  on tr.contractID = c.contractID
			inner join ContractPrice cp on c.contractID = cp.contractID and cp.exchangeID is null
			left join TraderView trdr on tr.traderID = trdr.traderID
		where c.contractTypeID in (1, 2)
			and isnull(tr.isSimulated, 0) = 0 
			and (@lastUTCTradeDate is null or datediff(day,tr.tradeDate,@lastUTCTradeDate) >= 0)
		group by c.contractID, c.contractTypeID, c.Symbol, cp.lotSize, cp.priceClose, trdr.TraderID, trdr.acronym
		
		union
	
		select 
			c.contractID as iContractID,
			c.contractTypeID as iContractTypeID,
			c.Symbol as vcSymbol,
			EC.expiryDate as dtExpiry,
			o.strike as fStrike,
			o.isCall as bIsCall,
			uc.contractID as iUnderlyingContractID,
			uc.contractTypeID as iUnderlyingContractTypeID,
			uc.Symbol as vcUnderlyingSymbol,

			cp.lotSize as iLotSize,
			cp.priceClose as fPriceClose,

			trdr.TraderID as iTraderID,
			trdr.acronym as vcAcronym,
			sum(tr.quantity * (case when tr.isBuy <> 0 then 1 else -1 end)) as iQty

		from TradeView tr 
			inner join ContractView C on tr.contractID = C.contractID
			inner join [Option] o on c.contractID = o.optionID
			inner join Contract UC on o.underlyingContractID = UC.contractID
			inner join ContractPrice cp on c.contractID = cp.contractID and cp.exchangeID is null
			inner join ExpiryInCalendarView EC on O.expiryID = EC.expiryID and EC.expCalendarID = UC.expCalendarID
			left join TraderView trdr on tr.traderID = trdr.traderID
	
		where c.contractTypeID = 3
			and isnull(tr.isSimulated, 0) = 0
			and (@lastUTCTradeDate is null or datediff(day,tr.tradeDate,@lastUTCTradeDate) >= 0)
		group by C.contractID, C.contractTypeID, C.Symbol, 
			EC.expiryDate, o.strike, o.isCall, uc.contractID, uc.contractTypeID, uc.Symbol,
			cp.lotSize, cp.priceClose, trdr.TraderID, trdr.acronym
	
		order by vcSymbol
	end







GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO
SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE PROCEDURE dbo.usp_Trade_Clear
	@iContractID int = null,
	@tiOnlyWithExecID tinyint = null,
	@lastUTCTradeDate datetime = null
AS
	-------------------------------------------------
	set nocount on
	-------------------------------------------------
	declare @error int		set @error = 0

	Begin Transaction
		delete from Trade 
		where tradeID in (select tradeID from Trade where isSimulated = 1 and actionID = 0) 
			and (@iContractID is null or contractID = @iContractID)
		if @@error <> 0 begin set @error = 1 if @@TranCount = 1 Rollback Tran goto finish end
	
		if isnull(@tiOnlyWithExecID, 0) = 0
		begin
			delete from Trade 
			where (@iContractID is null or contractID = @iContractID) 
				and isnull(isSimulated, 0) = 0
				and (@lastUTCTradeDate is null or datediff(day,tradeDate,@lastUTCTradeDate) >= 0)
	
			if @@error <> 0 begin set @error = 2 if @@TranCount = 1 Rollback Tran goto finish end
		end
		else
		begin
			delete from Trade 
			where (@iContractID is null or contractID = @iContractID) 
				and isnull(isSimulated, 0) = 0 
				and isnull(execID, '') <> ''
				and (@lastUTCTradeDate is null or datediff(day,tradeDate,@lastUTCTradeDate) >= 0)
	
			if @@error <> 0 begin set @error = 3 if @@TranCount = 1 Rollback Tran goto finish end
		end
		set @error = @@error
	Commit Transaction

finish:
	return @error


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO
--===================================================================================
--change DB version
--===================================================================================
if not exists(select * from DataInfo where DataInfoID = 1 and keyValue = '3.37.025')
	begin
		update DataInfo set keyValue = '3.37.025' where dataInfoID = 1
		print 'DB VERSION WAS CHANGED TO 3.37.025'
	end

/*
	patch for MLine00000679 - "DB cleanup stored procedure error"
	DB version: 3.37.024
*/
set nocount on
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[usp_Contract_Del]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[usp_Contract_Del]
GO
SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO
CREATE    Procedure dbo.usp_Contract_Del
	@iContractID int,			-- contract identifier
	@bisRemovePermanent bit = 0
as
/*
	Create by Zaur Nuraliev
	Description: It deletes Option data from Option and Contract tables
*/
	-------------------------------------------------
	set nocount on
	-------------------------------------------------
	declare @error int		set @error = -1

	if object_ID('tempdb..#Contracts_for_delete') is null
		Create table #Contracts_for_delete(contractID int)

	if @bisRemovePermanent = 0
		begin
			Raiserror('Couldn''t change actionID of Contracts!',16,1)
			Return(-1)
		end

	if @iContractID is not null
		begin
			if exists (select tradeID from Trade where contractID = @iContractID)
				begin
					Raiserror ('Error. Can''t delete Contract because of the existing Trade', 16, 1)
					Return (-1)
				end   
			insert into #Contracts_for_delete
				select @iContractID
		end

	Begin Transaction DelContract

		--ContractExchangeLink
		delete from ContractExchangeLink
		--update ContractExchangeLink set actionID = 3
			where contractID in (select contractID from #Contracts_for_delete)
			if @@error <> 0 begin set @error = 3 if @@TranCount > 0 Rollback Transaction DelContract goto finish end
		--ContractPrice
		delete from ContractPrice 
			where contractID in (select contractID from #Contracts_for_delete)
			if @@error <> 0 begin set @error = 3 if @@TranCount > 0 Rollback Transaction DelContract goto finish end
		--ModelParameter
		--delete from ModelParameter
		--	where contractID in (select contractID from #Contracts_for_delete)
			if @@error <> 0 begin set @error = 3 if @@TranCount > 0 Rollback Transaction DelContract goto finish end
		--ContractInGroup
		delete from ContractInGroup
			where contractID in (select contractID from #Contracts_for_delete)
			if @@error <> 0 begin set @error = 3 if @@TranCount > 0 Rollback Transaction DelContract goto finish end
		--ContractMarketData
		delete from ContractMarketData where contractID in (select contractID from #Contracts_for_delete)
			if @@error <> 0 begin set @error = 3 if @@TranCount > 0 Rollback Transaction DelContract goto finish end
		--TraderContract 
		delete from TraderContract where contractID in (select contractID from #Contracts_for_delete)
			if @@error <> 0 begin set @error = 3 if @@TranCount > 0 Rollback Transaction DelContract goto finish end
		--NextDaySurface
		delete from NextDaySurface where contractID in (select contractID from #Contracts_for_delete)
			if @@error <> 0 begin set @error = 3 if @@TranCount > 0 Rollback Transaction DelContract goto finish end
		--CustomStrikeSkewPoint
		delete from CustomStrikeSkewPoint where volaSurfaceDataID in
			(select volaSurfaceDataID from VolaSurfaceData 
					where contractID in (select contractID from #Contracts_for_delete))
			if @@error <> 0 begin set @error = 3 if @@TranCount > 0 Rollback Transaction DelContract goto finish end
		--VolaSurfaceData
		delete from VolaSurfaceData where contractID in (select contractID from #Contracts_for_delete)
			if @@error <> 0 begin set @error = 3 if @@TranCount > 0 Rollback Transaction DelContract goto finish end
		--VolaBands
		delete from VolaBands where contractID in (select contractID from #Contracts_for_delete)
			if @@error <> 0 begin set @error = 3 if @@TranCount > 0 Rollback Transaction DelContract goto finish end

		--remove options of above selected contracts
		if object_ID('tempdb..#Options_for_delete') is null
			create table #Options_for_delete(OptionID int)
		else
			delete from #Options_for_delete

		insert into #Options_for_delete 
			select optionID 
				from [Option] O
					join #Contracts_for_delete C on C.ContractID = O.underlyingContractID
				where O.optionID not in (select distinct contractID from Trade)
		if @@error <> 0 begin set @error = 3 if @@TranCount > 0 Rollback Transaction DelContract goto finish end

		exec usp_Option_Del null,1
			if @@error <> 0 begin set @error = 3 if @@TranCount > 0 Rollback Transaction DelContract goto finish end

		delete from #Options_for_delete
			if @@error <> 0 begin set @error = 3 if @@TranCount > 0 Rollback Transaction DelContract goto finish end

		insert into #Options_for_delete 
			select contractID from #Contracts_for_delete
		if @@error <> 0 begin set @error = 3 if @@TranCount > 0 Rollback Transaction DelContract goto finish end

		exec usp_Option_Del null,1,0
			if @@error <> 0 begin set @error = 3 if @@TranCount > 0 Rollback Transaction DelContract goto finish end
	Commit Transaction DelContract

finish:
Return(@error)
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[job_Cleanup_DB]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[job_Cleanup_DB]
GO
SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO
CREATE    Procedure dbo.job_Cleanup_DB
AS
/*
	Created by Zaur Nuraliev
	Description: this procedure is remove information from base tables with actionID = 3
*/
	-------------------------------------------------
	set nocount on
	-------------------------------------------------
	declare @error int		set @error = -1

	Begin Transaction DB_Cleanup

		--IRPoint
		delete IRPoint where actionID = 3
  			if @@error <> 0 begin set @error = 3 if @@TranCount > 0 Rollback Transaction DB_Cleanup goto finish end

		--IRCurve
		delete IRPoint where curveID in (select curveID from IRCurve where actionID = 3)
  			if @@error <> 0 begin set @error = 3 if @@TranCount > 0 Rollback Transaction DB_Cleanup goto finish end
		delete IRCurve where actionID = 3
  			if @@error <> 0 begin set @error = 3 if @@TranCount > 0 Rollback Transaction DB_Cleanup goto finish end

		--ContractInGroup
		delete ContractInGroup where actionID = 3
  			if @@error <> 0 begin set @error = 3 if @@TranCount > 0 Rollback Transaction DB_Cleanup goto finish end

		--ContractGroup
		delete ContractInGroup where groupID in (select groupID from ContractGroup where actionID = 3)
  			if @@error <> 0 begin set @error = 3 if @@TranCount > 0 Rollback Transaction DB_Cleanup goto finish end
		delete ContractGroup where actionID = 3
  			if @@error <> 0 begin set @error = 3 if @@TranCount > 0 Rollback Transaction DB_Cleanup goto finish end

		--IndexDefinition
		delete IndexDefinition where actionID = 3
  			if @@error <> 0 begin set @error = 3 if @@TranCount > 0 Rollback Transaction DB_Cleanup goto finish end

		--ExchangeHoliday
		delete ExchangeHoliday where actionID = 3
  			if @@error <> 0 begin set @error = 3 if @@TranCount > 0 Rollback Transaction DB_Cleanup goto finish end

		--Holiday
		delete ExchangeHoliday where holidayID in (select holidayID from Holiday where actionID = 3)
  			if @@error <> 0 begin set @error = 3 if @@TranCount > 0 Rollback Transaction DB_Cleanup goto finish end
		delete Holiday where actionID = 3
  			if @@error <> 0 begin set @error = 3 if @@TranCount > 0 Rollback Transaction DB_Cleanup goto finish end

		--Strategy
		delete Strategy 
			where actionID = 3 and strategyID not in 
				(select distinct strategyID from Trade where strategyID is not null)
			if @@error <> 0 begin set @error = 3 if @@TranCount > 0 Rollback Transaction DB_Cleanup goto finish end

		--TraderContract
		delete TraderContract where actionID = 3
  			if @@error <> 0 begin set @error = 3 if @@TranCount > 0 Rollback Transaction DB_Cleanup goto finish end

		--RMScenario
		delete RMScenario where actionID = 3
  			if @@error <> 0 begin set @error = 3 if @@TranCount > 0 Rollback Transaction DB_Cleanup goto finish end

		--CustomStrikeSkewPoint
		delete from CustomStrikeSkewPoint where actionID = 3
  			if @@error <> 0 begin set @error = 3 if @@TranCount > 0 Rollback Transaction DB_Cleanup goto finish end

		--VolaSurfaceData
		delete VolaSurfaceData where actionID = 3
  			if @@error <> 0 begin set @error = 3 if @@TranCount > 0 Rollback Transaction DB_Cleanup goto finish end

		--VolaSurfaceData
		delete CustomStrikeSkewPoint 
			where volaSurfaceDataID in (select volaSurfaceDataID from VolaSurfaceData where actionID = 3)
			if @@error <> 0 begin set @error = 3 if @@TranCount > 0 Rollback Transaction DB_Cleanup goto finish end

		--don't forget about TraderRole

		--TraderContract 
		delete from TraderContract 
			where traderID in 
				(select traderID from Trader where actionID = 3 and traderID not in (select distinct traderID from Trade where traderID is not null))
			or traderID in 
				(select traderRefID from Trader where actionID = 3 and traderRefID not in (select distinct traderID from Trade where traderID is not null))
		if @@error <> 0 begin set @error = 3 if @@TranCount > 0 Rollback Transaction DB_Cleanup goto finish end

		--Trader
		delete Trader 
			where traderRefID in 
				(select traderID from Trader where actionID = 3 and traderID not in (select distinct traderID from Trade where traderID is not null))
			if @@error <> 0 begin set @error = 3 if @@TranCount > 0 Rollback Transaction DB_Cleanup goto finish end

		delete Trader where traderID not in (select distinct traderID from Trade) and actionID =3
  			if @@error <> 0 begin set @error = 3 if @@TranCount > 0 Rollback Transaction DB_Cleanup goto finish end

		--Commission
		delete Commission
			where actionID = 3 and 
				commissionID not in (select distinct brokerCommissionID from Trade where brokerCommissionID is not null) and 
				commissionID not in (select distinct clearingBrokerCommissionID from Trade where clearingBrokerCommissionID is not null)
			if @@error <> 0 begin set @error = 3 if @@TranCount > 0 Rollback Transaction DB_Cleanup goto finish end
		delete Commission
			where brokerID in 
					(select brokerID from Broker
						where actionID = 3 and 
							brokerID not in (select distinct clearingBrokerID from Trade where clearingBrokerID is not null) and 
							brokerID not in (select distinct brokerID from Trade where brokerID is not null))
 			if @@error <> 0 begin set @error = 3 if @@TranCount > 0 Rollback Transaction DB_Cleanup goto finish end

		--Broker
		delete Broker 
			where actionID = 3 and 
				brokerID not in (select distinct clearingBrokerID from Trade where clearingBrokerID is not null) and 
				brokerID not in (select distinct brokerID from Trade where brokerID is not null)
  			if @@error <> 0 begin set @error = 3 if @@TranCount > 0 Rollback Transaction DB_Cleanup goto finish end
	
		--BookRuleItemMask
		delete BookRuleItemMask 
			where bookRuleItemID in (select bookRuleItemID from BookRuleItem where bookID in 
					(select bookID 
						from Book 
							where actionID = 3 and bookID not in (select distinct bookID from Trade where bookID is not null)))
  			if @@error <> 0 begin set @error = 3 if @@TranCount > 0 Rollback Transaction DB_Cleanup goto finish end

		--BookRuleItem
		delete BookRuleItem
			where bookID in 
					(select bookID 
						from Book 
							where actionID = 3 and bookID not in (select distinct bookID from Trade where bookID is not null))
  			if @@error <> 0 begin set @error = 3 if @@TranCount > 0 Rollback Transaction DB_Cleanup goto finish end

		--Book
		delete Book
			where actionID = 3 and bookID not in (select distinct bookID from Trade where bookID is not null)
			if @@error <> 0 begin set @error = 3 if @@TranCount > 0 Rollback Transaction DB_Cleanup goto finish end

		--=========================================================================================================
		--INDEX
		if object_id('tempdb..#IDs') is null
			Create table #IDs(contractID int not null)
		else
			Delete from #IDs
		if @@error <> 0 begin set @error = 3 if @@TranCount > 0 Rollback Transaction DB_Cleanup goto finish end

		--select indices for deletion (which not releated with Trades)
		insert into #IDs
			select indexID from [Index] 
				where actionID = 3 
						and indexID not in (select distinct contractID from Trade T join [Index] I on T.contractID = I.indexID)
						and indexID not in (select indexID from [Index] I 
										join [Option] O on I.indexID = O.underlyingContractID
										join Trade T on T.contractID = O.optionID)
 			if @@error <> 0 begin set @error = 3 if @@TranCount > 0 Rollback Transaction DB_Cleanup goto finish end

		--IndexCorrelation
		delete from IndexCorrelation 
			where indexID1 in (select contractID from #IDs) or indexID2 in (select contractID from #IDs)
  			if @@error <> 0 begin set @error = 3 if @@TranCount > 0 Rollback Transaction DB_Cleanup goto finish end

		--IndexDataHistory
		delete from IndexDataHistory where indexID in (select contractID from #IDs)  			if @@error <> 0 begin set @error = 3 if @@TranCount > 0 Rollback Transaction DB_Cleanup goto finish end
		--IndexDefinition
		delete from IndexDefinition where indexID in (select contractID from #IDs)
  			if @@error <> 0 begin set @error = 3 if @@TranCount > 0 Rollback Transaction DB_Cleanup goto finish end

		--delete all related rows in Contract table by indexID
		if object_ID('tempdb..#Contracts_for_delete') is null
			Create table #Contracts_for_delete(contractID int)
		else
			Delete from #Contracts_for_delete
		if @@error <> 0 begin set @error = 3 if @@TranCount > 0 Rollback Transaction DB_Cleanup goto finish end

		insert into #Contracts_for_delete
			select contractID from #IDs 
		if @@error <> 0 begin set @error = 3 if @@TranCount > 0 Rollback Transaction DB_Cleanup goto finish end

		exec usp_Contract_Del Null,1
			if @@error <> 0 begin set @error = 3 if @@TranCount > 0 Rollback Transaction DB_Cleanup goto finish end

		--Index
		delete from [Index] where indexID in (select contractID from #IDs)
  			if @@error <> 0 begin set @error = 3 if @@TranCount > 0 Rollback Transaction DB_Cleanup goto finish end

		--Contract
		delete from Contract where contractID in (select contractID from #IDs)
  			if @@error <> 0 begin set @error = 3 if @@TranCount > 0 Rollback Transaction DB_Cleanup goto finish end

		if object_id('tempdb..#IDs') is not null
			Drop table #IDs
		if @@error <> 0 begin set @error = 3 if @@TranCount > 0 Rollback Transaction DB_Cleanup goto finish end

		--=====================================================================================================================
		--STOCK
		delete StockDataHistory 
			where stockID in (select stockID from Stock where actionID = 3 and stockID not in (select distinct ContractID from Trade))
  			if @@error <> 0 begin set @error = 3 if @@TranCount > 0 Rollback Transaction DB_Cleanup goto finish end

		delete StockCorrelation 
			where stockID1 in (select stockID from Stock where actionID = 3 and stockID not in (select distinct ContractID from Trade))
  			if @@error <> 0 begin set @error = 3 if @@TranCount > 0 Rollback Transaction DB_Cleanup goto finish end

		delete StockCorrelation 
			where stockID2 in (select stockID from Stock where actionID = 3 and stockID not in (select distinct ContractID from Trade))
  			if @@error <> 0 begin set @error = 3 if @@TranCount > 0 Rollback Transaction DB_Cleanup goto finish end

		delete IndexDefinition 
			where stockID in (select stockID from Stock where actionID = 3 and stockID not in (select distinct ContractID from Trade))
  			if @@error <> 0 begin set @error = 3 if @@TranCount > 0 Rollback Transaction DB_Cleanup goto finish end

		if object_ID('tempdb..#Contracts_for_delete') is not null
			delete from #Contracts_for_delete
  			if @@error <> 0 begin set @error = 3 if @@TranCount > 0 Rollback Transaction DB_Cleanup goto finish end

		insert into #Contracts_for_delete
			select stockID from Stock where actionID = 3 and stockID not in (select distinct ContractID from Trade)
			if @@error <> 0 begin set @error = 3 if @@TranCount > 0 Rollback Transaction DB_Cleanup goto finish end

		exec usp_Contract_Del Null,1
  			if @@error <> 0 begin set @error = 3 if @@TranCount > 0 Rollback Transaction DB_Cleanup goto finish end

		delete from Stock where stockID in (select contractID from #Contracts_for_delete)
  			if @@error <> 0 begin set @error = 3 if @@TranCount > 0 Rollback Transaction DB_Cleanup goto finish end

		delete from Contract where contractID in (select contractID from #Contracts_for_delete)
  			if @@error <> 0 begin set @error = 3 if @@TranCount > 0 Rollback Transaction DB_Cleanup goto finish end
		--=====================================================================================================================
		--OPTION

		if object_ID('tempdb..#Options_for_delete') is null
			create table #Options_for_delete(OptionID int)
		else
			delete from #Options_for_delete
		if @@error <> 0 begin set @error = 3 if @@TranCount > 0 Rollback Transaction DB_Cleanup goto finish end

		insert into #Options_for_delete 
			select optionID 
				from [Option] O
				where optionID not in (select distinct ContractID from Trade) and actionID = 3
		if @@error <> 0 begin set @error = 3 if @@TranCount > 0 Rollback Transaction DB_Cleanup goto finish end

		exec usp_Option_Del null,1
  			if @@error <> 0 begin set @error = 3 if @@TranCount > 0 Rollback Transaction DB_Cleanup goto finish end
		--=====================================================================================================================

		--fix DB cleanup date	
		--update DataInfo set keyValue = GetDate() where dataInfoID = 6

		update DataInfo set keyValue = convert(varchar, GetDate(), 120) where dataInfoID = 6
		if @@ROWCOUNT = 0 
			begin 
				insert into DataInfo 
				    select 6,'lastCleanupDate',convert(varchar, GetDate(), 120)
	  			if @@error <> 0 begin set @error = 3 if @@TranCount > 0 Rollback Transaction DB_Cleanup goto finish end
			end 
	Commit Transaction
    set @error = 0
finish:
Return(@error)

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO
--===================================================================================
--change DB version
--===================================================================================
if not exists(select * from DataInfo where DataInfoID = 1 and keyValue = '3.37.024')
	begin
		update DataInfo set keyValue = '3.37.024' where dataInfoID = 1
		print 'DB VERSION WAS CHANGED TO 3.37.024'
	end

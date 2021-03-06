// Machine generated IDispatch wrapper class(es) created by Microsoft Visual C++

// NOTE: Do not modify the contents of this file.  If this class is regenerated by
//  Microsoft Visual C++, your modifications will be overwritten.


#include "stdafx.h"
#include "plotarea.h"

// Dispatch interfaces referenced by this interface
#include "Interior.h"
#include "DerivedLong.h"


/////////////////////////////////////////////////////////////////////////////
// CPlotArea properties

BOOL CPlotArea::GetIsBoxed()
{
	BOOL result;
	GetProperty(0x1, VT_BOOL, (void*)&result);
	return result;
}

void CPlotArea::SetIsBoxed(BOOL propVal)
{
	SetProperty(0x1, VT_BOOL, propVal);
}

CInterior CPlotArea::GetInterior()
{
	LPDISPATCH pDispatch;
	GetProperty(0x2, VT_DISPATCH, (void*)&pDispatch);
	return CInterior(pDispatch);
}

CDerivedLong CPlotArea::GetTop()
{
	LPDISPATCH pDispatch;
	GetProperty(0x3, VT_DISPATCH, (void*)&pDispatch);
	return CDerivedLong(pDispatch);
}

CDerivedLong CPlotArea::GetBottom()
{
	LPDISPATCH pDispatch;
	GetProperty(0x4, VT_DISPATCH, (void*)&pDispatch);
	return CDerivedLong(pDispatch);
}

CDerivedLong CPlotArea::GetLeft()
{
	LPDISPATCH pDispatch;
	GetProperty(0x5, VT_DISPATCH, (void*)&pDispatch);
	return CDerivedLong(pDispatch);
}

CDerivedLong CPlotArea::GetRight()
{
	LPDISPATCH pDispatch;
	GetProperty(0x6, VT_DISPATCH, (void*)&pDispatch);
	return CDerivedLong(pDispatch);
}

LPDISPATCH CPlotArea::GetParent()
{
	LPDISPATCH result;
	GetProperty(0x7, VT_DISPATCH, (void*)&result);
	return result;
}

/////////////////////////////////////////////////////////////////////////////
// CPlotArea operations

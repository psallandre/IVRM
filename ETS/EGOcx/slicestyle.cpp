// Machine generated IDispatch wrapper class(es) created by Microsoft Visual C++

// NOTE: Do not modify the contents of this file.  If this class is regenerated by
//  Microsoft Visual C++, your modifications will be overwritten.


#include "stdafx.h"
#include "slicestyle.h"

// Dispatch interfaces referenced by this interface
#include "deriveddouble.h"


/////////////////////////////////////////////////////////////////////////////
// CSliceStyle properties

CDerivedDouble CSliceStyle::GetOffset()
{
	LPDISPATCH pDispatch;
	GetProperty(0x1, VT_DISPATCH, (void*)&pDispatch);
	return CDerivedDouble(pDispatch);
}

LPDISPATCH CSliceStyle::GetParent()
{
	LPDISPATCH result;
	GetProperty(0x2, VT_DISPATCH, (void*)&result);
	return result;
}

short CSliceStyle::GetDisplay()
{
	short result;
	GetProperty(0x3, VT_I2, (void*)&result);
	return result;
}

void CSliceStyle::SetDisplay(short propVal)
{
	SetProperty(0x3, VT_I2, propVal);
}

/////////////////////////////////////////////////////////////////////////////
// CSliceStyle operations
// Machine generated IDispatch wrapper class(es) created by Microsoft Visual C++

// NOTE: Do not modify the contents of this file.  If this class is regenerated by
//  Microsoft Visual C++, your modifications will be overwritten.


#include "stdafx.h"
#include "deriveddouble.h"


/////////////////////////////////////////////////////////////////////////////
// CDerivedDouble properties

double CDerivedDouble::GetValue()
{
	double result;
	GetProperty(0x1, VT_R8, (void*)&result);
	return result;
}

void CDerivedDouble::SetValue(double propVal)
{
	SetProperty(0x1, VT_R8, propVal);
}

BOOL CDerivedDouble::GetIsDefault()
{
	BOOL result;
	GetProperty(0x2, VT_BOOL, (void*)&result);
	return result;
}

void CDerivedDouble::SetIsDefault(BOOL propVal)
{
	SetProperty(0x2, VT_BOOL, propVal);
}

LPDISPATCH CDerivedDouble::GetParent()
{
	LPDISPATCH result;
	GetProperty(0x3, VT_DISPATCH, (void*)&result);
	return result;
}

/////////////////////////////////////////////////////////////////////////////
// CDerivedDouble operations

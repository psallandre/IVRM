// Machine generated IDispatch wrapper class(es) created by Microsoft Visual C++

// NOTE: Do not modify the contents of this file.  If this class is regenerated by
//  Microsoft Visual C++, your modifications will be overwritten.


#include "stdafx.h"
#include "chart2ddatacoordresult.h"


/////////////////////////////////////////////////////////////////////////////
// CChart2DDataCoordResult properties

long CChart2DDataCoordResult::GetRegion()
{
	long result;
	GetProperty(0x1, VT_I4, (void*)&result);
	return result;
}

void CChart2DDataCoordResult::SetRegion(long propVal)
{
	SetProperty(0x1, VT_I4, propVal);
}

double CChart2DDataCoordResult::GetX()
{
	double result;
	GetProperty(0x2, VT_R8, (void*)&result);
	return result;
}

void CChart2DDataCoordResult::SetX(double propVal)
{
	SetProperty(0x2, VT_R8, propVal);
}

double CChart2DDataCoordResult::GetY()
{
	double result;
	GetProperty(0x3, VT_R8, (void*)&result);
	return result;
}

void CChart2DDataCoordResult::SetY(double propVal)
{
	SetProperty(0x3, VT_R8, propVal);
}

/////////////////////////////////////////////////////////////////////////////
// CChart2DDataCoordResult operations
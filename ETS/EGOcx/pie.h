#if !defined(AFX_PIE_H__A3C1FD15_AA70_48A9_8A29_3FAC7DEB1564__INCLUDED_)
#define AFX_PIE_H__A3C1FD15_AA70_48A9_8A29_3FAC7DEB1564__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// Machine generated IDispatch wrapper class(es) created by Microsoft Visual C++

// NOTE: Do not modify the contents of this file.  If this class is regenerated by
//  Microsoft Visual C++, your modifications will be overwritten.


// Dispatch interfaces referenced by this interface
class CLabel;
class CFillStyle;
class CSliceStyle;

/////////////////////////////////////////////////////////////////////////////
// CPie wrapper class

class AFX_EXT_CLASS CPie : public COleDispatchDriver
{
public:
	CPie() {}		// Calls COleDispatchDriver default constructor
	CPie(LPDISPATCH pDispatch) : COleDispatchDriver(pDispatch) {}
	CPie(const CPie& dispatchSrc) : COleDispatchDriver(dispatchSrc) {}

// Attributes
public:
	long GetSortOrder();
	void SetSortOrder(long);
	long GetThresholdMethod();
	void SetThresholdMethod(long);
	long GetMinSlices();
	void SetMinSlices(long);
	CLabel GetOtherLabel();
	double GetThresholdValue();
	void SetThresholdValue(double);
	LPDISPATCH GetParent();
	double GetStartAngle();
	void SetStartAngle(double);
	CFillStyle GetOtherFillStyle();
	CSliceStyle GetOtherSliceStyle();

// Operations
public:
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_PIE_H__A3C1FD15_AA70_48A9_8A29_3FAC7DEB1564__INCLUDED_)

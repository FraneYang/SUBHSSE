// CDriveHoliday.h : 由 Microsoft Visual C++ 创建的 ActiveX 控件包装器类的声明

#pragma once

/////////////////////////////////////////////////////////////////////////////
// CDriveHoliday

class CDriveHoliday : public COleDispatchDriver
{
public:
	CDriveHoliday() {}		// 调用 COleDispatchDriver 默认构造函数
	CDriveHoliday(LPDISPATCH pDispatch) : COleDispatchDriver(pDispatch) {}
	CDriveHoliday(const CDriveHoliday& dispatchSrc) : COleDispatchDriver(dispatchSrc) {}

// 特性
public:

// 操作
public:

	void SetYearly(BOOL bData)
	{
		static BYTE parms[] = VTS_BOOL ;
		InvokeHelper(0x60030000, DISPATCH_METHOD, VT_EMPTY, NULL, parms, bData);
	}
	BOOL GetYearly()
	{
		BOOL result;
		InvokeHelper(0x60030001, DISPATCH_METHOD, VT_BOOL, (void*)&result, NULL);
		return result;
	}
	void SetDate(DATE nDate)
	{
		static BYTE parms[] = VTS_DATE ;
		InvokeHelper(0x60030002, DISPATCH_METHOD, VT_EMPTY, NULL, parms, nDate);
	}
	DATE GetDate()
	{
		DATE result;
		InvokeHelper(0x60030003, DISPATCH_METHOD, VT_DATE, (void*)&result, NULL);
		return result;
	}
	void SetHolLen(long lh)
	{
		static BYTE parms[] = VTS_I4 ;
		InvokeHelper(0x60030004, DISPATCH_METHOD, VT_EMPTY, NULL, parms, lh);
	}
	long GetHolLen()
	{
		long result;
		InvokeHelper(0x60030005, DISPATCH_METHOD, VT_I4, (void*)&result, NULL);
		return result;
	}
	void SetHolNum(short lh)
	{
		static BYTE parms[] = VTS_I2 ;
		InvokeHelper(0x60030006, DISPATCH_METHOD, VT_EMPTY, NULL, parms, lh);
	}
	short GetHolNum()
	{
		short result;
		InvokeHelper(0x60030007, DISPATCH_METHOD, VT_I2, (void*)&result, NULL);
		return result;
	}
	CString ToString()
	{
		CString result;
		InvokeHelper(0x60030008, DISPATCH_METHOD, VT_BSTR, (void*)&result, NULL);
		return result;
	}
	CString toString_Hol()
	{
		CString result;
		InvokeHelper(0x60030009, DISPATCH_METHOD, VT_BSTR, (void*)&result, NULL);
		return result;
	}
	CString toString_FC8800()
	{
		CString result;
		InvokeHelper(0x6003000a, DISPATCH_METHOD, VT_BSTR, (void*)&result, NULL);
		return result;
	}
	void SetHolHex_FC8800(LPCTSTR sHex)
	{
		static BYTE parms[] = VTS_BSTR ;
		InvokeHelper(0x6003000b, DISPATCH_METHOD, VT_EMPTY, NULL, parms, sHex);
	}


};

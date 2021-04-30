// CDrivePassword.h : 由 Microsoft Visual C++ 创建的 ActiveX 控件包装器类的声明

#pragma once

/////////////////////////////////////////////////////////////////////////////
// CDrivePassword

class CDrivePassword : public COleDispatchDriver
{
public:
	CDrivePassword() {}		// 调用 COleDispatchDriver 默认构造函数
	CDrivePassword(LPDISPATCH pDispatch) : COleDispatchDriver(pDispatch) {}
	CDrivePassword(const CDrivePassword& dispatchSrc) : COleDispatchDriver(dispatchSrc) {}

// 特性
public:

// 操作
public:

	BOOL get_ClickButton()
	{
		BOOL result;
		InvokeHelper(0x68030000, DISPATCH_PROPERTYGET, VT_BOOL, (void*)&result, NULL);
		return result;
	}
	void put_ClickButton(BOOL newValue)
	{
		static BYTE parms[] = VTS_BOOL ;
		InvokeHelper(0x68030000, DISPATCH_PROPERTYPUT, VT_EMPTY, NULL, parms, newValue);
	}
	void SetPassword(LPCTSTR vNew)
	{
		static BYTE parms[] = VTS_BSTR ;
		InvokeHelper(0x60030002, DISPATCH_METHOD, VT_EMPTY, NULL, parms, vNew);
	}
	CString GetPassword()
	{
		CString result;
		InvokeHelper(0x60030003, DISPATCH_METHOD, VT_BSTR, (void*)&result, NULL);
		return result;
	}
	long GetPwr(short vDoorNum)
	{
		long result;
		static BYTE parms[] = VTS_I2 ;
		InvokeHelper(0x60030004, DISPATCH_METHOD, VT_I4, (void*)&result, parms, vDoorNum);
		return result;
	}
	void SetPwr(short vDoorNum, long iPwr)
	{
		static BYTE parms[] = VTS_I2 VTS_I4 ;
		InvokeHelper(0x60030005, DISPATCH_METHOD, VT_EMPTY, NULL, parms, vDoorNum, iPwr);
	}
	CString GetPasswordPwrStr()
	{
		CString result;
		InvokeHelper(0x60030006, DISPATCH_METHOD, VT_BSTR, (void*)&result, NULL);
		return result;
	}
	CString ToString()
	{
		CString result;
		InvokeHelper(0x60030007, DISPATCH_METHOD, VT_BSTR, (void*)&result, NULL);
		return result;
	}
	CString toString_FC8800()
	{
		CString result;
		InvokeHelper(0x60030008, DISPATCH_METHOD, VT_BSTR, (void*)&result, NULL);
		return result;
	}
	void SetPasswordHex_FC8800(LPCTSTR sHex)
	{
		static BYTE parms[] = VTS_BSTR ;
		InvokeHelper(0x60030009, DISPATCH_METHOD, VT_EMPTY, NULL, parms, sHex);
	}
	CString toString_FC8832()
	{
		CString result;
		InvokeHelper(0x6003000a, DISPATCH_METHOD, VT_BSTR, (void*)&result, NULL);
		return result;
	}
	void SetPasswordHex_FC8832(LPCTSTR sHex)
	{
		static BYTE parms[] = VTS_BSTR ;
		InvokeHelper(0x6003000b, DISPATCH_METHOD, VT_EMPTY, NULL, parms, sHex);
	}
	CString ToString_FC2816M()
	{
		CString result;
		InvokeHelper(0x6003000c, DISPATCH_METHOD, VT_BSTR, (void*)&result, NULL);
		return result;
	}
	void SetPasswordHex_FC2816M(LPCTSTR sHex)
	{
		static BYTE parms[] = VTS_BSTR ;
		InvokeHelper(0x6003000d, DISPATCH_METHOD, VT_EMPTY, NULL, parms, sHex);
	}
	CString ToString_FC2864()
	{
		CString result;
		InvokeHelper(0x6003000f, DISPATCH_METHOD, VT_BSTR, (void*)&result, NULL);
		return result;
	}
	void SetPasswordHex_FC2864(LPCTSTR sHex)
	{
		static BYTE parms[] = VTS_BSTR ;
		InvokeHelper(0x60030010, DISPATCH_METHOD, VT_EMPTY, NULL, parms, sHex);
	}


};

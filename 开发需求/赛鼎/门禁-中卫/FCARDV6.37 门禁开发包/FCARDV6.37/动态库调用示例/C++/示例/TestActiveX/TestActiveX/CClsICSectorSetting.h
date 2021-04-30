// CClsICSectorSetting.h : 由 Microsoft Visual C++ 创建的 ActiveX 控件包装器类的声明

#pragma once

/////////////////////////////////////////////////////////////////////////////
// CClsICSectorSetting

class CClsICSectorSetting : public CWnd
{
protected:
	DECLARE_DYNCREATE(CClsICSectorSetting)
public:
	CLSID const& GetClsid()
	{
		static CLSID const clsid
			= { 0x5EDC5B27, 0x795F, 0x42D6, { 0xBF, 0x68, 0xF3, 0xD2, 0x6E, 0xD4, 0x15, 0xE0 } };
		return clsid;
	}
	virtual BOOL Create(LPCTSTR lpszClassName, LPCTSTR lpszWindowName, DWORD dwStyle,
						const RECT& rect, CWnd* pParentWnd, UINT nID, 
						CCreateContext* pContext = NULL)
	{ 
		return CreateControl(GetClsid(), lpszWindowName, dwStyle, rect, pParentWnd, nID); 
	}

    BOOL Create(LPCTSTR lpszWindowName, DWORD dwStyle, const RECT& rect, CWnd* pParentWnd, 
				UINT nID, CFile* pPersist = NULL, BOOL bStorage = FALSE,
				BSTR bstrLicKey = NULL)
	{ 
		return CreateControl(GetClsid(), lpszWindowName, dwStyle, rect, pParentWnd, nID,
		pPersist, bStorage, bstrLicKey); 
	}

// 特性
public:

// 操作
public:

	short get_Sector()
	{
		short result;
		InvokeHelper(0x40030000, DISPATCH_PROPERTYGET, VT_I2, (void*)&result, NULL);
		return result;
	}
	void put_Sector(short newValue)
	{
		static BYTE parms[] = VTS_I2 ;
		InvokeHelper(0x40030000, DISPATCH_PROPERTYPUT, VT_EMPTY, NULL, parms, newValue);
	}
	CString get_SectorPassword()
	{
		CString result;
		InvokeHelper(0x40030001, DISPATCH_PROPERTYGET, VT_BSTR, (void*)&result, NULL);
		return result;
	}
	void put_SectorPassword(LPCTSTR newValue)
	{
		static BYTE parms[] = VTS_BSTR ;
		InvokeHelper(0x40030001, DISPATCH_PROPERTYPUT, VT_EMPTY, NULL, parms, newValue);
	}
	unsigned char get_CheckType()
	{
		unsigned char result;
		InvokeHelper(0x40030002, DISPATCH_PROPERTYGET, VT_UI1, (void*)&result, NULL);
		return result;
	}
	void put_CheckType(unsigned char newValue)
	{
		static BYTE parms[] = VTS_UI1 ;
		InvokeHelper(0x40030002, DISPATCH_PROPERTYPUT, VT_EMPTY, NULL, parms, newValue);
	}
	long get_IDCode1()
	{
		long result;
		InvokeHelper(0x40030003, DISPATCH_PROPERTYGET, VT_I4, (void*)&result, NULL);
		return result;
	}
	void put_IDCode1(long newValue)
	{
		static BYTE parms[] = VTS_I4 ;
		InvokeHelper(0x40030003, DISPATCH_PROPERTYPUT, VT_EMPTY, NULL, parms, newValue);
	}
	long get_IDCode2()
	{
		long result;
		InvokeHelper(0x40030004, DISPATCH_PROPERTYGET, VT_I4, (void*)&result, NULL);
		return result;
	}
	void put_IDCode2(long newValue)
	{
		static BYTE parms[] = VTS_I4 ;
		InvokeHelper(0x40030004, DISPATCH_PROPERTYPUT, VT_EMPTY, NULL, parms, newValue);
	}
	long get_IDCode3()
	{
		long result;
		InvokeHelper(0x40030005, DISPATCH_PROPERTYGET, VT_I4, (void*)&result, NULL);
		return result;
	}
	void put_IDCode3(long newValue)
	{
		static BYTE parms[] = VTS_I4 ;
		InvokeHelper(0x40030005, DISPATCH_PROPERTYPUT, VT_EMPTY, NULL, parms, newValue);
	}
	long get_IDCode4()
	{
		long result;
		InvokeHelper(0x40030006, DISPATCH_PROPERTYGET, VT_I4, (void*)&result, NULL);
		return result;
	}
	void put_IDCode4(long newValue)
	{
		static BYTE parms[] = VTS_I4 ;
		InvokeHelper(0x40030006, DISPATCH_PROPERTYPUT, VT_EMPTY, NULL, parms, newValue);
	}
	long get_CardLen()
	{
		long result;
		InvokeHelper(0x40030007, DISPATCH_PROPERTYGET, VT_I4, (void*)&result, NULL);
		return result;
	}
	void put_CardLen(long newValue)
	{
		static BYTE parms[] = VTS_I4 ;
		InvokeHelper(0x40030007, DISPATCH_PROPERTYPUT, VT_EMPTY, NULL, parms, newValue);
	}
	BOOL get_Decrypt()
	{
		BOOL result;
		InvokeHelper(0x40030008, DISPATCH_PROPERTYGET, VT_BOOL, (void*)&result, NULL);
		return result;
	}
	void put_Decrypt(BOOL newValue)
	{
		static BYTE parms[] = VTS_BOOL ;
		InvokeHelper(0x40030008, DISPATCH_PROPERTYPUT, VT_EMPTY, NULL, parms, newValue);
	}
	BOOL get_CardOrderASC()
	{
		BOOL result;
		InvokeHelper(0x40030009, DISPATCH_PROPERTYGET, VT_BOOL, (void*)&result, NULL);
		return result;
	}
	void put_CardOrderASC(BOOL newValue)
	{
		static BYTE parms[] = VTS_BOOL ;
		InvokeHelper(0x40030009, DISPATCH_PROPERTYPUT, VT_EMPTY, NULL, parms, newValue);
	}
	CString ToHexString()
	{
		CString result;
		InvokeHelper(0x60030000, DISPATCH_METHOD, VT_BSTR, (void*)&result, NULL);
		return result;
	}
	void SetHex(LPCTSTR sHex)
	{
		static BYTE parms[] = VTS_BSTR ;
		InvokeHelper(0x60030001, DISPATCH_METHOD, VT_EMPTY, NULL, parms, sHex);
	}
	CString ToHexString_2816M()
	{
		CString result;
		InvokeHelper(0x60030002, DISPATCH_METHOD, VT_BSTR, (void*)&result, NULL);
		return result;
	}
	void SetHex_2816M(LPCTSTR sHex)
	{
		static BYTE parms[] = VTS_BSTR ;
		InvokeHelper(0x60030003, DISPATCH_METHOD, VT_EMPTY, NULL, parms, sHex);
	}

};

// CDriveTCPInfo.h : 由 Microsoft Visual C++ 创建的 ActiveX 控件包装器类的声明

#pragma once

/////////////////////////////////////////////////////////////////////////////
// CDriveTCPInfo

class CDriveTCPInfo : public COleDispatchDriver
{
public:
	CDriveTCPInfo() {}		// 调用 COleDispatchDriver 默认构造函数
	CDriveTCPInfo(LPDISPATCH pDispatch) : COleDispatchDriver(pDispatch) {}
	CDriveTCPInfo(const CDriveTCPInfo& dispatchSrc) : COleDispatchDriver(dispatchSrc) {}

// 特性
public:

// 操作
public:

	void SetEquptType(long * lEquptType)
	{
		static BYTE parms[] = VTS_PI4 ;
		InvokeHelper(0x6003000d, DISPATCH_METHOD, VT_EMPTY, NULL, parms, lEquptType);
	}
	CString get_MAC()
	{
		CString result;
		InvokeHelper(0x6803000c, DISPATCH_PROPERTYGET, VT_BSTR, (void*)&result, NULL);
		return result;
	}
	void put_MAC(LPCTSTR newValue)
	{
		static BYTE parms[] = VTS_BSTR ;
		InvokeHelper(0x6803000c, DISPATCH_PROPERTYPUT, VT_EMPTY, NULL, parms, newValue);
	}
	BOOL get_AutoIP()
	{
		BOOL result;
		InvokeHelper(0x6803000b, DISPATCH_PROPERTYGET, VT_BOOL, (void*)&result, NULL);
		return result;
	}
	void put_AutoIP(BOOL newValue)
	{
		static BYTE parms[] = VTS_BOOL ;
		InvokeHelper(0x6803000b, DISPATCH_PROPERTYPUT, VT_EMPTY, NULL, parms, newValue);
	}
	CString get_IP()
	{
		CString result;
		InvokeHelper(0x6803000a, DISPATCH_PROPERTYGET, VT_BSTR, (void*)&result, NULL);
		return result;
	}
	void put_IP(LPCTSTR newValue)
	{
		static BYTE parms[] = VTS_BSTR ;
		InvokeHelper(0x6803000a, DISPATCH_PROPERTYPUT, VT_EMPTY, NULL, parms, newValue);
	}
	CString get_IPMask()
	{
		CString result;
		InvokeHelper(0x68030009, DISPATCH_PROPERTYGET, VT_BSTR, (void*)&result, NULL);
		return result;
	}
	void put_IPMask(LPCTSTR newValue)
	{
		static BYTE parms[] = VTS_BSTR ;
		InvokeHelper(0x68030009, DISPATCH_PROPERTYPUT, VT_EMPTY, NULL, parms, newValue);
	}
	CString get_IPGateway()
	{
		CString result;
		InvokeHelper(0x68030008, DISPATCH_PROPERTYGET, VT_BSTR, (void*)&result, NULL);
		return result;
	}
	void put_IPGateway(LPCTSTR newValue)
	{
		static BYTE parms[] = VTS_BSTR ;
		InvokeHelper(0x68030008, DISPATCH_PROPERTYPUT, VT_EMPTY, NULL, parms, newValue);
	}
	CString get_DNS()
	{
		CString result;
		InvokeHelper(0x68030007, DISPATCH_PROPERTYGET, VT_BSTR, (void*)&result, NULL);
		return result;
	}
	void put_DNS(LPCTSTR newValue)
	{
		static BYTE parms[] = VTS_BSTR ;
		InvokeHelper(0x68030007, DISPATCH_PROPERTYPUT, VT_EMPTY, NULL, parms, newValue);
	}
	CString get_DNSBuckup()
	{
		CString result;
		InvokeHelper(0x68030006, DISPATCH_PROPERTYGET, VT_BSTR, (void*)&result, NULL);
		return result;
	}
	void put_DNSBuckup(LPCTSTR newValue)
	{
		static BYTE parms[] = VTS_BSTR ;
		InvokeHelper(0x68030006, DISPATCH_PROPERTYPUT, VT_EMPTY, NULL, parms, newValue);
	}
	long get_IPMode()
	{
		long result;
		InvokeHelper(0x68030005, DISPATCH_PROPERTYGET, VT_I4, (void*)&result, NULL);
		return result;
	}
	void put_IPMode(long newValue)
	{
		static BYTE parms[] = VTS_I4 ;
		InvokeHelper(0x68030005, DISPATCH_PROPERTYPUT, VT_EMPTY, NULL, parms, newValue);
	}
	long get_TCPPort()
	{
		long result;
		InvokeHelper(0x68030004, DISPATCH_PROPERTYGET, VT_I4, (void*)&result, NULL);
		return result;
	}
	void put_TCPPort(long newValue)
	{
		static BYTE parms[] = VTS_I4 ;
		InvokeHelper(0x68030004, DISPATCH_PROPERTYPUT, VT_EMPTY, NULL, parms, newValue);
	}
	long get_UDPPort()
	{
		long result;
		InvokeHelper(0x68030003, DISPATCH_PROPERTYGET, VT_I4, (void*)&result, NULL);
		return result;
	}
	void put_UDPPort(long newValue)
	{
		static BYTE parms[] = VTS_I4 ;
		InvokeHelper(0x68030003, DISPATCH_PROPERTYPUT, VT_EMPTY, NULL, parms, newValue);
	}
	long get_TCPServerPort()
	{
		long result;
		InvokeHelper(0x68030002, DISPATCH_PROPERTYGET, VT_I4, (void*)&result, NULL);
		return result;
	}
	void put_TCPServerPort(long newValue)
	{
		static BYTE parms[] = VTS_I4 ;
		InvokeHelper(0x68030002, DISPATCH_PROPERTYPUT, VT_EMPTY, NULL, parms, newValue);
	}
	CString get_TCPServerIP()
	{
		CString result;
		InvokeHelper(0x68030001, DISPATCH_PROPERTYGET, VT_BSTR, (void*)&result, NULL);
		return result;
	}
	void put_TCPServerIP(LPCTSTR newValue)
	{
		static BYTE parms[] = VTS_BSTR ;
		InvokeHelper(0x68030001, DISPATCH_PROPERTYPUT, VT_EMPTY, NULL, parms, newValue);
	}
	CString get_TCPServerAddr()
	{
		CString result;
		InvokeHelper(0x68030000, DISPATCH_PROPERTYGET, VT_BSTR, (void*)&result, NULL);
		return result;
	}
	void put_TCPServerAddr(LPCTSTR newValue)
	{
		static BYTE parms[] = VTS_BSTR ;
		InvokeHelper(0x68030000, DISPATCH_PROPERTYPUT, VT_EMPTY, NULL, parms, newValue);
	}
	VARIANT ToHexString()
	{
		VARIANT result;
		InvokeHelper(0x6003000f, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
		return result;
	}
	VARIANT SetTCPParHexString(LPCTSTR sPar)
	{
		VARIANT result;
		static BYTE parms[] = VTS_BSTR ;
		InvokeHelper(0x60030010, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms, sPar);
		return result;
	}


};

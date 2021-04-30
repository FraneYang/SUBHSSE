// CDriveInfo.h : 由 Microsoft Visual C++ 创建的 ActiveX 控件包装器类的声明

#pragma once

/////////////////////////////////////////////////////////////////////////////
// CDriveInfo

class CDriveInfo : public COleDispatchDriver
{
public:
	CDriveInfo() {}		// 调用 COleDispatchDriver 默认构造函数
	CDriveInfo(LPDISPATCH pDispatch) : COleDispatchDriver(pDispatch) {}
	CDriveInfo(const CDriveInfo& dispatchSrc) : COleDispatchDriver(dispatchSrc) {}

// 特性
public:

// 操作
public:

	long get_SocketHandle()
	{
		long result;
		InvokeHelper(0x4003003e, DISPATCH_PROPERTYGET, VT_I4, (void*)&result, NULL);
		return result;
	}
	void put_SocketHandle(long newValue)
	{
		static BYTE parms[] = VTS_I4 ;
		InvokeHelper(0x4003003e, DISPATCH_PROPERTYPUT, VT_EMPTY, NULL, parms, newValue);
	}
	long get_BeginTimeSec()
	{
		long result;
		InvokeHelper(0x6803002d, DISPATCH_PROPERTYGET, VT_I4, (void*)&result, NULL);
		return result;
	}
	void put_BeginTimeSec(long newValue)
	{
		static BYTE parms[] = VTS_I4 ;
		InvokeHelper(0x6803002d, DISPATCH_PROPERTYPUT, VT_EMPTY, NULL, parms, newValue);
	}
	long get_EndTimeSec()
	{
		long result;
		InvokeHelper(0x6803002c, DISPATCH_PROPERTYGET, VT_I4, (void*)&result, NULL);
		return result;
	}
	void put_EndTimeSec(long newValue)
	{
		static BYTE parms[] = VTS_I4 ;
		InvokeHelper(0x6803002c, DISPATCH_PROPERTYPUT, VT_EMPTY, NULL, parms, newValue);
	}
	DATE get_BeginTime()
	{
		DATE result;
		InvokeHelper(0x6803002b, DISPATCH_PROPERTYGET, VT_DATE, (void*)&result, NULL);
		return result;
	}
	void put_BeginTime(DATE newValue)
	{
		static BYTE parms[] = VTS_DATE ;
		InvokeHelper(0x6803002b, DISPATCH_PROPERTYPUT, VT_EMPTY, NULL, parms, newValue);
	}
	long get_ConnType()
	{
		long result;
		InvokeHelper(0x6803002a, DISPATCH_PROPERTYGET, VT_I4, (void*)&result, NULL);
		return result;
	}
	void put_ConnType(long newValue)
	{
		static BYTE parms[] = VTS_I4 ;
		InvokeHelper(0x6803002a, DISPATCH_PROPERTYPUT, VT_EMPTY, NULL, parms, newValue);
	}
	CString get_IP()
	{
		CString result;
		InvokeHelper(0x68030029, DISPATCH_PROPERTYGET, VT_BSTR, (void*)&result, NULL);
		return result;
	}
	void put_IP(LPCTSTR newValue)
	{
		static BYTE parms[] = VTS_BSTR ;
		InvokeHelper(0x68030029, DISPATCH_PROPERTYPUT, VT_EMPTY, NULL, parms, newValue);
	}
	long get_NetPort()
	{
		long result;
		InvokeHelper(0x68030028, DISPATCH_PROPERTYGET, VT_I4, (void*)&result, NULL);
		return result;
	}
	void put_NetPort(long newValue)
	{
		static BYTE parms[] = VTS_I4 ;
		InvokeHelper(0x68030028, DISPATCH_PROPERTYPUT, VT_EMPTY, NULL, parms, newValue);
	}
	CString get_LocalIP()
	{
		CString result;
		InvokeHelper(0x68030031, DISPATCH_PROPERTYGET, VT_BSTR, (void*)&result, NULL);
		return result;
	}
	void put_LocalIP(LPCTSTR newValue)
	{
		static BYTE parms[] = VTS_BSTR ;
		InvokeHelper(0x68030031, DISPATCH_PROPERTYPUT, VT_EMPTY, NULL, parms, newValue);
	}
	long get_LocalNetPort()
	{
		long result;
		InvokeHelper(0x68030030, DISPATCH_PROPERTYGET, VT_I4, (void*)&result, NULL);
		return result;
	}
	void put_LocalNetPort(long newValue)
	{
		static BYTE parms[] = VTS_I4 ;
		InvokeHelper(0x68030030, DISPATCH_PROPERTYPUT, VT_EMPTY, NULL, parms, newValue);
	}
	short get_CommPort()
	{
		short result;
		InvokeHelper(0x68030027, DISPATCH_PROPERTYGET, VT_I2, (void*)&result, NULL);
		return result;
	}
	void put_CommPort(short newValue)
	{
		static BYTE parms[] = VTS_I2 ;
		InvokeHelper(0x68030027, DISPATCH_PROPERTYPUT, VT_EMPTY, NULL, parms, newValue);
	}
	long get_CommBaudrate()
	{
		long result;
		InvokeHelper(0x68030026, DISPATCH_PROPERTYGET, VT_I4, (void*)&result, NULL);
		return result;
	}
	void put_CommBaudrate(long newValue)
	{
		static BYTE parms[] = VTS_I4 ;
		InvokeHelper(0x68030026, DISPATCH_PROPERTYPUT, VT_EMPTY, NULL, parms, newValue);
	}
	long get_EquptType()
	{
		long result;
		InvokeHelper(0x68030025, DISPATCH_PROPERTYGET, VT_I4, (void*)&result, NULL);
		return result;
	}
	void put_EquptType(long newValue)
	{
		static BYTE parms[] = VTS_I4 ;
		InvokeHelper(0x68030025, DISPATCH_PROPERTYPUT, VT_EMPTY, NULL, parms, newValue);
	}
	long get_EquptAddr()
	{
		long result;
		InvokeHelper(0x68030024, DISPATCH_PROPERTYGET, VT_I4, (void*)&result, NULL);
		return result;
	}
	void put_EquptAddr(long newValue)
	{
		static BYTE parms[] = VTS_I4 ;
		InvokeHelper(0x68030024, DISPATCH_PROPERTYPUT, VT_EMPTY, NULL, parms, newValue);
	}
	CString get_SNHex()
	{
		CString result;
		InvokeHelper(0x68030023, DISPATCH_PROPERTYGET, VT_BSTR, (void*)&result, NULL);
		return result;
	}
	void put_SNHex(LPCTSTR newValue)
	{
		static BYTE parms[] = VTS_BSTR ;
		InvokeHelper(0x68030023, DISPATCH_PROPERTYPUT, VT_EMPTY, NULL, parms, newValue);
	}
	BOOL get_SNIsHex()
	{
		BOOL result;
		InvokeHelper(0x68030022, DISPATCH_PROPERTYGET, VT_BOOL, (void*)&result, NULL);
		return result;
	}
	void put_SNIsHex(BOOL newValue)
	{
		static BYTE parms[] = VTS_BOOL ;
		InvokeHelper(0x68030022, DISPATCH_PROPERTYPUT, VT_EMPTY, NULL, parms, newValue);
	}
	CString get_SN()
	{
		CString result;
		InvokeHelper(0x68030021, DISPATCH_PROPERTYGET, VT_BSTR, (void*)&result, NULL);
		return result;
	}
	void put_SN(LPCTSTR newValue)
	{
		static BYTE parms[] = VTS_BSTR ;
		InvokeHelper(0x68030021, DISPATCH_PROPERTYPUT, VT_EMPTY, NULL, parms, newValue);
	}
	CString get_Password()
	{
		CString result;
		InvokeHelper(0x68030020, DISPATCH_PROPERTYGET, VT_BSTR, (void*)&result, NULL);
		return result;
	}
	void put_Password(LPCTSTR newValue)
	{
		static BYTE parms[] = VTS_BSTR ;
		InvokeHelper(0x68030020, DISPATCH_PROPERTYPUT, VT_EMPTY, NULL, parms, newValue);
	}
	long get_ID()
	{
		long result;
		InvokeHelper(0x6803001f, DISPATCH_PROPERTYGET, VT_I4, (void*)&result, NULL);
		return result;
	}
	void put_ID(long newValue)
	{
		static BYTE parms[] = VTS_I4 ;
		InvokeHelper(0x6803001f, DISPATCH_PROPERTYPUT, VT_EMPTY, NULL, parms, newValue);
	}
	CString get_Name()
	{
		CString result;
		InvokeHelper(0x6803001e, DISPATCH_PROPERTYGET, VT_BSTR, (void*)&result, NULL);
		return result;
	}
	void put_Name(LPCTSTR newValue)
	{
		static BYTE parms[] = VTS_BSTR ;
		InvokeHelper(0x6803001e, DISPATCH_PROPERTYPUT, VT_EMPTY, NULL, parms, newValue);
	}
	CString get_Desc()
	{
		CString result;
		InvokeHelper(0x6803001d, DISPATCH_PROPERTYGET, VT_BSTR, (void*)&result, NULL);
		return result;
	}
	void put_Desc(LPCTSTR newValue)
	{
		static BYTE parms[] = VTS_BSTR ;
		InvokeHelper(0x6803001d, DISPATCH_PROPERTYPUT, VT_EMPTY, NULL, parms, newValue);
	}
	long get_ConnectionTimeout()
	{
		long result;
		InvokeHelper(0x6803001c, DISPATCH_PROPERTYGET, VT_I4, (void*)&result, NULL);
		return result;
	}
	void put_ConnectionTimeout(long newValue)
	{
		static BYTE parms[] = VTS_I4 ;
		InvokeHelper(0x6803001c, DISPATCH_PROPERTYPUT, VT_EMPTY, NULL, parms, newValue);
	}
	long get_ConnectionTimeoutCount()
	{
		long result;
		InvokeHelper(0x6803001b, DISPATCH_PROPERTYGET, VT_I4, (void*)&result, NULL);
		return result;
	}
	void put_ConnectionTimeoutCount(long newValue)
	{
		static BYTE parms[] = VTS_I4 ;
		InvokeHelper(0x6803001b, DISPATCH_PROPERTYPUT, VT_EMPTY, NULL, parms, newValue);
	}
	long get_TimeOutMSEL()
	{
		long result;
		InvokeHelper(0x6803001a, DISPATCH_PROPERTYGET, VT_I4, (void*)&result, NULL);
		return result;
	}
	void put_TimeOutMSEL(long newValue)
	{
		static BYTE parms[] = VTS_I4 ;
		InvokeHelper(0x6803001a, DISPATCH_PROPERTYPUT, VT_EMPTY, NULL, parms, newValue);
	}
	long get_RestartCount()
	{
		long result;
		InvokeHelper(0x68030019, DISPATCH_PROPERTYGET, VT_I4, (void*)&result, NULL);
		return result;
	}
	void put_RestartCount(long newValue)
	{
		static BYTE parms[] = VTS_I4 ;
		InvokeHelper(0x68030019, DISPATCH_PROPERTYPUT, VT_EMPTY, NULL, parms, newValue);
	}
	CString get_ErrDescription()
	{
		CString result;
		InvokeHelper(0x68030018, DISPATCH_PROPERTYGET, VT_BSTR, (void*)&result, NULL);
		return result;
	}
	void put_ErrDescription(LPCTSTR newValue)
	{
		static BYTE parms[] = VTS_BSTR ;
		InvokeHelper(0x68030018, DISPATCH_PROPERTYPUT, VT_EMPTY, NULL, parms, newValue);
	}
	long get_ErrNumber()
	{
		long result;
		InvokeHelper(0x68030017, DISPATCH_PROPERTYGET, VT_I4, (void*)&result, NULL);
		return result;
	}
	void put_ErrNumber(long newValue)
	{
		static BYTE parms[] = VTS_I4 ;
		InvokeHelper(0x68030017, DISPATCH_PROPERTYPUT, VT_EMPTY, NULL, parms, newValue);
	}
	BOOL get_CommandEncrypt()
	{
		BOOL result;
		InvokeHelper(0x6803002f, DISPATCH_PROPERTYGET, VT_BOOL, (void*)&result, NULL);
		return result;
	}
	void put_CommandEncrypt(BOOL newValue)
	{
		static BYTE parms[] = VTS_BOOL ;
		InvokeHelper(0x6803002f, DISPATCH_PROPERTYPUT, VT_EMPTY, NULL, parms, newValue);
	}
	LPDISPATCH get_Tag()
	{
		LPDISPATCH result;
		InvokeHelper(0x6803002e, DISPATCH_PROPERTYGET, VT_DISPATCH, (void*)&result, NULL);
		return result;
	}
	void put_Tag(LPDISPATCH newValue)
	{
		static BYTE parms[] = VTS_DISPATCH ;
		InvokeHelper(0x6803002e, DISPATCH_PROPERTYPUT, VT_EMPTY, NULL, parms, newValue);
	}


};

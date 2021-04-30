// CDrivePortList.h : 由 Microsoft Visual C++ 创建的 ActiveX 控件包装器类的声明

#pragma once

/////////////////////////////////////////////////////////////////////////////
// CDrivePortList

class CDrivePortList : public COleDispatchDriver
{
public:
	CDrivePortList() {}		// 调用 COleDispatchDriver 默认构造函数
	CDrivePortList(LPDISPATCH pDispatch) : COleDispatchDriver(pDispatch) {}
	CDrivePortList(const CDrivePortList& dispatchSrc) : COleDispatchDriver(dispatchSrc) {}

// 特性
public:

// 操作
public:

	void SetEquptType(long lEquptType)
	{
		static BYTE parms[] = VTS_I4 ;
		InvokeHelper(0x60030000, DISPATCH_METHOD, VT_EMPTY, NULL, parms, lEquptType);
	}
	long GetEquptType()
	{
		long result;
		InvokeHelper(0x60030001, DISPATCH_METHOD, VT_I4, (void*)&result, NULL);
		return result;
	}
	long GetPortCount()
	{
		long result;
		InvokeHelper(0x60030002, DISPATCH_METHOD, VT_I4, (void*)&result, NULL);
		return result;
	}
	void SetPortValue(long iPort, long lValue)
	{
		static BYTE parms[] = VTS_I4 VTS_I4 ;
		InvokeHelper(0x60030003, DISPATCH_METHOD, VT_EMPTY, NULL, parms, iPort, lValue);
	}
	long GetPortValue(long iPort)
	{
		long result;
		static BYTE parms[] = VTS_I4 ;
		InvokeHelper(0x60030004, DISPATCH_METHOD, VT_I4, (void*)&result, parms, iPort);
		return result;
	}
	CString ToString()
	{
		CString result;
		InvokeHelper(0x60030005, DISPATCH_METHOD, VT_BSTR, (void*)&result, NULL);
		return result;
	}
	CString ToString_PortValue1B()
	{
		CString result;
		InvokeHelper(0x60030009, DISPATCH_METHOD, VT_BSTR, (void*)&result, NULL);
		return result;
	}
	CString ToString_PortValue2B()
	{
		CString result;
		InvokeHelper(0x6003000a, DISPATCH_METHOD, VT_BSTR, (void*)&result, NULL);
		return result;
	}
	CString ToString_PortValue4B()
	{
		CString result;
		InvokeHelper(0x6003000c, DISPATCH_METHOD, VT_BSTR, (void*)&result, NULL);
		return result;
	}


};

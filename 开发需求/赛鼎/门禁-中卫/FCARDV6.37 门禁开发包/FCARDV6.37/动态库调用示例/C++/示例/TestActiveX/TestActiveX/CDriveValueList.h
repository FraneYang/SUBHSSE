// CDriveValueList.h : 由 Microsoft Visual C++ 创建的 ActiveX 控件包装器类的声明

#pragma once

/////////////////////////////////////////////////////////////////////////////
// CDriveValueList

class CDriveValueList : public COleDispatchDriver
{
public:
	CDriveValueList() {}		// 调用 COleDispatchDriver 默认构造函数
	CDriveValueList(LPDISPATCH pDispatch) : COleDispatchDriver(pDispatch) {}
	CDriveValueList(const CDriveValueList& dispatchSrc) : COleDispatchDriver(dispatchSrc) {}

// 特性
public:

// 操作
public:

	long GetCount()
	{
		long result;
		InvokeHelper(0x60030006, DISPATCH_METHOD, VT_I4, (void*)&result, NULL);
		return result;
	}
	CString GetItemKey(long lItem)
	{
		CString result;
		static BYTE parms[] = VTS_I4 ;
		InvokeHelper(0x60030007, DISPATCH_METHOD, VT_BSTR, (void*)&result, parms, lItem);
		return result;
	}
	void AddValue(LPCTSTR sKey, long lValue, LPCTSTR sValue, LPDISPATCH * oPortList, LPDISPATCH * oTimeGroup)
	{
		static BYTE parms[] = VTS_BSTR VTS_I4 VTS_BSTR VTS_PDISPATCH VTS_PDISPATCH ;
		InvokeHelper(0x60030008, DISPATCH_METHOD, VT_EMPTY, NULL, parms, sKey, lValue, sValue, oPortList, oTimeGroup);
	}
	CString GetValue_String(LPCTSTR sKey)
	{
		CString result;
		static BYTE parms[] = VTS_BSTR ;
		InvokeHelper(0x6003000a, DISPATCH_METHOD, VT_BSTR, (void*)&result, parms, sKey);
		return result;
	}
	long GetValue_Num(LPCTSTR sKey)
	{
		long result;
		static BYTE parms[] = VTS_BSTR ;
		InvokeHelper(0x6003000b, DISPATCH_METHOD, VT_I4, (void*)&result, parms, sKey);
		return result;
	}
	LPDISPATCH GetValue_PortList(LPCTSTR sKey)
	{
		LPDISPATCH result;
		static BYTE parms[] = VTS_BSTR ;
		InvokeHelper(0x6003000c, DISPATCH_METHOD, VT_DISPATCH, (void*)&result, parms, sKey);
		return result;
	}
	LPDISPATCH GetValue_TimeGroup(LPCTSTR sKey)
	{
		LPDISPATCH result;
		static BYTE parms[] = VTS_BSTR ;
		InvokeHelper(0x6003000d, DISPATCH_METHOD, VT_DISPATCH, (void*)&result, parms, sKey);
		return result;
	}


};

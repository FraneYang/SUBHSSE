// CDriveRecord.h : 由 Microsoft Visual C++ 创建的 ActiveX 控件包装器类的声明

#pragma once

/////////////////////////////////////////////////////////////////////////////
// CDriveRecord

class CDriveRecord : public COleDispatchDriver
{
public:
	CDriveRecord() {}		// 调用 COleDispatchDriver 默认构造函数
	CDriveRecord(LPDISPATCH pDispatch) : COleDispatchDriver(pDispatch) {}
	CDriveRecord(const CDriveRecord& dispatchSrc) : COleDispatchDriver(dispatchSrc) {}

// 特性
public:

// 操作
public:

	CString getPorts()
	{
		CString result;
		InvokeHelper(0x60030000, DISPATCH_METHOD, VT_BSTR, (void*)&result, NULL);
		return result;
	}
	void SetNum(long lNum)
	{
		static BYTE parms[] = VTS_I4 ;
		InvokeHelper(0x60030001, DISPATCH_METHOD, VT_EMPTY, NULL, parms, lNum);
	}
	long GetNum()
	{
		long result;
		InvokeHelper(0x60030002, DISPATCH_METHOD, VT_I4, (void*)&result, NULL);
		return result;
	}
	void SetCode(long lCode)
	{
		static BYTE parms[] = VTS_I4 ;
		InvokeHelper(0x60030003, DISPATCH_METHOD, VT_EMPTY, NULL, parms, lCode);
	}
	long GetCode()
	{
		long result;
		InvokeHelper(0x60030004, DISPATCH_METHOD, VT_I4, (void*)&result, NULL);
		return result;
	}
	long GetType()
	{
		long result;
		InvokeHelper(0x60030005, DISPATCH_METHOD, VT_I4, (void*)&result, NULL);
		return result;
	}
	DATE GetDateTime()
	{
		DATE result;
		InvokeHelper(0x60030006, DISPATCH_METHOD, VT_DATE, (void*)&result, NULL);
		return result;
	}
	double GetCard()
	{
		double result;
		InvokeHelper(0x60030007, DISPATCH_METHOD, VT_R8, (void*)&result, NULL);
		return result;
	}
	CString GetCardNum()
	{
		CString result;
		InvokeHelper(0x60030008, DISPATCH_METHOD, VT_BSTR, (void*)&result, NULL);
		return result;
	}
	CString GetPassword()
	{
		CString result;
		InvokeHelper(0x60030009, DISPATCH_METHOD, VT_BSTR, (void*)&result, NULL);
		return result;
	}
	CString GetCardHex()
	{
		CString result;
		InvokeHelper(0x6003000a, DISPATCH_METHOD, VT_BSTR, (void*)&result, NULL);
		return result;
	}
	long GetDoorPort()
	{
		long result;
		InvokeHelper(0x6003000b, DISPATCH_METHOD, VT_I4, (void*)&result, NULL);
		return result;
	}
	CString GetRecordStr()
	{
		CString result;
		InvokeHelper(0x6003000c, DISPATCH_METHOD, VT_BSTR, (void*)&result, NULL);
		return result;
	}
	void SetRecordStr(BSTR * sNew)
	{
		static BYTE parms[] = VTS_PBSTR ;
		InvokeHelper(0x6003000d, DISPATCH_METHOD, VT_EMPTY, NULL, parms, sNew);
	}
	void SetRecordFC8800Str(long lCode, BSTR * sNew)
	{
		static BYTE parms[] = VTS_I4 VTS_PBSTR ;
		InvokeHelper(0x6003000e, DISPATCH_METHOD, VT_EMPTY, NULL, parms, lCode, sNew);
	}
	void SetCardNum(BSTR * sNum)
	{
		static BYTE parms[] = VTS_PBSTR ;
		InvokeHelper(0x60030018, DISPATCH_METHOD, VT_EMPTY, NULL, parms, sNum);
	}
	void SetRecordFC9800ICStr(long lCode, BSTR * sNew)
	{
		static BYTE parms[] = VTS_I4 VTS_PBSTR ;
		InvokeHelper(0x6003001a, DISPATCH_METHOD, VT_EMPTY, NULL, parms, lCode, sNew);
	}
	void SetRecordPatorStr(unsigned char lCode, BSTR * sNew)
	{
		static BYTE parms[] = VTS_UI1 VTS_PBSTR ;
		InvokeHelper(0x60030020, DISPATCH_METHOD, VT_EMPTY, NULL, parms, lCode, sNew);
	}
	void SetRecordFC2816M(long lCode, BSTR * sNew)
	{
		static BYTE parms[] = VTS_I4 VTS_PBSTR ;
		InvokeHelper(0x60030023, DISPATCH_METHOD, VT_EMPTY, NULL, parms, lCode, sNew);
	}


};

// CDriveCommandFile.h : 由 Microsoft Visual C++ 创建的 ActiveX 控件包装器类的声明

#pragma once

/////////////////////////////////////////////////////////////////////////////
// CDriveCommandFile

class CDriveCommandFile : public COleDispatchDriver
{
public:
	CDriveCommandFile() {}		// 调用 COleDispatchDriver 默认构造函数
	CDriveCommandFile(LPDISPATCH pDispatch) : COleDispatchDriver(pDispatch) {}
	CDriveCommandFile(const CDriveCommandFile& dispatchSrc) : COleDispatchDriver(dispatchSrc) {}

// 特性
public:

// 操作
public:

	long GetCmdCount()
	{
		long result;
		InvokeHelper(0x60030002, DISPATCH_METHOD, VT_I4, (void*)&result, NULL);
		return result;
	}
	VARIANT ClearCmd()
	{
		VARIANT result;
		InvokeHelper(0x60030003, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
		return result;
	}
	SAFEARRAY * GetByte()
	{
		InvokeHelper(0x60030004, DISPATCH_METHOD, VT_EMPTY, NULL, NULL);
	}
	SAFEARRAY * GetByteEx(long * lDataLen, long * lFrameCount)
	{
		static BYTE parms[] = VTS_PI4 VTS_PI4 ;
		InvokeHelper(0x60030005, DISPATCH_METHOD, VT_EMPTY, NULL, parms, lDataLen, lFrameCount);
	}


};

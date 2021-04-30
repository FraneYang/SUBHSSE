// CDriveMain.h : 由 Microsoft Visual C++ 创建的 ActiveX 控件包装器类的声明

#pragma once

/////////////////////////////////////////////////////////////////////////////
// CDriveMain

class CDriveMain : public COleDispatchDriver
{
public:
	CDriveMain() {}		// 调用 COleDispatchDriver 默认构造函数
	CDriveMain(LPDISPATCH pDispatch) : COleDispatchDriver(pDispatch) {}
	CDriveMain(const CDriveMain& dispatchSrc) : COleDispatchDriver(dispatchSrc) {}

// 特性
public:

// 操作
public:

	BOOL AddConnectionRequest(long requestID)
	{
		BOOL result;
		static BYTE parms[] = VTS_I4 ;
		InvokeHelper(0x600303d5, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, requestID);
		return result;
	}
	CString GetVer()
	{
		CString result;
		InvokeHelper(0x600303d6, DISPATCH_METHOD, VT_BSTR, (void*)&result, NULL);
		return result;
	}
	long get_CheckMaxChunnel()
	{
		long result;
		InvokeHelper(0x680303d4, DISPATCH_PROPERTYGET, VT_I4, (void*)&result, NULL);
		return result;
	}
	void put_CheckMaxChunnel(long newValue)
	{
		static BYTE parms[] = VTS_I4 ;
		InvokeHelper(0x680303d4, DISPATCH_PROPERTYPUT, VT_EMPTY, NULL, parms, newValue);
	}
	BOOL SetShowTxRxLog(BOOL bShow)
	{
		BOOL result;
		static BYTE parms[] = VTS_BOOL ;
		InvokeHelper(0x600303d7, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, bShow);
		return result;
	}
	BOOL SetUseICLCDReader(BOOL bUse)
	{
		BOOL result;
		static BYTE parms[] = VTS_BOOL ;
		InvokeHelper(0x60030544, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, bUse);
		return result;
	}
	long GetAlignmentCount()
	{
		long result;
		InvokeHelper(0x600303d8, DISPATCH_METHOD, VT_I4, (void*)&result, NULL);
		return result;
	}
	BOOL IsEquptWatch(LPDISPATCH * objConnInfo)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH ;
		InvokeHelper(0x600303d9, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo);
		return result;
	}
	long GetChunelAlignmentCount(LPDISPATCH * objConnInfo)
	{
		long result;
		static BYTE parms[] = VTS_PDISPATCH ;
		InvokeHelper(0x600303da, DISPATCH_METHOD, VT_I4, (void*)&result, parms, objConnInfo);
		return result;
	}
	BOOL CheckCommandIsAdd(LPDISPATCH * objConnInfo, long lFunction)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_I4 ;
		InvokeHelper(0x600303db, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, lFunction);
		return result;
	}
	void ChunnelForciblyState(LPDISPATCH * objConnInfo, BOOL bBool)
	{
		static BYTE parms[] = VTS_PDISPATCH VTS_BOOL ;
		InvokeHelper(0x600303dc, DISPATCH_METHOD, VT_EMPTY, NULL, parms, objConnInfo, bBool);
	}
	void CloseConnForcibly_All()
	{
		InvokeHelper(0x600303de, DISPATCH_METHOD, VT_EMPTY, NULL, NULL);
	}
	void SetShowEvent(BOOL bShowEvent)
	{
		static BYTE parms[] = VTS_BOOL ;
		InvokeHelper(0x600303e0, DISPATCH_METHOD, VT_EMPTY, NULL, parms, bShowEvent);
	}
	LPDISPATCH GetEvent()
	{
		LPDISPATCH result;
		InvokeHelper(0x600303e1, DISPATCH_METHOD, VT_DISPATCH, (void*)&result, NULL);
		return result;
	}
	void SetDrivePause()
	{
		InvokeHelper(0x600303e3, DISPATCH_METHOD, VT_EMPTY, NULL, NULL);
	}
	void SetDriveRun()
	{
		InvokeHelper(0x600303e4, DISPATCH_METHOD, VT_EMPTY, NULL, NULL);
	}
	BOOL DriveIsRun()
	{
		BOOL result;
		InvokeHelper(0x600303e5, DISPATCH_METHOD, VT_BOOL, (void*)&result, NULL);
		return result;
	}
	long GetActivityChunnelCount()
	{
		long result;
		InvokeHelper(0x600303e6, DISPATCH_METHOD, VT_I4, (void*)&result, NULL);
		return result;
	}
	CString GetActivityChunnelList()
	{
		CString result;
		InvokeHelper(0x600303e7, DISPATCH_METHOD, VT_BSTR, (void*)&result, NULL);
		return result;
	}
	BOOL GetTimerEnabled()
	{
		BOOL result;
		InvokeHelper(0x600303e9, DISPATCH_METHOD, VT_BOOL, (void*)&result, NULL);
		return result;
	}
	VARIANT RestartTimer()
	{
		VARIANT result;
		InvokeHelper(0x600303ea, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
		return result;
	}
	VARIANT CompelCheckChunnel()
	{
		VARIANT result;
		InvokeHelper(0x600303eb, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
		return result;
	}
	DATE GetTimerTunTime()
	{
		DATE result;
		InvokeHelper(0x600303ec, DISPATCH_METHOD, VT_DATE, (void*)&result, NULL);
		return result;
	}
	DATE GetTimerRunTime()
	{
		DATE result;
		InvokeHelper(0x600303ed, DISPATCH_METHOD, VT_DATE, (void*)&result, NULL);
		return result;
	}
	void ClearChunnel()
	{
		InvokeHelper(0x600303f0, DISPATCH_METHOD, VT_EMPTY, NULL, NULL);
	}
	LPDISPATCH GetEventSending()
	{
		LPDISPATCH result;
		InvokeHelper(0x600303f3, DISPATCH_METHOD, VT_DISPATCH, (void*)&result, NULL);
		return result;
	}
	LPDISPATCH GetTmpConnInfo()
	{
		LPDISPATCH result;
		InvokeHelper(0x600303f4, DISPATCH_METHOD, VT_DISPATCH, (void*)&result, NULL);
		return result;
	}
	LPDISPATCH GetTmpRecords()
	{
		LPDISPATCH result;
		InvokeHelper(0x600303f5, DISPATCH_METHOD, VT_DISPATCH, (void*)&result, NULL);
		return result;
	}
	LPDISPATCH GetTmpCards()
	{
		LPDISPATCH result;
		InvokeHelper(0x600303f6, DISPATCH_METHOD, VT_DISPATCH, (void*)&result, NULL);
		return result;
	}
	LPDISPATCH GetTmpHolidays()
	{
		LPDISPATCH result;
		InvokeHelper(0x600303f7, DISPATCH_METHOD, VT_DISPATCH, (void*)&result, NULL);
		return result;
	}
	LPDISPATCH GetTmpTimeGroups()
	{
		LPDISPATCH result;
		InvokeHelper(0x600303f8, DISPATCH_METHOD, VT_DISPATCH, (void*)&result, NULL);
		return result;
	}
	LPDISPATCH GetTmpPasswords()
	{
		LPDISPATCH result;
		InvokeHelper(0x600303f9, DISPATCH_METHOD, VT_DISPATCH, (void*)&result, NULL);
		return result;
	}
	void RaiseWatchEvents(LPDISPATCH * objConnInfo, short iWatchType, LPCTSTR sValue)
	{
		static BYTE parms[] = VTS_PDISPATCH VTS_I2 VTS_BSTR ;
		InvokeHelper(0x600303fb, DISPATCH_METHOD, VT_EMPTY, NULL, parms, objConnInfo, iWatchType, sValue);
	}
	void RaiseFrameAchieve(LPDISPATCH * objConnInfo, short iFunc, LPCTSTR sValue)
	{
		static BYTE parms[] = VTS_PDISPATCH VTS_I2 VTS_BSTR ;
		InvokeHelper(0x600303fc, DISPATCH_METHOD, VT_EMPTY, NULL, parms, objConnInfo, iFunc, sValue);
	}
	void RaiseFrameAchieve_Obj(LPDISPATCH * objConnInfo, short iFunc, LPCTSTR sValue, LPDISPATCH * oCols)
	{
		static BYTE parms[] = VTS_PDISPATCH VTS_I2 VTS_BSTR VTS_PDISPATCH ;
		InvokeHelper(0x600303fd, DISPATCH_METHOD, VT_EMPTY, NULL, parms, objConnInfo, iFunc, sValue, oCols);
	}
	void RaiseSendProcess(LPDISPATCH * objConnInfo, long iFunc, long iStep, long iStepCount, LPCTSTR sValue)
	{
		static BYTE parms[] = VTS_PDISPATCH VTS_I4 VTS_I4 VTS_I4 VTS_BSTR ;
		InvokeHelper(0x600303fe, DISPATCH_METHOD, VT_EMPTY, NULL, parms, objConnInfo, iFunc, iStep, iStepCount, sValue);
	}
	void RaiseContainOverflow(LPDISPATCH * objConnInfo, short iFunc, LPCTSTR sValue)
	{
		static BYTE parms[] = VTS_PDISPATCH VTS_I2 VTS_BSTR ;
		InvokeHelper(0x600303ff, DISPATCH_METHOD, VT_EMPTY, NULL, parms, objConnInfo, iFunc, sValue);
	}
	void RaiseReadRecordAchieve(LPDISPATCH * objConnInfo, long lRecordCount, LPDISPATCH * objRecords)
	{
		static BYTE parms[] = VTS_PDISPATCH VTS_I4 VTS_PDISPATCH ;
		InvokeHelper(0x60030400, DISPATCH_METHOD, VT_EMPTY, NULL, parms, objConnInfo, lRecordCount, objRecords);
	}
	void RaiseReadCardAchieve(LPDISPATCH * objConnInfo, LPDISPATCH * objCards)
	{
		static BYTE parms[] = VTS_PDISPATCH VTS_PDISPATCH ;
		InvokeHelper(0x60030401, DISPATCH_METHOD, VT_EMPTY, NULL, parms, objConnInfo, objCards);
	}
	void RaiseReadHolidayAchieve(LPDISPATCH * objConnInfo, LPDISPATCH * objCol)
	{
		static BYTE parms[] = VTS_PDISPATCH VTS_PDISPATCH ;
		InvokeHelper(0x60030402, DISPATCH_METHOD, VT_EMPTY, NULL, parms, objConnInfo, objCol);
	}
	void RaiseReadTimeGroupAchieve(LPDISPATCH * objConnInfo, LPDISPATCH * objCol)
	{
		static BYTE parms[] = VTS_PDISPATCH VTS_PDISPATCH ;
		InvokeHelper(0x60030403, DISPATCH_METHOD, VT_EMPTY, NULL, parms, objConnInfo, objCol);
	}
	void RaisePasswordErr(LPDISPATCH * objConnInfo, short iFunc, LPCTSTR sValue)
	{
		static BYTE parms[] = VTS_PDISPATCH VTS_I2 VTS_BSTR ;
		InvokeHelper(0x60030404, DISPATCH_METHOD, VT_EMPTY, NULL, parms, objConnInfo, iFunc, sValue);
	}
	void RaiseReadPasswordAchieve(LPDISPATCH * objConnInfo, LPDISPATCH * objCol)
	{
		static BYTE parms[] = VTS_PDISPATCH VTS_PDISPATCH ;
		InvokeHelper(0x60030405, DISPATCH_METHOD, VT_EMPTY, NULL, parms, objConnInfo, objCol);
	}
	void RaiseOpenPortErr(LPDISPATCH * objConnInfo, short iFunc, LPDISPATCH * objCards, LPCTSTR sValue)
	{
		static BYTE parms[] = VTS_PDISPATCH VTS_I2 VTS_PDISPATCH VTS_BSTR ;
		InvokeHelper(0x60030406, DISPATCH_METHOD, VT_EMPTY, NULL, parms, objConnInfo, iFunc, objCards, sValue);
	}
	void RaiseCommandTimeout(LPDISPATCH * objConnInfo, short iFunc, short iStep, LPDISPATCH * objCards, LPCTSTR sValue)
	{
		static BYTE parms[] = VTS_PDISPATCH VTS_I2 VTS_I2 VTS_PDISPATCH VTS_BSTR ;
		InvokeHelper(0x60030407, DISPATCH_METHOD, VT_EMPTY, NULL, parms, objConnInfo, iFunc, iStep, objCards, sValue);
	}
	void RaiseSendEvent(LPDISPATCH * objConnInfo, long lDataLen, LPCTSTR sHex)
	{
		static BYTE parms[] = VTS_PDISPATCH VTS_I4 VTS_BSTR ;
		InvokeHelper(0x60030408, DISPATCH_METHOD, VT_EMPTY, NULL, parms, objConnInfo, lDataLen, sHex);
	}
	void RaiseDataArrivalEvent(LPDISPATCH * objConnInfo, long lDataLen, LPCTSTR sHex)
	{
		static BYTE parms[] = VTS_PDISPATCH VTS_I4 VTS_BSTR ;
		InvokeHelper(0x60030409, DISPATCH_METHOD, VT_EMPTY, NULL, parms, objConnInfo, lDataLen, sHex);
	}
	void RaiseServerConnEvent(LPDISPATCH * objConnInfo)
	{
		static BYTE parms[] = VTS_PDISPATCH ;
		InvokeHelper(0x6003040a, DISPATCH_METHOD, VT_EMPTY, NULL, parms, objConnInfo);
	}
	void RaiseServerCloseEvent(LPDISPATCH * objConnInfo)
	{
		static BYTE parms[] = VTS_PDISPATCH ;
		InvokeHelper(0x6003040b, DISPATCH_METHOD, VT_EMPTY, NULL, parms, objConnInfo);
	}
	void Unload()
	{
		InvokeHelper(0x6003040e, DISPATCH_METHOD, VT_EMPTY, NULL, NULL);
	}
	void SetFC2816CardLen(unsigned char iCardByte)
	{
		static BYTE parms[] = VTS_UI1 ;
		InvokeHelper(0x6003040f, DISPATCH_METHOD, VT_EMPTY, NULL, parms, iCardByte);
	}
	long GetWinSockState(long lIndex)
	{
		long result;
		static BYTE parms[] = VTS_I4 ;
		InvokeHelper(0x60030410, DISPATCH_METHOD, VT_I4, (void*)&result, parms, lIndex);
		return result;
	}
	void StopConnAll()
	{
		InvokeHelper(0x60030411, DISPATCH_METHOD, VT_EMPTY, NULL, NULL);
	}
	void StopConn(LPDISPATCH * objConnInfo)
	{
		static BYTE parms[] = VTS_PDISPATCH ;
		InvokeHelper(0x60030412, DISPATCH_METHOD, VT_EMPTY, NULL, parms, objConnInfo);
	}
	void StopConnOnSN(LPDISPATCH * objConnInfo, LPCTSTR sSN)
	{
		static BYTE parms[] = VTS_PDISPATCH VTS_BSTR ;
		InvokeHelper(0x60030413, DISPATCH_METHOD, VT_EMPTY, NULL, parms, objConnInfo, sSN);
	}
	BOOL WriteSN(LPDISPATCH * objConnInfo, LPCTSTR sSN)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_BSTR ;
		InvokeHelper(0x60030418, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, sSN);
		return result;
	}
	BOOL WriteSN_Ps(LPDISPATCH * objConnInfo, LPCTSTR sPassword1, LPCTSTR sPassword2, LPCTSTR sSN)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_BSTR VTS_BSTR VTS_BSTR ;
		InvokeHelper(0x60030419, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, sPassword1, sPassword2, sSN);
		return result;
	}
	BOOL WriteSN_Bro(LPDISPATCH * objConnInfo, LPCTSTR sPassword1, LPCTSTR sPassword2, LPCTSTR sSN)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_BSTR VTS_BSTR VTS_BSTR ;
		InvokeHelper(0x6003041a, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, sPassword1, sPassword2, sSN);
		return result;
	}
	BOOL WriteAddr(LPDISPATCH * objConnInfo, unsigned char bAddr)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_UI1 ;
		InvokeHelper(0x6003041b, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, bAddr);
		return result;
	}
	BOOL ReadSN(LPDISPATCH * objConnInfo)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH ;
		InvokeHelper(0x6003041c, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo);
		return result;
	}
	BOOL WriteConnPassword(LPDISPATCH * objConnInfo, LPCTSTR sPassword)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_BSTR ;
		InvokeHelper(0x6003041d, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, sPassword);
		return result;
	}
	BOOL ReadConnPassword(LPDISPATCH * objConnInfo)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH ;
		InvokeHelper(0x6003041e, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo);
		return result;
	}
	BOOL DeleteConnPassword(LPDISPATCH * objConnInfo)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH ;
		InvokeHelper(0x6003041f, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo);
		return result;
	}
	BOOL GetTCPPar(LPDISPATCH * objConnInfo, BOOL mUDPBroadcast)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_BOOL ;
		InvokeHelper(0x60030420, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, mUDPBroadcast);
		return result;
	}
	BOOL WriteTCPPar(LPDISPATCH * objConnInfo, LPDISPATCH * oTCPPar, BOOL mUDPBroadcast)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_PDISPATCH VTS_BOOL ;
		InvokeHelper(0x60030421, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, oTCPPar, mUDPBroadcast);
		return result;
	}
	BOOL WriteTCPPar_MAC(LPDISPATCH * objConnInfo, LPDISPATCH * oTCPPar, BOOL mUDPBroadcast)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_PDISPATCH VTS_BOOL ;
		InvokeHelper(0x60030422, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, oTCPPar, mUDPBroadcast);
		return result;
	}
	BOOL ReadEquptDeadline(LPDISPATCH * objConnInfo)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH ;
		InvokeHelper(0x60030423, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo);
		return result;
	}
	BOOL WriteEquptDeadline(LPDISPATCH * objConnInfo, long lDeadline)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_I4 ;
		InvokeHelper(0x60030424, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, lDeadline);
		return result;
	}
	BOOL ReadEquptVer(LPDISPATCH * objConnInfo)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH ;
		InvokeHelper(0x60030425, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo);
		return result;
	}
	BOOL ReadEquptStateInfo(LPDISPATCH * objConnInfo)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH ;
		InvokeHelper(0x60030426, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo);
		return result;
	}
	BOOL ReadSysPar(LPDISPATCH * objConnInfo)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH ;
		InvokeHelper(0x60030427, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo);
		return result;
	}
	BOOL WriteRecordMode(LPDISPATCH * objConnInfo, short lMode)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_I2 ;
		InvokeHelper(0x60030428, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, lMode);
		return result;
	}
	BOOL ReadRecordMode(LPDISPATCH * objConnInfo)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH ;
		InvokeHelper(0x60030429, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo);
		return result;
	}
	BOOL WriteKeyboard(LPDISPATCH * objConnInfo, LPDISPATCH * oPort)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_PDISPATCH ;
		InvokeHelper(0x6003042a, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, oPort);
		return result;
	}
	BOOL ReadKeyboard(LPDISPATCH * objConnInfo)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH ;
		InvokeHelper(0x6003042b, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo);
		return result;
	}
	BOOL IniKeyboardPassword(LPDISPATCH * objConnInfo)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH ;
		InvokeHelper(0x6003042c, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo);
		return result;
	}
	BOOL ReadKeyboardPassword(LPDISPATCH * objConnInfo)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH ;
		InvokeHelper(0x6003042d, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo);
		return result;
	}
	BOOL WriteLockInteraction(LPDISPATCH * objConnInfo, BOOL bDoor1, BOOL bDoor2, BOOL bDoor3, BOOL bDoor4)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_BOOL VTS_BOOL VTS_BOOL VTS_BOOL ;
		InvokeHelper(0x6003042e, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, bDoor1, bDoor2, bDoor3, bDoor4);
		return result;
	}
	BOOL ReadLockInteraction(LPDISPATCH * objConnInfo)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH ;
		InvokeHelper(0x6003042f, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo);
		return result;
	}
	BOOL WriteFireAlarm(LPDISPATCH * objConnInfo, short lMode)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_I2 ;
		InvokeHelper(0x60030430, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, lMode);
		return result;
	}
	BOOL ReadFireAlarm(LPDISPATCH * objConnInfo)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH ;
		InvokeHelper(0x60030431, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo);
		return result;
	}
	BOOL WriteOpenAlarm(LPDISPATCH * objConnInfo, short lMode)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_I2 ;
		InvokeHelper(0x60030432, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, lMode);
		return result;
	}
	BOOL ReadOpenAlarm(LPDISPATCH * objConnInfo)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH ;
		InvokeHelper(0x60030433, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo);
		return result;
	}
	BOOL SetReaderIntervalTime(LPDISPATCH * objConnInfo, long lInterval)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_I4 ;
		InvokeHelper(0x60030434, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, lInterval);
		return result;
	}
	BOOL GetReaderIntervalTime(LPDISPATCH * objConnInfo)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH ;
		InvokeHelper(0x60030435, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo);
		return result;
	}
	BOOL SetReaderIntervalTime_Elevator(LPDISPATCH * objConnInfo, BOOL bUse, long lInterval, short lMode)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_BOOL VTS_I4 VTS_I2 ;
		InvokeHelper(0x60030436, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, bUse, lInterval, lMode);
		return result;
	}
	BOOL SetSpeakOpen(LPDISPATCH * objConnInfo, LPCTSTR sOpen)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_BSTR ;
		InvokeHelper(0x60030437, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, sOpen);
		return result;
	}
	BOOL ReadSpeakOpen(LPDISPATCH * objConnInfo)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH ;
		InvokeHelper(0x60030438, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo);
		return result;
	}
	BOOL SetReaderCheckMode(LPDISPATCH * objConnInfo, BOOL bOpen)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_BOOL ;
		InvokeHelper(0x60030439, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, bOpen);
		return result;
	}
	BOOL SetReaderCheckMode_Mode(LPDISPATCH * objConnInfo, unsigned char lMode)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_UI1 ;
		InvokeHelper(0x6003043a, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, lMode);
		return result;
	}
	BOOL ReadReaderCheckMode(LPDISPATCH * objConnInfo)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH ;
		InvokeHelper(0x6003043b, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo);
		return result;
	}
	BOOL SetEquptBuzzerMode(LPDISPATCH * objConnInfo, BOOL bOpen)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_BOOL ;
		InvokeHelper(0x6003043c, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, bOpen);
		return result;
	}
	BOOL ReadEquptBuzzerMode(LPDISPATCH * objConnInfo)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH ;
		InvokeHelper(0x6003043d, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo);
		return result;
	}
	BOOL WriteAssistantAlertPar(LPDISPATCH * objConnInfo, unsigned char lMode)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_UI1 ;
		InvokeHelper(0x6003043e, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, lMode);
		return result;
	}
	BOOL ReadAssistantAlertPar(LPDISPATCH * objConnInfo)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH ;
		InvokeHelper(0x6003043f, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo);
		return result;
	}
	BOOL WriteCardMaxPar(LPDISPATCH * objConnInfo, long lCardMax, LPDISPATCH * oDoorCardMax, LPDISPATCH * oDoorInCardCount)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_I4 VTS_PDISPATCH VTS_PDISPATCH ;
		InvokeHelper(0x60030440, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, lCardMax, oDoorCardMax, oDoorInCardCount);
		return result;
	}
	BOOL ReadCardMaxPar(LPDISPATCH * objConnInfo)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH ;
		InvokeHelper(0x60030441, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo);
		return result;
	}
	BOOL WriteTheftAlarmPar(LPDISPATCH * objConnInfo, BOOL bOpen, unsigned char lInTime, unsigned char lOutTime, long lBeginPassword, long lClosePassword, long lAlarmTime)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_BOOL VTS_UI1 VTS_UI1 VTS_I4 VTS_I4 VTS_I4 ;
		InvokeHelper(0x60030442, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, bOpen, lInTime, lOutTime, lBeginPassword, lClosePassword, lAlarmTime);
		return result;
	}
	BOOL ReadTheftAlarmPar(LPDISPATCH * objConnInfo)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH ;
		InvokeHelper(0x60030443, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo);
		return result;
	}
	BOOL WriteCheckInOutPar(LPDISPATCH * objConnInfo, unsigned char lMode)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_UI1 ;
		InvokeHelper(0x60030444, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, lMode);
		return result;
	}
	BOOL ReadCheckInOutPar(LPDISPATCH * objConnInfo)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH ;
		InvokeHelper(0x60030445, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo);
		return result;
	}
	BOOL WriteCardPeriodSpeak(LPDISPATCH * objConnInfo, BOOL lOpen)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_BOOL ;
		InvokeHelper(0x60030446, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, lOpen);
		return result;
	}
	BOOL ReadCardPeriodSpeak(LPDISPATCH * objConnInfo)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH ;
		InvokeHelper(0x60030447, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo);
		return result;
	}
	BOOL WriteReadCardSpeak(LPDISPATCH * objConnInfo, BOOL bOpen, unsigned char lMsgIndex, DATE dBeginDate, DATE dEndDate)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_BOOL VTS_UI1 VTS_DATE VTS_DATE ;
		InvokeHelper(0x60030448, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, bOpen, lMsgIndex, dBeginDate, dEndDate);
		return result;
	}
	BOOL ReadReadCardSpeak(LPDISPATCH * objConnInfo)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH ;
		InvokeHelper(0x60030449, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo);
		return result;
	}
	BOOL BeginWatch(LPDISPATCH * objConnInfo)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH ;
		InvokeHelper(0x6003044a, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo);
		return result;
	}
	BOOL BeginWatch_Bro(LPDISPATCH * objConnInfo, BOOL bUDP)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_BOOL ;
		InvokeHelper(0x6003044b, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, bUDP);
		return result;
	}
	BOOL CloseWatch(LPDISPATCH * objConnInfo)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH ;
		InvokeHelper(0x6003044c, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo);
		return result;
	}
	BOOL CloseWatch_Bro(LPDISPATCH * objConnInfo, BOOL bUDP)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_BOOL ;
		InvokeHelper(0x6003044d, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, bUDP);
		return result;
	}
	BOOL ReadWatchState(LPDISPATCH * objConnInfo)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH ;
		InvokeHelper(0x6003044e, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo);
		return result;
	}
	BOOL SendFireAlarm(LPDISPATCH * objConnInfo)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH ;
		InvokeHelper(0x6003044f, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo);
		return result;
	}
	BOOL CloseFireAlarm(LPDISPATCH * objConnInfo)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH ;
		InvokeHelper(0x60030450, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo);
		return result;
	}
	BOOL ReadFireAlarmState(LPDISPATCH * objConnInfo)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH ;
		InvokeHelper(0x60030451, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo);
		return result;
	}
	BOOL SendAssistantAlarm(LPDISPATCH * objConnInfo)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH ;
		InvokeHelper(0x60030452, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo);
		return result;
	}
	BOOL CloseAssistantAlarm(LPDISPATCH * objConnInfo)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH ;
		InvokeHelper(0x60030453, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo);
		return result;
	}
	BOOL ReadAssistantAlarm(LPDISPATCH * objConnInfo)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH ;
		InvokeHelper(0x60030454, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo);
		return result;
	}
	BOOL CloseAlarm(LPDISPATCH * objConnInfo, short iPort, long lAlarmPar)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_I2 VTS_I4 ;
		InvokeHelper(0x60030455, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, iPort, lAlarmPar);
		return result;
	}
	BOOL CloseAlarm_Elevator(LPDISPATCH * objConnInfo, long lAlarmPar)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_I4 ;
		InvokeHelper(0x60030456, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, lAlarmPar);
		return result;
	}
	BOOL GetPortState(LPDISPATCH * objConnInfo)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH ;
		InvokeHelper(0x60030457, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo);
		return result;
	}
	BOOL GetTheftAlarmState(LPDISPATCH * objConnInfo)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH ;
		InvokeHelper(0x60030458, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo);
		return result;
	}
	BOOL IniEqupt(LPDISPATCH * objConnInfo)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH ;
		InvokeHelper(0x60030459, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo);
		return result;
	}
	BOOL SearchEquptOnNetNum(LPDISPATCH * objConnInfo, long lNetNum)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_I4 ;
		InvokeHelper(0x6003045a, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, lNetNum);
		return result;
	}
	BOOL SearchEquptOnNetNumEx(LPDISPATCH * objConnInfo, long lNetNum, BOOL mUDPBroadcast)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_I4 VTS_BOOL ;
		InvokeHelper(0x6003045b, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, lNetNum, mUDPBroadcast);
		return result;
	}
	BOOL SetEquptNetNum(LPDISPATCH * objConnInfo, long lNetNum, BOOL mUDPBroadcast)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_I4 VTS_BOOL ;
		InvokeHelper(0x6003045c, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, lNetNum, mUDPBroadcast);
		return result;
	}
	BOOL WriteMemory(LPDISPATCH * objConnInfo, LPCTSTR sHex)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_BSTR ;
		InvokeHelper(0x6003045d, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, sHex);
		return result;
	}
	BOOL ReadMemory(LPDISPATCH * objConnInfo)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH ;
		InvokeHelper(0x6003045e, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo);
		return result;
	}
	BOOL SetKeepAliveSpace(LPDISPATCH * objConnInfo, long lTime)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_I4 ;
		InvokeHelper(0x6003045f, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, lTime);
		return result;
	}
	BOOL GetKeepAliveSpace(LPDISPATCH * objConnInfo)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH ;
		InvokeHelper(0x60030460, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo);
		return result;
	}
	BOOL SetManageCard(LPDISPATCH * objConnInfo, BOOL bUse)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_BOOL ;
		InvokeHelper(0x60030461, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, bUse);
		return result;
	}
	BOOL GetManageCard(LPDISPATCH * objConnInfo)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH ;
		InvokeHelper(0x60030462, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo);
		return result;
	}
	BOOL SetManageCard_IC(LPDISPATCH * objConnInfo, BOOL bUse, LPCTSTR sPassword)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_BOOL VTS_BSTR ;
		InvokeHelper(0x60030463, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, bUse, sPassword);
		return result;
	}
	BOOL GetManageCard_IC(LPDISPATCH * objConnInfo)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH ;
		InvokeHelper(0x60030464, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo);
		return result;
	}
	BOOL SetTheftFortify(LPDISPATCH * objConnInfo)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH ;
		InvokeHelper(0x60030465, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo);
		return result;
	}
	BOOL SetTheftDisarming(LPDISPATCH * objConnInfo)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH ;
		InvokeHelper(0x60030466, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo);
		return result;
	}
	BOOL GetExploreLockMode(LPDISPATCH * objConnInfo)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH ;
		InvokeHelper(0x60030467, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo);
		return result;
	}
	BOOL SetExploreLockMode(LPDISPATCH * objConnInfo, BOOL bOpen)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_BOOL ;
		InvokeHelper(0x60030468, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, bOpen);
		return result;
	}
	BOOL SetExploreLockModeEx(LPDISPATCH * objConnInfo, BOOL bOpen, unsigned char lCount)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_BOOL VTS_UI1 ;
		InvokeHelper(0x60030469, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, bOpen, lCount);
		return result;
	}
	BOOL SetExploreLockMode_FC2816M(LPDISPATCH * objConnInfo, unsigned char lErrCount, unsigned char lLockedTime)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_UI1 VTS_UI1 ;
		InvokeHelper(0x6003046a, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, lErrCount, lLockedTime);
		return result;
	}
	BOOL GetCheck485Line(LPDISPATCH * objConnInfo)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH ;
		InvokeHelper(0x6003046b, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo);
		return result;
	}
	BOOL SetCheck485Line(LPDISPATCH * objConnInfo, BOOL bOpen)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_BOOL ;
		InvokeHelper(0x6003046c, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, bOpen);
		return result;
	}
	BOOL GetInputPortDefine(LPDISPATCH * objConnInfo)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH ;
		InvokeHelper(0x6003046d, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo);
		return result;
	}
	BOOL SetInputPortDefine(LPDISPATCH * objConnInfo, unsigned char iType)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_UI1 ;
		InvokeHelper(0x6003046e, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, iType);
		return result;
	}
	BOOL GetChannelBridgeConnection(LPDISPATCH * objConnInfo)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH ;
		InvokeHelper(0x6003046f, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo);
		return result;
	}
	BOOL SetChannelBridgeConnection(LPDISPATCH * objConnInfo, unsigned char iType)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_UI1 ;
		InvokeHelper(0x60030470, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, iType);
		return result;
	}
	BOOL GetExpireRemind(LPDISPATCH * objConnInfo)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH ;
		InvokeHelper(0x60030471, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo);
		return result;
	}
	BOOL SetExpireRemind(LPDISPATCH * objConnInfo, unsigned char iDay)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_UI1 ;
		InvokeHelper(0x60030472, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, iDay);
		return result;
	}
	BOOL ReadTime(LPDISPATCH * objConnInfo)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH ;
		InvokeHelper(0x60030473, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo);
		return result;
	}
	BOOL WriteTime(LPDISPATCH * objConnInfo)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH ;
		InvokeHelper(0x60030474, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo);
		return result;
	}
	BOOL WriteTimeDefine(LPDISPATCH * objConnInfo, DATE oDate)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_DATE ;
		InvokeHelper(0x60030475, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, oDate);
		return result;
	}
	BOOL WriteTime_Bro(LPDISPATCH * objConnInfo, BOOL bUDP)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_BOOL ;
		InvokeHelper(0x60030476, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, bUDP);
		return result;
	}
	BOOL ReadTimePar(LPDISPATCH * objConnInfo)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH ;
		InvokeHelper(0x60030477, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo);
		return result;
	}
	BOOL WriteTimePar(LPDISPATCH * objConnInfo, short lParMode, short lSecond)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_I2 VTS_I2 ;
		InvokeHelper(0x60030478, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, lParMode, lSecond);
		return result;
	}
	BOOL GetReaderPar(LPDISPATCH * objConnInfo)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH ;
		InvokeHelper(0x60030479, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo);
		return result;
	}
	BOOL WriteReaderPar(LPDISPATCH * objConnInfo, LPDISPATCH * oPort)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_PDISPATCH ;
		InvokeHelper(0x6003047a, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, oPort);
		return result;
	}
	BOOL GetLockPar(LPDISPATCH * objConnInfo)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH ;
		InvokeHelper(0x6003047b, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo);
		return result;
	}
	BOOL WriteLockPar(LPDISPATCH * objConnInfo, LPDISPATCH * oPort)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_PDISPATCH ;
		InvokeHelper(0x6003047c, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, oPort);
		return result;
	}
	BOOL OpenDoor(LPDISPATCH * objConnInfo, LPDISPATCH * oPort)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_PDISPATCH ;
		InvokeHelper(0x6003047d, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, oPort);
		return result;
	}
	BOOL OpenDoor_Check(LPDISPATCH * objConnInfo, unsigned char lNum, LPDISPATCH * oPort)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_UI1 VTS_PDISPATCH ;
		InvokeHelper(0x6003047e, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, lNum, oPort);
		return result;
	}
	BOOL CloseDoor(LPDISPATCH * objConnInfo, LPDISPATCH * oPort)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_PDISPATCH ;
		InvokeHelper(0x6003047f, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, oPort);
		return result;
	}
	BOOL OpenDoor_always(LPDISPATCH * objConnInfo, LPDISPATCH * oPort)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_PDISPATCH ;
		InvokeHelper(0x60030480, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, oPort);
		return result;
	}
	BOOL LockPort(LPDISPATCH * objConnInfo, LPDISPATCH * oPort)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_PDISPATCH ;
		InvokeHelper(0x60030481, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, oPort);
		return result;
	}
	BOOL UnLockPort(LPDISPATCH * objConnInfo, LPDISPATCH * oPort)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_PDISPATCH ;
		InvokeHelper(0x60030482, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, oPort);
		return result;
	}
	BOOL GetPortCheckMode(LPDISPATCH * objConnInfo, short iPort)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_I2 ;
		InvokeHelper(0x60030483, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, iPort);
		return result;
	}
	BOOL WritePortCheckMode(LPDISPATCH * objConnInfo, short iPort, LPDISPATCH * oTime)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_I2 VTS_PDISPATCH ;
		InvokeHelper(0x60030484, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, iPort, oTime);
		return result;
	}
	BOOL GetPortCheckMode_Elevator(LPDISPATCH * objConnInfo)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH ;
		InvokeHelper(0x60030485, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo);
		return result;
	}
	BOOL WritePortCheckMode_Elevator(LPDISPATCH * objConnInfo, LPDISPATCH * oTime)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_PDISPATCH ;
		InvokeHelper(0x60030486, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, oTime);
		return result;
	}
	BOOL GetPortWorkMode(LPDISPATCH * objConnInfo, short iPort)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_I2 ;
		InvokeHelper(0x60030487, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, iPort);
		return result;
	}
	BOOL WritePortWorkMode(LPDISPATCH * objConnInfo, short iPort, BOOL bUse, short lOpenMode, short lLongOpenMode, LPDISPATCH * oTimeG)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_I2 VTS_BOOL VTS_I2 VTS_I2 VTS_PDISPATCH ;
		InvokeHelper(0x60030488, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, iPort, bUse, lOpenMode, lLongOpenMode, oTimeG);
		return result;
	}
	BOOL ReadLockReadTime(LPDISPATCH * objConnInfo, short iPort)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_I2 ;
		InvokeHelper(0x60030489, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, iPort);
		return result;
	}
	BOOL WriteLockReadTime(LPDISPATCH * objConnInfo, short iPort, BOOL bOpen, LPDISPATCH * oTime)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_I2 VTS_BOOL VTS_PDISPATCH ;
		InvokeHelper(0x6003048a, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, iPort, bOpen, oTime);
		return result;
	}
	BOOL ReadLockOpenTime(LPDISPATCH * objConnInfo, short iPort)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_I2 ;
		InvokeHelper(0x6003048b, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, iPort);
		return result;
	}
	BOOL WriteLockOpenTime(LPDISPATCH * objConnInfo, short iPort, long lLockOpenTime)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_I2 VTS_I4 ;
		InvokeHelper(0x6003048c, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, iPort, lLockOpenTime);
		return result;
	}
	BOOL ReadLockOpenTime_Elevator(LPDISPATCH * objConnInfo)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH ;
		InvokeHelper(0x6003048d, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo);
		return result;
	}
	BOOL WriteLockOpenTime_Elevator(LPDISPATCH * objConnInfo, LPDISPATCH * oPort)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_PDISPATCH ;
		InvokeHelper(0x6003048e, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, oPort);
		return result;
	}
	BOOL GetReaderInterval(LPDISPATCH * objConnInfo, short iPort)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_I2 ;
		InvokeHelper(0x6003048f, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, iPort);
		return result;
	}
	BOOL WriteReaderInterval(LPDISPATCH * objConnInfo, short iPort, BOOL bUse, short lMode)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_I2 VTS_BOOL VTS_I2 ;
		InvokeHelper(0x60030490, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, iPort, bUse, lMode);
		return result;
	}
	BOOL SetReadErrCardAlarm(LPDISPATCH * objConnInfo, short iPort, BOOL bUse)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_I2 VTS_BOOL ;
		InvokeHelper(0x60030491, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, iPort, bUse);
		return result;
	}
	BOOL GetReadErrCardAlarm(LPDISPATCH * objConnInfo, short iPort)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_I2 ;
		InvokeHelper(0x60030492, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, iPort);
		return result;
	}
	BOOL SetReadErrCardAlarm_Elevator(LPDISPATCH * objConnInfo, BOOL bUse)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_BOOL ;
		InvokeHelper(0x60030493, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, bUse);
		return result;
	}
	BOOL GetReadErrCardAlarm_Elevator(LPDISPATCH * objConnInfo)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH ;
		InvokeHelper(0x60030494, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo);
		return result;
	}
	BOOL SetAlarmPassword(LPDISPATCH * objConnInfo, short iPort, BOOL bUse, LPCTSTR sPasswrod, short lMode)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_I2 VTS_BOOL VTS_BSTR VTS_I2 ;
		InvokeHelper(0x60030495, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, iPort, bUse, sPasswrod, lMode);
		return result;
	}
	BOOL GetAlarmPassword(LPDISPATCH * objConnInfo, short iPort)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_I2 ;
		InvokeHelper(0x60030496, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, iPort);
		return result;
	}
	BOOL SetAlarmPassword_Elevator(LPDISPATCH * objConnInfo, BOOL bUse, LPCTSTR sPasswrod, short lMode)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_BOOL VTS_BSTR VTS_I2 ;
		InvokeHelper(0x60030497, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, bUse, sPasswrod, lMode);
		return result;
	}
	BOOL GetAlarmPassword_Elevator(LPDISPATCH * objConnInfo)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH ;
		InvokeHelper(0x60030498, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo);
		return result;
	}
	BOOL GetCheckCardInOutState(LPDISPATCH * objConnInfo, short iPort)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_I2 ;
		InvokeHelper(0x60030499, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, iPort);
		return result;
	}
	BOOL SetCheckCardInOutState(LPDISPATCH * objConnInfo, short iPort, BOOL bUse)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_I2 VTS_BOOL ;
		InvokeHelper(0x6003049a, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, iPort, bUse);
		return result;
	}
	BOOL GetLongOpenAlarm(LPDISPATCH * objConnInfo, short iPort)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_I2 ;
		InvokeHelper(0x6003049b, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, iPort);
		return result;
	}
	BOOL SetLongOpenAlarm(LPDISPATCH * objConnInfo, short iPort, BOOL bOpen, long lLongOpenTime, BOOL bAlarm)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_I2 VTS_BOOL VTS_I4 VTS_BOOL ;
		InvokeHelper(0x6003049c, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, iPort, bOpen, lLongOpenTime, bAlarm);
		return result;
	}
	BOOL SetLongOpenAlarm_Elevator(LPDISPATCH * objConnInfo, LPDISPATCH * oPort_Time, LPDISPATCH * oPort_Output)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_PDISPATCH VTS_PDISPATCH ;
		InvokeHelper(0x6003049d, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, oPort_Time, oPort_Output);
		return result;
	}
	BOOL GetButtonPar(LPDISPATCH * objConnInfo, short iPort)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_I2 ;
		InvokeHelper(0x6003049e, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, iPort);
		return result;
	}
	BOOL SetButtonPar(LPDISPATCH * objConnInfo, short iPort, BOOL bUse, BOOL bUseLongOpen, LPDISPATCH * oTimeG)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_I2 VTS_BOOL VTS_BOOL VTS_PDISPATCH ;
		InvokeHelper(0x6003049f, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, iPort, bUse, bUseLongOpen, oTimeG);
		return result;
	}
	BOOL GetDoorStateAlarm(LPDISPATCH * objConnInfo, short iPort)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_I2 ;
		InvokeHelper(0x600304a0, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, iPort);
		return result;
	}
	BOOL SetDoorStateAlarm(LPDISPATCH * objConnInfo, short iPort, BOOL bUse, LPDISPATCH * oTimeG)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_I2 VTS_BOOL VTS_PDISPATCH ;
		InvokeHelper(0x600304a1, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, iPort, bUse, oTimeG);
		return result;
	}
	BOOL SetDoorStateAlarm_Elevator(LPDISPATCH * objConnInfo, LPDISPATCH * oPort)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_PDISPATCH ;
		InvokeHelper(0x600304a2, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, oPort);
		return result;
	}
	BOOL GetProhibitCheck(LPDISPATCH * objConnInfo, short iPort)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_I2 ;
		InvokeHelper(0x600304a3, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, iPort);
		return result;
	}
	BOOL SetProhibitCheck(LPDISPATCH * objConnInfo, short iPort, BOOL bOpen, BOOL bSaveCard, long lTimeGroupIndex)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_I2 VTS_BOOL VTS_BOOL VTS_I4 ;
		InvokeHelper(0x600304a4, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, iPort, bOpen, bSaveCard, lTimeGroupIndex);
		return result;
	}
	BOOL SetProhibitCheck_FC2816M(LPDISPATCH * objConnInfo, LPDISPATCH oPort, BOOL bOpen, BOOL bSaveCard, long lTimeGroupIndex)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_DISPATCH VTS_BOOL VTS_BOOL VTS_I4 ;
		InvokeHelper(0x600304a5, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, oPort, bOpen, bSaveCard, lTimeGroupIndex);
		return result;
	}
	BOOL GetMuchCardPar(LPDISPATCH * objConnInfo, short iPort)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_I2 ;
		InvokeHelper(0x600304a6, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, iPort);
		return result;
	}
	BOOL SetMuchCardPar(LPDISPATCH * objConnInfo, short iPort, unsigned char lInCardMax, unsigned char lOutCardMax)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_I2 VTS_UI1 VTS_UI1 ;
		InvokeHelper(0x600304a7, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, iPort, lInCardMax, lOutCardMax);
		return result;
	}
	BOOL GetMuchCardGroup(LPDISPATCH * objConnInfo, short iPort)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_I2 ;
		InvokeHelper(0x600304a8, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, iPort);
		return result;
	}
	BOOL SetMuchCardGroup(LPDISPATCH * objConnInfo, short iPort, unsigned char lGroupIndex, long lGroupMode, LPDISPATCH * oCards)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_I2 VTS_UI1 VTS_I4 VTS_PDISPATCH ;
		InvokeHelper(0x600304a9, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, iPort, lGroupIndex, lGroupMode, oCards);
		return result;
	}
	BOOL SetPortSpeak(LPDISPATCH * objConnInfo, short iPort, BOOL bUse)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_I2 VTS_BOOL ;
		InvokeHelper(0x600304aa, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, iPort, bUse);
		return result;
	}
	BOOL GetPortSpeak(LPDISPATCH * objConnInfo, short iPort)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_I2 ;
		InvokeHelper(0x600304ab, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, iPort);
		return result;
	}
	BOOL SetBothWayCheck(LPDISPATCH * objConnInfo, short iPort, BOOL bUse)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_I2 VTS_BOOL ;
		InvokeHelper(0x600304ac, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, iPort, bUse);
		return result;
	}
	BOOL GetBothWayCheck(LPDISPATCH * objConnInfo, short iPort)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_I2 ;
		InvokeHelper(0x600304ad, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, iPort);
		return result;
	}
	BOOL SetKeyboardManage(LPDISPATCH * objConnInfo, short iPort, BOOL bUse)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_I2 VTS_BOOL ;
		InvokeHelper(0x600304ae, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, iPort, bUse);
		return result;
	}
	BOOL GetKeyboardManage(LPDISPATCH * objConnInfo, short iPort)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_I2 ;
		InvokeHelper(0x600304af, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, iPort);
		return result;
	}
	BOOL SetKeyboardManagePassword(LPDISPATCH * objConnInfo, short iPort, LPCTSTR sPassword)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_I2 VTS_BSTR ;
		InvokeHelper(0x600304b0, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, iPort, sPassword);
		return result;
	}
	BOOL SetKeyboardManagePassword_8832(LPDISPATCH * objConnInfo, BOOL bUse, LPCTSTR sPassword)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_BOOL VTS_BSTR ;
		InvokeHelper(0x600304b1, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, bUse, sPassword);
		return result;
	}
	BOOL GetKeyboardManagePassword(LPDISPATCH * objConnInfo, short iPort)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_I2 ;
		InvokeHelper(0x600304b2, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, iPort);
		return result;
	}
	BOOL GetKeyboardManagePassword_8832(LPDISPATCH * objConnInfo)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH ;
		InvokeHelper(0x600304b3, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo);
		return result;
	}
	BOOL SetFirstCardCheck(LPDISPATCH * objConnInfo, short iPort, unsigned char lCardMode, unsigned char lPasswordMode)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_I2 VTS_UI1 VTS_UI1 ;
		InvokeHelper(0x600304b4, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, iPort, lCardMode, lPasswordMode);
		return result;
	}
	BOOL GetFirstCardCheck(LPDISPATCH * objConnInfo, short iPort)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_I2 ;
		InvokeHelper(0x600304b5, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, iPort);
		return result;
	}
	BOOL SetMuchCardCheck(LPDISPATCH * objConnInfo, short iPort, unsigned char lCardMode, unsigned char lCheckInOut)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_I2 VTS_UI1 VTS_UI1 ;
		InvokeHelper(0x600304b6, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, iPort, lCardMode, lCheckInOut);
		return result;
	}
	BOOL GetMuchCardCheck(LPDISPATCH * objConnInfo, short iPort)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_I2 ;
		InvokeHelper(0x600304b7, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, iPort);
		return result;
	}
	BOOL SetMuchCardCheckEx(LPDISPATCH * objConnInfo, unsigned char iPort, unsigned char lCheckMode, unsigned char lGroupACount, unsigned char lGroupBCount)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_UI1 VTS_UI1 VTS_UI1 VTS_UI1 ;
		InvokeHelper(0x600304b8, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, iPort, lCheckMode, lGroupACount, lGroupBCount);
		return result;
	}
	BOOL GetMuchCardCheckEx(LPDISPATCH * objConnInfo, unsigned char iPort)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_UI1 ;
		InvokeHelper(0x600304b9, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, iPort);
		return result;
	}
	BOOL SetMuchCardGroupEx(LPDISPATCH * objConnInfo, unsigned char iGroupType, unsigned char iGroupNum, LPDISPATCH oCards)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_UI1 VTS_UI1 VTS_DISPATCH ;
		InvokeHelper(0x600304ba, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, iGroupType, iGroupNum, oCards);
		return result;
	}
	BOOL GetMuchCardGroupEx(LPDISPATCH * objConnInfo, unsigned char iGroupType, unsigned char iGroupNum)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_UI1 VTS_UI1 ;
		InvokeHelper(0x600304bb, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, iGroupType, iGroupNum);
		return result;
	}
	BOOL SetAreaCheckInOut(LPDISPATCH * objConnInfo, unsigned char iPort, unsigned char iUse, unsigned char iAffiliationType, BSTR * sServerSN, BSTR * sServerIP, long iServerPort)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_UI1 VTS_UI1 VTS_UI1 VTS_PBSTR VTS_PBSTR VTS_I4 ;
		InvokeHelper(0x600304bc, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, iPort, iUse, iAffiliationType, sServerSN, sServerIP, iServerPort);
		return result;
	}
	BOOL GetAreaCheckInOut(LPDISPATCH * objConnInfo, unsigned char iPort)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_UI1 ;
		InvokeHelper(0x600304bd, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, iPort);
		return result;
	}
	BOOL SetAreaLockInteraction(LPDISPATCH * objConnInfo, unsigned char iPort, unsigned char iUse, unsigned char iAffiliationType, BSTR * sServerSN, BSTR * sServerIP, long iServerPort)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_UI1 VTS_UI1 VTS_UI1 VTS_PBSTR VTS_PBSTR VTS_I4 ;
		InvokeHelper(0x600304be, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, iPort, iUse, iAffiliationType, sServerSN, sServerIP, iServerPort);
		return result;
	}
	BOOL GetAreaLockInteraction(LPDISPATCH * objConnInfo, unsigned char iPort)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_UI1 ;
		InvokeHelper(0x600304bf, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, iPort);
		return result;
	}
	BOOL SetAlarmOutputTime(LPDISPATCH * objConnInfo, unsigned char lTime)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_UI1 ;
		InvokeHelper(0x600304c0, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, lTime);
		return result;
	}
	BOOL GetAlarmOutputTime(LPDISPATCH * objConnInfo)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH ;
		InvokeHelper(0x600304c1, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo);
		return result;
	}
	BOOL ClearAllOpenData(LPDISPATCH * objConnInfo)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH ;
		InvokeHelper(0x600304c2, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo);
		return result;
	}
	VARIANT ClosePortAlarm(LPDISPATCH * objConnInfo, unsigned char iPort, unsigned char iType)
	{
		VARIANT result;
		static BYTE parms[] = VTS_PDISPATCH VTS_UI1 VTS_UI1 ;
		InvokeHelper(0x600304c3, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms, objConnInfo, iPort, iType);
		return result;
	}
	BOOL GetHolidayInfo(LPDISPATCH * objConnInfo)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH ;
		InvokeHelper(0x600304c4, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo);
		return result;
	}
	BOOL HolidayInfoHexToNum(LPCTSTR sHex, double * lMaxCount, double * lReocrdCount)
	{
		BOOL result;
		static BYTE parms[] = VTS_BSTR VTS_PR8 VTS_PR8 ;
		InvokeHelper(0x600304c5, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, sHex, lMaxCount, lReocrdCount);
		return result;
	}
	BOOL ClearHoliday(LPDISPATCH * objConnInfo)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH ;
		InvokeHelper(0x600304c6, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo);
		return result;
	}
	BOOL GetHoliday(LPDISPATCH * objConnInfo)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH ;
		InvokeHelper(0x600304c7, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo);
		return result;
	}
	BOOL WriteHoliday(LPDISPATCH * objConnInfo, LPDISPATCH * objHols)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_PDISPATCH ;
		InvokeHelper(0x600304c8, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, objHols);
		return result;
	}
	BOOL DeleteHoliday(LPDISPATCH * objConnInfo, LPDISPATCH * objHols)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_PDISPATCH ;
		InvokeHelper(0x600304c9, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, objHols);
		return result;
	}
	BOOL GetPasswordInfo(LPDISPATCH * objConnInfo)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH ;
		InvokeHelper(0x600304ca, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo);
		return result;
	}
	BOOL PasswordInfoHexToNum(LPCTSTR sHex, double * lMaxCount, double * lReocrdCount)
	{
		BOOL result;
		static BYTE parms[] = VTS_BSTR VTS_PR8 VTS_PR8 ;
		InvokeHelper(0x600304cb, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, sHex, lMaxCount, lReocrdCount);
		return result;
	}
	BOOL ClearPassword(LPDISPATCH * objConnInfo)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH ;
		InvokeHelper(0x600304cc, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo);
		return result;
	}
	BOOL GetPassword(LPDISPATCH * objConnInfo)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH ;
		InvokeHelper(0x600304cd, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo);
		return result;
	}
	BOOL WritePassword(LPDISPATCH * objConnInfo, LPDISPATCH * objPw)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_PDISPATCH ;
		InvokeHelper(0x600304ce, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, objPw);
		return result;
	}
	BOOL DeletePassword(LPDISPATCH * objConnInfo, LPDISPATCH * objPw)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_PDISPATCH ;
		InvokeHelper(0x600304cf, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, objPw);
		return result;
	}
	BOOL TestPassword(LPDISPATCH * objConnInfo, short iPort, LPCTSTR sPassword)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_I2 VTS_BSTR ;
		InvokeHelper(0x600304d0, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, iPort, sPassword);
		return result;
	}
	BOOL TestPassword_Ps(LPDISPATCH * objConnInfo, LPCTSTR sPassword1, LPCTSTR sPassword2, short iPort, LPCTSTR sPassword)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_BSTR VTS_BSTR VTS_I2 VTS_BSTR ;
		InvokeHelper(0x600304d1, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, sPassword1, sPassword2, iPort, sPassword);
		return result;
	}
	BOOL TestPassword_Elevator(LPDISPATCH * objConnInfo, short iPort, LPCTSTR sPassword, unsigned char lMode)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_I2 VTS_BSTR VTS_UI1 ;
		InvokeHelper(0x600304d2, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, iPort, sPassword, lMode);
		return result;
	}
	BOOL ClearTimeGroup(LPDISPATCH * objConnInfo)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH ;
		InvokeHelper(0x600304d3, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo);
		return result;
	}
	BOOL GetTimeGroup(LPDISPATCH * objConnInfo)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH ;
		InvokeHelper(0x600304d4, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo);
		return result;
	}
	BOOL WriteTimeGroup(LPDISPATCH * objConnInfo, LPDISPATCH * objTs)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_PDISPATCH ;
		InvokeHelper(0x600304d5, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, objTs);
		return result;
	}
	BOOL GetCardCount(LPDISPATCH * objConnInfo)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH ;
		InvokeHelper(0x600304d6, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo);
		return result;
	}
	BOOL CardCountInfoHexToNum(LPCTSTR sHex, double * lMaxCount, double * lCardCount, double * lSequenceCardMaxCount, double * lSequenceCardCount)
	{
		BOOL result;
		static BYTE parms[] = VTS_BSTR VTS_PR8 VTS_PR8 VTS_PR8 VTS_PR8 ;
		InvokeHelper(0x600304d7, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, sHex, lMaxCount, lCardCount, lSequenceCardMaxCount, lSequenceCardCount);
		return result;
	}
	BOOL ClearCard(LPDISPATCH * objConnInfo, long lMode)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_I4 ;
		InvokeHelper(0x600304d8, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, lMode);
		return result;
	}
	BOOL GetCards(LPDISPATCH * objConnInfo, long lMode)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_I4 ;
		InvokeHelper(0x600304d9, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, lMode);
		return result;
	}
	BOOL GetCardInfo(LPDISPATCH * objConnInfo, double dCard)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_R8 ;
		InvokeHelper(0x600304da, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, dCard);
		return result;
	}
	BOOL GetCardInfo_Mode(LPDISPATCH * objConnInfo, long lMode, double dCard)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_I4 VTS_R8 ;
		InvokeHelper(0x600304db, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, lMode, dCard);
		return result;
	}
	BOOL GetCardInfo_Hex(LPDISPATCH * objConnInfo, LPCTSTR sCard)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_BSTR ;
		InvokeHelper(0x600304dc, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, sCard);
		return result;
	}
	BOOL WriteUserCard(LPDISPATCH * objConnInfo, LPDISPATCH * objCards)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_PDISPATCH ;
		InvokeHelper(0x600304dd, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, objCards);
		return result;
	}
	BOOL WriteUserCard_Mode(LPDISPATCH * objConnInfo, LPDISPATCH * objCards, long lMode)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_PDISPATCH VTS_I4 ;
		InvokeHelper(0x600304de, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, objCards, lMode);
		return result;
	}
	BOOL DeleteUserCard(LPDISPATCH * objConnInfo, LPDISPATCH * objCards)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_PDISPATCH ;
		InvokeHelper(0x600304df, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, objCards);
		return result;
	}
	BOOL TestCard(LPDISPATCH * objConnInfo, short iPort, double dCard, LPCTSTR sPassword, long lMode)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_I2 VTS_R8 VTS_BSTR VTS_I4 ;
		InvokeHelper(0x600304e0, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, iPort, dCard, sPassword, lMode);
		return result;
	}
	BOOL TestCard_Ps(LPDISPATCH * objConnInfo, LPCTSTR sPassword1, LPCTSTR sPassword2, short iPort, double dCard, LPCTSTR sPassword, long lMode)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_BSTR VTS_BSTR VTS_I2 VTS_R8 VTS_BSTR VTS_I4 ;
		InvokeHelper(0x600304e1, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, sPassword1, sPassword2, iPort, dCard, sPassword, lMode);
		return result;
	}
	BOOL TestCard_Hex(LPDISPATCH * objConnInfo, LPCTSTR sPassword1, LPCTSTR sPassword2, short iPort, LPCTSTR sCard, LPCTSTR sPassword, long lMode)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_BSTR VTS_BSTR VTS_I2 VTS_BSTR VTS_BSTR VTS_I4 ;
		InvokeHelper(0x600304e2, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, sPassword1, sPassword2, iPort, sCard, sPassword, lMode);
		return result;
	}
	BOOL WriteSequenceCard(LPDISPATCH * objConnInfo, LPDISPATCH * objCards, BOOL bSort)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_PDISPATCH VTS_BOOL ;
		InvokeHelper(0x600304e3, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, objCards, bSort);
		return result;
	}
	BOOL GetRecordInfo(LPDISPATCH * objConnInfo)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH ;
		InvokeHelper(0x600304e4, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo);
		return result;
	}
	BOOL RecordInfoHexToNum(long lRecordCode, LPCTSTR sHex, long * lRecordMaxCount, double * lNewRecordCount, double * lRecordEndAddr, double * lUploadAddr, long * lReadAll)
	{
		BOOL result;
		static BYTE parms[] = VTS_I4 VTS_BSTR VTS_PI4 VTS_PR8 VTS_PR8 VTS_PR8 VTS_PI4 ;
		InvokeHelper(0x600304e5, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, lRecordCode, sHex, lRecordMaxCount, lNewRecordCount, lRecordEndAddr, lUploadAddr, lReadAll);
		return result;
	}
	BOOL ClearAllRecord(LPDISPATCH * objConnInfo)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH ;
		InvokeHelper(0x600304e6, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo);
		return result;
	}
	BOOL ClearRecordOnly(LPDISPATCH * objConnInfo, long lRecordType)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_I4 ;
		InvokeHelper(0x600304e7, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, lRecordType);
		return result;
	}
	BOOL UpdateReocrdFlag(LPDISPATCH * objConnInfo, long lRecordType, long lRecordFlay, BOOL bLoop)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_I4 VTS_I4 VTS_BOOL ;
		InvokeHelper(0x600304e8, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, lRecordType, lRecordFlay, bLoop);
		return result;
	}
	BOOL UpdateReocrdEndFlag(LPDISPATCH * objConnInfo, long lRecordType, long lRecordEndFlay)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_I4 VTS_I4 ;
		InvokeHelper(0x600304e9, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, lRecordType, lRecordEndFlay);
		return result;
	}
	BOOL RepairRecord(LPDISPATCH * objConnInfo, long lRecordType)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_I4 ;
		InvokeHelper(0x600304ea, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, lRecordType);
		return result;
	}
	BOOL GetRecordOnFlay(LPDISPATCH * objConnInfo, long lRecordType, long lBeginNum, long lReadCount)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_I4 VTS_I4 VTS_I4 ;
		InvokeHelper(0x600304eb, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, lRecordType, lBeginNum, lReadCount);
		return result;
	}
	BOOL ReadRecord(LPDISPATCH * objConnInfo, long lRecordType, long lReadCount)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_I4 VTS_I4 ;
		InvokeHelper(0x600304ec, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, lRecordType, lReadCount);
		return result;
	}
	BOOL SetICPar(LPDISPATCH * objConnInfo, short lSector, LPCTSTR sSectorPassword, unsigned char lCheckType, long lIDCode1, long lIDCode2, long lIDCode3, long lIDCode4)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_I2 VTS_BSTR VTS_UI1 VTS_I4 VTS_I4 VTS_I4 VTS_I4 ;
		InvokeHelper(0x600304ed, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, lSector, sSectorPassword, lCheckType, lIDCode1, lIDCode2, lIDCode3, lIDCode4);
		return result;
	}
	BOOL SetICParEx(LPDISPATCH * objConnInfo, LPDISPATCH oICSetting)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_DISPATCH ;
		InvokeHelper(0x600304ee, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, oICSetting);
		return result;
	}
	BOOL ReadICPar(LPDISPATCH * objConnInfo)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH ;
		InvokeHelper(0x600304ef, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo);
		return result;
	}
	BOOL GetBlacklistAlarm(LPDISPATCH * objConnInfo)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH ;
		InvokeHelper(0x600304f0, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo);
		return result;
	}
	BOOL SetBlacklistAlarm(LPDISPATCH * objConnInfo, BOOL bOpen)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_BOOL ;
		InvokeHelper(0x600304f1, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, bOpen);
		return result;
	}
	BOOL SetKeyboardManagePassword_IC(LPDISPATCH * objConnInfo, BOOL bUse, LPCTSTR sPassword)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_BOOL VTS_BSTR ;
		InvokeHelper(0x600304f2, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, bUse, sPassword);
		return result;
	}
	BOOL GetKeyboardManagePassword_IC(LPDISPATCH * objConnInfo)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH ;
		InvokeHelper(0x600304f3, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo);
		return result;
	}
	BOOL DisplayBuzzer(LPDISPATCH * objConnInfo)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH ;
		InvokeHelper(0x600304f4, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo);
		return result;
	}
	BOOL DisplayLEDFlashlight(LPDISPATCH * objConnInfo, BOOL bLight)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_BOOL ;
		InvokeHelper(0x600304f5, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, bLight);
		return result;
	}
	BOOL DisplayVibrator(LPDISPATCH * objConnInfo, long lTime)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_I4 ;
		InvokeHelper(0x600304f6, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, lTime);
		return result;
	}
	BOOL DisplayTestLCD(LPDISPATCH * objConnInfo, BOOL bDisplayAll)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_BOOL ;
		InvokeHelper(0x600304f7, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, bDisplayAll);
		return result;
	}
	BOOL DisplayPilotLamp(LPDISPATCH * objConnInfo, unsigned char lShowType)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_UI1 ;
		InvokeHelper(0x600304f8, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, lShowType);
		return result;
	}
	BOOL WriteSetCardPar(LPDISPATCH * objConnInfo, short lSector, LPCTSTR sSectorPassword, unsigned char lCheckType)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_I2 VTS_BSTR VTS_UI1 ;
		InvokeHelper(0x600304f9, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, lSector, sSectorPassword, lCheckType);
		return result;
	}
	BOOL GetSetCardPar(LPDISPATCH * objConnInfo)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH ;
		InvokeHelper(0x600304fa, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo);
		return result;
	}
	BOOL DateOfManufacture(LPDISPATCH * objConnInfo)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH ;
		InvokeHelper(0x600304fb, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo);
		return result;
	}
	BOOL GetDateOfManufacture(LPDISPATCH * objConnInfo)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH ;
		InvokeHelper(0x600304fc, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo);
		return result;
	}
	BOOL SetDateOfManufacture(LPDISPATCH * objConnInfo, DATE oDate)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_DATE ;
		InvokeHelper(0x600304fd, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, oDate);
		return result;
	}
	BOOL GetWorkHold(LPDISPATCH * objConnInfo)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH ;
		InvokeHelper(0x600304fe, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo);
		return result;
	}
	BOOL SetWorkHold(LPDISPATCH * objConnInfo, unsigned char lTime)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_UI1 ;
		InvokeHelper(0x600304ff, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, lTime);
		return result;
	}
	BOOL GetLEDHold(LPDISPATCH * objConnInfo)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH ;
		InvokeHelper(0x60030500, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo);
		return result;
	}
	BOOL SetLEDHold(LPDISPATCH * objConnInfo, unsigned char lTime)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_UI1 ;
		InvokeHelper(0x60030501, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, lTime);
		return result;
	}
	void SendTCPData(LPDISPATCH * objConnInfo, SAFEARRAY * * bData)
	{
		static BYTE parms[] = VTS_PDISPATCH VTS_UNKNOWN ;
		InvokeHelper(0x60030502, DISPATCH_METHOD, VT_EMPTY, NULL, parms, objConnInfo, bData);
	}
	BOOL WriteCardManagePar(LPDISPATCH * objConnInfo, BOOL bUser, LPCTSTR sSectorPassword, LPCTSTR sCheck)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_BOOL VTS_BSTR VTS_BSTR ;
		InvokeHelper(0x60030503, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, bUser, sSectorPassword, sCheck);
		return result;
	}
	BOOL GetCardManagePar(LPDISPATCH * objConnInfo)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH ;
		InvokeHelper(0x60030504, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo);
		return result;
	}
	BOOL WriteReaderTitle(LPDISPATCH * objConnInfo, LPCTSTR sTitle)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_BSTR ;
		InvokeHelper(0x60030505, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, sTitle);
		return result;
	}
	BOOL ReadReaderTitle(LPDISPATCH * objConnInfo)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH ;
		InvokeHelper(0x60030506, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo);
		return result;
	}
	BOOL WriteReaderName(LPDISPATCH * objConnInfo, LPCTSTR sName)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_BSTR ;
		InvokeHelper(0x60030507, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, sName);
		return result;
	}
	BOOL ReadReaderName(LPDISPATCH * objConnInfo)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH ;
		InvokeHelper(0x60030508, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo);
		return result;
	}
	BOOL SetAlarmEvent(LPDISPATCH * objConnInfo, short lType, unsigned char lPort)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_I2 VTS_UI1 ;
		InvokeHelper(0x60030509, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, lType, lPort);
		return result;
	}
	BOOL SetAlarmEventEx(LPDISPATCH * objConnInfo, short lType, long lColumn, unsigned char lPort)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_I2 VTS_I4 VTS_UI1 ;
		InvokeHelper(0x6003050a, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, lType, lColumn, lPort);
		return result;
	}
	BOOL SetCardReturn(LPDISPATCH * objConnInfo, short lType, DATE oDate, unsigned char lPort)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_I2 VTS_DATE VTS_UI1 ;
		InvokeHelper(0x6003050b, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, lType, oDate, lPort);
		return result;
	}
	BOOL SetCardReturnEx(LPDISPATCH * objConnInfo, short lType, DATE oDate, long lColumn, unsigned char lPort)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_I2 VTS_DATE VTS_I4 VTS_UI1 ;
		InvokeHelper(0x6003050c, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, lType, oDate, lColumn, lPort);
		return result;
	}
	BOOL SetReaderWork(LPDISPATCH * objConnInfo, unsigned char iLED, unsigned char iBuzz)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_UI1 VTS_UI1 ;
		InvokeHelper(0x6003050d, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, iLED, iBuzz);
		return result;
	}
	BOOL SetReaderStateCheck(LPDISPATCH * objConnInfo, BOOL bUse)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_BOOL ;
		InvokeHelper(0x6003050e, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, bUse);
		return result;
	}
	BOOL GetReaderStateCheck(LPDISPATCH * objConnInfo)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH ;
		InvokeHelper(0x6003050f, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo);
		return result;
	}
	BOOL SetReaderInfo(LPDISPATCH * objConnInfo, BOOL iAddr, BOOL bUse, double dCard)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_BOOL VTS_BOOL VTS_R8 ;
		InvokeHelper(0x60030510, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, iAddr, bUse, dCard);
		return result;
	}
	BOOL GetReaderInfo(LPDISPATCH * objConnInfo, BOOL iAddr)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_BOOL ;
		InvokeHelper(0x60030511, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, iAddr);
		return result;
	}
	BOOL SetReaderInfoEx(LPDISPATCH * objConnInfo, unsigned char iAddr, BOOL bUse, double dCard)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_UI1 VTS_BOOL VTS_R8 ;
		InvokeHelper(0x60030512, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, iAddr, bUse, dCard);
		return result;
	}
	BOOL GetReaderInfoEx(LPDISPATCH * objConnInfo, unsigned char iAddr)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_UI1 ;
		InvokeHelper(0x60030513, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, iAddr);
		return result;
	}
	BOOL CheckReaderState(LPDISPATCH * objConnInfo, unsigned char iAddr)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_UI1 ;
		InvokeHelper(0x60030514, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, iAddr);
		return result;
	}
	BOOL GetReaderInfoAll(LPDISPATCH * objConnInfo)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH ;
		InvokeHelper(0x60030515, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo);
		return result;
	}
	BOOL SetLEDReader(LPDISPATCH * objConnInfo, BOOL bUse)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_BOOL ;
		InvokeHelper(0x60030516, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, bUse);
		return result;
	}
	BOOL GetLEDReader(LPDISPATCH * objConnInfo)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH ;
		InvokeHelper(0x60030517, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo);
		return result;
	}
	BOOL SetOpenDoorOrder(LPDISPATCH * objConnInfo, BOOL bUse)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_BOOL ;
		InvokeHelper(0x60030518, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, bUse);
		return result;
	}
	BOOL GetOpenDoorOrder(LPDISPATCH * objConnInfo)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH ;
		InvokeHelper(0x60030519, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo);
		return result;
	}
	BOOL SetColumnName(LPDISPATCH * objConnInfo, SAFEARRAY * * iColumnName)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_UNKNOWN ;
		InvokeHelper(0x6003051a, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, iColumnName);
		return result;
	}
	BOOL GetColumnName(LPDISPATCH * objConnInfo)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH ;
		InvokeHelper(0x6003051b, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo);
		return result;
	}
	BOOL UploadFontLib(LPDISPATCH * objConnInfo, long lFlashAddr, short iDataLen, SAFEARRAY * * bData)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_I4 VTS_I2 VTS_UNKNOWN ;
		InvokeHelper(0x6003051c, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, lFlashAddr, iDataLen, bData);
		return result;
	}
	BOOL ReadFlashData(LPDISPATCH * objConnInfo, long lFlashAddr, short iDataLen)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_I4 VTS_I2 ;
		InvokeHelper(0x6003051d, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, lFlashAddr, iDataLen);
		return result;
	}
	BOOL SendDataHex(LPDISPATCH * objConnInfo, LPCTSTR sDataHex)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_BSTR ;
		InvokeHelper(0x6003051e, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, sDataHex);
		return result;
	}
	BOOL SendDataBytes(LPDISPATCH * objConnInfo, SAFEARRAY * * bData)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_UNKNOWN ;
		InvokeHelper(0x6003051f, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, bData);
		return result;
	}
	BOOL GetGPRSSN(LPDISPATCH * objConnInfo)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH ;
		InvokeHelper(0x60030520, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo);
		return result;
	}
	BOOL SetGPRSSN(LPDISPATCH * objConnInfo, LPCTSTR sSN)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_BSTR ;
		InvokeHelper(0x60030521, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, sSN);
		return result;
	}
	BOOL GetGPRSPassword(LPDISPATCH * objConnInfo)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH ;
		InvokeHelper(0x60030522, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo);
		return result;
	}
	BOOL SetGPRSPassword(LPDISPATCH * objConnInfo, LPCTSTR sPassword)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_BSTR ;
		InvokeHelper(0x60030523, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, sPassword);
		return result;
	}
	BOOL ClearGPRSPassword(LPDISPATCH * objConnInfo)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH ;
		InvokeHelper(0x60030524, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo);
		return result;
	}
	BOOL GetGPRSServerInfo(LPDISPATCH * objConnInfo)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH ;
		InvokeHelper(0x60030525, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo);
		return result;
	}
	BOOL SetGPRSServerInfo(LPDISPATCH * objConnInfo, LPCTSTR sAddr, LPCTSTR bIP, long lPort)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_BSTR VTS_BSTR VTS_I4 ;
		InvokeHelper(0x60030526, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, sAddr, bIP, lPort);
		return result;
	}
	BOOL GetTCLClientList(LPDISPATCH * objConnInfo, BOOL bUDP)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_BOOL ;
		InvokeHelper(0x60030527, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, bUDP);
		return result;
	}
	BOOL CloseClient(LPDISPATCH * objConnInfo, LPCTSTR bIP, long lPort, BOOL bUDP)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_BSTR VTS_I4 VTS_BOOL ;
		InvokeHelper(0x60030528, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, bIP, lPort, bUDP);
		return result;
	}
	BOOL CloseClientAll(LPDISPATCH * objConnInfo, BOOL bUDP)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_BOOL ;
		InvokeHelper(0x60030529, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, bUDP);
		return result;
	}
	BOOL ReadCheckStoreyType(LPDISPATCH * objConnInfo)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH ;
		InvokeHelper(0x6003052a, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo);
		return result;
	}
	BOOL WriteCheckStoreyType(LPDISPATCH * objConnInfo, unsigned char iType)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_UI1 ;
		InvokeHelper(0x6003052b, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, iType);
		return result;
	}
	BOOL ReadWorkType(LPDISPATCH * objConnInfo)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH ;
		InvokeHelper(0x6003052c, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo);
		return result;
	}
	BOOL WriteWorkType(LPDISPATCH * objConnInfo, unsigned char iType)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_UI1 ;
		InvokeHelper(0x6003052d, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, iType);
		return result;
	}
	BOOL ReadWorkPar(LPDISPATCH * objConnInfo)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH ;
		InvokeHelper(0x6003052e, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo);
		return result;
	}
	BOOL WriteWorkPar(LPDISPATCH * objConnInfo, long lCallWaitTime, long lStayTime, unsigned char lCallRelayTime, long lWaitElevatorTime, long lMaxRepeat, unsigned char iAutoPressButton)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_I4 VTS_I4 VTS_UI1 VTS_I4 VTS_I4 VTS_UI1 ;
		InvokeHelper(0x6003052f, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, lCallWaitTime, lStayTime, lCallRelayTime, lWaitElevatorTime, lMaxRepeat, iAutoPressButton);
		return result;
	}
	BOOL ReadPortElevator(LPDISPATCH * objConnInfo, unsigned char iPort)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_UI1 ;
		InvokeHelper(0x60030530, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, iPort);
		return result;
	}
	BOOL WritePortElevator(LPDISPATCH * objConnInfo, unsigned char iPort, LPCTSTR sSN, LPCTSTR sPassword, unsigned char iElevatorType, SAFEARRAY * * bPortList)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_UI1 VTS_BSTR VTS_BSTR VTS_UI1 VTS_UNKNOWN ;
		InvokeHelper(0x60030531, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, iPort, sSN, sPassword, iElevatorType, bPortList);
		return result;
	}
	BOOL ReadImportTable(LPDISPATCH * objConnInfo)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH ;
		InvokeHelper(0x60030532, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo);
		return result;
	}
	BOOL WriteImportTable(LPDISPATCH * objConnInfo, SAFEARRAY * * bPortList)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_UNKNOWN ;
		InvokeHelper(0x60030533, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, bPortList);
		return result;
	}
	BOOL ReadIntercomProtocol(LPDISPATCH * objConnInfo, unsigned char iNum)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_UI1 ;
		InvokeHelper(0x60030534, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, iNum);
		return result;
	}
	BOOL WriteIntercomProtocol(LPDISPATCH * objConnInfo, unsigned char iNum, unsigned char iUse, unsigned char iProBeginFlgLen, BSTR * sProBeginFlgData, unsigned char iProData1Len, unsigned char iProStoreyLen, unsigned char iProStoreyType, unsigned char iProData2Len, unsigned char iChecksumLen, unsigned char iChkType, unsigned char iProEndFlgLen, BSTR * sProEndFlgData)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_UI1 VTS_UI1 VTS_UI1 VTS_PBSTR VTS_UI1 VTS_UI1 VTS_UI1 VTS_UI1 VTS_UI1 VTS_UI1 VTS_UI1 VTS_PBSTR ;
		InvokeHelper(0x60030535, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, iNum, iUse, iProBeginFlgLen, sProBeginFlgData, iProData1Len, iProStoreyLen, iProStoreyType, iProData2Len, iChecksumLen, iChkType, iProEndFlgLen, sProEndFlgData);
		return result;
	}
	BOOL ReadCOMRate(LPDISPATCH * objConnInfo)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH ;
		InvokeHelper(0x60030536, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo);
		return result;
	}
	BOOL WriteCOMRate(LPDISPATCH * objConnInfo, LPCTSTR sRate)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH VTS_BSTR ;
		InvokeHelper(0x60030537, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo, sRate);
		return result;
	}
	BOOL GetExtensionStatus(LPDISPATCH * objConnInfo)
	{
		BOOL result;
		static BYTE parms[] = VTS_PDISPATCH ;
		InvokeHelper(0x60030579, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, objConnInfo);
		return result;
	}
	CString AscToStr(LPCTSTR strAsc)
	{
		CString result;
		static BYTE parms[] = VTS_BSTR ;
		InvokeHelper(0x60030538, DISPATCH_METHOD, VT_BSTR, (void*)&result, parms, strAsc);
		return result;
	}
	CString StrToAsc(LPCTSTR strChr)
	{
		CString result;
		static BYTE parms[] = VTS_BSTR ;
		InvokeHelper(0x60030539, DISPATCH_METHOD, VT_BSTR, (void*)&result, parms, strChr);
		return result;
	}
	CString ByteToHex(SAFEARRAY * * bData)
	{
		CString result;
		static BYTE parms[] = VTS_UNKNOWN ;
		InvokeHelper(0x6003053a, DISPATCH_METHOD, VT_BSTR, (void*)&result, parms, bData);
		return result;
	}
	SAFEARRAY * HexToByte(LPCTSTR sHex)
	{
		static BYTE parms[] = VTS_BSTR ;
		InvokeHelper(0x6003053b, DISPATCH_METHOD, VT_EMPTY, NULL, parms, sHex);
	}
	BOOL CallSubByName(LPCTSTR sSubName, long lEquptType, LPDISPATCH * objConnInfo, SAFEARRAY * * oParList)
	{
		BOOL result;
		static BYTE parms[] = VTS_BSTR VTS_I4 VTS_PDISPATCH VTS_UNKNOWN ;
		InvokeHelper(0x6003053c, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, sSubName, lEquptType, objConnInfo, oParList);
		return result;
	}
	LPDISPATCH AchieveValuetoList(LPDISPATCH * objConnInfo, short iFunc, LPCTSTR sValue)
	{
		LPDISPATCH result;
		static BYTE parms[] = VTS_PDISPATCH VTS_I2 VTS_BSTR ;
		InvokeHelper(0x6003053d, DISPATCH_METHOD, VT_DISPATCH, (void*)&result, parms, objConnInfo, iFunc, sValue);
		return result;
	}
	long GetCmdFileCount()
	{
		long result;
		InvokeHelper(0x60030540, DISPATCH_METHOD, VT_I4, (void*)&result, NULL);
		return result;
	}
	VARIANT ClearCmdFile()
	{
		VARIANT result;
		InvokeHelper(0x60030541, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
		return result;
	}
	SAFEARRAY * GetCmdFileByte()
	{
		InvokeHelper(0x60030542, DISPATCH_METHOD, VT_EMPTY, NULL, NULL);
	}
	SAFEARRAY * GetCmdFileByteEx(long * lDataLen, long * lFrameCount)
	{
		static BYTE parms[] = VTS_PI4 VTS_PI4 ;
		InvokeHelper(0x60030543, DISPATCH_METHOD, VT_EMPTY, NULL, parms, lDataLen, lFrameCount);
	}
	BOOL CommandDecrypt(LPCTSTR sKey, LPCTSTR sDataHex, SAFEARRAY * * bRetDecrypet)
	{
		BOOL result;
		static BYTE parms[] = VTS_BSTR VTS_BSTR VTS_UNKNOWN ;
		InvokeHelper(0x60030556, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, sKey, sDataHex, bRetDecrypet);
		return result;
	}
	BOOL CommandDecryptHEX(LPCTSTR sKey, LPCTSTR sDataHex, BSTR * sRetDecrypetHex)
	{
		BOOL result;
		static BYTE parms[] = VTS_BSTR VTS_BSTR VTS_PBSTR ;
		InvokeHelper(0x60030557, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, sKey, sDataHex, sRetDecrypetHex);
		return result;
	}
	BOOL DecryptWatchValue(LPCTSTR sKey, LPCTSTR sEncryptHex, short * iWatchType, BSTR * bDecrypetHex)
	{
		BOOL result;
		static BYTE parms[] = VTS_BSTR VTS_BSTR VTS_PI2 VTS_PBSTR ;
		InvokeHelper(0x60030569, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms, sKey, sEncryptHex, iWatchType, bDecrypetHex);
		return result;
	}
	long AddEventCallblack(LPDISPATCH * oEvent)
	{
		long result;
		static BYTE parms[] = VTS_PDISPATCH ;
		InvokeHelper(0x6003058b, DISPATCH_METHOD, VT_I4, (void*)&result, parms, oEvent);
		return result;
	}
	void DeleteEventCallblack(LPDISPATCH * oEvent)
	{
		static BYTE parms[] = VTS_PDISPATCH ;
		InvokeHelper(0x6003058c, DISPATCH_METHOD, VT_EMPTY, NULL, parms, oEvent);
	}


};

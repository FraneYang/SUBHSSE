// CDriveHolidayLists.h : �� Microsoft Visual C++ ������ ActiveX �ؼ���װ���������

#pragma once

/////////////////////////////////////////////////////////////////////////////
// CDriveHolidayLists

class CDriveHolidayLists : public COleDispatchDriver
{
public:
	CDriveHolidayLists() {}		// ���� COleDispatchDriver Ĭ�Ϲ��캯��
	CDriveHolidayLists(LPDISPATCH pDispatch) : COleDispatchDriver(pDispatch) {}
	CDriveHolidayLists(const CDriveHolidayLists& dispatchSrc) : COleDispatchDriver(dispatchSrc) {}

// ����
public:

// ����
public:

	LPDISPATCH Add(BSTR * sKey)
	{
		LPDISPATCH result;
		static BYTE parms[] = VTS_PBSTR ;
		InvokeHelper(0x60030001, DISPATCH_METHOD, VT_DISPATCH, (void*)&result, parms, sKey);
		return result;
	}
	LPDISPATCH get_Item(VARIANT * vntIndexKey)
	{
		LPDISPATCH result;
		static BYTE parms[] = VTS_PVARIANT ;
		InvokeHelper(0x0, DISPATCH_PROPERTYGET, VT_DISPATCH, (void*)&result, parms, vntIndexKey);
		return result;
	}
	long get_Count()
	{
		long result;
		InvokeHelper(0x68030000, DISPATCH_PROPERTYGET, VT_I4, (void*)&result, NULL);
		return result;
	}
	void Remove(VARIANT * vntIndexKey)
	{
		static BYTE parms[] = VTS_PVARIANT ;
		InvokeHelper(0x60030002, DISPATCH_METHOD, VT_EMPTY, NULL, parms, vntIndexKey);
	}
	LPUNKNOWN get_NewEnum()
	{
		LPUNKNOWN result;
		InvokeHelper(0xfffffffc, DISPATCH_PROPERTYGET, VT_UNKNOWN, (void*)&result, NULL);
		return result;
	}


};

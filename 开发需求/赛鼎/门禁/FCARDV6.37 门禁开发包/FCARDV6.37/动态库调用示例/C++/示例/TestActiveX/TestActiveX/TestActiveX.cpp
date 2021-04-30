
// TestActiveX.cpp : ����Ӧ�ó��������Ϊ��
//

#include "stdafx.h"
#include "TestActiveX.h"
#include "TestActiveXDlg.h"
#include "CClsICSectorSetting.h"
#include "CDriveCard.h"
#include "CDriveCardLists.h"
#include "CDriveCommandEvent.h"
#include "CDriveCommandFile.h"
#include "CDriveHoliday.h"
#include "CDriveHolidayLists.h"
#include "CDriveInfo.h"
#include "CDriveMain.h"
#include "CDrivePassword.h"
#include "CDrivePasswordLists.h"
#include "CDrivePortList.h"
#include "CDriveRecord.h"
#include "CDriveRecordLists.h"
#include "CDriveTCPInfo.h"
#include "CDriveTimeGroup.h"
#include "CDriveTimeGroupLists.h"
#include "CDriveValueList.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#endif


// CTestActiveXApp

BEGIN_MESSAGE_MAP(CTestActiveXApp, CWinApp)
	ON_COMMAND(ID_HELP, &CWinApp::OnHelp)
END_MESSAGE_MAP()


// CTestActiveXApp ����

CTestActiveXApp::CTestActiveXApp()
{
	// ֧����������������
	m_dwRestartManagerSupportFlags = AFX_RESTART_MANAGER_SUPPORT_RESTART;

	// TODO: �ڴ˴���ӹ�����룬
	// ��������Ҫ�ĳ�ʼ�������� InitInstance ��
}


// Ψһ��һ�� CTestActiveXApp ����

CTestActiveXApp theApp;


// CTestActiveXApp ��ʼ��

BOOL CTestActiveXApp::InitInstance()
{
	// ���һ�������� Windows XP �ϵ�Ӧ�ó����嵥ָ��Ҫ
	// ʹ�� ComCtl32.dll �汾 6 ����߰汾�����ÿ��ӻ���ʽ��
	//����Ҫ InitCommonControlsEx()��  ���򣬽��޷��������ڡ�
	INITCOMMONCONTROLSEX InitCtrls;
	InitCtrls.dwSize = sizeof(InitCtrls);
	// ��������Ϊ��������Ҫ��Ӧ�ó�����ʹ�õ�
	// �����ؼ��ࡣ
	InitCtrls.dwICC = ICC_WIN95_CLASSES;
	InitCommonControlsEx(&InitCtrls);

	CWinApp::InitInstance();


	AfxEnableControlContainer();


	// ��׼��ʼ��
	// ���δʹ����Щ���ܲ�ϣ����С
	// ���տ�ִ���ļ��Ĵ�С����Ӧ�Ƴ�����
	// ����Ҫ���ض���ʼ������
	// �������ڴ洢���õ�ע�����
	// TODO: Ӧ�ʵ��޸ĸ��ַ�����
	// �����޸�Ϊ��˾����֯��
	SetRegistryKey(_T("Ӧ�ó��������ɵı���Ӧ�ó���"));

	CTestActiveXDlg dlg;
	m_pMainWnd = &dlg;
	INT_PTR nResponse = dlg.DoModal();
	if (nResponse == IDOK)
	{
		// TODO: �ڴ˷��ô����ʱ��
		//  ��ȷ�������رնԻ���Ĵ���
	}
	else if (nResponse == IDCANCEL)
	{
		// TODO: �ڴ˷��ô����ʱ��
		//  ��ȡ�������رնԻ���Ĵ���
	}
	else if (nResponse == -1)
	{
		TRACE(traceAppMsg, 0, "����: �Ի��򴴽�ʧ�ܣ�Ӧ�ó���������ֹ��\n");
	}


	// ���ڶԻ����ѹرգ����Խ����� FALSE �Ա��˳�Ӧ�ó���
	//  ����������Ӧ�ó������Ϣ�á�
	return FALSE;
}


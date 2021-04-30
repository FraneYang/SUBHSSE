// BasicTimeDlg.cpp : ʵ���ļ�
//

#include "stdafx.h"
#include "VzFaceSDKDemo.h"
#include "BasicTimeDlg.h"
#include "afxdialogex.h"


// CBasicTimeDlg �Ի���

IMPLEMENT_DYNAMIC(CBasicTimeDlg, CDialogEx)

CBasicTimeDlg::CBasicTimeDlg(VzLPRClientHandle cam, CWnd* pParent /*=NULL*/)
	: CDialogEx(CBasicTimeDlg::IDD, pParent)
{
	m_cam = cam;
}

CBasicTimeDlg::~CBasicTimeDlg()
{
}

void CBasicTimeDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialogEx::DoDataExchange(pDX);

	DDX_Control(pDX, IDC_DATETIMEPICKER1, m_DataCtrl);
	DDX_Control(pDX, IDC_DATETIMEPICKER2, m_TimeCtrl);
	DDX_Control(pDX, IDC_DATETIMEPICKER4, m_LocalTimeCtrl);
	DDX_Control(pDX, IDC_DATETIMEPICKER6, m_DeviceTimeCtrl);
	DDX_Control(pDX, IDC_DATETIMEPICKER5, m_datadev);
}


BEGIN_MESSAGE_MAP(CBasicTimeDlg, CDialogEx)
	ON_BN_CLICKED(IDC_BTN_LOCADLOCAL, &CBasicTimeDlg::OnBnClickedBtnLocadlocal)
	ON_WM_TIMER()
	ON_BN_CLICKED(IDC_BTN_LOCAL, &CBasicTimeDlg::OnBnClickedBtnLocal)
	ON_BN_CLICKED(IDC_BTN_TIME, &CBasicTimeDlg::OnBnClickedBtnTime)
	ON_WM_SHOWWINDOW()
	ON_BN_CLICKED(IDC_CHECK1, &CBasicTimeDlg::OnBnClickedCheck1)
END_MESSAGE_MAP()


// CBasicTimeDlg ��Ϣ�������


void CBasicTimeDlg::OnBnClickedBtnLocadlocal()
{
	// TODO:  �ڴ���ӿؼ�֪ͨ����������
	int nTime;
	ZBX_GetSysTime(m_cam, &nTime);
	CTime time(nTime);
	m_DeviceTimeCtrl.SetTime(&time);
	m_datadev.SetTime(&time);
}


BOOL CBasicTimeDlg::OnInitDialog()
{
	CDialogEx::OnInitDialog();

	// TODO:  �ڴ���Ӷ���ĳ�ʼ��

	int nSystime = GetPrivateProfileInt("SET", "AutoSyncTime", 0, ".\\Demo.ini");
	if (nSystime)
	{
		((CButton*)GetDlgItem(IDC_CHECK1))->SetCheck(TRUE);
		SYSTEMTIME T;
		GetLocalTime(&T);
		ZBX_SetSysTimeEx(m_cam, T.wYear, T.wMonth, T.wDay, T.wHour, T.wMinute, T.wSecond);
	}
	return TRUE;  // return TRUE unless you set the focus to a control
	// �쳣:  OCX ����ҳӦ���� FALSE
}


void CBasicTimeDlg::OnTimer(UINT_PTR nIDEvent)
{
	// TODO:  �ڴ������Ϣ�����������/�����Ĭ��ֵ
	if ((!m_DeviceTimeCtrl) || (!m_LocalTimeCtrl))
	{
		return;
	}
	SYSTEMTIME tLocal, tdevice;
	CTime time;
	int nTime;
	switch (nIDEvent)
	{
	case DEVICE_TIME:
		if (m_DeviceTimeIdex == 5)
		{
			m_DeviceTimeIdex = 0;
			ZBX_GetSysTime(m_cam, &nTime);
			time = nTime;

			m_DeviceTimeCtrl.SetTime(&time);
			m_datadev.SetTime(&time);

		}
		else
		{
			m_DeviceTimeCtrl.GetTime(time);
			time += 1;
			m_DeviceTimeCtrl.SetTime(&time);
			m_DeviceTimeIdex++;
		}

		break;
	case LOCALTIME:

		GetLocalTime(&tLocal);
		m_LocalTimeCtrl.SetTime(tLocal);
		break;
	default:
		break;
	}
	CDialogEx::OnTimer(nIDEvent);
}


void CBasicTimeDlg::OnBnClickedBtnLocal()
{
	// TODO:  �ڴ���ӿؼ�֪ͨ����������
	SYSTEMTIME T;
	GetLocalTime(&T);
	int ret = ZBX_SetSysTimeEx(m_cam, T.wYear, T.wMonth, T.wDay, T.wHour, T.wMinute, T.wSecond);
	if (ret == 0)
	{
		AfxMessageBox("���óɹ�");
	}
	else
	{
		AfxMessageBox("����ʧ��");
	}
	m_DeviceTimeCtrl.SetTime(T);
}


void CBasicTimeDlg::OnBnClickedBtnTime()
{
	// TODO:  �ڴ���ӿؼ�֪ͨ����������
	CTime cdata, ctame;
	m_DataCtrl.GetTime(cdata);
	m_TimeCtrl.GetTime(ctame);
	int ret = ZBX_SetSysTimeEx(m_cam, cdata.GetYear(), cdata.GetMonth(), cdata.GetDay(), ctame.GetHour(), ctame.GetMinute(), ctame.GetSecond());
	if (ret == 0)
	{
		AfxMessageBox("���óɹ�");
		m_DeviceTimeCtrl.SetTime(&ctame);
	}
	else
	{
		AfxMessageBox("����ʧ��");
	}
}


void CBasicTimeDlg::OnShowWindow(BOOL bShow, UINT nStatus)
{
	CDialogEx::OnShowWindow(bShow, nStatus);
	if (bShow)
	{
		SetTimer(DEVICE_TIME, 1000, NULL);
		SetTimer(LOCALTIME, 1000, NULL);
	}
	// TODO:  �ڴ˴������Ϣ����������
}


void CBasicTimeDlg::OnBnClickedCheck1()
{
	// TODO:  �ڴ���ӿؼ�֪ͨ����������
	int nUIData = ((CButton*)GetDlgItem(IDC_CHECK1))->GetCheck();
	CString strTmp;
	strTmp.Format("%d", nUIData);
	WritePrivateProfileStringA("SET", "AutoSyncTime", strTmp, ".\\Demo.ini");
}


BOOL CBasicTimeDlg::PreTranslateMessage(MSG* pMsg)
{
	// TODO:  �ڴ����ר�ô����/����û���
	if (pMsg->message == WM_KEYDOWN)	{
		switch (pMsg->wParam)		{
		case VK_ESCAPE: //Esc�����¼�				
			return true;
		case VK_RETURN: //Enter�����¼�				
			return true;
		default:
			;
		}
	}
	return CDialogEx::PreTranslateMessage(pMsg);
}

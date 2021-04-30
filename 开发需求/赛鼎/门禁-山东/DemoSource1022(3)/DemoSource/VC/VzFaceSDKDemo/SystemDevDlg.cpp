// SystemDevDlg.cpp : ʵ���ļ�
//

#include "stdafx.h"
#include "VzFaceSDKDemo.h"
#include "SystemDevDlg.h"
#include "afxdialogex.h"


// CSystemDevDlg �Ի���

IMPLEMENT_DYNAMIC(CSystemDevDlg, CDialogEx)

CSystemDevDlg::CSystemDevDlg(VzLPRClientHandle cam, CWnd* pParent /*=NULL*/)
	: CDialogEx(CSystemDevDlg::IDD, pParent)
{
	m_cam = cam;
}

CSystemDevDlg::~CSystemDevDlg()
{
}

void CSystemDevDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialogEx::DoDataExchange(pDX);
	DDX_Control(pDX, IDC_TIME, m_RebootTime);
}


BEGIN_MESSAGE_MAP(CSystemDevDlg, CDialogEx)
	ON_BN_CLICKED(IDC_BTN_REBOOT, &CSystemDevDlg::OnBnClickedBtnReboot)
	ON_BN_CLICKED(IDC_BUTTON5, &CSystemDevDlg::OnBnClickedButton5)
	ON_BN_CLICKED(IDC_BTN_AGING, &CSystemDevDlg::OnBnClickedBtnAging)
	ON_BN_CLICKED(IDC_BTN_SAVE, &CSystemDevDlg::OnBnClickedBtnSave)
	ON_BN_CLICKED(IDC_BTN_GET, &CSystemDevDlg::OnBnClickedBtnGet)
	ON_BN_CLICKED(IDC_RADIO_TYPE1, &CSystemDevDlg::OnBnClickedRadioType1)
	ON_BN_CLICKED(IDC_RADIO_TYPE2, &CSystemDevDlg::OnBnClickedRadioType2)
	ON_BN_CLICKED(IDC_RADIO_TYPE3, &CSystemDevDlg::OnBnClickedRadioType3)
	ON_BN_CLICKED(IDC_BTN_WORKTYPE_SET2, &CSystemDevDlg::OnBnClickedBtnWorktypeSet2)
	ON_BN_CLICKED(IDC_BTN_WORKTYPE_READ2, &CSystemDevDlg::OnBnClickedBtnWorktypeRead2)
END_MESSAGE_MAP()


// CSystemDevDlg ��Ϣ�������


void CSystemDevDlg::OnBnClickedBtnReboot()
{
	// TODO:  �ڴ���ӿؼ�֪ͨ����������
	if (IDOK == MessageBox("�豸���������У�ȷ�������豸�� ", "����", MB_OKCANCEL))
	{
		ZBX_RebootCam(m_cam);
		AfxMessageBox("�豸��ʼ����������");
	};
}


void CSystemDevDlg::OnBnClickedButton5()
{
	// TODO:  �ڴ���ӿؼ�֪ͨ����������
	OnBnClickedBtnAging();
}

BOOL CSystemDevDlg::OnInitDialog()
{
	CDialogEx::OnInitDialog();

	// TODO:  �ڴ���Ӷ���ĳ�ʼ��
	int nRet = ZBX_GetAging(m_cam, &m_nAdingStatus);
	if (m_nAdingStatus)
	{
		GetDlgItem(IDC_BTN_AGING)->SetWindowTextA("ֹͣ�ϻ�");
		m_nAdingStatus = 0;
	}
	else
	{
		m_nAdingStatus = 1;
	}
	//2019/01/01 4:0:0
	CTime t(1546286400);
	m_RebootTime.SetTime(&t);
	OnGetWorkType(false);
	OnGetRebootTime(false);
	return TRUE;  // return TRUE unless you set the focus to a control
	// �쳣:  OCX ����ҳӦ���� FALSE
}


void CSystemDevDlg::OnBnClickedBtnAging()
{
	// TODO:  �ڴ���ӿؼ�֪ͨ����������
	ZBX_SetAging(m_cam, m_nAdingStatus);
	
	
	if (m_nAdingStatus==1){
		m_nAdingStatus = 0;
	}
	else
	{
		m_nAdingStatus = 0;
	}
	CString str;
	GetDlgItem(IDC_BTN_AGING)->GetWindowTextA(str);
	if (str=="��ʼ�ϻ�")
	{
		GetDlgItem(IDC_BTN_AGING)->SetWindowTextA("ֹͣ�ϻ�");
		AfxMessageBox("��ʼ�ϻ�");
	}
	else
	{
		GetDlgItem(IDC_BTN_AGING)->SetWindowTextA("��ʼ�ϻ�");
		AfxMessageBox("ֹͣ�ϻ�");
	}
}


void CSystemDevDlg::OnBnClickedBtnSave()
{
	// TODO:  �ڴ���ӿؼ�֪ͨ����������
	SYSTEMTIME t;
	m_RebootTime.GetTime(&t);
	bool bCheck = ((CButton*)GetDlgItem(IDC_CHECK1))->GetCheck();
	int ntime = t.wHour * 3600 + t.wMinute * 60 + t.wSecond;
	int nRet = ZBX_SetAutoReboot(m_cam, bCheck, ntime);
	if (nRet==0)
	{
		AfxMessageBox("���óɹ�");
	}
	else
		AfxMessageBox("����ʧ��");
}

void CSystemDevDlg::OnBnClickedBtnGet()
{
	// TODO:  �ڴ���ӿؼ�֪ͨ����������
	OnGetRebootTime(true);
}

void CSystemDevDlg::OnGetRebootTime(bool bShow){
	int nEnable, nTime;
	int nRet = ZBX_GetAutoReboot(m_cam, &nEnable, &nTime);
	if (bShow)
	{
		if (nRet==0)
		{
			AfxMessageBox("��ȡ�ɹ�");
		}
		else
		{
			AfxMessageBox("��ȡʧ��");
			return;
		}
	}
	((CButton*)GetDlgItem(IDC_CHECK1))->SetCheck(nEnable);
	unsigned int time = 1546272000;
	CTime te(time + nTime);
	m_RebootTime.SetTime(&te);
}

BOOL CSystemDevDlg::PreTranslateMessage(MSG* pMsg)
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


void CSystemDevDlg::OnBnClickedRadioType1()
{
	// TODO:  �ڴ���ӿؼ�֪ͨ����������
	m_nCurWorktype = 0;
}


void CSystemDevDlg::OnBnClickedRadioType2()
{
	// TODO:  �ڴ���ӿؼ�֪ͨ����������

	m_nCurWorktype = 1;
}


void CSystemDevDlg::OnBnClickedRadioType3()
{
	// TODO:  �ڴ���ӿؼ�֪ͨ����������
	m_nCurWorktype = 2;
}


void CSystemDevDlg::OnBnClickedBtnWorktypeSet2()
{
	// TODO:  �ڴ���ӿؼ�֪ͨ����������
	int nRet = ZBX_SetCameraWorkMode(m_cam, m_nCurWorktype);
	if (nRet == 0)
	{
		AfxMessageBox("���óɹ�");
	}
	else
		AfxMessageBox("����ʧ��");
}


void CSystemDevDlg::OnBnClickedBtnWorktypeRead2()
{
	// TODO:  �ڴ���ӿؼ�֪ͨ����������
	OnGetWorkType(true);
}

void CSystemDevDlg::OnGetWorkType(bool bshow){
	unsigned char tmp[10] = { 0 };
	int nRet = ZBX_GetCameraWorkMode(m_cam, tmp);

	((CButton *)GetDlgItem(IDC_RADIO_TYPE1))->SetCheck(FALSE);
	((CButton *)GetDlgItem(IDC_RADIO_TYPE2))->SetCheck(FALSE);
	((CButton *)GetDlgItem(IDC_RADIO_TYPE3))->SetCheck(FALSE);
	if (bshow)
	{
		if (!nRet)
		{
			AfxMessageBox("��ȡ�ɹ�");
		}
		else
		{
			AfxMessageBox("��ȡʧ��");
		}
	}

	switch (tmp[0])
	{
	case 0:
		((CButton *)GetDlgItem(IDC_RADIO_TYPE1))->SetCheck(TRUE);
		break;
	case 1:
		((CButton *)GetDlgItem(IDC_RADIO_TYPE2))->SetCheck(TRUE);
		break;
	case 2:
		((CButton *)GetDlgItem(IDC_RADIO_TYPE3))->SetCheck(TRUE);
		break;
	}
}


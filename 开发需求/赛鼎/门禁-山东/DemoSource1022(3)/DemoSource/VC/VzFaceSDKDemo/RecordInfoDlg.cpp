// RecordInfoDlg.cpp : ʵ���ļ�
//

#include "stdafx.h"
#include "VzFaceSDKDemo.h"
#include "RecordInfoDlg.h"
#include "afxdialogex.h"


// CRecordInfoDlg �Ի���

IMPLEMENT_DYNAMIC(CRecordInfoDlg, CDialogEx)

CRecordInfoDlg::CRecordInfoDlg(TAGLIST_INFO info, CWnd* pParent /*=NULL*/)
: CDialogEx(CRecordInfoDlg::IDD, pParent)
{
	m_info = info;
}

CRecordInfoDlg::~CRecordInfoDlg()
{
}

void CRecordInfoDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialogEx::DoDataExchange(pDX);
}


BEGIN_MESSAGE_MAP(CRecordInfoDlg, CDialogEx)
	ON_BN_CLICKED(IDC_BUTTON1, &CRecordInfoDlg::OnBnClickedButton1)
END_MESSAGE_MAP()


// CRecordInfoDlg ��Ϣ�������


void CRecordInfoDlg::OnBnClickedButton1()
{
	// TODO:  �ڴ���ӿؼ�֪ͨ����������
	OnOK();
}


BOOL CRecordInfoDlg::OnInitDialog()
{
	CDialogEx::OnInitDialog();

	// TODO:  �ڴ���Ӷ���ĳ�ʼ��
	CString str;
	str.Format("������%s", m_info.faceName);
	GetDlgItem(IDC_STC_NAME)->SetWindowTextA(str);
	str.Format("ID��%s", m_info.faceId);
	GetDlgItem(IDC_STC_ID)->SetWindowTextA(str);
	str.Format("ʱ�䣺%s", m_info.csTime);
	GetDlgItem(IDC_STC_TIME)->SetWindowTextA(str);
	str.Format("���ƶȣ�%d", m_info.nMatchScore);
	GetDlgItem(IDC_STC_SCORE)->SetWindowTextA(str);
	str.Format("IP��%s", m_info.DevIp);
	GetDlgItem(IDC_STC_IP)->SetWindowTextA(str);
	if (m_info.bSaftHat)
	{
		str = "��ñ����";
	}
	else
	{
		str = "��ñ����";
	}
	GetDlgItem(IDC_STC_HAT)->SetWindowTextA(str);
	int nMain = m_info.nModel/100;
	switch (nMain)
	{
	case 1:
		str = "ģʽ��ˢ��";
		break; 
	case 2:
		str = "ģʽ��ˢ��";
		break;
	case 3:
		str = "ģʽ��ˢ���֤";
		break;
	case 4:
		str = "ģʽ��ˢ��+ˢ��";
		break;
	case 5:
		str = "ģʽ��ˢ��+ˢ���֤";
		break;
	case 6:
		str = "ģʽ��ˢ�� ��ˢ��";
		break;
	case 7:
		str = "ģʽ��ˢ����ˢ���֤";
		break;
	case 8:
		str = "ģʽ�����˿�բ";
		break;
	default:
		str = "ģʽ��ˢ���֤";
		break;
	}
	GetDlgItem(IDC_STC_MODE)->SetWindowTextA(str);
	switch (m_info.nRole)
	{
	case 0:
	case 1:
		str = "��Ա���ͣ�������";
		break;
	case 2:
		str = "��Ա���ͣ�������";
		break;
	default:
		str = "��Ա���ͣ�δ֪";
		break;
	}
	GetDlgItem(IDC_STC_ROLE)->SetWindowTextA(str);
	if (m_info.bDataSatus)
	{
		str = "�������ͣ���������";
	}
	else
	{

		str = "�������ͣ���������";
	}
	GetDlgItem(IDC_STC_STATUS)->SetWindowTextA(str);
	return TRUE;  // return TRUE unless you set the focus to a control
	// �쳣:  OCX ����ҳӦ���� FALSE
}

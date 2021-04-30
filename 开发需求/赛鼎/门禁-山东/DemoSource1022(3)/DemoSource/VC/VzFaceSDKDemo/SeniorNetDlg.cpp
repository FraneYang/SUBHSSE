// SeniorNetDlg.cpp : ʵ���ļ�
//

#include "stdafx.h"
#include "VzFaceSDKDemo.h"
#include "SeniorNetDlg.h"
#include "afxdialogex.h"


// CSeniorNetDlg �Ի���

IMPLEMENT_DYNAMIC(CSeniorNetDlg, CDialogEx)

CSeniorNetDlg::CSeniorNetDlg(VzLPRClientHandle cam, CWnd* pParent /*=NULL*/)
	: CDialogEx(CSeniorNetDlg::IDD, pParent)
{
	m_cam = cam;
}

CSeniorNetDlg::~CSeniorNetDlg()
{
}

void CSeniorNetDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialogEx::DoDataExchange(pDX);
}


BEGIN_MESSAGE_MAP(CSeniorNetDlg, CDialogEx)
	ON_BN_CLICKED(IDC_BTN_IPSET, &CSeniorNetDlg::OnBnClickedBtnIpset)
	ON_BN_CLICKED(IDC_BTN_IPSET2, &CSeniorNetDlg::OnBnClickedBtnIpset2)
END_MESSAGE_MAP()


// CSeniorNetDlg ��Ϣ�������


void CSeniorNetDlg::OnBnClickedBtnIpset()
{
	// TODO:  �ڴ���ӿؼ�֪ͨ����������
	SystemNetInfo* netinfo = new SystemNetInfo;
	memset(netinfo, 0, sizeof(SystemNetInfo));
	CString strTmp, strTmp1, strTmp2, strTmp3;
	GetDlgItem(IDC_EDITIP)->GetWindowTextA(strTmp);
	GetDlgItem(IDC_EDITNETMASK)->GetWindowTextA(strTmp1);
	GetDlgItem(IDC_EDITGATE)->GetWindowTextA(strTmp2);

	GetDlgItem(IDC_EDITDNS)->GetWindowText(strTmp3);
	if (strTmp.IsEmpty() || strTmp1.IsEmpty() || strTmp2.IsEmpty() || strTmp3.IsEmpty())
	{
		AfxMessageBox("����д��ȷ�Ĳ���");
		return;
	}
	strcpy_s(netinfo->netmask, strTmp1);
	strcpy_s(netinfo->ip_addr, strTmp);
	strcpy_s(netinfo->gateway, strTmp2);
	strcpy_s(netinfo->dns, strTmp3);
	int ret = ZBX_SetNetConfig(m_cam, netinfo);
	if (ret == 0)
	{
		AfxMessageBox("���óɹ�");
	}
	else
	{
		AfxMessageBox("���������Ѹ��� ����������");
	}
	delete netinfo;
}


BOOL CSeniorNetDlg::OnInitDialog()
{
	CDialogEx::OnInitDialog();

	// TODO:  �ڴ���Ӷ���ĳ�ʼ��
	OnGetNetSetting(false);
	return TRUE;  // return TRUE unless you set the focus to a control
	// �쳣:  OCX ����ҳӦ���� FALSE
}


void CSeniorNetDlg::OnBnClickedBtnIpset2()
{
	// TODO:  �ڴ���ӿؼ�֪ͨ����������

	OnGetNetSetting(true);
}

void CSeniorNetDlg::OnGetNetSetting(bool bshow){
	SystemNetInfo* netinfo = new SystemNetInfo;
	memset(netinfo, 0, sizeof(SystemNetInfo));
	int ret = ZBX_GetNetConfig(m_cam, netinfo);
	if (ret==0&&bshow)
	{
		AfxMessageBox("��ȡ�ɹ�");
	}
	else
	{
		if (bshow)
		{
			AfxMessageBox("��ȡʧ��");
		}
	}
	GetDlgItem(IDC_EDITIP)->SetWindowText(netinfo->ip_addr);
	GetDlgItem(IDC_EDITNETMASK)->SetWindowText(netinfo->netmask);
	GetDlgItem(IDC_EDITGATE)->SetWindowText(netinfo->gateway);
	GetDlgItem(IDC_EDITDNS)->SetWindowText(netinfo->dns);
	if (netinfo->mac_addr)
	{
		CString str;
		str.Format("MAC��ַ:%s", netinfo->mac_addr);
		GetDlgItem(IDC_STC_MAC)->SetWindowText(str);
	}
}

BOOL CSeniorNetDlg::PreTranslateMessage(MSG* pMsg)
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

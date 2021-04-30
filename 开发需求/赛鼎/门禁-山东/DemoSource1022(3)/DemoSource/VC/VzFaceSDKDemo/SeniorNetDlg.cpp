// SeniorNetDlg.cpp : 实现文件
//

#include "stdafx.h"
#include "VzFaceSDKDemo.h"
#include "SeniorNetDlg.h"
#include "afxdialogex.h"


// CSeniorNetDlg 对话框

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


// CSeniorNetDlg 消息处理程序


void CSeniorNetDlg::OnBnClickedBtnIpset()
{
	// TODO:  在此添加控件通知处理程序代码
	SystemNetInfo* netinfo = new SystemNetInfo;
	memset(netinfo, 0, sizeof(SystemNetInfo));
	CString strTmp, strTmp1, strTmp2, strTmp3;
	GetDlgItem(IDC_EDITIP)->GetWindowTextA(strTmp);
	GetDlgItem(IDC_EDITNETMASK)->GetWindowTextA(strTmp1);
	GetDlgItem(IDC_EDITGATE)->GetWindowTextA(strTmp2);

	GetDlgItem(IDC_EDITDNS)->GetWindowText(strTmp3);
	if (strTmp.IsEmpty() || strTmp1.IsEmpty() || strTmp2.IsEmpty() || strTmp3.IsEmpty())
	{
		AfxMessageBox("请填写正确的参数");
		return;
	}
	strcpy_s(netinfo->netmask, strTmp1);
	strcpy_s(netinfo->ip_addr, strTmp);
	strcpy_s(netinfo->gateway, strTmp2);
	strcpy_s(netinfo->dns, strTmp3);
	int ret = ZBX_SetNetConfig(m_cam, netinfo);
	if (ret == 0)
	{
		AfxMessageBox("设置成功");
	}
	else
	{
		AfxMessageBox("网络设置已更新 请重新连接");
	}
	delete netinfo;
}


BOOL CSeniorNetDlg::OnInitDialog()
{
	CDialogEx::OnInitDialog();

	// TODO:  在此添加额外的初始化
	OnGetNetSetting(false);
	return TRUE;  // return TRUE unless you set the focus to a control
	// 异常:  OCX 属性页应返回 FALSE
}


void CSeniorNetDlg::OnBnClickedBtnIpset2()
{
	// TODO:  在此添加控件通知处理程序代码

	OnGetNetSetting(true);
}

void CSeniorNetDlg::OnGetNetSetting(bool bshow){
	SystemNetInfo* netinfo = new SystemNetInfo;
	memset(netinfo, 0, sizeof(SystemNetInfo));
	int ret = ZBX_GetNetConfig(m_cam, netinfo);
	if (ret==0&&bshow)
	{
		AfxMessageBox("获取成功");
	}
	else
	{
		if (bshow)
		{
			AfxMessageBox("获取失败");
		}
	}
	GetDlgItem(IDC_EDITIP)->SetWindowText(netinfo->ip_addr);
	GetDlgItem(IDC_EDITNETMASK)->SetWindowText(netinfo->netmask);
	GetDlgItem(IDC_EDITGATE)->SetWindowText(netinfo->gateway);
	GetDlgItem(IDC_EDITDNS)->SetWindowText(netinfo->dns);
	if (netinfo->mac_addr)
	{
		CString str;
		str.Format("MAC地址:%s", netinfo->mac_addr);
		GetDlgItem(IDC_STC_MAC)->SetWindowText(str);
	}
}

BOOL CSeniorNetDlg::PreTranslateMessage(MSG* pMsg)
{
	// TODO:  在此添加专用代码和/或调用基类
	if (pMsg->message == WM_KEYDOWN)	{
		switch (pMsg->wParam)		{
		case VK_ESCAPE: //Esc按键事件				
			return true;
		case VK_RETURN: //Enter按键事件				
			return true;
		default:
			;
		}
	}
	return CDialogEx::PreTranslateMessage(pMsg);
}

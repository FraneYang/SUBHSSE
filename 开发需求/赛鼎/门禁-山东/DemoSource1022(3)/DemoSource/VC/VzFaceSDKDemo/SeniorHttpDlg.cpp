// SeniorHttpDlg.cpp : 实现文件
//

#include "stdafx.h"
#include "VzFaceSDKDemo.h"
#include "SeniorHttpDlg.h"
#include "afxdialogex.h"


// CSeniorHttpDlg 对话框

IMPLEMENT_DYNAMIC(CSeniorHttpDlg, CDialogEx)

CSeniorHttpDlg::CSeniorHttpDlg(VzLPRClientHandle cam, CWnd* pParent /*=NULL*/)
	: CDialogEx(CSeniorHttpDlg::IDD, pParent)
{
	m_cam = cam;
}

CSeniorHttpDlg::~CSeniorHttpDlg()
{
}

void CSeniorHttpDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialogEx::DoDataExchange(pDX);
}


BEGIN_MESSAGE_MAP(CSeniorHttpDlg, CDialogEx)
	ON_BN_CLICKED(IDC_BTN_SET, &CSeniorHttpDlg::OnBnClickedBtnSet)
	ON_BN_CLICKED(IDC_CHECK1, &CSeniorHttpDlg::OnBnClickedCheck1)
	ON_BN_CLICKED(IDC_BTN_READ, &CSeniorHttpDlg::OnBnClickedBtnRead)
	ON_BN_CLICKED(IDC_RADIO1, &CSeniorHttpDlg::OnBnClickedRadio1)
	ON_BN_CLICKED(IDC_RADIO3, &CSeniorHttpDlg::OnBnClickedRadio3)
	ON_BN_CLICKED(IDC_RADIO4, &CSeniorHttpDlg::OnBnClickedRadio4)
END_MESSAGE_MAP()


// CSeniorHttpDlg 消息处理程序


void CSeniorHttpDlg::OnBnClickedBtnSet()
{
	// TODO:  在此添加控件通知处理程序代码
	ZBX_HTTPCONFIG_EX httpConfig;
	memset(&httpConfig, 0, sizeof(ZBX_HTTPCONFIG_EX));
	CString str;
	GetDlgItem(IDC_EDIT_IP)->GetWindowTextA(str);
	if (str.IsEmpty())
	{
		AfxMessageBox("请输入IP");
		return;
	}
	strcpy(httpConfig.centerserver.hostname, str);
	GetDlgItem(IDC_EDIT_PORT)->GetWindowTextA(str);
	if (atoi(str)<=0)
	{
		AfxMessageBox("请输入正确端口号");
		return;
	}
	httpConfig.centerserver.port = atoi(str);
	httpConfig.centerserver.http_timeout = 60;
	httpConfig.cs_alarm_plate.enable = ((CButton*)GetDlgItem(IDC_CHECK1))->GetCheck();

	GetDlgItem(IDC_EDIT_URL)->GetWindowTextA(str);
	if (str.IsEmpty() && (httpConfig.cs_alarm_plate.enable))
	{
		AfxMessageBox("请输入正确推送URL");
		return;
	}
	strcpy(httpConfig.cs_alarm_plate.uri, str);

	httpConfig.cs_dev_reg.enable = m_nHeartBeat; 
	if (str.IsEmpty() && (!httpConfig.cs_dev_reg.enable))
	{
		AfxMessageBox("请输入正确心跳URL");
		return;
	}
	GetDlgItem(IDC_EDIT_URL2)->GetWindowTextA(str);
	strcpy(httpConfig.cs_dev_reg.uri, str);
	int Tmp = ZBX_SetHttpConfig_Ex(m_cam, httpConfig);
	if (Tmp==0)
	{
		AfxMessageBox("设置成功");
	}
	else
	{
		AfxMessageBox("设置失败");
	}
}


BOOL CSeniorHttpDlg::OnInitDialog()
{
	CDialogEx::OnInitDialog();

	// TODO:  在此添加额外的初始化
	GetHttpSetting(false);
	return TRUE;  // return TRUE unless you set the focus to a control
	// 异常:  OCX 属性页应返回 FALSE
}


void CSeniorHttpDlg::OnBnClickedCheck1()
{
	// TODO:  在此添加控件通知处理程序代码
	bool bResult = ((CButton*)GetDlgItem(IDC_CHECK1))->GetCheck();	
	GetDlgItem(IDC_STC_PUSH)->EnableWindow(bResult);
	GetDlgItem(IDC_EDIT_URL)->EnableWindow(bResult);
}


void CSeniorHttpDlg::GetHttpSetting(bool bShow){

	ZBX_HTTPCONFIG_EX httpConfig2;
	memset(&httpConfig2, 0, sizeof(ZBX_HTTPCONFIG_EX));
	int Tmp = ZBX_GetHttpConfig_Ex(m_cam, &httpConfig2);
	if (bShow)
	{
		if (Tmp==0)
		{
			AfxMessageBox("获取成功");
		}
		else
		{

			AfxMessageBox("获取失败");
		}
	}
	CString str;
	str = httpConfig2.centerserver.hostname;
	GetDlgItem(IDC_EDIT_IP)->SetWindowTextA(str);
	str = httpConfig2.cs_alarm_plate.uri;
	GetDlgItem(IDC_EDIT_URL)->SetWindowTextA(str);
	GetDlgItem(IDC_STC_PUSH)->EnableWindow(httpConfig2.cs_alarm_plate.enable);
	GetDlgItem(IDC_EDIT_URL)->EnableWindow(httpConfig2.cs_alarm_plate.enable);
	((CButton *)GetDlgItem(IDC_CHECK1))->SetCheck(httpConfig2.cs_alarm_plate.enable);
	SetDlgItemInt(IDC_EDIT_PORT, httpConfig2.centerserver.port);

	switch (httpConfig2.cs_dev_reg.enable)
	{
	case 0:
		((CButton *)GetDlgItem(IDC_RADIO1))->SetCheck(TRUE);
		EnableHeartBreatWindow(false);
		break;
	case 1:
		((CButton *)GetDlgItem(IDC_RADIO3))->SetCheck(TRUE);
		EnableHeartBreatWindow(true);
		break;
	case 2:
		((CButton *)GetDlgItem(IDC_RADIO4))->SetCheck(TRUE);
		EnableHeartBreatWindow(true);
			break;
	default:
		break;
	}
	str = httpConfig2.cs_dev_reg.uri;
	GetDlgItem(IDC_EDIT_URL2)->SetWindowTextA(str);
}

void CSeniorHttpDlg::OnBnClickedBtnRead()
{
	// TODO:  在此添加控件通知处理程序代码
	GetHttpSetting(true);
}


BOOL CSeniorHttpDlg::PreTranslateMessage(MSG* pMsg)
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


void CSeniorHttpDlg::OnBnClickedRadio1()
{
	// TODO:  在此添加控件通知处理程序代码
	m_nHeartBeat = 0;
	EnableHeartBreatWindow(false);
}


void CSeniorHttpDlg::OnBnClickedRadio3()
{
	// TODO:  在此添加控件通知处理程序代码
	m_nHeartBeat = 1;
	EnableHeartBreatWindow(true);
}


void CSeniorHttpDlg::OnBnClickedRadio4()
{
	// TODO:  在此添加控件通知处理程序代码
	m_nHeartBeat = 2;
	EnableHeartBreatWindow(true);
}

void CSeniorHttpDlg::EnableHeartBreatWindow(bool bShow){
	GetDlgItem(IDC_STC_HEART)->EnableWindow(bShow);
	GetDlgItem(IDC_EDIT_URL2)->EnableWindow(bShow);
}

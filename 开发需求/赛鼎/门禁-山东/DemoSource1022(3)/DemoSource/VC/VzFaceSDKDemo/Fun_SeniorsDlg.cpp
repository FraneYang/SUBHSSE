// Fun_SeniorsDlg.cpp : 实现文件
//

#include "stdafx.h"
#include "VzFaceSDKDemo.h"
#include "Fun_SeniorsDlg.h"
#include "afxdialogex.h"

// CFun_SeniorsDlg 对话框

IMPLEMENT_DYNAMIC(CFun_SeniorsDlg, CDialogEx)

CFun_SeniorsDlg::CFun_SeniorsDlg(VzLPRClientHandle cam, CWnd* pParent /*=NULL*/)
	: CDialogEx(CFun_SeniorsDlg::IDD, pParent)
{
	m_cam = cam;
}

CFun_SeniorsDlg::~CFun_SeniorsDlg()
{
}

void CFun_SeniorsDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialogEx::DoDataExchange(pDX);
}


BEGIN_MESSAGE_MAP(CFun_SeniorsDlg, CDialogEx)
	ON_BN_CLICKED(IDC_BTN_WG, &CFun_SeniorsDlg::OnBnClickedBtnWg)
	ON_BN_CLICKED(IDC_BTN_MODE, &CFun_SeniorsDlg::OnBnClickedBtnMode)
	ON_BN_CLICKED(IDC_BTN_WG2, &CFun_SeniorsDlg::OnBnClickedBtnWg2)
	ON_BN_CLICKED(IDC_BTN_WG3, &CFun_SeniorsDlg::OnBnClickedBtnWg3)
	ON_BN_CLICKED(IDC_BTN_WG4, &CFun_SeniorsDlg::OnBnClickedBtnWg4)
	ON_BN_CLICKED(IDC_BTN_WG5, &CFun_SeniorsDlg::OnBnClickedBtnWg5)
	ON_BN_CLICKED(IDC_BTN_SPWG, &CFun_SeniorsDlg::OnBnClickedBtnSpwg)
END_MESSAGE_MAP()


// CFun_SeniorsDlg 消息处理程序


void CFun_SeniorsDlg::OnBnClickedBtnWg()
{
	// TODO:  在此添加控件通知处理程序代码

	SWHIDEAll();
	m_SeniorDlg->ShowWindow(TRUE);
}


void CFun_SeniorsDlg::OnBnClickedBtnMode()
{
	// TODO:  在此添加控件通知处理程序代码

	SWHIDEAll();
	m_ModeDlg->ShowWindow(TRUE);
}


BOOL CFun_SeniorsDlg::OnInitDialog()
{
	CDialogEx::OnInitDialog();

	// TODO:  在此添加额外的初始化
	if (!m_ModeDlg)
	{
		m_ModeDlg = new CSeniorModeDlg(m_cam);
		m_ModeDlg->Create(IDD_SENSOR_TRIGER, this);
	}

	if (!m_SeniorDlg)
	{
		m_SeniorDlg = new CSeniorDlg(m_cam);
		m_SeniorDlg->Create(IDD_DLG_SENIOR, this);
	}
	CRect rc;
	GetDlgItem(IDC_GROUP)->GetWindowRect(rc);
	ScreenToClient(&rc);
	m_ModeDlg->MoveWindow(rc);
	m_SeniorDlg->MoveWindow(rc);
	m_ModeDlg->ShowWindow(SW_SHOW);
	if (theApp.m_nCustomMade==1)
	{
		GetDlgItem(IDC_BTN_SPWG)->ShowWindow(TRUE);
	}
	return TRUE;  // return TRUE unless you set the focus to a control
	// 异常:  OCX 属性页应返回 FALSE
}


void CFun_SeniorsDlg::OnBnClickedBtnWg2()
{
	// TODO:  在此添加控件通知处理程序代码
	if (!m_SeninorWg)
	{
		m_SeninorWg = new CSeniorWGDlg(m_cam);
		m_SeninorWg->Create(IDD_DLG_SENIOR_WG, this);
		CRect rc;
		GetDlgItem(IDC_GROUP)->GetWindowRect(rc);
		ScreenToClient(&rc);
		m_SeninorWg->MoveWindow(rc);
	}	
	SWHIDEAll();
	m_SeninorWg->ShowWindow(TRUE);
}

void CFun_SeniorsDlg::SWHIDEAll(){
	if (m_SeniorDlg)
	{
		m_SeniorDlg->ShowWindow(SW_HIDE);
	}
	if (m_ModeDlg)
	{
		m_ModeDlg->ShowWindow(SW_HIDE);
	}
	if (m_SeninorWg)
	{
		m_SeninorWg->ShowWindow(SW_HIDE);
	}
	if (m_SeniorNetDlg)
	{
		m_SeniorNetDlg->ShowWindow(SW_HIDE);
	}
	if (m_SeniorHttpDlg)
	{
		m_SeniorHttpDlg->ShowWindow(SW_HIDE);
	}
	if (m_SeniorMQTTDlg)
	{
		m_SeniorMQTTDlg->ShowWindow(SW_HIDE);
	}
	if (m_SeniorSpWg)
	{
		m_SeniorSpWg->ShowWindow(SW_HIDE);
	}
}


void CFun_SeniorsDlg::OnBnClickedBtnWg3()
{
	// TODO:  在此添加控件通知处理程序代码
	if (!m_SeniorNetDlg)
	{
		m_SeniorNetDlg = new CSeniorNetDlg(m_cam);
		m_SeniorNetDlg->Create(IDD_DLG_SENIOR_NET, this);
		CRect rc;
		GetDlgItem(IDC_GROUP)->GetWindowRect(rc);
		ScreenToClient(&rc);
		m_SeniorNetDlg->MoveWindow(rc);
	}
	SWHIDEAll();
	m_SeniorNetDlg->ShowWindow(TRUE);
}


void CFun_SeniorsDlg::OnBnClickedBtnWg4()
{
	// TODO:  在此添加控件通知处理程序代码
	if (!m_SeniorHttpDlg)
	{
		m_SeniorHttpDlg = new CSeniorHttpDlg(m_cam);
		m_SeniorHttpDlg->Create(IDD_DLG_SENIOR_HTTP, this);
		CRect rc;
		GetDlgItem(IDC_GROUP)->GetWindowRect(rc);
		ScreenToClient(&rc);
		m_SeniorHttpDlg->MoveWindow(rc);
	}
	SWHIDEAll();
	m_SeniorHttpDlg->ShowWindow(TRUE);
}


BOOL CFun_SeniorsDlg::PreTranslateMessage(MSG* pMsg)
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


void CFun_SeniorsDlg::OnBnClickedBtnWg5()
{
	// TODO:  在此添加控件通知处理程序代码
	if (!m_SeniorMQTTDlg)
	{
		m_SeniorMQTTDlg = new CSeniorMQTTDlg(m_cam);
		m_SeniorMQTTDlg->Create(IDD_SENIOR_MQTT, this);
		CRect rc;
		GetDlgItem(IDC_GROUP)->GetWindowRect(rc);
		ScreenToClient(&rc);
		m_SeniorMQTTDlg->MoveWindow(rc);
	}
	SWHIDEAll();
	m_SeniorMQTTDlg->ShowWindow(TRUE);
}


void CFun_SeniorsDlg::OnBnClickedBtnSpwg()
{
	// TODO:  在此添加控件通知处理程序代码
	if (!m_SeniorSpWg)
	{
		m_SeniorSpWg = new CSeniorspwgDlg(m_cam);
		m_SeniorSpWg->Create(IDD_DLG_SENIOR_SPWG, this);
		CRect rc;
		GetDlgItem(IDC_GROUP)->GetWindowRect(rc);
		ScreenToClient(&rc);
		m_SeniorSpWg->MoveWindow(rc);
	}
	SWHIDEAll();
	m_SeniorSpWg->ShowWindow(TRUE);
}

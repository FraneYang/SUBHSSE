// Fun_MangDlg.cpp : 实现文件
//

#include "stdafx.h"
#include "VzFaceSDKDemo.h"
#include "Fun_MangDlg.h"
#include "afxdialogex.h"


// CFun_MangDlg 对话框
IMPLEMENT_DYNAMIC(CFun_MangDlg, CDialogEx)

CFun_MangDlg::CFun_MangDlg(VzLPRClientHandle cam, CWnd* pParent /*=NULL*/)
	: CDialogEx(CFun_MangDlg::IDD, pParent)
{
	m_cam = cam;
	FaceMng_MangDlg = NULL;
	FaceMng_JurSetting = NULL;
}

CFun_MangDlg::~CFun_MangDlg()
{
	if (FaceMng_MangDlg)
	{
		delete FaceMng_MangDlg;
		FaceMng_MangDlg = NULL;
	}
	if (FaceMng_JurSetting)
	{
		delete FaceMng_JurSetting;
		FaceMng_JurSetting = NULL;
	}
	StopThread();
}

void CFun_MangDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialogEx::DoDataExchange(pDX);
}


BEGIN_MESSAGE_MAP(CFun_MangDlg, CDialogEx)
	ON_BN_CLICKED(IDC_BUTTON1, &CFun_MangDlg::OnBnClickedButton1)
	ON_BN_CLICKED(IDC_BTN_JUR, &CFun_MangDlg::OnBnClickedBtnJur)
	ON_WM_PAINT()
END_MESSAGE_MAP()


// CFun_MangDlg 消息处理程序


void CFun_MangDlg::OnBnClickedButton1()
{
	// TODO:  在此添加控件通知处理程序代码
	if (FaceMng_JurSetting)
	{
		FaceMng_JurSetting->ShowWindow(SW_HIDE);
	}
	CRect rc;
	GetDlgItem(IDC_CHILD)->GetWindowRect(rc);
	ScreenToClient(&rc);
	FaceMng_MangDlg->MoveWindow(rc);
	FaceMng_MangDlg->ShowWindow(SW_SHOW);
	FaceMng_MangDlg->SetParent(this);
	FaceMng_MangDlg->OnSyncUserRightCfgs();
}


void CFun_MangDlg::OnBnClickedBtnJur()
{
	// TODO:  在此添加控件通知处理程序代码
	if (FaceMng_MangDlg)
	{
		FaceMng_MangDlg->ShowWindow(SW_HIDE);
	}
	if (!FaceMng_JurSetting)
	{
		FaceMng_JurSetting = new CJurSettingDlg(m_cam);
		FaceMng_JurSetting->Create(IDD_JUR_DETALIS, this);
	}
	CRect rc;
	GetDlgItem(IDC_CHILD)->GetWindowRect(rc);
	ScreenToClient(&rc);
	FaceMng_JurSetting->MoveWindow(rc);
	FaceMng_JurSetting->ShowWindow(SW_SHOW);
	
}


BOOL CFun_MangDlg::OnInitDialog()
{
	CDialogEx::OnInitDialog();

	// TODO:  在此添加额外的初始化	

	FaceMng_MangDlg = new CFaceManagerDlg(m_cam);
	FaceMng_MangDlg->Create(IDD_DLG_FACE_MANAGER, this);
	m_listTask.AddHead(1);
	StartThread(0, 300);
	return TRUE;  // return TRUE unless you set the focus to a control
	// 异常:  OCX 属性页应返回 FALSE
}

void CFun_MangDlg::Run()
{
	int iCmd = -1;
	if (m_listTask.IsEmpty())
		return;

	iCmd = m_listTask.RemoveHead();
	if (iCmd == 1)
	{
		TrdInit();
	}
	else if (iCmd == 2)
	{
		
	}
}

void CFun_MangDlg::TrdInit(){
	OnBnClickedButton1();
}

void CFun_MangDlg::OnPaint()
{
	CPaintDC dc(this); // device context for painting
	// TODO:  在此处添加消息处理程序代码
	// 不为绘图消息调用 __super::OnPaint()
}


BOOL CFun_MangDlg::PreTranslateMessage(MSG* pMsg)
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
	return CDialog::PreTranslateMessage(pMsg);
}

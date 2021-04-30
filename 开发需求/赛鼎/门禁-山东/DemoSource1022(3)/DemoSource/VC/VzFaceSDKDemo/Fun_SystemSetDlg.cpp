// Fun_SystemSetDlg.cpp : 实现文件
//

#include "stdafx.h"
#include "VzFaceSDKDemo.h"
#include "Fun_SystemSetDlg.h"
#include "afxdialogex.h"


// CFun_SystemSetDlg 对话框

IMPLEMENT_DYNAMIC(CFun_SystemSetDlg, CDialogEx)

CFun_SystemSetDlg::CFun_SystemSetDlg(VzLPRClientHandle cam, CWnd* pParent /*=NULL*/)
	: CDialogEx(CFun_SystemSetDlg::IDD, pParent)
{
	m_cam = cam;
}

CFun_SystemSetDlg::~CFun_SystemSetDlg()
{
	if (m_SetDlg)
	{
		delete m_SetDlg;
		m_SetDlg = NULL;
	}
	if (m_KeyDlg)
	{
		delete m_KeyDlg;
		m_KeyDlg = NULL;
	}if (m_DevDlg)
	{
		delete m_DevDlg;
		m_DevDlg = NULL;
	}if (m_TFDlg)
	{
		delete m_TFDlg;
		m_TFDlg = NULL;
	}
}

void CFun_SystemSetDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialogEx::DoDataExchange(pDX);
}


BEGIN_MESSAGE_MAP(CFun_SystemSetDlg, CDialogEx)
	ON_BN_CLICKED(IDC_BTN_DEVICE, &CFun_SystemSetDlg::OnBnClickedBtnDevice)
	ON_BN_CLICKED(IDC_BTN_UPDATE, &CFun_SystemSetDlg::OnBnClickedBtnUpdate)
	ON_BN_CLICKED(IDC_BTN_KEY, &CFun_SystemSetDlg::OnBnClickedBtnKey)
	ON_BN_CLICKED(IDC_BTN_FLASH, &CFun_SystemSetDlg::OnBnClickedBtnFlash)
	ON_WM_CLOSE()
	ON_BN_CLICKED(IDC_BTN_USER, &CFun_SystemSetDlg::OnBnClickedBtnUser)
	ON_BN_CLICKED(IDC_BTN_REBOOTINFO, &CFun_SystemSetDlg::OnBnClickedBtnRebootinfo)
END_MESSAGE_MAP()


// CFun_SystemSetDlg 消息处理程序


void CFun_SystemSetDlg::OnBnClickedBtnDevice()
{
	// TODO:  在此添加控件通知处理程序代码
	if (!m_DevDlg)
	{
		m_DevDlg = new CSystemDevDlg(m_cam);
		m_DevDlg->Create(IDD_SYSTEM_DEV, this);
		CRect rc;
		GetDlgItem(IDC_GROUP)->GetWindowRect(rc);
		ScreenToClient(rc);
		m_DevDlg->MoveWindow(rc);
	}
	OnRestUI(IDC_BTN_DEVICE);
}


BOOL CFun_SystemSetDlg::OnInitDialog()
{
	CDialogEx::OnInitDialog();

	// TODO:  在此添加额外的初始化	
	
	if (!m_SetDlg)
	{
		m_SetDlg = new CSystemSetDlg(m_cam);
		m_SetDlg->Create(IDD_DLG_SYSTEMSET, this);
	}
	CRect rc;
	GetDlgItem(IDC_GROUP)->GetWindowRect(rc);
	ScreenToClient(rc);
	m_SetDlg->MoveWindow(rc);
	m_SetDlg->ShowWindow(SW_SHOW);
	return TRUE;  // return TRUE unless you set the focus to a control
	// 异常:  OCX 属性页应返回 FALSE
}


void CFun_SystemSetDlg::OnBnClickedBtnUpdate()
{
	// TODO:  在此添加控件通知处理程序代码
	OnRestUI(IDC_BTN_SET);
}


void CFun_SystemSetDlg::OnBnClickedBtnKey()
{
	// TODO:  在此添加控件通知处理程序代码
	if (!m_KeyDlg)
	{
		m_KeyDlg = new CSystemKeyDlg(m_cam);
		m_KeyDlg->Create(IDD_SYSTEM_KEY, this);
		CRect rc;
		GetDlgItem(IDC_GROUP)->GetWindowRect(rc);
		ScreenToClient(rc);
		m_KeyDlg->MoveWindow(rc);
	}
	OnRestUI(IDC_BTN_KEY);
}
void CFun_SystemSetDlg::OnRestUI(int nID){
	if (m_DevDlg)
	{
		m_DevDlg->ShowWindow(SW_HIDE);
	}
	if (m_KeyDlg)
	{
		m_KeyDlg->ShowWindow(SW_HIDE);
	}
	if (m_SetDlg)
	{
		m_SetDlg->ShowWindow(SW_HIDE);
	}
	if (m_TFDlg)
	{
		m_TFDlg->ShowWindow(SW_HIDE);
	}
	if (m_RebootDlg)
	{
		m_RebootDlg->ShowWindow(SW_HIDE);
	}
	switch (nID)
	{
	case IDC_BTN_SET:
		m_SetDlg->ShowWindow(SW_SHOW);
		break;
	case IDC_BTN_DEVICE:
		m_DevDlg->ShowWindow(SW_SHOW);
		break;
	case IDC_BTN_KEY:
		m_KeyDlg->ShowWindow(SW_SHOW);
		break;
	case IDC_BTN_FLASH:
		m_TFDlg->ShowWindow(SW_SHOW);
		break;
	case IDC_BTN_REBOOTINFO:
		m_RebootDlg->ShowWindow(SW_SHOW);
		break;
	}
}

void CFun_SystemSetDlg::OnBnClickedBtnFlash()
{
	// TODO:  在此添加控件通知处理程序代码
	if (!m_TFDlg)
	{
		m_TFDlg = new CSystemTFDlg(m_cam);
		m_TFDlg->Create(IDD_SYSTEM_TF, this);
		CRect rc;
		GetDlgItem(IDC_GROUP)->GetWindowRect(rc);
		ScreenToClient(rc);
		m_TFDlg->MoveWindow(rc);
	}
	OnRestUI(IDC_BTN_FLASH);
}


BOOL CFun_SystemSetDlg::PreTranslateMessage(MSG* pMsg)
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


void CFun_SystemSetDlg::OnClose()
{
	// TODO:  在此添加消息处理程序代码和/或调用默认值
	if (m_SetDlg->m_bUpdate){
		AfxMessageBox("正在升级，请稍后！");
		return;
	}
	CDialogEx::OnClose();
}


void CFun_SystemSetDlg::OnBnClickedBtnUser()
{
	// TODO:  在此添加控件通知处理程序代码
}


void CFun_SystemSetDlg::OnBnClickedBtnRebootinfo()
{
	// TODO:  在此添加控件通知处理程序代码
	if (!m_RebootDlg)
	{
		m_RebootDlg = new SystemRebootInfoDlg(m_cam);
		m_RebootDlg->Create(IDD_SYSTEM_REBOOTINFO, this);
		CRect rc;
		GetDlgItem(IDC_GROUP)->GetWindowRect(rc);
		ScreenToClient(rc);
		m_RebootDlg->MoveWindow(rc);
	}
	OnRestUI(IDC_BTN_REBOOTINFO);
}

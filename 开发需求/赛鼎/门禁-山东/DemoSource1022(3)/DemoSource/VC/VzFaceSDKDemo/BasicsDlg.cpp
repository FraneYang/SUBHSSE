// BasicsDlg.cpp : implementation file
//

#include "stdafx.h"
#include "VzFaceSDKDemo.h"
#include "BasicsDlg.h"
#include "afxdialogex.h"
#include "LedTimeSetDlg.h"

// CBasicsDlg dialog

IMPLEMENT_DYNAMIC(CBasicsDlg, CDialogEx)

CBasicsDlg::CBasicsDlg(VzLPRClientHandle cam, CWnd* pParent /*=NULL*/)
	: CDialogEx(CBasicsDlg::IDD, pParent)
{
	m_cam = cam;
}

CBasicsDlg::~CBasicsDlg()
{
}

void CBasicsDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialogEx::DoDataExchange(pDX);
}


BEGIN_MESSAGE_MAP(CBasicsDlg, CDialogEx)
	ON_BN_CLICKED(IDC_BTN_TITLE, &CBasicsDlg::OnBnClickedBtnTitle)
	ON_MESSAGE(WM_USER_MSG_BASIC, &CBasicsDlg::OnUserMsg)
	ON_BN_CLICKED(IDC_BTN_LED, &CBasicsDlg::OnBnClickedBtnLed)
	ON_WM_HSCROLL()
	ON_BN_CLICKED(IDC_BTN_VOL, &CBasicsDlg::OnBnClickedBtnVol)
	ON_BN_CLICKED(IDC_BTN_LOCAL, &CBasicsDlg::OnBnClickedBtnLocal)
	ON_BN_CLICKED(IDC_BTN_TIME, &CBasicsDlg::OnBnClickedBtnTime)
	ON_BN_CLICKED(IDC_SCAREENSAVE, &CBasicsDlg::OnBnClickedScareensave)
	ON_WM_TIMER()
	ON_BN_CLICKED(IDC_BTN_UI, &CBasicsDlg::OnBnClickedBtnUi)
	ON_BN_CLICKED(IDC_BTN_SCREEN, &CBasicsDlg::OnBnClickedBtnScreen)
END_MESSAGE_MAP()


// CBasicsDlg message handlers


BOOL CBasicsDlg::OnInitDialog()
{
	CDialogEx::OnInitDialog();
	// TODO:  Add extra initialization here
	//StartThread(0, 300);
	if (!m_UIDlg){
		m_UIDlg = new CBasicUIDlg(m_cam);
		m_UIDlg->Create(IDD_DLG_BASIC_UI, this);
	}
	ResetUI(IDC_BTN_UI);
	//StartThread(0, 1000);
	//PostMessage(WM_USER_MSG_BASIC, (WPARAM)1, (LPARAM)1);
	m_UIDlg->ShowWindow(TRUE);
	return TRUE;  // return TRUE unless you set the focus to a control
	// EXCEPTION: OCX Property Pages should return FALSE
}


void CBasicsDlg::OnBnClickedBtnTitle()
{
	
}
LRESULT CBasicsDlg::OnUserMsg(WPARAM w, LPARAM l)
{
#if 0
	char Title[256] = { 0 };
	int iRet = ZBX_GetScreenOsdTitle(m_cam, Title);
	GetDlgItem(IDC_EDIT1)->SetWindowTextA(util::Convert<util::ascii>(Title).c_str());

	char Level[10];
	int retModel = ZBX_GetLedMode(m_cam, Level);
	//GetDlgItem(IDC_EDIT2)->SetWindowTextA(Level);
	int nData = atoi(Level);
	m_Combox.SetCurSel(nData - 1);

	int ret = ZBX_GetLedLevel(m_cam, Level);
	nData = atoi(Level);
	m_Sliderled.SetPos(nData);
	SetDlgItemInt(IDC_LEDLEVL, nData);

	ZBX_AudioConfig audioConfig;
	ret = ZBX_GetAudioConfig(m_cam, &audioConfig);
	if (ret == 0)
	{
		m_SliderVol.SetPos((audioConfig.volume)*4);
		SetDlgItemInt(IDC_STC_VOL, (audioConfig.volume)*4);
	}
	int t = 0;
	int n = ZBX_GetExtinguishingScreenTime(m_cam, &t);
	if (n == 0)
	{
		SetDlgItemInt(IDC_EDIT2, t);
		if (t == 0)
		{
			((CButton*)GetDlgItem(IDC_CHECK))->SetCheck(FALSE);
		}
		else
			((CButton*)GetDlgItem(IDC_CHECK))->SetCheck(TRUE);
	}
	int nTime;
	ZBX_GetSysTime(m_cam, &nTime);
	CTime time(nTime);
	m_DeviceTimeCtrl.SetTime(&time);
#endif
	return 1l;
}

void CBasicsDlg::OnBnClickedBtnLed()
{
	// TODO: Add your control notification handler code here
	if (!m_LedTimeDlg){
		m_LedTimeDlg = new CLedTimeSetDlg(m_cam);
		m_LedTimeDlg->Create(IDD_DLG_LEDTIEM, this);
	}
	ResetUI(IDC_BTN_LED);
}


void CBasicsDlg::OnHScroll(UINT nSBCode, UINT nPos, CScrollBar* pScrollBar)
{
	// TODO: Add your message handler code here and/or call default
	
	CDialogEx::OnHScroll(nSBCode, nPos, pScrollBar);
}


void CBasicsDlg::OnBnClickedBtnVol()
{
	// TODO: Add your control notification handler code here
	if (!m_VolDlg){
		m_VolDlg = new CBasicVolDlg(m_cam);
		m_VolDlg->Create(IDD_DLG_BASCI_VOL, this);
	}
	ResetUI(IDC_BTN_VOL);
}


void CBasicsDlg::OnBnClickedBtnLocal()
{
	// TODO: Add your control notification handler code here
	
	
}


void CBasicsDlg::OnBnClickedBtnTime()
{
	// TODO: Add your control notification handler code here
	if (!m_TimeDlg){
		m_TimeDlg = new CBasicTimeDlg(m_cam);
		m_TimeDlg->Create(IDD_DLG_BASIC_TIME, this);
	}
	ResetUI(IDC_BTN_TIME);
}


BOOL CBasicsDlg::PreTranslateMessage(MSG* pMsg)
{
	// TODO: Add your specialized code here and/or call the base class
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


void CBasicsDlg::OnBnClickedScareensave()
{
	// TODO: Add your control notification handler code here
	
}


void CBasicsDlg::OnTimer(UINT_PTR nIDEvent)
{
	// TODO: Add your message handler code here and/or call default
	
	CDialogEx::OnTimer(nIDEvent);
}


void CBasicsDlg::OnBnClickedBtnUi()
{
	// TODO:  在此添加控件通知处理程序代码
	ResetUI(IDC_BTN_UI);
}


void CBasicsDlg::OnBnClickedBtnScreen()
{
	// TODO:  在此添加控件通知处理程序代码
	if (!m_ScreenDlg){
		m_ScreenDlg = new CBasicScreenDlg(m_cam);
		m_ScreenDlg->Create(IDD_DLG_BASIC_SCREEN, this);
	}
	ResetUI(IDC_BTN_SCREEN);
}

void CBasicsDlg::Run()
{
	int iCmd = -1;
	if (m_listTask.IsEmpty())
		return;

	iCmd = m_listTask.RemoveHead();
	if (iCmd==1)
	{
		ShowUI(1);
	}
}
void CBasicsDlg::ShowUI(int nIDC){
	if (nIDC==1)
	{
		UISet();
	}
}

void CBasicsDlg::UISet(){
	CRect rc;
	GetDlgItem(IDC_GROUP)->GetWindowRect(rc);
	ScreenToClient(&rc);
	if (m_ScreenDlg)
	{
		m_ScreenDlg->MoveWindow(rc);
		m_ScreenDlg->ShowWindow(SW_HIDE);
		m_ScreenDlg->SetParent(this);
	}
	if (m_TimeDlg)
	{
		m_TimeDlg->MoveWindow(rc);
		m_TimeDlg->ShowWindow(SW_HIDE);
		m_TimeDlg->SetParent(this);
	}
	if (m_UIDlg)
	{
		m_UIDlg->MoveWindow(rc);
		m_UIDlg->ShowWindow(SW_SHOW);
		m_UIDlg->SetParent(this);

	}

	if (m_VolDlg)
	{
		m_VolDlg->MoveWindow(rc);
		m_VolDlg->ShowWindow(SW_HIDE);
		m_VolDlg->SetParent(this);
	}
	if (m_LedTimeDlg)
	{
		m_LedTimeDlg->MoveWindow(rc);
		m_LedTimeDlg->ShowWindow(SW_HIDE);
		m_LedTimeDlg->SetParent(this);
	}
	

}

void CBasicsDlg::ResetUI(int nID){
	UISet();
	if (m_ScreenDlg)
	{
		m_ScreenDlg->ShowWindow(SW_HIDE);
	}
	if (m_TimeDlg)
	{
		m_TimeDlg->ShowWindow(SW_HIDE);
	}
	if (m_UIDlg)
	{
		m_UIDlg->ShowWindow(SW_HIDE);
	}
	if (m_VolDlg)
	{
		m_VolDlg->ShowWindow(SW_HIDE);
	}
	if (m_LedTimeDlg)
	{
		m_LedTimeDlg->ShowWindow(SW_HIDE);
	}
	GetDlgItem(IDC_BTN_UI)->EnableWindow(TRUE);
	GetDlgItem(IDC_BTN_SCREEN)->EnableWindow(TRUE);
	GetDlgItem(IDC_BTN_LED)->EnableWindow(TRUE);
	GetDlgItem(IDC_BTN_VOL)->EnableWindow(TRUE);
	GetDlgItem(IDC_BTN_TIME)->EnableWindow(TRUE);
	GetDlgItem(nID)->EnableWindow(FALSE);
	switch (nID)
	{
		
	case IDC_BTN_UI:
		m_UIDlg->ShowWindow(SW_SHOW);
		break;
	case IDC_BTN_SCREEN:
		m_ScreenDlg->ShowWindow(SW_SHOW);
		break;
	case IDC_BTN_LED:
		m_LedTimeDlg->ShowWindow(SW_SHOW);
		break;
	case IDC_BTN_VOL:
		m_VolDlg->ShowWindow(SW_SHOW);
		break;
	case IDC_BTN_TIME:
		m_TimeDlg->ShowWindow(SW_SHOW);
		break;
	default:
		break;
	}
}
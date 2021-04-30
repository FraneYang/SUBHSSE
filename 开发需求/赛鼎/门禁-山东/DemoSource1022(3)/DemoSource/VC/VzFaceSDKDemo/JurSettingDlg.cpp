// JurSettingDlg.cpp : 实现文件
//

#include "stdafx.h"
#include "VzFaceSDKDemo.h"
#include "JurSettingDlg.h"
#include "afxdialogex.h"


// CJurSettingDlg 对话框

IMPLEMENT_DYNAMIC(CJurSettingDlg, CDialogEx)

CJurSettingDlg::CJurSettingDlg(VzLPRClientHandle cam, CWnd* pParent /*=NULL*/)
	: CDialogEx(CJurSettingDlg::IDD, pParent)
{
	m_cam = cam;
	m_JurSettingWeek = NULL;
	m_JurSettingVoliday = NULL;
}

CJurSettingDlg::~CJurSettingDlg()
{
	
}

void CJurSettingDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialogEx::DoDataExchange(pDX);
}


BEGIN_MESSAGE_MAP(CJurSettingDlg, CDialogEx)
	ON_BN_CLICKED(IDC_BTN_GET_DEV_NAME, &CJurSettingDlg::OnBnClickedBtnGetDevName)
	ON_BN_CLICKED(IDC_BTN_JUR1, &CJurSettingDlg::OnBnClickedBtnJur1)
	ON_BN_CLICKED(IDC_BTN_JUR2, &CJurSettingDlg::OnBnClickedBtnJur2)
	ON_BN_CLICKED(IDC_BTN_JUR4, &CJurSettingDlg::OnBnClickedBtnJur4)
	ON_BN_CLICKED(IDC_BTN_JUR3, &CJurSettingDlg::OnBnClickedBtnJur3)
	ON_BN_CLICKED(IDC_BTN_JUR5, &CJurSettingDlg::OnBnClickedBtnJur5)
	ON_BN_CLICKED(IDC_BUTTON9, &CJurSettingDlg::OnBnClickedButton9)
	ON_BN_CLICKED(IDC_BTN_W1, &CJurSettingDlg::OnBnClickedBtnW1)
	ON_BN_CLICKED(IDC_BTN_W2, &CJurSettingDlg::OnBnClickedBtnW2)
	ON_BN_CLICKED(IDC_BTN_W3, &CJurSettingDlg::OnBnClickedBtnW3)
	ON_BN_CLICKED(IDC_BTN_W4, &CJurSettingDlg::OnBnClickedBtnW4)
	ON_BN_CLICKED(IDC_BTN_W5, &CJurSettingDlg::OnBnClickedBtnW5)
	ON_BN_CLICKED(IDC_BTN_W6, &CJurSettingDlg::OnBnClickedBtnW6)
	ON_BN_CLICKED(IDC_BTN_W7, &CJurSettingDlg::OnBnClickedBtnW7)
	ON_BN_CLICKED(IDC_BTN_SET_NAME2, &CJurSettingDlg::OnBnClickedBtnSetName2)
	ON_BN_CLICKED(IDC_BTN_GET_NAME2, &CJurSettingDlg::OnBnClickedBtnGetName2)
	ON_BN_CLICKED(IDC_BTN_SET_DEV_NAME, &CJurSettingDlg::OnBnClickedBtnSetDevName)
	ON_MESSAGE(WM_USER_MSG_JUR, &CJurSettingDlg::OnUserMsg)
	ON_EN_KILLFOCUS(IDC_EDIT2, &CJurSettingDlg::OnKillfocusEdit2)
	ON_BN_CLICKED(IDC_BTN_VOLIDAY_ADD, &CJurSettingDlg::OnBnClickedBtnVolidayAdd)
	ON_BN_CLICKED(IDC_CHECK1, &CJurSettingDlg::OnBnClickedCheck1)
END_MESSAGE_MAP()


// CJurSettingDlg 消息处理程序


void CJurSettingDlg::OnBnClickedBtnGetDevName()
{
	// TODO:  在此添加控件通知处理程序代码
	char name[256] = {0};
	int nSize = 0;
	int nRet = ZBX_GetDevName(m_cam, name, &nSize);
	GetDlgItem(IDC_EDIT1)->SetWindowTextA(name);
	if (nRet==0)
	{
		AfxMessageBox("获取成功");
	}
	else
	{
		AfxMessageBox("获取失败");
	}
}


void CJurSettingDlg::OnBnClickedBtnJur1()
{
	// TODO:  在此添加控件通知处理程序代码
	m_nCurJur = 0;
	SetUIBtn(IDC_BTN_JUR1);
}


void CJurSettingDlg::OnBnClickedBtnJur2()
{
	// TODO:  在此添加控件通知处理程序代码

	m_nCurJur = 1;
	SetUIBtn(IDC_BTN_JUR2);
}

void CJurSettingDlg::OnBnClickedBtnJur3()
{
	// TODO:  在此添加控件通知处理程序代码

	m_nCurJur = 2;
	SetUIBtn(IDC_BTN_JUR3);
}


void CJurSettingDlg::OnBnClickedBtnJur4()
{
	// TODO:  在此添加控件通知处理程序代码

	m_nCurJur = 3;
	SetUIBtn(IDC_BTN_JUR4);
}


void CJurSettingDlg::OnBnClickedBtnJur5()
{
	// TODO:  在此添加控件通知处理程序代码
	m_nCurJur = 4;
	SetUIBtn(IDC_BTN_JUR5);
}

void CJurSettingDlg::SetUIBtn(int nID){

	m_JurSettingWeek->SetData(&m_Usercfs->user_rights[m_nCurJur].st_slots[m_nCurWeek]);
	m_JurSettingVoliday->SetData(&m_Usercfs->user_rights[m_nCurJur].dt_slots);
	GetDlgItem(IDC_EDIT2)->SetWindowTextA(m_Usercfs->user_rights[m_nCurJur].name);
	for (size_t i = IDC_BTN_JUR1; i < IDC_BTN_JUR5+1; i++)
	{
		GetDlgItem(i)->EnableWindow(TRUE);
	}
	GetDlgItem(nID)->EnableWindow(FALSE);

	((CButton*)GetDlgItem(IDC_CHECK1))->SetCheck(m_Usercfs->user_rights[m_nCurJur].dt_slots.n_enable);
}


void CJurSettingDlg::OnBnClickedButton9()
{
	// TODO:  在此添加控件通知处理程序代码
	m_JurSettingWeek->AddItem();
}


BOOL CJurSettingDlg::OnInitDialog()
{
	CDialogEx::OnInitDialog();

	// TODO:  在此添加额外的初始化
	SystemNetInfo* netinfo = new SystemNetInfo;
	memset(netinfo, 0, sizeof(SystemNetInfo));
	ZBX_GetNetConfig(m_cam, netinfo);
	if (netinfo->ip_addr)
	{
		GetDlgItem(IDC_STC_IP)->SetWindowText(netinfo->ip_addr);
	}
	
	m_JurSettingWeek = new CDlgJurChild;
	m_JurSettingWeek->Create(IDD_DLG_JURCHILD, this);
	CRect rc;
	GetDlgItem(IDC_GROUP_W)->GetWindowRect(rc);
	ScreenToClient(&rc);
	m_JurSettingWeek->MoveWindow(rc);
	m_JurSettingWeek->ShowWindow(SW_SHOW);

	GetDlgItem(IDC_GROUP_V)->GetWindowRect(rc);
	ScreenToClient(&rc);
	m_JurSettingVoliday = new CDlgJurChildV;
	m_JurSettingVoliday->Create(IDD_DLG_JURCHILD_V, this);
	m_JurSettingVoliday->MoveWindow(rc);
	m_JurSettingVoliday->ShowWindow(SW_SHOW);
	char name[256] = { 0 };
	int nSize = 0;
	int nRet = ZBX_GetDevName(m_cam, name, &nSize);
	GetDlgItem(IDC_EDIT1)->SetWindowTextA(name);

	OnMsgUpdateUI();

	return TRUE;  // return TRUE unless you set the focus to a control
	// 异常:  OCX 属性页应返回 FALSE
}

void CJurSettingDlg::InitUI(int nId){

	GetDlgItem(IDC_BTN_W1)->EnableWindow(TRUE);
	GetDlgItem(IDC_BTN_W2)->EnableWindow(TRUE);
	GetDlgItem(IDC_BTN_W3)->EnableWindow(TRUE);
	GetDlgItem(IDC_BTN_W4)->EnableWindow(TRUE);
	GetDlgItem(IDC_BTN_W5)->EnableWindow(TRUE);
	GetDlgItem(IDC_BTN_W6)->EnableWindow(TRUE);
	GetDlgItem(IDC_BTN_W7)->EnableWindow(TRUE);
	switch (nId)
	{
	case IDC_BTN_W1:
		GetDlgItem(IDC_BTN_W1)->EnableWindow(FALSE);
		break;
	case IDC_BTN_W2:
		GetDlgItem(IDC_BTN_W2)->EnableWindow(FALSE);
		break;
	case IDC_BTN_W3:
		GetDlgItem(IDC_BTN_W3)->EnableWindow(FALSE);
		break;
	case IDC_BTN_W4:
		GetDlgItem(IDC_BTN_W4)->EnableWindow(FALSE);
		break;
	case IDC_BTN_W5:
		GetDlgItem(IDC_BTN_W5)->EnableWindow(FALSE);
		break;
	case IDC_BTN_W6:
		GetDlgItem(IDC_BTN_W6)->EnableWindow(FALSE);
		break;
	case IDC_BTN_W7:
		GetDlgItem(IDC_BTN_W7)->EnableWindow(FALSE);
		break;
	default:
		break;
	}
}

LRESULT CJurSettingDlg::OnUserMsg(WPARAM w, LPARAM l)
{
	switch ((int)w)
	{
	case WM_UPDATEUI_MSG:
		m_Usercfs = theApp.m_mapUserRightCfgs[m_cam];
		SetUIBtn(IDC_BTN_JUR1);
		OnBnClickedBtnW1();
		SetUIJurNames();
		break;
	}
	return 1l;
}


void CJurSettingDlg::SetUIJurNames(){
	for (size_t i = 0; i < 6; i++)
	{
		CString str = m_Usercfs->user_rights[i].name;
		if (str.IsEmpty())
		{
			continue;;
		}else
		{
			switch (i)
			{
			case 0:
				GetDlgItem(IDC_BTN_JUR1)->SetWindowTextA(m_Usercfs->user_rights[i].name);
				break; 
			case 1:
				GetDlgItem(IDC_BTN_JUR2)->SetWindowTextA(m_Usercfs->user_rights[i].name);
				break;
			case 2:
				GetDlgItem(IDC_BTN_JUR3)->SetWindowTextA(m_Usercfs->user_rights[i].name);
				break;
			case 3:
				GetDlgItem(IDC_BTN_JUR4)->SetWindowTextA(m_Usercfs->user_rights[i].name);
				break;
			case 4:
				GetDlgItem(IDC_BTN_JUR5)->SetWindowTextA(m_Usercfs->user_rights[i].name);
				break;
			default:
				break;
			}
		}
	}
}


void CJurSettingDlg::OnBnClickedBtnW1()
{
	// TODO:  在此添加控件通知处理程序代码
	m_nCurWeek = 1;
	m_JurSettingWeek->SetData(&m_Usercfs->user_rights[m_nCurJur].st_slots[1]);
	InitUI(IDC_BTN_W1);
}


void CJurSettingDlg::OnMsgUpdateUI(){

	PostMessage(WM_USER_MSG_JUR, (WPARAM)WM_UPDATEUI_MSG, NULL);
}


void CJurSettingDlg::OnBnClickedBtnW2()
{
	// TODO:  在此添加控件通知处理程序代码

	m_nCurWeek = 2;
	m_JurSettingWeek->SetData(&m_Usercfs->user_rights[m_nCurJur].st_slots[2]);
	InitUI(IDC_BTN_W2);
}


void CJurSettingDlg::OnBnClickedBtnW3()
{
	// TODO:  在此添加控件通知处理程序代码

	m_nCurWeek = 3;
	m_JurSettingWeek->SetData(&m_Usercfs->user_rights[m_nCurJur].st_slots[3]);
	InitUI(IDC_BTN_W3);
}


void CJurSettingDlg::OnBnClickedBtnW4()
{
	// TODO:  在此添加控件通知处理程序代码

	m_nCurWeek = 4;
	m_JurSettingWeek->SetData(&m_Usercfs->user_rights[m_nCurJur].st_slots[4]);
	InitUI(IDC_BTN_W4);
}


void CJurSettingDlg::OnBnClickedBtnW5()
{
	// TODO:  在此添加控件通知处理程序代码

	m_nCurWeek = 5;
	m_JurSettingWeek->SetData(&m_Usercfs->user_rights[m_nCurJur].st_slots[5]);
	InitUI(IDC_BTN_W5);
}


void CJurSettingDlg::OnBnClickedBtnW6()
{
	// TODO:  在此添加控件通知处理程序代码

	m_nCurWeek = 6;
	m_JurSettingWeek->SetData(&m_Usercfs->user_rights[m_nCurJur].st_slots[6]);
	InitUI(IDC_BTN_W6);
}


void CJurSettingDlg::OnBnClickedBtnW7()
{
	// TODO:  在此添加控件通知处理程序代码

	m_nCurWeek = 0;
	m_JurSettingWeek->SetData(&m_Usercfs->user_rights[m_nCurJur].st_slots[0]);
	InitUI(IDC_BTN_W7);
}


void CJurSettingDlg::OnBnClickedBtnSetName2()
{
	// TODO:  在此添加控件通知处理程序代码
	int nRet = ZBX_SetUserRightsCfg(m_cam, *m_Usercfs);
	if (nRet==0)
	{
		AfxMessageBox("修改完成");
		m_Usercfs = theApp.m_mapUserRightCfgs[m_cam];
		SetUIJurNames();
	}
	else
	{
		AfxMessageBox("修改失败");
	}
}


void CJurSettingDlg::OnBnClickedBtnGetName2()
{
	// TODO:  在此添加控件通知处理程序代码
	//CWnd* hwnd = AfxGetMainWnd();
	//hwnd->PostMessage(WM_USER_MSG_JUR, (WPARAM)6, (LPARAM)this);
	ZBX_GetUserRightsCfg(m_cam);
	AfxMessageBox("读取完成");
	OnMsgUpdateUI();
}


void CJurSettingDlg::OnBnClickedBtnSetDevName()
{
	// TODO:  在此添加控件通知处理程序代码
	CString str;
	GetDlgItem(IDC_EDIT1)->GetWindowTextA(str);
	if (!str.IsEmpty())
	{
		int nRet = ZBX_SetDevName(m_cam, str.GetBuffer());
		if (nRet==0)
		{
			AfxMessageBox("修改成功");
		}
		else
		{
			AfxMessageBox("修改失败");
		}
	}
}


void CJurSettingDlg :: SetJurName(int nID){

}


void CJurSettingDlg::OnKillfocusEdit2()
{
	// TODO:  在此添加控件通知处理程序代码
	CString str;
	GetDlgItem(IDC_EDIT2)->GetWindowTextA(str);
	memcpy(m_Usercfs->user_rights[m_nCurJur].name, str, 32);
	
}


void CJurSettingDlg::OnBnClickedBtnVolidayAdd()
{
	// TODO:  在此添加控件通知处理程序代码

	m_JurSettingVoliday->AddItem();
}


void CJurSettingDlg::OnBnClickedCheck1()
{
	// TODO:  在此添加控件通知处理程序代码
	int nUIData = ((CButton*)GetDlgItem(IDC_CHECK1))->GetCheck();
	m_Usercfs->user_rights[m_nCurJur].dt_slots.n_enable = nUIData;
}


BOOL CJurSettingDlg::PreTranslateMessage(MSG* pMsg)
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

// BasicScreenDlg.cpp : 实现文件
//

#include "stdafx.h"
#include "VzFaceSDKDemo.h"
#include "BasicScreenDlg.h"
#include "afxdialogex.h"


// CBasicScreenDlg 对话框

IMPLEMENT_DYNAMIC(CBasicScreenDlg, CDialogEx)

CBasicScreenDlg::CBasicScreenDlg(VzLPRClientHandle cam, CWnd* pParent /*=NULL*/)
	: CDialogEx(CBasicScreenDlg::IDD, pParent)
{
	m_cam = cam;
}

CBasicScreenDlg::~CBasicScreenDlg()
{
}

void CBasicScreenDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialogEx::DoDataExchange(pDX);
	DDX_Control(pDX, IDC_COMBO1, m_Comwdr);
	DDX_Control(pDX, IDC_START_TIME, start_time_ctrl_);
	DDX_Control(pDX, IDC_END_TIME, end_time_ctrl_);
}


BEGIN_MESSAGE_MAP(CBasicScreenDlg, CDialogEx)
	ON_BN_CLICKED(IDC_BTN_VOL, &CBasicScreenDlg::OnBnClickedBtnVol)
	ON_BN_CLICKED(IDC_SCAREEN_READ, &CBasicScreenDlg::OnBnClickedScareenRead)
	ON_BN_CLICKED(IDC_SCAREENSAVE, &CBasicScreenDlg::OnBnClickedScareensave)
	ON_BN_CLICKED(IDC_BTN_LOAD, &CBasicScreenDlg::OnBnClickedBtnLoad)
	ON_BN_CLICKED(IDC_BTN_WDRSET, &CBasicScreenDlg::OnBnClickedBtnWdrset)
	ON_BN_CLICKED(IDC_BTN_WDR, &CBasicScreenDlg::OnBnClickedBtnWdr)
	ON_CBN_SELCHANGE(IDC_COMBO1, &CBasicScreenDlg::OnCbnSelchangeCombo1)
	ON_BN_CLICKED(IDC_BTN_ADD_LOAD, &CBasicScreenDlg::OnBnClickedBtnAddLoad)
	ON_BN_CLICKED(IDC_BTN_SET, &CBasicScreenDlg::OnBnClickedBtnSet)
END_MESSAGE_MAP()


// CBasicScreenDlg 消息处理程序


void CBasicScreenDlg::OnBnClickedBtnVol()
{
	// TODO:  在此添加控件通知处理程序代码
	
}


void CBasicScreenDlg::OnBnClickedScareenRead()
{
	// TODO:  在此添加控件通知处理程序代码
	GetInfo(true);
	
}
void CBasicScreenDlg::GetInfo(bool bshow=false){
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
		if (bshow)
		{
			AfxMessageBox("读取成功");
		}
	}
	else
	{
		if (bshow)
		{
			AfxMessageBox("读取失败");
		}
	}
}

void CBasicScreenDlg::OnBnClickedScareensave()
{
	// TODO:  在此添加控件通知处理程序代码
	bool bSet = ((CButton*)GetDlgItem(IDC_CHECK))->GetCheck();
	if (bSet)
	{
		CString strT;
		GetDlgItem(IDC_EDIT2)->GetWindowTextA(strT);
		int t = atoi(strT);
		int n = ZBX_SetExtinguishingScreenTime(m_cam, t);
		if (n == 0)
		{
			AfxMessageBox("设置成功");
		}
	}
	else
	{
		int n = ZBX_SetExtinguishingScreenTime(m_cam, 0);
		if (n == 0)
		{
			AfxMessageBox("设置成功");
		}
	}
}


void CBasicScreenDlg::OnBnClickedBtnLoad()
{
	// TODO:  在此添加控件通知处理程序代码
}


BOOL CBasicScreenDlg::OnInitDialog()
{
	CDialogEx::OnInitDialog();

	// TODO:  在此添加额外的初始化
	start_time_ctrl_.EnableWindow(FALSE);
	end_time_ctrl_.EnableWindow(FALSE);
	//m_Comwdr.InsertString(0, "自动");
	m_Comwdr.InsertString(0, "关闭");
	m_Comwdr.InsertString(1, "打开");
	m_Comwdr.InsertString(2, "时间段");
	GetInfo(false);
	OnGetwdr(false);
	return TRUE;  // return TRUE unless you set the focus to a control
	// 异常:  OCX 属性页应返回 FALSE
}


BOOL CBasicScreenDlg::PreTranslateMessage(MSG* pMsg)
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


void CBasicScreenDlg::OnBnClickedBtnWdrset()
{
	// TODO:  在此添加控件通知处理程序代码
	int pos = m_Comwdr.GetCurSel();
	int nModel = pos + 1;

	WDR_time_ctrl model;
	memset(&model, 0, sizeof(WDR_time_ctrl));
	model.model = nModel;

	SYSTEMTIME t;
	start_time_ctrl_.GetTime(&t);
	model.start_time = t.wHour * 3600 + t.wMinute * 60 + t.wSecond;
	memset(&t, 0, sizeof(SYSTEMTIME));
	end_time_ctrl_.GetTime(&t);
	model.end_time = t.wHour * 3600 + t.wMinute * 60 + t.wSecond;
	int nRet = ZBX_SetIspWdrEx(m_cam, model);
	if (nRet == 0)
	{
		AfxMessageBox("设置成功");
	}
	else
	{

		AfxMessageBox("设置失败");
	}
}

void CBasicScreenDlg::OnGetwdr(bool bshow){
	WDR_time_ctrl model;
	memset(&model, 0, sizeof(WDR_time_ctrl));
	int nRet = ZBX_GetIspWdrEx(m_cam, &model);
	if (nRet == 0)
	{
		if (bshow){
			AfxMessageBox("获取成功");
		}
		m_Comwdr.SetCurSel(model.model - 1);
		if (model.model==3)
		{
			start_time_ctrl_.EnableWindow(TRUE);
			end_time_ctrl_.EnableWindow(TRUE);
			SYSTEMTIME t;
			GetLocalTime(&t);
			t.wHour = model.start_time / 3600;
			t.wMinute = (model.start_time - (t.wHour) * 3600) / 60;
			t.wSecond = model.start_time - (t.wHour) * 3600 - t.wMinute*60;

			start_time_ctrl_.SetTime(t);

			GetLocalTime(&t);
			t.wHour = model.end_time / 3600;
			t.wMinute = (model.end_time - (t.wHour) * 3600) / 60;
			t.wSecond = model.end_time - (t.wHour) * 3600 - t.wMinute * 60;
			end_time_ctrl_.SetTime(t);
		}
	}
	else{
		if (bshow)
		{
			AfxMessageBox("获取失败");
		}
	}

}


void CBasicScreenDlg::OnBnClickedBtnWdr()
{
	// TODO:  在此添加控件通知处理程序代码
	OnGetwdr(true);
}


void CBasicScreenDlg::OnCbnSelchangeCombo1()
{
	// TODO:  在此添加控件通知处理程序代码
	int pos = m_Comwdr.GetCurSel();
	if (pos==2)
	{
		start_time_ctrl_.EnableWindow(TRUE);
		end_time_ctrl_.EnableWindow(TRUE);
	}
	else
	{
		start_time_ctrl_.EnableWindow(FALSE);
		end_time_ctrl_.EnableWindow(FALSE);
	}
}


void CBasicScreenDlg::OnBnClickedBtnAddLoad()
{
	// TODO:  在此添加控件通知处理程序代码
	TCHAR           szFolderPath[MAX_PATH] = { 0 };
	CString         strFolderPath = TEXT("");
	BROWSEINFO      sInfo;
	::ZeroMemory(&sInfo, sizeof(BROWSEINFO));
	sInfo.pidlRoot = 0;
	sInfo.lpszTitle = _T("请选择图片路径");
	sInfo.ulFlags = BIF_RETURNONLYFSDIRS | BIF_EDITBOX | BIF_DONTGOBELOWDOMAIN;
	sInfo.lpfn = NULL;
	// 显示文件夹选择对话框  
	LPITEMIDLIST lpidlBrowse = ::SHBrowseForFolder(&sInfo);
	if (lpidlBrowse != NULL)
	{
		// 取得文件夹名  
		if (::SHGetPathFromIDList(lpidlBrowse, szFolderPath))
		{
			strFolderPath = szFolderPath;
		}
	}
	else
	{
		return;
	}
	if (PathFileExists(strFolderPath))
	{
		GetDlgItem(IDC_EDIT_ADDPATH)->SetWindowText(strFolderPath);
	}
}


void CBasicScreenDlg::OnBnClickedBtnSet()
{
	// TODO:  在此添加控件通知处理程序代码
	CString strFolderPath;
	GetDlgItem(IDC_EDIT_ADDPATH)->GetWindowText(strFolderPath);
	CFileFind finder;
	CString filePath;
	if (strFolderPath.Right(1) != "\\")
		strFolderPath += "\\";
	strFolderPath += "*.jpg*";
	BOOL bWorking = finder.FindFile(strFolderPath);
	while (bWorking)	{
		bWorking = finder.FindNextFile();
		filePath = finder.GetFilePath();		//strPath就是所要获取Test目录下的文件夹和文件（包括路径）	

		//AddStateMsg(loginfo);
		//m_List.AddString(strPath);	
		ZBX_UpdateAdFile(m_cam, filePath);
	}
	finder.Close();
	AfxMessageBox("上传完成");
}

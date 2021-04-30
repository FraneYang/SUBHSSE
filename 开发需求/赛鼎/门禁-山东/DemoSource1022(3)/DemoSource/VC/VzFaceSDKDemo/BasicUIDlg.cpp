// BasicUIDlg.cpp : 实现文件
//

#include "stdafx.h"
#include "VzFaceSDKDemo.h"
#include "BasicUIDlg.h"
#include "afxdialogex.h"


// CBasicUIDlg 对话框

IMPLEMENT_DYNAMIC(CBasicUIDlg, CDialogEx)

CBasicUIDlg::CBasicUIDlg(VzLPRClientHandle cam, CWnd* pParent /*=NULL*/)
	: CDialogEx(CBasicUIDlg::IDD, pParent)
{
	m_cam = cam;
}

CBasicUIDlg::~CBasicUIDlg()
{
}

void CBasicUIDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialogEx::DoDataExchange(pDX);
}


BEGIN_MESSAGE_MAP(CBasicUIDlg, CDialogEx)
	ON_BN_CLICKED(IDC_BTN_TITLE, &CBasicUIDlg::OnBnClickedBtnTitle)
	ON_BN_CLICKED(IDC_BUTTON1, &CBasicUIDlg::OnBnClickedButton1)
	ON_BN_CLICKED(IDC_BUTTON2, &CBasicUIDlg::OnBnClickedButton2)
	ON_BN_CLICKED(IDC_BTN_AUTO, &CBasicUIDlg::OnBnClickedBtnAuto)
	ON_BN_CLICKED(IDC_BTN_SET, &CBasicUIDlg::OnBnClickedBtnSet)
	ON_BN_CLICKED(IDC_BTN_GETTITLE, &CBasicUIDlg::OnBnClickedBtnGettitle)
	ON_BN_CLICKED(IDC_BTN_CHOSE, &CBasicUIDlg::OnBnClickedBtnChose)
END_MESSAGE_MAP()


// CBasicUIDlg 消息处理程序


void CBasicUIDlg::OnBnClickedBtnTitle()
{
	// TODO:  在此添加控件通知处理程序代码
	// TODO: Add your control notification handler code here
	char Title[256] = { 0 };
	CString strTitle;
	GetDlgItem(IDC_EDIT1)->GetWindowTextA(strTitle);
	strcpy(Title, strTitle);
	int nLenth = strTitle.GetLength();
	int iRet = ZBX_SetScreenOsdTitle(m_cam, (char*)util::Convert<util::utf8>(Title).c_str());
	if (!iRet)
	{
		AfxMessageBox("设置成功");
	}
	else
	{
		AfxMessageBox("设置失败");
	}
	strTitle.ReleaseBuffer();
	
}


void CBasicUIDlg::OnBnClickedButton1()
{
	// TODO:  在此添加控件通知处理程序代码
	LPCTSTR lpszFilter = "image files(*.bmp;*.BMP;*.Bmp) | *.bmp;*.BMP;*.Bmp||";
	CFileDialog dlg(TRUE, lpszFilter, NULL, OFN_HIDEREADONLY | OFN_OVERWRITEPROMPT, lpszFilter, NULL);
	CString filepath;
	CFile file;
	//打开文件对话框
	if (dlg.DoModal() == IDOK)
	{
		filepath = dlg.GetPathName();
		if (!PathFileExists(filepath))
		{
			AfxMessageBox("请选择文件");
			return;
		}
	}
	GetDlgItem(IDC_EDIT2)->SetWindowTextA(filepath);
}


void CBasicUIDlg::OnBnClickedButton2()
{
	// TODO:  在此添加控件通知处理程序代码
}


void CBasicUIDlg::OnBnClickedBtnAuto()
{
	// TODO:  在此添加控件通知处理程序代码
	int nRet = ZBX_SetBackGroudDefault(m_cam);
	if (nRet == 0)
	{
		ZBX_SetUIPackage(m_cam, "", 0);
		AfxMessageBox("已重置");
	}
	else
	{
		AfxMessageBox("重置失败");
	}
}


void CBasicUIDlg::OnBnClickedBtnSet()
{
	// TODO:  在此添加控件通知处理程序代码
	CString str;
	GetDlgItem(IDC_EDIT2)->GetWindowTextA(str);
	if (!PathFileExists(str))
	{
		AfxMessageBox("文件不存在");
	}
	int nret = ZBX_UpdateBackgroud(m_cam, str.GetBuffer());
	if (nret==0)
	{
		ZBX_UpdateBackGroudDefault(m_cam);
		AfxMessageBox("应用成功");
	}
	else{
		AfxMessageBox("上传失败");
	}
}


void CBasicUIDlg::OnBnClickedBtnGettitle()
{
	// TODO:  在此添加控件通知处理程序代码
	GetInfo(true);
}
void CBasicUIDlg::GetInfo(bool bShow){
	char Title[256] = { 0 };
	int iRet = ZBX_GetScreenOsdTitle(m_cam, Title);
	if (iRet==0)
	{
		GetDlgItem(IDC_EDIT1)->SetWindowTextA(util::Convert<util::ascii>(Title).c_str());
		if (bShow)
		{
			AfxMessageBox("获取成功");
		}
	}
	else
	{
		if (bShow)
		{
			AfxMessageBox("获取失败");
		}
	}
	
}

BOOL CBasicUIDlg::OnInitDialog()
{
	CDialogEx::OnInitDialog();

	// TODO:  在此添加额外的初始化
	if (theApp.m_nCustomMade==1)
	{
		GetDlgItem(IDC_BTN_CHOSE)->ShowWindow(SW_SHOW);
	}
	GetInfo(false);
	return TRUE;  // return TRUE unless you set the focus to a control
	// 异常:  OCX 属性页应返回 FALSE
}


BOOL CBasicUIDlg::PreTranslateMessage(MSG* pMsg)
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


void CBasicUIDlg::OnBnClickedBtnChose()
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
		int nRet = ZBX_SetUIPackage(m_cam, strFolderPath, 1);
		if (nRet==0)
		{
			ZBX_UpdateBackGroudDefault(m_cam);
			AfxMessageBox("更换成功");
		}
		else
		{

			AfxMessageBox("更换失败");
		}
	}
}

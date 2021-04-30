// DlgPicSavePath.cpp : 实现文件
//

#include "stdafx.h"
#include "VzFaceSDKDemo.h"
#include "DlgPicSavePath.h"
#include "afxdialogex.h"


// CDlgPicSavePath 对话框

IMPLEMENT_DYNAMIC(CDlgPicSavePath, CDialogEx)

CDlgPicSavePath::CDlgPicSavePath(CString curPath, CWnd* pParent /*=NULL*/)
	: CDialogEx(CDlgPicSavePath::IDD, pParent)
{
	m_curPath = curPath;
}

CDlgPicSavePath::~CDlgPicSavePath()
{
}

void CDlgPicSavePath::GetChangePath(CString &strPath)
{
	strPath = m_curPath;
}

void CDlgPicSavePath::DoDataExchange(CDataExchange* pDX)
{
	CDialogEx::DoDataExchange(pDX);
}


BEGIN_MESSAGE_MAP(CDlgPicSavePath, CDialogEx)
	ON_BN_CLICKED(IDC_BUTTON1, &CDlgPicSavePath::OnBnClickedButton1)
END_MESSAGE_MAP()


// CDlgPicSavePath 消息处理程序


void CDlgPicSavePath::OnBnClickedButton1()
{
	// TODO:  在此添加控件通知处理程序代码
	TCHAR           szFolderPath[MAX_PATH] = { 0 };
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
			m_curPath = szFolderPath;
			GetDlgItem(IDC_EDIT1)->SetWindowTextA(m_curPath);
			WritePrivateProfileStringA("SET", "PicPath", m_curPath, ".\\Demo.ini");
			OnOK();
		}
	}
	else
	{
		OnCancel();
	}
}


BOOL CDlgPicSavePath::OnInitDialog()
{
	CDialogEx::OnInitDialog();

	// TODO:  在此添加额外的初始化
	GetDlgItem(IDC_EDIT1)->SetWindowTextA(m_curPath);
	return TRUE;  // return TRUE unless you set the focus to a control
	// 异常:  OCX 属性页应返回 FALSE
}

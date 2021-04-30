// DlgPicSavePath.cpp : ʵ���ļ�
//

#include "stdafx.h"
#include "VzFaceSDKDemo.h"
#include "DlgPicSavePath.h"
#include "afxdialogex.h"


// CDlgPicSavePath �Ի���

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


// CDlgPicSavePath ��Ϣ�������


void CDlgPicSavePath::OnBnClickedButton1()
{
	// TODO:  �ڴ���ӿؼ�֪ͨ����������
	TCHAR           szFolderPath[MAX_PATH] = { 0 };
	BROWSEINFO      sInfo;
	::ZeroMemory(&sInfo, sizeof(BROWSEINFO));
	sInfo.pidlRoot = 0;
	sInfo.lpszTitle = _T("��ѡ��ͼƬ·��");
	sInfo.ulFlags = BIF_RETURNONLYFSDIRS | BIF_EDITBOX | BIF_DONTGOBELOWDOMAIN;
	sInfo.lpfn = NULL;
	// ��ʾ�ļ���ѡ��Ի���  
	LPITEMIDLIST lpidlBrowse = ::SHBrowseForFolder(&sInfo);
	if (lpidlBrowse != NULL)
	{
		// ȡ���ļ�����  
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

	// TODO:  �ڴ���Ӷ���ĳ�ʼ��
	GetDlgItem(IDC_EDIT1)->SetWindowTextA(m_curPath);
	return TRUE;  // return TRUE unless you set the focus to a control
	// �쳣:  OCX ����ҳӦ���� FALSE
}

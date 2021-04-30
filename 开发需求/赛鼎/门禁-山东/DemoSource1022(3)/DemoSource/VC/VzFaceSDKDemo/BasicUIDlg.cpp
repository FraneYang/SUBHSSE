// BasicUIDlg.cpp : ʵ���ļ�
//

#include "stdafx.h"
#include "VzFaceSDKDemo.h"
#include "BasicUIDlg.h"
#include "afxdialogex.h"


// CBasicUIDlg �Ի���

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


// CBasicUIDlg ��Ϣ�������


void CBasicUIDlg::OnBnClickedBtnTitle()
{
	// TODO:  �ڴ���ӿؼ�֪ͨ����������
	// TODO: Add your control notification handler code here
	char Title[256] = { 0 };
	CString strTitle;
	GetDlgItem(IDC_EDIT1)->GetWindowTextA(strTitle);
	strcpy(Title, strTitle);
	int nLenth = strTitle.GetLength();
	int iRet = ZBX_SetScreenOsdTitle(m_cam, (char*)util::Convert<util::utf8>(Title).c_str());
	if (!iRet)
	{
		AfxMessageBox("���óɹ�");
	}
	else
	{
		AfxMessageBox("����ʧ��");
	}
	strTitle.ReleaseBuffer();
	
}


void CBasicUIDlg::OnBnClickedButton1()
{
	// TODO:  �ڴ���ӿؼ�֪ͨ����������
	LPCTSTR lpszFilter = "image files(*.bmp;*.BMP;*.Bmp) | *.bmp;*.BMP;*.Bmp||";
	CFileDialog dlg(TRUE, lpszFilter, NULL, OFN_HIDEREADONLY | OFN_OVERWRITEPROMPT, lpszFilter, NULL);
	CString filepath;
	CFile file;
	//���ļ��Ի���
	if (dlg.DoModal() == IDOK)
	{
		filepath = dlg.GetPathName();
		if (!PathFileExists(filepath))
		{
			AfxMessageBox("��ѡ���ļ�");
			return;
		}
	}
	GetDlgItem(IDC_EDIT2)->SetWindowTextA(filepath);
}


void CBasicUIDlg::OnBnClickedButton2()
{
	// TODO:  �ڴ���ӿؼ�֪ͨ����������
}


void CBasicUIDlg::OnBnClickedBtnAuto()
{
	// TODO:  �ڴ���ӿؼ�֪ͨ����������
	int nRet = ZBX_SetBackGroudDefault(m_cam);
	if (nRet == 0)
	{
		ZBX_SetUIPackage(m_cam, "", 0);
		AfxMessageBox("������");
	}
	else
	{
		AfxMessageBox("����ʧ��");
	}
}


void CBasicUIDlg::OnBnClickedBtnSet()
{
	// TODO:  �ڴ���ӿؼ�֪ͨ����������
	CString str;
	GetDlgItem(IDC_EDIT2)->GetWindowTextA(str);
	if (!PathFileExists(str))
	{
		AfxMessageBox("�ļ�������");
	}
	int nret = ZBX_UpdateBackgroud(m_cam, str.GetBuffer());
	if (nret==0)
	{
		ZBX_UpdateBackGroudDefault(m_cam);
		AfxMessageBox("Ӧ�óɹ�");
	}
	else{
		AfxMessageBox("�ϴ�ʧ��");
	}
}


void CBasicUIDlg::OnBnClickedBtnGettitle()
{
	// TODO:  �ڴ���ӿؼ�֪ͨ����������
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
			AfxMessageBox("��ȡ�ɹ�");
		}
	}
	else
	{
		if (bShow)
		{
			AfxMessageBox("��ȡʧ��");
		}
	}
	
}

BOOL CBasicUIDlg::OnInitDialog()
{
	CDialogEx::OnInitDialog();

	// TODO:  �ڴ���Ӷ���ĳ�ʼ��
	if (theApp.m_nCustomMade==1)
	{
		GetDlgItem(IDC_BTN_CHOSE)->ShowWindow(SW_SHOW);
	}
	GetInfo(false);
	return TRUE;  // return TRUE unless you set the focus to a control
	// �쳣:  OCX ����ҳӦ���� FALSE
}


BOOL CBasicUIDlg::PreTranslateMessage(MSG* pMsg)
{
	// TODO:  �ڴ����ר�ô����/����û���
	if (pMsg->message == WM_KEYDOWN)	{
		switch (pMsg->wParam)		{
		case VK_ESCAPE: //Esc�����¼�				
			return true;
		case VK_RETURN: //Enter�����¼�				
			return true;
		default:
			;
		}
	}
	return CDialogEx::PreTranslateMessage(pMsg);
}


void CBasicUIDlg::OnBnClickedBtnChose()
{
	// TODO:  �ڴ���ӿؼ�֪ͨ����������
	TCHAR           szFolderPath[MAX_PATH] = { 0 };
	CString         strFolderPath = TEXT("");
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
			AfxMessageBox("�����ɹ�");
		}
		else
		{

			AfxMessageBox("����ʧ��");
		}
	}
}

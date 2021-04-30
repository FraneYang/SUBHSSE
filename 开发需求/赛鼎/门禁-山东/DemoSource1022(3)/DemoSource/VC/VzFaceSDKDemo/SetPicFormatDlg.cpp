// SetPicFormatDlg.cpp : implementation file
//

#include "stdafx.h"
#include "VzFaceSDKDemo.h"
#include "SetPicFormatDlg.h"
#include "afxdialogex.h"


// CSetPicFormatDlg dialog

IMPLEMENT_DYNAMIC(CSetPicFormatDlg, CDialogEx)

CSetPicFormatDlg::CSetPicFormatDlg(CWnd* pParent /*=NULL*/)
	: CDialogEx(CSetPicFormatDlg::IDD, pParent)
{

}

CSetPicFormatDlg::~CSetPicFormatDlg()
{
}

void CSetPicFormatDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialogEx::DoDataExchange(pDX);
}


BEGIN_MESSAGE_MAP(CSetPicFormatDlg, CDialogEx)
	ON_BN_CLICKED(IDC_BUTTON1, &CSetPicFormatDlg::OnBnClickedButton1)
	ON_BN_CLICKED(IDC_BUTTON10, &CSetPicFormatDlg::OnBnClickedButton10)
	ON_BN_CLICKED(IDC_BUTTON2, &CSetPicFormatDlg::OnBnClickedButton2)
	ON_BN_CLICKED(IDC_BTN_SAVE, &CSetPicFormatDlg::OnBnClickedBtnSave)
	ON_BN_CLICKED(IDC_BUTTON12, &CSetPicFormatDlg::OnBnClickedButton12)
	ON_BN_CLICKED(IDC_BUTTON17, &CSetPicFormatDlg::OnBnClickedButton17)
	ON_BN_CLICKED(IDC_BUTTON15, &CSetPicFormatDlg::OnBnClickedButton15)
END_MESSAGE_MAP()


// CSetPicFormatDlg message handlers


void CSetPicFormatDlg::OnBnClickedButton1()
{
	// TODO: Add your control notification handler code here
	GetDlgItem(IDC_BUTTON1)->EnableWindow(FALSE);
	SetInfo("姓名");
}

void CSetPicFormatDlg::SetInfo(CString info){
	CString Tmp;
	Tmp = m_strFormat;
	if (m_strFormat.IsEmpty())
	{
		m_strFormat = info;
		GetDlgItem(IDC_STC_INFO)->SetWindowTextA(m_strFormat + ".jpg");
		return;
	}
	m_strFormat.Format("%s_%s", Tmp, info);
	GetDlgItem(IDC_STC_INFO)->SetWindowTextA(m_strFormat + ".jpg");
}


void CSetPicFormatDlg::OnBnClickedButton10()
{
	// TODO: Add your control notification handler code here
	GetDlgItem(IDC_BUTTON10)->EnableWindow(FALSE);
	SetInfo("类型");
}
void CSetPicFormatDlg::GetFormat(CString &format)
{
	format = m_strFormat;
}


void CSetPicFormatDlg::OnBnClickedButton2()
{
	// TODO: Add your control notification handler code here
	m_strFormat = "";
	GetDlgItem(IDC_STC_INFO)->SetWindowTextA(m_strFormat);

	GetDlgItem(IDC_BUTTON1)->EnableWindow(TRUE);
	GetDlgItem(IDC_BUTTON10)->EnableWindow(TRUE);
	GetDlgItem(IDC_BUTTON12)->EnableWindow(TRUE);
	GetDlgItem(IDC_BUTTON17)->EnableWindow(TRUE);
	
}


void CSetPicFormatDlg::OnBnClickedBtnSave()
{
	// TODO: Add your control notification handler code here
	AfxMessageBox("保存成功");
	OnOK();
}


void CSetPicFormatDlg::OnBnClickedButton12()
{
	// TODO: Add your control notification handler code here
	SetInfo("身份证号");
}


void CSetPicFormatDlg::OnBnClickedButton17()
{
	// TODO: Add your control notification handler code here
	SetInfo("韦根号");
}


void CSetPicFormatDlg::OnBnClickedButton15()
{
	// TODO: Add your control notification handler code here
	SetInfo("ID");
}

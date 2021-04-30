// SystemKeyDlg.cpp : 实现文件
//

#include "stdafx.h"
#include "VzFaceSDKDemo.h"
#include "SystemKeyDlg.h"
#include "afxdialogex.h"


// CSystemKeyDlg 对话框

IMPLEMENT_DYNAMIC(CSystemKeyDlg, CDialogEx)

CSystemKeyDlg::CSystemKeyDlg(VzLPRClientHandle cam, CWnd* pParent /*=NULL*/)
	: CDialogEx(CSystemKeyDlg::IDD, pParent)
{
	m_cam = cam;
}

CSystemKeyDlg::~CSystemKeyDlg()
{
}

void CSystemKeyDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialogEx::DoDataExchange(pDX);
}


BEGIN_MESSAGE_MAP(CSystemKeyDlg, CDialogEx)
	ON_BN_CLICKED(IDC_BTN_ENTER, &CSystemKeyDlg::OnBnClickedBtnEnter)
	ON_BN_CLICKED(IDC_BTN_KEY, &CSystemKeyDlg::OnBnClickedBtnKey)
END_MESSAGE_MAP()


// CSystemKeyDlg 消息处理程序


void CSystemKeyDlg::OnBnClickedBtnEnter()
{
	// TODO:  在此添加控件通知处理程序代码
	CString str;
	GetDlgItem(IDC_EDIT1)->GetWindowTextA(str);
	ZBX_SetAppKey(m_cam, str, str.GetLength());
	AfxMessageBox("密钥已启用");
}


BOOL CSystemKeyDlg::PreTranslateMessage(MSG* pMsg)
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


void CSystemKeyDlg::OnBnClickedBtnKey()
{
	// TODO:  在此添加控件通知处理程序代码
	CString str_old, str_new, str_new_r;
	GetDlgItem(IDC_EDIT_OLD)->GetWindowTextA(str_old);
	GetDlgItem(IDC_EDIT_NEW)->GetWindowTextA(str_new);
	GetDlgItem(IDC_EDIT_NEW_R)->GetWindowTextA(str_new_r);
	if (str_new != str_new_r)
	{
		AfxMessageBox("请确定两次新密码相同");
		return;
	}
	DeviceKey key;
	memset(&key, 0, sizeof(DeviceKey));
	int nUIData = ((CButton*)GetDlgItem(IDC_CHECK_KEY))->GetCheck();

	key.status = nUIData;
	strcpy(key.old_pass, str_old.GetBuffer());
	strcpy(key.new_pass, str_new_r.GetBuffer());
	int nRet = ZBX_SetDeviceKey(m_cam, key);
	if (nRet == 0)
	{
		AfxMessageBox("保存密钥成功");
	}
	else
	{
		AfxMessageBox("保存密钥失败");
	}
}

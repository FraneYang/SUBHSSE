// SystemKeyDlg.cpp : ʵ���ļ�
//

#include "stdafx.h"
#include "VzFaceSDKDemo.h"
#include "SystemKeyDlg.h"
#include "afxdialogex.h"


// CSystemKeyDlg �Ի���

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


// CSystemKeyDlg ��Ϣ�������


void CSystemKeyDlg::OnBnClickedBtnEnter()
{
	// TODO:  �ڴ���ӿؼ�֪ͨ����������
	CString str;
	GetDlgItem(IDC_EDIT1)->GetWindowTextA(str);
	ZBX_SetAppKey(m_cam, str, str.GetLength());
	AfxMessageBox("��Կ������");
}


BOOL CSystemKeyDlg::PreTranslateMessage(MSG* pMsg)
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


void CSystemKeyDlg::OnBnClickedBtnKey()
{
	// TODO:  �ڴ���ӿؼ�֪ͨ����������
	CString str_old, str_new, str_new_r;
	GetDlgItem(IDC_EDIT_OLD)->GetWindowTextA(str_old);
	GetDlgItem(IDC_EDIT_NEW)->GetWindowTextA(str_new);
	GetDlgItem(IDC_EDIT_NEW_R)->GetWindowTextA(str_new_r);
	if (str_new != str_new_r)
	{
		AfxMessageBox("��ȷ��������������ͬ");
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
		AfxMessageBox("������Կ�ɹ�");
	}
	else
	{
		AfxMessageBox("������Կʧ��");
	}
}

// SeniorspwgDlg.cpp : ʵ���ļ�
//

#include "stdafx.h"
#include "VzFaceSDKDemo.h"
#include "SeniorspwgDlg.h"
#include "afxdialogex.h"


// CSeniorspwgDlg �Ի���

IMPLEMENT_DYNAMIC(CSeniorspwgDlg, CDialogEx)

CSeniorspwgDlg::CSeniorspwgDlg(VzLPRClientHandle cam, CWnd* pParent /*=NULL*/)
	: CDialogEx(CSeniorspwgDlg::IDD, pParent)
{
	m_cam = cam;
}

CSeniorspwgDlg::~CSeniorspwgDlg()
{
}

void CSeniorspwgDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialogEx::DoDataExchange(pDX);
}


BEGIN_MESSAGE_MAP(CSeniorspwgDlg, CDialogEx)
	ON_BN_CLICKED(IDC_BTN_SET, &CSeniorspwgDlg::OnBnClickedBtnSet)
END_MESSAGE_MAP()


// CSeniorspwgDlg ��Ϣ�������


void CSeniorspwgDlg::OnBnClickedBtnSet()
{
	// TODO:  �ڴ���ӿؼ�֪ͨ����������
	wg_special spwg;
	CString strT;
	GetDlgItem(IDC_EDIT_INS)->GetWindowTextA(strT);
	spwg.ic_ins = atoll(strT);
	GetDlgItem(IDC_EDIT_DEL)->GetWindowTextA(strT);
	spwg.ic_del = atoll(strT);
	GetDlgItem(IDC_EDIT_FACE_INS)->GetWindowTextA(strT);
	spwg.face_ins = atoll(strT);
	GetDlgItem(IDC_EDIT_FACE_DEL)->GetWindowTextA(strT);
	spwg.face_del = atoll(strT);
	GetDlgItem(IDC_EDIT_SYNC)->GetWindowTextA(strT);
	spwg.sync_all = atoll(strT);
	int nRet = ZBX_SetSpecialWg(m_cam, spwg);
	if (nRet==0)
	{
		AfxMessageBox("���óɹ�");
	}
	else{

		AfxMessageBox("����ʧ��");
	}

}


//BOOL CSeniorspwgDlg::PreCreateWindow(CREATESTRUCT& cs)
//{
//	// TODO:  �ڴ����ר�ô����/����û���
//
//	return CDialogEx::PreCreateWindow(cs);
//}
void CSeniorspwgDlg::GetInfo(bool bshow){
	wg_special spwg;
	int nRet = ZBX_GetSpecialWg(m_cam, &spwg);
	if (nRet==0)
	{
		CString str;
		str.Format("%u", spwg.ic_ins);
		GetDlgItem(IDC_EDIT_INS)->SetWindowTextA(str);
		str.Format("%u", spwg.ic_del);
		GetDlgItem(IDC_EDIT_DEL)->SetWindowTextA(str);
		str.Format("%u", spwg.face_ins);
		GetDlgItem(IDC_EDIT_FACE_INS)->SetWindowTextA(str);
		str.Format("%u", spwg.face_del);
		GetDlgItem(IDC_EDIT_FACE_DEL)->SetWindowTextA(str);
		str.Format("%u", spwg.sync_all);
		GetDlgItem(IDC_EDIT_SYNC)->SetWindowTextA(str);
		if (bshow)
		{
			AfxMessageBox("��ȡ�ɹ�");
		}
	}
	else{
		if (bshow)
		{
			AfxMessageBox("��ȡʧ��");
		}
	}
}

BOOL CSeniorspwgDlg::OnInitDialog()
{
	CDialogEx::OnInitDialog();

	// TODO:  �ڴ���Ӷ���ĳ�ʼ��
	GetInfo(false);
	return TRUE;  // return TRUE unless you set the focus to a control
	// �쳣:  OCX ����ҳӦ���� FALSE
}


BOOL CSeniorspwgDlg::PreTranslateMessage(MSG* pMsg)
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

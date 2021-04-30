// SeniorspwgDlg.cpp : 实现文件
//

#include "stdafx.h"
#include "VzFaceSDKDemo.h"
#include "SeniorspwgDlg.h"
#include "afxdialogex.h"


// CSeniorspwgDlg 对话框

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


// CSeniorspwgDlg 消息处理程序


void CSeniorspwgDlg::OnBnClickedBtnSet()
{
	// TODO:  在此添加控件通知处理程序代码
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
		AfxMessageBox("设置成功");
	}
	else{

		AfxMessageBox("设置失败");
	}

}


//BOOL CSeniorspwgDlg::PreCreateWindow(CREATESTRUCT& cs)
//{
//	// TODO:  在此添加专用代码和/或调用基类
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
			AfxMessageBox("获取成功");
		}
	}
	else{
		if (bshow)
		{
			AfxMessageBox("获取失败");
		}
	}
}

BOOL CSeniorspwgDlg::OnInitDialog()
{
	CDialogEx::OnInitDialog();

	// TODO:  在此添加额外的初始化
	GetInfo(false);
	return TRUE;  // return TRUE unless you set the focus to a control
	// 异常:  OCX 属性页应返回 FALSE
}


BOOL CSeniorspwgDlg::PreTranslateMessage(MSG* pMsg)
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

// RecordInfoDlg.cpp : 实现文件
//

#include "stdafx.h"
#include "VzFaceSDKDemo.h"
#include "RecordInfoDlg.h"
#include "afxdialogex.h"


// CRecordInfoDlg 对话框

IMPLEMENT_DYNAMIC(CRecordInfoDlg, CDialogEx)

CRecordInfoDlg::CRecordInfoDlg(TAGLIST_INFO info, CWnd* pParent /*=NULL*/)
: CDialogEx(CRecordInfoDlg::IDD, pParent)
{
	m_info = info;
}

CRecordInfoDlg::~CRecordInfoDlg()
{
}

void CRecordInfoDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialogEx::DoDataExchange(pDX);
}


BEGIN_MESSAGE_MAP(CRecordInfoDlg, CDialogEx)
	ON_BN_CLICKED(IDC_BUTTON1, &CRecordInfoDlg::OnBnClickedButton1)
END_MESSAGE_MAP()


// CRecordInfoDlg 消息处理程序


void CRecordInfoDlg::OnBnClickedButton1()
{
	// TODO:  在此添加控件通知处理程序代码
	OnOK();
}


BOOL CRecordInfoDlg::OnInitDialog()
{
	CDialogEx::OnInitDialog();

	// TODO:  在此添加额外的初始化
	CString str;
	str.Format("姓名：%s", m_info.faceName);
	GetDlgItem(IDC_STC_NAME)->SetWindowTextA(str);
	str.Format("ID：%s", m_info.faceId);
	GetDlgItem(IDC_STC_ID)->SetWindowTextA(str);
	str.Format("时间：%s", m_info.csTime);
	GetDlgItem(IDC_STC_TIME)->SetWindowTextA(str);
	str.Format("相似度：%d", m_info.nMatchScore);
	GetDlgItem(IDC_STC_SCORE)->SetWindowTextA(str);
	str.Format("IP：%s", m_info.DevIp);
	GetDlgItem(IDC_STC_IP)->SetWindowTextA(str);
	if (m_info.bSaftHat)
	{
		str = "带帽：是";
	}
	else
	{
		str = "带帽：否";
	}
	GetDlgItem(IDC_STC_HAT)->SetWindowTextA(str);
	int nMain = m_info.nModel/100;
	switch (nMain)
	{
	case 1:
		str = "模式：刷脸";
		break; 
	case 2:
		str = "模式：刷卡";
		break;
	case 3:
		str = "模式：刷身份证";
		break;
	case 4:
		str = "模式：刷脸+刷卡";
		break;
	case 5:
		str = "模式：刷脸+刷身份证";
		break;
	case 6:
		str = "模式：刷脸 或刷卡";
		break;
	case 7:
		str = "模式：刷脸或刷身份证";
		break;
	case 8:
		str = "模式：过人开闸";
		break;
	default:
		str = "模式：刷身份证";
		break;
	}
	GetDlgItem(IDC_STC_MODE)->SetWindowTextA(str);
	switch (m_info.nRole)
	{
	case 0:
	case 1:
		str = "人员类型：白名单";
		break;
	case 2:
		str = "人员类型：黑名单";
		break;
	default:
		str = "人员类型：未知";
		break;
	}
	GetDlgItem(IDC_STC_ROLE)->SetWindowTextA(str);
	if (m_info.bDataSatus)
	{
		str = "数据类型：在线数据";
	}
	else
	{

		str = "数据类型：离线数据";
	}
	GetDlgItem(IDC_STC_STATUS)->SetWindowTextA(str);
	return TRUE;  // return TRUE unless you set the focus to a control
	// 异常:  OCX 属性页应返回 FALSE
}

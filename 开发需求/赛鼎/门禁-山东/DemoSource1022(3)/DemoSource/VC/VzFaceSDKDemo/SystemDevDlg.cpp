// SystemDevDlg.cpp : 实现文件
//

#include "stdafx.h"
#include "VzFaceSDKDemo.h"
#include "SystemDevDlg.h"
#include "afxdialogex.h"


// CSystemDevDlg 对话框

IMPLEMENT_DYNAMIC(CSystemDevDlg, CDialogEx)

CSystemDevDlg::CSystemDevDlg(VzLPRClientHandle cam, CWnd* pParent /*=NULL*/)
	: CDialogEx(CSystemDevDlg::IDD, pParent)
{
	m_cam = cam;
}

CSystemDevDlg::~CSystemDevDlg()
{
}

void CSystemDevDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialogEx::DoDataExchange(pDX);
	DDX_Control(pDX, IDC_TIME, m_RebootTime);
}


BEGIN_MESSAGE_MAP(CSystemDevDlg, CDialogEx)
	ON_BN_CLICKED(IDC_BTN_REBOOT, &CSystemDevDlg::OnBnClickedBtnReboot)
	ON_BN_CLICKED(IDC_BUTTON5, &CSystemDevDlg::OnBnClickedButton5)
	ON_BN_CLICKED(IDC_BTN_AGING, &CSystemDevDlg::OnBnClickedBtnAging)
	ON_BN_CLICKED(IDC_BTN_SAVE, &CSystemDevDlg::OnBnClickedBtnSave)
	ON_BN_CLICKED(IDC_BTN_GET, &CSystemDevDlg::OnBnClickedBtnGet)
	ON_BN_CLICKED(IDC_RADIO_TYPE1, &CSystemDevDlg::OnBnClickedRadioType1)
	ON_BN_CLICKED(IDC_RADIO_TYPE2, &CSystemDevDlg::OnBnClickedRadioType2)
	ON_BN_CLICKED(IDC_RADIO_TYPE3, &CSystemDevDlg::OnBnClickedRadioType3)
	ON_BN_CLICKED(IDC_BTN_WORKTYPE_SET2, &CSystemDevDlg::OnBnClickedBtnWorktypeSet2)
	ON_BN_CLICKED(IDC_BTN_WORKTYPE_READ2, &CSystemDevDlg::OnBnClickedBtnWorktypeRead2)
END_MESSAGE_MAP()


// CSystemDevDlg 消息处理程序


void CSystemDevDlg::OnBnClickedBtnReboot()
{
	// TODO:  在此添加控件通知处理程序代码
	if (IDOK == MessageBox("设备正在运行中，确定重启设备？ ", "警告", MB_OKCANCEL))
	{
		ZBX_RebootCam(m_cam);
		AfxMessageBox("设备开始重启。。。");
	};
}


void CSystemDevDlg::OnBnClickedButton5()
{
	// TODO:  在此添加控件通知处理程序代码
	OnBnClickedBtnAging();
}

BOOL CSystemDevDlg::OnInitDialog()
{
	CDialogEx::OnInitDialog();

	// TODO:  在此添加额外的初始化
	int nRet = ZBX_GetAging(m_cam, &m_nAdingStatus);
	if (m_nAdingStatus)
	{
		GetDlgItem(IDC_BTN_AGING)->SetWindowTextA("停止老化");
		m_nAdingStatus = 0;
	}
	else
	{
		m_nAdingStatus = 1;
	}
	//2019/01/01 4:0:0
	CTime t(1546286400);
	m_RebootTime.SetTime(&t);
	OnGetWorkType(false);
	OnGetRebootTime(false);
	return TRUE;  // return TRUE unless you set the focus to a control
	// 异常:  OCX 属性页应返回 FALSE
}


void CSystemDevDlg::OnBnClickedBtnAging()
{
	// TODO:  在此添加控件通知处理程序代码
	ZBX_SetAging(m_cam, m_nAdingStatus);
	
	
	if (m_nAdingStatus==1){
		m_nAdingStatus = 0;
	}
	else
	{
		m_nAdingStatus = 0;
	}
	CString str;
	GetDlgItem(IDC_BTN_AGING)->GetWindowTextA(str);
	if (str=="开始老化")
	{
		GetDlgItem(IDC_BTN_AGING)->SetWindowTextA("停止老化");
		AfxMessageBox("开始老化");
	}
	else
	{
		GetDlgItem(IDC_BTN_AGING)->SetWindowTextA("开始老化");
		AfxMessageBox("停止老化");
	}
}


void CSystemDevDlg::OnBnClickedBtnSave()
{
	// TODO:  在此添加控件通知处理程序代码
	SYSTEMTIME t;
	m_RebootTime.GetTime(&t);
	bool bCheck = ((CButton*)GetDlgItem(IDC_CHECK1))->GetCheck();
	int ntime = t.wHour * 3600 + t.wMinute * 60 + t.wSecond;
	int nRet = ZBX_SetAutoReboot(m_cam, bCheck, ntime);
	if (nRet==0)
	{
		AfxMessageBox("设置成功");
	}
	else
		AfxMessageBox("设置失败");
}

void CSystemDevDlg::OnBnClickedBtnGet()
{
	// TODO:  在此添加控件通知处理程序代码
	OnGetRebootTime(true);
}

void CSystemDevDlg::OnGetRebootTime(bool bShow){
	int nEnable, nTime;
	int nRet = ZBX_GetAutoReboot(m_cam, &nEnable, &nTime);
	if (bShow)
	{
		if (nRet==0)
		{
			AfxMessageBox("获取成功");
		}
		else
		{
			AfxMessageBox("获取失败");
			return;
		}
	}
	((CButton*)GetDlgItem(IDC_CHECK1))->SetCheck(nEnable);
	unsigned int time = 1546272000;
	CTime te(time + nTime);
	m_RebootTime.SetTime(&te);
}

BOOL CSystemDevDlg::PreTranslateMessage(MSG* pMsg)
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


void CSystemDevDlg::OnBnClickedRadioType1()
{
	// TODO:  在此添加控件通知处理程序代码
	m_nCurWorktype = 0;
}


void CSystemDevDlg::OnBnClickedRadioType2()
{
	// TODO:  在此添加控件通知处理程序代码

	m_nCurWorktype = 1;
}


void CSystemDevDlg::OnBnClickedRadioType3()
{
	// TODO:  在此添加控件通知处理程序代码
	m_nCurWorktype = 2;
}


void CSystemDevDlg::OnBnClickedBtnWorktypeSet2()
{
	// TODO:  在此添加控件通知处理程序代码
	int nRet = ZBX_SetCameraWorkMode(m_cam, m_nCurWorktype);
	if (nRet == 0)
	{
		AfxMessageBox("设置成功");
	}
	else
		AfxMessageBox("设置失败");
}


void CSystemDevDlg::OnBnClickedBtnWorktypeRead2()
{
	// TODO:  在此添加控件通知处理程序代码
	OnGetWorkType(true);
}

void CSystemDevDlg::OnGetWorkType(bool bshow){
	unsigned char tmp[10] = { 0 };
	int nRet = ZBX_GetCameraWorkMode(m_cam, tmp);

	((CButton *)GetDlgItem(IDC_RADIO_TYPE1))->SetCheck(FALSE);
	((CButton *)GetDlgItem(IDC_RADIO_TYPE2))->SetCheck(FALSE);
	((CButton *)GetDlgItem(IDC_RADIO_TYPE3))->SetCheck(FALSE);
	if (bshow)
	{
		if (!nRet)
		{
			AfxMessageBox("获取成功");
		}
		else
		{
			AfxMessageBox("获取失败");
		}
	}

	switch (tmp[0])
	{
	case 0:
		((CButton *)GetDlgItem(IDC_RADIO_TYPE1))->SetCheck(TRUE);
		break;
	case 1:
		((CButton *)GetDlgItem(IDC_RADIO_TYPE2))->SetCheck(TRUE);
		break;
	case 2:
		((CButton *)GetDlgItem(IDC_RADIO_TYPE3))->SetCheck(TRUE);
		break;
	}
}


// SystemRebootInfoDlg.cpp : 实现文件
//

#include "stdafx.h"
#include "VzFaceSDKDemo.h"
#include "SystemRebootInfoDlg.h"
#include "afxdialogex.h"
#include <sstream>

// SystemRebootInfoDlg 对话框

IMPLEMENT_DYNAMIC(SystemRebootInfoDlg, CDialogEx)

SystemRebootInfoDlg::SystemRebootInfoDlg(VzLPRClientHandle cam, CWnd* pParent /*=NULL*/)
	: CDialogEx(SystemRebootInfoDlg::IDD, pParent)
{
	m_cam = cam;
}

SystemRebootInfoDlg::~SystemRebootInfoDlg()
{
}

void SystemRebootInfoDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialogEx::DoDataExchange(pDX);
	DDX_Control(pDX, IDC_LIST1, m_list);
}


BEGIN_MESSAGE_MAP(SystemRebootInfoDlg, CDialogEx)
END_MESSAGE_MAP()


// SystemRebootInfoDlg 消息处理程序


BOOL SystemRebootInfoDlg::OnInitDialog()
{
	CDialogEx::OnInitDialog();

	// TODO:  在此添加额外的初始化
	Reboot_info info;
	memset(&info, 0, sizeof(Reboot_info));
	char buf[64] = {0};
	int nRet = ZBX_GetRebootLog(m_cam,&info);
	if (nRet==0)
	{
		for (int i = 0; i < 100;i++)
		{
			std::string reboot_info = info.info[i];
			if (reboot_info != "")
			{
				m_list.InsertString(0, reboot_info.c_str());
			}
			else
			{
				break;
			}
		}
	}
	return TRUE;  // return TRUE unless you set the focus to a control
	// 异常:  OCX 属性页应返回 FALSE
}

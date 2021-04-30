// SeniorMQTTDlg.cpp : 实现文件
//

#include "stdafx.h"
#include "VzFaceSDKDemo.h"
#include "SeniorMQTTDlg.h"
#include "afxdialogex.h"


// CSeniorMQTTDlg 对话框

IMPLEMENT_DYNAMIC(CSeniorMQTTDlg, CDialogEx)

CSeniorMQTTDlg::CSeniorMQTTDlg(VzLPRClientHandle cam, CWnd* pParent /*=NULL*/)
	: CDialogEx(CSeniorMQTTDlg::IDD, pParent)
{
	m_cam = cam;
}

CSeniorMQTTDlg::~CSeniorMQTTDlg()
{
}

void CSeniorMQTTDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialogEx::DoDataExchange(pDX);
}


BEGIN_MESSAGE_MAP(CSeniorMQTTDlg, CDialogEx)
	ON_BN_CLICKED(IDC_BTN_SET, &CSeniorMQTTDlg::OnBnClickedBtnSet)
	ON_WM_TIMER()
	ON_BN_CLICKED(IDC_BTN_CHOOSE, &CSeniorMQTTDlg::OnBnClickedBtnChoose)
	ON_BN_CLICKED(IDC_BTN_UPDATE, &CSeniorMQTTDlg::OnBnClickedBtnUpdate)
	ON_WM_CTLCOLOR()
END_MESSAGE_MAP()


// CSeniorMQTTDlg 消息处理程序


void CSeniorMQTTDlg::OnBnClickedBtnSet()
{
	// TODO:  在此添加控件通知处理程序代码
	MQTT_ConfigEx config;
	memset(&config, 0, sizeof(config));
	config.enable = (int)((CButton*)GetDlgItem(IDC_CHECK1))->GetCheck();
	CString str;
	GetDlgItem(IDC_EDIT_IP)->GetWindowTextA(str);
	strcpy_s(config.hostname, str);
	GetDlgItem(IDC_EDIT_USER)->GetWindowTextA(str);
	strcpy_s(config.user, str);
	GetDlgItem(IDC_EDIT_PWD)->GetWindowTextA(str);
	strcpy_s(config.passwd, str);
	int nPort = GetDlgItemInt(IDC_EDIT_PORT);
	config.port = nPort;
	if (((CButton*)GetDlgItem(IDC_CHECK_CRT))->GetCheck())
	{

		config.crt_config.tls_typ = 1;
	}
	else
	{
		config.crt_config.tls_typ = 0;
	}
	int nRet = ZBX_SetMQTTConfigEx(m_cam, config);
	if (nRet==0)
	{
		AfxMessageBox("设置成功");
	}
	else
	{
		AfxMessageBox("设置失败");
	}
}


BOOL CSeniorMQTTDlg::OnInitDialog()
{
	CDialogEx::OnInitDialog();

	// TODO:  在此添加额外的初始化
	GetMqttInfo(false);
	SetTimer(1, 5000, NULL);
	return TRUE;  // return TRUE unless you set the focus to a control
	// 异常:  OCX 属性页应返回 FALSE
}
void CSeniorMQTTDlg::GetMqttInfo(bool bshow){
	MQTT_ConfigEx config;
	memset(&config, 0, sizeof(config));
	int nRet = ZBX_GetMQTTConfigEx(m_cam, &config);
	if (nRet == 0)
	{
		if (bshow)
		{
			AfxMessageBox("设置成功");
		}
		((CButton*)GetDlgItem(IDC_CHECK1))->SetCheck(config.enable);
		GetDlgItem(IDC_EDIT_IP)->SetWindowTextA(config.hostname);
		SetDlgItemInt(IDC_EDIT_PORT, config.port);
		GetDlgItem(IDC_EDIT_USER)->SetWindowTextA(config.user);
		GetDlgItem(IDC_EDIT_PWD)->SetWindowTextA(config.passwd);
		((CButton*)GetDlgItem(IDC_CHECK_CRT))->SetCheck(config.crt_config.tls_typ);
		if (config.crt_config.tls_typ== 1){
			if (config.crt_config.tls_set == -2){
				GetDlgItem(IDC_MQTTINFO)->SetWindowTextA("证书不存在");
			}
			else if (config.crt_config.tls_set == -1)
			{
				GetDlgItem(IDC_MQTTINFO)->SetWindowTextA("证书文件错误");
			}
			else if (config.crt_config.tls_set == 1 || config.crt_config.tls_set==0)
			{
				if (config.status == -2)
				{
					GetDlgItem(IDC_MQTTINFO)->SetWindowTextA("正常断开");
				}
				else if (config.status == -1)
				{
					GetDlgItem(IDC_MQTTINFO)->SetWindowTextA("异常断开");
				}
				else if (config.status == 0)
				{
					GetDlgItem(IDC_MQTTINFO)->SetWindowTextA("正常连接");
				}
				else if (config.status == 1)
				{
					GetDlgItem(IDC_MQTTINFO)->SetWindowTextA("协议版本不符");
				}

				else if (config.status == 2)
				{
					GetDlgItem(IDC_MQTTINFO)->SetWindowTextA("标识符被拒绝");
				}
				else if (config.status == 3)
				{
					GetDlgItem(IDC_MQTTINFO)->SetWindowTextA("服务代理不可用");
				}
				else if (config.status == 4)
				{
					GetDlgItem(IDC_MQTTINFO)->SetWindowTextA("断开:其他原因");
				}
			}
		}
		
	}
	else
	{
		if (bshow)
		{
			AfxMessageBox("设置失败");
		}
	}

}

BOOL CSeniorMQTTDlg::PreTranslateMessage(MSG* pMsg)
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


void CSeniorMQTTDlg::OnTimer(UINT_PTR nIDEvent)
{
	// TODO:  在此添加消息处理程序代码和/或调用默认值
	if (nIDEvent==1)
	{
		MQTT_Config config;
		memset(&config, 0, sizeof(config));
		int nRet = ZBX_GetMQTTConfig(m_cam, &config);
		if (nRet == 0)
		{
			if (config.crt_config.tls_typ == 1){
				if (config.crt_config.tls_set == -2){
					GetDlgItem(IDC_MQTTINFO)->SetWindowTextA("证书不存在");

				}
				else if (config.crt_config.tls_set == -1)
				{
					GetDlgItem(IDC_MQTTINFO)->SetWindowTextA("证书文件错误");
				}
				return	CDialogEx::OnTimer(nIDEvent);
			}
			if (config.status == -2)
			{
				GetDlgItem(IDC_MQTTINFO)->SetWindowTextA("正常断开");
			}
			else if (config.status == -1)
			{
				GetDlgItem(IDC_MQTTINFO)->SetWindowTextA("异常断开");
			}
			else if (config.status == 0)
			{
				GetDlgItem(IDC_MQTTINFO)->SetWindowTextA("正常连接");
			}
			else if (config.status == 1)
			{
				GetDlgItem(IDC_MQTTINFO)->SetWindowTextA("协议版本不符");
			}

			else if (config.status == 2)
			{
				GetDlgItem(IDC_MQTTINFO)->SetWindowTextA("标识符被拒绝");
			}
			else if (config.status == 3)
			{
				GetDlgItem(IDC_MQTTINFO)->SetWindowTextA("服务代理不可用");
			}
			else if (config.status == 4)
			{
				GetDlgItem(IDC_MQTTINFO)->SetWindowTextA("断开:其他原因");
			}
		}
	}
	CDialogEx::OnTimer(nIDEvent);
}


void CSeniorMQTTDlg::OnBnClickedBtnChoose()
{
	// TODO:  在此添加控件通知处理程序代码
	LPCTSTR lpszFilter = "crt files(*.crt;*.CRT;*.Crt) | *.crt;*.CRT;*.Crt||";
	CFileDialog dlg(TRUE, lpszFilter, NULL, OFN_HIDEREADONLY | OFN_OVERWRITEPROMPT, lpszFilter, NULL);
	CString filepath;
	CFile file;
	//打开文件对话框
	if (dlg.DoModal() == IDOK)
	{
		filepath = dlg.GetPathName();
		if (!PathFileExists(filepath))
		{
			AfxMessageBox("请选择文件");
			return;
		}
	}
	GetDlgItem(IDC_EDIT_CRT)->SetWindowTextA(filepath);
}


void CSeniorMQTTDlg::OnBnClickedBtnUpdate()
{
	// TODO:  在此添加控件通知处理程序代码

	CString str;
	GetDlgItem(IDC_EDIT_CRT)->GetWindowTextA(str);
	if (!PathFileExists(str))
	{
		AfxMessageBox("文件不存在");
	}
	int nret = ZBX_UpdateCrtFile(m_cam, str.GetBuffer());
	if (nret == 0)
	{
		AfxMessageBox("上传成功");
	}
	else{
		AfxMessageBox("上传失败");
	}
}


HBRUSH CSeniorMQTTDlg::OnCtlColor(CDC* pDC, CWnd* pWnd, UINT nCtlColor)
{
	HBRUSH hbr = CDialogEx::OnCtlColor(pDC, pWnd, nCtlColor);

	// TODO:  在此更改 DC 的任何特性
	if (pWnd->GetDlgCtrlID() == IDC_MQTTINFO)// IDC_Display为所选文本框ID    
	{
		CString str;
		GetDlgItem(IDC_MQTTINFO)->GetWindowTextA(str);
		if (str!="正常连接")
		{
			pDC->SetTextColor(RGB(255, 0, 0));//设置字体颜色
		}
		else
		{
			pDC->SetTextColor(RGB(0, 255, 0));//设置字体颜色
		}

		//pDC->SetBkMode(TRANSPARENT);//设置背景透明    
	}
	// TODO:  如果默认的不是所需画笔，则返回另一个画笔
	return hbr;
}

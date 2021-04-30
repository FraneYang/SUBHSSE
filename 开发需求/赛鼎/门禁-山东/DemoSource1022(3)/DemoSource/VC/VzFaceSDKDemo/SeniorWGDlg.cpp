// SeniorWGDlg.cpp : 实现文件
//

#include "stdafx.h"
#include "VzFaceSDKDemo.h"
#include "SeniorWGDlg.h"
#include "afxdialogex.h"

#include <sstream>

// CSeniorWGDlg 对话框

IMPLEMENT_DYNAMIC(CSeniorWGDlg, CDialogEx)

CSeniorWGDlg::CSeniorWGDlg(VzLPRClientHandle cam, CWnd* pParent /*=NULL*/)
	: CDialogEx(CSeniorWGDlg::IDD, pParent)
{
	m_cam = cam;
}

CSeniorWGDlg::~CSeniorWGDlg()
{
	ZBX_RegWgAlarmRecordCb(m_cam,
		NULL, NULL);
}

void CSeniorWGDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialogEx::DoDataExchange(pDX);
	DDX_Control(pDX, IDC_COM_WGIO, m_ComWGIO_);
}


BEGIN_MESSAGE_MAP(CSeniorWGDlg, CDialogEx)
	ON_BN_CLICKED(IDC_BTN_WGSET, &CSeniorWGDlg::OnBnClickedBtnWgset)
	ON_BN_CLICKED(IDC_BTN_READ, &CSeniorWGDlg::OnBnClickedBtnRead)
	ON_BN_CLICKED(IDC_BTN_SEND, &CSeniorWGDlg::OnBnClickedBtnSend)
	ON_BN_CLICKED(IDC_BTN_CLEAR, &CSeniorWGDlg::OnBnClickedBtnClear)
	ON_BN_CLICKED(IDC_BTN_SEND_AUTO, &CSeniorWGDlg::OnBnClickedBtnSendAuto)
	ON_WM_TIMER()
END_MESSAGE_MAP()


// CSeniorWGDlg 消息处理程序


void CSeniorWGDlg::OnBnClickedBtnWgset()
{
	// TODO:  在此添加控件通知处理程序代码
	CString str;
	int nCur = ((CComboBox*)GetDlgItem(IDC_COMBO1))->GetCurSel();
	int nRet = ZBX_SetWiegandType(m_cam, nCur);
	int nType = 0;
	if (theApp.m_map_cam_ver_[m_cam]==9)
	{
		GetDlgItem(IDC_COM_WGIO)->GetWindowText(str);
		if (str == "输入")
		{
			nType=ZBX_SetWgIO_type(m_cam, 0);
		}
		else
		{
			nType = ZBX_SetWgIO_type(m_cam,1);
		}
	}
	if (nRet == 0 && nType==0)
	{
		AfxMessageBox("设置成功");
	}
	else
	{
		AfxMessageBox("设置失败");
	}
}


void CSeniorWGDlg::OnBnClickedBtnRead()
{
	// TODO:  在此添加控件通知处理程序代码
	OnGetSaveInfo(true);
}

void CSeniorWGDlg::OnGetSaveInfo(bool bshow){

	int nType = -1;
	int nRet2 = 0;
	if (theApp.m_map_cam_ver_[m_cam] == 9)
	{
		nRet2 = ZBX_GetWgIO_type(m_cam, &nType);
		if (nType==0)
		{
			m_ComWGIO_.SetCurSel(1);
			m_ComWGIO_.SetWindowTextA("输入");
		}
		else
		{
			m_ComWGIO_.SetCurSel(0);
			m_ComWGIO_.SetWindowTextA("输出");
		}
		
	}
	else
	{
		m_ComWGIO_.ShowWindow(FALSE);
		GetDlgItem(IDC_STATIC_WGIO)->ShowWindow(FALSE);
	}
	int nRet = ZBX_GetWiegandType(m_cam, &nType);
	
	if (nRet == 0 && bshow&&nRet2==0)
	{
		AfxMessageBox("获取成功");
	}
	else
	{
		if (bshow)
		{
			AfxMessageBox("获取失败");
		}
	}
	((CComboBox*)GetDlgItem(IDC_COMBO1))->SetCurSel(nType);
}
BOOL CSeniorWGDlg::OnInitDialog()
{
	CDialogEx::OnInitDialog();

	// TODO:  在此添加额外的初始化

	
	ZBX_RegWgAlarmRecordCb(m_cam,
		[](ZBX_Cam* cam,
		const WGAlarmRecord* alarmRecord,
		const void* usrParam){
		//std::cout << "wg_id = " << alarmRecord->wg_id << " wg_type= " << alarmRecord->wg_type << std::endl;
		if (usrParam)
		{
			CSeniorWGDlg* dlg = (CSeniorWGDlg*)usrParam;
			dlg->InsertWG(alarmRecord);
		}
	}, this);
	((CComboBox*)GetDlgItem(IDC_COM_SEND))->SetCurSel(0);
	((CComboBox*)GetDlgItem(IDC_COM_SENDDATA))->SetCurSel(0);
	((CComboBox*)GetDlgItem(IDC_COM_REV))->SetCurSel(0);



	((CComboBox*)GetDlgItem(IDC_COM_WGIO))->InsertString(0, "输出");
	((CComboBox*)GetDlgItem(IDC_COM_WGIO))->InsertString(1, "输入");
	m_ComWGIO_.SetCurSel(1);
	OnGetSaveInfo(false);
	SetDlgItemInt(IDC_EDIT1, 300);
	return TRUE;  // return TRUE unless you set the focus to a control
	// 异常:  OCX 属性页应返回 FALSE
}

void CSeniorWGDlg::InsertWG(const WGAlarmRecord* alarmRecord){

	if (!this->GetSafeHwnd())
	{
		return;
	}
	time_t t = time(NULL);
	tm* tm_v = localtime(&t);
	char buf[64];
	// strftime(buf, 64, "%Y/%m/%d %H:%M:%S --- ", tm_v);
	strftime(buf, 64, "%H:%M:%S --- ", tm_v);

	auto list = (CListBox*)this->GetDlgItem(IDC_LIST_WG);
	std::stringstream ss;
	bool bChecked = GetComIni(IDC_COM_REV);
 	if (!bChecked)
	{
		ss << buf << alarmRecord->wg_id;
	}
	else
	{
		CString str;
		str.Format("%x", alarmRecord->wg_id);
		ss << buf << str;
	}
	list->InsertString(0, ss.str().c_str());
}
void CSeniorWGDlg::StringtoHex(BYTE *GB, int glen, BYTE* SB, int* slen)
{
	int i;    //遍历输入的字符串
	int a = 0;
	char temp;   //接收字符，用来判断是否为空格，若是则跳过
	char temp1, temp2;   //接收一个字节的两个字符  例如EB，则temp1='E',temp2 = 'B'
	*slen = 0;  //输出的16进制字符串长度
	for (i = 0; i < glen; i++)
	{
		temp = GB[i];
		if (temp == ' ')
			continue;

		if (a == 0)
			temp1 = GB[i];
		if (a == 1)
			temp2 = GB[i];
		a++;

		if (a == 2)
		{
			a = 0;
			temp1 = temp1 - '0';
			if (temp1 > 10)
				temp1 = temp1 - 7;
			temp2 = temp2 - '0';
			if (temp2 > 10)
				temp2 = temp2 - 7;

			SB[*slen] = temp1 * 16 + temp2;
			(*slen)++;
		}
	}

}


int bytesToInt(byte* bytes, int size = 4)

{

	int a = bytes[0] & 0xFF;

	a |= ((bytes[1] << 8) & 0xFF00);

	a |= ((bytes[2] << 16) & 0xFF0000);

	a |= ((bytes[3] << 24) & 0xFF000000);

	return a;

}
void CSeniorWGDlg::OnBnClickedBtnSend()
{
	// TODO:  在此添加控件通知处理程序代码
	CString str;
	GetDlgItem(IDC_EDIT_READCOM)->GetWindowTextA(str);
	if (str.IsEmpty())
	{
		AfxMessageBox("请输入韦根号");
		return;
	}

	((CListBox*)GetDlgItem(IDC_LIST1))->InsertString(0, str);

	bool bChecked = GetComIni(IDC_COM_SEND);
	if (bChecked)
	{

		unsigned int cTmp;
		str.Replace(" ", "");
		sscanf(str, "%x", &cTmp);
		int nRet = ZBX_WiegandAlarmEx(m_cam, cTmp, 0, 0);
		if (nRet == 0)
		{
			AfxMessageBox("发送成功");
		}
		else
		{
			AfxMessageBox("发送失败");

		}
		return;
	}
	unsigned int nData = atoll(str);
	int nRet = ZBX_WiegandAlarmEx(m_cam, nData, 0, 0);
	if (nRet==0)
	{
		AfxMessageBox("发送成功");
	}
	else
	{
		AfxMessageBox("发送失败");

	}
}


void CSeniorWGDlg::OnBnClickedBtnClear()
{
	// TODO:  在此添加控件通知处理程序代码
	GetDlgItem(IDC_LIST1)->SetWindowTextA("");
	GetDlgItem(IDC_LIST_WG)->SetWindowTextA("");
}
int CSeniorWGDlg::GetComIni(int nID){
	CString str;
	GetDlgItem(nID)->GetWindowText(str);
	if (str == "十进制")
	{
		return 0;
	}
	else
	{
		return 1;
	}
}

BOOL CSeniorWGDlg::PreTranslateMessage(MSG* pMsg)
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


void CSeniorWGDlg::OnBnClickedBtnSendAuto()
{
	// TODO:  在此添加控件通知处理程序代码
	CString strUI;
	GetDlgItem(IDC_BTN_SEND_AUTO)->GetWindowTextA(strUI);
	if (strUI=="自动循环发送")
	{
		GetDlgItem(IDC_EDIT1)->EnableWindow(FALSE);
		int nData = GetDlgItemInt(IDC_EDIT1);
		if (nData <= 0)
		{
			AfxMessageBox("请输入正确时间间隔");
			return;
		}
		SetTimer(1, nData, NULL);
		m_nCurSendData = 0;
		GetDlgItem(IDC_BTN_SEND_AUTO)->SetWindowTextA("停止循环发送");
	}
	else if (strUI == "停止循环发送")
	{
		KillTimer(1);
		m_nCurSendData = 0;
		GetDlgItem(IDC_EDIT1)->EnableWindow(TRUE);
		GetDlgItem(IDC_BTN_SEND_AUTO)->SetWindowTextA("自动循环发送");
	}
	
}


void CSeniorWGDlg::OnTimer(UINT_PTR nIDEvent)
{
	// TODO:  在此添加消息处理程序代码和/或调用默认值
	if (nIDEvent==1)
	{		
		int nRet = ZBX_WiegandAlarmEx(m_cam,
			m_nCurSendData, 0, 0);
		bool bChecked = GetComIni(IDC_COM_SEND);
		CString str;
		if (bChecked)
		{
			str.Format("0x%x", m_nCurSendData);
			((CListBox*)GetDlgItem(IDC_LIST1))->InsertString(0, str);
		}
		else
		{
			str.Format("%u", m_nCurSendData);
			((CListBox*)GetDlgItem(IDC_LIST1))->InsertString(0, str);
		}
		if (m_nCurSendData>16777215)
		{
			m_nCurSendData = 0;
		}
		m_nCurSendData++;
	}
	CDialogEx::OnTimer(nIDEvent);
}

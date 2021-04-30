// SeniorWGDlg.cpp : ʵ���ļ�
//

#include "stdafx.h"
#include "VzFaceSDKDemo.h"
#include "SeniorWGDlg.h"
#include "afxdialogex.h"

#include <sstream>

// CSeniorWGDlg �Ի���

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


// CSeniorWGDlg ��Ϣ�������


void CSeniorWGDlg::OnBnClickedBtnWgset()
{
	// TODO:  �ڴ���ӿؼ�֪ͨ����������
	CString str;
	int nCur = ((CComboBox*)GetDlgItem(IDC_COMBO1))->GetCurSel();
	int nRet = ZBX_SetWiegandType(m_cam, nCur);
	int nType = 0;
	if (theApp.m_map_cam_ver_[m_cam]==9)
	{
		GetDlgItem(IDC_COM_WGIO)->GetWindowText(str);
		if (str == "����")
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
		AfxMessageBox("���óɹ�");
	}
	else
	{
		AfxMessageBox("����ʧ��");
	}
}


void CSeniorWGDlg::OnBnClickedBtnRead()
{
	// TODO:  �ڴ���ӿؼ�֪ͨ����������
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
			m_ComWGIO_.SetWindowTextA("����");
		}
		else
		{
			m_ComWGIO_.SetCurSel(0);
			m_ComWGIO_.SetWindowTextA("���");
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
		AfxMessageBox("��ȡ�ɹ�");
	}
	else
	{
		if (bshow)
		{
			AfxMessageBox("��ȡʧ��");
		}
	}
	((CComboBox*)GetDlgItem(IDC_COMBO1))->SetCurSel(nType);
}
BOOL CSeniorWGDlg::OnInitDialog()
{
	CDialogEx::OnInitDialog();

	// TODO:  �ڴ���Ӷ���ĳ�ʼ��

	
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



	((CComboBox*)GetDlgItem(IDC_COM_WGIO))->InsertString(0, "���");
	((CComboBox*)GetDlgItem(IDC_COM_WGIO))->InsertString(1, "����");
	m_ComWGIO_.SetCurSel(1);
	OnGetSaveInfo(false);
	SetDlgItemInt(IDC_EDIT1, 300);
	return TRUE;  // return TRUE unless you set the focus to a control
	// �쳣:  OCX ����ҳӦ���� FALSE
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
	int i;    //����������ַ���
	int a = 0;
	char temp;   //�����ַ��������ж��Ƿ�Ϊ�ո�����������
	char temp1, temp2;   //����һ���ֽڵ������ַ�  ����EB����temp1='E',temp2 = 'B'
	*slen = 0;  //�����16�����ַ�������
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
	// TODO:  �ڴ���ӿؼ�֪ͨ����������
	CString str;
	GetDlgItem(IDC_EDIT_READCOM)->GetWindowTextA(str);
	if (str.IsEmpty())
	{
		AfxMessageBox("������Τ����");
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
			AfxMessageBox("���ͳɹ�");
		}
		else
		{
			AfxMessageBox("����ʧ��");

		}
		return;
	}
	unsigned int nData = atoll(str);
	int nRet = ZBX_WiegandAlarmEx(m_cam, nData, 0, 0);
	if (nRet==0)
	{
		AfxMessageBox("���ͳɹ�");
	}
	else
	{
		AfxMessageBox("����ʧ��");

	}
}


void CSeniorWGDlg::OnBnClickedBtnClear()
{
	// TODO:  �ڴ���ӿؼ�֪ͨ����������
	GetDlgItem(IDC_LIST1)->SetWindowTextA("");
	GetDlgItem(IDC_LIST_WG)->SetWindowTextA("");
}
int CSeniorWGDlg::GetComIni(int nID){
	CString str;
	GetDlgItem(nID)->GetWindowText(str);
	if (str == "ʮ����")
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


void CSeniorWGDlg::OnBnClickedBtnSendAuto()
{
	// TODO:  �ڴ���ӿؼ�֪ͨ����������
	CString strUI;
	GetDlgItem(IDC_BTN_SEND_AUTO)->GetWindowTextA(strUI);
	if (strUI=="�Զ�ѭ������")
	{
		GetDlgItem(IDC_EDIT1)->EnableWindow(FALSE);
		int nData = GetDlgItemInt(IDC_EDIT1);
		if (nData <= 0)
		{
			AfxMessageBox("��������ȷʱ����");
			return;
		}
		SetTimer(1, nData, NULL);
		m_nCurSendData = 0;
		GetDlgItem(IDC_BTN_SEND_AUTO)->SetWindowTextA("ֹͣѭ������");
	}
	else if (strUI == "ֹͣѭ������")
	{
		KillTimer(1);
		m_nCurSendData = 0;
		GetDlgItem(IDC_EDIT1)->EnableWindow(TRUE);
		GetDlgItem(IDC_BTN_SEND_AUTO)->SetWindowTextA("�Զ�ѭ������");
	}
	
}


void CSeniorWGDlg::OnTimer(UINT_PTR nIDEvent)
{
	// TODO:  �ڴ������Ϣ�����������/�����Ĭ��ֵ
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

// BasicVolDlg.cpp : ʵ���ļ�
//

#include "stdafx.h"
#include "VzFaceSDKDemo.h"
#include "BasicVolDlg.h"
#include "afxdialogex.h"
#include <vector>

// CBasicVolDlg �Ի���

IMPLEMENT_DYNAMIC(CBasicVolDlg, CDialogEx)

CBasicVolDlg::CBasicVolDlg(VzLPRClientHandle cam, CWnd* pParent /*=NULL*/)
	: CDialogEx(CBasicVolDlg::IDD, pParent)
{
	m_cam = cam;
}

CBasicVolDlg::~CBasicVolDlg()
{
}

void CBasicVolDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialogEx::DoDataExchange(pDX);
	DDX_Control(pDX, IDC_SLIDER1, m_SliderVol);
	DDX_Control(pDX, IDC_LIST1, m_ListCtrl);
}


BEGIN_MESSAGE_MAP(CBasicVolDlg, CDialogEx)
	ON_BN_CLICKED(IDC_BTN_LOAD, &CBasicVolDlg::OnBnClickedBtnLoad)
	ON_BN_CLICKED(IDC_BTN_VOL, &CBasicVolDlg::OnBnClickedBtnVol)
	ON_WM_HSCROLL()
	ON_BN_CLICKED(IDC_BTN_LOAD2, &CBasicVolDlg::OnBnClickedBtnLoad2)
	ON_BN_CLICKED(IDC_BTN_VOL2, &CBasicVolDlg::OnBnClickedBtnVol2)
	ON_MESSAGE(WM_BN_CLICK,OnBnClicked)
END_MESSAGE_MAP()


// CBasicVolDlg ��Ϣ�������


void CBasicVolDlg::OnBnClickedBtnLoad()
{
	// TODO:  �ڴ���ӿؼ�֪ͨ����������
	GetInfo(true);
}
void CBasicVolDlg::GetInfo(bool bShow=false){
	ZBX_AudioConfig audioConfig;
	int ret = ZBX_GetAudioConfig(m_cam, &audioConfig);
	if (ret == 0)
	{
		m_SliderVol.SetPos((audioConfig.volume) * 4);
		SetDlgItemInt(IDC_EDIT1, (audioConfig.volume) * 4);
		if (bShow)
		{
			AfxMessageBox("��ȡ�ɹ�");
		}
	}
	else{
		if (bShow)
		{
			AfxMessageBox("��ȡʧ��");
		}
	}
}

void CBasicVolDlg::OnBnClickedBtnVol()
{
	// TODO:  �ڴ���ӿؼ�֪ͨ����������
	ZBX_AudioConfig config;
	//config.type = nUIData;
	CString strValue;
	config.volume = m_nVol / 4;
	int nRet = ZBX_SetAudioConfig(m_cam, config);
	if (nRet != 0)
	{
		AfxMessageBox("����ʧ��");
		Log() << "Set Audieo Config fiail nRet = " << nRet << "\r\n";
	}
	else{

		AfxMessageBox("���óɹ�");
		Log() << "Set Audieo Config succeed vol = " << m_nVol << "\r\n";
	}
}
CString CBasicVolDlg::GetBroseFile(){
	return "";
}

void CBasicVolDlg::UpdateWav(int nType){
	LPCTSTR lpszFilter = "wav files(*.wav; *.Wav; *.WAV) | *.wav; *.WAV, *.Wav | All Files(*.*) | *.* || ";
	CFileDialog dlg(TRUE, lpszFilter, NULL, OFN_HIDEREADONLY | OFN_OVERWRITEPROMPT, lpszFilter, NULL);
	CString filepath;
	CFile file;
	//���ļ��Ի���
	if (dlg.DoModal() == IDOK)
	{
		filepath = dlg.GetPathName();
		if (!PathFileExists(filepath))
		{
			AfxMessageBox("��ѡ���ļ�");
			return ;
		} 
		else if (filepath.IsEmpty())
		{
			return;
		}
	}
	else
	{
		return;
	}
	int nRet = -1;
	switch (nType+1)
	{
	case VOL_TYPE_SUCESS:
		nRet = ZBX_ModifyAudio(m_cam, filepath, VOL_TYPE_SUCESS);
		break;
	case VOL_TYPE_FAILURE:
		nRet = ZBX_ModifyAudio(m_cam, filepath, VOL_TYPE_FAILURE);
		break;
	case VOL_TYPE_RESWIPEIDCARD:
		nRet = ZBX_ModifyAudio(m_cam, filepath, VOL_TYPE_RESWIPEIDCARD);
		break;
	case VOL_TYPE_DEADLINE:
		nRet = ZBX_ModifyAudio(m_cam, filepath, VOL_TYPE_DEADLINE);
		break;
	case VOL_TYPE_WELCOME:
		nRet = ZBX_ModifyAudio(m_cam, filepath, VOL_TYPE_WELCOME);
		break;
	case VOL_TYPE_SAFEHAT:
		nRet = ZBX_ModifyAudio(m_cam, filepath, VOL_TYPE_SAFEHAT);
		break;
	case VOL_TYPE_OUTTIME:
		nRet = ZBX_ModifyAudio(m_cam, filepath, VOL_TYPE_OUTTIME);
		break;
	case VOL_TYPE_BLACK:
		nRet = ZBX_ModifyAudio(m_cam, filepath, VOL_TYPE_BLACK);
		break;
	default:
		break;
	}
	if (nRet == 0)
	{
		AfxMessageBox("�ϴ��ɹ�");
	}
	else
	{
		AfxMessageBox("�ϴ�ʧ��");
	}
}

void CBasicVolDlg::TestAudio(int nType){
	switch (nType + 1)
	{
	case VOL_TYPE_SUCESS:
		ZBX_TestAudio(m_cam, VOL_TYPE_SUCESS);
		break;
	case VOL_TYPE_FAILURE:
		ZBX_TestAudio(m_cam, VOL_TYPE_FAILURE);
		break;
	case VOL_TYPE_RESWIPEIDCARD:
		ZBX_TestAudio(m_cam, VOL_TYPE_RESWIPEIDCARD);
		break;
	case VOL_TYPE_DEADLINE:
		ZBX_TestAudio(m_cam, VOL_TYPE_DEADLINE);
		break;
	case VOL_TYPE_WELCOME:
		ZBX_TestAudio(m_cam, VOL_TYPE_WELCOME);
		break;
	case VOL_TYPE_SAFEHAT:
		ZBX_TestAudio(m_cam, VOL_TYPE_SAFEHAT);
		break;
	case VOL_TYPE_OUTTIME:
		ZBX_TestAudio(m_cam, VOL_TYPE_OUTTIME);
		break;	
	case VOL_TYPE_BLACK:
		ZBX_TestAudio(m_cam, VOL_TYPE_BLACK);
		break;
	default:
		break;
	}
}

void CBasicVolDlg::FactoryAudio(int nType)
{
	int nRet = -1;
	switch (nType + 1)
	{
	case VOL_TYPE_SUCESS:
		nRet=ZBX_ModifyFactoryAudio(m_cam, VOL_TYPE_SUCESS);
		break;
	case VOL_TYPE_FAILURE:
		nRet = ZBX_ModifyFactoryAudio(m_cam, VOL_TYPE_FAILURE);
		break;
	case VOL_TYPE_RESWIPEIDCARD:
		nRet = ZBX_ModifyFactoryAudio(m_cam, VOL_TYPE_RESWIPEIDCARD);
		break;
	case VOL_TYPE_DEADLINE:
		nRet = ZBX_ModifyFactoryAudio(m_cam, VOL_TYPE_DEADLINE);
		break;
	case VOL_TYPE_WELCOME:
		nRet = ZBX_ModifyFactoryAudio(m_cam, VOL_TYPE_WELCOME);
		break;
	case VOL_TYPE_SAFEHAT:
		nRet = ZBX_ModifyFactoryAudio(m_cam, VOL_TYPE_SAFEHAT);
		break;
	case VOL_TYPE_OUTTIME:
		nRet = ZBX_ModifyFactoryAudio(m_cam, VOL_TYPE_OUTTIME);
		break;	
	case VOL_TYPE_BLACK:
			nRet = ZBX_ModifyFactoryAudio(m_cam, VOL_TYPE_BLACK);
			break;
	default:
		break;
	}
	if (nRet == 0)
	{
		AfxMessageBox("�ָ��ɹ�");
	}
	else
	{
		AfxMessageBox("�ָ�ʧ��");
	}
}

LRESULT CBasicVolDlg::OnBnClicked(WPARAM w, LPARAM p)
{
	int nSubItem = (int)p;
	int nItem = (int)w;
	if (p==2)
	{
		UpdateWav((int)w);
	}else if (p==3)
	{
		TestAudio((int)w);
	}else if (p==4)
	{
		FactoryAudio((int)w);
	}
	return 1l;
}

BOOL CBasicVolDlg::OnInitDialog()
{
	CDialogEx::OnInitDialog();

	// TODO:  �ڴ���Ӷ���ĳ�ʼ��

	
	m_ListCtrl.InsertColumn(0, "���", DT_CENTER, 60);
	m_ListCtrl.InsertColumn(1, "��������", DT_CENTER, 180);
	m_ListCtrl.InsertColumn(2, "�Զ���", DT_CENTER, 110);
	m_ListCtrl.InsertColumn(3, "����", DT_CENTER, 60);
	m_ListCtrl.InsertColumn(4, "�ָ�����", DT_CENTER, 160);
	m_ListCtrl.SetHeadBKColor(RGB(227, 227, 227), 0);
	m_ListCtrl.SetHeadFont(14, FW_NORMAL, FALSE, FALSE, "����");
	m_ListCtrl.SetHeadHeight(1.5);
	m_ListCtrl.SetRowHeigt(50);
	m_ListCtrl.SetLineSelectMode(true);
	std::vector<CString>vec = {"ͨ������","ʧ����ʾ��","����ˢ���֤","Ȩ���ѹ���","��������","δ����ȫñ��ֹͨ��","δ����Чʱ��","������"};
	HWND hnd = this->GetSafeHwnd();
	CString str;
	for (auto i:vec)
	{
		int nCout = m_ListCtrl.GetItemCount();
		int nItem = m_ListCtrl.InsertItem(nCout, i);
		str.Format("%d", nItem + 1);
		m_ListCtrl.SetItemText(nItem, 0, str);
		m_ListCtrl.SetItemText(nItem, 1, i);
		m_ListCtrl.createItemButton(nItem, 2, hnd, "�ϴ��ļ�",1,0);
		m_ListCtrl.createItemButton(nItem, 3, hnd, "", 1,IDB_BIT_TEST);
		m_ListCtrl.createItemButton(nItem, 4, hnd, "", 1, IDB_BIT_AUTO);
	}
	GetInfo(false);
	return TRUE;  // return TRUE unless you set the focus to a control
	// �쳣:  OCX ����ҳӦ���� FALSE
}


void CBasicVolDlg::OnHScroll(UINT nSBCode, UINT nPos, CScrollBar* pScrollBar)
{
	// TODO:  �ڴ������Ϣ�����������/�����Ĭ��ֵ
	m_nVol = m_SliderVol.GetPos();//ȡ�õ�ǰλ��ֵ  
	SetDlgItemInt(IDC_EDIT1, m_nVol);
	CDialogEx::OnHScroll(nSBCode, nPos, pScrollBar);
}


void CBasicVolDlg::OnBnClickedBtnLoad2()
{
	// TODO:  �ڴ���ӿؼ�֪ͨ����������

}


void CBasicVolDlg::OnBnClickedBtnVol2()
{
	// TODO:  �ڴ���ӿؼ�֪ͨ����������
}


BOOL CBasicVolDlg::PreTranslateMessage(MSG* pMsg)
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

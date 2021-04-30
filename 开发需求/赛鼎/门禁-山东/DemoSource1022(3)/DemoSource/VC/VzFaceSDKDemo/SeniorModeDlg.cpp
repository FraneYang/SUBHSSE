// SeniorModeDlg.cpp : ʵ���ļ�
//

#include "stdafx.h"
#include "VzFaceSDKDemo.h"
#include "SeniorModeDlg.h"
#include "afxdialogex.h"


// CSeniorModeDlg �Ի���

IMPLEMENT_DYNAMIC(CSeniorModeDlg, CDialogEx)

CSeniorModeDlg::CSeniorModeDlg(VzLPRClientHandle cam, CWnd* pParent /*=NULL*/)
	: CDialogEx(CSeniorModeDlg::IDD, pParent)
{
	m_cam = cam;
}

CSeniorModeDlg::~CSeniorModeDlg()
{
}

void CSeniorModeDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialogEx::DoDataExchange(pDX);
	DDX_Control(pDX, IDC_COM_RELAY1, m_Gpio1);
}


void CSeniorModeDlg::Run()
{

}

BEGIN_MESSAGE_MAP(CSeniorModeDlg, CDialogEx)
	ON_BN_CLICKED(IDC_BTN_GETOPEN2, &CSeniorModeDlg::OnBnClickedBtnGetopen2)
//	ON_WM_VSCROLL()
//	ON_WM_MOUSEWHEEL()
	ON_BN_CLICKED(IDC_RADIO1, &CSeniorModeDlg::OnBnClickedRadio1)
	ON_BN_CLICKED(IDC_RADIO2, &CSeniorModeDlg::OnBnClickedRadio2)
	ON_BN_CLICKED(IDC_RADIO4, &CSeniorModeDlg::OnBnClickedRadio4)
	ON_BN_CLICKED(IDC_RADIO7, &CSeniorModeDlg::OnBnClickedRadio7)
	ON_BN_CLICKED(IDC_RADIO5, &CSeniorModeDlg::OnBnClickedRadio5)
	ON_BN_CLICKED(IDC_RADIO3, &CSeniorModeDlg::OnBnClickedRadio3)
	ON_BN_CLICKED(IDC_RADIO6, &CSeniorModeDlg::OnBnClickedRadio6)
	ON_BN_CLICKED(IDC_RADIO8, &CSeniorModeDlg::OnBnClickedRadio8)
	ON_BN_CLICKED(IDC_BTN_SETOPEN, &CSeniorModeDlg::OnBnClickedBtnSetopen)
	ON_BN_CLICKED(IDC_BTN_GETOPEN, &CSeniorModeDlg::OnBnClickedBtnGetopen)
	ON_BN_CLICKED(IDC_BTN_SETOPEN2, &CSeniorModeDlg::OnBnClickedBtnSetopen2)
	ON_BN_CLICKED(IDC_BTN_RELAYSET1, &CSeniorModeDlg::OnBnClickedBtnRelayset1)
	ON_BN_CLICKED(IDC_BTN_RELAYREAD1, &CSeniorModeDlg::OnBnClickedBtnRelayread1)
END_MESSAGE_MAP()


// CSeniorModeDlg ��Ϣ�������


void CSeniorModeDlg::OnBnClickedBtnGetopen2()
{
	// TODO:  �ڴ���ӿؼ�֪ͨ����������
	OnGetGroupInfo(true);
}


BOOL CSeniorModeDlg::OnInitDialog()
{
	CDialogEx::OnInitDialog();
	m_Gpio1.InsertString(0, "�Զ�");
	m_Gpio1.InsertString(1, "����");
	m_Gpio1.InsertString(2, "����");
	// TODO:  �ڴ���Ӷ���ĳ�ʼ��
#if 0 
	SCROLLINFO vinfo;

	vinfo.cbSize = sizeof(vinfo);

	vinfo.fMask = SIF_ALL;

	vinfo.nPage = 25;//����������ĳ��̣�ͨ�������¹�ϵ���䳤��/���������ȣ���������ͷ��=nPage/(nMax+2)��

	//����nPageȡֵ-1ʱ���������᲻���ˡ�

	vinfo.nMax = 50;//���������ܹ��������ֵ

	vinfo.nMin = 0;//���������ܹ�������Сֵ

	vinfo.nTrackPos = 0;
	SetScrollInfo(SB_VERT, &vinfo);//��ʹ��������һ������ʹ�ô������Ҳ������ʾ������
#endif
	OnSetCurtype(false);
	OnGetGroupInfo(false);
	OnGetIOTime(false);
	return TRUE;  // return TRUE unless you set the focus to a control
	// �쳣:  OCX ����ҳӦ���� FALSE
}

void CSeniorModeDlg::OnGetGroupInfo(bool bshow){
	Group_Rec rc{0};
	int nRet = ZBX_GetGroupRec(m_cam,&rc);
	if (nRet==0)
	{
		((CButton*)GetDlgItem(IDC_CHECK1))->SetCheck(rc.status);
		SetDlgItemInt(IDC_EDIT_GROUPNUM, rc.per_num);
		SetDlgItemInt(IDC_EDIT_GROUPTIME, rc.time);
		if (bshow)
		{
			AfxMessageBox("��ȡ���");
		}
	}
	else
	{
		if (bshow)
		{
			AfxMessageBox("��ȡʧ��");
		}
	}

}



void CSeniorModeDlg::OnBnClickedRadio1()
{
	// TODO:  �ڴ���ӿؼ�֪ͨ����������
	m_nCurOpenType = 0;
}


void CSeniorModeDlg::OnBnClickedRadio2()
{
	// TODO:  �ڴ���ӿؼ�֪ͨ����������
	m_nCurOpenType = 3;
}


void CSeniorModeDlg::OnBnClickedRadio4()
{
	// TODO:  �ڴ���ӿؼ�֪ͨ����������
	m_nCurOpenType = 1;
}


void CSeniorModeDlg::OnBnClickedRadio7()
{
	// TODO:  �ڴ���ӿؼ�֪ͨ����������
	m_nCurOpenType = 2;
}


void CSeniorModeDlg::OnBnClickedRadio5()
{
	// TODO:  �ڴ���ӿؼ�֪ͨ����������
	m_nCurOpenType = 4;
}


void CSeniorModeDlg::OnBnClickedRadio3()
{
	// TODO:  �ڴ���ӿؼ�֪ͨ����������
	m_nCurOpenType = 5;
}


void CSeniorModeDlg::OnBnClickedRadio6()
{
	// TODO:  �ڴ���ӿؼ�֪ͨ����������
	m_nCurOpenType = 6;
}


void CSeniorModeDlg::OnBnClickedRadio8()
{
	// TODO:  �ڴ���ӿؼ�֪ͨ����������
	m_nCurOpenType = 7;
}


void CSeniorModeDlg::OnBnClickedBtnSetopen()
{
	// TODO:  �ڴ���ӿؼ�֪ͨ����������
	int nRet = ZBX_SetGatewayControlType(m_cam, m_nCurOpenType);
	if (!nRet)
	{
		AfxMessageBox("���óɹ�");
	}
	else
	{
		AfxMessageBox("����ʧ��");
	}
}


void CSeniorModeDlg::OnBnClickedBtnGetopen()
{
	// TODO:  �ڴ���ӿؼ�֪ͨ����������
	OnSetCurtype(TRUE);
}

void CSeniorModeDlg::OnSetCurtype(bool bshow){
	((CButton *)GetDlgItem(IDC_RADIO1))->SetCheck(FALSE);
	((CButton *)GetDlgItem(IDC_RADIO2))->SetCheck(FALSE);
	((CButton *)GetDlgItem(IDC_RADIO3))->SetCheck(FALSE);
	((CButton *)GetDlgItem(IDC_RADIO4))->SetCheck(FALSE);
	((CButton *)GetDlgItem(IDC_RADIO5))->SetCheck(FALSE);
	((CButton *)GetDlgItem(IDC_RADIO6))->SetCheck(FALSE);
	((CButton *)GetDlgItem(IDC_RADIO7))->SetCheck(FALSE);
	((CButton *)GetDlgItem(IDC_RADIO8))->SetCheck(FALSE);
	int nType = -1;
	int nRet = ZBX_GetGatewayControlType(m_cam, &m_nCurOpenType);
	if (bshow)
	{
		if (!nRet)
		{
			AfxMessageBox("��ȡ�ɹ�");
		}
		else
		{
			AfxMessageBox("��ȡʧ��");
		}
	}
	switch (m_nCurOpenType)
	{
	case 0:
		((CButton *)GetDlgItem(IDC_RADIO1))->SetCheck(TRUE);
		break;
	case 1:
		((CButton *)GetDlgItem(IDC_RADIO4))->SetCheck(TRUE);
		break;
	case 2:
		((CButton *)GetDlgItem(IDC_RADIO7))->SetCheck(TRUE);
		break;
	case 3:
		((CButton *)GetDlgItem(IDC_RADIO2))->SetCheck(TRUE);
		break;
	case 4:
		((CButton *)GetDlgItem(IDC_RADIO5))->SetCheck(TRUE);
		break;
	case 5:
		((CButton *)GetDlgItem(IDC_RADIO3))->SetCheck(TRUE);
		break;
	case 6:
		((CButton *)GetDlgItem(IDC_RADIO6))->SetCheck(TRUE);
		break;
	case 7:
		((CButton *)GetDlgItem(IDC_RADIO8))->SetCheck(TRUE);
		break;
	default:
		break;
	}
}


void CSeniorModeDlg::OnBnClickedBtnSetopen2()
{
	// TODO:  �ڴ���ӿؼ�֪ͨ����������
	int nUIData = ((CButton*)GetDlgItem(IDC_CHECK1))->GetCheck();
	Group_Rec rc;
	rc.status = nUIData;
	CString strTmp;
	GetDlgItem(IDC_EDIT_GROUPNUM)->GetWindowTextA(strTmp);
	rc.per_num = atoi(strTmp);
	GetDlgItem(IDC_EDIT_GROUPTIME)->GetWindowTextA(strTmp);
	rc.time = atoi(strTmp);
	int nRet = ZBX_SetGroupRec(m_cam,rc);
	if (nRet == 0)
	{
		AfxMessageBox("���óɹ�");
	}
	else{
		AfxMessageBox("����ʧ��");
	}

}
//void CSeniorModeDlg::OnVScroll(UINT nSBCode, UINT nPos, CScrollBar* pScrollBar)
//{
//	// TODO:  �ڴ������Ϣ�����������/�����Ĭ��ֵ
//
//	__super::OnVScroll(nSBCode, nPos, pScrollBar);
//
//	CDialogEx::OnVScroll(nSBCode, nPos, pScrollBar);
//	SCROLLINFO scrollinfo;
//
//	GetScrollInfo(SB_VERT, &scrollinfo, SIF_ALL);
//	switch (nSBCode)
//
//	{
//
//	case SB_BOTTOM: //�����������ײ�
//
//		ScrollWindow(0, (scrollinfo.nPos - scrollinfo.nMax) * 10); //������Ļ
//
//		scrollinfo.nPos = scrollinfo.nMax; //�趨������λ��
//
//		SetScrollInfo(SB_VERT, &scrollinfo, SIF_ALL); //���»���λ��
//
//		break;
//
//	case SB_TOP: //������������
//
//		ScrollWindow(0, (scrollinfo.nPos - scrollinfo.nMin) * 10);
//
//		scrollinfo.nPos = scrollinfo.nMin;
//
//		SetScrollInfo(SB_VERT, &scrollinfo, SIF_ALL);
//
//		break;
//
//	case SB_LINEUP: //�����ϼ�ͷ
//
//		scrollinfo.nPos -= 1;
//
//		if (scrollinfo.nPos < scrollinfo.nMin)
//
//		{
//
//			scrollinfo.nPos = scrollinfo.nMin;
//
//			break;
//
//		}
//
//		SetScrollInfo(SB_VERT, &scrollinfo, SIF_ALL);
//
//		ScrollWindow(0, 10);
//
//		break;
//
//	case SB_LINEDOWN: //�����¼�ͷ
//
//		scrollinfo.nPos += 1;
//
//		if (scrollinfo.nPos > scrollinfo.nMax)
//
//		{
//
//			scrollinfo.nPos = scrollinfo.nMax;
//
//			break;
//
//		}
//
//		SetScrollInfo(SB_VERT, &scrollinfo, SIF_ALL);
//
//		ScrollWindow(0, -10);
//
//		break;
//
//	case SB_PAGEUP: //���������Ϸ��հ�����
//
//		scrollinfo.nPos -= 5;
//
//		if (scrollinfo.nPos < scrollinfo.nMin)
//
//		{
//
//			scrollinfo.nPos = scrollinfo.nMin;
//
//			break;
//
//		}
//
//		SetScrollInfo(SB_VERT, &scrollinfo, SIF_ALL);
//
//		ScrollWindow(0, 10 * 5);
//
//		break;
//
//	case SB_PAGEDOWN: //���������·��հ�����
//
//		scrollinfo.nPos += 5;
//
//		if (scrollinfo.nPos > scrollinfo.nMax)
//
//		{
//
//			scrollinfo.nPos = scrollinfo.nMax;
//
//			break;
//
//		}
//
//		SetScrollInfo(SB_VERT, &scrollinfo, SIF_ALL);
//
//		ScrollWindow(0, -10 * 5);
//
//		break;
//
//	case SB_ENDSCROLL: //����뿪���飬���������϶�
//
//		// MessageBox("SB_ENDSCROLL");
//
//		break;
//
//	case SB_THUMBPOSITION:
//
//		// ScrollWindow(0,(scrollinfo.nPos-nPos)*10);
//
//		// scrollinfo.nPos = nPos;
//
//		// SetScrollInfo(SB_VERT,&scrollinfo,SIF_ALL);
//
//		break;
//
//	case SB_THUMBTRACK: //�϶�����
//
//		ScrollWindow(0, (scrollinfo.nPos - nPos) * 10);
//		scrollinfo.nPos = nPos;
//		SetScrollInfo(SB_VERT, &scrollinfo, SIF_ALL);
//		break;
//
//	}
//}


//BOOL CSeniorModeDlg::OnMouseWheel(UINT nFlags, short zDelta, CPoint pt)
//{
//	// TODO:  �ڴ������Ϣ�����������/�����Ĭ��ֵ
//#if 0
//	SCROLLINFO scrollinfo;
//	GetScrollInfo(SB_VERT, &scrollinfo, SIF_ALL);
//
//	int n = zDelta < 0 ? -1 * zDelta / 120 : zDelta / 120;
//	if (zDelta<0)
//	{
//		scrollinfo.nPos += 10 * n;
//		if (scrollinfo.nPos > scrollinfo.nMax)
//		{
//			scrollinfo.nPos = scrollinfo.nMax;
//			return __super::OnMouseWheel(nFlags, zDelta, pt);
//		}
//		SetScrollInfo(SB_VERT, &scrollinfo, SIF_ALL);
//		ScrollWindow(0, -10 * 3 * n);
//	}
//	else
//	{
//		scrollinfo.nPos -= 10 * n;
//		if (scrollinfo.nPos < scrollinfo.nMin)
//		{
//			scrollinfo.nPos = scrollinfo.nMin;
//			return __super::OnMouseWheel(nFlags, zDelta, pt);
//		}
//		SetScrollInfo(SB_VERT, &scrollinfo, SIF_ALL);
//		ScrollWindow(0, 10 * 3 * n);
//	}
//#endif
//	return __super::OnMouseWheel(nFlags, zDelta, pt);
//}

void CSeniorModeDlg::OnBnClickedBtnRelayset1()
{
	// TODO:  �ڴ���ӿؼ�֪ͨ����������
	CString str;
	GetDlgItem(IDC_EDIT_TIME1)->GetWindowTextA(str);
	int nData = atoi(str);
	if (nData<500||nData>5000)
	{
		AfxMessageBox("������500~5000֮�������");
		return;
	}
	int nRet = ZBX_SetAlarmDuration(m_cam, atoi(str));	
	int nCur = m_Gpio1.GetCurSel();
	nRet = ZBX_SetGpioWorkState(m_cam, nCur);
	if (nRet == 0)
	{
		AfxMessageBox("���óɹ�");
	}
	else
	{
		AfxMessageBox("����ʧ��");
	}
}

void CSeniorModeDlg::OnGetIOTime(bool bShow){
	int nTime = -1;
	int nRet = ZBX_GetAlarmDuration(m_cam, &nTime);
	if (nRet==0)
	{	
	}
	else
	{
		if (bShow)
		{
			AfxMessageBox("��ȡʧ��");
			return;
		}
	}
	SetDlgItemInt(IDC_EDIT_TIME1, nTime);

	nRet = ZBX_GetGpioWorkState(m_cam, &nTime);
	if (nRet == 0)
	{
		if (bShow)
		{
			AfxMessageBox("��ȡ�ɹ�");
		}
	}
	else
	{
		if (bShow)
		{
			AfxMessageBox("��ȡʧ��");
		}
	}
	m_Gpio1.SetCurSel(nTime);

}
void CSeniorModeDlg::OnBnClickedBtnRelayread1()
{
	// TODO:  �ڴ���ӿؼ�֪ͨ����������
	OnGetIOTime(true);
}



BOOL CSeniorModeDlg::PreTranslateMessage(MSG* pMsg)
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
	return __super::PreTranslateMessage(pMsg);
}

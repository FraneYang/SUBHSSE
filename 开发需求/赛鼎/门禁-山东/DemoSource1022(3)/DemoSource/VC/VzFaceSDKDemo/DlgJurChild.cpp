// DlgJurChild.cpp : ʵ���ļ�
//

#include "stdafx.h"
#include "VzFaceSDKDemo.h"
#include "DlgJurChild.h"
#include "afxdialogex.h"


// CDlgJurChild �Ի���

IMPLEMENT_DYNAMIC(CDlgJurChild, CDialogEx)

CDlgJurChild::CDlgJurChild(CWnd* pParent /*=NULL*/)
	: CDialogEx(CDlgJurChild::IDD, pParent)
{

}

CDlgJurChild::~CDlgJurChild()
{
}

void CDlgJurChild::DoDataExchange(CDataExchange* pDX)
{
	CDialogEx::DoDataExchange(pDX);
}


BEGIN_MESSAGE_MAP(CDlgJurChild, CDialogEx)
	ON_WM_SIZE()
//	ON_WM_CREATE()
//	ON_WM_HSCROLL()
ON_WM_VSCROLL()

ON_BN_CLICKED(IDC_BTN1, &CDlgJurChild::OnBnClickedBtn1)
ON_BN_CLICKED(IDC_BTN2, &CDlgJurChild::OnBnClickedBtn2)
ON_BN_CLICKED(IDC_BTN3, &CDlgJurChild::OnBnClickedBtn3)
ON_BN_CLICKED(IDC_BTN4, &CDlgJurChild::OnBnClickedBtn4)
ON_BN_CLICKED(IDC_BTN5, &CDlgJurChild::OnBnClickedBtn5)
ON_BN_CLICKED(IDC_BTN6, &CDlgJurChild::OnBnClickedBtn6)
ON_BN_CLICKED(IDC_BTN7, &CDlgJurChild::OnBnClickedBtn7)
ON_BN_CLICKED(IDC_BTN8, &CDlgJurChild::OnBnClickedBtn8)
ON_BN_CLICKED(IDC_BTN9, &CDlgJurChild::OnBnClickedBtn9)
ON_BN_CLICKED(IDC_BTN10, &CDlgJurChild::OnBnClickedBtn10)
ON_WM_KILLFOCUS()
//ON_NOTIFY(NM_KILLFOCUS, IDC_TIME1, &CDlgJurChild::OnKillfocusTime1)
ON_NOTIFY(DTN_DATETIMECHANGE, IDC_TIME1, &CDlgJurChild::OnThemechangedTime1)
ON_NOTIFY(DTN_DATETIMECHANGE, IDC_TIME2, &CDlgJurChild::OnThemechangedTime2)
ON_NOTIFY(DTN_DATETIMECHANGE, IDC_TIME3, &CDlgJurChild::OnThemechangedTime3)
ON_NOTIFY(DTN_DATETIMECHANGE, IDC_TIME4, &CDlgJurChild::OnThemechangedTime4)
ON_NOTIFY(DTN_DATETIMECHANGE, IDC_TIME5, &CDlgJurChild::OnThemechangedTime5)
ON_NOTIFY(DTN_DATETIMECHANGE, IDC_TIME6, &CDlgJurChild::OnThemechangedTime6)
ON_NOTIFY(DTN_DATETIMECHANGE, IDC_TIME7, &CDlgJurChild::OnThemechangedTime7)
ON_NOTIFY(DTN_DATETIMECHANGE, IDC_TIME8, &CDlgJurChild::OnThemechangedTime8)
ON_NOTIFY(DTN_DATETIMECHANGE, IDC_TIME9, &CDlgJurChild::OnThemechangedTime9)
ON_NOTIFY(DTN_DATETIMECHANGE, IDC_TIME10, &CDlgJurChild::OnThemechangedTime10)


ON_NOTIFY(DTN_DATETIMECHANGE, IDC_TIME_E1, &CDlgJurChild::OnThemechangedTimeE1)
ON_NOTIFY(DTN_DATETIMECHANGE, IDC_TIME_E2, &CDlgJurChild::OnThemechangedTimeE2)
ON_NOTIFY(DTN_DATETIMECHANGE, IDC_TIME_E3, &CDlgJurChild::OnThemechangedTimeE3)
ON_NOTIFY(DTN_DATETIMECHANGE, IDC_TIME_E4, &CDlgJurChild::OnThemechangedTimeE4)
ON_NOTIFY(DTN_DATETIMECHANGE, IDC_TIME_E5, &CDlgJurChild::OnThemechangedTimeE5)
ON_NOTIFY(DTN_DATETIMECHANGE, IDC_TIME_E6, &CDlgJurChild::OnThemechangedTimeE6)
ON_NOTIFY(DTN_DATETIMECHANGE, IDC_TIME_E7, &CDlgJurChild::OnThemechangedTimeE7)
ON_NOTIFY(DTN_DATETIMECHANGE, IDC_TIME_E8, &CDlgJurChild::OnThemechangedTimeE8)
ON_NOTIFY(DTN_DATETIMECHANGE, IDC_TIME_E9, &CDlgJurChild::OnThemechangedTimeE9)
ON_NOTIFY(DTN_DATETIMECHANGE, IDC_TIME_E10, &CDlgJurChild::OnThemechangedTimeE10)
END_MESSAGE_MAP()


// CDlgJurChild ��Ϣ�������


BOOL CDlgJurChild::OnInitDialog()
{
	CDialogEx::OnInitDialog();

	// TODO:  �ڴ���Ӷ���ĳ�ʼ��
	initVol();
	
	return TRUE;  // return TRUE unless you set the focus to a control
	// �쳣:  OCX ����ҳӦ���� FALSE
}

void CDlgJurChild::initVol(){
	SCROLLINFO vinfo;

	vinfo.cbSize = sizeof(vinfo);

	vinfo.fMask = SIF_ALL;

	vinfo.nPage = 50;//����������ĳ��̣�ͨ�������¹�ϵ���䳤��/���������ȣ���������ͷ��=nPage/(nMax+2)��

	//����nPageȡֵ-1ʱ���������᲻���ˡ�

	vinfo.nMax = 100;//���������ܹ��������ֵ

	vinfo.nMin = 5;//���������ܹ�������Сֵ

	vinfo.nTrackPos = 0;

	SetScrollInfo(SB_VERT, &vinfo);//��ʹ��������һ������ʹ�ô������Ҳ������ʾ������
}
void CDlgJurChild::OnSize(UINT nType, int cx, int cy)
{
	CDialogEx::OnSize(nType, cx, cy);

	// TODO:  �ڴ˴������Ϣ����������

	

}


void CDlgJurChild::PreInitDialog()
{
	// TODO:  �ڴ����ר�ô����/����û���
	
	CDialogEx::PreInitDialog();
}


//int CDlgJurChild::OnCreate(LPCREATESTRUCT lpCreateStruct)
//{
//	if (CDialogEx::OnCreate(lpCreateStruct) == -1)
//		return -1;
//
//	// TODO:  �ڴ������ר�õĴ�������
//	
//	
//	return 0;
//}


//void CDlgJurChild::OnHScroll(UINT nSBCode, UINT nPos, CScrollBar* pScrollBar)
//{
//	// TODO:  �ڴ������Ϣ�����������/�����Ĭ��ֵ
//
//	CDialogEx::OnHScroll(nSBCode, nPos, pScrollBar);
//	OnRestSize(nPos);
//}


void CDlgJurChild::OnVScroll(UINT nSBCode, UINT nPos, CScrollBar* pScrollBar)
{
	// TODO:  �ڴ������Ϣ�����������/�����Ĭ��ֵ

	CDialogEx::OnVScroll(nSBCode, nPos, pScrollBar);
	SCROLLINFO scrollinfo;

	GetScrollInfo(SB_VERT, &scrollinfo, SIF_ALL);
	switch (nSBCode)

	{

	case SB_BOTTOM: //�����������ײ�

		ScrollWindow(0, (scrollinfo.nPos - scrollinfo.nMax) * 10); //������Ļ

		scrollinfo.nPos = scrollinfo.nMax; //�趨������λ��

		SetScrollInfo(SB_VERT, &scrollinfo, SIF_ALL); //���»���λ��

		break;

	case SB_TOP: //������������

		ScrollWindow(0, (scrollinfo.nPos - scrollinfo.nMin) * 10);

		scrollinfo.nPos = scrollinfo.nMin;

		SetScrollInfo(SB_VERT, &scrollinfo, SIF_ALL);

		break;

	case SB_LINEUP: //�����ϼ�ͷ

		scrollinfo.nPos -= 1;
		if (scrollinfo.nPos < scrollinfo.nMin)
		{
			scrollinfo.nPos = scrollinfo.nMin;
			break;
		}

		SetScrollInfo(SB_VERT, &scrollinfo, SIF_ALL);

		ScrollWindow(0, 10);

		break;

	case SB_LINEDOWN: //�����¼�ͷ

		scrollinfo.nPos += 1;

		if (scrollinfo.nPos > scrollinfo.nMax)

		{

			scrollinfo.nPos = scrollinfo.nMax;

			break;

		}

		SetScrollInfo(SB_VERT, &scrollinfo, SIF_ALL);

		ScrollWindow(0, -10);

		break;

	case SB_PAGEUP: //���������Ϸ��հ�����

		scrollinfo.nPos -= 5;

		if (scrollinfo.nPos < scrollinfo.nMin)

		{

			scrollinfo.nPos = scrollinfo.nMin;

			break;

		}

		SetScrollInfo(SB_VERT, &scrollinfo, SIF_ALL);

		ScrollWindow(0, 10 * 5);

		break;

	case SB_PAGEDOWN: //���������·��հ�����

		scrollinfo.nPos += 5;

		if (scrollinfo.nPos > scrollinfo.nMax)

		{

			scrollinfo.nPos = scrollinfo.nMax;

			break;

		}

		SetScrollInfo(SB_VERT, &scrollinfo, SIF_ALL);

		ScrollWindow(0, -10 * 5);

		break;

	case SB_ENDSCROLL: //����뿪���飬���������϶�

		// MessageBox("SB_ENDSCROLL");

		break;

	case SB_THUMBPOSITION:

		// ScrollWindow(0,(scrollinfo.nPos-nPos)*10);

		// scrollinfo.nPos = nPos;

		// SetScrollInfo(SB_VERT,&scrollinfo,SIF_ALL);

		break;

	case SB_THUMBTRACK: //�϶�����

		ScrollWindow(0, (scrollinfo.nPos - nPos) * 10);
		scrollinfo.nPos = nPos;
		SetScrollInfo(SB_VERT, &scrollinfo, SIF_ALL);
		break;

	}
	
}



void CDlgJurChild::AddItem()
{
	m_nCurIndex++;
	ShowUI(m_nCurIndex,TRUE,1);
	m_TimeSlots->st_slot[m_nCurIndex-1].s_sec = 0;
	m_TimeSlots->st_slot[m_nCurIndex-1].e_sec = 86399;
}

void CDlgJurChild::SetUIInit(){
	GetDlgItem(IDC_TIME1)->ShowWindow(FALSE);
	GetDlgItem(IDC_STATIC1)->ShowWindow(FALSE);
	GetDlgItem(IDC_TIME_E1)->ShowWindow(FALSE);
	GetDlgItem(IDC_BTN1)->ShowWindow(FALSE);
	GetDlgItem(IDC_TIME2)->ShowWindow(FALSE);
	GetDlgItem(IDC_STATIC2)->ShowWindow(FALSE);
	GetDlgItem(IDC_TIME_E2)->ShowWindow(FALSE);
	GetDlgItem(IDC_BTN2)->ShowWindow(FALSE);
	GetDlgItem(IDC_TIME3)->ShowWindow(FALSE);
	GetDlgItem(IDC_STATIC3)->ShowWindow(FALSE);
	GetDlgItem(IDC_TIME_E3)->ShowWindow(FALSE);
	GetDlgItem(IDC_BTN3)->ShowWindow(FALSE);
	GetDlgItem(IDC_TIME4)->ShowWindow(FALSE);
	GetDlgItem(IDC_STATIC4)->ShowWindow(FALSE);
	GetDlgItem(IDC_TIME_E4)->ShowWindow(FALSE);
	GetDlgItem(IDC_BTN4)->ShowWindow(FALSE);
	GetDlgItem(IDC_TIME5)->ShowWindow(FALSE);
	GetDlgItem(IDC_STATIC5)->ShowWindow(FALSE);
	GetDlgItem(IDC_TIME_E5)->ShowWindow(FALSE);
	GetDlgItem(IDC_BTN5)->ShowWindow(FALSE);
	GetDlgItem(IDC_TIME6)->ShowWindow(FALSE);
	GetDlgItem(IDC_STATIC6)->ShowWindow(FALSE);
	GetDlgItem(IDC_TIME_E6)->ShowWindow(FALSE);
	GetDlgItem(IDC_BTN6)->ShowWindow(FALSE);
	GetDlgItem(IDC_TIME7)->ShowWindow(FALSE);
	GetDlgItem(IDC_STATIC7)->ShowWindow(FALSE);
	GetDlgItem(IDC_TIME_E7)->ShowWindow(FALSE);
	GetDlgItem(IDC_BTN7)->ShowWindow(FALSE);
	GetDlgItem(IDC_TIME8)->ShowWindow(FALSE);
	GetDlgItem(IDC_STATIC8)->ShowWindow(FALSE);
	GetDlgItem(IDC_TIME_E8)->ShowWindow(FALSE);
	GetDlgItem(IDC_BTN8)->ShowWindow(FALSE);
	GetDlgItem(IDC_TIME9)->ShowWindow(FALSE);
	GetDlgItem(IDC_STATIC9)->ShowWindow(FALSE);
	GetDlgItem(IDC_TIME_E9)->ShowWindow(FALSE);
	GetDlgItem(IDC_BTN9)->ShowWindow(FALSE);
}

void CDlgJurChild::SetData(SecTimeSlots* timeslots)
{
	m_nCurIndex = 0;
	SetUIInit();
	if (!timeslots)
	{
		return;
	}
	unsigned int time = 1546272000;
	int nICurIndex = 1;
	for (int n = 0; n <= 9; n++)
	{
		CTime te(time + timeslots->st_slot[n].e_sec);
		CTime ts(time + timeslots->st_slot[n].s_sec);
		if ((timeslots->st_slot[n].e_sec != 0 && timeslots->st_slot[n].e_sec != 86400) || (timeslots->st_slot[n].s_sec != 0 && timeslots->st_slot[n].s_sec != 86400))
		{
			SetChildData(nICurIndex++, ts, te);			
		}
		
	}
	m_TimeSlots = timeslots;
	//m_TimeSlots = *timeslots;
}


void CDlgJurChild::SetChildData(int nId, CTime ts, CTime te){

	m_nCurIndex++;
	switch (nId)
	{
	case 1:
		GetDlgItem(IDC_TIME1)->ShowWindow(TRUE);
		GetDlgItem(IDC_STATIC1)->ShowWindow(TRUE);
		GetDlgItem(IDC_TIME_E1)->ShowWindow(TRUE);
		GetDlgItem(IDC_BTN1)->ShowWindow(TRUE);
		((CDateTimeCtrl*)(GetDlgItem(IDC_TIME1)))->SetTime(&ts);
		((CDateTimeCtrl*)(GetDlgItem(IDC_TIME_E1)))->SetTime(&te);
		break;
	case 2:
		GetDlgItem(IDC_TIME2)->ShowWindow(TRUE);
		GetDlgItem(IDC_STATIC2)->ShowWindow(TRUE);
		GetDlgItem(IDC_TIME_E2)->ShowWindow(TRUE);
		GetDlgItem(IDC_BTN2)->ShowWindow(TRUE);
		((CDateTimeCtrl*)(GetDlgItem(IDC_TIME2)))->SetTime(&ts);
		((CDateTimeCtrl*)(GetDlgItem(IDC_TIME_E2)))->SetTime(&te);
		break;
	case 3:
		GetDlgItem(IDC_TIME3)->ShowWindow(TRUE);
		GetDlgItem(IDC_STATIC3)->ShowWindow(TRUE);
		GetDlgItem(IDC_TIME_E3)->ShowWindow(TRUE);
		GetDlgItem(IDC_BTN3)->ShowWindow(TRUE);
		((CDateTimeCtrl*)(GetDlgItem(IDC_TIME3)))->SetTime(&ts);
		((CDateTimeCtrl*)(GetDlgItem(IDC_TIME_E3)))->SetTime(&te);
		break;
	case 4:
		GetDlgItem(IDC_TIME4)->ShowWindow(TRUE);
		GetDlgItem(IDC_STATIC4)->ShowWindow(TRUE);
		GetDlgItem(IDC_TIME_E4)->ShowWindow(TRUE);
		GetDlgItem(IDC_BTN4)->ShowWindow(TRUE);
		((CDateTimeCtrl*)(GetDlgItem(IDC_TIME4)))->SetTime(&ts);
		((CDateTimeCtrl*)(GetDlgItem(IDC_TIME_E4)))->SetTime(&te);
		break;
	case 5:
		GetDlgItem(IDC_TIME5)->ShowWindow(TRUE);
		GetDlgItem(IDC_STATIC5)->ShowWindow(TRUE);
		GetDlgItem(IDC_TIME_E5)->ShowWindow(TRUE);
		GetDlgItem(IDC_BTN5)->ShowWindow(TRUE);
		((CDateTimeCtrl*)(GetDlgItem(IDC_TIME5)))->SetTime(&ts);
		((CDateTimeCtrl*)(GetDlgItem(IDC_TIME_E5)))->SetTime(&te);
		break;
	case 6:
		GetDlgItem(IDC_TIME6)->ShowWindow(TRUE);
		GetDlgItem(IDC_STATIC6)->ShowWindow(TRUE);
		GetDlgItem(IDC_TIME_E6)->ShowWindow(TRUE);
		GetDlgItem(IDC_BTN6)->ShowWindow(TRUE);
		((CDateTimeCtrl*)(GetDlgItem(IDC_TIME6)))->SetTime(&ts);
		((CDateTimeCtrl*)(GetDlgItem(IDC_TIME_E6)))->SetTime(&te);
		break;
	case 7:
		GetDlgItem(IDC_TIME7)->ShowWindow(TRUE);
		GetDlgItem(IDC_STATIC7)->ShowWindow(TRUE);
		GetDlgItem(IDC_TIME_E7)->ShowWindow(TRUE);
		GetDlgItem(IDC_BTN7)->ShowWindow(TRUE);
		((CDateTimeCtrl*)(GetDlgItem(IDC_TIME7)))->SetTime(&ts);
		((CDateTimeCtrl*)(GetDlgItem(IDC_TIME_E7)))->SetTime(&te);
		break;
	case 8:
		GetDlgItem(IDC_TIME8)->ShowWindow(TRUE);
		GetDlgItem(IDC_STATIC8)->ShowWindow(TRUE);
		GetDlgItem(IDC_TIME_E8)->ShowWindow(TRUE);
		GetDlgItem(IDC_BTN8)->ShowWindow(TRUE);
		((CDateTimeCtrl*)(GetDlgItem(IDC_TIME8)))->SetTime(&ts);
		((CDateTimeCtrl*)(GetDlgItem(IDC_TIME_E8)))->SetTime(&te);
		break;
	case 9:
		GetDlgItem(IDC_TIME9)->ShowWindow(TRUE);
		GetDlgItem(IDC_STATIC9)->ShowWindow(TRUE);
		GetDlgItem(IDC_TIME_E9)->ShowWindow(TRUE);
		GetDlgItem(IDC_BTN9)->ShowWindow(TRUE);
		((CDateTimeCtrl*)(GetDlgItem(IDC_TIME9)))->SetTime(&ts);
		((CDateTimeCtrl*)(GetDlgItem(IDC_TIME_E9)))->SetTime(&te);
		break;
	case 10:
		GetDlgItem(IDC_TIME10)->ShowWindow(TRUE);
		GetDlgItem(IDC_STATIC10)->ShowWindow(TRUE);
		GetDlgItem(IDC_TIME_E10)->ShowWindow(TRUE);
		GetDlgItem(IDC_BTN10)->ShowWindow(TRUE);
		((CDateTimeCtrl*)(GetDlgItem(IDC_TIME10)))->SetTime(&ts);
		((CDateTimeCtrl*)(GetDlgItem(IDC_TIME_E10)))->SetTime(&te);
		break;
	default:
		break;
	}
}
void CDlgJurChild::ShowUI(int nID, bool bShow,int nInit){
	CTime T(2019, 10, 10, 0, 0, 0);
	CTime T1(2019, 10, 10, 23, 59, 59);
	switch (nID)
	{
	case 1:
		GetDlgItem(IDC_TIME1)->ShowWindow(bShow);
		GetDlgItem(IDC_STATIC1)->ShowWindow(bShow);
		GetDlgItem(IDC_TIME_E1)->ShowWindow(bShow);
		GetDlgItem(IDC_BTN1)->ShowWindow(bShow);
		if (nInit==1)
		{
			((CDateTimeCtrl*)(GetDlgItem(IDC_TIME1)))->SetTime(&T);
			((CDateTimeCtrl*)(GetDlgItem(IDC_TIME_E1)))->SetTime(&T1);

		}		
		break;
	case 2:
		GetDlgItem(IDC_TIME2)->ShowWindow(bShow);
		GetDlgItem(IDC_STATIC2)->ShowWindow(bShow);
		GetDlgItem(IDC_TIME_E2)->ShowWindow(bShow);
		GetDlgItem(IDC_BTN2)->ShowWindow(bShow);
		if (nInit == 1)
		{
			((CDateTimeCtrl*)(GetDlgItem(IDC_TIME2)))->SetTime(&T);
			((CDateTimeCtrl*)(GetDlgItem(IDC_TIME_E2)))->SetTime(&T1);
		}
		break;
	case 3:
		GetDlgItem(IDC_TIME3)->ShowWindow(bShow);
		GetDlgItem(IDC_STATIC3)->ShowWindow(bShow);
		GetDlgItem(IDC_TIME_E3)->ShowWindow(bShow);
		GetDlgItem(IDC_BTN3)->ShowWindow(bShow);
		if (nInit == 1)
		{
			((CDateTimeCtrl*)(GetDlgItem(IDC_TIME3)))->SetTime(&T);
			((CDateTimeCtrl*)(GetDlgItem(IDC_TIME_E3)))->SetTime(&T1);
		}
		break;
	case 4:
		GetDlgItem(IDC_TIME4)->ShowWindow(bShow);
		GetDlgItem(IDC_STATIC4)->ShowWindow(bShow);
		GetDlgItem(IDC_TIME_E4)->ShowWindow(bShow);
		GetDlgItem(IDC_BTN4)->ShowWindow(bShow);
		if (nInit == 1)
		{
			((CDateTimeCtrl*)(GetDlgItem(IDC_TIME4)))->SetTime(&T);
			((CDateTimeCtrl*)(GetDlgItem(IDC_TIME_E4)))->SetTime(&T1);
		}
		break;
	case 5:
		GetDlgItem(IDC_TIME5)->ShowWindow(bShow);
		GetDlgItem(IDC_STATIC5)->ShowWindow(bShow);
		GetDlgItem(IDC_TIME_E5)->ShowWindow(bShow);
		GetDlgItem(IDC_BTN5)->ShowWindow(bShow); 
		if (nInit == 1)
		{
			((CDateTimeCtrl*)(GetDlgItem(IDC_TIME5)))->SetTime(&T);
			((CDateTimeCtrl*)(GetDlgItem(IDC_TIME_E5)))->SetTime(&T1);
		}
		break;
	case 6:
		GetDlgItem(IDC_TIME6)->ShowWindow(bShow);
		GetDlgItem(IDC_STATIC6)->ShowWindow(bShow);
		GetDlgItem(IDC_TIME_E6)->ShowWindow(bShow);
		GetDlgItem(IDC_BTN6)->ShowWindow(bShow);
		if (nInit == 1)
		{
			((CDateTimeCtrl*)(GetDlgItem(IDC_TIME6)))->SetTime(&T);
			((CDateTimeCtrl*)(GetDlgItem(IDC_TIME_E6)))->SetTime(&T1);
		}
		break;
	case 7:
		GetDlgItem(IDC_TIME7)->ShowWindow(bShow);
		GetDlgItem(IDC_STATIC7)->ShowWindow(bShow);
		GetDlgItem(IDC_TIME_E7)->ShowWindow(bShow);
		GetDlgItem(IDC_BTN7)->ShowWindow(bShow);
		if (nInit == 1)
		{
			((CDateTimeCtrl*)(GetDlgItem(IDC_TIME7)))->SetTime(&T);
			((CDateTimeCtrl*)(GetDlgItem(IDC_TIME_E7)))->SetTime(&T1);
		}
		break;
	case 8:
		GetDlgItem(IDC_TIME8)->ShowWindow(bShow);
		GetDlgItem(IDC_STATIC8)->ShowWindow(bShow);
		GetDlgItem(IDC_TIME_E8)->ShowWindow(bShow);
		GetDlgItem(IDC_BTN8)->ShowWindow(bShow);
		if (nInit == 1)
		{
			((CDateTimeCtrl*)(GetDlgItem(IDC_TIME8)))->SetTime(&T);
			((CDateTimeCtrl*)(GetDlgItem(IDC_TIME_E8)))->SetTime(&T1);
		}
		break;
	case 9:
		GetDlgItem(IDC_TIME9)->ShowWindow(bShow);
		GetDlgItem(IDC_STATIC9)->ShowWindow(bShow);
		GetDlgItem(IDC_TIME_E9)->ShowWindow(bShow);
		GetDlgItem(IDC_BTN9)->ShowWindow(bShow);
		if (nInit == 1)
		{
			((CDateTimeCtrl*)(GetDlgItem(IDC_TIME9)))->SetTime(&T);
			((CDateTimeCtrl*)(GetDlgItem(IDC_TIME_E9)))->SetTime(&T1);
		}
		break;
	case 10:
		GetDlgItem(IDC_TIME10)->ShowWindow(bShow);
		GetDlgItem(IDC_STATIC10)->ShowWindow(bShow);
		GetDlgItem(IDC_TIME_E10)->ShowWindow(bShow);
		GetDlgItem(IDC_BTN10)->ShowWindow(bShow);
		if (nInit == 1)
		{
			((CDateTimeCtrl*)(GetDlgItem(IDC_TIME10)))->SetTime(&T);
			((CDateTimeCtrl*)(GetDlgItem(IDC_TIME_E10)))->SetTime(&T1);
		}
		break;
	default:
		break;
	}
}

void CDlgJurChild::OnBnClickedBtn1()
{
	// TODO:  �ڴ���ӿؼ�֪ͨ����������
	DeletePos(1);
	SetData(m_TimeSlots);
}


void CDlgJurChild::OnBnClickedBtn2()
{
	// TODO:  �ڴ���ӿؼ�֪ͨ����������
	DeletePos(2);
	SetData(m_TimeSlots);
}

void CDlgJurChild::DeletePos(int nPos){
	int nIndex = 0;
	for (int i = 0; i < 10; i++)
	{
		if (m_TimeSlots->st_slot[i].e_sec != 0 || m_TimeSlots->st_slot[i].s_sec != 0)
		{

			nIndex++;
			if (nIndex == nPos)
			{
				if (m_TimeSlots->st_slot[i].e_sec != 0 || m_TimeSlots->st_slot[i].s_sec != 0)
				{
					m_TimeSlots->st_slot[i].s_sec = 0;
					m_TimeSlots->st_slot[i].e_sec = 0;
					break;
				}
			}
		}
	}
}
void CDlgJurChild::OnBnClickedBtn3()
{
	// TODO:  �ڴ���ӿؼ�֪ͨ����������
	DeletePos(3);
	SetData(m_TimeSlots);
}


void CDlgJurChild::OnBnClickedBtn4()
{
	// TODO:  �ڴ���ӿؼ�֪ͨ����������
	DeletePos(4);
	SetData(m_TimeSlots);
}


void CDlgJurChild::OnBnClickedBtn5()
{
	// TODO:  �ڴ���ӿؼ�֪ͨ����������
	DeletePos(5);
	SetData(m_TimeSlots);
}


void CDlgJurChild::OnBnClickedBtn6()
{
	// TODO:  �ڴ���ӿؼ�֪ͨ����������
	DeletePos(6);
	SetData(m_TimeSlots);
}


void CDlgJurChild::OnBnClickedBtn7()
{
	// TODO:  �ڴ���ӿؼ�֪ͨ����������

	DeletePos(7);
	SetData(m_TimeSlots);
}


void CDlgJurChild::OnBnClickedBtn8()
{
	// TODO:  �ڴ���ӿؼ�֪ͨ����������

	DeletePos(8);
	SetData(m_TimeSlots);
}


void CDlgJurChild::OnBnClickedBtn9()
{
	// TODO:  �ڴ���ӿؼ�֪ͨ����������
	DeletePos(9);
	SetData(m_TimeSlots);
}


void CDlgJurChild::OnBnClickedBtn10()
{
	// TODO:  �ڴ���ӿؼ�֪ͨ����������
	DeletePos(10);
	SetData(m_TimeSlots);
}
void CDlgJurChild::DeleteTime(int nId){
	m_nCurIndex--;
	for (int n = 1; n <= 10;n++)
	{

	}
}

void CDlgJurChild::OnKillFocus(CWnd* pNewWnd)
{
	CDialogEx::OnKillFocus(pNewWnd);

	// TODO:  �ڴ˴������Ϣ����������
}

//void CDlgJurChild::OnKillfocusTime1(NMHDR *pNMHDR, LRESULT *pResult)
//{
//	// TODO:  �ڴ���ӿؼ�֪ͨ����������
//	CTime t;
//	((CDateTimeCtrl*)GetDlgItem(IDC_TIME1))->GetTime(t);
//	m_TimeSlots->st_slot[0].s_sec = t.GetHour()*3600+t.GetMinute()*60+t.GetSecond();
//	//m_TimeSlots->st_slot[0].e_sec = 0;
//	*pResult = 0;
//}

void CDlgJurChild::OnThemechangedTime1(NMHDR *pNMHDR, LRESULT *pResult)
{
	// �ù���Ҫ��ʹ�� Windows XP ����߰汾��
	// ���� _WIN32_WINNT ���� >= 0x0501��
	// TODO:  �ڴ���ӿؼ�֪ͨ����������
		CTime t;
		((CDateTimeCtrl*)GetDlgItem(IDC_TIME1))->GetTime(t);
		m_TimeSlots->st_slot[0].s_sec = t.GetHour()*3600+t.GetMinute()*60+t.GetSecond();
		//m_TimeSlots->st_slot[0].e_sec = 0;
	//	*pResult = 0;
	*pResult = 0;
}
void CDlgJurChild::OnThemechangedTime2(NMHDR *pNMHDR, LRESULT *pResult)
{
	CTime t;
	((CDateTimeCtrl*)GetDlgItem(IDC_TIME2))->GetTime(t);
	m_TimeSlots->st_slot[1].s_sec = t.GetHour() * 3600 + t.GetMinute() * 60 + t.GetSecond();
	*pResult = 0;
}
void CDlgJurChild::OnThemechangedTime3(NMHDR *pNMHDR, LRESULT *pResult)
{
	CTime t;
	((CDateTimeCtrl*)GetDlgItem(IDC_TIME3))->GetTime(t);
	m_TimeSlots->st_slot[2].s_sec = t.GetHour() * 3600 + t.GetMinute() * 60 + t.GetSecond();
	*pResult = 0;
}
void CDlgJurChild::OnThemechangedTime4(NMHDR *pNMHDR, LRESULT *pResult)
{
	CTime t;
	((CDateTimeCtrl*)GetDlgItem(IDC_TIME4))->GetTime(t);
	m_TimeSlots->st_slot[3].s_sec = t.GetHour() * 3600 + t.GetMinute() * 60 + t.GetSecond();
	*pResult = 0;
}
void CDlgJurChild::OnThemechangedTime5(NMHDR *pNMHDR, LRESULT *pResult)
{
	CTime t;
	((CDateTimeCtrl*)GetDlgItem(IDC_TIME5))->GetTime(t);
	m_TimeSlots->st_slot[4].s_sec = t.GetHour() * 3600 + t.GetMinute() * 60 + t.GetSecond();
	*pResult = 0;
}
void CDlgJurChild::OnThemechangedTime6(NMHDR *pNMHDR, LRESULT *pResult)
{
	CTime t;
	((CDateTimeCtrl*)GetDlgItem(IDC_TIME6))->GetTime(t);
	m_TimeSlots->st_slot[5].s_sec = t.GetHour() * 3600 + t.GetMinute() * 60 + t.GetSecond();
	*pResult = 0;
}
void CDlgJurChild::OnThemechangedTime7(NMHDR *pNMHDR, LRESULT *pResult)
{
	CTime t;
	((CDateTimeCtrl*)GetDlgItem(IDC_TIME7))->GetTime(t);
	m_TimeSlots->st_slot[6].s_sec = t.GetHour() * 3600 + t.GetMinute() * 60 + t.GetSecond();
	*pResult = 0;
}
void CDlgJurChild::OnThemechangedTime8(NMHDR *pNMHDR, LRESULT *pResult)
{
	CTime t;
	((CDateTimeCtrl*)GetDlgItem(IDC_TIME8))->GetTime(t);
	m_TimeSlots->st_slot[7].s_sec = t.GetHour() * 3600 + t.GetMinute() * 60 + t.GetSecond();
	*pResult = 0;
}
void CDlgJurChild::OnThemechangedTime9(NMHDR *pNMHDR, LRESULT *pResult)
{
	CTime t;
	((CDateTimeCtrl*)GetDlgItem(IDC_TIME9))->GetTime(t);
	m_TimeSlots->st_slot[8].s_sec = t.GetHour() * 3600 + t.GetMinute() * 60 + t.GetSecond();
	*pResult = 0;
}
void CDlgJurChild::OnThemechangedTime10(NMHDR *pNMHDR, LRESULT *pResult)
{
	CTime t;
	((CDateTimeCtrl*)GetDlgItem(IDC_TIME10))->GetTime(t);
	m_TimeSlots->st_slot[9].s_sec = t.GetHour() * 3600 + t.GetMinute() * 60 + t.GetSecond();
	*pResult = 0;
}

void CDlgJurChild::OnThemechangedTimeE1(NMHDR *pNMHDR, LRESULT *pResult)
{
	// �ù���Ҫ��ʹ�� Windows XP ����߰汾��
	// ���� _WIN32_WINNT ���� >= 0x0501��
	// TODO:  �ڴ���ӿؼ�֪ͨ����������
	CTime t;
	((CDateTimeCtrl*)GetDlgItem(IDC_TIME_E1))->GetTime(t);
	m_TimeSlots->st_slot[0].e_sec = t.GetHour() * 3600 + t.GetMinute() * 60 + t.GetSecond();
	*pResult = 0;
}
void CDlgJurChild::OnThemechangedTimeE2(NMHDR *pNMHDR, LRESULT *pResult)
{
	CTime t;
	((CDateTimeCtrl*)GetDlgItem(IDC_TIME_E2))->GetTime(t);
	m_TimeSlots->st_slot[1].e_sec = t.GetHour() * 3600 + t.GetMinute() * 60 + t.GetSecond();
	*pResult = 0;
}
void CDlgJurChild::OnThemechangedTimeE3(NMHDR *pNMHDR, LRESULT *pResult)
{
	CTime t;
	((CDateTimeCtrl*)GetDlgItem(IDC_TIME_E3))->GetTime(t);
	m_TimeSlots->st_slot[2].e_sec = t.GetHour() * 3600 + t.GetMinute() * 60 + t.GetSecond();
	*pResult = 0;
}
void CDlgJurChild::OnThemechangedTimeE4(NMHDR *pNMHDR, LRESULT *pResult)
{
	CTime t;
	((CDateTimeCtrl*)GetDlgItem(IDC_TIME_E4))->GetTime(t);
	m_TimeSlots->st_slot[3].e_sec = t.GetHour() * 3600 + t.GetMinute() * 60 + t.GetSecond();
	*pResult = 0;
}
void CDlgJurChild::OnThemechangedTimeE5(NMHDR *pNMHDR, LRESULT *pResult)
{
	CTime t;
	((CDateTimeCtrl*)GetDlgItem(IDC_TIME_E5))->GetTime(t);
	m_TimeSlots->st_slot[4].e_sec = t.GetHour() * 3600 + t.GetMinute() * 60 + t.GetSecond();
	*pResult = 0;
}
void CDlgJurChild::OnThemechangedTimeE6(NMHDR *pNMHDR, LRESULT *pResult)
{
	CTime t;
	((CDateTimeCtrl*)GetDlgItem(IDC_TIME_E6))->GetTime(t);
	m_TimeSlots->st_slot[5].e_sec = t.GetHour() * 3600 + t.GetMinute() * 60 + t.GetSecond();
	*pResult = 0;
}
void CDlgJurChild::OnThemechangedTimeE7(NMHDR *pNMHDR, LRESULT *pResult)
{
	CTime t;
	((CDateTimeCtrl*)GetDlgItem(IDC_TIME_E7))->GetTime(t);
	m_TimeSlots->st_slot[6].e_sec = t.GetHour() * 3600 + t.GetMinute() * 60 + t.GetSecond();
	*pResult = 0;
}
void CDlgJurChild::OnThemechangedTimeE8(NMHDR *pNMHDR, LRESULT *pResult)
{
	CTime t;
	((CDateTimeCtrl*)GetDlgItem(IDC_TIME_E8))->GetTime(t);
	m_TimeSlots->st_slot[7].e_sec = t.GetHour() * 3600 + t.GetMinute() * 60 + t.GetSecond();
	*pResult = 0;
}
void CDlgJurChild::OnThemechangedTimeE9(NMHDR *pNMHDR, LRESULT *pResult)
{
	CTime t;
	((CDateTimeCtrl*)GetDlgItem(IDC_TIME_E9))->GetTime(t);
	m_TimeSlots->st_slot[8].e_sec = t.GetHour() * 3600 + t.GetMinute() * 60 + t.GetSecond();
	*pResult = 0;
}
void CDlgJurChild::OnThemechangedTimeE10(NMHDR *pNMHDR, LRESULT *pResult)
{
	CTime t;
	((CDateTimeCtrl*)GetDlgItem(IDC_TIME_E10))->GetTime(t);
	m_TimeSlots->st_slot[9].e_sec = t.GetHour() * 3600 + t.GetMinute() * 60 + t.GetSecond();
	*pResult = 0;
}


BOOL CDlgJurChild::PreTranslateMessage(MSG* pMsg)
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
	return CDialog::PreTranslateMessage(pMsg);
}

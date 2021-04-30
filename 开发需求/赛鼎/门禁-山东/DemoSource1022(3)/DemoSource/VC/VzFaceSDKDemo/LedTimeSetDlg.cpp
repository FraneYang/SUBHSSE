// LedTimeSetDlg.cpp : implementation file
//

#include "stdafx.h"
#include "VzFaceSDKDemo.h"
#include "LedTimeSetDlg.h"
#include "afxdialogex.h"


// CLedTimeSetDlg dialog

IMPLEMENT_DYNAMIC(CLedTimeSetDlg, CDialogEx)

CLedTimeSetDlg::CLedTimeSetDlg(VzLPRClientHandle cam, CWnd* pParent /*=NULL*/)
	: CDialogEx(CLedTimeSetDlg::IDD, pParent)
{
	m_cam = cam;
}

CLedTimeSetDlg::~CLedTimeSetDlg()
{
}

void CLedTimeSetDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialogEx::DoDataExchange(pDX);
	DDX_Control(pDX, IDC_TIMEBEGIN, m_TimeCtrlBegin1);
	DDX_Control(pDX, IDC_TIMEBEGIN2, m_TimeCtrlBegin2);
	DDX_Control(pDX, IDC_TIMEBEGIN3, m_TimeCtrlBegin3);
	DDX_Control(pDX, IDC_TIMEBEGIN4, m_TimeCtrlEnd1);
	DDX_Control(pDX, IDC_TIMEBEGIN5, m_TimeCtrlEnd2);
	DDX_Control(pDX, IDC_TIMEBEGIN6, m_TimeCtrlEnd3);
	DDX_Control(pDX, IDC_SLIDER1, m_Sliderled1);
	DDX_Control(pDX, IDC_SLIDER3, m_Sliderled2);
	DDX_Control(pDX, IDC_SLIDER4, m_Sliderled3);
	DDX_Control(pDX, IDC_COMBO1, m_Combox);
	DDX_Control(pDX, IDC_SLIDER5, m_Sliderled);
	
}


BEGIN_MESSAGE_MAP(CLedTimeSetDlg, CDialogEx)
	ON_BN_CLICKED(IDC_BUTTON1, &CLedTimeSetDlg::OnBnClickedButton1)
	ON_WM_HSCROLL()
	ON_BN_CLICKED(IDC_BTN_READ, &CLedTimeSetDlg::OnBnClickedBtnRead)
	ON_BN_CLICKED(IDC_BTN_SET, &CLedTimeSetDlg::OnBnClickedBtnSet)
	ON_BN_CLICKED(IDC_BTN_READ2, &CLedTimeSetDlg::OnBnClickedBtnRead2)
END_MESSAGE_MAP()


// CLedTimeSetDlg message handlers


void CLedTimeSetDlg::OnBnClickedButton1()
{
	// TODO: Add your control notification handler code here
	ZBX_LedCtrlTime time;
	memset(&time, 0, sizeof(ZBX_LedCtrlTime));
	CTime cTimeBegin(0);
	CTime cTimeEnd(0);
	CString strTime;
	//时间段1
	bool bCheck = ((CButton*)GetDlgItem(IDC_CHECK1))->GetCheck();
	time.nLevel[0] = m_nLedLevel1;
	m_TimeCtrlBegin1.GetTime(cTimeBegin);
	strTime.Format("%02d:%02d:%02d", cTimeBegin.GetHour(), cTimeBegin.GetMinute(), cTimeBegin.GetSecond());
	strcpy(time.beginTime[0], strTime);
	m_TimeCtrlEnd1.GetTime(cTimeEnd);
	strTime.Format("%02d:%02d:%02d", cTimeEnd.GetHour(), cTimeEnd.GetMinute(), cTimeEnd.GetSecond());
	strcpy(time.EndTime[0], strTime);
	if (cTimeEnd <= cTimeBegin)
	{
		AfxMessageBox("第一个时间段 结束时间必须大于初始时间 请检查");
		return;
	}
	if (!bCheck)
	{
		time.nLevel[0] = 0;
	}

	//时间段2
	bCheck = ((CButton*)GetDlgItem(IDC_CHECK2))->GetCheck();
	cTimeBegin = cTimeEnd = 0;
	time.nLevel[1] = m_nLedLevel2;
	m_TimeCtrlBegin2.GetTime(cTimeBegin);
	strTime.Format("%02d:%02d:%02d", cTimeBegin.GetHour(), cTimeBegin.GetMinute(), cTimeBegin.GetSecond());
	strcpy(time.beginTime[1], strTime);
	m_TimeCtrlEnd2.GetTime(cTimeEnd);
	strTime.Format("%02d:%02d:%02d", cTimeEnd.GetHour(), cTimeEnd.GetMinute(), cTimeEnd.GetSecond());
	strcpy(time.EndTime[1], strTime);
	if (cTimeEnd <= cTimeBegin)
	{
		AfxMessageBox("第二个时间段 结束时间必须大于初始时间 请检查");
		return;
	}
	if (!bCheck)
	{
		time.nLevel[1] = 0;
	}

	//时间段3
	bCheck = ((CButton*)GetDlgItem(IDC_CHECK3))->GetCheck();
	cTimeBegin = cTimeEnd = 0;
	time.nLevel[2] = m_nLedLevel3;
	m_TimeCtrlBegin3.GetTime(cTimeBegin);
	strTime.Format("%02d:%02d:%02d", cTimeBegin.GetHour(), cTimeBegin.GetMinute(), cTimeBegin.GetSecond());
	strcpy(time.beginTime[2], strTime);
	m_TimeCtrlEnd3.GetTime(cTimeEnd);
	strTime.Format("%02d:%02d:%02d", cTimeEnd.GetHour(), cTimeEnd.GetMinute(), cTimeEnd.GetSecond());
	strcpy(time.EndTime[2], strTime);
	if (cTimeEnd <= cTimeBegin)
	{
		AfxMessageBox("第三个时间段 结束时间必须大于初始时间 请检查");
		return;
	}
	if (!bCheck)
	{
		time.nLevel[2] = 0;
	}
	int nRet = ZBX_SetLedCtrlTime(m_cam, time);
	if (nRet == 0)
	{
		AfxMessageBox("设置成功");
	}
	else
	{
		AfxMessageBox("设置失败");

	}
}


void CLedTimeSetDlg::OnHScroll(UINT nSBCode, UINT nPos, CScrollBar* pScrollBar)
{
	// TODO: Add your message handler code here and/or call default
	CSliderCtrl   *pSlidCtrl = (CSliderCtrl*)GetDlgItem(IDC_SLIDER1);
	m_nLedLevel1 = m_Sliderled1.GetPos();//取得当前位置值  
	SetDlgItemInt(IDC_STC_1, m_nLedLevel1);
	pSlidCtrl = (CSliderCtrl*)GetDlgItem(IDC_SLIDER2);
	m_nLedLevel2 = m_Sliderled2.GetPos();//取得当前位置值
	SetDlgItemInt(IDC_STC_2, m_nLedLevel2);
	pSlidCtrl = (CSliderCtrl*)GetDlgItem(IDC_SLIDER3);
	m_nLedLevel3 = m_Sliderled3.GetPos();//取得当前位置值
	SetDlgItemInt(IDC_STC_3, m_nLedLevel3);
	CDialogEx::OnHScroll(nSBCode, nPos, pScrollBar);

	pSlidCtrl = (CSliderCtrl*)GetDlgItem(IDC_SLIDER2);
	m_nLedLevel = m_Sliderled.GetPos();//取得当前位置值  
	SetDlgItemInt(IDC_EDIT1, m_nLedLevel);
}


BOOL CLedTimeSetDlg::OnInitDialog()
{
	CDialogEx::OnInitDialog();

	m_Sliderled.SetRange(0, 100);//设置滑动范围
	m_Sliderled.SetTicFreq(5);//每10个单位画一刻度

	m_Combox.InsertString(0, "常开");
	m_Combox.InsertString(1, "自动");
	m_Combox.InsertString(2, "常关");
	m_Combox.SetCurSel(0);
	// TODO:  Add extra initialization here
	Getinfo(false);
	
	return TRUE;  // return TRUE unless you set the focus to a control
	// EXCEPTION: OCX Property Pages should return FALSE
}


void CLedTimeSetDlg::OnBnClickedBtnRead()
{
	// TODO:  在此添加控件通知处理程序代码
	Getinfo(true);
}
void CLedTimeSetDlg::Getinfo(bool bshow){
	char Level[10] = {0};
	int retModel = ZBX_GetLedMode(m_cam, Level);
	//GetDlgItem(IDC_EDIT2)->SetWindowTextA(Level);
	int nData = atoi(Level);
	m_Combox.SetCurSel(nData - 1);
	if (nData == 2)
	{
		GetTimeCtrl(false);
	}
	memset(Level, 0, 10);
	int ret = ZBX_GetLedLevel(m_cam, Level);
	nData = atoi(Level);
	m_Sliderled.SetPos(nData);
	SetDlgItemInt(IDC_EDIT1, nData);
	if (retModel == 0 && ret==0)
	{
		if (bshow)
		{
			AfxMessageBox("获取成功");
		}
		
	}
	else{

		AfxMessageBox("获取失败");
	}
	
}

void CLedTimeSetDlg::OnBnClickedBtnSet()
{
	// TODO:  在此添加控件通知处理程序代码
	int nCurSel = m_Combox.GetCurSel();
	int nRetModel = ZBX_SetLedMode(m_cam, (char)(nCurSel + 1));
	int nLevel = GetDlgItemInt(IDC_EDIT1);
	int nRet = ZBX_SetLedLevel(m_cam, nLevel);
	if (!nRet&&!nRetModel)
	{
		
		AfxMessageBox("设置成功");
	}
	else
	{
		AfxMessageBox("设置失败");
	}
}


void CLedTimeSetDlg::OnBnClickedBtnRead2()
{
	// TODO:  在此添加控件通知处理程序代码
	GetTimeCtrl(true);
}

void CLedTimeSetDlg::GetTimeCtrl(bool bShow){ 
	ZBX_LedCtrlTime time;
	memset(&time, 0, sizeof(ZBX_LedCtrlTime));
	int nRet = ZBX_GetLedCtrlTime(m_cam, &time);
	if (nRet != 0)
	{
		if (bShow)
		{
			AfxMessageBox("获取失败");
		}
		return;
	}
	int Hour = 0, nMin = 0, nSecd = 0;
	sscanf(time.beginTime[0], "%02d:%02d:%02d", &Hour, &nMin, &nSecd);
	if (Hour >= 24)
	{
		Hour = 0;
	}
	if (Hour < 0 || nMin < 0 || nSecd < 0)
	{
		return;
	}
	CTime ctime1(2019, 1, 1, Hour, nMin, nSecd);
	m_TimeCtrlBegin1.SetTime(&ctime1);
	Hour = nMin = nSecd = 0;
	sscanf(time.EndTime[0], "%02d:%02d:%02d", &Hour, &nMin, &nSecd);
	if (Hour >= 24)
	{
		Hour = 0;
	}
	CTime ctime4(2019, 1, 1, Hour, nMin, nSecd);
	m_TimeCtrlEnd1.SetTime(&ctime4);
	int nLevel = 0;
	nLevel = time.nLevel[0];
	if (nLevel)
	{
		((CButton*)GetDlgItem(IDC_CHECK1))->SetCheck(TRUE);
	}

	m_Sliderled1.SetPos(nLevel);
	SetDlgItemInt(IDC_STC_1, nLevel);
	Hour = nMin = nSecd = 0;
	sscanf(time.beginTime[1], "%02d:%02d:%02d", &Hour, &nMin, &nSecd);
	if (Hour >= 24)
	{
		Hour = 0;
	}
	CTime ctime2(2019, 1, 1, Hour, nMin, nSecd);
	m_TimeCtrlBegin2.SetTime(&ctime2);
	Hour = nMin = nSecd = 0;
	sscanf(time.EndTime[1], "%02d:%02d:%02d", &Hour, &nMin, &nSecd);
	if (Hour >= 24)
	{
		Hour = 0;
	}
	CTime ctime5(2019, 1, 1, Hour, nMin, nSecd);
	m_TimeCtrlEnd2.SetTime(&ctime5);	
	nLevel = time.nLevel[1];
	if (nLevel)
	{
		((CButton*)GetDlgItem(IDC_CHECK2))->SetCheck(TRUE);
	}
	m_Sliderled2.SetPos(nLevel);
	SetDlgItemInt(IDC_STC_2, nLevel);
	Hour = nMin = nSecd = 0;
	sscanf(time.beginTime[2], "%02d:%02d:%02d", &Hour, &nMin, &nSecd);
	if (Hour >= 24)
	{
		Hour = 0;
	}
	CTime ctime3(2019, 1, 1, Hour, nMin, nSecd);
	m_TimeCtrlBegin3.SetTime(&ctime3);
	nLevel = time.nLevel[2];
	m_Sliderled3.SetPos(nLevel);
	SetDlgItemInt(IDC_STC_3, nLevel);
	Hour = nMin = nSecd = 0;
	sscanf(time.EndTime[2], "%02d:%02d:%02d", &Hour, &nMin, &nSecd);
	if (Hour >= 24)
	{
		Hour = 0;
	}
	CTime ctime6(2019, 1, 1, Hour, nMin, nSecd);
	m_TimeCtrlEnd3.SetTime(&ctime6);
	if (nLevel)
	{
		((CButton*)GetDlgItem(IDC_CHECK3))->SetCheck(TRUE);
	}
	if (bShow)
	{
		AfxMessageBox("获取成功");
	}
}
BOOL CLedTimeSetDlg::PreTranslateMessage(MSG* pMsg)
{
	// TODO:  在此添加专用代码和/或调用基类
	int nId = 0;
	CWnd * pWnd = NULL;
	if (pMsg->message == WM_KEYDOWN)	{
		switch (pMsg->wParam)		{
		case VK_ESCAPE: //Esc按键事件				
			return true;
		case VK_RETURN: //Enter按键事件				
			pWnd = GetFocus();
			nId = pWnd->GetDlgCtrlID();
			if (nId == IDC_EDIT1)
			{
				int nPos = GetDlgItemInt(IDC_EDIT1);
				
				m_Sliderled.SetPos(nPos);
			}
			return true;
		default:
			;
		}
	}
	return CDialogEx::PreTranslateMessage(pMsg);
}

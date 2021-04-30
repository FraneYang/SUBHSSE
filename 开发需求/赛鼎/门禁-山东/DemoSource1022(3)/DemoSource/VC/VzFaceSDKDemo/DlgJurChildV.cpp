// DlgJurChildV.cpp : 实现文件
//

#include "stdafx.h"
#include "VzFaceSDKDemo.h"
#include "DlgJurChildV.h"
#include "afxdialogex.h"


// CDlgJurChildV 对话框

IMPLEMENT_DYNAMIC(CDlgJurChildV, CDialogEx)

CDlgJurChildV::CDlgJurChildV(CWnd* pParent /*=NULL*/)
	: CDialogEx(CDlgJurChildV::IDD, pParent)
{

}

CDlgJurChildV::~CDlgJurChildV()
{
}

void CDlgJurChildV::DoDataExchange(CDataExchange* pDX)
{
	CDialogEx::DoDataExchange(pDX);
}


BEGIN_MESSAGE_MAP(CDlgJurChildV, CDialogEx)
	ON_WM_VSCROLL()
	ON_BN_CLICKED(IDC_BTN2, &CDlgJurChildV::OnBnClickedBtn2)
	ON_BN_CLICKED(IDC_BTN1, &CDlgJurChildV::OnBnClickedBtn1)
	ON_BN_CLICKED(IDC_BTN3, &CDlgJurChildV::OnBnClickedBtn3)
	ON_BN_CLICKED(IDC_BTN4, &CDlgJurChildV::OnBnClickedBtn4)
	ON_BN_CLICKED(IDC_BTN5, &CDlgJurChildV::OnBnClickedBtn5)
	ON_BN_CLICKED(IDC_BTN6, &CDlgJurChildV::OnBnClickedBtn6)
	ON_BN_CLICKED(IDC_BTN7, &CDlgJurChildV::OnBnClickedBtn7)
	ON_BN_CLICKED(IDC_BTN8, &CDlgJurChildV::OnBnClickedBtn8)
	ON_BN_CLICKED(IDC_BTN9, &CDlgJurChildV::OnBnClickedBtn9)
	ON_BN_CLICKED(IDC_BTN10, &CDlgJurChildV::OnBnClickedBtn10)
	ON_BN_CLICKED(IDC_BTN11, &CDlgJurChildV::OnBnClickedBtn11)
	ON_BN_CLICKED(IDC_BTN12, &CDlgJurChildV::OnBnClickedBtn12)
	ON_BN_CLICKED(IDC_BTN13, &CDlgJurChildV::OnBnClickedBtn13)
	ON_BN_CLICKED(IDC_BTN14, &CDlgJurChildV::OnBnClickedBtn14)
	ON_BN_CLICKED(IDC_BTN15, &CDlgJurChildV::OnBnClickedBtn15)
	ON_BN_CLICKED(IDC_BTN16, &CDlgJurChildV::OnBnClickedBtn16)
	ON_BN_CLICKED(IDC_BTN17, &CDlgJurChildV::OnBnClickedBtn17)
	ON_BN_CLICKED(IDC_BTN18, &CDlgJurChildV::OnBnClickedBtn18)
	ON_BN_CLICKED(IDC_BTN19, &CDlgJurChildV::OnBnClickedBtn19)
	ON_BN_CLICKED(IDC_BTN20, &CDlgJurChildV::OnBnClickedBtn20)
	ON_BN_CLICKED(IDC_BTN21, &CDlgJurChildV::OnBnClickedBtn21)
	ON_BN_CLICKED(IDC_BTN22, &CDlgJurChildV::OnBnClickedBtn22)
	ON_BN_CLICKED(IDC_BTN23, &CDlgJurChildV::OnBnClickedBtn23)
	ON_BN_CLICKED(IDC_BTN24, &CDlgJurChildV::OnBnClickedBtn24)
	ON_BN_CLICKED(IDC_BTN25, &CDlgJurChildV::OnBnClickedBtn25)
	ON_BN_CLICKED(IDC_BTN26, &CDlgJurChildV::OnBnClickedBtn26)
	ON_BN_CLICKED(IDC_BTN27, &CDlgJurChildV::OnBnClickedBtn27)
	ON_BN_CLICKED(IDC_BTN28, &CDlgJurChildV::OnBnClickedBtn28)
	ON_BN_CLICKED(IDC_BTN29, &CDlgJurChildV::OnBnClickedBtn29)
	ON_BN_CLICKED(IDC_BTN30, &CDlgJurChildV::OnBnClickedBtn30)

	ON_NOTIFY(DTN_DATETIMECHANGE, IDC_TIME1, &CDlgJurChildV::OnDtnDatetimechangeTime1)
	ON_NOTIFY(DTN_DATETIMECHANGE, IDC_TIME2, &CDlgJurChildV::OnDtnDatetimechangeTime2)
	ON_NOTIFY(DTN_DATETIMECHANGE, IDC_TIME3, &CDlgJurChildV::OnDtnDatetimechangeTime3)
	ON_NOTIFY(DTN_DATETIMECHANGE, IDC_TIME4, &CDlgJurChildV::OnDtnDatetimechangeTime4)
	ON_NOTIFY(DTN_DATETIMECHANGE, IDC_TIME5, &CDlgJurChildV::OnDtnDatetimechangeTime5)
	ON_NOTIFY(DTN_DATETIMECHANGE, IDC_TIME6, &CDlgJurChildV::OnDtnDatetimechangeTime6)
	ON_NOTIFY(DTN_DATETIMECHANGE, IDC_TIME7, &CDlgJurChildV::OnDtnDatetimechangeTime7)
	ON_NOTIFY(DTN_DATETIMECHANGE, IDC_TIME8, &CDlgJurChildV::OnDtnDatetimechangeTime8)
	ON_NOTIFY(DTN_DATETIMECHANGE, IDC_TIME9, &CDlgJurChildV::OnDtnDatetimechangeTime9)
	ON_NOTIFY(DTN_DATETIMECHANGE, IDC_TIME10, &CDlgJurChildV::OnDtnDatetimechangeTime10)
	ON_NOTIFY(DTN_DATETIMECHANGE, IDC_TIME11, &CDlgJurChildV::OnDtnDatetimechangeTime11)
	ON_NOTIFY(DTN_DATETIMECHANGE, IDC_TIME12, &CDlgJurChildV::OnDtnDatetimechangeTime12)
	ON_NOTIFY(DTN_DATETIMECHANGE, IDC_TIME13, &CDlgJurChildV::OnDtnDatetimechangeTime13)
	ON_NOTIFY(DTN_DATETIMECHANGE, IDC_TIME14, &CDlgJurChildV::OnDtnDatetimechangeTime14)
	ON_NOTIFY(DTN_DATETIMECHANGE, IDC_TIME15, &CDlgJurChildV::OnDtnDatetimechangeTime15)
	ON_NOTIFY(DTN_DATETIMECHANGE, IDC_TIME16, &CDlgJurChildV::OnDtnDatetimechangeTime16)
	ON_NOTIFY(DTN_DATETIMECHANGE, IDC_TIME17, &CDlgJurChildV::OnDtnDatetimechangeTime17)
	ON_NOTIFY(DTN_DATETIMECHANGE, IDC_TIME18, &CDlgJurChildV::OnDtnDatetimechangeTime18)
	ON_NOTIFY(DTN_DATETIMECHANGE, IDC_TIME19, &CDlgJurChildV::OnDtnDatetimechangeTime19)
	ON_NOTIFY(DTN_DATETIMECHANGE, IDC_TIME20, &CDlgJurChildV::OnDtnDatetimechangeTime20)
	ON_NOTIFY(DTN_DATETIMECHANGE, IDC_TIME21, &CDlgJurChildV::OnDtnDatetimechangeTime21)
	ON_NOTIFY(DTN_DATETIMECHANGE, IDC_TIME22, &CDlgJurChildV::OnDtnDatetimechangeTime22)
	ON_NOTIFY(DTN_DATETIMECHANGE, IDC_TIME23, &CDlgJurChildV::OnDtnDatetimechangeTime23)
	ON_NOTIFY(DTN_DATETIMECHANGE, IDC_TIME24, &CDlgJurChildV::OnDtnDatetimechangeTime24)
	ON_NOTIFY(DTN_DATETIMECHANGE, IDC_TIME25, &CDlgJurChildV::OnDtnDatetimechangeTime25)
	ON_NOTIFY(DTN_DATETIMECHANGE, IDC_TIME26, &CDlgJurChildV::OnDtnDatetimechangeTime26)
	ON_NOTIFY(DTN_DATETIMECHANGE, IDC_TIME27, &CDlgJurChildV::OnDtnDatetimechangeTime27)
	ON_NOTIFY(DTN_DATETIMECHANGE, IDC_TIME28, &CDlgJurChildV::OnDtnDatetimechangeTime28)
	ON_NOTIFY(DTN_DATETIMECHANGE, IDC_TIME29, &CDlgJurChildV::OnDtnDatetimechangeTime29)
	ON_NOTIFY(DTN_DATETIMECHANGE, IDC_TIME30, &CDlgJurChildV::OnDtnDatetimechangeTime30)


	ON_NOTIFY(DTN_DATETIMECHANGE, IDC_TIME_E1, &CDlgJurChildV::OnDtnDatetimechangeTimeE1)
	ON_NOTIFY(DTN_DATETIMECHANGE, IDC_TIME_E2, &CDlgJurChildV::OnDtnDatetimechangeTimeE2)
	ON_NOTIFY(DTN_DATETIMECHANGE, IDC_TIME_E3, &CDlgJurChildV::OnDtnDatetimechangeTimeE3)
	ON_NOTIFY(DTN_DATETIMECHANGE, IDC_TIME_E4, &CDlgJurChildV::OnDtnDatetimechangeTimeE4)
	ON_NOTIFY(DTN_DATETIMECHANGE, IDC_TIME_E5, &CDlgJurChildV::OnDtnDatetimechangeTimeE5)
	ON_NOTIFY(DTN_DATETIMECHANGE, IDC_TIME_E6, &CDlgJurChildV::OnDtnDatetimechangeTimeE6)
	ON_NOTIFY(DTN_DATETIMECHANGE, IDC_TIME_E7, &CDlgJurChildV::OnDtnDatetimechangeTimeE7)
	ON_NOTIFY(DTN_DATETIMECHANGE, IDC_TIME_E8, &CDlgJurChildV::OnDtnDatetimechangeTimeE8)
	ON_NOTIFY(DTN_DATETIMECHANGE, IDC_TIME_E9, &CDlgJurChildV::OnDtnDatetimechangeTimeE9)
	ON_NOTIFY(DTN_DATETIMECHANGE, IDC_TIME_E10, &CDlgJurChildV::OnDtnDatetimechangeTimeE10)
	ON_NOTIFY(DTN_DATETIMECHANGE, IDC_TIME_E11, &CDlgJurChildV::OnDtnDatetimechangeTimeE11)
	ON_NOTIFY(DTN_DATETIMECHANGE, IDC_TIME_E12, &CDlgJurChildV::OnDtnDatetimechangeTimeE12)
	ON_NOTIFY(DTN_DATETIMECHANGE, IDC_TIME_E13, &CDlgJurChildV::OnDtnDatetimechangeTimeE13)
	ON_NOTIFY(DTN_DATETIMECHANGE, IDC_TIME_E14, &CDlgJurChildV::OnDtnDatetimechangeTimeE14)
	ON_NOTIFY(DTN_DATETIMECHANGE, IDC_TIME_E15, &CDlgJurChildV::OnDtnDatetimechangeTimeE15)
	ON_NOTIFY(DTN_DATETIMECHANGE, IDC_TIME_E16, &CDlgJurChildV::OnDtnDatetimechangeTimeE16)
	ON_NOTIFY(DTN_DATETIMECHANGE, IDC_TIME_E17, &CDlgJurChildV::OnDtnDatetimechangeTimeE17)
	ON_NOTIFY(DTN_DATETIMECHANGE, IDC_TIME_E18, &CDlgJurChildV::OnDtnDatetimechangeTimeE18)
	ON_NOTIFY(DTN_DATETIMECHANGE, IDC_TIME_E19, &CDlgJurChildV::OnDtnDatetimechangeTimeE19)
	ON_NOTIFY(DTN_DATETIMECHANGE, IDC_TIME_E20, &CDlgJurChildV::OnDtnDatetimechangeTimeE20)
	ON_NOTIFY(DTN_DATETIMECHANGE, IDC_TIME_E21, &CDlgJurChildV::OnDtnDatetimechangeTimeE21)
	ON_NOTIFY(DTN_DATETIMECHANGE, IDC_TIME_E22, &CDlgJurChildV::OnDtnDatetimechangeTimeE22)
	ON_NOTIFY(DTN_DATETIMECHANGE, IDC_TIME_E23, &CDlgJurChildV::OnDtnDatetimechangeTimeE23)
	ON_NOTIFY(DTN_DATETIMECHANGE, IDC_TIME_E24, &CDlgJurChildV::OnDtnDatetimechangeTimeE24)
	ON_NOTIFY(DTN_DATETIMECHANGE, IDC_TIME_E25, &CDlgJurChildV::OnDtnDatetimechangeTimeE25)
	ON_NOTIFY(DTN_DATETIMECHANGE, IDC_TIME_E26, &CDlgJurChildV::OnDtnDatetimechangeTimeE26)
	ON_NOTIFY(DTN_DATETIMECHANGE, IDC_TIME_E27, &CDlgJurChildV::OnDtnDatetimechangeTimeE27)
	ON_NOTIFY(DTN_DATETIMECHANGE, IDC_TIME_E28, &CDlgJurChildV::OnDtnDatetimechangeTimeE28)
	ON_NOTIFY(DTN_DATETIMECHANGE, IDC_TIME_E29, &CDlgJurChildV::OnDtnDatetimechangeTimeE29)
	ON_NOTIFY(DTN_DATETIMECHANGE, IDC_TIME_E30, &CDlgJurChildV::OnDtnDatetimechangeTimeE30)

END_MESSAGE_MAP()


// CDlgJurChildV 消息处理程序


BOOL CDlgJurChildV::OnInitDialog()
{
	CDialogEx::OnInitDialog();

	// TODO:  在此添加额外的初始化

	return TRUE;  // return TRUE unless you set the focus to a control
	// 异常:  OCX 属性页应返回 FALSE
}

void CDlgJurChildV::initVol(){
	SCROLLINFO vinfo;

	vinfo.cbSize = sizeof(vinfo);

	vinfo.fMask = SIF_ALL;

	vinfo.nPage = 50;//滚动块自身的长短，通常有如下关系：其长度/滚动条长度（含两个箭头）=nPage/(nMax+2)，

	//另外nPage取值-1时，滚动条会不见了。

	vinfo.nMax = 500;//滚动条所能滚动的最大值

	vinfo.nMin = 5;//滚动条所能滚动的最小值

	vinfo.nTrackPos = 0;

	SetScrollInfo(SB_VERT, &vinfo);//即使上述步骤一不做，使用此条语句也可以显示滚动条
}
void CDlgJurChildV::OnVScroll(UINT nSBCode, UINT nPos, CScrollBar* pScrollBar)
{
	// TODO:  在此添加消息处理程序代码和/或调用默认值
	SCROLLINFO scrollinfo;

	GetScrollInfo(SB_VERT, &scrollinfo, SIF_ALL);
	switch (nSBCode)

	{

	case SB_BOTTOM: //滑块滚动到最底部

		ScrollWindow(0, (scrollinfo.nPos - scrollinfo.nMax) * 10); //滚动屏幕

		scrollinfo.nPos = scrollinfo.nMax; //设定滑块新位置

		SetScrollInfo(SB_VERT, &scrollinfo, SIF_ALL); //更新滑块位置

		break;

	case SB_TOP: //滑块滚动到最顶部

		ScrollWindow(0, (scrollinfo.nPos - scrollinfo.nMin) * 10);

		scrollinfo.nPos = scrollinfo.nMin;

		SetScrollInfo(SB_VERT, &scrollinfo, SIF_ALL);

		break;

	case SB_LINEUP: //单击上箭头

		scrollinfo.nPos -= 1;

		if (scrollinfo.nPos < scrollinfo.nMin)

		{

			scrollinfo.nPos = scrollinfo.nMin;

			break;

		}

		SetScrollInfo(SB_VERT, &scrollinfo, SIF_ALL);

		ScrollWindow(0, 10);

		break;

	case SB_LINEDOWN: //单击下箭头

		scrollinfo.nPos += 1;

		if (scrollinfo.nPos > scrollinfo.nMax)

		{

			scrollinfo.nPos = scrollinfo.nMax;

			break;

		}

		SetScrollInfo(SB_VERT, &scrollinfo, SIF_ALL);

		ScrollWindow(0, -10);

		break;

	case SB_PAGEUP: //单击滑块上方空白区域

		scrollinfo.nPos -= 5;

		if (scrollinfo.nPos < scrollinfo.nMin)

		{

			scrollinfo.nPos = scrollinfo.nMin;

			break;

		}

		SetScrollInfo(SB_VERT, &scrollinfo, SIF_ALL);

		ScrollWindow(0, 10 * 5);

		break;

	case SB_PAGEDOWN: //单击滑块下方空白区域

		scrollinfo.nPos += 5;

		if (scrollinfo.nPos > scrollinfo.nMax)

		{

			scrollinfo.nPos = scrollinfo.nMax;

			break;

		}

		SetScrollInfo(SB_VERT, &scrollinfo, SIF_ALL);

		ScrollWindow(0, -10 * 5);

		break;

	case SB_ENDSCROLL: //鼠标离开滑块，结束滑块拖动

		// MessageBox("SB_ENDSCROLL");

		break;

	case SB_THUMBPOSITION:

		// ScrollWindow(0,(scrollinfo.nPos-nPos)*10);

		// scrollinfo.nPos = nPos;

		// SetScrollInfo(SB_VERT,&scrollinfo,SIF_ALL);

		break;

	case SB_THUMBTRACK: //拖动滑块

		ScrollWindow(0, (scrollinfo.nPos - nPos) * 10);
		scrollinfo.nPos = nPos;
		SetScrollInfo(SB_VERT, &scrollinfo, SIF_ALL);
		break;

	}
	CDialogEx::OnVScroll(nSBCode, nPos, pScrollBar);
}


void CDlgJurChildV::AddItem()
{
	m_nCurIndex++;
	ShowUI(m_nCurIndex, TRUE, 1);
}

void CDlgJurChildV::SetUIInit(){
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


void CDlgJurChildV::ShowUI(int nID, bool bShow, int nInit){
	CTime T(2019, 10, 10, 0, 0, 0);
	CTime T2(2019, 10, 10, 23, 59, 59);
	m_TimeSlots->dt_slot[nID-1].s_day = T.GetYear() * 10000 + T.GetMonth() * 100 + T.GetDay();
	m_TimeSlots->dt_slot[nID-1].e_day = T.GetYear() * 10000 + T.GetMonth() * 100 + T.GetDay();
	switch (nID)
	{
	case 1:
		GetDlgItem(IDC_TIME1)->ShowWindow(bShow);
		GetDlgItem(IDC_STATIC1)->ShowWindow(bShow);
		GetDlgItem(IDC_TIME_E1)->ShowWindow(bShow);
		GetDlgItem(IDC_BTN1)->ShowWindow(bShow);
		if (nInit == 1)
		{
			((CDateTimeCtrl*)(GetDlgItem(IDC_TIME1)))->SetTime(&T);
			((CDateTimeCtrl*)(GetDlgItem(IDC_TIME_E1)))->SetTime(&T2);
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
			((CDateTimeCtrl*)(GetDlgItem(IDC_TIME_E2)))->SetTime(&T2);
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
			((CDateTimeCtrl*)(GetDlgItem(IDC_TIME_E3)))->SetTime(&T2);
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
			((CDateTimeCtrl*)(GetDlgItem(IDC_TIME_E4)))->SetTime(&T2);
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
			((CDateTimeCtrl*)(GetDlgItem(IDC_TIME_E5)))->SetTime(&T2);
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
			((CDateTimeCtrl*)(GetDlgItem(IDC_TIME_E6)))->SetTime(&T2);
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
			((CDateTimeCtrl*)(GetDlgItem(IDC_TIME_E7)))->SetTime(&T2);
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
			((CDateTimeCtrl*)(GetDlgItem(IDC_TIME_E8)))->SetTime(&T2);
		}
		break;
	case 9:
		GetDlgItem(IDC_TIME9)->ShowWindow(bShow);
		GetDlgItem(IDC_STATIC9)->ShowWindow(bShow);
		GetDlgItem(IDC_TIME_E9)->ShowWindow(bShow);
		GetDlgItem(IDC_BTN9)->ShowWindow(bShow);
		if (nInit == 1)
		{
			((CDateTimeCtrl*)(GetDlgItem(IDC_TIME9)))->SetTime(&T);;
			((CDateTimeCtrl*)(GetDlgItem(IDC_TIME_E9)))->SetTime(&T2);;
		}
		break;
	case 10:
		GetDlgItem(IDC_TIME10)->ShowWindow(bShow);
		GetDlgItem(IDC_STATIC10)->ShowWindow(bShow);
		GetDlgItem(IDC_TIME_E10)->ShowWindow(bShow);
		GetDlgItem(IDC_BTN10)->ShowWindow(bShow);
		if (nInit == 1)
		{
			((CDateTimeCtrl*)(GetDlgItem(IDC_TIME10)))->SetTime(&T);;
			((CDateTimeCtrl*)(GetDlgItem(IDC_TIME_E10)))->SetTime(&T2);;
		}
		break;
	case 11:
		GetDlgItem(IDC_TIME11)->ShowWindow(bShow);
		GetDlgItem(IDC_STATIC11)->ShowWindow(bShow);
		GetDlgItem(IDC_TIME_E11)->ShowWindow(bShow);
		GetDlgItem(IDC_BTN11)->ShowWindow(bShow);
		if (nInit == 1)
		{
			((CDateTimeCtrl*)(GetDlgItem(IDC_TIME11)))->SetTime(&T);;
			((CDateTimeCtrl*)(GetDlgItem(IDC_TIME_E11)))->SetTime(&T2);;
		}
		break;
	case 12:
		GetDlgItem(IDC_TIME12)->ShowWindow(bShow);
		GetDlgItem(IDC_STATIC12)->ShowWindow(bShow);
		GetDlgItem(IDC_TIME_E12)->ShowWindow(bShow);
		GetDlgItem(IDC_BTN12)->ShowWindow(bShow);
		if (nInit == 1)
		{
			((CDateTimeCtrl*)(GetDlgItem(IDC_TIME12)))->SetTime(&T);;
			((CDateTimeCtrl*)(GetDlgItem(IDC_TIME_E12)))->SetTime(&T2);;
		}
		break;
	case 13:
		GetDlgItem(IDC_TIME13)->ShowWindow(bShow);
		GetDlgItem(IDC_STATIC13)->ShowWindow(bShow);
		GetDlgItem(IDC_TIME_E13)->ShowWindow(bShow);
		GetDlgItem(IDC_BTN13)->ShowWindow(bShow);
		if (nInit == 1)
		{
			((CDateTimeCtrl*)(GetDlgItem(IDC_TIME13)))->SetTime(&T);;
			((CDateTimeCtrl*)(GetDlgItem(IDC_TIME_E13)))->SetTime(&T2);;
		}
		break;
	case 14:
		GetDlgItem(IDC_TIME14)->ShowWindow(bShow);
		GetDlgItem(IDC_STATIC14)->ShowWindow(bShow);
		GetDlgItem(IDC_TIME_E14)->ShowWindow(bShow);
		GetDlgItem(IDC_BTN14)->ShowWindow(bShow);
		if (nInit == 1)
		{
			((CDateTimeCtrl*)(GetDlgItem(IDC_TIME14)))->SetTime(&T);;
			((CDateTimeCtrl*)(GetDlgItem(IDC_TIME_E14)))->SetTime(&T2);;
		}
		break;
	case 15:
		GetDlgItem(IDC_TIME15)->ShowWindow(bShow);
		GetDlgItem(IDC_STATIC15)->ShowWindow(bShow);
		GetDlgItem(IDC_TIME_E15)->ShowWindow(bShow);
		GetDlgItem(IDC_BTN15)->ShowWindow(bShow);
		if (nInit == 1)
		{
			((CDateTimeCtrl*)(GetDlgItem(IDC_TIME15)))->SetTime(&T);;
			((CDateTimeCtrl*)(GetDlgItem(IDC_TIME_E15)))->SetTime(&T2);;
		}
		break;
	case 16:
		GetDlgItem(IDC_TIME16)->ShowWindow(bShow);
		GetDlgItem(IDC_STATIC16)->ShowWindow(bShow);
		GetDlgItem(IDC_TIME_E16)->ShowWindow(bShow);
		GetDlgItem(IDC_BTN16)->ShowWindow(bShow);
		if (nInit == 1)
		{
			((CDateTimeCtrl*)(GetDlgItem(IDC_TIME16)))->SetTime(&T);;
			((CDateTimeCtrl*)(GetDlgItem(IDC_TIME_E16)))->SetTime(&T2);;
		}
		break;
	case 17:
		GetDlgItem(IDC_TIME17)->ShowWindow(bShow);
		GetDlgItem(IDC_STATIC17)->ShowWindow(bShow);
		GetDlgItem(IDC_TIME_E17)->ShowWindow(bShow);
		GetDlgItem(IDC_BTN17)->ShowWindow(bShow);
		if (nInit == 1)
		{
			((CDateTimeCtrl*)(GetDlgItem(IDC_TIME17)))->SetTime(&T);;
			((CDateTimeCtrl*)(GetDlgItem(IDC_TIME_E17)))->SetTime(&T2);;
		}
		break;
	case 18:
		GetDlgItem(IDC_TIME18)->ShowWindow(bShow);
		GetDlgItem(IDC_STATIC18)->ShowWindow(bShow);
		GetDlgItem(IDC_TIME_E18)->ShowWindow(bShow);
		GetDlgItem(IDC_BTN18)->ShowWindow(bShow);
		if (nInit == 1)
		{
			((CDateTimeCtrl*)(GetDlgItem(IDC_TIME18)))->SetTime(&T);;
			((CDateTimeCtrl*)(GetDlgItem(IDC_TIME_E18)))->SetTime(&T2);;
		}
		break;
	case 19:
		GetDlgItem(IDC_TIME19)->ShowWindow(bShow);
		GetDlgItem(IDC_STATIC19)->ShowWindow(bShow);
		GetDlgItem(IDC_TIME_E19)->ShowWindow(bShow);
		GetDlgItem(IDC_BTN19)->ShowWindow(bShow);
		if (nInit == 1)
		{
			((CDateTimeCtrl*)(GetDlgItem(IDC_TIME19)))->SetTime(&T);;
			((CDateTimeCtrl*)(GetDlgItem(IDC_TIME_E19)))->SetTime(&T2);;
		}
		break;
	case 20:
		GetDlgItem(IDC_TIME20)->ShowWindow(bShow);
		GetDlgItem(IDC_STATIC20)->ShowWindow(bShow);
		GetDlgItem(IDC_TIME_E20)->ShowWindow(bShow);
		GetDlgItem(IDC_BTN20)->ShowWindow(bShow);
		if (nInit == 1)
		{
			((CDateTimeCtrl*)(GetDlgItem(IDC_TIME20)))->SetTime(&T);;
			((CDateTimeCtrl*)(GetDlgItem(IDC_TIME_E20)))->SetTime(&T2);;
		}
		break;
	case 21:
		GetDlgItem(IDC_TIME21)->ShowWindow(bShow);
		GetDlgItem(IDC_STATIC21)->ShowWindow(bShow);
		GetDlgItem(IDC_TIME_E21)->ShowWindow(bShow);
		GetDlgItem(IDC_BTN21)->ShowWindow(bShow);
		if (nInit == 1)
		{
			((CDateTimeCtrl*)(GetDlgItem(IDC_TIME21)))->SetTime(&T);;
			((CDateTimeCtrl*)(GetDlgItem(IDC_TIME_E21)))->SetTime(&T2);;
		}
		break;
	case 22:
		GetDlgItem(IDC_TIME22)->ShowWindow(bShow);
		GetDlgItem(IDC_STATIC22)->ShowWindow(bShow);
		GetDlgItem(IDC_TIME_E22)->ShowWindow(bShow);
		GetDlgItem(IDC_BTN22)->ShowWindow(bShow);
		if (nInit == 1)
		{
			((CDateTimeCtrl*)(GetDlgItem(IDC_TIME22)))->SetTime(&T);;
			((CDateTimeCtrl*)(GetDlgItem(IDC_TIME_E22)))->SetTime(&T2);;
		}
		break;
	case 23:
		GetDlgItem(IDC_TIME23)->ShowWindow(bShow);
		GetDlgItem(IDC_STATIC23)->ShowWindow(bShow);
		GetDlgItem(IDC_TIME_E23)->ShowWindow(bShow);
		GetDlgItem(IDC_BTN23)->ShowWindow(bShow);
		if (nInit == 1)
		{
			((CDateTimeCtrl*)(GetDlgItem(IDC_TIME23)))->SetTime(&T);;
			((CDateTimeCtrl*)(GetDlgItem(IDC_TIME_E23)))->SetTime(&T2);;
		}
		break;
	case 24:
		GetDlgItem(IDC_TIME24)->ShowWindow(bShow);
		GetDlgItem(IDC_STATIC24)->ShowWindow(bShow);
		GetDlgItem(IDC_TIME_E24)->ShowWindow(bShow);
		GetDlgItem(IDC_BTN24)->ShowWindow(bShow);
		if (nInit == 1)
		{
			((CDateTimeCtrl*)(GetDlgItem(IDC_TIME24)))->SetTime(&T);;
			((CDateTimeCtrl*)(GetDlgItem(IDC_TIME_E24)))->SetTime(&T2);;
		}
		break;
	case 25:
		GetDlgItem(IDC_TIME25)->ShowWindow(bShow);
		GetDlgItem(IDC_STATIC25)->ShowWindow(bShow);
		GetDlgItem(IDC_TIME_E25)->ShowWindow(bShow);
		GetDlgItem(IDC_BTN25)->ShowWindow(bShow);
		if (nInit == 1)
		{
			((CDateTimeCtrl*)(GetDlgItem(IDC_TIME25)))->SetTime(&T);;
			((CDateTimeCtrl*)(GetDlgItem(IDC_TIME_E25)))->SetTime(&T2);;
		}
		break;
	case 26:
		GetDlgItem(IDC_TIME26)->ShowWindow(bShow);
		GetDlgItem(IDC_STATIC26)->ShowWindow(bShow);
		GetDlgItem(IDC_TIME_E26)->ShowWindow(bShow);
		GetDlgItem(IDC_BTN26)->ShowWindow(bShow);
		if (nInit == 1)
		{
			((CDateTimeCtrl*)(GetDlgItem(IDC_TIME26)))->SetTime(&T);;
			((CDateTimeCtrl*)(GetDlgItem(IDC_TIME_E26)))->SetTime(&T2);;
		}
		break;
	case 27:
		GetDlgItem(IDC_TIME27)->ShowWindow(bShow);
		GetDlgItem(IDC_STATIC27)->ShowWindow(bShow);
		GetDlgItem(IDC_TIME_E27)->ShowWindow(bShow);
		GetDlgItem(IDC_BTN27)->ShowWindow(bShow);
		if (nInit == 1)
		{
			((CDateTimeCtrl*)(GetDlgItem(IDC_TIME27)))->SetTime(&T);;
			((CDateTimeCtrl*)(GetDlgItem(IDC_TIME_E27)))->SetTime(&T2);;
		}
		break;
	case 28:
		GetDlgItem(IDC_TIME28)->ShowWindow(bShow);
		GetDlgItem(IDC_STATIC28)->ShowWindow(bShow);
		GetDlgItem(IDC_TIME_E28)->ShowWindow(bShow);
		GetDlgItem(IDC_BTN28)->ShowWindow(bShow);
		if (nInit == 1)
		{
			((CDateTimeCtrl*)(GetDlgItem(IDC_TIME28)))->SetTime(&T);;
			((CDateTimeCtrl*)(GetDlgItem(IDC_TIME_E28)))->SetTime(&T2);;
		}
		break;
	case 29:
		GetDlgItem(IDC_TIME29)->ShowWindow(bShow);
		GetDlgItem(IDC_STATIC29)->ShowWindow(bShow);
		GetDlgItem(IDC_TIME_E29)->ShowWindow(bShow);
		GetDlgItem(IDC_BTN29)->ShowWindow(bShow);
		if (nInit == 1)
		{
			((CDateTimeCtrl*)(GetDlgItem(IDC_TIME29)))->SetTime(&T);;
			((CDateTimeCtrl*)(GetDlgItem(IDC_TIME_E29)))->SetTime(&T2);;
		}
		break;
	default:
		break;
	}
}
void CDlgJurChildV::SetData(DayTimeSlots* timeslots)
{
	m_nCurIndex = 0;
	SetUIInit();
	SYSTEMTIME ts,te;
	memset(&ts, 0, sizeof(SYSTEMTIME));
	memset(&te, 0, sizeof(SYSTEMTIME));
	int nICurIndex = 1;
	for (int n = 0; n <= 29; n++)
	{
		
		if (timeslots->dt_slot[n].s_day >= 0 && timeslots->dt_slot[n].e_day > 0)
		{
			ts.wYear = timeslots->dt_slot[n].s_day / 10000;
			ts.wMonth = timeslots->dt_slot[n].s_day / 100 - ts.wYear*100;
			ts.wDay = timeslots->dt_slot[n].s_day - ts.wMonth * 100 - ts.wYear * 10000;

			te.wYear = timeslots->dt_slot[n].e_day / 10000;
			te.wMonth = timeslots->dt_slot[n].e_day / 100 - te.wYear * 100;
			te.wDay = timeslots->dt_slot[n].e_day - te.wMonth * 100 - te.wYear * 10000;
			if (ts.wMonth > 12 || ts.wMonth <= 0 || te.wMonth > 12 || te.wMonth <= 0 || ts.wDay <= 0 || ts.wDay > 32 || te.wDay <= 0 || te.wDay >= 32){

				continue;
			}

			CTime cte(te);
			CTime cts(ts);
			SetChildData(nICurIndex++, cts, cte);
		}
		else
		{
			timeslots->dt_slot[n].s_day=0;
			timeslots->dt_slot[n].e_day = 0;
		}

	}
	m_TimeSlots = timeslots;
	//m_TimeSlots = *timeslots;
}

void CDlgJurChildV::SetChildData(int nId, CTime ts, CTime te){

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
	case 11:
		GetDlgItem(IDC_TIME11)->ShowWindow(TRUE);
		GetDlgItem(IDC_STATIC11)->ShowWindow(TRUE);
		GetDlgItem(IDC_TIME_E11)->ShowWindow(TRUE);
		GetDlgItem(IDC_BTN11)->ShowWindow(TRUE);
		((CDateTimeCtrl*)(GetDlgItem(IDC_TIME11)))->SetTime(&ts);
		((CDateTimeCtrl*)(GetDlgItem(IDC_TIME_E11)))->SetTime(&te);
		break;
	case 12:
		GetDlgItem(IDC_TIME12)->ShowWindow(TRUE);
		GetDlgItem(IDC_STATIC12)->ShowWindow(TRUE);
		GetDlgItem(IDC_TIME_E12)->ShowWindow(TRUE);
		GetDlgItem(IDC_BTN12)->ShowWindow(TRUE);
		((CDateTimeCtrl*)(GetDlgItem(IDC_TIME12)))->SetTime(&ts);
		((CDateTimeCtrl*)(GetDlgItem(IDC_TIME_E12)))->SetTime(&te);
		break;
	case 13:
		GetDlgItem(IDC_TIME13)->ShowWindow(TRUE);
		GetDlgItem(IDC_STATIC13)->ShowWindow(TRUE);
		GetDlgItem(IDC_TIME_E13)->ShowWindow(TRUE);
		GetDlgItem(IDC_BTN13)->ShowWindow(TRUE);
		((CDateTimeCtrl*)(GetDlgItem(IDC_TIME13)))->SetTime(&ts);
		((CDateTimeCtrl*)(GetDlgItem(IDC_TIME_E13)))->SetTime(&te);
		break;
	case 14:
		GetDlgItem(IDC_TIME14)->ShowWindow(TRUE);
		GetDlgItem(IDC_STATIC14)->ShowWindow(TRUE);
		GetDlgItem(IDC_TIME_E14)->ShowWindow(TRUE);
		GetDlgItem(IDC_BTN14)->ShowWindow(TRUE);
		((CDateTimeCtrl*)(GetDlgItem(IDC_TIME14)))->SetTime(&ts);
		((CDateTimeCtrl*)(GetDlgItem(IDC_TIME_E14)))->SetTime(&te);
		break;
	case 15:
		GetDlgItem(IDC_TIME15)->ShowWindow(TRUE);
		GetDlgItem(IDC_STATIC15)->ShowWindow(TRUE);
		GetDlgItem(IDC_TIME_E15)->ShowWindow(TRUE);
		GetDlgItem(IDC_BTN15)->ShowWindow(TRUE);
		((CDateTimeCtrl*)(GetDlgItem(IDC_TIME15)))->SetTime(&ts);
		((CDateTimeCtrl*)(GetDlgItem(IDC_TIME_E15)))->SetTime(&te);
		break;
	case 16:
		GetDlgItem(IDC_TIME16)->ShowWindow(TRUE);
		GetDlgItem(IDC_STATIC16)->ShowWindow(TRUE);
		GetDlgItem(IDC_TIME_E16)->ShowWindow(TRUE);
		GetDlgItem(IDC_BTN16)->ShowWindow(TRUE);
		((CDateTimeCtrl*)(GetDlgItem(IDC_TIME16)))->SetTime(&ts);
		((CDateTimeCtrl*)(GetDlgItem(IDC_TIME_E16)))->SetTime(&te);
		break;
	case 17:
		GetDlgItem(IDC_TIME17)->ShowWindow(TRUE);
		GetDlgItem(IDC_STATIC17)->ShowWindow(TRUE);
		GetDlgItem(IDC_TIME_E17)->ShowWindow(TRUE);
		GetDlgItem(IDC_BTN17)->ShowWindow(TRUE);
		((CDateTimeCtrl*)(GetDlgItem(IDC_TIME17)))->SetTime(&ts);
		((CDateTimeCtrl*)(GetDlgItem(IDC_TIME_E17)))->SetTime(&te);
		break;
	case 18:
		GetDlgItem(IDC_TIME18)->ShowWindow(TRUE);
		GetDlgItem(IDC_STATIC18)->ShowWindow(TRUE);
		GetDlgItem(IDC_TIME_E18)->ShowWindow(TRUE);
		GetDlgItem(IDC_BTN18)->ShowWindow(TRUE);
		((CDateTimeCtrl*)(GetDlgItem(IDC_TIME18)))->SetTime(&ts);
		((CDateTimeCtrl*)(GetDlgItem(IDC_TIME_E18)))->SetTime(&te);
		break;
	case 19:
		GetDlgItem(IDC_TIME19)->ShowWindow(TRUE);
		GetDlgItem(IDC_STATIC19)->ShowWindow(TRUE);
		GetDlgItem(IDC_TIME_E19)->ShowWindow(TRUE);
		GetDlgItem(IDC_BTN19)->ShowWindow(TRUE);
		((CDateTimeCtrl*)(GetDlgItem(IDC_TIME19)))->SetTime(&ts);
		((CDateTimeCtrl*)(GetDlgItem(IDC_TIME_E19)))->SetTime(&te);
		break;
	case 20:
		GetDlgItem(IDC_TIME20)->ShowWindow(TRUE);
		GetDlgItem(IDC_STATIC20)->ShowWindow(TRUE);
		GetDlgItem(IDC_TIME_E20)->ShowWindow(TRUE);
		GetDlgItem(IDC_BTN20)->ShowWindow(TRUE);
		((CDateTimeCtrl*)(GetDlgItem(IDC_TIME20)))->SetTime(&ts);
		((CDateTimeCtrl*)(GetDlgItem(IDC_TIME_E20)))->SetTime(&te);
		break;
	case 21:
		GetDlgItem(IDC_TIME21)->ShowWindow(TRUE);
		GetDlgItem(IDC_STATIC21)->ShowWindow(TRUE);
		GetDlgItem(IDC_TIME_E21)->ShowWindow(TRUE);
		GetDlgItem(IDC_BTN21)->ShowWindow(TRUE);
		((CDateTimeCtrl*)(GetDlgItem(IDC_TIME21)))->SetTime(&ts);
		((CDateTimeCtrl*)(GetDlgItem(IDC_TIME_E21)))->SetTime(&te);
		break;
	case 22:
		GetDlgItem(IDC_TIME22)->ShowWindow(TRUE);
		GetDlgItem(IDC_STATIC22)->ShowWindow(TRUE);
		GetDlgItem(IDC_TIME_E22)->ShowWindow(TRUE);
		GetDlgItem(IDC_BTN22)->ShowWindow(TRUE);
		((CDateTimeCtrl*)(GetDlgItem(IDC_TIME22)))->SetTime(&ts);
		((CDateTimeCtrl*)(GetDlgItem(IDC_TIME_E22)))->SetTime(&te);
		break;
	case 23:
		GetDlgItem(IDC_TIME23)->ShowWindow(TRUE);
		GetDlgItem(IDC_STATIC23)->ShowWindow(TRUE);
		GetDlgItem(IDC_TIME_E23)->ShowWindow(TRUE);
		GetDlgItem(IDC_BTN23)->ShowWindow(TRUE);
		((CDateTimeCtrl*)(GetDlgItem(IDC_TIME23)))->SetTime(&ts);
		((CDateTimeCtrl*)(GetDlgItem(IDC_TIME_E23)))->SetTime(&te);
		break;
	case 24:
		GetDlgItem(IDC_TIME24)->ShowWindow(TRUE);
		GetDlgItem(IDC_STATIC24)->ShowWindow(TRUE);
		GetDlgItem(IDC_TIME_E24)->ShowWindow(TRUE);
		GetDlgItem(IDC_BTN24)->ShowWindow(TRUE);
		((CDateTimeCtrl*)(GetDlgItem(IDC_TIME24)))->SetTime(&ts);
		((CDateTimeCtrl*)(GetDlgItem(IDC_TIME_E24)))->SetTime(&te);
		break;
	case 25:
		GetDlgItem(IDC_TIME25)->ShowWindow(TRUE);
		GetDlgItem(IDC_STATIC25)->ShowWindow(TRUE);
		GetDlgItem(IDC_TIME_E25)->ShowWindow(TRUE);
		GetDlgItem(IDC_BTN25)->ShowWindow(TRUE);
		((CDateTimeCtrl*)(GetDlgItem(IDC_TIME25)))->SetTime(&ts);
		((CDateTimeCtrl*)(GetDlgItem(IDC_TIME_E25)))->SetTime(&te);
		break;
	case 26:
		GetDlgItem(IDC_TIME26)->ShowWindow(TRUE);
		GetDlgItem(IDC_STATIC26)->ShowWindow(TRUE);
		GetDlgItem(IDC_TIME_E26)->ShowWindow(TRUE);
		GetDlgItem(IDC_BTN26)->ShowWindow(TRUE);
		((CDateTimeCtrl*)(GetDlgItem(IDC_TIME26)))->SetTime(&ts);
		((CDateTimeCtrl*)(GetDlgItem(IDC_TIME_E26)))->SetTime(&te);
		break;
	case 27:
		GetDlgItem(IDC_TIME27)->ShowWindow(TRUE);
		GetDlgItem(IDC_STATIC27)->ShowWindow(TRUE);
		GetDlgItem(IDC_TIME_E27)->ShowWindow(TRUE);
		GetDlgItem(IDC_BTN27)->ShowWindow(TRUE);
		((CDateTimeCtrl*)(GetDlgItem(IDC_TIME27)))->SetTime(&ts);
		((CDateTimeCtrl*)(GetDlgItem(IDC_TIME_E27)))->SetTime(&te);
		break;
	case 28:
		GetDlgItem(IDC_TIME28)->ShowWindow(TRUE);
		GetDlgItem(IDC_STATIC28)->ShowWindow(TRUE);
		GetDlgItem(IDC_TIME_E28)->ShowWindow(TRUE);
		GetDlgItem(IDC_BTN28)->ShowWindow(TRUE);
		((CDateTimeCtrl*)(GetDlgItem(IDC_TIME28)))->SetTime(&ts);
		((CDateTimeCtrl*)(GetDlgItem(IDC_TIME_E28)))->SetTime(&te);
		break;
	case 29:
		GetDlgItem(IDC_TIME29)->ShowWindow(TRUE);
		GetDlgItem(IDC_STATIC29)->ShowWindow(TRUE);
		GetDlgItem(IDC_TIME_E29)->ShowWindow(TRUE);
		GetDlgItem(IDC_BTN29)->ShowWindow(TRUE);
		((CDateTimeCtrl*)(GetDlgItem(IDC_TIME29)))->SetTime(&ts);
		((CDateTimeCtrl*)(GetDlgItem(IDC_TIME_E29)))->SetTime(&te);
		break;
	}
}

void CDlgJurChildV::DeletePos(int nPos){
	int nIndex = 0;
	for (int i = 0; i < 30; i++)
	{
		if (m_TimeSlots->dt_slot[i].e_day >= 0 && m_TimeSlots->dt_slot[i].s_day > 0)
		{

			nIndex++;
			if (nIndex == nPos)
			{
				if (m_TimeSlots->dt_slot[i].s_day != 0 && m_TimeSlots->dt_slot[i].e_day != 0)
				{
					m_TimeSlots->dt_slot[i].s_day = 0;
					m_TimeSlots->dt_slot[i].e_day = 0;
					break;
				}
			}
		}
	}
}


void CDlgJurChildV::OnBnClickedBtn1()
{
	DeletePos(1);
	SetData(m_TimeSlots);
}
void CDlgJurChildV::OnBnClickedBtn2()
{
	DeletePos(2);
	SetData(m_TimeSlots);
}
void CDlgJurChildV::OnBnClickedBtn3()
{
	DeletePos(3);
	SetData(m_TimeSlots);
}
void CDlgJurChildV::OnBnClickedBtn4()
{
	DeletePos(4);
	SetData(m_TimeSlots);
}
void CDlgJurChildV::OnBnClickedBtn5()
{
	DeletePos(5);
	SetData(m_TimeSlots);
}
void CDlgJurChildV::OnBnClickedBtn6()
{
	DeletePos(6);
	SetData(m_TimeSlots);
}
void CDlgJurChildV::OnBnClickedBtn7()
{
	DeletePos(7);
	SetData(m_TimeSlots);
}
void CDlgJurChildV::OnBnClickedBtn8()
{
	DeletePos(8);
	SetData(m_TimeSlots);
}
void CDlgJurChildV::OnBnClickedBtn9()
{
	DeletePos(9);
	SetData(m_TimeSlots);
}
void CDlgJurChildV::OnBnClickedBtn10()
{
	DeletePos(10);
	SetData(m_TimeSlots);
}
void CDlgJurChildV::OnBnClickedBtn11()
{
	DeletePos(11);
	SetData(m_TimeSlots);
}
void CDlgJurChildV::OnBnClickedBtn12()
{
	DeletePos(12);
	SetData(m_TimeSlots);
}
void CDlgJurChildV::OnBnClickedBtn13()
{
	DeletePos(13);
	SetData(m_TimeSlots);
}
void CDlgJurChildV::OnBnClickedBtn14()
{
	DeletePos(14);
	SetData(m_TimeSlots);
}
void CDlgJurChildV::OnBnClickedBtn15()
{
	DeletePos(15);
	SetData(m_TimeSlots);
}
void CDlgJurChildV::OnBnClickedBtn16()
{
	DeletePos(16);
	SetData(m_TimeSlots);
}
void CDlgJurChildV::OnBnClickedBtn17()
{
	DeletePos(17);
	SetData(m_TimeSlots);
}
void CDlgJurChildV::OnBnClickedBtn18()
{
	DeletePos(18);
	SetData(m_TimeSlots);
}
void CDlgJurChildV::OnBnClickedBtn19()
{
	DeletePos(19);
	SetData(m_TimeSlots);
}
void CDlgJurChildV::OnBnClickedBtn20()
{
	DeletePos(20);
	SetData(m_TimeSlots);
}
void CDlgJurChildV::OnBnClickedBtn21()
{
	DeletePos(21);
	SetData(m_TimeSlots);
}
void CDlgJurChildV::OnBnClickedBtn22()
{
	DeletePos(22);
	SetData(m_TimeSlots);
}
void CDlgJurChildV::OnBnClickedBtn23()
{
	DeletePos(23);
	SetData(m_TimeSlots);
}
void CDlgJurChildV::OnBnClickedBtn24()
{
	DeletePos(24);
	SetData(m_TimeSlots);
}
void CDlgJurChildV::OnBnClickedBtn25()
{
	DeletePos(25);
	SetData(m_TimeSlots);
}
void CDlgJurChildV::OnBnClickedBtn26()
{
	DeletePos(26);
	SetData(m_TimeSlots);
}
void CDlgJurChildV::OnBnClickedBtn27()
{
	DeletePos(27);
	SetData(m_TimeSlots);
}
void CDlgJurChildV::OnBnClickedBtn28()
{
	DeletePos(28);
	SetData(m_TimeSlots);
}
void CDlgJurChildV::OnBnClickedBtn29()
{
	DeletePos(29);
	SetData(m_TimeSlots);
}
void CDlgJurChildV::OnBnClickedBtn30()
{
	DeletePos(30);
	SetData(m_TimeSlots);
}

void CDlgJurChildV::OnDtnDatetimechangeTime1(NMHDR *pNMHDR, LRESULT *pResult)
{
	LPNMDATETIMECHANGE pDTChange = reinterpret_cast<LPNMDATETIMECHANGE>(pNMHDR);
	CTime t;
	((CDateTimeCtrl*)GetDlgItem(IDC_TIME1))->GetTime(t);
	m_TimeSlots->dt_slot[0].s_day = t.GetYear() * 10000 + t.GetMonth() * 100 + t.GetDay();
	*pResult = 0;
}
void CDlgJurChildV::OnDtnDatetimechangeTime2(NMHDR *pNMHDR, LRESULT *pResult)
{
	LPNMDATETIMECHANGE pDTChange = reinterpret_cast<LPNMDATETIMECHANGE>(pNMHDR);
	CTime t;
	((CDateTimeCtrl*)GetDlgItem(IDC_TIME2))->GetTime(t);
	m_TimeSlots->dt_slot[1].s_day = t.GetYear() * 10000 + t.GetMonth() * 100 + t.GetDay();
	*pResult = 0;
}
void CDlgJurChildV::OnDtnDatetimechangeTime3(NMHDR *pNMHDR, LRESULT *pResult)
{
	LPNMDATETIMECHANGE pDTChange = reinterpret_cast<LPNMDATETIMECHANGE>(pNMHDR);
	CTime t;
	((CDateTimeCtrl*)GetDlgItem(IDC_TIME3))->GetTime(t);
	m_TimeSlots->dt_slot[2].s_day = t.GetYear() * 10000 + t.GetMonth() * 100 + t.GetDay();
	*pResult = 0;
}
void CDlgJurChildV::OnDtnDatetimechangeTime4(NMHDR *pNMHDR, LRESULT *pResult)
{
	LPNMDATETIMECHANGE pDTChange = reinterpret_cast<LPNMDATETIMECHANGE>(pNMHDR);
	CTime t;
	((CDateTimeCtrl*)GetDlgItem(IDC_TIME4))->GetTime(t);
	m_TimeSlots->dt_slot[3].s_day = t.GetYear() * 10000 + t.GetMonth() * 100 + t.GetDay();
	*pResult = 0;
}
void CDlgJurChildV::OnDtnDatetimechangeTime5(NMHDR *pNMHDR, LRESULT *pResult)
{
	LPNMDATETIMECHANGE pDTChange = reinterpret_cast<LPNMDATETIMECHANGE>(pNMHDR);
	CTime t;
	((CDateTimeCtrl*)GetDlgItem(IDC_TIME5))->GetTime(t);
	m_TimeSlots->dt_slot[4].s_day = t.GetYear() * 10000 + t.GetMonth() * 100 + t.GetDay();
	*pResult = 0;
}
void CDlgJurChildV::OnDtnDatetimechangeTime6(NMHDR *pNMHDR, LRESULT *pResult)
{
	LPNMDATETIMECHANGE pDTChange = reinterpret_cast<LPNMDATETIMECHANGE>(pNMHDR);
	CTime t;
	((CDateTimeCtrl*)GetDlgItem(IDC_TIME6))->GetTime(t);
	m_TimeSlots->dt_slot[5].s_day = t.GetYear() * 10000 + t.GetMonth() * 100 + t.GetDay();
	*pResult = 0;
}
void CDlgJurChildV::OnDtnDatetimechangeTime7(NMHDR *pNMHDR, LRESULT *pResult)
{
	LPNMDATETIMECHANGE pDTChange = reinterpret_cast<LPNMDATETIMECHANGE>(pNMHDR);
	CTime t;
	((CDateTimeCtrl*)GetDlgItem(IDC_TIME7))->GetTime(t);
	m_TimeSlots->dt_slot[6].s_day = t.GetYear() * 10000 + t.GetMonth() * 100 + t.GetDay();
	*pResult = 0;
}
void CDlgJurChildV::OnDtnDatetimechangeTime8(NMHDR *pNMHDR, LRESULT *pResult)
{
	LPNMDATETIMECHANGE pDTChange = reinterpret_cast<LPNMDATETIMECHANGE>(pNMHDR);
	CTime t;
	((CDateTimeCtrl*)GetDlgItem(IDC_TIME8))->GetTime(t);
	m_TimeSlots->dt_slot[7].s_day = t.GetYear() * 10000 + t.GetMonth() * 100 + t.GetDay();
	*pResult = 0;
}
void CDlgJurChildV::OnDtnDatetimechangeTime9(NMHDR *pNMHDR, LRESULT *pResult)
{
	LPNMDATETIMECHANGE pDTChange = reinterpret_cast<LPNMDATETIMECHANGE>(pNMHDR);
	CTime t;
	((CDateTimeCtrl*)GetDlgItem(IDC_TIME9))->GetTime(t);
	m_TimeSlots->dt_slot[8].s_day = t.GetYear() * 10000 + t.GetMonth() * 100 + t.GetDay();
	*pResult = 0;
}
void CDlgJurChildV::OnDtnDatetimechangeTime10(NMHDR *pNMHDR, LRESULT *pResult)
{
	LPNMDATETIMECHANGE pDTChange = reinterpret_cast<LPNMDATETIMECHANGE>(pNMHDR);
	CTime t;
	((CDateTimeCtrl*)GetDlgItem(IDC_TIME10))->GetTime(t);
	m_TimeSlots->dt_slot[9].s_day = t.GetYear() * 10000 + t.GetMonth() * 100 + t.GetDay();
	*pResult = 0;
}
void CDlgJurChildV::OnDtnDatetimechangeTime11(NMHDR *pNMHDR, LRESULT *pResult)
{
	LPNMDATETIMECHANGE pDTChange = reinterpret_cast<LPNMDATETIMECHANGE>(pNMHDR);
	CTime t;
	((CDateTimeCtrl*)GetDlgItem(IDC_TIME11))->GetTime(t);
	m_TimeSlots->dt_slot[10].s_day = t.GetYear() * 10000 + t.GetMonth() * 100 + t.GetDay();
	*pResult = 0;
}
void CDlgJurChildV::OnDtnDatetimechangeTime12(NMHDR *pNMHDR, LRESULT *pResult)
{
	LPNMDATETIMECHANGE pDTChange = reinterpret_cast<LPNMDATETIMECHANGE>(pNMHDR);
	CTime t;
	((CDateTimeCtrl*)GetDlgItem(IDC_TIME12))->GetTime(t);
	m_TimeSlots->dt_slot[11].s_day = t.GetYear() * 10000 + t.GetMonth() * 100 + t.GetDay();
	*pResult = 0;
}
void CDlgJurChildV::OnDtnDatetimechangeTime13(NMHDR *pNMHDR, LRESULT *pResult)
{
	LPNMDATETIMECHANGE pDTChange = reinterpret_cast<LPNMDATETIMECHANGE>(pNMHDR);
	CTime t;
	((CDateTimeCtrl*)GetDlgItem(IDC_TIME13))->GetTime(t);
	m_TimeSlots->dt_slot[12].s_day = t.GetYear() * 10000 + t.GetMonth() * 100 + t.GetDay();
	*pResult = 0;
}
void CDlgJurChildV::OnDtnDatetimechangeTime14(NMHDR *pNMHDR, LRESULT *pResult)
{
	LPNMDATETIMECHANGE pDTChange = reinterpret_cast<LPNMDATETIMECHANGE>(pNMHDR);
	CTime t;
	((CDateTimeCtrl*)GetDlgItem(IDC_TIME14))->GetTime(t);
	m_TimeSlots->dt_slot[13].s_day = t.GetYear() * 10000 + t.GetMonth() * 100 + t.GetDay();
	*pResult = 0;
}
void CDlgJurChildV::OnDtnDatetimechangeTime15(NMHDR *pNMHDR, LRESULT *pResult)
{
	LPNMDATETIMECHANGE pDTChange = reinterpret_cast<LPNMDATETIMECHANGE>(pNMHDR);
	CTime t;
	((CDateTimeCtrl*)GetDlgItem(IDC_TIME15))->GetTime(t);
	m_TimeSlots->dt_slot[14].s_day = t.GetYear() * 10000 + t.GetMonth() * 100 + t.GetDay();
	*pResult = 0;
}
void CDlgJurChildV::OnDtnDatetimechangeTime16(NMHDR *pNMHDR, LRESULT *pResult)
{
	LPNMDATETIMECHANGE pDTChange = reinterpret_cast<LPNMDATETIMECHANGE>(pNMHDR);
	CTime t;
	((CDateTimeCtrl*)GetDlgItem(IDC_TIME16))->GetTime(t);
	m_TimeSlots->dt_slot[15].s_day = t.GetYear() * 10000 + t.GetMonth() * 100 + t.GetDay();
	*pResult = 0;
}
void CDlgJurChildV::OnDtnDatetimechangeTime17(NMHDR *pNMHDR, LRESULT *pResult)
{
	LPNMDATETIMECHANGE pDTChange = reinterpret_cast<LPNMDATETIMECHANGE>(pNMHDR);
	CTime t;
	((CDateTimeCtrl*)GetDlgItem(IDC_TIME17))->GetTime(t);
	m_TimeSlots->dt_slot[16].s_day = t.GetYear() * 10000 + t.GetMonth() * 100 + t.GetDay();
	*pResult = 0;
}
void CDlgJurChildV::OnDtnDatetimechangeTime18(NMHDR *pNMHDR, LRESULT *pResult)
{
	LPNMDATETIMECHANGE pDTChange = reinterpret_cast<LPNMDATETIMECHANGE>(pNMHDR);
	CTime t;
	((CDateTimeCtrl*)GetDlgItem(IDC_TIME18))->GetTime(t);
	m_TimeSlots->dt_slot[17].s_day = t.GetYear() * 10000 + t.GetMonth() * 100 + t.GetDay();
	*pResult = 0;
}
void CDlgJurChildV::OnDtnDatetimechangeTime19(NMHDR *pNMHDR, LRESULT *pResult)
{
	LPNMDATETIMECHANGE pDTChange = reinterpret_cast<LPNMDATETIMECHANGE>(pNMHDR);
	CTime t;
	((CDateTimeCtrl*)GetDlgItem(IDC_TIME19))->GetTime(t);
	m_TimeSlots->dt_slot[18].s_day = t.GetYear() * 10000 + t.GetMonth() * 100 + t.GetDay();
	*pResult = 0;
}
void CDlgJurChildV::OnDtnDatetimechangeTime20(NMHDR *pNMHDR, LRESULT *pResult)
{
	LPNMDATETIMECHANGE pDTChange = reinterpret_cast<LPNMDATETIMECHANGE>(pNMHDR);
	CTime t;
	((CDateTimeCtrl*)GetDlgItem(IDC_TIME20))->GetTime(t);
	m_TimeSlots->dt_slot[19].s_day = t.GetYear() * 10000 + t.GetMonth() * 100 + t.GetDay();
	*pResult = 0;
}
void CDlgJurChildV::OnDtnDatetimechangeTime21(NMHDR *pNMHDR, LRESULT *pResult)
{
	LPNMDATETIMECHANGE pDTChange = reinterpret_cast<LPNMDATETIMECHANGE>(pNMHDR);
	CTime t;
	((CDateTimeCtrl*)GetDlgItem(IDC_TIME21))->GetTime(t);
	m_TimeSlots->dt_slot[20].s_day = t.GetYear() * 10000 + t.GetMonth() * 100 + t.GetDay();
	*pResult = 0;
}
void CDlgJurChildV::OnDtnDatetimechangeTime22(NMHDR *pNMHDR, LRESULT *pResult)
{
	LPNMDATETIMECHANGE pDTChange = reinterpret_cast<LPNMDATETIMECHANGE>(pNMHDR);
	CTime t;
	((CDateTimeCtrl*)GetDlgItem(IDC_TIME22))->GetTime(t);
	m_TimeSlots->dt_slot[21].s_day = t.GetYear() * 10000 + t.GetMonth() * 100 + t.GetDay();
	*pResult = 0;
}
void CDlgJurChildV::OnDtnDatetimechangeTime23(NMHDR *pNMHDR, LRESULT *pResult)
{
	LPNMDATETIMECHANGE pDTChange = reinterpret_cast<LPNMDATETIMECHANGE>(pNMHDR);
	CTime t;
	((CDateTimeCtrl*)GetDlgItem(IDC_TIME23))->GetTime(t);
	m_TimeSlots->dt_slot[22].s_day = t.GetYear() * 10000 + t.GetMonth() * 100 + t.GetDay();
	*pResult = 0;
}
void CDlgJurChildV::OnDtnDatetimechangeTime24(NMHDR *pNMHDR, LRESULT *pResult)
{
	LPNMDATETIMECHANGE pDTChange = reinterpret_cast<LPNMDATETIMECHANGE>(pNMHDR);
	CTime t;
	((CDateTimeCtrl*)GetDlgItem(IDC_TIME24))->GetTime(t);
	m_TimeSlots->dt_slot[23].s_day = t.GetYear() * 10000 + t.GetMonth() * 100 + t.GetDay();
	*pResult = 0;
}
void CDlgJurChildV::OnDtnDatetimechangeTime25(NMHDR *pNMHDR, LRESULT *pResult)
{
	LPNMDATETIMECHANGE pDTChange = reinterpret_cast<LPNMDATETIMECHANGE>(pNMHDR);
	CTime t;
	((CDateTimeCtrl*)GetDlgItem(IDC_TIME25))->GetTime(t);
	m_TimeSlots->dt_slot[24].s_day = t.GetYear() * 10000 + t.GetMonth() * 100 + t.GetDay();
	*pResult = 0;
}
void CDlgJurChildV::OnDtnDatetimechangeTime26(NMHDR *pNMHDR, LRESULT *pResult)
{
	LPNMDATETIMECHANGE pDTChange = reinterpret_cast<LPNMDATETIMECHANGE>(pNMHDR);
	CTime t;
	((CDateTimeCtrl*)GetDlgItem(IDC_TIME26))->GetTime(t);
	m_TimeSlots->dt_slot[25].s_day = t.GetYear() * 10000 + t.GetMonth() * 100 + t.GetDay();
	*pResult = 0;
}
void CDlgJurChildV::OnDtnDatetimechangeTime27(NMHDR *pNMHDR, LRESULT *pResult)
{
	LPNMDATETIMECHANGE pDTChange = reinterpret_cast<LPNMDATETIMECHANGE>(pNMHDR);
	CTime t;
	((CDateTimeCtrl*)GetDlgItem(IDC_TIME27))->GetTime(t);
	m_TimeSlots->dt_slot[26].s_day = t.GetYear() * 10000 + t.GetMonth() * 100 + t.GetDay();
	*pResult = 0;
}
void CDlgJurChildV::OnDtnDatetimechangeTime28(NMHDR *pNMHDR, LRESULT *pResult)
{
	LPNMDATETIMECHANGE pDTChange = reinterpret_cast<LPNMDATETIMECHANGE>(pNMHDR);
	CTime t;
	((CDateTimeCtrl*)GetDlgItem(IDC_TIME28))->GetTime(t);
	m_TimeSlots->dt_slot[27].s_day = t.GetYear() * 10000 + t.GetMonth() * 100 + t.GetDay();
	*pResult = 0;
}
void CDlgJurChildV::OnDtnDatetimechangeTime29(NMHDR *pNMHDR, LRESULT *pResult)
{
	LPNMDATETIMECHANGE pDTChange = reinterpret_cast<LPNMDATETIMECHANGE>(pNMHDR);
	CTime t;
	((CDateTimeCtrl*)GetDlgItem(IDC_TIME29))->GetTime(t);
	m_TimeSlots->dt_slot[28].s_day = t.GetYear() * 10000 + t.GetMonth() * 100 + t.GetDay();
	*pResult = 0;
}
void CDlgJurChildV::OnDtnDatetimechangeTime30(NMHDR *pNMHDR, LRESULT *pResult)
{
	LPNMDATETIMECHANGE pDTChange = reinterpret_cast<LPNMDATETIMECHANGE>(pNMHDR);
	CTime t;
	((CDateTimeCtrl*)GetDlgItem(IDC_TIME30))->GetTime(t);
	m_TimeSlots->dt_slot[29].s_day = t.GetYear() * 10000 + t.GetMonth() * 100 + t.GetDay();
	*pResult = 0;
}


void CDlgJurChildV::OnDtnDatetimechangeTimeE1(NMHDR *pNMHDR, LRESULT *pResult)
{
	LPNMDATETIMECHANGE pDTChange = reinterpret_cast<LPNMDATETIMECHANGE>(pNMHDR);
	CTime t;
	((CDateTimeCtrl*)GetDlgItem(IDC_TIME_E1))->GetTime(t);
	m_TimeSlots->dt_slot[0].e_day = t.GetYear() * 10000 + t.GetMonth() * 100 + t.GetDay();
	*pResult = 0;
}
void CDlgJurChildV::OnDtnDatetimechangeTimeE2(NMHDR *pNMHDR, LRESULT *pResult)
{
	LPNMDATETIMECHANGE pDTChange = reinterpret_cast<LPNMDATETIMECHANGE>(pNMHDR);
	CTime t;
	((CDateTimeCtrl*)GetDlgItem(IDC_TIME_E2))->GetTime(t);
	m_TimeSlots->dt_slot[1].e_day = t.GetYear() * 10000 + t.GetMonth() * 100 + t.GetDay();
	*pResult = 0;
}
void CDlgJurChildV::OnDtnDatetimechangeTimeE3(NMHDR *pNMHDR, LRESULT *pResult)
{
	LPNMDATETIMECHANGE pDTChange = reinterpret_cast<LPNMDATETIMECHANGE>(pNMHDR);
	CTime t;
	((CDateTimeCtrl*)GetDlgItem(IDC_TIME_E3))->GetTime(t);
	m_TimeSlots->dt_slot[2].e_day = t.GetYear() * 10000 + t.GetMonth() * 100 + t.GetDay();
	*pResult = 0;
}
void CDlgJurChildV::OnDtnDatetimechangeTimeE4(NMHDR *pNMHDR, LRESULT *pResult)
{
	LPNMDATETIMECHANGE pDTChange = reinterpret_cast<LPNMDATETIMECHANGE>(pNMHDR);
	CTime t;
	((CDateTimeCtrl*)GetDlgItem(IDC_TIME_E4))->GetTime(t);
	m_TimeSlots->dt_slot[3].e_day = t.GetYear() * 10000 + t.GetMonth() * 100 + t.GetDay();
	*pResult = 0;
}
void CDlgJurChildV::OnDtnDatetimechangeTimeE5(NMHDR *pNMHDR, LRESULT *pResult)
{
	LPNMDATETIMECHANGE pDTChange = reinterpret_cast<LPNMDATETIMECHANGE>(pNMHDR);
	CTime t;
	((CDateTimeCtrl*)GetDlgItem(IDC_TIME_E5))->GetTime(t);
	m_TimeSlots->dt_slot[4].e_day = t.GetYear() * 10000 + t.GetMonth() * 100 + t.GetDay();
	*pResult = 0;
}
void CDlgJurChildV::OnDtnDatetimechangeTimeE6(NMHDR *pNMHDR, LRESULT *pResult)
{
	LPNMDATETIMECHANGE pDTChange = reinterpret_cast<LPNMDATETIMECHANGE>(pNMHDR);
	CTime t;
	((CDateTimeCtrl*)GetDlgItem(IDC_TIME_E6))->GetTime(t);
	m_TimeSlots->dt_slot[5].e_day = t.GetYear() * 10000 + t.GetMonth() * 100 + t.GetDay();
	*pResult = 0;
}
void CDlgJurChildV::OnDtnDatetimechangeTimeE7(NMHDR *pNMHDR, LRESULT *pResult)
{
	LPNMDATETIMECHANGE pDTChange = reinterpret_cast<LPNMDATETIMECHANGE>(pNMHDR);
	CTime t;
	((CDateTimeCtrl*)GetDlgItem(IDC_TIME_E7))->GetTime(t);
	m_TimeSlots->dt_slot[6].e_day = t.GetYear() * 10000 + t.GetMonth() * 100 + t.GetDay();
	*pResult = 0;
}
void CDlgJurChildV::OnDtnDatetimechangeTimeE8(NMHDR *pNMHDR, LRESULT *pResult)
{
	LPNMDATETIMECHANGE pDTChange = reinterpret_cast<LPNMDATETIMECHANGE>(pNMHDR);
	CTime t;
	((CDateTimeCtrl*)GetDlgItem(IDC_TIME_E8))->GetTime(t);
	m_TimeSlots->dt_slot[7].e_day = t.GetYear() * 10000 + t.GetMonth() * 100 + t.GetDay();
	*pResult = 0;
}
void CDlgJurChildV::OnDtnDatetimechangeTimeE9(NMHDR *pNMHDR, LRESULT *pResult)
{
	LPNMDATETIMECHANGE pDTChange = reinterpret_cast<LPNMDATETIMECHANGE>(pNMHDR);
	CTime t;
	((CDateTimeCtrl*)GetDlgItem(IDC_TIME_E9))->GetTime(t);
	m_TimeSlots->dt_slot[8].e_day = t.GetYear() * 10000 + t.GetMonth() * 100 + t.GetDay();
	*pResult = 0;
}
void CDlgJurChildV::OnDtnDatetimechangeTimeE10(NMHDR *pNMHDR, LRESULT *pResult)
{
	LPNMDATETIMECHANGE pDTChange = reinterpret_cast<LPNMDATETIMECHANGE>(pNMHDR);
	CTime t;
	((CDateTimeCtrl*)GetDlgItem(IDC_TIME_E10))->GetTime(t);
	m_TimeSlots->dt_slot[9].e_day = t.GetYear() * 10000 + t.GetMonth() * 100 + t.GetDay();
	*pResult = 0;
}
void CDlgJurChildV::OnDtnDatetimechangeTimeE11(NMHDR *pNMHDR, LRESULT *pResult)
{
	LPNMDATETIMECHANGE pDTChange = reinterpret_cast<LPNMDATETIMECHANGE>(pNMHDR);
	CTime t;
	((CDateTimeCtrl*)GetDlgItem(IDC_TIME_E11))->GetTime(t);
	m_TimeSlots->dt_slot[10].e_day = t.GetYear() * 10000 + t.GetMonth() * 100 + t.GetDay();
	*pResult = 0;
}
void CDlgJurChildV::OnDtnDatetimechangeTimeE12(NMHDR *pNMHDR, LRESULT *pResult)
{
	LPNMDATETIMECHANGE pDTChange = reinterpret_cast<LPNMDATETIMECHANGE>(pNMHDR);
	CTime t;
	((CDateTimeCtrl*)GetDlgItem(IDC_TIME_E12))->GetTime(t);
	m_TimeSlots->dt_slot[11].e_day = t.GetYear() * 10000 + t.GetMonth() * 100 + t.GetDay();
	*pResult = 0;
}
void CDlgJurChildV::OnDtnDatetimechangeTimeE13(NMHDR *pNMHDR, LRESULT *pResult)
{
	LPNMDATETIMECHANGE pDTChange = reinterpret_cast<LPNMDATETIMECHANGE>(pNMHDR);
	CTime t;
	((CDateTimeCtrl*)GetDlgItem(IDC_TIME_E13))->GetTime(t);
	m_TimeSlots->dt_slot[12].e_day = t.GetYear() * 10000 + t.GetMonth() * 100 + t.GetDay();
	*pResult = 0;
}
void CDlgJurChildV::OnDtnDatetimechangeTimeE14(NMHDR *pNMHDR, LRESULT *pResult)
{
	LPNMDATETIMECHANGE pDTChange = reinterpret_cast<LPNMDATETIMECHANGE>(pNMHDR);
	CTime t;
	((CDateTimeCtrl*)GetDlgItem(IDC_TIME_E14))->GetTime(t);
	m_TimeSlots->dt_slot[13].e_day = t.GetYear() * 10000 + t.GetMonth() * 100 + t.GetDay();
	*pResult = 0;
}
void CDlgJurChildV::OnDtnDatetimechangeTimeE15(NMHDR *pNMHDR, LRESULT *pResult)
{
	LPNMDATETIMECHANGE pDTChange = reinterpret_cast<LPNMDATETIMECHANGE>(pNMHDR);
	CTime t;
	((CDateTimeCtrl*)GetDlgItem(IDC_TIME_E15))->GetTime(t);
	m_TimeSlots->dt_slot[14].e_day = t.GetYear() * 10000 + t.GetMonth() * 100 + t.GetDay();
	*pResult = 0;
}
void CDlgJurChildV::OnDtnDatetimechangeTimeE16(NMHDR *pNMHDR, LRESULT *pResult)
{
	LPNMDATETIMECHANGE pDTChange = reinterpret_cast<LPNMDATETIMECHANGE>(pNMHDR);
	CTime t;
	((CDateTimeCtrl*)GetDlgItem(IDC_TIME_E16))->GetTime(t);
	m_TimeSlots->dt_slot[15].e_day = t.GetYear() * 10000 + t.GetMonth() * 100 + t.GetDay();
	*pResult = 0;
}
void CDlgJurChildV::OnDtnDatetimechangeTimeE17(NMHDR *pNMHDR, LRESULT *pResult)
{
	LPNMDATETIMECHANGE pDTChange = reinterpret_cast<LPNMDATETIMECHANGE>(pNMHDR);
	CTime t;
	((CDateTimeCtrl*)GetDlgItem(IDC_TIME_E17))->GetTime(t);
	m_TimeSlots->dt_slot[16].e_day = t.GetYear() * 10000 + t.GetMonth() * 100 + t.GetDay();
	*pResult = 0;
}
void CDlgJurChildV::OnDtnDatetimechangeTimeE18(NMHDR *pNMHDR, LRESULT *pResult)
{
	LPNMDATETIMECHANGE pDTChange = reinterpret_cast<LPNMDATETIMECHANGE>(pNMHDR);
	CTime t;
	((CDateTimeCtrl*)GetDlgItem(IDC_TIME_E18))->GetTime(t);
	m_TimeSlots->dt_slot[17].e_day = t.GetYear() * 10000 + t.GetMonth() * 100 + t.GetDay();
	*pResult = 0;
}
void CDlgJurChildV::OnDtnDatetimechangeTimeE19(NMHDR *pNMHDR, LRESULT *pResult)
{
	LPNMDATETIMECHANGE pDTChange = reinterpret_cast<LPNMDATETIMECHANGE>(pNMHDR);
	CTime t;
	((CDateTimeCtrl*)GetDlgItem(IDC_TIME_E19))->GetTime(t);
	m_TimeSlots->dt_slot[18].e_day = t.GetYear() * 10000 + t.GetMonth() * 100 + t.GetDay();
	*pResult = 0;
}
void CDlgJurChildV::OnDtnDatetimechangeTimeE20(NMHDR *pNMHDR, LRESULT *pResult)
{
	LPNMDATETIMECHANGE pDTChange = reinterpret_cast<LPNMDATETIMECHANGE>(pNMHDR);
	CTime t;
	((CDateTimeCtrl*)GetDlgItem(IDC_TIME_E20))->GetTime(t);
	m_TimeSlots->dt_slot[19].e_day = t.GetYear() * 10000 + t.GetMonth() * 100 + t.GetDay();
	*pResult = 0;
}
void CDlgJurChildV::OnDtnDatetimechangeTimeE21(NMHDR *pNMHDR, LRESULT *pResult)
{
	LPNMDATETIMECHANGE pDTChange = reinterpret_cast<LPNMDATETIMECHANGE>(pNMHDR);
	CTime t;
	((CDateTimeCtrl*)GetDlgItem(IDC_TIME_E21))->GetTime(t);
	m_TimeSlots->dt_slot[20].e_day = t.GetYear() * 10000 + t.GetMonth() * 100 + t.GetDay();
	*pResult = 0;
}
void CDlgJurChildV::OnDtnDatetimechangeTimeE22(NMHDR *pNMHDR, LRESULT *pResult)
{
	LPNMDATETIMECHANGE pDTChange = reinterpret_cast<LPNMDATETIMECHANGE>(pNMHDR);
	CTime t;
	((CDateTimeCtrl*)GetDlgItem(IDC_TIME_E22))->GetTime(t);
	m_TimeSlots->dt_slot[21].e_day = t.GetYear() * 10000 + t.GetMonth() * 100 + t.GetDay();
	*pResult = 0;
}
void CDlgJurChildV::OnDtnDatetimechangeTimeE23(NMHDR *pNMHDR, LRESULT *pResult)
{
	LPNMDATETIMECHANGE pDTChange = reinterpret_cast<LPNMDATETIMECHANGE>(pNMHDR);
	CTime t;
	((CDateTimeCtrl*)GetDlgItem(IDC_TIME_E23))->GetTime(t);
	m_TimeSlots->dt_slot[22].e_day = t.GetYear() * 10000 + t.GetMonth() * 100 + t.GetDay();
	*pResult = 0;
}
void CDlgJurChildV::OnDtnDatetimechangeTimeE24(NMHDR *pNMHDR, LRESULT *pResult)
{
	LPNMDATETIMECHANGE pDTChange = reinterpret_cast<LPNMDATETIMECHANGE>(pNMHDR);
	CTime t;
	((CDateTimeCtrl*)GetDlgItem(IDC_TIME_E24))->GetTime(t);
	m_TimeSlots->dt_slot[23].e_day = t.GetYear() * 10000 + t.GetMonth() * 100 + t.GetDay();
	*pResult = 0;
}
void CDlgJurChildV::OnDtnDatetimechangeTimeE25(NMHDR *pNMHDR, LRESULT *pResult)
{
	LPNMDATETIMECHANGE pDTChange = reinterpret_cast<LPNMDATETIMECHANGE>(pNMHDR);
	CTime t;
	((CDateTimeCtrl*)GetDlgItem(IDC_TIME_E25))->GetTime(t);
	m_TimeSlots->dt_slot[24].e_day = t.GetYear() * 10000 + t.GetMonth() * 100 + t.GetDay();
	*pResult = 0;
}
void CDlgJurChildV::OnDtnDatetimechangeTimeE26(NMHDR *pNMHDR, LRESULT *pResult)
{
	LPNMDATETIMECHANGE pDTChange = reinterpret_cast<LPNMDATETIMECHANGE>(pNMHDR);
	CTime t;
	((CDateTimeCtrl*)GetDlgItem(IDC_TIME_E26))->GetTime(t);
	m_TimeSlots->dt_slot[25].e_day = t.GetYear() * 10000 + t.GetMonth() * 100 + t.GetDay();
	*pResult = 0;
}
void CDlgJurChildV::OnDtnDatetimechangeTimeE27(NMHDR *pNMHDR, LRESULT *pResult)
{
	LPNMDATETIMECHANGE pDTChange = reinterpret_cast<LPNMDATETIMECHANGE>(pNMHDR);
	CTime t;
	((CDateTimeCtrl*)GetDlgItem(IDC_TIME_E27))->GetTime(t);
	m_TimeSlots->dt_slot[26].e_day = t.GetYear() * 10000 + t.GetMonth() * 100 + t.GetDay();
	*pResult = 0;
}
void CDlgJurChildV::OnDtnDatetimechangeTimeE28(NMHDR *pNMHDR, LRESULT *pResult)
{
	LPNMDATETIMECHANGE pDTChange = reinterpret_cast<LPNMDATETIMECHANGE>(pNMHDR);
	CTime t;
	((CDateTimeCtrl*)GetDlgItem(IDC_TIME_E28))->GetTime(t);
	m_TimeSlots->dt_slot[27].e_day = t.GetYear() * 10000 + t.GetMonth() * 100 + t.GetDay();
	*pResult = 0;
}
void CDlgJurChildV::OnDtnDatetimechangeTimeE29(NMHDR *pNMHDR, LRESULT *pResult)
{
	LPNMDATETIMECHANGE pDTChange = reinterpret_cast<LPNMDATETIMECHANGE>(pNMHDR);
	CTime t;
	((CDateTimeCtrl*)GetDlgItem(IDC_TIME_E29))->GetTime(t);
	m_TimeSlots->dt_slot[28].e_day = t.GetYear() * 10000 + t.GetMonth() * 100 + t.GetDay();
	*pResult = 0;
}
void CDlgJurChildV::OnDtnDatetimechangeTimeE30(NMHDR *pNMHDR, LRESULT *pResult)
{
	LPNMDATETIMECHANGE pDTChange = reinterpret_cast<LPNMDATETIMECHANGE>(pNMHDR);
	CTime t;
	((CDateTimeCtrl*)GetDlgItem(IDC_TIME_E30))->GetTime(t);
	m_TimeSlots->dt_slot[29].e_day = t.GetYear() * 10000 + t.GetMonth() * 100 + t.GetDay();
	*pResult = 0;
}

BOOL CDlgJurChildV::PreTranslateMessage(MSG* pMsg)
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
	return CDialog::PreTranslateMessage(pMsg);
}

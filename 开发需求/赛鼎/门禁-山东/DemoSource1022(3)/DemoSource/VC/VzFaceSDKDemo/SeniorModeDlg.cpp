// SeniorModeDlg.cpp : 实现文件
//

#include "stdafx.h"
#include "VzFaceSDKDemo.h"
#include "SeniorModeDlg.h"
#include "afxdialogex.h"


// CSeniorModeDlg 对话框

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


// CSeniorModeDlg 消息处理程序


void CSeniorModeDlg::OnBnClickedBtnGetopen2()
{
	// TODO:  在此添加控件通知处理程序代码
	OnGetGroupInfo(true);
}


BOOL CSeniorModeDlg::OnInitDialog()
{
	CDialogEx::OnInitDialog();
	m_Gpio1.InsertString(0, "自动");
	m_Gpio1.InsertString(1, "常闭");
	m_Gpio1.InsertString(2, "常开");
	// TODO:  在此添加额外的初始化
#if 0 
	SCROLLINFO vinfo;

	vinfo.cbSize = sizeof(vinfo);

	vinfo.fMask = SIF_ALL;

	vinfo.nPage = 25;//滚动块自身的长短，通常有如下关系：其长度/滚动条长度（含两个箭头）=nPage/(nMax+2)，

	//另外nPage取值-1时，滚动条会不见了。

	vinfo.nMax = 50;//滚动条所能滚动的最大值

	vinfo.nMin = 0;//滚动条所能滚动的最小值

	vinfo.nTrackPos = 0;
	SetScrollInfo(SB_VERT, &vinfo);//即使上述步骤一不做，使用此条语句也可以显示滚动条
#endif
	OnSetCurtype(false);
	OnGetGroupInfo(false);
	OnGetIOTime(false);
	return TRUE;  // return TRUE unless you set the focus to a control
	// 异常:  OCX 属性页应返回 FALSE
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
			AfxMessageBox("获取完成");
		}
	}
	else
	{
		if (bshow)
		{
			AfxMessageBox("获取失败");
		}
	}

}



void CSeniorModeDlg::OnBnClickedRadio1()
{
	// TODO:  在此添加控件通知处理程序代码
	m_nCurOpenType = 0;
}


void CSeniorModeDlg::OnBnClickedRadio2()
{
	// TODO:  在此添加控件通知处理程序代码
	m_nCurOpenType = 3;
}


void CSeniorModeDlg::OnBnClickedRadio4()
{
	// TODO:  在此添加控件通知处理程序代码
	m_nCurOpenType = 1;
}


void CSeniorModeDlg::OnBnClickedRadio7()
{
	// TODO:  在此添加控件通知处理程序代码
	m_nCurOpenType = 2;
}


void CSeniorModeDlg::OnBnClickedRadio5()
{
	// TODO:  在此添加控件通知处理程序代码
	m_nCurOpenType = 4;
}


void CSeniorModeDlg::OnBnClickedRadio3()
{
	// TODO:  在此添加控件通知处理程序代码
	m_nCurOpenType = 5;
}


void CSeniorModeDlg::OnBnClickedRadio6()
{
	// TODO:  在此添加控件通知处理程序代码
	m_nCurOpenType = 6;
}


void CSeniorModeDlg::OnBnClickedRadio8()
{
	// TODO:  在此添加控件通知处理程序代码
	m_nCurOpenType = 7;
}


void CSeniorModeDlg::OnBnClickedBtnSetopen()
{
	// TODO:  在此添加控件通知处理程序代码
	int nRet = ZBX_SetGatewayControlType(m_cam, m_nCurOpenType);
	if (!nRet)
	{
		AfxMessageBox("设置成功");
	}
	else
	{
		AfxMessageBox("设置失败");
	}
}


void CSeniorModeDlg::OnBnClickedBtnGetopen()
{
	// TODO:  在此添加控件通知处理程序代码
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
			AfxMessageBox("获取成功");
		}
		else
		{
			AfxMessageBox("获取失败");
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
	// TODO:  在此添加控件通知处理程序代码
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
		AfxMessageBox("设置成功");
	}
	else{
		AfxMessageBox("设置失败");
	}

}
//void CSeniorModeDlg::OnVScroll(UINT nSBCode, UINT nPos, CScrollBar* pScrollBar)
//{
//	// TODO:  在此添加消息处理程序代码和/或调用默认值
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
//	case SB_BOTTOM: //滑块滚动到最底部
//
//		ScrollWindow(0, (scrollinfo.nPos - scrollinfo.nMax) * 10); //滚动屏幕
//
//		scrollinfo.nPos = scrollinfo.nMax; //设定滑块新位置
//
//		SetScrollInfo(SB_VERT, &scrollinfo, SIF_ALL); //更新滑块位置
//
//		break;
//
//	case SB_TOP: //滑块滚动到最顶部
//
//		ScrollWindow(0, (scrollinfo.nPos - scrollinfo.nMin) * 10);
//
//		scrollinfo.nPos = scrollinfo.nMin;
//
//		SetScrollInfo(SB_VERT, &scrollinfo, SIF_ALL);
//
//		break;
//
//	case SB_LINEUP: //单击上箭头
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
//	case SB_LINEDOWN: //单击下箭头
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
//	case SB_PAGEUP: //单击滑块上方空白区域
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
//	case SB_PAGEDOWN: //单击滑块下方空白区域
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
//	case SB_ENDSCROLL: //鼠标离开滑块，结束滑块拖动
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
//	case SB_THUMBTRACK: //拖动滑块
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
//	// TODO:  在此添加消息处理程序代码和/或调用默认值
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
	// TODO:  在此添加控件通知处理程序代码
	CString str;
	GetDlgItem(IDC_EDIT_TIME1)->GetWindowTextA(str);
	int nData = atoi(str);
	if (nData<500||nData>5000)
	{
		AfxMessageBox("请输入500~5000之间的整数");
		return;
	}
	int nRet = ZBX_SetAlarmDuration(m_cam, atoi(str));	
	int nCur = m_Gpio1.GetCurSel();
	nRet = ZBX_SetGpioWorkState(m_cam, nCur);
	if (nRet == 0)
	{
		AfxMessageBox("设置成功");
	}
	else
	{
		AfxMessageBox("设置失败");
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
			AfxMessageBox("获取失败");
			return;
		}
	}
	SetDlgItemInt(IDC_EDIT_TIME1, nTime);

	nRet = ZBX_GetGpioWorkState(m_cam, &nTime);
	if (nRet == 0)
	{
		if (bShow)
		{
			AfxMessageBox("获取成功");
		}
	}
	else
	{
		if (bShow)
		{
			AfxMessageBox("获取失败");
		}
	}
	m_Gpio1.SetCurSel(nTime);

}
void CSeniorModeDlg::OnBnClickedBtnRelayread1()
{
	// TODO:  在此添加控件通知处理程序代码
	OnGetIOTime(true);
}



BOOL CSeniorModeDlg::PreTranslateMessage(MSG* pMsg)
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
	return __super::PreTranslateMessage(pMsg);
}

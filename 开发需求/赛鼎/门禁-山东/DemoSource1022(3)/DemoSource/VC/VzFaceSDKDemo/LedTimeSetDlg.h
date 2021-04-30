#pragma once
#include "afxdtctl.h"
#include "afxcmn.h"


// CLedTimeSetDlg dialog

class CLedTimeSetDlg : public CDialogEx
{
	DECLARE_DYNAMIC(CLedTimeSetDlg)

public:
	CLedTimeSetDlg(VzLPRClientHandle cam, CWnd* pParent = NULL);   // standard constructor
	virtual ~CLedTimeSetDlg();

// Dialog Data
	enum { IDD = IDD_DLG_LEDTIEM };

protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support

	CSliderCtrl m_Sliderled;
	int m_nLedLevel = 0;

	CComboBox m_Combox;
	DECLARE_MESSAGE_MAP()
public:
	VzLPRClientHandle m_cam;
	CDateTimeCtrl m_TimeCtrlBegin1;
	CDateTimeCtrl m_TimeCtrlBegin2;
	CDateTimeCtrl m_TimeCtrlBegin3;
	CDateTimeCtrl m_TimeCtrlEnd1;
	CDateTimeCtrl m_TimeCtrlEnd2;
	CDateTimeCtrl m_TimeCtrlEnd3;
	CSliderCtrl m_Sliderled1;
	CSliderCtrl m_Sliderled2;
	CSliderCtrl m_Sliderled3;
	int m_nLedLevel1 = 0;
	int m_nLedLevel2 = 0;
	int m_nLedLevel3 = 0;
	afx_msg void OnBnClickedButton1();
	afx_msg void OnHScroll(UINT nSBCode, UINT nPos, CScrollBar* pScrollBar);
	virtual BOOL OnInitDialog();
	afx_msg void OnBnClickedBtnRead();
	void Getinfo(bool bshow);
	afx_msg void OnBnClickedBtnSet();
	int m_nVol = 0;
	afx_msg void OnBnClickedBtnRead2();
	void GetTimeCtrl(bool bShow);
	virtual BOOL PreTranslateMessage(MSG* pMsg);
};

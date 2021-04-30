#pragma once
#include "afxwin.h"
#include "afxcmn.h"
#include "afxdtctl.h"
#include "BasicScreenDlg.h"
#include "BasicTimeDlg.h"
#include "BasicUIDlg.h"
#include "BasicVolDlg.h"
#include "LedTimeSetDlg.h"
#include "ThreadBasic.h"
// CBasicsDlg dialog

class CBasicsDlg : public CDialogEx,CThreadBasic
{
	DECLARE_DYNAMIC(CBasicsDlg)

public:
	CBasicsDlg(VzLPRClientHandle cam, CWnd* pParent = NULL);   // standard constructor
	virtual ~CBasicsDlg();

// Dialog Data
	enum { IDD = IDD_DLG_BASICS };

protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	VzLPRClientHandle m_cam;
	DECLARE_MESSAGE_MAP()
public:
	virtual BOOL OnInitDialog();
	afx_msg void OnBnClickedBtnTitle();
	afx_msg LRESULT OnUserMsg(WPARAM w, LPARAM l);
	afx_msg void OnBnClickedBtnLed();
	afx_msg void OnHScroll(UINT nSBCode, UINT nPos, CScrollBar* pScrollBar);
	afx_msg void OnBnClickedBtnVol();
	afx_msg void OnBnClickedBtnLocal();

	afx_msg void OnBnClickedBtnTime();
	virtual BOOL PreTranslateMessage(MSG* pMsg);
	afx_msg void OnBnClickedScareensave();
	afx_msg void OnTimer(UINT_PTR nIDEvent);

	afx_msg void OnBnClickedBtnUi();
	afx_msg void OnBnClickedBtnScreen();
	virtual void Run();
	void ShowUI(int nIDC);
	void UISet();
	void ResetUI(int nID);
	CBasicScreenDlg* m_ScreenDlg = NULL;
	CBasicTimeDlg*   m_TimeDlg = NULL;
	CBasicUIDlg*     m_UIDlg = NULL;
	CBasicVolDlg*    m_VolDlg = NULL;
	CLedTimeSetDlg*  m_LedTimeDlg = NULL;
	CList<int> m_listTask;
};

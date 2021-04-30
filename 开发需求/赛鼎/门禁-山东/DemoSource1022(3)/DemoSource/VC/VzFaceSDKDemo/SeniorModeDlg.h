#pragma once
#include "ThreadBasic.h"
#include "afxwin.h"

// CSeniorModeDlg 对话框

class CSeniorModeDlg : public CDialogEx, CThreadBasic
{
	DECLARE_DYNAMIC(CSeniorModeDlg)

public:
	CSeniorModeDlg(VzLPRClientHandle cam, CWnd* pParent = NULL);   // 标准构造函数
	virtual ~CSeniorModeDlg();

// 对话框数据
	enum { IDD = IDD_SENSOR_TRIGER };
	VzLPRClientHandle m_cam;
protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV 支持
	virtual void Run();
	DECLARE_MESSAGE_MAP()
public:
	afx_msg void OnBnClickedBtnGetopen2();
	virtual BOOL OnInitDialog();
	void OnGetGroupInfo(bool bshow);
//	afx_msg void OnVScroll(UINT nSBCode, UINT nPos, CScrollBar* pScrollBar);
//	afx_msg BOOL OnMouseWheel(UINT nFlags, short zDelta, CPoint pt);
	afx_msg void OnBnClickedRadio1();
	afx_msg void OnBnClickedRadio2();
	int m_nCurOpenType = 0;
	afx_msg void OnBnClickedRadio4();
	afx_msg void OnBnClickedRadio7();
	afx_msg void OnBnClickedRadio5();
	afx_msg void OnBnClickedRadio3();
	afx_msg void OnBnClickedRadio6();
	afx_msg void OnBnClickedRadio8();
	afx_msg void OnBnClickedBtnSetopen();
	afx_msg void OnBnClickedBtnGetopen();
	void OnSetCurtype(bool bshow);
	afx_msg void OnBnClickedBtnSetopen2();
	afx_msg void OnBnClickedBtnRelayset1();
	void OnGetIOTime(bool bShow);
	afx_msg void OnBnClickedBtnRelayread1();
	CComboBox m_Gpio1;
	virtual BOOL PreTranslateMessage(MSG* pMsg);
};

#pragma once
#include "afxdtctl.h"
#include "afxwin.h"


// CSystemDevDlg 对话框

class CSystemDevDlg : public CDialogEx
{
	DECLARE_DYNAMIC(CSystemDevDlg)

public:
	CSystemDevDlg(VzLPRClientHandle cam, CWnd* pParent = NULL);   // 标准构造函数
	virtual ~CSystemDevDlg();

// 对话框数据
	enum { IDD = IDD_SYSTEM_DEV };

protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV 支持
	VzLPRClientHandle m_cam;
	DECLARE_MESSAGE_MAP()
public:
	afx_msg void OnBnClickedBtnReboot();
	afx_msg void OnBnClickedButton5();
	virtual BOOL OnInitDialog();
	int m_nAdingStatus = 0;
	afx_msg void OnBnClickedBtnAging();
	afx_msg void OnBnClickedBtnSave();
	afx_msg void OnBnClickedBtnGet();
	void OnGetRebootTime(bool bShow);
	CDateTimeCtrl m_RebootTime;
	virtual BOOL PreTranslateMessage(MSG* pMsg);
	afx_msg void OnBnClickedRadioType1();

	int m_nCurWorktype = 0;
	afx_msg void OnBnClickedRadioType2();
	afx_msg void OnBnClickedRadioType3();
	afx_msg void OnBnClickedBtnWorktypeSet2();
	afx_msg void OnBnClickedBtnWorktypeRead2();
	void OnGetWorkType(bool bshow);
};

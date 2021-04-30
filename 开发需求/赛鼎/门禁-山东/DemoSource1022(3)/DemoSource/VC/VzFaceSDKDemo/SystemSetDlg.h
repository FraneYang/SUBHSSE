#pragma once
#include "afxcmn.h"


// CSystemSetDlg dialog

class CSystemSetDlg : public CDialogEx
{
	DECLARE_DYNAMIC(CSystemSetDlg)

public:
	CSystemSetDlg(VzLPRClientHandle cam,CWnd* pParent = NULL);   // standard constructor
	virtual ~CSystemSetDlg();

// Dialog Data
	enum { IDD = IDD_DLG_SYSTEMSET };

protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support

	DECLARE_MESSAGE_MAP()
public:
	afx_msg void OnBnClickedBtnChooseBin();
	void StartUpdate();
	CString m_filePath = "";
	afx_msg void OnBnClickedBtnUpdate();
	VzLPRClientHandle m_cam;
	CProgressCtrl m_ProcessCtrl;
	bool m_bUpdate = false;
	afx_msg void OnClose();
	afx_msg void OnBnClickedButton1();
	afx_msg void OnBnClickedButton2();
	virtual BOOL PreTranslateMessage(MSG* pMsg);
	virtual BOOL DestroyWindow();
};

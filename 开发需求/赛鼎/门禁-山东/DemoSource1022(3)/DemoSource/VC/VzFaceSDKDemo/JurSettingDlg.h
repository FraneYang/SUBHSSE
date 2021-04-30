#pragma once
#include "DlgJurChild.h"
#include "DlgJurChildV.h"
// CJurSettingDlg 对话框

class CJurSettingDlg : public CDialogEx
{
	DECLARE_DYNAMIC(CJurSettingDlg)

public:
	CJurSettingDlg(VzLPRClientHandle cam, CWnd* pParent = NULL);   // 标准构造函数
	virtual ~CJurSettingDlg();

// 对话框数据
	enum { IDD = IDD_JUR_DETALIS };

protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV 支持

	DECLARE_MESSAGE_MAP()
public:
	afx_msg void OnBnClickedBtnGetDevName();
	VzLPRClientHandle m_cam;
	afx_msg void OnBnClickedBtnJur1();
	afx_msg void OnBnClickedBtnJur2();
	afx_msg void OnBnClickedBtnJur4();
	afx_msg void OnBnClickedBtnJur3();
	afx_msg void OnBnClickedBtnJur5();
	void SetUIBtn(int nID);
	afx_msg void OnBnClickedButton9();
	virtual BOOL OnInitDialog();
	void InitUI(int nId);
	CDlgJurChild* m_JurSettingWeek;
	CDlgJurChildV* m_JurSettingVoliday;
	UserRightsCfgs *m_Usercfs=NULL;
	afx_msg LRESULT OnUserMsg(WPARAM w, LPARAM l);
	void SetUIJurNames();
	int m_nCurJur = 0;
	int m_nCurWeek = 1;
	afx_msg void OnBnClickedBtnW1();
	void OnMsgUpdateUI();
	afx_msg void OnBnClickedBtnW2();
	afx_msg void OnBnClickedBtnW3();
	afx_msg void OnBnClickedBtnW4();
	afx_msg void OnBnClickedBtnW5();
	afx_msg void OnBnClickedBtnW6();
	afx_msg void OnBnClickedBtnW7();
	afx_msg void OnBnClickedBtnSetName2();
	afx_msg void OnBnClickedBtnGetName2();
	afx_msg void OnBnClickedBtnSetDevName();
	void CJurSettingDlg::SetJurName(int nID);
	afx_msg void OnKillfocusEdit2();
	afx_msg void OnBnClickedBtnVolidayAdd();
	afx_msg void OnBnClickedCheck1();
	virtual BOOL PreTranslateMessage(MSG* pMsg);
};

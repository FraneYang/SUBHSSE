#pragma once


// CBasicUIDlg 对话框

class CBasicUIDlg : public CDialogEx
{
	DECLARE_DYNAMIC(CBasicUIDlg)

public:
	CBasicUIDlg(VzLPRClientHandle cam, CWnd* pParent = NULL);   // 标准构造函数
	virtual ~CBasicUIDlg();
	VzLPRClientHandle m_cam;
// 对话框数据
	enum { IDD = IDD_DLG_BASIC_UI };

protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV 支持
	DECLARE_MESSAGE_MAP()
public:
	afx_msg void OnBnClickedBtnTitle();
	afx_msg void OnBnClickedButton1();
	afx_msg void OnBnClickedButton2();
	afx_msg void OnBnClickedBtnAuto();
	afx_msg void OnBnClickedBtnSet();
	afx_msg void OnBnClickedBtnGettitle();
	void GetInfo(bool bShow);
	virtual BOOL OnInitDialog();
	virtual BOOL PreTranslateMessage(MSG* pMsg);
	afx_msg void OnBnClickedBtnChose();
};

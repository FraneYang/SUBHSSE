#pragma once


// CSystemKeyDlg 对话框

class CSystemKeyDlg : public CDialogEx
{
	DECLARE_DYNAMIC(CSystemKeyDlg)

public:
	CSystemKeyDlg(VzLPRClientHandle cam, CWnd* pParent = NULL);   // 标准构造函数
	virtual ~CSystemKeyDlg();

// 对话框数据
	enum { IDD = IDD_SYSTEM_KEY };

protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV 支持

	DECLARE_MESSAGE_MAP()
public:
	afx_msg void OnBnClickedBtnEnter();
	VzLPRClientHandle m_cam;
	virtual BOOL PreTranslateMessage(MSG* pMsg);
	afx_msg void OnBnClickedBtnKey();
};

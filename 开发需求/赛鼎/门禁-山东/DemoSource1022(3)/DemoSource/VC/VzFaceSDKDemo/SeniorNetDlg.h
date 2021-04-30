#pragma once


// CSeniorNetDlg 对话框

class CSeniorNetDlg : public CDialogEx
{
	DECLARE_DYNAMIC(CSeniorNetDlg)

public:
	CSeniorNetDlg(VzLPRClientHandle cam,CWnd* pParent = NULL);   // 标准构造函数
	virtual ~CSeniorNetDlg();

// 对话框数据
	enum { IDD = IDD_DLG_SENIOR_NET };

protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV 支持

	DECLARE_MESSAGE_MAP()
public:
	afx_msg void OnBnClickedBtnIpset();
	virtual BOOL OnInitDialog();
	afx_msg void OnBnClickedBtnIpset2();
	void OnGetNetSetting(bool bshow);
	VzLPRClientHandle m_cam;
	virtual BOOL PreTranslateMessage(MSG* pMsg);
};

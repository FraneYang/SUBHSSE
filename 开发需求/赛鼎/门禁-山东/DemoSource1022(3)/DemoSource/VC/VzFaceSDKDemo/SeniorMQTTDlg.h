#pragma once


// CSeniorMQTTDlg 对话框

class CSeniorMQTTDlg : public CDialogEx
{
	DECLARE_DYNAMIC(CSeniorMQTTDlg)

public:
	CSeniorMQTTDlg(VzLPRClientHandle cam, CWnd* pParent = NULL);   // 标准构造函数
	virtual ~CSeniorMQTTDlg();

// 对话框数据
	enum { IDD = IDD_SENIOR_MQTT };
	VzLPRClientHandle m_cam;
protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV 支持

	DECLARE_MESSAGE_MAP()
public:
	afx_msg void OnBnClickedBtnSet();
	virtual BOOL OnInitDialog();
	void GetMqttInfo(bool bshow);
	virtual BOOL PreTranslateMessage(MSG* pMsg);
	afx_msg void OnTimer(UINT_PTR nIDEvent);
	afx_msg void OnBnClickedBtnChoose();
	afx_msg void OnBnClickedBtnUpdate();
	afx_msg HBRUSH OnCtlColor(CDC* pDC, CWnd* pWnd, UINT nCtlColor);
};

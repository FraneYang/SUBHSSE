#pragma once


// CSeniorMQTTDlg �Ի���

class CSeniorMQTTDlg : public CDialogEx
{
	DECLARE_DYNAMIC(CSeniorMQTTDlg)

public:
	CSeniorMQTTDlg(VzLPRClientHandle cam, CWnd* pParent = NULL);   // ��׼���캯��
	virtual ~CSeniorMQTTDlg();

// �Ի�������
	enum { IDD = IDD_SENIOR_MQTT };
	VzLPRClientHandle m_cam;
protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV ֧��

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

#pragma once


// CSeniorHttpDlg �Ի���

class CSeniorHttpDlg : public CDialogEx
{
	DECLARE_DYNAMIC(CSeniorHttpDlg)

public:
	CSeniorHttpDlg(VzLPRClientHandle cam, CWnd* pParent = NULL);   // ��׼���캯��
	virtual ~CSeniorHttpDlg();

// �Ի�������
	enum { IDD = IDD_DLG_SENIOR_HTTP };

protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV ֧��
	VzLPRClientHandle m_cam;
	DECLARE_MESSAGE_MAP()
public:
	afx_msg void OnBnClickedBtnSet();
	virtual BOOL OnInitDialog();
	afx_msg void OnBnClickedCheck1();
	void GetHttpSetting(bool bShow);
	afx_msg void OnBnClickedBtnRead();
	virtual BOOL PreTranslateMessage(MSG* pMsg);
	afx_msg void OnBnClickedRadio1();
	afx_msg void OnBnClickedRadio3();
	afx_msg void OnBnClickedRadio4();
	void EnableHeartBreatWindow(bool bShow);
	int m_nHeartBeat;
};

#pragma once


// CSeniorNetDlg �Ի���

class CSeniorNetDlg : public CDialogEx
{
	DECLARE_DYNAMIC(CSeniorNetDlg)

public:
	CSeniorNetDlg(VzLPRClientHandle cam,CWnd* pParent = NULL);   // ��׼���캯��
	virtual ~CSeniorNetDlg();

// �Ի�������
	enum { IDD = IDD_DLG_SENIOR_NET };

protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV ֧��

	DECLARE_MESSAGE_MAP()
public:
	afx_msg void OnBnClickedBtnIpset();
	virtual BOOL OnInitDialog();
	afx_msg void OnBnClickedBtnIpset2();
	void OnGetNetSetting(bool bshow);
	VzLPRClientHandle m_cam;
	virtual BOOL PreTranslateMessage(MSG* pMsg);
};

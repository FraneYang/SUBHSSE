#pragma once


// CSeniorspwgDlg �Ի���

class CSeniorspwgDlg : public CDialogEx
{
	DECLARE_DYNAMIC(CSeniorspwgDlg)

public:
	CSeniorspwgDlg(VzLPRClientHandle cam, CWnd* pParent = NULL);   // ��׼���캯��
	virtual ~CSeniorspwgDlg();

// �Ի�������
	enum { IDD = IDD_DLG_SENIOR_SPWG };

protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV ֧��

	DECLARE_MESSAGE_MAP()
public:
	afx_msg void OnBnClickedBtnSet();
//	virtual BOOL PreCreateWindow(CREATESTRUCT& cs);
	void GetInfo(bool bshow);
	virtual BOOL OnInitDialog();
	VzLPRClientHandle m_cam;
	virtual BOOL PreTranslateMessage(MSG* pMsg);
};

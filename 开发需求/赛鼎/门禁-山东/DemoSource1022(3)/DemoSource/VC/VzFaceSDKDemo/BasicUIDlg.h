#pragma once


// CBasicUIDlg �Ի���

class CBasicUIDlg : public CDialogEx
{
	DECLARE_DYNAMIC(CBasicUIDlg)

public:
	CBasicUIDlg(VzLPRClientHandle cam, CWnd* pParent = NULL);   // ��׼���캯��
	virtual ~CBasicUIDlg();
	VzLPRClientHandle m_cam;
// �Ի�������
	enum { IDD = IDD_DLG_BASIC_UI };

protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV ֧��
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

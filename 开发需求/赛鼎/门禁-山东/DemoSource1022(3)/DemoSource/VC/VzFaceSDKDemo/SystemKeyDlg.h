#pragma once


// CSystemKeyDlg �Ի���

class CSystemKeyDlg : public CDialogEx
{
	DECLARE_DYNAMIC(CSystemKeyDlg)

public:
	CSystemKeyDlg(VzLPRClientHandle cam, CWnd* pParent = NULL);   // ��׼���캯��
	virtual ~CSystemKeyDlg();

// �Ի�������
	enum { IDD = IDD_SYSTEM_KEY };

protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV ֧��

	DECLARE_MESSAGE_MAP()
public:
	afx_msg void OnBnClickedBtnEnter();
	VzLPRClientHandle m_cam;
	virtual BOOL PreTranslateMessage(MSG* pMsg);
	afx_msg void OnBnClickedBtnKey();
};

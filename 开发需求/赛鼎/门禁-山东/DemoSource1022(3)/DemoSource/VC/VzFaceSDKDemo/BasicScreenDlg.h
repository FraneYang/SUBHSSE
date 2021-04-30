#pragma once
#include "afxwin.h"
#include "afxdtctl.h"


// CBasicScreenDlg �Ի���

class CBasicScreenDlg : public CDialogEx
{
	DECLARE_DYNAMIC(CBasicScreenDlg)

public:
	CBasicScreenDlg(VzLPRClientHandle cam, CWnd* pParent = NULL);   // ��׼���캯��
	virtual ~CBasicScreenDlg();
	VzLPRClientHandle m_cam;
// �Ի�������
	enum { IDD = IDD_DLG_BASIC_SCREEN };

protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV ֧��
	DECLARE_MESSAGE_MAP()
public:
	afx_msg void OnBnClickedBtnVol();
	afx_msg void OnBnClickedScareenRead();
	void GetInfo(bool bshow);
	afx_msg void OnBnClickedScareensave();
	afx_msg void OnBnClickedBtnLoad();
	virtual BOOL OnInitDialog();
	virtual BOOL PreTranslateMessage(MSG* pMsg);
	afx_msg void OnBnClickedBtnWdrset();
	void OnGetwdr(bool bshow);
	CComboBox m_Comwdr;
	afx_msg void OnBnClickedBtnWdr();
	CDateTimeCtrl start_time_ctrl_;
	CDateTimeCtrl end_time_ctrl_;
	afx_msg void OnCbnSelchangeCombo1();
	afx_msg void OnBnClickedBtnAddLoad();
	afx_msg void OnBnClickedBtnSet();
};

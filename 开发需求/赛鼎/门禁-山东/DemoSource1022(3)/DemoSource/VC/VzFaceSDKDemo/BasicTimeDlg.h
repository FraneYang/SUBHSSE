#pragma once
#include "afxdtctl.h"


// CBasicTimeDlg �Ի���

class CBasicTimeDlg : public CDialogEx
{
	DECLARE_DYNAMIC(CBasicTimeDlg)

public:
	CBasicTimeDlg(VzLPRClientHandle cam, CWnd* pParent = NULL);   // ��׼���캯��
	virtual ~CBasicTimeDlg();

// �Ի�������
	enum { IDD = IDD_DLG_BASIC_TIME };
	enum TIMER_EN
	{
		DEVICE_TIME = 1,
		LOCALTIME,
	};
protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV ֧��
	VzLPRClientHandle m_cam;
	int m_LocalTimeIdex = 0;
	int m_DeviceTimeIdex = 0;
	DECLARE_MESSAGE_MAP()
public:
	afx_msg void OnBnClickedBtnLocadlocal();
	virtual BOOL OnInitDialog();
	afx_msg void OnTimer(UINT_PTR nIDEvent);
	afx_msg void OnBnClickedBtnLocal();
	afx_msg void OnBnClickedBtnTime();
	afx_msg void OnShowWindow(BOOL bShow, UINT nStatus);

	CDateTimeCtrl m_LocalTimeCtrl;
	CDateTimeCtrl m_DeviceTimeCtrl;
	CDateTimeCtrl m_DataCtrl;
	CDateTimeCtrl m_TimeCtrl;
	afx_msg void OnBnClickedCheck1();
	virtual BOOL PreTranslateMessage(MSG* pMsg);
	CDateTimeCtrl m_datadev;
};

#pragma once


// CRecordInfoDlg �Ի���
#include "VzFaceSDKDemoDlg.h"

class CRecordInfoDlg : public CDialogEx
{
	DECLARE_DYNAMIC(CRecordInfoDlg)

public:
	CRecordInfoDlg(TAGLIST_INFO info,CWnd* pParent = NULL);   // ��׼���캯��
	virtual ~CRecordInfoDlg();

// �Ի�������
	enum { IDD = IDD_DIALOG1 };

protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV ֧��
	TAGLIST_INFO m_info;
	DECLARE_MESSAGE_MAP()
public:
	afx_msg void OnBnClickedButton1();
	virtual BOOL OnInitDialog();
};

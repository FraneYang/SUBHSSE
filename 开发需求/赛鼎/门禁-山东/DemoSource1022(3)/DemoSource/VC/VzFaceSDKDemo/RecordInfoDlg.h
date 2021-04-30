#pragma once


// CRecordInfoDlg 对话框
#include "VzFaceSDKDemoDlg.h"

class CRecordInfoDlg : public CDialogEx
{
	DECLARE_DYNAMIC(CRecordInfoDlg)

public:
	CRecordInfoDlg(TAGLIST_INFO info,CWnd* pParent = NULL);   // 标准构造函数
	virtual ~CRecordInfoDlg();

// 对话框数据
	enum { IDD = IDD_DIALOG1 };

protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV 支持
	TAGLIST_INFO m_info;
	DECLARE_MESSAGE_MAP()
public:
	afx_msg void OnBnClickedButton1();
	virtual BOOL OnInitDialog();
};

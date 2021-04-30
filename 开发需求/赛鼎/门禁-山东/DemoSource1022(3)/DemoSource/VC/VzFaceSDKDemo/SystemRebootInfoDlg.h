#pragma once
#include "afxwin.h"


// SystemRebootInfoDlg 对话框

class SystemRebootInfoDlg : public CDialogEx
{
	DECLARE_DYNAMIC(SystemRebootInfoDlg)

public:
	SystemRebootInfoDlg(VzLPRClientHandle cam, CWnd* pParent = NULL);   // 标准构造函数
	virtual ~SystemRebootInfoDlg();

// 对话框数据
	enum { IDD = IDD_SYSTEM_REBOOTINFO };

protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV 支持
	VzLPRClientHandle m_cam;
	DECLARE_MESSAGE_MAP()
public:
	CListBox m_list;
	virtual BOOL OnInitDialog();
};

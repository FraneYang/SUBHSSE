#pragma once
#include "afxwin.h"


// SystemRebootInfoDlg �Ի���

class SystemRebootInfoDlg : public CDialogEx
{
	DECLARE_DYNAMIC(SystemRebootInfoDlg)

public:
	SystemRebootInfoDlg(VzLPRClientHandle cam, CWnd* pParent = NULL);   // ��׼���캯��
	virtual ~SystemRebootInfoDlg();

// �Ի�������
	enum { IDD = IDD_SYSTEM_REBOOTINFO };

protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV ֧��
	VzLPRClientHandle m_cam;
	DECLARE_MESSAGE_MAP()
public:
	CListBox m_list;
	virtual BOOL OnInitDialog();
};

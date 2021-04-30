#pragma once
#include "SystemDevDlg.h"
#include "SystemKeyDlg.h"
#include "SystemSetDlg.h"
#include "SystemTFDlg.h"
#include "SystemRebootInfoDlg.h"

// CFun_SystemSetDlg �Ի���

class CFun_SystemSetDlg : public CDialogEx
{
	DECLARE_DYNAMIC(CFun_SystemSetDlg)

public:
	CFun_SystemSetDlg(VzLPRClientHandle cam, CWnd* pParent = NULL);   // ��׼���캯��
	virtual ~CFun_SystemSetDlg();

// �Ի�������
	enum { IDD = IDD_FUN_SYSTEM };

protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV ֧��
	VzLPRClientHandle m_cam;
	DECLARE_MESSAGE_MAP()
public:
	afx_msg void OnBnClickedBtnDevice();
	virtual BOOL OnInitDialog();
	afx_msg void OnBnClickedBtnUpdate();
private:
	CSystemDevDlg *m_DevDlg = NULL;
	CSystemKeyDlg *m_KeyDlg = NULL;
	CSystemSetDlg * m_SetDlg = NULL;
	CSystemTFDlg *m_TFDlg = NULL;
	SystemRebootInfoDlg *m_RebootDlg = NULL;
public:
	afx_msg void OnBnClickedBtnKey();
	void OnRestUI(int nID);
	afx_msg void OnBnClickedBtnFlash();
	virtual BOOL PreTranslateMessage(MSG* pMsg);
	afx_msg void OnClose();
	afx_msg void OnBnClickedBtnUser();
	afx_msg void OnBnClickedBtnRebootinfo();
};

#pragma once
#include "afxwin.h"


// CSeniorWGDlg �Ի���

class CSeniorWGDlg : public CDialogEx
{
	DECLARE_DYNAMIC(CSeniorWGDlg)

public:
	CSeniorWGDlg(VzLPRClientHandle cam, CWnd* pParent = NULL);   // ��׼���캯��
	virtual ~CSeniorWGDlg();

// �Ի�������
	enum { IDD = IDD_DLG_SENIOR_WG };

protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV ֧��
	VzLPRClientHandle m_cam;
	DECLARE_MESSAGE_MAP()
public:
	afx_msg void OnBnClickedBtnWgset();
	afx_msg void OnBnClickedBtnRead();
	void OnGetSaveInfo(bool bshow);
	virtual BOOL OnInitDialog();
	void InsertWG(const WGAlarmRecord* alarmRecord);
	void StringtoHex(BYTE *GB, int glen, BYTE* SB, int* slen);
	afx_msg void OnBnClickedBtnSend();
	afx_msg void OnBnClickedBtnClear();
	int GetComIni(int nID);
	virtual BOOL PreTranslateMessage(MSG* pMsg);
	afx_msg void OnBnClickedBtnSendAuto();
	unsigned int m_nCurSendData = 0;
	afx_msg void OnTimer(UINT_PTR nIDEvent);
	CComboBox m_ComWGIO_;
};

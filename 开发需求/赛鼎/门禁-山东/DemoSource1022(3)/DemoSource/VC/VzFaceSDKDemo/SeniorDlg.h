#pragma once
#include "afxcmn.h"
#include "afxwin.h"


// CSeniorDlg dialog

class CSeniorDlg : public CDialogEx
{
	DECLARE_DYNAMIC(CSeniorDlg)

public:
	CSeniorDlg(VzLPRClientHandle cam,CWnd* pParent = NULL);   // standard constructor
	virtual ~CSeniorDlg();

// Dialog Data
	enum { IDD = IDD_DLG_SENIOR };

protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	VzLPRClientHandle m_cam;
	DECLARE_MESSAGE_MAP()
public:
	virtual BOOL OnInitDialog();
	int GetComIni(int nID);
	afx_msg void OnBnClickedBtnComset();
	LRESULT OnUpdateSerial(WPARAM w, LPARAM l);
	afx_msg LRESULT OnUserMsg(WPARAM w, LPARAM l);
	void OnUpdateUI(const unsigned char* data, int size);
	void OnMsgInit();
	void OnSetCom();
	void StringtoHex(BYTE *GB, int glen, BYTE* SB, int* slen);
	afx_msg void OnBnClickedBtnSend();
	afx_msg void OnClose();
	virtual BOOL PreTranslateMessage(MSG* pMsg);
	CProgressCtrl m_ProcessCtrl;
	CEdit m_EditTSerialInfo;
	CEdit m_TSerialInfo;
	afx_msg void OnBnClickedBtnClear();
};

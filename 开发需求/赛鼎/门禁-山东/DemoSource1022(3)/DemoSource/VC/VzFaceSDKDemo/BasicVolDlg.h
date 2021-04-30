#pragma once
#include "afxcmn.h"

#include "MyListCtrl.h"
// CBasicVolDlg �Ի���

class CBasicVolDlg : public CDialogEx
{
	DECLARE_DYNAMIC(CBasicVolDlg)

public:
	CBasicVolDlg(VzLPRClientHandle cam, CWnd* pParent = NULL);   // ��׼���캯��
	virtual ~CBasicVolDlg();
	VzLPRClientHandle m_cam;
// �Ի�������
	enum { IDD = IDD_DLG_BASCI_VOL };

protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV ֧��
	int m_nVol = 0;
	DECLARE_MESSAGE_MAP()
public:
	afx_msg void OnBnClickedBtnLoad();
	void GetInfo(bool bShow);
	afx_msg void OnBnClickedBtnVol();

	CString GetBroseFile();
	void UpdateWav(int nType);
	void TestAudio(int nType);
	void FactoryAudio(int nType);
	afx_msg LRESULT  OnBnClicked(WPARAM w, LPARAM p);
	CSliderCtrl m_SliderVol;
	virtual BOOL OnInitDialog();
	afx_msg void OnHScroll(UINT nSBCode, UINT nPos, CScrollBar* pScrollBar);
	CMyListCtrl m_ListCtrl;
	afx_msg void OnBnClickedBtnLoad2();
	afx_msg void OnBnClickedBtnVol2();
	virtual BOOL PreTranslateMessage(MSG* pMsg);
};

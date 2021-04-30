#include "CDriveMain.h"
#include "CDriveInfo.h"

// TestActiveXDlg.h : ͷ�ļ�
//

#pragma once


// CTestActiveXDlg �Ի���
class CTestActiveXDlg : public CDialog
{
// ����
public:
	CTestActiveXDlg(CWnd* pParent = NULL);	// ��׼���캯��

// �Ի�������
#ifdef AFX_DESIGN_TIME
	enum { IDD = IDD_TESTACTIVEX_DIALOG };
#endif

	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV ֧��
	CDriveMain mIOMain;	//�������������֮�°������е������
	COleException* mpe;
	void EventLoop();

	CDriveInfo GetDriveInfo(void);

// ʵ��
protected:
	HICON m_hIcon;

	// ���ɵ���Ϣӳ�亯��
	virtual BOOL OnInitDialog();
	afx_msg void OnPaint();
	afx_msg HCURSOR OnQueryDragIcon();
	DECLARE_MESSAGE_MAP()
public:
	afx_msg void OnBnClickedButton1();
	afx_msg void OnDestroy();
	afx_msg void OnTimer(UINT_PTR nIDEvent);
	afx_msg void OnBnClickedButton2();
	afx_msg void OnBnClickedButton3();
	afx_msg void OnBnClickedButton4();
	afx_msg void OnBnClickedButton5();


};

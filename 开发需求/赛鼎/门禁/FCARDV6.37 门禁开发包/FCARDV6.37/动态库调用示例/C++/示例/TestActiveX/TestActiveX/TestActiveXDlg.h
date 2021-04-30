#include "CDriveMain.h"
#include "CDriveInfo.h"

// TestActiveXDlg.h : 头文件
//

#pragma once


// CTestActiveXDlg 对话框
class CTestActiveXDlg : public CDialog
{
// 构造
public:
	CTestActiveXDlg(CWnd* pParent = NULL);	// 标准构造函数

// 对话框数据
#ifdef AFX_DESIGN_TIME
	enum { IDD = IDD_TESTACTIVEX_DIALOG };
#endif

	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV 支持
	CDriveMain mIOMain;	//命令操作对象，其之下包含所有的命令函数
	COleException* mpe;
	void EventLoop();

	CDriveInfo GetDriveInfo(void);

// 实现
protected:
	HICON m_hIcon;

	// 生成的消息映射函数
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

#pragma once
#include "FaceManagerDlg.h"
#include "JurSettingDlg.h"
#include "ThreadBasic.h"
// CFun_MangDlg 对话框

class CFun_MangDlg : public CDialogEx,CThreadBasic
{
	DECLARE_DYNAMIC(CFun_MangDlg)

public:
	CFun_MangDlg(VzLPRClientHandle cam, CWnd* pParent = NULL);   // 标准构造函数
	virtual ~CFun_MangDlg();

// 对话框数据
	enum { IDD = IDD_FUN_MNG_DLG };

protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV 支持

	DECLARE_MESSAGE_MAP()
public:
	afx_msg void OnBnClickedButton1();
	afx_msg void OnBnClickedBtnJur();
	VzLPRClientHandle m_cam;
	CFaceManagerDlg* FaceMng_MangDlg;
	CJurSettingDlg* FaceMng_JurSetting;
	virtual BOOL OnInitDialog();
	virtual void Run();
	void TrdInit();
	CList<int> m_listTask;
	afx_msg void OnPaint();
	virtual BOOL PreTranslateMessage(MSG* pMsg);
};

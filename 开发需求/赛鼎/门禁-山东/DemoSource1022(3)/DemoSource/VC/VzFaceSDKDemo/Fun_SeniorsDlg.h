#pragma once
#include "SeniorModeDlg.h"
#include "SeniorDlg.h"
#include "SeniorWGDlg.h"
#include "SeniorNetDlg.h"
#include "SeniorHttpDlg.h"
#include "SeniorMQTTDlg.h"
#include "SeniorspwgDlg.h"
// CFun_SeniorsDlg 对话框

class CFun_SeniorsDlg : public CDialogEx
{
	DECLARE_DYNAMIC(CFun_SeniorsDlg)

public:
	CFun_SeniorsDlg(VzLPRClientHandle cam, CWnd* pParent = NULL);   // 标准构造函数
	virtual ~CFun_SeniorsDlg();

// 对话框数据
	enum { IDD = IDD_DLG_SENSORS };

protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV 支持
	VzLPRClientHandle m_cam;
	DECLARE_MESSAGE_MAP()
public:
	afx_msg void OnBnClickedBtnWg();
	afx_msg void OnBnClickedBtnMode();
	virtual BOOL OnInitDialog();
private:
	CSeniorModeDlg *m_ModeDlg = NULL;
	CSeniorDlg     *m_SeniorDlg = NULL;
	CSeniorWGDlg   *m_SeninorWg = NULL;
	CSeniorNetDlg  *m_SeniorNetDlg = NULL;
	CSeniorHttpDlg  *m_SeniorHttpDlg = NULL;
	CSeniorMQTTDlg  *m_SeniorMQTTDlg = NULL;
	CSeniorspwgDlg  *m_SeniorSpWg = NULL;
	afx_msg void OnBnClickedBtnWg2();
	void SWHIDEAll();
	afx_msg void OnBnClickedBtnWg3();
	afx_msg void OnBnClickedBtnWg4();
	virtual BOOL PreTranslateMessage(MSG* pMsg);
	afx_msg void OnBnClickedBtnWg5();
public:
	afx_msg void OnBnClickedBtnSpwg();
};

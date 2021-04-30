#pragma once
#include "ThreadBasic.h"
#include "afxcmn.h"
#include "afxdtctl.h"
#include "MyListCtrl.h"
// CSystemTFDlg 对话框

class CSystemTFDlg : public CDialogEx,CThreadBasic
{
	DECLARE_DYNAMIC(CSystemTFDlg)
	enum
	{
		MSG_CALLBACK = 1,
		MSG_DOWNLOAD,
	};
public:
	CSystemTFDlg(VzLPRClientHandle cam, CWnd* pParent = NULL);   // 标准构造函数
	virtual ~CSystemTFDlg();
	CList<int> m_listTask;
// 对话框数据
	enum { IDD = IDD_SYSTEM_TF };
	VzLPRClientHandle m_cam;
protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV 支持
	virtual void Run();
	DECLARE_MESSAGE_MAP()
public:
	virtual BOOL OnInitDialog();
	virtual BOOL PreTranslateMessage(MSG* pMsg);
	void GetCallBack(const RecordFileNames* recordInfo);
	void UpdateUI(LPARAM l);
	afx_msg void OnBnClickedButton1();
	void OnGetDiskInfo(bool bShow);
	afx_msg void OnBnClickedButton2();
	bool OnSearch(const char* filename);
	void TrdGetFolders(bool binit=true);
	bool OnCheckEarch(const char* folder);
	CTreeCtrl m_TreeCtrl;
	HTREEITEM m_hItemCur;
	CString m_CurSelectFolder;
	afx_msg void OnDblclkTree1(NMHDR *pNMHDR, LRESULT *pResult);
	void TrdGetImgs();
	void TrdDownLoadPic();
	int ShowImg(const char* img_path);
	CDateTimeCtrl m_DateS;
	CDateTimeCtrl m_DateE;
	bool m_bSearch = false;
	afx_msg void OnSelchangedTree1(NMHDR *pNMHDR, LRESULT *pResult);
	afx_msg void OnBnClickedBtnClear();
	afx_msg void OnBnClickedButton10();
	afx_msg LRESULT OnUserMsg(WPARAM w, LPARAM l);
	CMyListCtrl m_ListCtrl;
	CString m_strDiskName = "";
	afx_msg void OnClickTree1(NMHDR *pNMHDR, LRESULT *pResult);
};

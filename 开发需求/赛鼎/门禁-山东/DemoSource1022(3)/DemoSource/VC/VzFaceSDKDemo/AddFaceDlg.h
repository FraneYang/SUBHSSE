#pragma once
#include "ThreadBasic.h"
#include "afxwin.h"

// CAddFaceDlg dialog

class CAddFaceDlg : public CDialogEx,CThreadBasic
{
	DECLARE_DYNAMIC(CAddFaceDlg)
	enum
	{
		MSG_QUERY = 1,
		MSG_UPDATEUI,
	};
public:
	CAddFaceDlg(VzLPRClientHandle cam, CString filePath, CWnd* pParent = NULL);   // standard constructor
	virtual ~CAddFaceDlg();

// Dialog Data
	enum { IDD = IDD_DLG_ADDFACE };
	virtual void Run();
	CList<int> m_listTask;
protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	VzLPRClientHandle m_cam;
	CString m_filePath;
	DECLARE_MESSAGE_MAP()
public:
	afx_msg void OnBnClickedButton2();
	void SetData(QueryFaceInfoEx* pInfo);
	void TrdInitUI();
	virtual BOOL OnInitDialog();
	bool ShowPic(CString strfile);
	afx_msg void OnStnClickedPic();
	afx_msg void OnBnClickedBtnCancel();
	afx_msg void OnPaint();
	void UpdataInfo(const QueryFaceInfoEx* faceQueryInfo);
	LRESULT OnUserMsg(WPARAM w, LPARAM l);
	void ShowQueryResult(LPARAM l);
	CComboBox m_ComType;
	CComboBox m_ComJur;
	QueryFaceInfoEx* m_faceInfo = NULL;
	int m_nType = 0;
};

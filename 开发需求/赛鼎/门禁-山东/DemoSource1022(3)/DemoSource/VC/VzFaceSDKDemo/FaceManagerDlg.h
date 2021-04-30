#pragma once
#include "afxcmn.h"
#include "zbx_sdk.h"
#include "afxwin.h"
#include "MyListCtrl.h"
#include "afxdtctl.h"
// CFaceManagerDlg 对话框

enum
{
	MSG_QUERY = 1,
	MSG_UPDATEUI,
};
class CFaceManagerDlg : public CDialogEx
{
	DECLARE_DYNAMIC(CFaceManagerDlg)

public:
	CFaceManagerDlg(VzLPRClientHandle cam, CWnd* pParent = NULL);   // 标准构造函数
	virtual ~CFaceManagerDlg();

// 对话框数据
#ifdef AFX_DESIGN_TIME
	enum { IDD = IDD_DLG_FACE_MANAGER };
#endif

protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV 支持
	VzLPRClientHandle m_cam;
	DECLARE_MESSAGE_MAP()

	afx_msg LRESULT  OnBnClicked(WPARAM w, LPARAM p);
	afx_msg LRESULT OnUserMsg(WPARAM w, LPARAM l);
public:
	CMyListCtrl m_lstFace;
	virtual BOOL OnInitDialog();
	void UpdataInfo(const QueryFaceInfoEx* faceQueryInfo);
	CString GetFaceType(int nType);
	void deleteFaceMap(int nIdex = -1);
	afx_msg void OnBnClickedBtnQuery();
	void ShowQueryResult(LPARAM l);
	int m_nPage = -1;
	CString m_sModelPath;
//	afx_msg void OnItemchangedListFace(NMHDR *pNMHDR, LRESULT *pResult);
	int ShowImg(const char* img_path, int wnd_id);
	afx_msg void OnBnClickedBtnGoto();
	afx_msg void OnBnClickedBtnFirst();
	afx_msg void OnBnClickedBtnPre();
	afx_msg void OnBnClickedBtnLast();
	afx_msg void OnBnClickedBtnDelall();
	void DeleteListItem(int nIdex);
	void DeletePic();
	afx_msg void OnBnClickedBtnNext();
	void UpdateButton(int nReq);
	virtual BOOL PreTranslateMessage(MSG* pMsg);
	afx_msg void OnBnClickedBtnAdd();
	afx_msg void OnBnClickedLoadpic2();
	afx_msg void OnBnClickedBtnSelect2();
	afx_msg void OnBnClickedBtnEdit2();
	afx_msg void OnBnClickedBtnImport2();
	afx_msg void OnBnClickedBtnStop();
	int GetTypeIndex(const CString cType, const CString fileName, char * CReqType);
	void UpdateUI();
	void ShowMessageBox();
	void UpdateUiMsg();
	std::vector<CString> m_fileVector;
	int m_nPerIndex;
	int m_nSucceed = 0;
	int m_nFail = 0;
	int m_nCount = 0;
	
	bool m_bThreaStatus=false;
	CString m_strFormat = "";
	CProgressCtrl m_Process;
	afx_msg void OnClose();
	afx_msg void OnSysCommand(UINT nID, LPARAM lParam);
	int m_Timer = 0;
	afx_msg void OnTimer(UINT_PTR nIDEvent);
	CComboBox m_ComType;
	CComboBox m_ComJur;
//	afx_msg void OnDblclkListFace(NMHDR *pNMHDR, LRESULT *pResult);
	afx_msg void OnBnClickedCheck1();
	//afx_msg void OnSelendokCombo2();
	void OnSyncUserRightCfgs();
	std::map<int, QueryFaceInfoEx*> m_mapFaceInfo;
//	afx_msg void OnClickListFace(NMHDR *pNMHDR, LRESULT *pResult);
//	afx_msg void OnLButtonDown(UINT nFlags, CPoint point);
	CComboBox m_ComJurBatch;
	CComboBox m_ComTypeBatch;
	CDateTimeCtrl m_DateS;
	CDateTimeCtrl m_DateE;
};

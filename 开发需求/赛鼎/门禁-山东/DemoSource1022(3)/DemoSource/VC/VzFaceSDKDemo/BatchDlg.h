#pragma once
#include "afxwin.h"
#include "afxcmn.h"

#include <vector>
#include <unordered_map>
#include <map>
#include <mutex>
#include "ThreadBasic.h"
// CBatchDlg dialog

enum msg_type
{
	MSG_DEV_FOUND = 1,
	MSG_CONNECT,
	MSG_CONNECTERROR,
	MSG_UPDATE_START,
	MSG_UPDATE_OK,
	MSG_UPDATE_ERROR,
	MSG_OLDER_START,
	MSG_OLDER_FAIL,
	MSG_OLDER_END,
	MSG_OLDER_STOPSTART,
	MSG_OLDER_STOPFAIL,
	MSG_OLDER_STOPEND,
};
class CBatchDlg : public CDialogEx,CThreadBasic
{
	DECLARE_DYNAMIC(CBatchDlg)

public:	
	CBatchDlg(CWnd* pParent = NULL);   // standard constructor
	virtual ~CBatchDlg();

// Dialog Data
	enum { IDD = IDD_DLG_IMPORT };

protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	virtual void Run();    // DDX/DDV support
	void TrdBatchOld();
	void TrdBatchOldStop();
	CList<int> m_listTask;
	DECLARE_MESSAGE_MAP()
public:
	struct msg_struct{
		int ListIndex;
		msg_type msgType;
	};

	CComboBox m_Comx;
	CListCtrl m_ListCtrl;
	afx_msg void OnSelchangeCombo1();
	afx_msg void OnColumnclickList1(NMHDR *pNMHDR, LRESULT *pResult);
	afx_msg void OnItemchangedList1(NMHDR *pNMHDR, LRESULT *pResult);
	virtual BOOL OnInitDialog();
	void SetCamera(const ipscan_t* ipscan);
	void OnDeviceFound(LPARAM l);
	afx_msg LRESULT OnUserMsg(WPARAM w, LPARAM l);
	void AutoAdjustColumnWidth(CListCtrl *pListCtrl);
	std::vector<ipscan_t*> m_ipscan;
	std::unordered_map<int, std::string> m_unorder;

	std::map<int, std::string> m_mapChecked;
	std::map<int, SystemNetInfo*> m_mapInfo;
	std::vector<int> m_vector_index;
	//当前升级的IP
	int m_nCurIp;
	int m_nEndIp;
	CString	m_strIp;
	bool m_bCheckAll = false;
	bool m_bThread = false;
	CString m_filePath = "";
	std::mutex m_mutex;
	afx_msg void OnBnClickedBtnNet();
	afx_msg void OnBnClickedButton10();
	afx_msg void OnBnClickedBtnSelect();
	void UpdataThread();
	afx_msg void OnClose();
	virtual BOOL PreTranslateMessage(MSG* pMsg);
	afx_msg void OnBnClickedBtnSearch();
	afx_msg void OnNMDblclkList1(NMHDR *pNMHDR, LRESULT *pResult);
	afx_msg void OnBnClickedButton1();
	afx_msg void OnBnClickedButton14();
	afx_msg void OnBnClickedBtnInit();
};

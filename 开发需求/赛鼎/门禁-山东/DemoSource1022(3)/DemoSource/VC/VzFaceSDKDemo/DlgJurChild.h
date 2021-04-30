#pragma once


// CDlgJurChild 对话框

class CDlgJurChild : public CDialogEx
{
	DECLARE_DYNAMIC(CDlgJurChild)
	
public:
	CDlgJurChild(CWnd* pParent = NULL);   // 标准构造函数
	virtual ~CDlgJurChild();

// 对话框数据
	enum { IDD = IDD_DLG_JURCHILD };

protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV 支持

	DECLARE_MESSAGE_MAP()
public:
	virtual BOOL OnInitDialog();
	void initVol();
	afx_msg void OnSize(UINT nType, int cx, int cy);
	virtual void PreInitDialog();	
public:
//	afx_msg int OnCreate(LPCREATESTRUCT lpCreateStruct);
//	afx_msg void OnHScroll(UINT nSBCode, UINT nPos, CScrollBar* pScrollBar);
	afx_msg void OnVScroll(UINT nSBCode, UINT nPos, CScrollBar* pScrollBar);
	void AddItem();
	void SetUIInit();
	void SetData(SecTimeSlots* timeslots);
	void SetChildData(int nId, CTime t, CTime s);
	SecTimeSlots* m_TimeSlots;
	//bInit  0 默认 1 添加项 2显示
	void ShowUI(int nID, bool bShow, int bInit = 0);
private:
	int m_nCurType = 1;
	int m_nCurIndex = 0;
	//当前操作的结构体中的下标
	int m_nCurUserIndex = 0;
public:

	afx_msg void OnBnClickedBtn1();
	afx_msg void OnBnClickedBtn2();
	void DeletePos(int nPos);
	afx_msg void OnBnClickedBtn3();
	afx_msg void OnBnClickedBtn4();
	afx_msg void OnBnClickedBtn5();
	afx_msg void OnBnClickedBtn6();
	afx_msg void OnBnClickedBtn7();
	afx_msg void OnBnClickedBtn8();
	afx_msg void OnBnClickedBtn9();
	afx_msg void OnBnClickedBtn10();
	void DeleteTime(int nId);
	afx_msg void OnKillFocus(CWnd* pNewWnd);
//	afx_msg void OnKillfocusTime1(NMHDR *pNMHDR, LRESULT *pResult);
	afx_msg void OnThemechangedTime1(NMHDR *pNMHDR, LRESULT *pResult);
	afx_msg void OnThemechangedTime2(NMHDR *pNMHDR, LRESULT *pResult);
	afx_msg void OnThemechangedTime3(NMHDR *pNMHDR, LRESULT *pResult);
	afx_msg void OnThemechangedTime4(NMHDR *pNMHDR, LRESULT *pResult);
	afx_msg void OnThemechangedTime5(NMHDR *pNMHDR, LRESULT *pResult);
	afx_msg void OnThemechangedTime6(NMHDR *pNMHDR, LRESULT *pResult);
	afx_msg void OnThemechangedTime7(NMHDR *pNMHDR, LRESULT *pResult);
	afx_msg void OnThemechangedTime8(NMHDR *pNMHDR, LRESULT *pResult);
	afx_msg void OnThemechangedTime9(NMHDR *pNMHDR, LRESULT *pResult);
	afx_msg void OnThemechangedTime10(NMHDR *pNMHDR, LRESULT *pResult);

	//afx_msg void OnThemechangedTimeE1(NMHDR *pNMHDR, LRESULT *pResult);
	afx_msg void OnThemechangedTimeE1(NMHDR *pNMHDR, LRESULT *pResult);
	afx_msg void OnThemechangedTimeE2(NMHDR *pNMHDR, LRESULT *pResult);
	afx_msg void OnThemechangedTimeE3(NMHDR *pNMHDR, LRESULT *pResult);
	afx_msg void OnThemechangedTimeE4(NMHDR *pNMHDR, LRESULT *pResult);
	afx_msg void OnThemechangedTimeE5(NMHDR *pNMHDR, LRESULT *pResult);
	afx_msg void OnThemechangedTimeE6(NMHDR *pNMHDR, LRESULT *pResult);
	afx_msg void OnThemechangedTimeE7(NMHDR *pNMHDR, LRESULT *pResult);
	afx_msg void OnThemechangedTimeE8(NMHDR *pNMHDR, LRESULT *pResult);
	afx_msg void OnThemechangedTimeE9(NMHDR *pNMHDR, LRESULT *pResult);
	afx_msg void OnThemechangedTimeE10(NMHDR *pNMHDR, LRESULT *pResult);
	virtual BOOL PreTranslateMessage(MSG* pMsg);
};

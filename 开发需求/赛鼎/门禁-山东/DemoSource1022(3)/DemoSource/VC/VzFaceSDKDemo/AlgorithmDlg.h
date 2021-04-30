#pragma once
#include "afxwin.h"

#include "ThreadBasic.h"
#include "afxcmn.h"

// CAlgorithmDlg dialog

class CAlgorithmDlg : public CDialogEx,CThreadBasic
{
	struct UIData 
	{
		int bActive;  //活体
		int SaftHad;  //安全帽检测
		int saftpass;//未带禁止通行
		int WaterMar;//图片水印
		int FaceShow;//人脸框
		int OutputCtl;//大脸模式
		float RecoDistmin;//识别距离小
		float RecoDistmax;   //识别距离大
		int angle;  //最大识别角度
		int ModelS; //模板相似度
		int IdcardS; //身份证相似度
		int Rep;//去重复

		UIData(){
			memset(this, 0, sizeof(UIData));
		}
	};


	DECLARE_DYNAMIC(CAlgorithmDlg)
	enum MyEnum
	{
		MSG_INIT=1,
		MSG_SAVE,
	};
public:
	CAlgorithmDlg(VzLPRClientHandle cam,CWnd* pParent = NULL);   // standard constructor
	virtual ~CAlgorithmDlg();

// Dialog Data
	enum { IDD = IDD_DLG_ALGORITHM };

protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	virtual void Run();    // DDX/DDV support
	CList<int> m_listTask;
	VzLPRClientHandle m_cam;
	DECLARE_MESSAGE_MAP()
public:
//	afx_msg void OnBnClickedBtnReset();
	afx_msg LRESULT OnUserMsg(WPARAM w, LPARAM l);
//	afx_msg void OnBnClickedBtnSimilarset();
//	afx_msg void OnBnClickedBtnSave();
	afx_msg void OnBnClickedBtnResult();
	virtual BOOL OnInitDialog();
	virtual BOOL PreTranslateMessage(MSG* pMsg);
	afx_msg void OnBnClickedRadio2();
	afx_msg void OnBnClickedRadio1();
	bool m_bPushMode = false;
//	afx_msg void OnBnClickedBtnIdcard();
//	afx_msg void OnBnClickedBtnReset2();
//	afx_msg void OnBnClickedBtnSimilarset2();
//	afx_msg void OnBnClickedBtnIdcard2();
//	afx_msg void OnBnClickedBtnSave2();
	afx_msg void OnBnClickedBtnResult2();
//	afx_msg void OnBnClickedBtnDistread();
//	afx_msg void OnBnClickedBtnDistset();
	CComboBox m_ComMin;
	CComboBox m_ComMax;
	afx_msg void OnBnClickedCheckSafety();
	afx_msg void OnBnClickedBtnRead();
	afx_msg void OnBnClickedBtnIdcard();

	BOOL m_bRead = false;
	UIData m_stData;
	afx_msg void OnHScroll(UINT nSBCode, UINT nPos, CScrollBar* pScrollBar);
	CSliderCtrl m_Slider;
	int m_nVol = 0;
	afx_msg void OnTimer(UINT_PTR nIDEvent);
};

#pragma once


// CSetPicFormatDlg dialog

class CSetPicFormatDlg : public CDialogEx
{
	DECLARE_DYNAMIC(CSetPicFormatDlg)

public:
	CSetPicFormatDlg(CWnd* pParent = NULL);   // standard constructor
	virtual ~CSetPicFormatDlg();

// Dialog Data
	enum { IDD = IDD_DLG_PICFORMAT };

protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support

	DECLARE_MESSAGE_MAP()
public:
	afx_msg void OnBnClickedButton1();
	void SetInfo(CString info);
	CString m_strFormat = "";
	void GetFormat(CString &format);
	afx_msg void OnBnClickedButton10();
	afx_msg void OnBnClickedButton2();
	afx_msg void OnBnClickedBtnSave();
	afx_msg void OnBnClickedButton12();
	afx_msg void OnBnClickedButton17();
	afx_msg void OnBnClickedButton15();
};

#pragma once


// CDlgPicSavePath 对话框

class CDlgPicSavePath : public CDialogEx
{
	DECLARE_DYNAMIC(CDlgPicSavePath)

public:
	CDlgPicSavePath(CString curPath,CWnd* pParent = NULL);   // 标准构造函数
	virtual ~CDlgPicSavePath();

// 对话框数据
	enum { IDD = IDD_DLG_PICPATHSET };
	void GetChangePath(CString &strPath);
protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV 支持
	CString m_curPath;
	DECLARE_MESSAGE_MAP()
public:
	afx_msg void OnBnClickedButton1();
	virtual BOOL OnInitDialog();
};

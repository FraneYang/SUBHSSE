#pragma once


// CDlgPicSavePath �Ի���

class CDlgPicSavePath : public CDialogEx
{
	DECLARE_DYNAMIC(CDlgPicSavePath)

public:
	CDlgPicSavePath(CString curPath,CWnd* pParent = NULL);   // ��׼���캯��
	virtual ~CDlgPicSavePath();

// �Ի�������
	enum { IDD = IDD_DLG_PICPATHSET };
	void GetChangePath(CString &strPath);
protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV ֧��
	CString m_curPath;
	DECLARE_MESSAGE_MAP()
public:
	afx_msg void OnBnClickedButton1();
	virtual BOOL OnInitDialog();
};

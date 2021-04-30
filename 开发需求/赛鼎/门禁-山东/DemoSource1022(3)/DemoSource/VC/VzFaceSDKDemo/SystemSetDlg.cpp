// SystemSetDlg.cpp : implementation file
//

#include "stdafx.h"
#include "VzFaceSDKDemo.h"
#include "SystemSetDlg.h"
#include "afxdialogex.h"


// CSystemSetDlg dialog

bool bSet = false;
static VOID ThreadAddFace(LPVOID lpParam){
	if (lpParam)
	{
		CSystemSetDlg* dlg = (CSystemSetDlg*)lpParam;
		dlg->StartUpdate();
	}
}

static int UpdataProcessCallback(const void* user_data,
	double rDlTotal,
	double rDlNow,
	double rUlTotal,
	double rUlNow){

	if ((!rUlTotal) && (!rUlNow))
	{
		return 0;
	}
	int pro = rUlNow * 100 / rUlTotal;
	CString strPro;
	strPro.Format("%d", pro);
	strPro += "%";
	CSystemSetDlg* dlgthis = (CSystemSetDlg*)user_data;	
	if (!bSet)
	{
		dlgthis->m_ProcessCtrl.SetRange(0, 100);
		bSet = true;
	}
	if (dlgthis)
	{
		dlgthis->GetDlgItem(IDC_PROCESS)->SetWindowText(strPro);
		dlgthis->m_ProcessCtrl.SetPos(pro);
		//gthis->m_ProcessCtrl.StepIt();
	}
	return 0;
}
IMPLEMENT_DYNAMIC(CSystemSetDlg, CDialogEx)

CSystemSetDlg::CSystemSetDlg(VzLPRClientHandle cam, CWnd* pParent /*=NULL*/)
	: CDialogEx(CSystemSetDlg::IDD, pParent)
{
	m_cam = cam;
}

CSystemSetDlg::~CSystemSetDlg()
{
}

void CSystemSetDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialogEx::DoDataExchange(pDX);
	DDX_Control(pDX, IDC_PROGRESS1, m_ProcessCtrl);
}


BEGIN_MESSAGE_MAP(CSystemSetDlg, CDialogEx)
	ON_BN_CLICKED(IDC_BTN_CHOOSE_BIN, &CSystemSetDlg::OnBnClickedBtnChooseBin)
	ON_BN_CLICKED(IDC_BTN_UPDATE, &CSystemSetDlg::OnBnClickedBtnUpdate)
	ON_WM_CLOSE()
	ON_BN_CLICKED(IDC_BUTTON1, &CSystemSetDlg::OnBnClickedButton1)
	ON_BN_CLICKED(IDC_BUTTON2, &CSystemSetDlg::OnBnClickedButton2)
END_MESSAGE_MAP()


// CSystemSetDlg message handlers


void CSystemSetDlg::OnBnClickedBtnChooseBin()
{
	// TODO: Add your control notification handler code here
	LPCTSTR lpszFilter = "bin files(*.bin;*.BIN;*.Bin) | *.bin;*.BIN,*.Bin | All Files (*.*) |*.*||";
	CFileDialog dlg(TRUE, lpszFilter, NULL, OFN_HIDEREADONLY | OFN_OVERWRITEPROMPT, lpszFilter, NULL);
	CString filepath;
	CFile file;
	//打开文件对话框
	if (dlg.DoModal() == IDOK)
	{
		filepath = dlg.GetPathName();
		if (!PathFileExists(filepath))
		{
			AfxMessageBox("请选择文件");
		}
		GetDlgItem(IDC_EDITBIN)->SetWindowTextA(filepath);
	}
}


void CSystemSetDlg::StartUpdate(){
	bool bSet = false;
	if (!m_cam)
	{
		AfxMessageBox("请先连接相机");
		return;
	}
	ZBX_SetUpdateSystem_CB(m_cam, (ZBX_HTTPRESULT_PROCESS)UpdataProcessCallback, this);
	int iRet = ZBX_UpdateSystem(m_cam, m_filePath.GetBuffer());
	m_filePath.ReleaseBuffer();
	if (iRet == 0){
		AfxMessageBox("升级完成 设备即将重启");
		m_bUpdate = false;
	}
	else
	{
		AfxMessageBox("升级失败 请重试");
		m_bUpdate = false;
	}

}

void CSystemSetDlg::OnBnClickedBtnUpdate()
{
	// TODO: Add your control notification handler code here
	CString filepath;
	GetDlgItem(IDC_EDITBIN)->GetWindowTextA(filepath);
	if (!PathFileExists(filepath))
	{
		AfxMessageBox("文件不存在");
	}
	m_filePath = filepath;
	m_bUpdate = true;
	AfxBeginThread((AFX_THREADPROC)ThreadAddFace, this);
}

void CSystemSetDlg::OnClose()
{
	// TODO: Add your message handler code here and/or call default
	if (m_bUpdate)
	{
		return;
	}
	CDialogEx::OnClose();
}

void CSystemSetDlg::OnBnClickedButton1()
{
	// TODO:  在此添加控件通知处理程序代码
	int nRet = ZBX_Trigger(m_cam, NULL);
	if (!nRet)
	{
		AfxMessageBox("开闸成功");
	}
	else
	{
		AfxMessageBox("开闸失败");
	}
}


void CSystemSetDlg::OnBnClickedButton2()
{
	// TODO:  在此添加控件通知处理程序代码
}


BOOL CSystemSetDlg::PreTranslateMessage(MSG* pMsg)
{
	// TODO:  在此添加专用代码和/或调用基类
	if (pMsg->message == WM_KEYDOWN)	{
		switch (pMsg->wParam)		{
		case VK_ESCAPE: //Esc按键事件				
			return true;
		case VK_RETURN: //Enter按键事件				
			return true;
		default:
			;
		}
	}
	return CDialogEx::PreTranslateMessage(pMsg);
}


BOOL CSystemSetDlg::DestroyWindow()
{
	// TODO:  在此添加专用代码和/或调用基类
	if (m_bUpdate)
	{
		AfxMessageBox("正在升级中。。。请稍后");
		return 1l;
	}
	return CDialogEx::DestroyWindow();
}

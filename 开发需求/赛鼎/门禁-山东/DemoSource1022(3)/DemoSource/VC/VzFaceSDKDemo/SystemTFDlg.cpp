// SystemTFDlg.cpp : ʵ���ļ�
//

#include "stdafx.h"
#include "VzFaceSDKDemo.h"
#include "SystemTFDlg.h"
#include "afxdialogex.h"
#include <regex>

// CSystemTFDlg �Ի���

IMPLEMENT_DYNAMIC(CSystemTFDlg, CDialogEx)

CSystemTFDlg::CSystemTFDlg(VzLPRClientHandle cam, CWnd* pParent /*=NULL*/)
	: CDialogEx(CSystemTFDlg::IDD, pParent)
{
	m_cam = cam;
}

CSystemTFDlg::~CSystemTFDlg()
{
	StopThread();
}

void CSystemTFDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialogEx::DoDataExchange(pDX);
	DDX_Control(pDX, IDC_TREE1, m_TreeCtrl);
	DDX_Control(pDX, IDC_DATETIMEPICKER1, m_DateS);
	DDX_Control(pDX, IDC_DATETIMEPICKER7, m_DateE);
	DDX_Control(pDX, IDC_LIST1, m_ListCtrl);
}


void CSystemTFDlg::Run()
{
	int iCmd = -1;
	if (m_listTask.IsEmpty())
		return;

	iCmd = m_listTask.RemoveHead();
	if (iCmd == 1)
	{
		TrdGetFolders();
	}
	else if (iCmd == 2)
	{
		TrdGetImgs();
	}
	else if (iCmd == 3)
	{
		TrdGetFolders(false);
	}
	else if (iCmd == 4)
	{
		TrdDownLoadPic();
	}
}

BEGIN_MESSAGE_MAP(CSystemTFDlg, CDialogEx)
	ON_BN_CLICKED(IDC_BUTTON1, &CSystemTFDlg::OnBnClickedButton1)
	ON_BN_CLICKED(IDC_BUTTON2, &CSystemTFDlg::OnBnClickedButton2)
	ON_NOTIFY(NM_DBLCLK, IDC_TREE1, &CSystemTFDlg::OnDblclkTree1)
	ON_NOTIFY(TVN_SELCHANGED, IDC_TREE1, &CSystemTFDlg::OnSelchangedTree1)
	ON_BN_CLICKED(IDC_BTN_CLEAR, &CSystemTFDlg::OnBnClickedBtnClear)
	ON_BN_CLICKED(IDC_BUTTON10, &CSystemTFDlg::OnBnClickedButton10)
	ON_MESSAGE(WM_USER_MSG_TF, &CSystemTFDlg::OnUserMsg)
	ON_NOTIFY(NM_CLICK, IDC_TREE1, &CSystemTFDlg::OnClickTree1)
END_MESSAGE_MAP()


// CSystemTFDlg ��Ϣ�������


BOOL CSystemTFDlg::OnInitDialog()
{
	CDialogEx::OnInitDialog();

	// TODO:  �ڴ���Ӷ���ĳ�ʼ��
	StartThread(0, 300);
	m_listTask.AddHead(1);
	ZBX_RegTFRecordCb(m_cam, [](ZBX_Cam* cam,
		const RecordFileNames* recordInfo,
		void* usrParam){
		if (usrParam)
		{
			CSystemTFDlg* dlg = (CSystemTFDlg*)usrParam;
			dlg->GetCallBack(recordInfo);
		}
	}, this);

	m_DateS.SetFormat("yyyy-MM-dd HH:mm:ss");
	m_DateE.SetFormat("yyyy-MM-dd HH:mm:ss");//����Ϊ��׼��ʱ���ʽ

	m_ListCtrl.SetHeadHeight(1.5);
	m_ListCtrl.SetRowHeigt(40);
	m_ListCtrl.SetLineSelectMode(true);
	m_ListCtrl.InsertColumn(0, "״̬", DT_CENTER, 170);
	m_ListCtrl.InsertColumn(1, "�ܹ�", DT_CENTER, 170);
	m_ListCtrl.InsertColumn(2, "����", DT_CENTER, 170);
	m_ListCtrl.InsertColumn(3, "ʣ��", DT_CENTER, 170);
	m_ListCtrl.SetExtendedStyle(LVS_EX_FULLROWSELECT | LVS_EX_HEADERDRAGDROP | LVS_EX_GRIDLINES);
	m_ListCtrl.EnableWindow(FALSE);
	//TrdGetFolders();
	OnGetDiskInfo(false);
	return TRUE;  // return TRUE unless you set the focus to a control
	// �쳣:  OCX ����ҳӦ���� FALSE
}


BOOL CSystemTFDlg::PreTranslateMessage(MSG* pMsg)
{
	// TODO:  �ڴ����ר�ô����/����û���
	if (pMsg->message == WM_KEYDOWN)	{
		switch (pMsg->wParam)		{
		case VK_ESCAPE: //Esc�����¼�				
			return true;
		case VK_RETURN: //Enter�����¼�				
			return true;
		default:
			;
		}
	}
	return CDialogEx::PreTranslateMessage(pMsg);
}


void CSystemTFDlg::GetCallBack(const RecordFileNames* recordInfo){
	if (!recordInfo)
	{
		return;
	}
	RecordFileNames *face_info = (RecordFileNames *)malloc(sizeof(RecordFileNames));
	memset(face_info, 0, sizeof(RecordFileNames));
	memcpy(face_info, recordInfo, sizeof(RecordFileNames));	
	PostMessage(WM_USER_MSG_TF, (WPARAM)MSG_CALLBACK, (LPARAM)face_info);
}
void CSystemTFDlg::UpdateUI(LPARAM l){
	RecordFileNames* recordInfo = (RecordFileNames*)l;
	for (auto i : recordInfo->Recordfiles)
	{
		CString str = i;
		if (str.IsEmpty())
		{
			break;
		}
		CString strName = util::Convert<util::ascii>(i).c_str();
		CString strFind;
		GetDlgItem(IDC_EDIT1)->GetWindowTextA(strFind);
		if (-1 == strName.Find(strFind) && (!strFind.IsEmpty()))
		{
			continue;
		}
		if (m_bSearch)
		{
			if (OnSearch(strName))
			{
				m_TreeCtrl.InsertItem(strName, m_hItemCur);
				continue;
			}
		}
		else{
			m_TreeCtrl.InsertItem(strName, m_hItemCur);
		}
	}
	this->EnableWindow(TRUE);
	m_TreeCtrl.Expand(m_hItemCur,TVE_EXPAND);
	free(recordInfo);
}
void CSystemTFDlg::OnBnClickedButton1()
{
	// TODO:  �ڴ���ӿؼ�֪ͨ����������
	OnGetDiskInfo(true);
}

void CSystemTFDlg::OnGetDiskInfo(bool bShow){
	m_ListCtrl.DeleteAllItems();
	tf_diskinfo diskinfo;
	int nRet = ZBX_QueryDiskInfo(m_cam, &diskinfo);
	if (nRet==0)
	{
		int nItem = m_ListCtrl.InsertItem(0,"");
		CString str;
		str.Format("%d(MB)", diskinfo.dev.total);
		m_ListCtrl.SetItemText(0, 1, str);
		str.Format("%d(MB)", diskinfo.dev.used);
		m_ListCtrl.SetItemText(0, 2, str);
		str.Format("%d(MB)", diskinfo.dev.left);
		m_ListCtrl.SetItemText(0, 3, str);
		//����״̬:1 = δ��ʽ��, 2 = δ����, 3 = ���ڸ�ʽ��, 4 = ����ɾ��, 5 = ��������, 6 = ֻ��
		switch (diskinfo.dev.partstate)
		{
		case 1:
			str = "δ��ʽ��";
			break;
		case 2:
			str = "δ����";
			break;
		case 3:
			str = "���ڸ�ʽ��";
			break;
		case 4:
			str = "����ɾ��";
			break;
		case 5:
			str = "��������";
			break;
		case 6:
			str = "ֻ��";
			break;
		default:
			break;
		}
		m_ListCtrl.SetItemText(0,0, str);
		m_strDiskName = diskinfo.dev.partname;
		if (bShow)
		{
			AfxMessageBox("��ȡ�ɹ�");
		}
	}
	else
	{
		if (bShow)
		{
			AfxMessageBox("��ȡʧ��");
		}
	}
	
}
void CSystemTFDlg::OnBnClickedButton2()
{
	// TODO:  �ڴ���ӿؼ�֪ͨ����������
	
	CTime ts, te;
	//SYSTEMTIME  ts, te;
	m_DateS.GetTime(ts);
	m_DateE.GetTime(te);
	if (ts>te)
	{
		AfxMessageBox("��ѡ����ȷ��ʱ��");
		return;
	}
	m_bSearch = true;
	m_hItemCur = NULL;
	m_TreeCtrl.DeleteAllItems();
	CString strpicPath;
	ShowImg("");
	this->EnableWindow(FALSE);
	m_listTask.AddHead(3);
}

bool CSystemTFDlg::OnSearch(const char* filename){
	CTime ts, te;
	//SYSTEMTIME  ts, te;
	m_DateS.GetTime(ts);
	m_DateE.GetTime(te);
	CString str;
	CString strItem=m_TreeCtrl.GetItemText(m_hItemCur);
	int nYear,nMon,nDay,nHour, nMin, nSed,nStatus;
	sscanf(filename, "%02d%02d%02d%02d_%s", &nHour, &nMin, &nSed, &nStatus,str);
	sscanf(strItem, "%04d_%02d_%02d", &nYear, &nMon, &nDay);
	CTime tm(nYear, nMon, nDay, nHour, nMin, nSed);
	if ((tm >= ts) && (tm <= te))
	{
		return true;
	}
	return false;
}


void CSystemTFDlg::TrdGetFolders(bool binit){
	RecordFolders floders;
	int nRet = ZBX_GetTFFolders(m_cam, &floders);
	for (auto i : floders.FolderNames)
	{
		CString str = i;
		const std::regex pattern("^[1-9]\\d\\d\\d_\\d\\d_\\d\\d*");
		if (!std::regex_match(i, pattern))
		{
			continue;
		}		
		if (str.IsEmpty())
		{
			break;
		}
		if (binit)
		{
			m_TreeCtrl.InsertItem(i);
		}
		else
		{
			if (OnCheckEarch(str))
			{
				m_TreeCtrl.InsertItem(i);
			}
		}
	}
	this->EnableWindow(TRUE);
}

bool CSystemTFDlg::OnCheckEarch(const char* folder){
	CTime ts, te;
	m_DateS.GetTime(ts);
	m_DateE.GetTime(te);
	CString str = folder;
	int nYear, nMonth, nDay;
	sscanf(str, "%d_%d_%d", &nYear, &nMonth, &nDay);
	CTime tm(nYear, nMonth, nDay, 0, 0, 0, 0);

	CTime ts2(ts.GetYear(), ts.GetMonth(), ts.GetDay(), 0, 0, 0);
	CTime te2(te.GetYear(), te.GetMonth(), te.GetDay(), 0, 0, 0);
	if ((tm >= ts2) && (tm <= te2))
	{
		return true;
	}
	return false;
}
void CSystemTFDlg::OnDblclkTree1(NMHDR *pNMHDR, LRESULT *pResult)
{
	// TODO:  �ڴ���ӿؼ�֪ͨ����������
	CPoint pt;
	UINT u32Flag = 0;
	GetCursorPos(&pt);
	m_TreeCtrl.ScreenToClient(&pt);
	HTREEITEM item = m_TreeCtrl.HitTest(pt, &u32Flag);
	if (m_TreeCtrl.GetParentItem(item))
	{
		return;
	}
	if (m_TreeCtrl.GetChildItem(item))
	{
		return;
	}
	m_hItemCur = item;
	this->EnableWindow(FALSE);
	m_listTask.AddHead(2);
	//TrdGetImgs();
	*pResult = 0;

}

void CSystemTFDlg::TrdGetImgs(){
	
	CString strFolder;
	strFolder = m_TreeCtrl.GetItemText(m_hItemCur);
	ZBX_QueryTFRecord(m_cam, strFolder);
}

void CSystemTFDlg::TrdDownLoadPic(){
	char szSnapImagePath[128] = { 0 };
	string app_path = GetAppPath();
	HTREEITEM item = m_TreeCtrl.GetParentItem(m_hItemCur);
	if (!item)
	{
		this->EnableWindow(TRUE);
		return;
	}
	CString strDate = m_TreeCtrl.GetItemText(item);
	char szDateImageDir[128] = { 0 };
	sprintf_s(szDateImageDir, sizeof(szDateImageDir), "%s\\%s", app_path.c_str(), strDate);
	if (!IsPathExist(szDateImageDir))
	{
		::CreateDirectory(szDateImageDir, NULL);
	}
	CString strDatePic = m_TreeCtrl.GetItemText(m_hItemCur);
	if (-1==strDatePic.Find(".jpg"))
	{
		this->EnableWindow(TRUE);
		return;
	}
	sprintf_s(szSnapImagePath, sizeof(szSnapImagePath), "%s\\%s", szDateImageDir, strDatePic);
	if (IsPathExist(szSnapImagePath))
	{
		this->EnableWindow(TRUE);
		ShowImg(szSnapImagePath);
		return;
	}
	tfRecordData time;
	sscanf(strDate, "%04d_%02d_%02d", &time.nYear, &time.nMonth, &time.nDay);
	strDatePic.Replace(".jpg", "");
	RecordImg img;
	std:; string strName = util::Convert<util::utf8>(strDatePic.GetBuffer());
	strDatePic.ReleaseBuffer();
	int nRet = ZBX_QueryTFRecordimg(m_cam, time, strName.c_str(), &img);
	if (nRet==0)
	{
		if (!IsPathExist(szSnapImagePath))
		{
			WriteFileB(szSnapImagePath, (unsigned char*)img.img_big, img.len_img_big);
		}
	}
	this->EnableWindow(TRUE);
	ShowImg(szSnapImagePath);
}

int CSystemTFDlg::ShowImg(const char* img_path)
{
	if (!img_path)
	{
		CStatic *pStatic = (CStatic *)GetDlgItem(IDC_PIC);
		CRect rc;
		GetDlgItem(IDC_PIC)->GetClientRect(rc);
		pStatic->GetDC()->FillSolidRect(rc.left + 1, rc.top + 1, rc.Width() - 1, rc.Height() - 1, RGB(240, 240, 240));
	}
	CWnd *pWnd = GetDlgItem(IDC_PIC);
	if (pWnd == NULL)
	{
		return -1;
	}

	CDC *pDC = pWnd->GetDC();

	RECT rc;
	pWnd->GetClientRect(&rc);

	CImage img;
	HRESULT hr = img.Load(img_path);
	if (SUCCEEDED(hr))
	{
		RECT rcSrc;
		rcSrc.left = 0;
		rcSrc.top = 0;
		rcSrc.right = img.GetWidth();
		rcSrc.bottom = img.GetHeight();

		SetStretchBltMode(pDC->m_hDC, COLORONCOLOR);

		//img.Draw( pDC->m_hDC, rc, rcSrc);
		img.Draw(pDC->m_hDC, rc);
		ReleaseDC(pDC);
	}
	else{
		CStatic *pStatic = (CStatic *)GetDlgItem(IDC_PIC);
		CRect rc;
		GetDlgItem(IDC_PIC)->GetClientRect(rc);
		pStatic->GetDC()->FillSolidRect(rc.left + 1, rc.top + 1, rc.Width() - 1, rc.Height() - 1, RGB(240, 240, 240));
	}

	return 0;
}
void CSystemTFDlg::OnSelchangedTree1(NMHDR *pNMHDR, LRESULT *pResult)
{
	LPNMTREEVIEW pNMTreeView = reinterpret_cast<LPNMTREEVIEW>(pNMHDR);
	// TODO:  �ڴ���ӿؼ�֪ͨ����������
	
	HTREEITEM item = m_TreeCtrl.GetSelectedItem();
	if (!item)
	{
		return;
	}
	const std::regex pattern("^[1-9]\\d\\d\\d_\\d\\d_\\d\\d*");
	CString str = m_TreeCtrl.GetItemText(item);
	if (std::regex_match(str.GetBuffer(), pattern))
	{
		str.ReleaseBuffer();
		return;
	}
	str.ReleaseBuffer();
	m_hItemCur = item;
	this->EnableWindow(FALSE);
	m_listTask.AddHead(4);
	//PostMessage(WM_USER_MSG_TF, (WPARAM)MSG_DOWNLOAD,NULL);
	*pResult = 0;
}


void CSystemTFDlg::OnBnClickedBtnClear()
{
	// TODO:  �ڴ���ӿؼ�֪ͨ����������
	m_TreeCtrl.DeleteAllItems();
	ShowImg("");
	int nRet = ZBX_DelDiskData(m_cam);
	if (nRet==0)
	{
		AfxMessageBox("�����");
	}
	else
	{
		AfxMessageBox("���ʧ��");

	}
}


void CSystemTFDlg::OnBnClickedButton10()
{
	// TODO:  �ڴ���ӿؼ�֪ͨ����������
	if (m_strDiskName.IsEmpty())
	{
		AfxMessageBox("���Ȼ�ȡTF��״̬");
		return;
	}
	int nRet = ZBX_FormatDisk(m_cam, m_strDiskName);
	if (nRet == 0)
	{
		AfxMessageBox("��ʽ���ɹ�");
	}
	else{

		AfxMessageBox("��ʽ��ʧ��");
	}
	m_TreeCtrl.DeleteAllItems();
	ShowImg("");
}
LRESULT CSystemTFDlg::OnUserMsg(WPARAM w, LPARAM l)
{
	switch ((int)w)
	{
	case MSG_CALLBACK:
		UpdateUI(l);
		break;
	case MSG_DOWNLOAD:
		TrdDownLoadPic();
		break;
	default:
		break;
	}

	return 1l;
}

void CSystemTFDlg::OnClickTree1(NMHDR *pNMHDR, LRESULT *pResult)
{
	// TODO:  �ڴ���ӿؼ�֪ͨ����������
	CPoint pt;
	UINT u32Flag = 0;
	GetCursorPos(&pt);
	m_TreeCtrl.ScreenToClient(&pt);
	HTREEITEM item = m_TreeCtrl.HitTest(pt, &u32Flag);
	const std::regex pattern("^[1-9]\\d\\d\\d_\\d\\d_\\d\\d*");
	CString str = m_TreeCtrl.GetItemText(item);
	if (std::regex_match(str.GetBuffer(), pattern))
	{
		str.ReleaseBuffer();
		return;
	}
	m_hItemCur = item;
	//this->EnableWindow(FALSE);
	//m_listTask.AddHead(4);
	PostMessage(WM_USER_MSG_TF, (WPARAM)MSG_DOWNLOAD, (LPARAM)1);
	*pResult = 0;
}

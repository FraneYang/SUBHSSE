// FaceManagerDlg.cpp : 实现文件
//

#include "stdafx.h"
#include "VzFaceSDKDemo.h"
#include "FaceManagerDlg.h"
#include "afxdialogex.h"
#include "SetPicFormatDlg.h"
#include <direct.h>
#include <thread>
#include "AddFaceDlg.h"

static void SDK_CALL FaceQueryCb_t(ZBX_Cam* cam, const QueryFaceInfoEx* faceQueryInfo, void* usrParam){
	CFaceManagerDlg* dlg = (CFaceManagerDlg*)usrParam;
	if (dlg)
	{
		dlg->UpdataInfo(faceQueryInfo);
	}
}

static VOID ThreadAddFace(LPVOID lpParam){
	if (lpParam)
	{
		CFaceManagerDlg* dlg = (CFaceManagerDlg*)lpParam;
		while (dlg->m_bThreaStatus)
		{
			if (dlg->m_fileVector.size())
			{
				dlg->UpdateUI();
			}
			else
			{
				Sleep(80);
			}
		}

	}
}

// CFaceManagerDlg 对话框

IMPLEMENT_DYNAMIC(CFaceManagerDlg, CDialogEx)

CFaceManagerDlg::CFaceManagerDlg(VzLPRClientHandle cam, CWnd* pParent /*=NULL*/)
	: CDialogEx(IDD_DLG_FACE_MANAGER, pParent)
{
	m_cam = cam;
}

CFaceManagerDlg::~CFaceManagerDlg()
{
}

void CFaceManagerDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialogEx::DoDataExchange(pDX);
	DDX_Control(pDX, IDC_LIST_FACE, m_lstFace);
	DDX_Control(pDX, IDC_PROGRESS, m_Process);
	DDX_Control(pDX, IDC_COM_TYPE, m_ComType);
	DDX_Control(pDX, IDC_COM_JUR, m_ComJur);
	DDX_Control(pDX, IDC_COMBO2, m_ComJurBatch);
	DDX_Control(pDX, IDC_COMBO3, m_ComTypeBatch);
	DDX_Control(pDX, IDC_DATETIMEPICKER1, m_DateS);
	DDX_Control(pDX, IDC_DATETIMEPICKER2, m_DateE);
}


BEGIN_MESSAGE_MAP(CFaceManagerDlg, CDialogEx)
	ON_BN_CLICKED(IDC_BTN_QUERY, &CFaceManagerDlg::OnBnClickedBtnQuery)
	ON_MESSAGE(WM_USER_MSG_FACEMNG, &CFaceManagerDlg::OnUserMsg)
//	ON_NOTIFY(LVN_ITEMCHANGED, IDC_LIST_FACE, &CFaceManagerDlg::OnItemchangedListFace)
	ON_BN_CLICKED(IDC_BTN_GOTO, &CFaceManagerDlg::OnBnClickedBtnGoto)
	ON_BN_CLICKED(IDC_BTN_FIRST, &CFaceManagerDlg::OnBnClickedBtnFirst)
	ON_BN_CLICKED(IDC_BTN_PRE, &CFaceManagerDlg::OnBnClickedBtnPre)
	ON_BN_CLICKED(IDC_BTN_LAST, &CFaceManagerDlg::OnBnClickedBtnLast)
	ON_BN_CLICKED(IDC_BTN_DELALL, &CFaceManagerDlg::OnBnClickedBtnDelall)
	ON_BN_CLICKED(IDC_BTN_NEXT, &CFaceManagerDlg::OnBnClickedBtnNext)
	ON_BN_CLICKED(IDC_BTN_ADD, &CFaceManagerDlg::OnBnClickedBtnAdd)
	ON_BN_CLICKED(IDC_LOADPIC2, &CFaceManagerDlg::OnBnClickedLoadpic2)
	ON_BN_CLICKED(IDC_BTN_SELECT2, &CFaceManagerDlg::OnBnClickedBtnSelect2)
	ON_BN_CLICKED(IDC_BTN_EDIT2, &CFaceManagerDlg::OnBnClickedBtnEdit2)
	ON_BN_CLICKED(IDC_BTN_IMPORT2, &CFaceManagerDlg::OnBnClickedBtnImport2)
	ON_BN_CLICKED(IDC_BTN_STOP, &CFaceManagerDlg::OnBnClickedBtnStop)
	ON_MESSAGE(WM_BN_CLICK, OnBnClicked)
	ON_WM_CLOSE()
	ON_WM_SYSCOMMAND()
	ON_WM_TIMER()
//	ON_NOTIFY(NM_DBLCLK, IDC_LIST_FACE, &CFaceManagerDlg::OnDblclkListFace)
	ON_BN_CLICKED(IDC_CHECK1, &CFaceManagerDlg::OnBnClickedCheck1)
//	ON_CBN_SELENDOK(IDC_COMBO2, &CFaceManagerDlg::OnSelendokCombo2)
//	ON_NOTIFY(NM_CLICK, IDC_LIST_FACE, &CFaceManagerDlg::OnClickListFace)
//ON_WM_LBUTTONDOWN()
END_MESSAGE_MAP()


// CFaceManagerDlg 消息处理程序


BOOL CFaceManagerDlg::OnInitDialog()
{
	CDialogEx::OnInitDialog();

	// TODO:  在此添加额外的初始化
	m_lstFace.InsertColumn(0, "人脸", DT_CENTER, 55);
	m_lstFace.InsertColumn(1, "ID", DT_CENTER, 125);
	m_lstFace.InsertColumn(2, "姓名", DT_CENTER, 100);
	m_lstFace.InsertColumn(3, "类型", DT_CENTER, 100);
	m_lstFace.InsertColumn(4, "韦根号", DT_CENTER, 100);
	m_lstFace.InsertColumn(5, "权限", DT_CENTER, 50);
	m_lstFace.InsertColumn(6, "起始时间", DT_CENTER, 100);
	m_lstFace.InsertColumn(7, "到期时间", DT_CENTER, 100);
	m_lstFace.InsertColumn(8, "身份证号", DT_CENTER, 150);
	m_lstFace.InsertColumn(9, "操作", DT_CENTER, 150);
	m_lstFace.SetHeadBKColor(RGB(227, 227, 227), 0);
	m_lstFace.SetHeadFont(14, FW_NORMAL, FALSE, FALSE, "宋体");
	m_lstFace.SetHeadHeight(1.5);
	m_lstFace.SetRowHeigt(55);
	m_lstFace.SetLineSelectMode(true);
	int nClear = -1;
	ZBX_GetAutoCleanEnable(m_cam, &nClear);
	if (nClear)
	{
		((CButton*)GetDlgItem(IDC_CHECK1))->SetCheck(TRUE);
	}
	ZBX_RegFaceQueryCbEx(m_cam, FaceQueryCb_t, this);

	int nCount = ZBX_GetFaceIDTotal(m_cam);
	m_nPage = nCount / 5 == 0 ? nCount / 5 : ((nCount / 5) + 1);
	if (nCount > 0)
	{
		CString strInfo;
		strInfo.Format("共%d条 %d页", nCount, m_nPage);
		GetDlgItem(IDC_STC_INFO)->SetWindowTextA(strInfo);
	}
	SYSTEMTIME st;
	GetLocalTime(&st);
	string app_path = GetAppPath();
	char szDateImageDir[MAX_PATH] = { 0 };
	sprintf_s(szDateImageDir, sizeof(szDateImageDir), "%s\\%d-%02d-%02d", app_path.c_str(), st.wYear, st.wMonth, st.wDay);
	if (!IsPathExist(szDateImageDir))
	{
		::CreateDirectory(szDateImageDir, NULL);
	}
	m_sModelPath = szDateImageDir;

	ZBX_QueryByRole(m_cam, -1, 1, 5, false, 0);
	SetDlgItemInt(IDC_EDIT3, 1);
	UpdateButton(1);
	m_Process.ShowWindow(FALSE);
	GetDlgItem(IDC_TIPS)->ShowWindow(FALSE);
	//GetDlgItem(IDC_STC_FAIL)->ShowWindow(FALSE);

	m_ComType.InsertString(0, "白名单");
	m_ComType.InsertString(1, "黑名单");
	m_ComType.SetCurSel(0);

	m_ComTypeBatch.InsertString(0, "白名单");
	m_ComTypeBatch.InsertString(1, "黑名单");
	m_ComTypeBatch.SetCurSel(0);

	CTime time(4102416000);
	((CDateTimeCtrl*)GetDlgItem(IDC_DATE_E))->SetTime(&time);
	((CDateTimeCtrl*)GetDlgItem(IDC_TIME_E))->SetTime(&time);

	m_DateE.SetFormat("yyyy-MM-dd HH:mm:ss");//设置为标准的时间格式
	m_DateE.SetTime(&time);

	CTime times(0);
	((CDateTimeCtrl*)GetDlgItem(IDC_DATE_S))->SetTime(&times);
	((CDateTimeCtrl*)GetDlgItem(IDC_TIME_S))->SetTime(&times);

	m_DateS.SetFormat("yyyy-MM-dd HH:mm:ss");
	m_DateS.SetTime(&times);
	//OnSyncUserRightCfgs();
	return TRUE;  // return TRUE unless you set the focus to a control
				  // 异常: OCX 属性页应返回 FALSE
}

void CFaceManagerDlg::UpdataInfo(const QueryFaceInfoEx* faceQueryInfo){
	if (!faceQueryInfo)
	{
		return;
	}
	QueryFaceInfoEx *face_info = (QueryFaceInfoEx *)malloc(sizeof(QueryFaceInfoEx));
	memset(face_info, 0, sizeof(QueryFaceInfoEx));
	memcpy(face_info, faceQueryInfo, sizeof(QueryFaceInfoEx));
	char szModelImagePath[MAX_PATH] = { 0 };
	std::string strperId(faceQueryInfo->personID, 20);
	sprintf_s(szModelImagePath, sizeof(szModelImagePath), "%s\\%s.jpg", m_sModelPath, strperId.c_str());
	// 	CString Strfilename;
	// 	Strfilename.Format("%s\\%s", m_sModelPath, strperId.c_str());
	WriteFileB(szModelImagePath,faceQueryInfo->imgBuff[0], faceQueryInfo->imgSize[0]);
	SendMessage(WM_USER_MSG_FACEMNG, (WPARAM)MSG_QUERY, (LPARAM)face_info);
}
CString CFaceManagerDlg::GetFaceType(int nType){
if (nType==2)
{
	return "黑名单";
}
else
{
	return "白名单";
}
}
void CFaceManagerDlg::deleteFaceMap(int nIdex/*=-1*/){
	if (nIdex!=-1)
	{
		int nCout = m_mapFaceInfo.size();
		for (int i = 0; i <= nCout;i++)
		{
			if (nIdex==i)
			{
				free(m_mapFaceInfo[nIdex]);
				m_mapFaceInfo.erase(nIdex);
			}
			if (nIdex<i)
			{
				m_mapFaceInfo[i - 1] = m_mapFaceInfo[i];
			}
		}
	}
	else{
		int nCout = m_mapFaceInfo.size();
		for (int i = nCout; i >= 0;i--)
		{
			free(m_mapFaceInfo[i-1]);
			m_mapFaceInfo.erase(i-1);
		}
	}
	
}
void CFaceManagerDlg::OnBnClickedBtnQuery()
{
	// TODO: Add your control notification handler code here
	m_lstFace.Clear();
	deleteFaceMap();
	//int nPos = m_ComFaceTypeCtrl.GetCurSel();
	//int ndata = m_ComFaceTypeCtrl.GetItemData(nPos);

	CString strName;
	GetDlgItem(IDC_EDITNAME)->GetWindowText(strName);
	CString strFaceId;
	GetDlgItem(IDC_EDITID)->GetWindowText(strFaceId);

	if (strName.IsEmpty() && strFaceId.IsEmpty())
	{

		int nCount = ZBX_GetFaceIDTotal(m_cam);
		m_nPage = nCount % 5 == 0 ? nCount / 5 : ((nCount / 5) + 1);
		if (nCount > 0)
		{
			CString strInfo;
			strInfo.Format("共%d条 %d页", nCount, m_nPage);
			GetDlgItem(IDC_STC_INFO)->SetWindowTextA(strInfo);
			if (m_nPage == 1)
			{

				GetDlgItem(IDC_BTN_NEXT)->EnableWindow(TRUE);
			}
			else if (m_nPage > 1)
			{

				GetDlgItem(IDC_BTN_NEXT)->EnableWindow(TRUE);
			}
		}
		ZBX_QueryByRole(m_cam, -1, 1, 5, false, 0);
	}
	else
	{
		QueryCondition condition;
		memset(&condition, 0, sizeof(QueryCondition));
		if (!strName.IsEmpty())
		{
			std::string str = util::Convert<util::utf8>(strName.GetBuffer());
			strcpy(condition.faceName, str.c_str());
		}
		if (!strFaceId.IsEmpty())
		{
			strcpy(condition.faceID, strFaceId);
		}
		ZBX_QueryFaceEx(m_cam, 0, 1, 5, 0, 1, 1, 0, &condition);
	}
	//DeletePic();
}

void CFaceManagerDlg::ShowQueryResult(LPARAM l)
{ 

	QueryFaceInfoEx *faceQueryInfo = (QueryFaceInfoEx *)l;
	int nCount = m_lstFace.GetItemCount();
	int nItem = m_lstFace.InsertItem(nCount, faceQueryInfo->personName);

	std::string strperName(faceQueryInfo->personName, 16);
	strperName = util::Convert<util::ascii>(strperName);
	//m_lstFace.SetItemText(nItem, 0, faceQueryInfo->personName);
	std::string strperId(faceQueryInfo->personID, 20);
	m_lstFace.SetItemText(nItem, 1, strperId.c_str());
	m_lstFace.SetItemText(nItem, 2, strperName.c_str());
	
	m_lstFace.SetItemText(nItem, 3, GetFaceType(faceQueryInfo->role));
	CString str;
	str.Format("%u", faceQueryInfo->wgCardNO);
	m_lstFace.SetItemText(nItem, 4, str);
	if (faceQueryInfo->user_type==0)
	{

		m_lstFace.SetItemText(nItem, 5, "无");
	}
	else{
		m_lstFace.SetItemText(nItem, 5, theApp.m_mapUserRightCfgs[m_cam]->user_rights[faceQueryInfo->user_type-1].name);
	}
	CTime ts(faceQueryInfo->effectStartTime);
	str.Format("%04d-%02d-%02d \r\n %02d:%02d:%02d", ts.GetYear(), ts.GetMonth(), ts.GetDay(), ts.GetHour(), ts.GetMinute(), ts.GetSecond());
	m_lstFace.SetItemText(nItem, 6, str);
	CTime te(faceQueryInfo->effectTime);

	str.Format("%04d-%02d-%02d \r\n %02d:%02d:%02d", te.GetYear(), te.GetMonth(), te.GetDay(), te.GetHour(), te.GetMinute(), te.GetSecond());
	m_lstFace.SetItemText(nItem, 7, str);
	m_lstFace.SetItemText(nItem, 8, faceQueryInfo->idcardper);
	CString strFilePath = "";
	strFilePath.Format("%s\\%s.jpg", m_sModelPath, faceQueryInfo->personID);
	m_lstFace.SetImagePath(nItem, strFilePath);
	m_lstFace.createItemButton(nItem, 9, this->GetSafeHwnd(), "", NULL,IDB_BIT_EDIT,IDB_BIT_DEL);
	//free(faceQueryInfo);
	m_mapFaceInfo[nItem] = faceQueryInfo;
}

LRESULT CFaceManagerDlg::OnBnClicked(WPARAM w, LPARAM p)
{
	int nType = (int)p; 
	int nItem = (int)w;
	if (p==1)
	{
		if (IDOK == MessageBox("確定刪除该人员？ ", "警告", MB_OKCANCEL))
		{			
			
			//CString faceId = m_mapFaceInfo[nItem]->personID;
			int nRet = ZBX_DeleteFaceDataByPersonID(m_cam, m_mapFaceInfo[nItem]->personID);
			if (!nRet)
			{
				AfxMessageBox("删除成功");
				DeleteListItem(nItem);
				deleteFaceMap(nItem);
			}
			else
			{
				AfxMessageBox("删除失败");
			}
		};
	}else if (p==0)
	{
		CString strFilePath = "";
		strFilePath.Format("%s\\%s.jpg", m_sModelPath, m_mapFaceInfo[nItem]->personID);
		CAddFaceDlg dlg(m_cam, strFilePath);
		dlg.SetData(m_mapFaceInfo[nItem]);
		dlg.DoModal();
	}
	return 1l;
}

LRESULT CFaceManagerDlg::OnUserMsg(WPARAM w, LPARAM l)
{
	switch ((int)w)
	{
	case MSG_QUERY:
		ShowQueryResult(l);
		break;

	case MSG_UPDATEUI:
		UpdateUiMsg();
		break;
	default:
		break;
	}

	return(0);
}

//void CFaceManagerDlg::OnItemchangedListFace(NMHDR *pNMHDR, LRESULT *pResult)
//{
//	LPNMLISTVIEW pNMLV = reinterpret_cast<LPNMLISTVIEW>(pNMHDR);
//	// TODO: Add your control notification handler code here
//#if 0
//	if ((pNMLV->uOldState & LVIS_SELECTED) == 0 &&
//		(pNMLV->uNewState & LVIS_SELECTED) == LVIS_SELECTED)
//	{
//		//sTemp.Format("%d got selected", pNMListView->iItem);
//		int nItem = pNMLV->iItem;
//		CString strId = "";
//		strId = m_lstFace.GetItemText(nItem, 1);
//		CString strFilePath = "";
//		strFilePath.Format("%s\\%s.jpg", m_sModelPath, strId);
//		ShowImg(strFilePath,IDC_PIC);
//	}
//#endif
//	*pResult = 0;
//}

int CFaceManagerDlg::ShowImg(const char* img_path, int wnd_id)
{
	if (img_path == NULL || strlen(img_path) == 0)
	{
		return -1;
	}

	CWnd *pWnd = GetDlgItem(wnd_id);
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

		img.Draw(pDC->m_hDC, rc, rcSrc);
		ReleaseDC(pDC);
	}

	return 0;
}


void CFaceManagerDlg::OnBnClickedBtnGoto()
{
	// TODO: Add your control notification handler code here
	CString strPage;
	GetDlgItem(IDC_EDIT3)->GetWindowTextA(strPage);
	if (atoi(strPage) < 1)
	{
		return ;
	}
	else if (atoi(strPage) == 1)
	{
		GetDlgItem(IDC_BTN_PRE)->EnableWindow(FALSE);
	}
	else
	{
		GetDlgItem(IDC_BTN_PRE)->EnableWindow(TRUE);
	}
	m_lstFace.Clear();
	deleteFaceMap();
	ZBX_QueryByRole(m_cam, -1, atoi(strPage), 5, false, 0);
	UpdateButton(atoi(strPage));
}


void CFaceManagerDlg::OnBnClickedBtnFirst()
{
	// TODO: Add your control notification handler code here
	m_lstFace.Clear();
	deleteFaceMap();
	SetDlgItemInt(IDC_EDIT3, 1);
	ZBX_QueryByRole(m_cam, -1, 1, 5, false, 0);
	UpdateButton(1);
}


void CFaceManagerDlg::OnBnClickedBtnPre()
{
	// TODO: Add your control notification handler code here
	m_lstFace.Clear();
	deleteFaceMap();
	CString strReqPage;
	GetDlgItem(IDC_EDIT3)->GetWindowTextA(strReqPage);
	int nReq = atoi(strReqPage) - 1;
	if (nReq == 1)
	{
		GetDlgItem(IDC_BTN_PRE)->EnableWindow(FALSE);
	}
	ZBX_QueryByRole(m_cam, -1, nReq, 5, false, 0);
	strReqPage.Format("%d", nReq);
	GetDlgItem(IDC_EDIT3)->SetWindowTextA(strReqPage);
	UpdateButton(nReq);
}


void CFaceManagerDlg::OnBnClickedBtnLast()
{
	// TODO: Add your control notification handler code here
	m_lstFace.Clear();
	deleteFaceMap();
	m_lstFace.SetRedraw(TRUE);
	SetDlgItemInt(IDC_EDIT3,m_nPage);
	ZBX_QueryByRole(m_cam, -1, m_nPage, 5, false, 0);
	UpdateButton(m_nPage);

}



void CFaceManagerDlg::OnBnClickedBtnDelall()
{
	// TODO: Add your control notification handler code here
	int Ret = ZBX_DeleteFaceDataAll(m_cam);
	if (!Ret)
	{
		AfxMessageBox("清空成功");
		DeleteListItem(-1);
	}
	else
	{
		AfxMessageBox("清空失败");
	}
}
void CFaceManagerDlg::DeleteListItem(int nIdex){
	if (!m_lstFace)
	{
		return;
	}
	int nPos = m_lstFace.GetItemCount();
	if (nIdex == -1)
	{
		m_lstFace.Clear();
		CString cmd;
		CString strID;
		strID = m_lstFace.GetItemText(nIdex, 1);
		cmd.Format("/c  del /Q %s", m_sModelPath);
		ShellExecute(0, "open", "cmd.EXE", cmd, "", SW_HIDE);
	}
	else
	{

		CString cmd;
		CString strID;
		strID = m_lstFace.GetItemText(nIdex, 1);
		CString strFile;
		strFile.Format("%s\\%s.jpg", m_sModelPath, strID);
		cmd.Format("/c  del /Q %s", strFile);
		ShellExecute(0, "open", "cmd.EXE", cmd, "", SW_HIDE);
		m_lstFace.DeleteItemEx(nIdex);
	}
	//DeletePic();
}
void CFaceManagerDlg::DeletePic(){
	CStatic *pStatic = (CStatic *)GetDlgItem(IDC_PIC);
	CRect rc;
	GetDlgItem(IDC_PIC)->GetClientRect(rc);
	pStatic->GetDC()->FillSolidRect(rc.left + 1, rc.top + 1, rc.Width() - 1, rc.Height() - 1, RGB(240, 240, 240));
}

void CFaceManagerDlg::OnBnClickedBtnNext()
{
	// TODO: Add your control notification handler code here
	m_lstFace.Clear();
	deleteFaceMap();
	m_lstFace.SetRedraw(TRUE);
	CString strReqPage;
	GetDlgItem(IDC_EDIT3)->GetWindowTextA(strReqPage);
	int nReq = atoi(strReqPage) + 1;
	ZBX_QueryByRole(m_cam, -1, nReq, 5, false, 0);
	strReqPage.Format("%d", nReq);
	GetDlgItem(IDC_EDIT3)->SetWindowTextA(strReqPage);
	UpdateButton(nReq);
}

void CFaceManagerDlg::UpdateButton(int nReq){
	if (nReq == m_nPage)
	{
		GetDlgItem(IDC_BTN_NEXT)->EnableWindow(FALSE);
		GetDlgItem(IDC_BTN_PRE)->EnableWindow(TRUE);
		GetDlgItem(IDC_BTN_LAST)->EnableWindow(FALSE);
		GetDlgItem(IDC_BTN_FIRST)->EnableWindow(TRUE);

	}
	else
	{
		GetDlgItem(IDC_BTN_NEXT)->EnableWindow(TRUE);
		GetDlgItem(IDC_BTN_PRE)->EnableWindow(TRUE);

		GetDlgItem(IDC_BTN_FIRST)->EnableWindow(TRUE);
		GetDlgItem(IDC_BTN_LAST)->EnableWindow(TRUE);
	}
	if (nReq == 1)
	{
		GetDlgItem(IDC_BTN_PRE)->EnableWindow(FALSE);
		GetDlgItem(IDC_BTN_FIRST)->EnableWindow(FALSE); 
		GetDlgItem(IDC_BTN_NEXT)->EnableWindow(TRUE);
		GetDlgItem(IDC_BTN_LAST)->EnableWindow(TRUE);
	}
	if (m_nPage==0)
	{
		GetDlgItem(IDC_BTN_NEXT)->EnableWindow(FALSE);
		GetDlgItem(IDC_BTN_LAST)->EnableWindow(FALSE);
	}
}

BOOL CFaceManagerDlg::PreTranslateMessage(MSG* pMsg)
{
	// TODO: Add your specialized code here and/or call the base class
	CString strPage;
	int nId = 0; 
	CWnd * pWnd = NULL;
	if (pMsg->message == WM_KEYDOWN)	{
		switch (pMsg->wParam)		{
		case VK_ESCAPE: //Esc按键事件				
			return true;
		case VK_RETURN: //Enter按键事件	
			pWnd = GetFocus();
			nId = pWnd->GetDlgCtrlID();
			if (nId == IDC_EDIT3)
			{
				GetDlgItem(IDC_EDIT3)->GetWindowTextA(strPage);
				if (atoi(strPage) < 1)
				{
					return TRUE;
				}
				m_lstFace.Clear();
				deleteFaceMap();
				ZBX_QueryByRole(m_cam, -1, atoi(strPage), 5, false, 0);
				UpdateButton(atoi(strPage));
			}
			else if ((nId == IDC_EDITNAME) || (nId == IDC_EDITID))
			{
				OnBnClickedBtnQuery();
			}			
			return true;
		default:
			;
		}
	}
	return CDialogEx::PreTranslateMessage(pMsg);
}


void CFaceManagerDlg::OnBnClickedBtnAdd()
{
	// TODO: Add your control notification handler code here
	
}


void CFaceManagerDlg::OnBnClickedLoadpic2()
{
	// TODO: Add your control notification handler code here
	// TODO: Add your control notification handler code here
	CString faceID, facename, faceWG, IDCard;
	//GetDlgItem(IDC_EDIT_FACEID)->GetWindowText(faceID);
	GetDlgItem(IDC_EDIT_FACENAME)->GetWindowText(facename);
	GetDlgItem(IDC_EDIT_WG)->GetWindowText(faceWG);
	GetDlgItem(IDC_EDIT_WG2)->GetWindowText(IDCard);

	if (facename.IsEmpty())
	{
		AfxMessageBox("请输入姓名");
		return;
	}
	LPCTSTR lpszFilter = "image files(*.jpeg; *.jpg; *.bmp) |*.jpeg; *.jpg; *.bmp | All Files (*.*) |*.*||";
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
			return;
		}
	}
	
	
	std::ifstream ifs(filepath, std::ios_base::binary);
	if (ifs.is_open()) {
		ifs.seekg(0, std::ios_base::end);
		std::vector<uint8_t> buf(ifs.tellg());
		ifs.seekg(0);

		ifs.read((char*)buf.data(), buf.size());
		/*if (buf.size() > IMG_BUF_SIZE)
		{
		AfxMessageBox("图片过大 请选择合适图片");
		ifs.close();
		m_filepath.ReleaseBuffer();
		案例return;
		}*/
		FaceFlags face;
		std::string strName = util::Convert<util::utf8>(facename.GetBuffer());
		int nType = m_ComJur.GetCurSel();
		face.usr_type = nType;

		SYSTEMTIME	t;
		GetSystemTime(&t);
		CString strFaceId;
		GetDlgItem(IDC_EDIT_ID2)->GetWindowTextA(strFaceId);
		if (strFaceId.IsEmpty())
		{
			strFaceId.Format("%04d%02d%02d%02d%02d%02d%03d", t.wYear, t.wMonth, t.wDay, t.wHour, t.wMinute, t.wSecond, t.wMilliseconds);
		}
		strncpy(face.faceID, strFaceId, sizeof(face.faceID));

		strncpy(face.faceName, strName.c_str(), sizeof(face.faceName));
		strncpy(face.resv, IDCard, 100);
		face.wgCardNO = atoll(faceWG);
		FaceImage img;
		img.img = buf.data();
		img.img_len = buf.size();
		//CTime time;

		SYSTEMTIME t1;
		((CDateTimeCtrl*)GetDlgItem(IDC_DATE_S))->GetTime(&t);
		((CDateTimeCtrl*)GetDlgItem(IDC_TIME_S))->GetTime(&t1);
		CTime time(t.wYear,t.wMonth,t.wDay,t1.wHour,t1.wMinute,t1.wSecond);
		//((CDateTimeCtrl*)GetDlgItem(IDC_DATE_S))->GetTime(time);
		//((CDateTimeCtrl*)GetDlgItem(IDC_TIME_S))->GetTime(time);
		face.effectStartTime = time.GetTime();
		if (face.effectStartTime<0)
		{
			face.effectStartTime = 0;
		}
		((CDateTimeCtrl*)GetDlgItem(IDC_DATE_E))->GetTime(&t);
		((CDateTimeCtrl*)GetDlgItem(IDC_TIME_E))->GetTime(&t1);
		CTime time2(t.wYear, t.wMonth, t.wDay, t1.wHour, t1.wMinute, t1.wSecond);
		face.effectTime = time2.GetTime();
		int nPos = m_ComType.GetCurSel();
		face.role = nPos+1;

		int nRet = -1;
		nRet = ZBX_AddJpgFaces(m_cam, &face, &img, 1, 0);
		if (0 == nRet){
			AfxMessageBox("添加成功");
		}
		else
		{
			AfxMessageBox("添加失败");
		}

		ifs.close();
	}

	filepath.ReleaseBuffer();
	
}


void CFaceManagerDlg::OnBnClickedBtnSelect2()
{
	// TODO: Add your control notification handler code here
	m_nSucceed = 0;
	m_nFail = 0;
	m_nCount = 0;
	TCHAR           szFolderPath[MAX_PATH] = { 0 };
	CString         strFolderPath = TEXT("");
	m_fileVector.clear();
	BROWSEINFO      sInfo;
	::ZeroMemory(&sInfo, sizeof(BROWSEINFO));
	sInfo.pidlRoot = 0;
	sInfo.lpszTitle = _T("请选择图片路径");
	sInfo.ulFlags = BIF_RETURNONLYFSDIRS | BIF_EDITBOX | BIF_DONTGOBELOWDOMAIN;
	sInfo.lpfn = NULL;
	m_nPerIndex = 0;
	// 显示文件夹选择对话框  
	LPITEMIDLIST lpidlBrowse = ::SHBrowseForFolder(&sInfo);
	if (lpidlBrowse != NULL)
	{
		// 取得文件夹名  
		if (::SHGetPathFromIDList(lpidlBrowse, szFolderPath))
		{
			strFolderPath = szFolderPath;
		}
	}
	else
	{
		return;
	}
	GetDlgItem(IDC_TIPS)->ShowWindow(TRUE);
	GetDlgItem(IDC_TIPS)->SetWindowText("正在获取文件。。。");
	CFileFind finder;
	CString filePath;
	if (strFolderPath.Right(1) != "\\")
		strFolderPath += "\\";
	strFolderPath += "*.jpg*";
	BOOL bWorking = finder.FindFile(strFolderPath);
	while (bWorking)	{
		bWorking = finder.FindNextFile();
		filePath = finder.GetFilePath();		//strPath就是所要获取Test目录下的文件夹和文件（包括路径）	
		m_fileVector.push_back(filePath);
		CString loginfo;
		loginfo.Format("文件：%s", filePath);
		//AddStateMsg(loginfo);
		//m_List.AddString(strPath);	
	}
	finder.Close();
	if (lpidlBrowse != NULL)
	{
		::CoTaskMemFree(lpidlBrowse);
	}
	m_nCount = m_fileVector.size();
	if (!m_nCount)
	{
		AfxMessageBox("选择路径不含图片 请确定图片路径");
		return;
	}
	GetDlgItem(IDC_EDIT_PIC2)->SetWindowTextA(szFolderPath);
	//GetDlgItem(IDC_BUTTON8)->EnableWindow(TRUE);
	//GetDlgItem(IDC_BUTTON1)->EnableWindow(TRUE);
	CString strTmp;
	strTmp.Format("总%d张", m_nCount);
	GetDlgItem(IDC_TIPS)->SetWindowText(strTmp);
	m_Process.SetPos(0);
}


void CFaceManagerDlg::OnBnClickedBtnEdit2()
{
	// TODO: Add your control notification handler code here
	CSetPicFormatDlg dlg;
	if (IDOK==dlg.DoModal())
	{
		dlg.GetFormat(m_strFormat);
		GetDlgItem(IDC_STC_FORMAT)->SetWindowText(m_strFormat);
	}
}


void CFaceManagerDlg::OnBnClickedBtnImport2()
{
	// TODO: Add your control notification handler code here
	m_Process.ShowWindow(TRUE);
	GetDlgItem(IDC_STC_PROCESS)->ShowWindow(TRUE);
	m_Process.SetRange(0, m_fileVector.size());
	GetDlgItem(IDC_LOADPIC2)->EnableWindow(FALSE);
	GetDlgItem(IDC_BTN_SELECT2)->EnableWindow(FALSE);
	GetDlgItem(IDC_BTN_EDIT2)->EnableWindow(FALSE);
	GetDlgItem(IDC_BTN_IMPORT2)->EnableWindow(FALSE);
	GetDlgItem(IDC_BTN_DELALL)->EnableWindow(FALSE);
	//GetDlgItem(IDC_BTN_DEL)->EnableWindow(FALSE);
	GetDlgItem(IDC_BTN_QUERY)->EnableWindow(FALSE);
	GetDlgItem(IDC_BTN_GOTO)->EnableWindow(FALSE);
	GetDlgItem(IDC_BTN_FIRST)->EnableWindow(FALSE);
	GetDlgItem(IDC_BTN_PRE)->EnableWindow(FALSE);
	GetDlgItem(IDC_BTN_NEXT)->EnableWindow(FALSE);
	GetDlgItem(IDC_BTN_LAST)->EnableWindow(FALSE);
	GetDlgItem(IDC_BTN_STOP)->EnableWindow(TRUE);
	m_bThreaStatus = true;
	//m_Process.SetWindowTextA("0000/0000");
	//GetDlgItem(IDC_STC_FAIL)->ShowWindow(TRUE);
	AfxBeginThread((AFX_THREADPROC)ThreadAddFace, this);
}


void CFaceManagerDlg::OnBnClickedBtnStop()
{
	// TODO: Add your control notification handler code here
	if (m_bThreaStatus)
	{
		m_bThreaStatus = false;
		AfxMessageBox("批量导入已停止");
	}

	GetDlgItem(IDC_BTN_STOP)->EnableWindow(FALSE);
	GetDlgItem(IDC_LOADPIC2)->EnableWindow(TRUE);
	GetDlgItem(IDC_BTN_SELECT2)->EnableWindow(TRUE);
	GetDlgItem(IDC_BTN_EDIT2)->EnableWindow(TRUE);
	GetDlgItem(IDC_BTN_IMPORT2)->EnableWindow(TRUE);
	GetDlgItem(IDC_BTN_DELALL)->EnableWindow(TRUE);
	//GetDlgItem(IDC_BTN_DEL)->EnableWindow(TRUE);
	GetDlgItem(IDC_BTN_QUERY)->EnableWindow(TRUE);
	GetDlgItem(IDC_BTN_GOTO)->EnableWindow(TRUE);
	GetDlgItem(IDC_BTN_FIRST)->EnableWindow(TRUE);
	GetDlgItem(IDC_BTN_PRE)->EnableWindow(TRUE);
	GetDlgItem(IDC_BTN_NEXT)->EnableWindow(TRUE);
	GetDlgItem(IDC_BTN_LAST)->EnableWindow(TRUE);

}

int CFaceManagerDlg::GetTypeIndex(const CString cType, const CString fileName, char * CReqType){
	char strTmp[256] = { "" };
	char strTmp2[256] = { "" };
	int ntypeIndex = -1;
	GetDlgItem(IDC_STC_FORMAT)->GetWindowTextA(m_strFormat);
	int nSplictPos[4] = { 0 };
	CString strPlice = m_strFormat;
	CString splic = "_";
	int nIdex = 0;
	int nPosIndex = -1;
	do 
	{
		nPosIndex = strPlice.Find(splic);
		nSplictPos[nIdex++] = nPosIndex;
		strPlice = strPlice.Right(strPlice.GetLength() - nPosIndex - splic.GetLength());
	} while (nPosIndex != -1);

	nSplictPos[nIdex] = m_strFormat.GetLength();
	ntypeIndex = m_strFormat.Find(cType);
	if (ntypeIndex <= -1)
	{
		Log() << "格式中" << cType << "为空" <<"\r\n";
		CReqType = "";
		return 0;
	}
	else if (0 <= ntypeIndex&&ntypeIndex <= nSplictPos[0])
	{
		Log() << "格式中" << cType << "为第一个" << "\r\n";
		int nPos = fileName.Find("_");
		if (0 <= nPos)
		{
			sscanf(fileName, "%[^_]", CReqType);
		}
		else
		{
			sscanf(fileName, "%s", CReqType);
		}
		return 1;
	}
	else if (nSplictPos[0] < ntypeIndex&&ntypeIndex <= nSplictPos[1])
	{
		Log() << "格式中" << cType << "为第二个" << "\r\n";
		sscanf(fileName, "%[^_]_%[^_]_%[^_]", strTmp, CReqType, strTmp);
		return 2;
	}
	else if (nSplictPos[1] < ntypeIndex&&ntypeIndex <= nSplictPos[2])
	{
		Log() << "格式中" << cType << "为第三个" << "\r\n";

		sscanf(fileName, "%[^_]_%[^_]_%[^_]", &strTmp, &strTmp, &CReqType);
		return 3;
	}
	else if (nSplictPos[2] < ntypeIndex&&ntypeIndex <= nSplictPos[3])
	{
		Log() << "格式中" << cType << "为第四个" << "\r\n";
		sscanf(fileName, "%[^_]_%[^_]_%[^_]_%[^_]", &strTmp, &strTmp, &strTmp, &CReqType);
		return 3;
	}
	else {
		return -1;
	}
}

void CFaceManagerDlg::UpdateUI(){
	CString filePath = m_fileVector.back();
	CString strFaceId, strFaceName;
	std::ifstream ifs(filePath.GetBuffer(), std::ios_base::binary);

	if (ifs.is_open()) {
		int pos = filePath.ReverseFind('\\');
		CString fileName = filePath.Right(filePath.GetLength() - pos - 1);
		CString CurPath = filePath.Left(pos);
		CString FailfilePath = filePath.Left(pos) + "\\failed";
		if (!PathFileExists(FailfilePath))
		{
			mkdir(FailfilePath);
		}
		ifs.seekg(0, std::ios_base::end);
		std::vector<uint8_t> buf(ifs.tellg());
		if (buf.size()==0)
		{
			CString cmd;
			cmd.Format("/c  move %s \"%s\\%s \"", filePath, FailfilePath, fileName);
			ShellExecute(0, "open", "cmd.EXE", cmd, "", SW_HIDE);
			m_nFail++;
			fileName = "";
		}
		else
		{
			ifs.seekg(0);
			ifs.read((char*)buf.data(), buf.size());
		}
		ifs.close();
		
		if (!fileName.IsEmpty())
		{
			pos = fileName.Find('.');
			CString file_id_Name = fileName.Left(pos);
			if (!file_id_Name.IsEmpty())
			{
				FaceFlags face;
				memset(&face, 0, sizeof(FaceFlags));

				char NameTest[256], WgTest[256], ID[256] = { 0 }, IDcard[256] = { 0 };
				memset(NameTest, 0, 256);
				memset(WgTest, 0, 256);
				int nNameIndex = GetTypeIndex("姓名", file_id_Name, NameTest);
				int nEgndex = GetTypeIndex("韦根", file_id_Name, WgTest);
				nEgndex = GetTypeIndex("ID", file_id_Name, ID);
				nEgndex = GetTypeIndex("身份证号", file_id_Name, IDcard);
				pos = file_id_Name.Find('_');
				if (pos < 0)
				{
					strFaceName = file_id_Name;
				}
				else
				{
					strFaceName = file_id_Name.Left(pos);
				}
				if (NameTest[0] != 0)
				{
					strFaceName.Format("%s", NameTest);
					//strncpy(face.faceName, strFaceName, sizeof(face.faceName));
				}
				else
				{
					//return;

				}
				std::string str = util::Convert<util::utf8>(strFaceName.GetBuffer());
				strcpy(face.faceName, str.c_str());

				SYSTEMTIME t;
				((CDateTimeCtrl*)GetDlgItem(IDC_DATETIMEPICKER1))->GetTime(&t);
				CTime time(t.wYear, t.wMonth, t.wDay, t.wHour, t.wMinute, t.wSecond);
				face.effectStartTime = time.GetTime();

				((CDateTimeCtrl*)GetDlgItem(IDC_DATETIMEPICKER2))->GetTime(&t);
				CTime time2(t.wYear, t.wMonth, t.wDay, t.wHour, t.wMinute, t.wSecond);
				face.effectTime = time2.GetTime();

				if (ID[0] != 0)
				{
					strncpy(face.faceID, ID, sizeof(face.faceID));
				}
				else{
					SYSTEMTIME	t;
					GetSystemTime(&t);
					strFaceId.Format("%04d%02d%02d%02d%02d%02d%03d", t.wYear, t.wMonth, t.wDay, t.wHour, t.wMinute, t.wSecond, t.wMilliseconds);
					strncpy(face.faceID, strFaceId, sizeof(face.faceID));
				}
				if (WgTest[0] != 0)
				{
					sscanf(WgTest, "%ld", &face.wgCardNO);
				}

				if (IDcard[0]!=0)
				{
					strncpy(face.resv, IDcard, 100);
				}
				FaceImage img;
				img.img = buf.data();
				img.img_len = buf.size();

				int nType = m_ComJurBatch.GetCurSel();
				face.usr_type = nType;

				int nPos = m_ComTypeBatch.GetCurSel();
				face.role = nPos + 1;

				int nRet = ZBX_AddJpgFaces(m_cam, &face, &img, 1, 0);
				if (0 == nRet){
					m_nSucceed++;
					CString cmd;
					//cmd.Format("/c  rename %s %s_%s.jpg", filePath, strFaceName, strFaceId);
					//ShellExecute(0, "open", "cmd.EXE", cmd, "", SW_HIDE);
				}
				else
				{
					CString cmd;
					cmd.Format("/c  move %s \"%s\\%s \"", filePath, FailfilePath, fileName);
					ShellExecute(0, "open", "cmd.EXE", cmd, "", SW_HIDE);
					m_nFail++;
				}

			}
		}
	}
	filePath.ReleaseBuffer();
	m_fileVector.pop_back();
	PostMessage(WM_USER_MSG_FACEMNG, (WPARAM)MSG_UPDATEUI, (LPARAM)m_nSucceed);	

}

void CFaceManagerDlg::ShowMessageBox(){
	CString strMsg;
	strMsg.Format("上传完成 成功%d 失败%d", m_nSucceed, m_nFail);
	AfxMessageBox(strMsg);
	m_bThreaStatus = false;
}

void CFaceManagerDlg::UpdateUiMsg(){
	CString strProcess;
	strProcess.Format("%04d/%04d", m_nSucceed+m_nFail, m_nCount);
	GetDlgItem(IDC_TIPS)->SetWindowTextA(strProcess); 
	strProcess.Format("失败：%d", m_nFail);
	//GetDlgItem(IDC_STC_FAIL)->SetWindowTextA(strProcess);
	m_Process.SetStep(1);
	m_Process.StepIt();	
	if (m_fileVector.size() <= 0)
	{
		ShowMessageBox();
		OnBnClickedBtnStop();
	}
	
}

void CFaceManagerDlg::OnClose()
{
	// TODO: Add your message handler code here and/or call default
	ZBX_RegFaceQueryCb(m_cam,NULL,(void*)this);
	std::this_thread::sleep_for(std::chrono::milliseconds(500));
	m_lstFace.Clear();
	deleteFaceMap();
	if (m_bThreaStatus)
	{
		AfxMessageBox("正在批量导入，请先停止");
		return;
	}
	CDialogEx::OnClose();
}


void CFaceManagerDlg::OnSysCommand(UINT nID, LPARAM lParam)
{
	// TODO: Add your message handler code here and/or call default

	if (nID == SC_MINIMIZE)
	{
		AfxGetMainWnd()->EnableWindow(TRUE);
		AfxGetMainWnd()->ShowWindow(SW_MINIMIZE);
		this->ShowWindow(SW_HIDE);
		if (m_Timer == 0)
			m_Timer=SetTimer(1, 100, NULL);
		return;
	}
	CDialogEx::OnSysCommand(nID, lParam);
}


void CFaceManagerDlg::OnTimer(UINT_PTR nIDEvent)
{
	// TODO: Add your message handler code here and/or call default
	if (nIDEvent == m_Timer)
	{
		CRect rc;
		AfxGetMainWnd()->GetClientRect(&rc);
		if (rc.Width() > 0)
		{
			EnableWindow(true);
			AfxGetMainWnd()->EnableWindow(false);			
			KillTimer(m_Timer);
			m_Timer = 0;			
			this->ShowWindow(SW_SHOW);
		}
	}	
	CDialogEx::OnTimer(nIDEvent);
}


//void CFaceManagerDlg::OnDblclkListFace(NMHDR *pNMHDR, LRESULT *pResult)
//{
//	LPNMITEMACTIVATE pNMItemActivate = reinterpret_cast<LPNMITEMACTIVATE>(pNMHDR);
//	// TODO:  在此添加控件通知处理程序代码
//	int nItem = pNMItemActivate->iItem;
//
//	*pResult = 0;
//}


void CFaceManagerDlg::OnBnClickedCheck1()
{
	// TODO:  在此添加控件通知处理程序代码
	int  nUIData = ((CButton*)GetDlgItem(IDC_CHECK1))->GetCheck();
	int nRet = ZBX_SetAutoCleanEnable(m_cam, nUIData);
	if (nRet==0)
	{
		AfxMessageBox("设置成功");
	}
	else
	{

		AfxMessageBox("设置失败");
	}
	//std::cout << "nRet = " << nRet;
}




void CFaceManagerDlg::OnSyncUserRightCfgs(){
	int nCout = m_ComJur.GetCount();
	for (int i = nCout; i >= 0; i--)
	{
		m_ComJur.DeleteString(i - 1);
		m_ComJurBatch.DeleteString(i - 1);
	}
	m_ComJur.InsertString(0, "无");
	m_ComJurBatch.InsertString(0, "无");
	for (int i = 0; i < 4; i++)
	{
		CString str;
		if (!theApp.m_mapUserRightCfgs[m_cam])
		{
			continue;
		}
		str = theApp.m_mapUserRightCfgs[m_cam]->user_rights[i].name;
		if (str.IsEmpty())
		{
			str.Format("权限%d", i + 1);
		}
		m_ComJur.InsertString(i + 1, str);

		m_ComJurBatch.InsertString(i + 1, str);
	}
	m_ComJur.SetCurSel(0);
	m_ComJurBatch.SetCurSel(0);
}


//void CFaceManagerDlg::OnClickListFace(NMHDR *pNMHDR, LRESULT *pResult)
//{
//	LPNMITEMACTIVATE pNMItemActivate = reinterpret_cast<LPNMITEMACTIVATE>(pNMHDR);
//	// TODO:  在此添加控件通知处理程序代码
//	*pResult = 0;
//}


//void CFaceManagerDlg::OnLButtonDown(UINT nFlags, CPoint point)
//{
//	// TODO:  在此添加消息处理程序代码和/或调用默认值
//
//	CDialogEx::OnLButtonDown(nFlags, point);
//}

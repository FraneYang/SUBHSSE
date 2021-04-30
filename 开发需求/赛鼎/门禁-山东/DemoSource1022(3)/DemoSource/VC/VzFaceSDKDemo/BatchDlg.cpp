// BatchDlg.cpp : implementation file
//

#include "stdafx.h"
#include "VzFaceSDKDemo.h"
#include "BatchDlg.h"
#include "afxdialogex.h"
#include <thread>

#define  MAX_THREAD_NUM 5
// CBatchDlg dialog
void SDK_CALL DeviceDiscoverCb(const struct ipscan_t* ipscan, size_int usr_param){
	if (usr_param)
	{
		CBatchDlg* dlg = (CBatchDlg*)usr_param;
		dlg->SetCamera(ipscan);
	}
}

IMPLEMENT_DYNAMIC(CBatchDlg, CDialogEx)

CBatchDlg::CBatchDlg(CWnd* pParent /*=NULL*/)
	: CDialogEx(CBatchDlg::IDD, pParent)
{

}

CBatchDlg::~CBatchDlg()
{
	StopThread();
}

void CBatchDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialogEx::DoDataExchange(pDX);
	DDX_Control(pDX, IDC_COMBO1, m_Comx);
	DDX_Control(pDX, IDC_LIST1, m_ListCtrl);
}



BEGIN_MESSAGE_MAP(CBatchDlg, CDialogEx)
	ON_CBN_SELCHANGE(IDC_COMBO1, &CBatchDlg::OnSelchangeCombo1)
	ON_NOTIFY(LVN_COLUMNCLICK, IDC_LIST1, &CBatchDlg::OnColumnclickList1)
	ON_NOTIFY(LVN_ITEMCHANGED, IDC_LIST1, &CBatchDlg::OnItemchangedList1)
	ON_MESSAGE(WM_USER_MSG_BATCH, &CBatchDlg::OnUserMsg)
	ON_BN_CLICKED(IDC_BTN_NET, &CBatchDlg::OnBnClickedBtnNet)
	ON_BN_CLICKED(IDC_BUTTON10, &CBatchDlg::OnBnClickedButton10)
	ON_BN_CLICKED(IDC_BTN_SELECT, &CBatchDlg::OnBnClickedBtnSelect)
	ON_WM_CLOSE()
	ON_BN_CLICKED(IDC_BTN_SEARCH, &CBatchDlg::OnBnClickedBtnSearch)
	ON_NOTIFY(NM_DBLCLK, IDC_LIST1, &CBatchDlg::OnNMDblclkList1)
	ON_BN_CLICKED(IDC_BUTTON1, &CBatchDlg::OnBnClickedButton1)
	ON_BN_CLICKED(IDC_BUTTON14, &CBatchDlg::OnBnClickedButton14)
	ON_BN_CLICKED(IDC_BTN_INIT, &CBatchDlg::OnBnClickedBtnInit)
END_MESSAGE_MAP()


// CBatchDlg message handlers


void CBatchDlg::OnSelchangeCombo1()
{
	// TODO: Add your control notification handler code here
	
}


void CBatchDlg::OnColumnclickList1(NMHDR *pNMHDR, LRESULT *pResult)
{
	LPNMLISTVIEW pNMLV = reinterpret_cast<LPNMLISTVIEW>(pNMHDR);
	// TODO: Add your control notification handler code here
	int nPos = pNMLV->iSubItem;
	if (nPos == 0)
	{
		if (m_bCheckAll)
		{
			for (int i = 0; i < m_ListCtrl.GetItemCount(); i++)
			{
				m_ListCtrl.SetItemState(i, 0, LVIS_SELECTED | LVIS_FOCUSED);
				m_ListCtrl.SetCheck(i, 0);
			}
			m_bCheckAll = false;
			return;
		}
		CString str;
		m_bCheckAll = true;
		for (int i = 0; i < m_ListCtrl.GetItemCount(); i++)
		{
			//if (m_IpListCtrl.GetItemState(i, LVIS_SELECTED) == LVIS_SELECTED)
			//{
			//	//str.Format(_T("选中了第%d行"), i);
			//	//AfxMessageBox(str);
			//}
			m_ListCtrl.SetCheck(i, 1);
			m_ListCtrl.SetItemState(i, LVIS_SELECTED | LVIS_FOCUSED, LVIS_SELECTED | LVIS_FOCUSED);
		}
	}
	*pResult = 0;
}


void CBatchDlg::OnItemchangedList1(NMHDR *pNMHDR, LRESULT *pResult)
{
	LPNMLISTVIEW pNMLV = reinterpret_cast<LPNMLISTVIEW>(pNMHDR);
	// TODO: Add your control notification handler code here
	int nPos = pNMLV->iSubItem;
	if ((pNMLV->uOldState & INDEXTOSTATEIMAGEMASK(1)) /* old state : unchecked */
		&& (pNMLV->uNewState & INDEXTOSTATEIMAGEMASK(2)) /* new state : checked */
		)
	{
		TRACE("Item %d is checked\n", pNMLV->iItem);
	}
	else if ((pNMLV->uOldState & INDEXTOSTATEIMAGEMASK(2)) /* old state : checked */
		&& (pNMLV->uNewState & INDEXTOSTATEIMAGEMASK(1)) /* new state : unchecked */
		)
	{
		TRACE("Item %d is unchecked\n", pNMLV->iItem);
		m_bCheckAll = false;
	}
	*pResult = 0;
}


BOOL CBatchDlg::OnInitDialog()
{
	CDialogEx::OnInitDialog();

	// TODO:  Add extra initialization here
	m_ListCtrl.InsertColumn(0, "全选", LVCFMT_CENTER, 125);
	m_ListCtrl.InsertColumn(1, "IP", LVCFMT_CENTER, 125);
	m_ListCtrl.InsertColumn(2, "SN", LVCFMT_CENTER, 125);
	m_ListCtrl.InsertColumn(3, "进度", LVCFMT_CENTER, 130);

	int nItem = m_Comx.InsertString(0, "192.168.1.100");
	m_Comx.InsertString(1, "非192.168.1.100");
	nItem = m_Comx.InsertString(2, "全部");
	m_Comx.SetCurSel(nItem);
	ZBX_RegDiscoverIpscanCb(DeviceDiscoverCb, (size_int)this);
	ZBX_DiscoverIpscan();
	m_ListCtrl.SetExtendedStyle(LVS_EX_FULLROWSELECT | LVS_EX_HEADERDRAGDROP | LVS_EX_CHECKBOXES);
	GetDlgItem(IDC_IP_GATE)->SetWindowTextA("192.168.1.1");
	GetDlgItem(IDC_IPA_NET)->SetWindowTextA("255.255.255.0");

	StartThread(0, 300);
	return TRUE;  // return TRUE unless you set the focus to a control
	// EXCEPTION: OCX Property Pages should return FALSE
}
void CBatchDlg::SetCamera(const ipscan_t* ipscan){
	if (ipscan)
	{
		ipscan_t *pDeviceInfo = (ipscan_t *)malloc(sizeof(ipscan_t));
		strncpy_s(pDeviceInfo->ip, sizeof(ipscan->ip), ipscan->ip, strlen(ipscan->ip));
		strncpy_s(pDeviceInfo->mac, sizeof(ipscan->mac), ipscan->mac, strlen(ipscan->mac));
		strncpy_s(pDeviceInfo->manufacturer, sizeof(ipscan->manufacturer), ipscan->manufacturer, strlen(ipscan->manufacturer));
		strncpy_s(pDeviceInfo->netmask, sizeof(ipscan->netmask), ipscan->netmask, strlen(ipscan->netmask));
		strncpy_s(pDeviceInfo->platform, sizeof(ipscan->platform), ipscan->platform, strlen(ipscan->platform));
		strncpy_s(pDeviceInfo->system, sizeof(ipscan->system), ipscan->system, strlen(ipscan->system));
		strncpy_s(pDeviceInfo->version, sizeof(ipscan->version), ipscan->version, strlen(ipscan->version));
		pDeviceInfo->usr_type = ipscan->usr_type;
		try{
			PostMessage(WM_USER_MSG_BATCH, (WPARAM)MSG_DEV_FOUND, (LPARAM)pDeviceInfo);
		}
		catch (...){
			free(pDeviceInfo);
		}
	}	
}


void CBatchDlg::OnDeviceFound(LPARAM l){
	ipscan_t* ipscan = (ipscan_t*)l;
	//人脸设备过滤
		if (ipscan){
		bool nIndex = false;
		if (m_unorder.size() > 0)
		{
			for (auto got : m_unorder)
			{
				if (got.second == ipscan->mac)
				{
					nIndex = true;
					break;
				}
			}
		}
		CString strIp = ipscan->ip;
		CString strIpCom;
		if (!m_Comx)
		{
			return;
		}
		m_Comx.GetWindowTextA(strIpCom);
		int nCurItem = m_Comx.GetCurSel();
		//0只要192.168.1.100 
		if (nCurItem == 1)
		{
			if (strIp == "192.168.1.100")
			{
				return;
			}

		}
		else if (nCurItem == 0)
		{
			if (strIp != "192.168.1.100")
			{
				return;
			}
		}
		if (!nIndex && (m_ListCtrl)){
			int nCount = m_ListCtrl.GetItemCount();
			int nItem = m_ListCtrl.InsertItem(nCount, "");
			CString str;
			str.Format("共%d台设备", nCount + 1);
			m_ListCtrl.SetItemText(nItem, 0, "");
			m_ListCtrl.SetItemText(nItem, 1, ipscan->ip);
			m_ListCtrl.SetItemText(nItem, 2, ipscan->mac);
			m_ListCtrl.SetItemText(nItem, 3, "");
			m_ListCtrl.SetItemData(nItem, nCount);
			AutoAdjustColumnWidth(&m_ListCtrl);
			m_ipscan.push_back(ipscan);
			GetDlgItem(IDC_STC_COUNT)->SetWindowTextA(str);
		}
	}
	//free(ipscan);
}


LRESULT CBatchDlg::OnUserMsg(WPARAM w, LPARAM l)
{
	int nMsgType = (int)w;
	int nIdex = (int)l;
	switch (nMsgType)
	{
	case MSG_DEV_FOUND:
		OnDeviceFound(l);
		return 0l;
	case MSG_CONNECT:
		m_ListCtrl.SetItemText(nIdex, 2, "开始上传镜像");
		break;
	case MSG_CONNECTERROR:
		m_ListCtrl.SetItemText(nIdex, 2, "连接相机失败");
		break;
	case MSG_UPDATE_START:
		m_ListCtrl.SetItemText(nIdex, 2, "已连接相机 上传镜像中...");
		break;
	case MSG_UPDATE_OK:
		m_ListCtrl.SetItemText(nIdex, 2, "镜像上传完成 正在重启...");
		m_ListCtrl.SetItemText(nIdex, 2, "升级完成");
		break;
	case MSG_UPDATE_ERROR:
		m_ListCtrl.SetItemText(nIdex, 2, "升级失败");
		break;
	case MSG_OLDER_START:
		m_ListCtrl.SetItemText(nIdex, 2, "开始老化");
		break;
	case MSG_OLDER_FAIL:
		m_ListCtrl.SetItemText(nIdex, 2, "老化失败");
	case MSG_OLDER_END:
		m_ListCtrl.SetItemText(nIdex, 2, "老化完成");
		break;
	case MSG_OLDER_STOPSTART:
		m_ListCtrl.SetItemText(nIdex, 2, "开始停止");
		break;
	case MSG_OLDER_STOPFAIL:
		m_ListCtrl.SetItemText(nIdex, 2, "停止失败");
	case MSG_OLDER_STOPEND:
		m_ListCtrl.SetItemText(nIdex, 2, "停止完成");
		break;
	default:
		break;
	}
	return(0);
}

void CBatchDlg::AutoAdjustColumnWidth(CListCtrl *pListCtrl)
{
	pListCtrl->SetRedraw(FALSE);
	CHeaderCtrl *pHeader = pListCtrl->GetHeaderCtrl();
	int nColumnCount = pHeader->GetItemCount();
	for (int i = 0; i < nColumnCount; i++)
	{
		pListCtrl->SetColumnWidth(i, LVSCW_AUTOSIZE);
		int nColumnWidth = pListCtrl->GetColumnWidth(i);
		pListCtrl->SetColumnWidth(i, LVSCW_AUTOSIZE_USEHEADER);
		int nHeaderWidth = pListCtrl->GetColumnWidth(i);
		pListCtrl->SetColumnWidth(i, max(nColumnWidth, nHeaderWidth) + 5);
	}
	pListCtrl->SetRedraw(TRUE);
}

void CBatchDlg::OnBnClickedBtnNet()
{
	// TODO: Add your control notification handler code here

	int nChecked = 0;
	for (int i = 0; i < m_ListCtrl.GetItemCount(); i++)
	{
		bool bChecked = m_ListCtrl.GetCheck(i);
		if (bChecked)
		{
			nChecked++;
		}
	}
	
	BYTE start_f1, start_f2, start_f3, start_f4;
	((CIPAddressCtrl*)GetDlgItem(IDC_IP_START))->GetAddress(start_f1, start_f2, start_f3, start_f4);
	m_strIp.Format("%d.%d.%d", start_f1, start_f2, start_f3);
	m_nCurIp = start_f4;

	

	BYTE end_f1, end_f2, end_f3, end_f4;
	((CIPAddressCtrl*)GetDlgItem(IDC_IP_END))->GetAddress(end_f1, end_f2, end_f3, end_f4);	
	m_nEndIp = end_f4;
	int nIPCount = m_nEndIp - start_f4;
	if (nIPCount< nChecked || nIPCount<0)
	{
		AfxMessageBox("IP数量不足 请修改起止IP");
		return;
	}
	for (int i = 0; i < m_ListCtrl.GetItemCount(); i++)
	{
		bool bChecked = m_ListCtrl.GetCheck(i);
		if (bChecked)
		{
			CString strMac = m_ListCtrl.GetItemText(i, 2);
			if (m_nCurIp <= m_nEndIp)
			{
				CString strIp, strGate, strNet;
				BYTE Gate_f1, Gate_f2, Gate_f3, Gate_f4;
				strIp.Format("%s.%d", m_strIp, m_nCurIp++);
				((CIPAddressCtrl*)GetDlgItem(IDC_IP_GATE))->GetAddress(Gate_f1, Gate_f2, Gate_f3, Gate_f4);
				strGate.Format("%d.%d.%d.%d", Gate_f1, Gate_f2, Gate_f3, Gate_f4);
				((CIPAddressCtrl*)GetDlgItem(IDC_IPA_NET))->GetAddress(Gate_f1, Gate_f2, Gate_f3, Gate_f4);
				strNet.Format("%d.%d.%d.%d", Gate_f1, Gate_f2, Gate_f3, Gate_f4);
				ZBX_SetIpBymac(strMac, strIp, strNet, strGate);
				m_ListCtrl.SetItemText(i, 3, "已完成");
			}
		}
	}
}

DWORD WINAPI ThreadProcB(LPVOID lpParam){
	if (lpParam)
	{
		CBatchDlg* dlg = (CBatchDlg*)lpParam;
		dlg->UpdataThread();
	}
	return 0;
}

void CBatchDlg::OnBnClickedButton10()
{
	// TODO: Add your control notification handler code here
	m_mapChecked.clear();
	for (int i = 0; i < m_ListCtrl.GetItemCount(); i++)
	{
		bool bChecked = m_ListCtrl.GetCheck(i);
		if (bChecked)
		{
			std::string strIp = m_ListCtrl.GetItemText(i, 1);
			std::lock_guard<std::mutex> guard(m_mutex);
			m_mapChecked[i] = strIp;
			int nData = m_ListCtrl.GetItemData(i);
			m_vector_index.push_back(nData);
		}
	}
	if (m_mapChecked.size()==0)
	{
		AfxMessageBox("请先选择需要升级的设备");
		return;
	}
	m_bThread = true;
	for (int i = 0; i < MAX_THREAD_NUM; i++)
	{
		CreateThread(NULL, 0, ThreadProcB, this, 0, NULL);
	}
}


void CBatchDlg::OnBnClickedBtnSelect()
{
	// TODO: Add your control notification handler code here
	LPCTSTR lpszFilter = "All Files (*.*) |*.*||";
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
		m_filePath = filepath;
		GetDlgItem(IDC_EDIT2)->SetWindowTextA(filepath);
	}
}
void CBatchDlg::UpdataThread(){
	while (m_bThread)
	{
		m_mutex.lock();
		int Lentj = m_vector_index.size();
		m_mutex.unlock();
		if (Lentj>0){
			//std::lock_guard<std::mutex> guard(m_mutex);
			m_mutex.lock();
			int nData = m_vector_index.front();
			m_vector_index.erase(remove(m_vector_index.begin(), m_vector_index.end(), nData), m_vector_index.end());
			m_mutex.unlock();

			int nIdex = -1;
			for (int i = 0; i < m_ListCtrl.GetItemCount(); i++)
			{
				int ItemData = m_ListCtrl.GetItemData(i);
				if (nData == ItemData)
				{
					nIdex = i;
					break;
				}
			}
			if (nIdex<0)
			{
				continue;
			}
			
			PostMessage(WM_USER_MSG_BATCH, (WPARAM)MSG_CONNECT, (LPARAM)nIdex);
			//m_ListCtrl.SetItemText(nIdex, 2, "开始上传镜像");

			std::string strip = m_mapChecked[nIdex];
			int err_code;
			ZBX_Cam* cam = ZBX_ConnectEx(strip.c_str(), 8099, "", "", &err_code, 0, 0);
			if (!cam)
			{
				//m_ListCtrl.SetItemText(nIdex, 2, "连接相机失败");
				PostMessage(WM_USER_MSG_BATCH, (WPARAM)MSG_CONNECTERROR, (LPARAM)nIdex);
				continue;
			}
			//m_ListCtrl.SetItemText(nIdex, 2, "已连接相机 上传镜像中...");
			PostMessage(WM_USER_MSG_BATCH, (WPARAM)MSG_UPDATE_START, (LPARAM)nIdex);
			int iRet = ZBX_UpdateSystem((ZBX_Cam*)cam, m_filePath.GetBuffer());
			m_filePath.ReleaseBuffer();
			if (iRet == 0)
			{
// 				m_ListCtrl.SetItemText(nIdex, 2, "镜像上传完成 正在重启...");
// 				m_ListCtrl.SetItemText(nIdex, 2, "升级完成");
				PostMessage(WM_USER_MSG_BATCH, (WPARAM)MSG_UPDATE_OK, (LPARAM)nIdex);
				
			}
			else
			{
				PostMessage(WM_USER_MSG_BATCH, (WPARAM)MSG_UPDATE_ERROR, (LPARAM)nIdex);
			}
			m_mutex.lock();
			Lentj = m_vector_index.size();
			m_mutex.unlock();
			if (Lentj==0)
			{
				m_bThread = false;
			}
		}
		else
		{
			std::this_thread::sleep_for(std::chrono::milliseconds(800));

		}
		
	}
	return;
}

void CBatchDlg::OnClose()
{
	// TODO: Add your message handler code here and/or call default
	
	ZBX_RegDiscoverIpscanCb(NULL, (LPARAM)NULL);
	std::this_thread::sleep_for(std::chrono::milliseconds(500));
	m_ListCtrl.DeleteAllItems();
	for (auto i : m_ipscan)
	{
		free(i);
	}
	CDialogEx::OnClose();
}


BOOL CBatchDlg::PreTranslateMessage(MSG* pMsg)
{
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


void CBatchDlg::OnBnClickedBtnSearch()
{
	// TODO: Add your control notification handler code here
	m_unorder.clear();
	m_ListCtrl.DeleteAllItems();
	ZBX_RegDiscoverIpscanCb(DeviceDiscoverCb, (LPARAM)this);
	ZBX_DiscoverIpscan();
}


void CBatchDlg::OnNMDblclkList1(NMHDR *pNMHDR, LRESULT *pResult)
{
	LPNMITEMACTIVATE pNMItemActivate = reinterpret_cast<LPNMITEMACTIVATE>(pNMHDR);
	// TODO:  在此添加控件通知处理程序代码
	if (pNMItemActivate->iItem != -1)
	{
		int nSelect = pNMItemActivate->iItem;
		CString strIp = m_ListCtrl.GetItemText(nSelect, 1);
		ShellExecute(0, "open", "AutoFactoryTest.exe", strIp, "", SW_SHOW);
	}
	*pResult = 0;
}


void CBatchDlg::OnBnClickedButton1()
{
	// TODO:  在此添加控件通知处理程序代码
	m_listTask.AddHead(1);
	
}
void CBatchDlg::Run()
{
	int iCmd = -1;
	if (m_listTask.IsEmpty())
		return;

	iCmd = m_listTask.RemoveHead();
	if (iCmd==1)
	{
		TrdBatchOld();
	}else if (iCmd==2)
	{
		TrdBatchOldStop();
	}
}

void CBatchDlg::TrdBatchOld(){
	for (int i = 0; i < m_ListCtrl.GetItemCount(); i++)
	{
		bool bChecked = m_ListCtrl.GetCheck(i);
		if (bChecked)
		{
			CString strIp = m_ListCtrl.GetItemText(i,1);
			PostMessage(WM_USER_MSG_BATCH, (WPARAM)MSG_CONNECT, (LPARAM)i);
			int err_code;
			ZBX_Cam* cam = ZBX_ConnectEx(strIp, 8099, "", "", &err_code, 0, 0);
			if (!cam)
			{
				//m_ListCtrl.SetItemText(nIdex, 2, "连接相机失败");
				PostMessage(WM_USER_MSG_BATCH, (WPARAM)MSG_CONNECTERROR, (LPARAM)i);
				continue;
			}
			PostMessage(WM_USER_MSG_BATCH, (WPARAM)MSG_OLDER_START, (LPARAM)i);
			int nRet = ZBX_SetAging(cam, 1);
			if (nRet==0)
			{
				PostMessage(WM_USER_MSG_BATCH, (WPARAM)MSG_OLDER_FAIL, (LPARAM)i);
			}
			else
			{
				PostMessage(WM_USER_MSG_BATCH, (WPARAM)MSG_OLDER_END, (LPARAM)i);
			}
		}
	}
}
void CBatchDlg::TrdBatchOldStop(){
	for (int i = 0; i < m_ListCtrl.GetItemCount(); i++)
	{
		bool bChecked = m_ListCtrl.GetCheck(i);
		if (bChecked)
		{
			CString strIp = m_ListCtrl.GetItemText(i, 1);
			PostMessage(WM_USER_MSG_BATCH, (WPARAM)MSG_CONNECT, (LPARAM)i);
			int err_code;
			ZBX_Cam* cam = ZBX_ConnectEx(strIp, 8099, "", "", &err_code, 0, 0);
			if (!cam)
			{
				//m_ListCtrl.SetItemText(nIdex, 2, "连接相机失败");
				PostMessage(WM_USER_MSG_BATCH, (WPARAM)MSG_CONNECTERROR, (LPARAM)i);
				continue;
			}
			PostMessage(WM_USER_MSG_BATCH, (WPARAM)MSG_OLDER_STOPSTART, (LPARAM)i);
			int nRet = ZBX_SetAging(cam, 0);
			if (nRet == 0)
			{
				PostMessage(WM_USER_MSG_BATCH, (WPARAM)MSG_OLDER_STOPFAIL, (LPARAM)i);
			}
			else
			{
				PostMessage(WM_USER_MSG_BATCH, (WPARAM)MSG_OLDER_STOPEND, (LPARAM)i);
			}
		}
	}
}

void CBatchDlg::OnBnClickedButton14()
{
	// TODO:  在此添加控件通知处理程序代码
	m_listTask.AddHead(2);
}


void CBatchDlg::OnBnClickedBtnInit()
{
	// TODO:  在此添加控件通知处理程序代码
	for (int i = 0; i < m_ListCtrl.GetItemCount(); i++)
	{
		bool bChecked = m_ListCtrl.GetCheck(i);
		if (bChecked)
		{
			CString strMac = m_ListCtrl.GetItemText(i, 2);
			ZBX_SetIpBymac(strMac, "192.168.1.100", "255.255.255.0", "192.168.1.1");
			m_ListCtrl.SetItemText(i, 3, "已完成");
		}
	}
}

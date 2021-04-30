// VzFaceSDKDemoDlg.cpp : 实现文件
//

#include "stdafx.h"
#include "VzFaceSDKDemo.h"
#include "VzFaceSDKDemoDlg.h"
#include "FaceManagerDlg.h"
#include "BasicsDlg.h"
#include "VzString.h"
#include "BatchDlg.h"
#include "AlgorithmDlg.h"
#include <algorithm>
#include "Fun_SeniorsDlg.h"
#include "SystemSetDlg.h"
#include "AddFaceDlg.h"
#include "Fun_MangDlg.h"
#include "Fun_SystemSetDlg.h"
#include <direct.h>
#include "RecordInfoDlg.h"
#include "DlgPicSavePath.h"
#ifdef _DEBUG
#define new DEBUG_NEW
#endif



typedef struct tagDEVICE_INFO
{
	char szIPAddr[16];
	WORD usPort1;
}DEVICE_INFO;

void SDK_CALL g_discover_ipscan_cb_t(const struct ipscan_t* ipscan,
	size_int usr_param)
{
	CVzFaceSDKDemoDlg *pInstance = (CVzFaceSDKDemoDlg *)usr_param;
	if (pInstance != NULL && ipscan != NULL)
	{
		pInstance->OnDevFound("", ipscan->ip, 8099, 0, 0, 0, "", "");
	}
}

void CALLBACK iOnViewerMouse(IV_EVENT eEvent, int x, int y, void *pUserData, int nId)
{
	CVzFaceSDKDemoDlg *pInstance = (CVzFaceSDKDemoDlg *)pUserData;
	if ( pInstance != NULL )
	{
		pInstance->OnViewerMouse0(eEvent, x, y, nId);
	}
}


static void SDK_CALL RegFaceRecofunCb_t(ZBX_Cam* cam, const FaceRecoInfo* face_reco_info, void* usrParam)
{
	if (face_reco_info && usrParam) {
		CVzFaceSDKDemoDlg *pInstance = (CVzFaceSDKDemoDlg *)usrParam;
		pInstance->UpdataInfo(cam, face_reco_info, TYPE_NORMAL);
	}

}

void SDK_CALL RegFaceRecofunCb_OffLine(ZBX_Cam* cam, const FaceRecoInfo* face_reco_info, void* usrParam){
	if (face_reco_info && usrParam) {
		CVzFaceSDKDemoDlg *pInstance = (CVzFaceSDKDemoDlg *)usrParam;
		pInstance->UpdataInfo(cam, face_reco_info, TYPE_OFFLINE);
	}
}
void SDK_CALL SDK_RegConnectEvent_CB(ZBX_Cam* cam, const char* ip, unsigned short port, int event, size_int usrParam)
{
	if (ip != NULL)
	{
		if (!usrParam)
		{
			return;
		}
		CVzFaceSDKDemoDlg *pInstance = (CVzFaceSDKDemoDlg *)usrParam;
		pInstance->OnDevStatus(ip, port, event);
		if (event)
		{
			ZBX_GetUserRightsCfg(cam);
		}
	}
	return;
}


void SDK_CALL SDK_IDCardRecordCb(ZBX_Cam* cam,
	const IDCardRecord* alarmRecord,
	const void* usrParam){
	if (alarmRecord && usrParam) {
		CVzFaceSDKDemoDlg *pInstance = (CVzFaceSDKDemoDlg *)usrParam;
		pInstance->UpdataIDCardRecord(cam,alarmRecord);
	}
}

// 用于应用程序“关于”菜单项的 CAboutDlg 对话框

class CAboutDlg : public CDialog
{
public:
	CAboutDlg();

// 对话框数据
	enum { IDD = IDD_ABOUTBOX };

	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV 支持

// 实现
protected:
	DECLARE_MESSAGE_MAP()
};

CAboutDlg::CAboutDlg() : CDialog(CAboutDlg::IDD)
{
}

void CAboutDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
}

BEGIN_MESSAGE_MAP(CAboutDlg, CDialog)
END_MESSAGE_MAP()


// CVzFaceSDKDemoDlg 对话框




CVzFaceSDKDemoDlg::CVzFaceSDKDemoDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CVzFaceSDKDemoDlg::IDD, pParent)
{
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);
}

void CVzFaceSDKDemoDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	DDX_Control(pDX, IDC_LIST_SEARCH_DEVICE, m_ListDevice);
	DDX_Control(pDX, IDC_LIST_OPENED_DEVICE, m_lstOpenDevice);
	DDX_Control(pDX, IDC_VIDEO_1, m_video_wnd1);
	DDX_Control(pDX, IDC_VIDEO_2, m_video_wnd2);
	DDX_Control(pDX, IDC_LIST_PASS_FACE, m_lstPassFace);
	DDX_Control(pDX, IDC_LIST_NO_PASS_FACE, m_lstNoPassFace);
}

BEGIN_MESSAGE_MAP(CVzFaceSDKDemoDlg, CDialog)
	ON_WM_SYSCOMMAND()
	ON_WM_PAINT()
	ON_WM_QUERYDRAGICON()
	//}}AFX_MSG_MAP
	ON_BN_CLICKED(IDC_BTN_START, &CVzFaceSDKDemoDlg::OnBnClickedBtnStart)
	ON_MESSAGE(WM_USER_MSG, &CVzFaceSDKDemoDlg::OnUserMsg)
	ON_MESSAGE(WM_CHANGE_CAMERA_STATUS_MSG, &CVzFaceSDKDemoDlg::OnChangeCameraStatus)
	ON_WM_CLOSE()
	ON_NOTIFY(NM_CLICK, IDC_LIST_SEARCH_DEVICE, &CVzFaceSDKDemoDlg::OnNMClickListSearchDevice)
	ON_BN_CLICKED(IDC_BTN_OPEN, &CVzFaceSDKDemoDlg::OnBnClickedBtnOpen)
	ON_BN_CLICKED(IDC_BTN_OUTPUT, &CVzFaceSDKDemoDlg::OnBnClickedBtnOutput)
	ON_BN_CLICKED(IDC_BTN_CLOSE, &CVzFaceSDKDemoDlg::OnBnClickedBtnClose)
	ON_BN_CLICKED(IDC_BTN_STOP_PLAY, &CVzFaceSDKDemoDlg::OnBnClickedBtnStopPlay)
	ON_NOTIFY(NM_CLICK, IDC_LIST_OPENED_DEVICE, &CVzFaceSDKDemoDlg::OnNMClickListOpenedDevice)
	ON_BN_CLICKED(IDC_BTN_MANAGER_PEOPLE, &CVzFaceSDKDemoDlg::OnBnClickedBtnManagerPeople)
	ON_BN_CLICKED(IDC_BTN_BASESETTING, &CVzFaceSDKDemoDlg::OnBnClickedBtnBasesetting)
	ON_NOTIFY(LVN_ITEMCHANGED, IDC_LIST_PASS_FACE, &CVzFaceSDKDemoDlg::OnItemchangedListPassFace)
	ON_BN_CLICKED(IDC_BTN_BASESETTING2, &CVzFaceSDKDemoDlg::OnBnClickedBtnBasesetting2)
	ON_BN_CLICKED(IDC_BTN_MANAGER_PEOPLE2, &CVzFaceSDKDemoDlg::OnBnClickedBtnManagerPeople2)
	ON_BN_CLICKED(IDC_BTN_BASESETTING4, &CVzFaceSDKDemoDlg::OnBnClickedBtnBasesetting4)
	ON_BN_CLICKED(IDC_BTN_BASESETTING3, &CVzFaceSDKDemoDlg::OnBnClickedBtnBasesetting3)
	ON_NOTIFY(LVN_ITEMCHANGED, IDC_LIST_NO_PASS_FACE, &CVzFaceSDKDemoDlg::OnItemchangedListNoPassFace)
	ON_NOTIFY(LVN_ITEMCHANGED, IDC_LIST_OPENED_DEVICE, &CVzFaceSDKDemoDlg::OnItemchangedListOpenedDevice)
	ON_NOTIFY(NM_RCLICK, IDC_LIST_NO_PASS_FACE, &CVzFaceSDKDemoDlg::OnRclickListNoPassFace)
	ON_COMMAND(IDC_ADDTOFACE, &CVzFaceSDKDemoDlg::OnAddtoface)
	ON_COMMAND(IDC_OPENPATH, &CVzFaceSDKDemoDlg::OnOpenpath)
	ON_COMMAND(IDC_OPENPATH2, &CVzFaceSDKDemoDlg::OnOpenpath)
	ON_NOTIFY(NM_RCLICK, IDC_LIST_PASS_FACE, &CVzFaceSDKDemoDlg::OnRclickListPassFace)

	//ON_CONTROL_REFLECT(BN_CLICKED, &CVzFaceSDKDemoDlg::OnBnClicked)
	ON_BN_CLICKED(IDC_BTN_VIDEO, &CVzFaceSDKDemoDlg::OnBnClickedBtnVideo)
	ON_BN_CLICKED(IDC_BTN_CUT, &CVzFaceSDKDemoDlg::OnBnClickedBtnCut)
	ON_BN_CLICKED(IDC_BTN_VIDEO2, &CVzFaceSDKDemoDlg::OnBnClickedBtnVideo2)
	ON_BN_CLICKED(IDC_BTN_CUT2, &CVzFaceSDKDemoDlg::OnBnClickedBtnCut2)
	ON_MESSAGE(WM_BN_CLICK, OnBtnListClicked)
	ON_NOTIFY(NM_CLICK, IDC_LIST_PASS_FACE, &CVzFaceSDKDemoDlg::OnClickListPassFace)
	ON_NOTIFY(NM_CLICK, IDC_LIST_NO_PASS_FACE, &CVzFaceSDKDemoDlg::OnClickListNoPassFace)
	ON_BN_CLICKED(IDC_BUTTON13, &CVzFaceSDKDemoDlg::OnBnClickedButton13)
	ON_BN_CLICKED(IDC_BTN_PICSET, &CVzFaceSDKDemoDlg::OnBnClickedBtnPicset)
//	ON_NOTIFY(LVN_ITEMCHANGING, IDC_LIST_NO_PASS_FACE, &CVzFaceSDKDemoDlg::OnLvnItemchangingListNoPassFace)
//ON_NOTIFY(LVN_ITEMCHANGED, IDC_LIST_NO_PASS_FACE, &CVzFaceSDKDemoDlg::OnLvnItemchangedListNoPassFace)
ON_STN_DBLCLK(IDC_VIDEO_1, &CVzFaceSDKDemoDlg::OnDblclkVideo1)
ON_STN_DBLCLK(IDC_VIDEO_2, &CVzFaceSDKDemoDlg::OnDblclkVideo2)
ON_BN_CLICKED(IDC_BTN_CLEAR, &CVzFaceSDKDemoDlg::OnBnClickedBtnClear)
ON_BN_CLICKED(IDC_BTN_UNCLEAR, &CVzFaceSDKDemoDlg::OnBnClickedBtnUnclear)
END_MESSAGE_MAP()


// CVzFaceSDKDemoDlg 消息处理程序

BOOL CVzFaceSDKDemoDlg::OnInitDialog()
{
	CDialog::OnInitDialog();

	// 将“关于...”菜单项添加到系统菜单中。

	// IDM_ABOUTBOX 必须在系统命令范围内。
	ASSERT((IDM_ABOUTBOX & 0xFFF0) == IDM_ABOUTBOX);
	ASSERT(IDM_ABOUTBOX < 0xF000);

	CMenu* pSysMenu = GetSystemMenu(FALSE);
	if (pSysMenu != NULL)
	{
		CString strAboutMenu;
		strAboutMenu.LoadString(IDS_ABOUTBOX);
		if (!strAboutMenu.IsEmpty())
		{
			pSysMenu->AppendMenu(MF_SEPARATOR);
			pSysMenu->AppendMenu(MF_STRING, IDM_ABOUTBOX, strAboutMenu);
		}
	}

	// 设置此对话框的图标。当应用程序主窗口不是对话框时，框架将自动
	//  执行此操作
	SetIcon(m_hIcon, TRUE);			// 设置大图标
	SetIcon(m_hIcon, FALSE);		// 设置小图标

	// TODO: 在此添加额外的初始化代码
	ZBX_Init();
	ZBX_SetNotifyConnected(1);
	size_int data = (size_int)this;
	ZBX_RegConnectEventCb(SDK_RegConnectEvent_CB, (size_int)data);
	//ZBX_RegConnectEventCb(SDK_RegConnectEvent_CB,0);
	m_ListDevice.InsertColumn( 0, "设备IP",   LVCFMT_LEFT, 175);

	m_lstOpenDevice.InsertColumn(0, "设备IP", LVCFMT_LEFT, 140);
	m_lstOpenDevice.InsertColumn(1, "状态", LVCFMT_LEFT, 80);
	m_lstOpenDevice.SetExtendedStyle(LVS_EX_FULLROWSELECT | LVS_EX_HEADERDRAGDROP | LVS_EX_GRIDLINES);

	//m_lstPassFace.SetRowHeigt(40);
	//m_lstPassFace.SetLineSelectMode(true);
	//m_lstPassFace.InsertColumn(0, "姓名", DT_CENTER, 60);
	//m_lstPassFace.InsertColumn(1, "ID", DT_CENTER, 50);
	//m_lstPassFace.InsertColumn(2, "时间", DT_CENTER, 120);
	//m_lstPassFace.InsertColumn(3, "相似度", DT_CENTER, 80);
	//m_lstPassFace.InsertColumn(4, "设备IP", DT_CENTER, 100);
	//m_lstPassFace.InsertColumn(5, "更多信息", DT_CENTER, 100);
	//m_lstPassFace.InsertColumn(3, "戴帽状态", LVCFMT_CENTER, 100);
	//m_lstPassFace.InsertColumn(4, "比对模板", LVCFMT_CENTER, 120);
	//m_lstPassFace.InsertColumn(5, "备注", LVCFMT_CENTER, 40);
	m_lstPassFace.InsertColumn(0, "姓名", LVCFMT_CENTER, 60);
	m_lstPassFace.InsertColumn(1, "ID", LVCFMT_CENTER, 50);
	m_lstPassFace.InsertColumn(2, "时间", LVCFMT_CENTER, 160);
	m_lstPassFace.InsertColumn(3, "相似度", LVCFMT_CENTER, 80);
	m_lstPassFace.InsertColumn(4, "设备IP", LVCFMT_CENTER, 100);
	m_lstPassFace.InsertColumn(5, "更多信息", LVCFMT_CENTER, 85);
	m_lstPassFace.SetExtendedStyle(LVS_EX_FULLROWSELECT | LVS_EX_HEADERDRAGDROP | LVS_EX_GRIDLINES);

	//m_lstNoPassFace.SetRowHeigt(25);
	////m_lstNoPassFace.SetLineSelectMode(true);
	//m_lstNoPassFace.InsertColumn(0, "时间", DT_CENTER, 200);
	//m_lstNoPassFace.InsertColumn(1, "设备IP", DT_CENTER, 150);
	//m_lstNoPassFace.InsertColumn(2, "添加", DT_CENTER, 180);
	m_lstNoPassFace.InsertColumn(0, "时间", LVCFMT_CENTER, 200);
	m_lstNoPassFace.InsertColumn(1, "设备IP", LVCFMT_CENTER, 150);
	m_lstNoPassFace.InsertColumn(2, "添加", LVCFMT_CENTER, 180);

	//m_lstNoPassFace.InsertColumn(0, "时间", LVCFMT_LEFT, 160);
	//m_lstNoPassFace.InsertColumn(1, "戴帽状态", LVCFMT_CENTER, 140);
	//m_lstNoPassFace.InsertColumn(2, "比对模板", LVCFMT_CENTER, 140);
	m_lstNoPassFace.SetExtendedStyle(LVS_EX_FULLROWSELECT | LVS_EX_HEADERDRAGDROP | LVS_EX_GRIDLINES);

	char device_ip[32] = {0};

	std::string txt_path = GetAppPath();
	txt_path.append("\\device.txt");
	ReadTextFile(txt_path.c_str(), device_ip, 32);
	
	SetDlgItemText(IDC_IPADDR, device_ip);

	SetDlgItemText(IDC_EDIT_USERNAME, "admin");
	SetDlgItemText(IDC_EDIT_PASSWORD, "admin");

	m_video_wnd1.SetInteractCallback(iOnViewerMouse, this);
	m_video_wnd1.SetID(0);
	m_video_wnd1.SetActive(true);

	m_video_wnd2.SetInteractCallback(iOnViewerMouse, this);
	m_video_wnd2.SetID(1);

	//m_SaveDatePath = GetAppPath().c_str();
	m_SaveDatePath.Format("%s\\face", GetAppPath().c_str());
	CString str;
	char strPath[MAX_PATH] = { 0 };
	GetPrivateProfileStringA("SET", "PicPath", "", strPath, MAX_PATH, ".\\Demo.ini");
	str.Format("%s", strPath);
	if (!str.IsEmpty())
	{
		m_SaveDatePath.Format("%s\\face",str);
	}
	OnShowVideoButton(1, false);
	OnShowVideoButton(2, false);

	if (__argc >= 3)
	{
		std::string argvx = __argv[1];
		if (argvx == "\/u")
		{
			argvx = __argv[2];
			if (argvx == "9527")
			{
				theApp.m_nCustomMade = 1;
			} 
		}
	}	
	return TRUE;  // 除非将焦点设置到控件，否则返回 TRUE
}

void CVzFaceSDKDemoDlg::OnSysCommand(UINT nID, LPARAM lParam)
{
	if ((nID & 0xFFF0) == IDM_ABOUTBOX)
	{
		CAboutDlg dlgAbout;
		dlgAbout.DoModal();
	}
	else
	{
		CDialog::OnSysCommand(nID, lParam);
	}
}

// 如果向对话框添加最小化按钮，则需要下面的代码
//  来绘制该图标。对于使用文档/视图模型的 MFC 应用程序，
//  这将由框架自动完成。

void CVzFaceSDKDemoDlg::OnPaint()
{
	if (IsIconic())
	{
		CPaintDC dc(this); // 用于绘制的设备上下文

		SendMessage(WM_ICONERASEBKGND, reinterpret_cast<WPARAM>(dc.GetSafeHdc()), 0);

		// 使图标在工作区矩形中居中
		int cxIcon = GetSystemMetrics(SM_CXICON);
		int cyIcon = GetSystemMetrics(SM_CYICON);
		CRect rect;
		GetClientRect(&rect);
		int x = (rect.Width() - cxIcon + 1) / 2;
		int y = (rect.Height() - cyIcon + 1) / 2;

		// 绘制图标
		dc.DrawIcon(x, y, m_hIcon);
	}
	else
	{
		CDialog::OnPaint();
	}
}

//当用户拖动最小化窗口时系统调用此函数取得光标
//显示。
HCURSOR CVzFaceSDKDemoDlg::OnQueryDragIcon()
{
	return static_cast<HCURSOR>(m_hIcon);
}


void CVzFaceSDKDemoDlg::OnBnClickedBtnStart()
{
	DeleteDeviceInfo( );

	ZBX_DiscoverIpscan();
	ZBX_RegDiscoverIpscanCb(g_discover_ipscan_cb_t, (size_int)this);
}

void CVzFaceSDKDemoDlg::OnClose()
{
	for(int n = 0; n < m_vDev.size(); n++)
	{
		// VzLPRClient_CloseByIP(m_vDev[n]->strIP);
	}

	// TODO: Add your message handler code here and/or call default

	DeleteDeviceInfo( );

	ZBX_DiscoverIpscan();
	ZBX_DeInit();
	CDialog::OnClose();
}

void CVzFaceSDKDemoDlg::OnDevFound(const char *pStrDevName, const char *pStrIPAddr, WORD usPort1, WORD usPort2, unsigned int SL, unsigned int SH, char* netmask, char* gateway)
{
	if( pStrIPAddr != NULL )
	{
		DEVICE_INFO  *pDeviceInfo = (DEVICE_INFO *)malloc( sizeof(DEVICE_INFO) );
		strncpy_s(pDeviceInfo->szIPAddr, sizeof(pDeviceInfo->szIPAddr), pStrIPAddr, strlen(pStrIPAddr) );
		pDeviceInfo->usPort1 = usPort1;

		PostMessage(WM_USER_MSG, (WPARAM)MSG_DEV_FOUND, (LPARAM)pDeviceInfo);
	}
}

void CVzFaceSDKDemoDlg::OnDevStatus(const char *pStrIPAddr, WORD usPort1,int event)
{
	if (pStrIPAddr != NULL)
	{
		DEVICE_INFO *pDeviceInfo = (DEVICE_INFO *)malloc(sizeof(DEVICE_INFO));
		strncpy_s(pDeviceInfo->szIPAddr, sizeof(pDeviceInfo->szIPAddr), pStrIPAddr, strlen(pStrIPAddr));
		pDeviceInfo->usPort1 = usPort1;
		PostMessage(WM_CHANGE_CAMERA_STATUS_MSG, (WPARAM)event, (LPARAM)pDeviceInfo);
	}
}
bool lessthen (const std::string& ip1, const std::string& ip2)
{
	vector<string> ipVec1;
	CVzString::split(string(ip1), string("."), &ipVec1);

	vector<string> ipVec2;
	CVzString::split(string(ip2), string("."), &ipVec2);

	if (ipVec1.size() == 4 && ipVec2.size() == 4)
	{
		for (int nIndex = 0; nIndex < 4; ++nIndex)
		{
			int nVal1 = atoi(ipVec1[nIndex].c_str());
			int nVal2 = atoi(ipVec2[nIndex].c_str());
			if (nVal1 < nVal2)
				return true;
			else if (nVal1 > nVal2)
				return false;
		}
	}
	return false;
};

LRESULT CVzFaceSDKDemoDlg::OnUserMsg(WPARAM w,LPARAM l)
{
	switch((int)w)
	{
	case MSG_DEV_FOUND:
		OnDeviceFound(l);
		break;

	case MSG_FACE_RESULT:
		ShowFaceResult(l, TYPE_NORMAL);
		break;
	case MSG_FACE_OFFLINE:
		ShowFaceResult(l, TYPE_OFFLINE);
		break;
	case MSG_IDCARD_RESULT:
		ShoWIdCardResult(l);
		break;
	case MSG_SYNC_JUR:
		OnSyncUserRightCfgs(l);
		break;
	default:
		break;
	}

	return(0);
}


void CVzFaceSDKDemoDlg::OnSyncUserRightCfgs(LPARAM l){
	if (!CheckCamera())
	{
		AfxMessageBox("请先选择在线设备");
		return;
	}
	ZBX_GetUserRightsCfg(GetItemHandle());
	if (l)
	{
		CWnd *wnd = (CWnd*)l;
		wnd->SendMessage(WM_USER_MSG, WM_UPDATEUI_MSG, NULL);
	}
}
LRESULT CVzFaceSDKDemoDlg::OnChangeCameraStatus(WPARAM w, LPARAM l){
	
	int nEvent = (int) w;
	DEVICE_INFO *pDevInfo = (DEVICE_INFO *)l;
	if (pDevInfo != NULL)
	{
		for (int i = 0; i < m_lstOpenDevice.GetItemCount(); ++i)
		{
			CString strCameraIP = m_lstOpenDevice.GetItemText(i, 0);
			if (!strCameraIP.IsEmpty())
			{
				if (strCameraIP == pDevInfo->szIPAddr)
				{
					if (!nEvent)
					{
						m_lstOpenDevice.SetItemText(i, 1, "离线");
					}
					else{
						m_lstOpenDevice.SetItemText(i, 1, "在线");
					}
					
				}				
			}
		}
		free(pDevInfo);
	}
	return 1l;
}
void CVzFaceSDKDemoDlg::OnDeviceFound(LPARAM l)
{
	DEVICE_INFO *pDevInfo = (DEVICE_INFO *)l;
	if( pDevInfo != NULL )
	{
		int nIndex = 0;

		//根据IP大小进行排序
		//插入到链表的中间部分
		for (int it = 0; it < m_ListDevice.GetItemCount(); ++it)
		{
			DEVICE_INFO *pCompareItem = (DEVICE_INFO *)m_ListDevice.GetItemData(it);		

		}	

		m_ListDevice.InsertItem(nIndex, pDevInfo->szIPAddr);
		m_ListDevice.SetItemState(nIndex, LVNI_FOCUSED | LVIS_SELECTED, LVNI_FOCUSED | LVIS_SELECTED);
		m_ListDevice.SetItemData(nIndex, (DWORD_PTR)pDevInfo);

		//默认选中第一个
		m_ListDevice.SetSelectionMark(0);
	}
}

void CVzFaceSDKDemoDlg::DeleteDeviceInfo( )
{
	for (int i = 0; i < m_ListDevice.GetItemCount(); ++i)
	{
		DEVICE_INFO *pInfo = (DEVICE_INFO *)m_ListDevice.GetItemData(i);
		if( pInfo != NULL )
		{
			
			free(pInfo);
		}
	}

	m_ListDevice.DeleteAllItems();

	for(int n = 0; n < m_vDev.size(); n++)
	{
		VzLPRClientHandle handle = m_vDev[n]->hLPRClient;
		ZBX_RegFaceRecoCb(handle, NULL, NULL);
		ZBX_RegFaceOffLineRecoCb(handle, NULL, NULL);
		ZBX_RegIDCardRecordCb(handle, NULL, NULL);
		delete m_vDev[n];
	}

	m_vDev.clear();
}

void CVzFaceSDKDemoDlg::OnNMClickListSearchDevice(NMHDR *pNMHDR, LRESULT *pResult)
{
	LPNMITEMACTIVATE pNMItemActivate = reinterpret_cast<LPNMITEMACTIVATE>(pNMHDR);
	// TODO: Add your control notification handler code here
	if (pNMItemActivate->iItem < 0)
		return;

	DEVICE_INFO *pLoginInfo = (DEVICE_INFO *)(m_ListDevice.GetItemData(pNMItemActivate->iItem));
	if( pLoginInfo == NULL )
	{
		return;
	}

	SetDlgItemText(IDC_IPADDR, pLoginInfo->szIPAddr);

	*pResult = 0;
}

// 打开设备
void CVzFaceSDKDemoDlg::OnBnClickedBtnOpen()
{
	char strIP[256];
	char strUserName[32];
	char strPassword[32];
	GetDlgItemText(IDC_IPADDR, strIP, 256);
	GetDlgItemText(IDC_EDIT_USERNAME, strUserName, 32);
	GetDlgItemText(IDC_EDIT_PASSWORD, strPassword, 32);
	int nCout = m_lstOpenDevice.GetItemCount();
	if (nCout>0)
	{
		for (int i = 0; i < nCout;i++)
		{
			CString strIp = m_lstOpenDevice.GetItemText(i,0);
			CString strIpTmp = strIP;
			if (strIp == strIpTmp)
			{
				AfxMessageBox("已打开该设备 请勿重新打开");
				return;
			}
		}
	}	

	int error_num = 0;
	ZBX_Cam* hLPRClient = ZBX_ConnectEx(strIP, 8099, "", "", &error_num, 0, 1);
	if (!hLPRClient)
	{
		char strMsg[128];
		sprintf_s(strMsg, 128, "设备[%s]打开失败，请确认设备已连接", strIP);
		MessageBox(strMsg);
		return;
	}

	//OnCreateDir(strIP, hLPRClient);
	ZBX_RegFaceRecoCb(hLPRClient, RegFaceRecofunCb_t, this);
	ZBX_RegFaceOffLineRecoCb(hLPRClient, RegFaceRecofunCb_OffLine, this);
	ZBX_RegIDCardRecordCb(hLPRClient,SDK_IDCardRecordCb, this);
	int count = m_lstOpenDevice.GetItemCount();
	int index = m_lstOpenDevice.InsertItem(0, strIP);
	if (1==ZBX_Connected(hLPRClient))
	{
		m_lstOpenDevice.SetItemText(index, 1, "在线");

	}
	else
	{
		m_lstOpenDevice.SetItemText(index, 1, "离线");
	}	
	m_lstOpenDevice.SetItemState(index, LVNI_FOCUSED | LVIS_SELECTED, LVNI_FOCUSED | LVIS_SELECTED);
	m_lstOpenDevice.SetItemData(index, (DWORD_PTR)hLPRClient);

	std::string txt_path = GetAppPath();
	txt_path.append("\\device.txt");
	WriteFileT(txt_path.c_str(), strIP, strlen(strIP));

	DeviceLPR *pDev = new DeviceLPR(strIP, hLPRClient);
	m_vDev.push_back(pDev);

	ZBX_RegUserRightsCfgCb(hLPRClient, [](ZBX_Cam* cam,
		const UserRightsCfgs* alarmRecord, 
		const void* usrParam){
		if (usrParam)
		{
			CVzFaceSDKDemoDlg* dg = (CVzFaceSDKDemoDlg*)usrParam;
			UserRightsCfgs *userrightscfgs = (UserRightsCfgs *)malloc(sizeof(UserRightsCfgs));
			memset(userrightscfgs, 0, sizeof(UserRightsCfgs));
			memcpy(userrightscfgs, alarmRecord, sizeof(UserRightsCfgs));
			theApp.m_mapUserRightCfgs[cam] = userrightscfgs;
			//dg->SetUIBtn(IDC_BTN_JUR1);
			//dg->OnBnClickedBtnW1();
			//dg->OnMsgUpdateUI();
		}
	}, this);
	ShowVersion(hLPRClient);
	ZBX_GetUserRightsCfg(hLPRClient);
}


void CVzFaceSDKDemoDlg::OnShowVideoButton(int nType, bool bShow){
	if (nType==1)
	{
		GetDlgItem(IDC_BTN_CUT)->EnableWindow(bShow);
		GetDlgItem(IDC_BTN_VIDEO)->EnableWindow(bShow);
	}
	else{
		GetDlgItem(IDC_BTN_CUT2)->EnableWindow(bShow);
		GetDlgItem(IDC_BTN_VIDEO2)->EnableWindow(bShow);
	}
}
void CVzFaceSDKDemoDlg::OnBnClickedBtnOutput()
{
	//给设备设置数据回调
	VzLPRClientHandle handle = GetItemHandle( );
	if( handle != NULL )
	{
		if (m_video_wnd1.GetUserItemData() == (int)handle || m_video_wnd2.GetUserItemData() == (int)handle)
		{
			MessageBox("视频已经播放，请先停止！ ", "提示", MB_OK);
			return;
		}

		if( m_video_wnd1.IsActive() )
		{
			if (m_video_wnd1.GetPlayHandle() != 0 )
			{
				MessageBox("视频窗口一正在播放视频，请先停止！ ", "提示", MB_OK);
				return;
			}

			HWND hwnd = m_video_wnd1.GetSafeHwnd();
			ZBX_StartStream(handle, hwnd);
			m_video_wnd1.SetUserItemData((int)handle);
			m_video_wnd1.SetPlayHandle((int)handle);
			OnShowVideoButton(1, true);
		}
		else
		{
			if (m_video_wnd2.GetPlayHandle() != 0 )
			{
				MessageBox("视频窗口二正在播放视频，请先停止", "提示", MB_OK);
				return;
			}

			HWND hwnd = m_video_wnd2.GetSafeHwnd();
			ZBX_StartStream(handle, hwnd);
			m_video_wnd2.SetUserItemData((int)handle);
			m_video_wnd2.SetPlayHandle((int)handle);
			OnShowVideoButton(2, true);
		}
	}
	else
	{
		MessageBox("请先选择一台设备");
	}
}


int CVzFaceSDKDemoDlg::GetSeleIndex( )
{
	int nCurSel = -1;

	for(int i=0; i< m_lstOpenDevice.GetItemCount(); i++)
	{
		if( m_lstOpenDevice.GetItemState(i, LVIS_SELECTED) == LVIS_SELECTED )
		{
			nCurSel = i;
			break;
		}
	}

	return nCurSel;
}

VzLPRClientHandle CVzFaceSDKDemoDlg::GetItemHandle( )
{
	int nIndex = GetSeleIndex();

	VzLPRClientHandle lHandle = NULL;

	if( nIndex >=0  )
	{
		lHandle = (VzLPRClientHandle)(m_lstOpenDevice.GetItemData(nIndex));
	}

	return lHandle;
}

int CVzFaceSDKDemoDlg::ShowImg(const char* img_path, int wnd_id)
{
	CWnd *pWnd = GetDlgItem(wnd_id);
	if (pWnd == NULL)
	{
		return -1;
	}

	CDC *pDC = pWnd->GetDC( );

	RECT rc;
	pWnd->GetClientRect( &rc );

	CImage img;
	HRESULT hr = img.Load( img_path );
	if( SUCCEEDED(hr) )
	{
		RECT rcSrc;
		rcSrc.left = 0;
		rcSrc.top = 0;
		rcSrc.right = img.GetWidth();
		rcSrc.bottom = img.GetHeight();
		SetStretchBltMode(pDC->m_hDC,COLORONCOLOR);
		//img.Draw( pDC->m_hDC, rc, rcSrc);
		img.Draw(pDC->m_hDC, rc);
		ReleaseDC( pDC ); 
	}

	return 0;
}

void CVzFaceSDKDemoDlg::ShowDlgCtrl(int wnd_id, bool show)
{
	CWnd *pWnd = GetDlgItem(wnd_id);
	if (pWnd == NULL)
	{
		return;
	}

	if(show)
	{
		pWnd->ShowWindow(SW_SHOW);
	}
	else
	{
		pWnd->ShowWindow(SW_HIDE);
	}
}

void CVzFaceSDKDemoDlg::OnViewerMouse0(IV_EVENT eEvent, int x, int y, int nId)
{
	if(eEvent == IV_EVENT_L_BTN_DOWN)
	{
		if(nId == 0)
		{
			m_video_wnd1.SetActive(true);
			m_video_wnd2.SetActive(false);
		}
		else
		{
			m_video_wnd1.SetActive(false);
			m_video_wnd2.SetActive(true);
		}
	}
}
void CVzFaceSDKDemoDlg::OnBnClickedBtnClose()
{
	VzLPRClientHandle handle = GetItemHandle( );
	if( handle != NULL )
	{
		if(m_video_wnd1.GetUserItemData() == (int)handle)
		{
			CloseVideo1();
		}
		else if(m_video_wnd2.GetUserItemData() == (int)handle)
		{
			CloseVideo2();
		}

		ZBX_DisConnect(handle);
	
		int cur_sel = GetSeleIndex();
		if( cur_sel >= 0 )
		{
			m_lstOpenDevice.DeleteItem(cur_sel);
		}
		vector <DeviceLPR *>::iterator iter;
		for (iter = m_vDev.begin(); iter != m_vDev.end(); iter++)
		{
			if (handle == (*iter)->hLPRClient)
			{
				delete (*iter);
				m_vDev.erase(iter);

				break;
			}
		}		
		vector <strct_filePath>::iterator Iter;
		for (Iter = m_vFilePath.begin(); Iter != m_vFilePath.end(); Iter++)
		{
			if ((Iter->m_CurCameraHandle) == handle)
			{
				m_vFilePath.erase(Iter);
				break;
			}
		}
	}
	else
	{
		MessageBox("请先选择一台设备");
	}
}

void CVzFaceSDKDemoDlg::OnBnClickedBtnStopPlay()
{
	CString str;
	if(m_video_wnd1.IsActive())
	{
		GetDlgItem(IDC_BTN_VIDEO)->GetWindowTextA(str);
		if (str=="停止录制")
		{
			AfxMessageBox("请先停止录制视频");
			return;
		}
		CloseVideo1( );
	}
	else
	{
		GetDlgItem(IDC_BTN_VIDEO2)->GetWindowTextA(str);
		if (str == "停止录制")
		{
			AfxMessageBox("请先停止录制视频");
			return;
		}
		CloseVideo2();
	}
}


void CVzFaceSDKDemoDlg::CloseVideo1()
{
	VzLPRClientHandle handle = (VzLPRClientHandle)m_video_wnd1.GetUserItemData();
	if(handle != 0 )
	{
		ZBX_StopStreamEx(handle, m_video_wnd1.GetSafeHwnd());

		m_video_wnd1.SetPlayHandle(0);
		m_video_wnd1.SetUserItemData(0);
		m_video_wnd1.Invalidate();
		OnShowVideoButton(1, false);
	}
}

void CVzFaceSDKDemoDlg::CloseVideo2()
{
	VzLPRClientHandle handle = (VzLPRClientHandle)m_video_wnd2.GetUserItemData();
	if(handle != 0 )
	{
		ZBX_StopStreamEx(handle, m_video_wnd2.GetSafeHwnd());

		m_video_wnd2.SetPlayHandle(0);
		m_video_wnd2.SetUserItemData(0);
		m_video_wnd2.Invalidate();
		OnShowVideoButton(2, false);
	}
}

void CVzFaceSDKDemoDlg::OnNMClickListOpenedDevice(NMHDR *pNMHDR, LRESULT *pResult)
{
	LPNMITEMACTIVATE pNMItemActivate = reinterpret_cast<LPNMITEMACTIVATE>(pNMHDR);

	if (pNMItemActivate->iItem < 0)
		return;


	VzLPRClientHandle hLPRClient = (VzLPRClientHandle)m_lstOpenDevice.GetItemData(pNMItemActivate->iItem);
	if ( hLPRClient != NULL )
	{
		ShowVersion(hLPRClient);
		ShowIp(pNMItemActivate->iItem);
	}

	UpdateData(FALSE);

	*pResult = 0;
}

void CVzFaceSDKDemoDlg::ShowVersion(VzLPRClientHandle hLPRClient){
	CString strVersion;
	SystemVersionInfo verinfo;
	memset(&verinfo, 0, sizeof(SystemVersionInfo));
	ZBX_GetFaceSystemVersion(hLPRClient, &verinfo);
	strVersion.Format("VerSion:%s", verinfo.firmware_ver);
	SetDlgItemTextA(IDC_STATIC_VERSION, strVersion);

	strVersion = verinfo.firmware_ver;
	strVersion.Left(1);
	theApp.m_map_cam_ver_[hLPRClient] = atoi(strVersion);
}
void CVzFaceSDKDemoDlg::ShowIp(int nIdex){
	CString ip = m_lstOpenDevice.GetItemText(nIdex, 0);
	GetDlgItem(IDC_IPADDR)->SetWindowTextA(ip);
}
void CVzFaceSDKDemoDlg::iSetCommonInfo(const char *pStrInfo)
{
	if(pStrInfo == NULL)
		return;

	string sMsg;
	sMsg.append(pStrInfo, strlen(pStrInfo));
	addMsg(sMsg);
}

void CVzFaceSDKDemoDlg::addMsg(const string& sMsg)
{
	string sNewMsg(sMsg);
	if (!m_strCommNotify.empty())
		sNewMsg += "\r\n";

	sNewMsg += m_strCommNotify;
	m_strCommNotify = sNewMsg;

	SetDlgItemText(IDC_EDIT_NOTIFY, m_strCommNotify.c_str());

}

void CVzFaceSDKDemoDlg::OnReciveAlarmMsg(VzLPRClientHandle handle, int type)
{
	PostMessage(WM_SHOW_ALARM_MSG, (WPARAM)handle, (LPARAM)type);
}
void CVzFaceSDKDemoDlg::SetCameraStatus(VzLPRClientHandle handle, int event){
	PostMessage(WM_CHANGE_CAMERA_STATUS_MSG, (WPARAM)handle, (LPARAM)event);
}
void CVzFaceSDKDemoDlg::UpdataInfo(VzLPRClientHandle handle, const FaceRecoInfo* face_reco_info, int nType)
{
	SYSTEMTIME st;
	GetLocalTime(&st);

	char szSnapImagePath[MAX_PATH] = { 0 };
	//string app_path = GetAppPath();

	// 创建日期文件夹
	//char szDateImageDir[MAX_PATH] = { 0 };
	//sprintf_s(szDateImageDir, sizeof(szDateImageDir), "%s\\%d-%02d-%02d", app_path.c_str(), st.wYear, st.wMonth, st.wDay);
	//if (!IsPathExist(szDateImageDir))
	//{
	//	::CreateDirectory(szDateImageDir, NULL);
	//}
	CTime time(face_reco_info->tvSec);
	FACE_RESULT_INFO *face_info = (FACE_RESULT_INFO *)malloc(sizeof(FACE_RESULT_INFO));
	memset(face_info, 0, sizeof(FACE_RESULT_INFO));
	memcpy(&face_info->face_reco_info, face_reco_info, sizeof(FaceRecoInfo));
	bool bResult = true;
	if (face_reco_info->matched<=0)
	{
		bResult = false;
	}
	CString per_name = util::Convert<util::ascii>(face_info->face_reco_info.matchPersonName).c_str();
	CString strData;
	strData.Format("%04d-%02d-%02d", time.GetYear(), time.GetMonth(), time.GetDay());
	OnCreateDir(strData, handle);
	if (face_reco_info->faceImgLen > 0 && face_reco_info->faceImg != NULL)
	{
		/*	sprintf_s(szSnapImagePath, sizeof(szSnapImagePath), "%s\\%02d%02d%02d%02d%02d%02d_snap.jpg", app_path.c_str(), time.GetYear(), time.GetMonth(), time.GetDay(), time.GetHour(),
		time.GetMinute(), time.GetSecond());*/

		if (bResult)
		{
			sprintf_s(szSnapImagePath, sizeof(szSnapImagePath), "%s\\%02d%02d%02d_%s_%d_P.jpg", GetFilePath(handle, GET_FILE_TYPE_NORMAL, bResult), time.GetHour(), time.GetMinute(), time.GetSecond(), per_name, face_reco_info->matched);
		}
		else
		{
			sprintf_s(szSnapImagePath, sizeof(szSnapImagePath), "%s\\%02d%02d%02d_N.jpg", GetFilePath(handle, GET_FILE_TYPE_NORMAL, bResult), time.GetHour(), time.GetMinute(), time.GetSecond());
		}
		
		WriteFileB(szSnapImagePath, face_reco_info->faceImg, face_reco_info->faceImgLen);

		::strcpy(face_info->szFaceImagePath, szSnapImagePath);
	}
	char szModelImagePath[MAX_PATH] = { 0 };
	if (face_reco_info->modelFaceImgLen > 0 && face_reco_info->modelFaceImg != NULL)
	{
		//sprintf_s(szModelImagePath, sizeof(szModelImagePath), "%s\\%s.jpg", szDateImageDir, face_reco_info->matchPersonId);
		sprintf_s(szModelImagePath, sizeof(szModelImagePath), "%s\\%s_%s.jpg", GetFilePath(handle, GET_FILE_TYPE_MODEL, bResult), face_reco_info->matchPersonId, per_name);

		WriteFileB(szModelImagePath, face_reco_info->modelFaceImg, face_reco_info->modelFaceImgLen);

		::strcpy(face_info->szFaceModelPath, szModelImagePath);
	}
	char szBigImagePath[MAX_PATH] = { 0 };
	if (face_reco_info->imgLen > 0 && face_reco_info->img != NULL)
	{
		if (bResult)
		{
			sprintf_s(szBigImagePath, sizeof(szBigImagePath), "%s\\%02d%02d%02d_%s_%d_P.jpg", GetFilePath(handle, GET_FILE_TYPE_BIG, bResult), time.GetHour(), time.GetMinute(), time.GetSecond(), per_name, face_reco_info->matched);
		}
		else
		{
			sprintf_s(szBigImagePath, sizeof(szBigImagePath), "%s\\%02d%02d%02d_N.jpg", GetFilePath(handle, GET_FILE_TYPE_BIG, bResult), time.GetHour(), time.GetMinute(), time.GetSecond());
		}
		WriteFileB(szBigImagePath, face_reco_info->img, face_reco_info->imgLen);

		//strcpy(face_info->szFaceImagePath, szSnapImagePath);
	}	
	
	face_info->cam = handle;
	if (nType == TYPE_NORMAL)
	{
		PostMessage(WM_USER_MSG, (WPARAM)MSG_FACE_RESULT, (LPARAM)face_info);
	}
	else if (nType == TYPE_OFFLINE)
	{
		PostMessage(WM_USER_MSG, (WPARAM)MSG_FACE_OFFLINE, (LPARAM)face_info);
	}
}

void CVzFaceSDKDemoDlg::UpdataIDCardRecord(VzLPRClientHandle handle, const IDCardRecord* alarmRecord)
{

	SYSTEMTIME st;
	GetLocalTime(&st);

	char szSnapImagePath[MAX_PATH] = { 0 };
	CTime time(alarmRecord->tvsec);
	FACE_RESULT_INFO *face_info = (FACE_RESULT_INFO *)malloc(sizeof(FACE_RESULT_INFO));
	memset(face_info, 0, sizeof(FACE_RESULT_INFO));
	memcpy(&face_info->idCardRecord, alarmRecord, sizeof(IDCardRecord));
	bool bResult = true;
	if (alarmRecord->matched==-1)
	{
		bResult = false;
	}
	CString per_name = util::Convert<util::ascii>(alarmRecord->name).c_str();
	CString strData;
	strData.Format("%04d-%02d-%02d", time.GetYear(), time.GetMonth(), time.GetDay());
	OnCreateDir(strData, handle);
	if (alarmRecord->faceimglen > 0 && alarmRecord->faceimgdata != NULL)
	{
		if (bResult)
		{
			sprintf_s(szSnapImagePath, sizeof(szSnapImagePath), "%s\\%02d%02d%02d_%s_%d_P.jpg",
				GetFilePath(handle, GET_FILE_TYPE_NORMAL, bResult), time.GetHour(), time.GetMinute(), time.GetSecond(), per_name, alarmRecord->matched);
		}
		else
		{
			sprintf_s(szSnapImagePath, sizeof(szSnapImagePath), "%s\\%02d%02d%02d_F.jpg",
				GetFilePath(handle, GET_FILE_TYPE_NORMAL, bResult), time.GetHour(), time.GetMinute(), time.GetSecond());
		}
		
		WriteFileB(szSnapImagePath, alarmRecord->faceimgdata, alarmRecord->faceimglen);

		strcpy_s(face_info->szFaceImagePath, szSnapImagePath);
	}
	char szModelImagePath[MAX_PATH] = { 0 };
	
	std::string strId(alarmRecord->idcard,18);
	if (alarmRecord->imglen > 0 && alarmRecord->imgdata != NULL)
	{
		sprintf_s(szModelImagePath, sizeof(szModelImagePath), "%s\\%s_%s.bmp", GetFilePath(handle, GET_FILE_TYPE_MODEL, bResult), strId.c_str(), per_name);
		WriteFileB(szModelImagePath, alarmRecord->imgdata, alarmRecord->imglen);
		strcpy_s(face_info->szFaceModelPath, szModelImagePath);
	}
	//if (nType == TYPE_NORMAL)
	//{
	face_info->cam = handle;
	PostMessage(WM_USER_MSG, (WPARAM)MSG_IDCARD_RESULT, (LPARAM)face_info);
	//}
	//else if (nType == TYPE_OFFLINE)
	//{
	//	PostMessage(WM_USER_MSG, (WPARAM)MSG_FACE_OFFLINE, (LPARAM)face_info);
	//}
}

void CVzFaceSDKDemoDlg::ShowFaceResult(LPARAM l, int Type)
{
	FACE_RESULT_INFO *pFaceInfo = (FACE_RESULT_INFO *)l;
	TAGLIST_INFO list_info;
	if (pFaceInfo != NULL)
	{
		CTime time(pFaceInfo->face_reco_info.tvSec);
		CString timestr;
		timestr.Format("%04d-%02d-%02d \r\n %02d:%02d:%02d", time.GetYear(), time.GetMonth(), time.GetDay(), time.GetHour(), time.GetMinute(), time.GetSecond());

		ShowImg(pFaceInfo->szFaceImagePath, IDC_PICTURE_2);		
		// todo: 显示到列表中
		//int nData = GetPrivateProfileInt("Save", "SafetyHat", -1, ".\\Demo.ini");
		if (pFaceInfo->face_reco_info.matched != -1)
		{
			ShowImg(pFaceInfo->szFaceModelPath, IDC_PICTURE_1);
			int count = m_lstPassFace.GetItemCount();
			int index = m_lstPassFace.InsertItem(0, pFaceInfo->face_reco_info.matchPersonName);
			m_lstPassFace.SetItemData(index, (DWORD)count);
			CString strName = util::Convert<util::ascii>(pFaceInfo->face_reco_info.matchPersonName).c_str();
			m_lstPassFace.SetItemText(index, 0, strName); 	
			list_info.faceName = strName;
			m_lstPassFace.SetItemText(index, 1, pFaceInfo->face_reco_info.matchPersonId);
			list_info.faceId = pFaceInfo->face_reco_info.matchPersonId;
			m_lstPassFace.SetItemText(index, 2, timestr);
			timestr.Format("%04d-%02d-%02d %02d:%02d:%02d", time.GetYear(), time.GetMonth(), time.GetDay(), time.GetHour(), time.GetMinute(), time.GetSecond());
			list_info.csTime = timestr;
			strName.Format("%d", pFaceInfo->face_reco_info.matched);
			list_info.nMatchScore = pFaceInfo->face_reco_info.matched;			
			m_lstPassFace.SetItemText(index, 3, strName);
			m_lstPassFace.SetItemText(index, 4, GetDeviceIP(pFaceInfo->cam));
			//m_lstPassFace.createItemButton(index, 5, this->GetSafeHwnd(), "", 1, IDB_BIT_MORE);
			m_lstPassFace.SetItemText(index, 5, "···");
			list_info.bSaftHat = pFaceInfo->face_reco_info.resv[0];
			list_info.nModel = pFaceInfo->face_reco_info.isRealtimeData;
			list_info.nRole = pFaceInfo->face_reco_info.matchRole;
			list_info.bDataSatus = TYPE_NORMAL;
			if (Type == TYPE_OFFLINE)
			{
				list_info.bDataSatus = TYPE_OFFLINE;
			}
			list_info.DevIp = GetDeviceIP(pFaceInfo->cam);
			int nCout = m_lstPassFace.GetItemCount();
			m_lstPassFace.SetItemData(index, nCout);
			m_MaplistInfo[count] = list_info;
			return;
		}
		else{
			CString strpicPath;
			string app_path = GetAppPath();
			strpicPath.Format("%s\\face.jpg", app_path.c_str());
			ShowImg(strpicPath, IDC_PICTURE_1);
			int count = m_lstNoPassFace.GetItemCount();
			int index = m_lstNoPassFace.InsertItem(0, "");
			timestr.Format("%04d-%02d-%02d %02d:%02d:%02d", time.GetYear(), time.GetMonth(), time.GetDay(), time.GetHour(), time.GetMinute(), time.GetSecond());

			m_lstNoPassFace.SetItemText(index, 0, timestr);
			m_lstNoPassFace.SetItemText(index, 1, GetDeviceIP(pFaceInfo->cam));
			//m_lstNoPassFace.createItemButton(index,2, this->GetSafeHwnd(), "", 1, IDB_BIT_ADD);
			m_lstNoPassFace.SetItemText(index, 2,"添加");
		}
		free(pFaceInfo);
	}
}
CString CVzFaceSDKDemoDlg::GetDeviceIP(VzLPRClientHandle handle){
	for (auto i : m_vDev)
	{
		if (i->hLPRClient == handle)
		{
			return i->strIP;
		}
	}
}
void CVzFaceSDKDemoDlg::ShoWIdCardResult(LPARAM l)
{
	FACE_RESULT_INFO *pFaceInfo = (FACE_RESULT_INFO *)l;
	if (pFaceInfo != NULL)
	{
		CTime time(pFaceInfo->idCardRecord.tvsec);
		CString timestr;
		timestr.Format("%04d-%02d-%02d \r\n %02d:%02d:%02d", time.GetYear(), time.GetMonth(), time.GetDay(), time.GetHour(), time.GetMinute(), time.GetSecond());

		ShowImg(pFaceInfo->szFaceImagePath, IDC_PICTURE_2);
		// todo: 显示到列表中
		
		ShowImg(pFaceInfo->szFaceModelPath, IDC_PICTURE_1);
		int count = m_lstPassFace.GetItemCount();
		int index = m_lstPassFace.InsertItem(0, pFaceInfo->idCardRecord.name);
		m_lstPassFace.SetItemData(index,(DWORD)count);
		TAGLIST_INFO list_info;
		CString strName = util::Convert<util::ascii>(pFaceInfo->idCardRecord.name).c_str();
		m_lstPassFace.SetItemText(index, 0, strName);
		list_info.faceName = strName;
		m_lstPassFace.SetItemText(index, 1, "无");
		list_info.faceId = "无";
		m_lstPassFace.SetItemText(index, 2, timestr); 
		timestr.Format("%04d-%02d-%02d %02d:%02d:%02d", time.GetYear(), time.GetMonth(), time.GetDay(), time.GetHour(), time.GetMinute(), time.GetSecond());
		list_info.csTime = timestr;

		strName.Format("%d", pFaceInfo->idCardRecord.matched);
		list_info.nMatchScore = pFaceInfo->idCardRecord.matched;
		m_lstPassFace.SetItemText(index, 3, strName);
		list_info.bSaftHat = pFaceInfo->idCardRecord.hat;
		list_info.nModel = 3;
		m_lstPassFace.SetItemText(index, 4, GetDeviceIP(pFaceInfo->cam));
		list_info.DevIp = GetDeviceIP(pFaceInfo->cam);
		int nCout = m_lstPassFace.GetItemCount();
		m_lstPassFace.SetItemData(index, nCout);
		std::string strIdCard(pFaceInfo->idCardRecord.idcard, 18);
		list_info.faceIDCard = strIdCard.c_str();
		m_MaplistInfo[count] = list_info;
		m_lstPassFace.SetItemText(index, 5, "···");
		//m_lstPassFace.createItemButton(index, 5, this->GetSafeHwnd(), "", 1, IDB_BIT_MORE);
		free(pFaceInfo);
		return;
	}
}
void CVzFaceSDKDemoDlg::OnBnClickedBtnManagerPeople()
{
	// TODO: 在此添加控件通知处理程序代码
	if (!CheckCamera())
	{
		AfxMessageBox("请先选择在线设备");
		return;
	}
	VzLPRClientHandle handle = GetItemHandle();	
	//CFaceManagerDlg dlg(handle);
	//dlg.DoModal();
	CFun_MangDlg dlg(handle);
	dlg.DoModal();
}

bool CVzFaceSDKDemoDlg::CheckCamera(){
	int nIndex = GetSeleIndex();
	if (m_lstOpenDevice.GetItemText(nIndex,1)=="在线")
	{
		return true;
	} 
	else
	{
		return false;
	}
}
void CVzFaceSDKDemoDlg::OnBnClickedBtnBasesetting()
{
	// TODO: Add your control notification handler code here
	if (!CheckCamera())
	{
		AfxMessageBox("请先选择在线设备");
		return;
	}
	VzLPRClientHandle handle = GetItemHandle();
	CBasicsDlg dlg(handle);
	dlg.DoModal();
}

void CVzFaceSDKDemoDlg::OnItemchangedListPassFace(NMHDR *pNMHDR, LRESULT *pResult)
{
	LPNMLISTVIEW pNMLV = reinterpret_cast<LPNMLISTVIEW>(pNMHDR);
	// TODO: Add your control notification handler code here
	if ((pNMLV->uOldState & LVIS_SELECTED) == 0 &&
		(pNMLV->uNewState & LVIS_SELECTED) == LVIS_SELECTED)
	{
		//sTemp.Format("%d got selected", pNMListView->iItem);
		int nItem = pNMLV->iItem;
		CString strName = m_lstPassFace.GetItemText(nItem, 0);
		CString Id = m_lstPassFace.GetItemText(nItem, 1);
		CString strTime = m_lstPassFace.GetItemText(nItem, 2);
		CString strMatch = m_lstPassFace.GetItemText(nItem, 3);
		CString strIP = m_lstPassFace.GetItemText(nItem, 4);
		SYSTEMTIME time;
		memset(&time, 0, sizeof(SYSTEMTIME));
		sscanf(strTime, "%d-%d-%d %d:%d:%d", &time.wYear, &time.wMonth, &time.wDay, &time.wHour, &time.wMinute, &time.wSecond);
		CString strpicPath;
		char szSnapImagePath[MAX_PATH] = { 0 };
		CString strFaceID = m_lstPassFace.GetItemText(nItem, 1);
		//抓拍图
		{
			//身份证
			if (strMatch == "0")
			{
				strpicPath.Format("%s\\%s\\%04d-%02d-%02d\\人脸小图\\比对失败\\%02d%02d%02d_N.jpg",
					m_SaveDatePath, strIP, time.wYear, time.wMonth, time.wDay,
					time.wHour, time.wMinute, time.wSecond);

			}
			//设备抓拍
			else
			{
				strpicPath.Format("%s\\%s\\%04d-%02d-%02d\\人脸小图\\比对成功\\%02d%02d%02d_%s_%s_P.jpg",
					m_SaveDatePath, strIP, time.wYear, time.wMonth, time.wDay,
					time.wHour, time.wMinute, time.wSecond, strName, strMatch);
			}
			ShowImg(strpicPath, IDC_PICTURE_2);
		}

		//模板图
		{
			if (strFaceID== "无")
			{				
				strpicPath.Format("%s\\%s\\%04d-%02d-%02d\\模板图\\%s_%s.bmp",
					m_SaveDatePath, strIP, time.wYear, time.wMonth, time.wDay,
					m_MaplistInfo[nItem].faceIDCard, strName);
			}
			else{
				strpicPath.Format("%s\\%s\\%04d-%02d-%02d\\模板图\\%s_%s.jpg",
					m_SaveDatePath, strIP, time.wYear, time.wMonth, time.wDay,
					strFaceID,strName);
			}
			ShowImg(strpicPath, IDC_PICTURE_1);
		}

		//m_lstPassFace.ShowButton(nItem);
	}
	*pResult = 0;
}


void CVzFaceSDKDemoDlg::OnBnClickedBtnBasesetting2()
{
	// TODO: Add your control notification handler code here
	if (!CheckCamera())
	{
		AfxMessageBox("请先选择在线设备");
		return;
	}
	VzLPRClientHandle handle = GetItemHandle();
	CAlgorithmDlg dlg(handle);
	dlg.DoModal();
}


void CVzFaceSDKDemoDlg::OnBnClickedBtnManagerPeople2()
{
	// TODO: Add your control notification handler code here
	CBatchDlg dlg;
	dlg.DoModal();
}


void CVzFaceSDKDemoDlg::OnBnClickedBtnBasesetting4()
{
	// TODO: Add your control notification handler code here
	if (!CheckCamera())
	{
		AfxMessageBox("请先选择在线设备");
		return;
	}
	VzLPRClientHandle handle = GetItemHandle();
	CFun_SeniorsDlg dlg(handle);
	dlg.DoModal();
}


void CVzFaceSDKDemoDlg::OnBnClickedBtnBasesetting3()
{
	// TODO: Add your control notification handler code here
	if (!CheckCamera())
	{
		AfxMessageBox("请先选择在线设备");
		return;
	}
	VzLPRClientHandle handle = GetItemHandle();
	//CSystemSetDlg dlg(handle);
	//dlg.DoModal();
	CFun_SystemSetDlg dlg(handle);
	dlg.DoModal();
}


void CVzFaceSDKDemoDlg::OnItemchangedListNoPassFace(NMHDR *pNMHDR, LRESULT *pResult)
{
	LPNMLISTVIEW pNMLV = reinterpret_cast<LPNMLISTVIEW>(pNMHDR);
	// TODO: Add your control notification handler code here
	if ((pNMLV->uOldState & LVIS_SELECTED) == 0 &&
		(pNMLV->uNewState & LVIS_SELECTED) == LVIS_SELECTED)
	{
		//sTemp.Format("%d got selected", pNMListView->iItem);
		int nItem = pNMLV->iItem;
		CString strIP = m_lstNoPassFace.GetItemText(nItem, 1);
		CString strTime = m_lstNoPassFace.GetItemText(nItem, 0);
		SYSTEMTIME time;
		memset(&time, 0, sizeof(SYSTEMTIME));
		sscanf(strTime, "%04d-%02d-%02d %02d:%02d:%02d", &time.wYear, &time.wMonth, &time.wDay, &time.wHour, &time.wMinute, &time.wSecond);
		CString strpicPath;
		char szSnapImagePath[MAX_PATH] = { 0 };
		string app_path = GetAppPath();
		strpicPath.Format("%s\\%s\\%04d-%02d-%02d\\人脸小图\\比对失败\\%02d%02d%02d_N.jpg",
			m_SaveDatePath, strIP, time.wYear, time.wMonth, time.wDay,
			time.wHour, time.wMinute, time.wSecond);
		ShowImg(strpicPath, IDC_PICTURE_2);
		strpicPath.Format("%s\\face.jpg", app_path.c_str());
		ShowImg(strpicPath, IDC_PICTURE_1);
		m_nNopassSelect = nItem;
	}
	*pResult = 0;
}


BOOL CVzFaceSDKDemoDlg::PreTranslateMessage(MSG* pMsg)
{

	// TODO: Add your specialized code here and/or call the base class
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
	return CDialog::PreTranslateMessage(pMsg);
}


void CVzFaceSDKDemoDlg::OnItemchangedListOpenedDevice(NMHDR *pNMHDR, LRESULT *pResult)
{
	LPNMLISTVIEW pNMLV = reinterpret_cast<LPNMLISTVIEW>(pNMHDR);
	if ((pNMLV->uOldState & LVIS_SELECTED) == 0 &&
		(pNMLV->uNewState & LVIS_SELECTED) == LVIS_SELECTED)
	{
		//sTemp.Format("%d got selected", pNMListView->iItem);
		int nItem = pNMLV->iItem;
		VzLPRClientHandle hLPRClient = (VzLPRClientHandle)m_lstOpenDevice.GetItemData(pNMLV->iItem);
		if (hLPRClient != NULL)
		{
			ShowVersion(hLPRClient);
		}

		UpdateData(FALSE);

	}
	*pResult = 0;
}


void CVzFaceSDKDemoDlg::OnRclickListNoPassFace(NMHDR *pNMHDR, LRESULT *pResult)
{
	LPNMITEMACTIVATE pNMItemActivate = reinterpret_cast<LPNMITEMACTIVATE>(pNMHDR);
	// TODO: Add your control notification handler code here	
	if (pNMItemActivate->iItem!=-1)
	{
#if 0
		m_nNopassSelect = pNMItemActivate->iItem;
		DWORD dwPos = GetMessagePos();
		CPoint point(LOWORD(dwPos), HIWORD(dwPos));
		CMenu menu;
		VERIFY(menu.LoadMenu(IDR_MENU1));
		CMenu* popup = menu.GetSubMenu(0);
		ASSERT(popup != NULL);
		popup->TrackPopupMenu(TPM_LEFTALIGN, point.x, point.y, this);
#endif
	}
	*pResult = 0;
}


void CVzFaceSDKDemoDlg::OnAddtoface()
{
	// TODO: Add your command handler code here
	//int nitem = m_lstNoPassFace.GetCurSel();
	int nitem = m_nNopassSelect;
	CString strIP = m_lstNoPassFace.GetItemText(nitem, 1);
	CString strTime = m_lstNoPassFace.GetItemText(nitem, 0);
	SYSTEMTIME time;
	memset(&time, 0, sizeof(SYSTEMTIME));
	sscanf(strTime, "%04d-%02d-%02d %02d:%02d:%02d", &time.wYear, &time.wMonth, &time.wDay, &time.wHour, &time.wMinute, &time.wSecond);
	CString strpicPath;
	char szSnapImagePath[MAX_PATH] = { 0 };
	//string app_path = GetAppPath();
	strpicPath.Format("%s\\%s\\%04d-%02d-%02d\\人脸小图\\比对失败\\%02d%02d%02d_N.jpg",
		m_SaveDatePath, strIP, time.wYear, time.wMonth, time.wDay,
		time.wHour, time.wMinute, time.wSecond);
	VzLPRClientHandle handle = GetItemHandle();
	CAddFaceDlg dlg(handle, strpicPath);
	dlg.DoModal();
}


void CVzFaceSDKDemoDlg::OnOpenpath()
{
// 	// TODO: Add your command handler code here
// 	SYSTEMTIME st;
// 	GetLocalTime(&st);
// 	char szSnapImagePath[MAX_PATH] = { 0 };
// 	string app_path = GetAppPath();
// 
// 	// 创建日期文件夹
// 	char szDateImageDir[MAX_PATH] = { 0 };
// 	sprintf_s(szDateImageDir, sizeof(szDateImageDir), "%s\\%d-%02d-%02d", app_path.c_str(), st.wYear, st.wMonth, st.wDay);
	ShellExecute(NULL, "open", NULL, NULL, m_SaveDatePath, SW_SHOW);
}


void CVzFaceSDKDemoDlg::OnRclickListPassFace(NMHDR *pNMHDR, LRESULT *pResult)
{
	LPNMITEMACTIVATE pNMItemActivate = reinterpret_cast<LPNMITEMACTIVATE>(pNMHDR);
	// TODO: Add your control notification handler code here
	if (pNMItemActivate->iItem != -1)
	{
#if 0
		m_nNopassSelect = pNMItemActivate->iItem;
		DWORD dwPos = GetMessagePos();
		CPoint point(LOWORD(dwPos), HIWORD(dwPos));
		CMenu menu;
		VERIFY(menu.LoadMenu(IDR_MENU2));
		CMenu* popup = menu.GetSubMenu(0);
		ASSERT(popup != NULL);
		popup->TrackPopupMenu(TPM_LEFTALIGN, point.x, point.y, this);
#endif
	}
	*pResult = 0;
}


void CVzFaceSDKDemoDlg::OnBnClickedBtnVideo()
{
	// TODO:  在此添加控件通知处理程序代码

	OnStartSaveRealData(IDC_BTN_VIDEO);
}


void CVzFaceSDKDemoDlg::OnCreateDir(CString data, VzLPRClientHandle handle){

	if (!PathFileExists(m_SaveDatePath))
	{
		_mkdir(m_SaveDatePath);
	}
	CString ip;
	for (auto i : m_vDev)
	{
		if (i->hLPRClient == handle)
		{
			ip = i->strIP;
			break;
		}
	}
	if (ip.IsEmpty())
	{
		Log() << "查询camera Handle对应IP失败  \r\n";
		return;
	}
	CString strPathIp;
	strPathIp.Format("%s\\%s", m_SaveDatePath, ip);
	SYSTEMTIME t;
	GetSystemTime(&t);
	CString strTmp, cmd,strPth;		
	strTmp.Format("%s\\%s\\%s", m_SaveDatePath, ip, data);
	OnMkDir(strTmp);
	strPth.Format("%s\\模板图\\Fail", strTmp);
	OnMkDir(strPth);
	strPth.Format("%s\\人脸小图\\比对成功", strTmp);
	OnMkDir(strPth);
	strPth.Format("%s\\人脸小图\\比对失败", strTmp);
	OnMkDir(strPth);
	strPth.Format("%s\\人脸大图\\比对成功", strTmp);
	OnMkDir(strPth);
	strPth.Format("%s\\人脸大图\\比对失败", strTmp);
	OnMkDir(strPth);
	strPth.Format("%s\\截图", strTmp);
	OnMkDir(strPth);
	strPth.Format("%s\\视频", strTmp);
	OnMkDir(strPth);

	vector <strct_filePath>::iterator Iter;
	for (Iter = m_vFilePath.begin(); Iter != m_vFilePath.end(); Iter++)
	{
		if ((Iter->m_CurCameraHandle) == handle)
		{
			m_vFilePath.erase(Iter);
			break;
		}
	}
	strct_filePath stcfile;
	//strPathIp.Format("%s\\%s\\%04d-%02d-%02d", m_SaveDatePath, ip, t.wYear, t.wMonth, t.wDay);
	stcfile.deviceIp = ip;
	CString strT;
	strT.Format("%s\\%s\\%s", m_SaveDatePath, ip, data);
	stcfile.filepath_Data = strT;
	stcfile.m_CurCameraHandle = handle;
	m_vFilePath.push_back(stcfile);
}

void CVzFaceSDKDemoDlg::OnMkDir(CString path){
	if (PathFileExists(path))
	{
		return;
	}
	CString strTmp;
	
	CString cmd;
	cmd.Format("/c  md \"%s\"", path);
	ShellExecute(0, "open", "cmd.EXE", cmd, "", SW_HIDE);
}

void CVzFaceSDKDemoDlg::OnBnClickedBtnCut()
{
	OnSaveCut(IDC_BTN_CUT);
}

void CVzFaceSDKDemoDlg::OnSaveCut(int nId){
	VzLPRClientHandle handle = NULL;
	CWnd *pWnd = NULL;
	if (nId == IDC_BTN_CUT)
	{
		handle = (VzLPRClientHandle)m_video_wnd1.GetUserItemData();
		pWnd = GetDlgItem(IDC_VIDEO_1);
	}
	else if (nId == IDC_BTN_CUT2)
	{
		handle = (VzLPRClientHandle)m_video_wnd2.GetUserItemData();
		pWnd = GetDlgItem(IDC_VIDEO_2);
	}
	//添加需要创建的目录
	if (!handle){
		int nTime;
		ZBX_GetSysTime(handle, &nTime);
		CTime time(nTime);
		CString strData;
		strData.Format("%04d-%02d-%02d", time.GetYear(), time.GetMonth(), time.GetDay());
		OnCreateDir(strData, handle);
	}
	CDC *pDC = pWnd->GetDC();
	RECT rect;
	::GetClientRect(pWnd->GetSafeHwnd(), &rect);
	CDC memDC;//内存DC
	memDC.CreateCompatibleDC(pDC);

	CBitmap memBitmap, *oldmemBitmap;//建立和屏幕兼容的bitmap
	memBitmap.CreateCompatibleBitmap(pDC, rect.right, rect.bottom);

	oldmemBitmap = memDC.SelectObject(&memBitmap);//将memBitmap选入内存DC
	memDC.BitBlt(0, 0, rect.right, rect.bottom, pDC, 0, 0, SRCCOPY);//复制屏幕图像到内存DC
#if 0
	//以下代码保存memDC中的位图到文件
	BITMAP bmp;
	memBitmap.GetBitmap(&bmp);//获得位图信息

	FILE *fp = fopen(filename, "w+b");

	BITMAPINFOHEADER bih = { 0 };//位图信息头
	bih.biBitCount = bmp.bmBitsPixel;//每个像素字节大小
	bih.biCompression = BI_RGB;
	bih.biHeight = bmp.bmHeight;//高度
	bih.biPlanes = 1;
	bih.biSize = sizeof(BITMAPINFOHEADER);
	bih.biSizeImage = bmp.bmWidthBytes * bmp.bmHeight;//图像数据大小
	bih.biWidth = bmp.bmWidth;//宽度

	BITMAPFILEHEADER bfh = { 0 };//位图文件头
	bfh.bfOffBits = sizeof(BITMAPFILEHEADER) + sizeof(BITMAPINFOHEADER);//到位图数据的偏移量
	bfh.bfSize = bfh.bfOffBits + bmp.bmWidthBytes * bmp.bmHeight;//文件总的大小
	bfh.bfType = (WORD)0x4d42;

	fwrite(&bfh, 1, sizeof(BITMAPFILEHEADER), fp);//写入位图文件头

	fwrite(&bih, 1, sizeof(BITMAPINFOHEADER), fp);//写入位图信息头

	byte * p = new byte[bmp.bmWidthBytes * bmp.bmHeight];//申请内存保存位图数据

	GetDIBits(memDC.m_hDC, (HBITMAP)memBitmap.m_hObject, 0, Height, p,
		(LPBITMAPINFO)&bih, DIB_RGB_COLORS);//获取位图数据

	fwrite(p, 1, bmp.bmWidthBytes * bmp.bmHeight, fp);//写入位图数据

	delete[] p;

	fclose(fp);
#endif
	CString fileName = "";
	SYSTEMTIME t;
	GetLocalTime(&t);
	for (auto i : m_vFilePath)
	{
		if (i.m_CurCameraHandle == handle)
		{
			fileName.Format("%s\\截图\\%02d%02d%02d_cut.jpg", i.filepath_Data, t.wHour, t.wMinute, t.wSecond);
			break;
		}
	}
	CImage img;
	img.Attach(memBitmap);
	img.Save(fileName);
	img.Detach();

	memDC.SelectObject(oldmemBitmap);
	ShowImg(fileName, IDC_PICTURE_2);
}
void CVzFaceSDKDemoDlg::OnBnClickedBtnVideo2()
{
	// TODO:  在此添加控件通知处理程序代码
	OnStartSaveRealData(IDC_BTN_VIDEO2);
}

void CVzFaceSDKDemoDlg::OnStartSaveRealData(int nId){
	
	CString str;
	GetDlgItem(nId)->GetWindowTextA(str);
	VzLPRClientHandle handle = NULL;
	if (nId == IDC_BTN_VIDEO)
	{
		handle=(VzLPRClientHandle)m_video_wnd1.GetUserItemData();
	}
	else if(nId == IDC_BTN_VIDEO2)
	{
		handle = (VzLPRClientHandle)m_video_wnd2.GetUserItemData();
	}
	if (str == "停止录制"){

		GetDlgItem(nId)->SetWindowTextA("开始录制");
		ZBX_StopSaveRealDate(handle);
		return;
	}
	SYSTEMTIME t;
	GetLocalTime(&t);
	CString strfileName;
	for (auto i : m_vFilePath)
	{
		if (i.m_CurCameraHandle == handle)
		{
			strfileName.Format("%s\\视频\\%02d%02d%02d_video.avi", i.filepath_Data, t.wHour, t.wMinute, t.wSecond);
			break;
		}
	}

	//添加需要创建的目录
	if (!handle){
		int nTime;
		ZBX_GetSysTime(handle, &nTime);
		CTime time(nTime);
		CString strData;
		strData.Format("%04d-%02d-%02d", time.GetYear(), time.GetMonth(), time.GetDay());
		OnCreateDir(strData, handle);
	}
	ZBX_SaveRealDate(handle, strfileName.GetBuffer());
	strfileName.ReleaseBuffer();
	GetDlgItem(nId)->SetWindowTextA("停止录制");
}


void CVzFaceSDKDemoDlg::OnBnClickedBtnCut2()
{
	// TODO:  在此添加控件通知处理程序代码
	
	OnSaveCut(IDC_BTN_CUT2);
}
LRESULT CVzFaceSDKDemoDlg::OnBtnListClicked(WPARAM w, LPARAM p)
{
	int nSubItem = (int)p;
	int nItem = (int)w;
	if (nSubItem==5)
	{
		CRecordInfoDlg dlg(m_MaplistInfo[nItem]);
		dlg.DoModal();
	}
	else
	{
		CString strTime = m_lstNoPassFace.GetItemText(nItem, 0);
		SYSTEMTIME time;
		memset(&time, 0, sizeof(SYSTEMTIME));
		sscanf(strTime, "%04d-%02d-%02d %02d:%02d:%02d", &time.wYear, &time.wMonth, &time.wDay, &time.wHour, &time.wMinute, &time.wSecond);
		CString strpicPath;
		char szSnapImagePath[MAX_PATH] = { 0 };
		string app_path = GetAppPath();
		strpicPath.Format("%s\\%d-%02d-%02d\\\%02d%02d%02d%02d%02d%02d_snap.jpg",
			m_SaveDatePath, time.wYear, time.wMonth, time.wDay,
			time.wYear, time.wMonth, time.wDay, time.wHour, time.wMinute, time.wSecond);
		VzLPRClientHandle handle = GetItemHandle();
		CAddFaceDlg dlg(handle, strpicPath);
		dlg.DoModal();
	}
	return 1l;
}

void CVzFaceSDKDemoDlg::OnClickListPassFace(NMHDR *pNMHDR, LRESULT *pResult)
{
	LPNMITEMACTIVATE pNMItemActivate = reinterpret_cast<LPNMITEMACTIVATE>(pNMHDR);
	// TODO:  在此添加控件通知处理程序代码
	int nitem = pNMItemActivate->iItem;
	if (nitem>=0)
	{
		int nSub = pNMItemActivate->iSubItem;
		if (nSub == 5)
		{
			int nData = m_lstPassFace.GetItemData(nitem);
			CRecordInfoDlg dlg(m_MaplistInfo[nData-1]);
			dlg.DoModal();
		}
	}
	
	*pResult = 0;
}


void CVzFaceSDKDemoDlg::OnClickListNoPassFace(NMHDR *pNMHDR, LRESULT *pResult)
{
	LPNMITEMACTIVATE pNMItemActivate = reinterpret_cast<LPNMITEMACTIVATE>(pNMHDR);
	// TODO:  在此添加控件通知处理程序代码int nitem = pNMItemActivate->iItem;
	int nitem = pNMItemActivate->iItem;
	if (nitem >= 0)
	{
		int nSub = pNMItemActivate->iSubItem;
		if (nSub == 2)
		{
			OnAddtoface();
		}
	}
	*pResult = 0;
}


CString CVzFaceSDKDemoDlg::GetFilePath(const VzLPRClientHandle handle, const GetFileType type, const bool result){
	CString filepath_Data="";
	CString str_return = "";
	for (auto i:m_vFilePath)
	{
		if (i.m_CurCameraHandle == handle)
		{
			filepath_Data = i.filepath_Data;
			break;
		}
	}
	if (filepath_Data.IsEmpty())
	{
		return "";
	}
	switch (type)
	{
	case GET_FILE_TYPE_BIG:
		if (result)
		{
			str_return.Format("%s\\人脸大图\\比对成功", filepath_Data);
		}
		else
		{
			str_return.Format("%s\\人脸大图\\比对失败", filepath_Data);
		}
		break;
	case GET_FILE_TYPE_NORMAL:
		if (result)
		{
			str_return.Format("%s\\人脸小图\\比对成功", filepath_Data);
		}
		else
		{
			str_return.Format("%s\\人脸小图\\比对失败", filepath_Data);
		}
		break;
	case GET_FILE_TYPE_MODEL:
		str_return.Format("%s\\模板图", filepath_Data);
		break;
	default:
		break;
	}
	return str_return;
}

void CVzFaceSDKDemoDlg::OnBnClickedButton13()
{
	// TODO:  在此添加控件通知处理程序代码
	OnOpenpath();
}


void CVzFaceSDKDemoDlg::OnBnClickedBtnPicset()
{
	// TODO:  在此添加控件通知处理程序代码
	CDlgPicSavePath dlg(m_SaveDatePath);
	if (IDOK==dlg.DoModal())
	{
		CString str;
		dlg.GetChangePath(str);
		m_SaveDatePath.Format("%s\\face", str);		
	}
}


//void CVzFaceSDKDemoDlg::OnLvnItemchangingListNoPassFace(NMHDR *pNMHDR, LRESULT *pResult)
//{
//	LPNMLISTVIEW pNMLV = reinterpret_cast<LPNMLISTVIEW>(pNMHDR);
//	// TODO:  在此添加控件通知处理程序代码
//	*pResult = 0;
//}


//void CVzFaceSDKDemoDlg::OnLvnItemchangedListNoPassFace(NMHDR *pNMHDR, LRESULT *pResult)
//{
//	LPNMLISTVIEW pNMLV = reinterpret_cast<LPNMLISTVIEW>(pNMHDR);
//	// TODO:  在此添加控件通知处理程序代码
//	*pResult = 0;
//}


void CVzFaceSDKDemoDlg::OnDblclkVideo1()
{
	// TODO:  在此添加控件通知处理程序代码
	
}


void CVzFaceSDKDemoDlg::OnDblclkVideo2()
{
	// TODO:  在此添加控件通知处理程序代码
}


void CVzFaceSDKDemoDlg::OnBnClickedBtnClear()
{
	// TODO:  在此添加控件通知处理程序代码
	m_lstPassFace.DeleteAllItems();
	if (m_vFilePath.size()==0)
	{
		return;
	}
	m_vFilePath.clear();
}


void CVzFaceSDKDemoDlg::OnBnClickedBtnUnclear()
{
	// TODO:  在此添加控件通知处理程序代码
	m_lstNoPassFace.DeleteAllItems();
}

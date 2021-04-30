
// TestActiveXDlg.cpp : 实现文件
//

#include "stdafx.h"
#include "TestActiveX.h"
#include "TestActiveXDlg.h"
#include "afxdialogex.h"

#include "CClsICSectorSetting.h"
#include "CDriveCard.h"
#include "CDriveCardLists.h"
#include "CDriveCommandEvent.h"
#include "CDriveCommandFile.h"
#include "CDriveHoliday.h"
#include "CDriveHolidayLists.h"
#include "CDriveInfo.h"
#include "CDriveMain.h"
#include "CDrivePassword.h"
#include "CDrivePasswordLists.h"
#include "CDrivePortList.h"
#include "CDriveRecord.h"
#include "CDriveRecordLists.h"
#include "CDriveTCPInfo.h"
#include "CDriveTimeGroup.h"
#include "CDriveTimeGroupLists.h"
#include "CDriveValueList.h"


#ifdef _DEBUG
#define new DEBUG_NEW
#endif


// CTestActiveXDlg 对话框



CTestActiveXDlg::CTestActiveXDlg(CWnd* pParent /*=NULL*/)
	: CDialog(IDD_TESTACTIVEX_DIALOG, pParent)
{
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);
}

void CTestActiveXDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
}

BEGIN_MESSAGE_MAP(CTestActiveXDlg, CDialog)
	ON_WM_PAINT()
	ON_WM_QUERYDRAGICON()
	ON_BN_CLICKED(IDC_BUTTON1, &CTestActiveXDlg::OnBnClickedButton1)
	ON_WM_DESTROY()
	ON_WM_TIMER()
	ON_BN_CLICKED(IDC_BUTTON2, &CTestActiveXDlg::OnBnClickedButton2)
	ON_BN_CLICKED(IDC_BUTTON3, &CTestActiveXDlg::OnBnClickedButton3)
	ON_BN_CLICKED(IDC_BUTTON4, &CTestActiveXDlg::OnBnClickedButton4)
	ON_BN_CLICKED(IDC_BUTTON5, &CTestActiveXDlg::OnBnClickedButton5)
END_MESSAGE_MAP()

#define Debug_D(i) {str_debug.Empty();str_debug.Format("%d",i);MessageBox(str_debug);str_debug.ReleaseBuffer();}
#define Debug_F(i) {str_debug.Empty();str_debug.Format("%f",i);MessageBox(str_debug);str_debug.ReleaseBuffer();}
#define Debug_S(s) {str_debug.Empty();str_debug.Format("%s",s);MessageBox(str_debug);str_debug.ReleaseBuffer();}

#define RunState(s) {UpdateData(TRUE);SetDlgItemText(IDC_EDIT1,s);UpdateData(FALSE);}

#define EventLoopID 8888

// CTestActiveXDlg 消息处理程序
//void CALLBACK EventLoop(HWND hWnd, UINT nMsg, UINT_PTR nTimerid, DWORD dwTime);
BOOL CTestActiveXDlg::OnInitDialog()
{
	CDialog::OnInitDialog();

	// 设置此对话框的图标。  当应用程序主窗口不是对话框时，框架将自动
	//  执行此操作
	SetIcon(m_hIcon, TRUE);			// 设置大图标
	SetIcon(m_hIcon, FALSE);		// 设置小图标

	CoInitialize(NULL);
	mpe = new COleException;
	// TODO: 在此添加额外的初始化代码
	if (!mIOMain.CreateDispatch(_T("FCDrive8800.DriveMain"), mpe))
	{
		RunState(_T("初始化错误！"));
		return FALSE;
	}
	else
	{
		//设置事件监听模式
		mIOMain.SetShowEvent(0);//表示使用手动获取方式得到事件
		RunState(_T("初始化成功！" + mIOMain.GetVer()));
		SetTimer(EventLoopID, 100, 0);//自定义事件定时器
	}

	return TRUE;  // 除非将焦点设置到控件，否则返回 TRUE
}

void CTestActiveXDlg::OnDestroy()
{
	CDialog::OnDestroy();

	// TODO: 在此处添加消息处理程序代码
	KillTimer(EventLoopID);
	mIOMain.Unload();
	CoUninitialize();
}

// 如果向对话框添加最小化按钮，则需要下面的代码
//  来绘制该图标。  对于使用文档/视图模型的 MFC 应用程序，
//  这将由框架自动完成。

void CTestActiveXDlg::OnPaint()
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
HCURSOR CTestActiveXDlg::OnQueryDragIcon()
{
	return static_cast<HCURSOR>(m_hIcon);
}


void CTestActiveXDlg::EventLoop()
{
	do
	{
		//获取事件对象
		CDriveCommandEvent myevent = (CDriveCommandEvent)mIOMain.GetEvent();
		if (myevent != NULL)
		{
			long iType = 0;
			iType = myevent.get_EventType();
			CDriveValueList oCommandReturn = NULL;
			LPDISPATCH oConnInfo = NULL;
			CDriveRecordLists recordlist = NULL;
			int iRecourdCount = 0;


			CString SN;
			CString TCPPar;
			CDriveTCPInfo tcp;
			CListBox *List;
			CString ret;

			switch (iType)
			{
			case 1://vbFrameAchieve
				/*命令解析*/
				oConnInfo  = myevent.get_EventConnInfo();
				//通过对应的连接参数对象，命令代码，返回对象获取数据对象
				oCommandReturn=(CDriveValueList)mIOMain.AchieveValuetoList(&oConnInfo, myevent.get_EventiFunc(), myevent.get_EventsValue());

				switch (myevent.get_EventiFunc())
				{
				case 12:// vbGetRecordCount = 12
					iRecourdCount = oCommandReturn.GetValue_Num(_T("Type1_NewRecordCount"));
					
					ret.Format(_T("新记录数：%d "), iRecourdCount);
					
					RunState(ret);
					break;
				case 116://vbSearchEquptOnNetNum 搜索控制器的返回
					SN = oCommandReturn.GetValue_String(_T("SN"));
					TCPPar = oCommandReturn.GetValue_String(_T("TCPPar"));
					tcp.CreateDispatch(_T("FCDrive8800.DriveTCPInfo"), mpe);
					tcp.SetTCPParHexString(TCPPar);
					List = (CListBox*)GetDlgItem(IDC_LIST1);
					List->AddString(SN + "," + tcp.get_IP());
					break;
				default:
					RunState(_T("命令成功！"));
					break;
				}
				
				break;
			case 4://vbCommandTimeout.
				if (myevent.get_EventiFunc() == 116) //vbSearchEquptOnNetNum 搜索控制器的返回
				{//搜索指令，命令超时后续处理参考vb6的示例

					return;
				}

				RunState(_T("命令超时！"));
				break;
			case 5:// vbReadRecordAchieve '读设备日志
				iRecourdCount = myevent.get_EventlRecordCount();
				recordlist = (CDriveRecordLists)myevent.get_EventCols();
				iRecourdCount = recordlist.get_Count();

				List = (CListBox*)GetDlgItem(IDC_LIST1);

				List->ResetContent();

				for (size_t i = 1; i <= iRecourdCount; i++)//从 1 开始
				{
					CDriveRecord record = (CDriveRecord)recordlist.get_Item(i);
					double card = record.GetCard();
					DATE EventDate = record.GetDateTime();
					int port = record.GetDoorPort();
					int EventType = record.GetType();
					COleDateTime time1(EventDate);
					

					ret.Format(_T("卡号：%lf，事件代码：%d，时间：%d-%d-%d %d:%d:%d，端口号：%d"), card, EventType,
						time1.GetYear(), time1.GetMonth(), time1.GetDay(), time1.GetHour(), time1.GetMinute(), time1.GetSecond(),
						port);
					List->AddString(ret);
				}
				recordlist.Unload();//释放资源
				RunState(_T("读取记录成功！"));
				break;
			case 7://vbOpenPortErr
				RunState(_T("IP地址或端口错误！"));
				break;
			case 12://vbPasswordErr
				RunState(_T("通讯密码不正确！"));
				break;
			default:
				break;
			}
		
		}
		else
		{
			return;
		}

	} while (true);
}


CDriveInfo CTestActiveXDlg::GetDriveInfo()
{
	CDriveInfo oInfo;
	if (!oInfo.CreateDispatch(_T("FCDrive8800.DriveInfo"), mpe))
	{
		RunState(_T("创建 DriveInfo 错误！"));
		return NULL;
	}
	oInfo.put_SN(_T("MC-5824T25070244"));  //控制器的SN
	oInfo.put_Password(_T("FFFFFFFF"));//控制器的通讯密码，默认值是 FFFFFFFF
	oInfo.put_EquptType(8);//门禁控制器
	oInfo.put_ConnType(1);//OnTCP
	oInfo.put_IP(_T("192.168.1.126")); //控制器的IP地址
	oInfo.put_NetPort(8000);//控制器的tcp端口号 默认值是这个

	return oInfo;
}

//开门操作
void CTestActiveXDlg::OnBnClickedButton1()
{
	CDriveInfo oInfo = GetDriveInfo();
	if (oInfo == NULL) return;

	CDrivePortList door;
	door.CreateDispatch(_T("FCDrive8800.DrivePortList"), mpe);
	door.SetEquptType(8);//设定为门禁控制器
	door.SetPortValue(1, 1);//设定开1门
	door.SetPortValue(2, 1);//设定开1门
	
	mIOMain.OpenDoor((LPDISPATCH*)&oInfo, (LPDISPATCH*)&door);
}


//定时器
void CTestActiveXDlg::OnTimer(UINT_PTR nIDEvent)
{
	// TODO: 在此添加消息处理程序代码和/或调用默认值
	if (nIDEvent == EventLoopID)
	{
		KillTimer(EventLoopID);

		EventLoop();
		
		SetTimer(EventLoopID, 100, 0);
	}
	CDialog::OnTimer(nIDEvent);
}


void CTestActiveXDlg::OnBnClickedButton2()
{
	//自动搜索设备
	CDriveInfo oInfo;
	if (!oInfo.CreateDispatch(_T("FCDrive8800.DriveInfo"), mpe))
	{
		RunState(_T("创建 DriveInfo 错误！"));
		return;
	}
	oInfo.put_SN(_T("MC-5824T25070244"));  //控制器的SN 搜索设备时不知道目标sn，这里填16个0占位。
	oInfo.put_Password(_T("FFFFFFFF"));//控制器的通讯密码，默认值是 FFFFFFFF
	oInfo.put_EquptType(8);//门禁控制器
	oInfo.put_ConnType(2);//OnUDP
	oInfo.put_LocalIP(_T("192.168.1.126"));//设定UDP本地绑定IP -- 多网卡时需要指定 这里是电脑的IP
	oInfo.put_LocalNetPort(0);//设定UDP本地绑定端口号，---- 电脑的端口号，0--随机绑定。
	oInfo.put_IP(_T("255.255.255.255")); //控制器的IP地址
	oInfo.put_NetPort(8101);//控制器的tcp端口号 默认值是这个

	oInfo.put_RestartCount(0);//禁止重发命令
	oInfo.put_TimeOutMSEL(5000);//设定超时时间

	mIOMain.SearchEquptOnNetNum((LPDISPATCH*)&oInfo, 1000);

}

//读取记录
void CTestActiveXDlg::OnBnClickedButton3()
{
	CDriveInfo oInfo = GetDriveInfo();
	if (oInfo == NULL) return;
	/*
		'记录代码
		Public Enum e_RecordFileCode
			vbCardRecord = 1 '读卡记录
			vbDoorButtonRecord '出门按钮记录
			vbDoorStateRecord '门磁记录（门开关态记录）
			vbSoftwareOpenRecord '软件开门记录
			vbAlarmRecord '报警记录
			vbSysRecord '系统记录
		End Enum
	*/
	mIOMain.ReadRecord((LPDISPATCH*)&oInfo, (long)1,(long)0);
}

//清空记录
void CTestActiveXDlg::OnBnClickedButton4()
{
	CDriveInfo oInfo = GetDriveInfo();
	if (oInfo == NULL) return;

	mIOMain.ClearAllRecord((LPDISPATCH*)&oInfo);
}

//获取记录信息
void CTestActiveXDlg::OnBnClickedButton5()
{
	CDriveInfo oInfo = GetDriveInfo();
	if (oInfo == NULL) return;
	mIOMain.GetRecordInfo((LPDISPATCH*)&oInfo);
}

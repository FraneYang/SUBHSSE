
// TestActiveXDlg.cpp : ʵ���ļ�
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


// CTestActiveXDlg �Ի���



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

// CTestActiveXDlg ��Ϣ�������
//void CALLBACK EventLoop(HWND hWnd, UINT nMsg, UINT_PTR nTimerid, DWORD dwTime);
BOOL CTestActiveXDlg::OnInitDialog()
{
	CDialog::OnInitDialog();

	// ���ô˶Ի����ͼ�ꡣ  ��Ӧ�ó��������ڲ��ǶԻ���ʱ����ܽ��Զ�
	//  ִ�д˲���
	SetIcon(m_hIcon, TRUE);			// ���ô�ͼ��
	SetIcon(m_hIcon, FALSE);		// ����Сͼ��

	CoInitialize(NULL);
	mpe = new COleException;
	// TODO: �ڴ���Ӷ���ĳ�ʼ������
	if (!mIOMain.CreateDispatch(_T("FCDrive8800.DriveMain"), mpe))
	{
		RunState(_T("��ʼ������"));
		return FALSE;
	}
	else
	{
		//�����¼�����ģʽ
		mIOMain.SetShowEvent(0);//��ʾʹ���ֶ���ȡ��ʽ�õ��¼�
		RunState(_T("��ʼ���ɹ���" + mIOMain.GetVer()));
		SetTimer(EventLoopID, 100, 0);//�Զ����¼���ʱ��
	}

	return TRUE;  // ���ǽ��������õ��ؼ������򷵻� TRUE
}

void CTestActiveXDlg::OnDestroy()
{
	CDialog::OnDestroy();

	// TODO: �ڴ˴������Ϣ����������
	KillTimer(EventLoopID);
	mIOMain.Unload();
	CoUninitialize();
}

// �����Ի��������С����ť������Ҫ����Ĵ���
//  �����Ƹ�ͼ�ꡣ  ����ʹ���ĵ�/��ͼģ�͵� MFC Ӧ�ó���
//  �⽫�ɿ���Զ���ɡ�

void CTestActiveXDlg::OnPaint()
{
	if (IsIconic())
	{
		CPaintDC dc(this); // ���ڻ��Ƶ��豸������

		SendMessage(WM_ICONERASEBKGND, reinterpret_cast<WPARAM>(dc.GetSafeHdc()), 0);

		// ʹͼ���ڹ����������о���
		int cxIcon = GetSystemMetrics(SM_CXICON);
		int cyIcon = GetSystemMetrics(SM_CYICON);
		CRect rect;
		GetClientRect(&rect);
		int x = (rect.Width() - cxIcon + 1) / 2;
		int y = (rect.Height() - cyIcon + 1) / 2;

		// ����ͼ��
		dc.DrawIcon(x, y, m_hIcon);
	}
	else
	{
		CDialog::OnPaint();
	}
}

//���û��϶���С������ʱϵͳ���ô˺���ȡ�ù��
//��ʾ��
HCURSOR CTestActiveXDlg::OnQueryDragIcon()
{
	return static_cast<HCURSOR>(m_hIcon);
}


void CTestActiveXDlg::EventLoop()
{
	do
	{
		//��ȡ�¼�����
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
				/*�������*/
				oConnInfo  = myevent.get_EventConnInfo();
				//ͨ����Ӧ�����Ӳ�������������룬���ض����ȡ���ݶ���
				oCommandReturn=(CDriveValueList)mIOMain.AchieveValuetoList(&oConnInfo, myevent.get_EventiFunc(), myevent.get_EventsValue());

				switch (myevent.get_EventiFunc())
				{
				case 12:// vbGetRecordCount = 12
					iRecourdCount = oCommandReturn.GetValue_Num(_T("Type1_NewRecordCount"));
					
					ret.Format(_T("�¼�¼����%d "), iRecourdCount);
					
					RunState(ret);
					break;
				case 116://vbSearchEquptOnNetNum �����������ķ���
					SN = oCommandReturn.GetValue_String(_T("SN"));
					TCPPar = oCommandReturn.GetValue_String(_T("TCPPar"));
					tcp.CreateDispatch(_T("FCDrive8800.DriveTCPInfo"), mpe);
					tcp.SetTCPParHexString(TCPPar);
					List = (CListBox*)GetDlgItem(IDC_LIST1);
					List->AddString(SN + "," + tcp.get_IP());
					break;
				default:
					RunState(_T("����ɹ���"));
					break;
				}
				
				break;
			case 4://vbCommandTimeout.
				if (myevent.get_EventiFunc() == 116) //vbSearchEquptOnNetNum �����������ķ���
				{//����ָ����ʱ��������ο�vb6��ʾ��

					return;
				}

				RunState(_T("���ʱ��"));
				break;
			case 5:// vbReadRecordAchieve '���豸��־
				iRecourdCount = myevent.get_EventlRecordCount();
				recordlist = (CDriveRecordLists)myevent.get_EventCols();
				iRecourdCount = recordlist.get_Count();

				List = (CListBox*)GetDlgItem(IDC_LIST1);

				List->ResetContent();

				for (size_t i = 1; i <= iRecourdCount; i++)//�� 1 ��ʼ
				{
					CDriveRecord record = (CDriveRecord)recordlist.get_Item(i);
					double card = record.GetCard();
					DATE EventDate = record.GetDateTime();
					int port = record.GetDoorPort();
					int EventType = record.GetType();
					COleDateTime time1(EventDate);
					

					ret.Format(_T("���ţ�%lf���¼����룺%d��ʱ�䣺%d-%d-%d %d:%d:%d���˿ںţ�%d"), card, EventType,
						time1.GetYear(), time1.GetMonth(), time1.GetDay(), time1.GetHour(), time1.GetMinute(), time1.GetSecond(),
						port);
					List->AddString(ret);
				}
				recordlist.Unload();//�ͷ���Դ
				RunState(_T("��ȡ��¼�ɹ���"));
				break;
			case 7://vbOpenPortErr
				RunState(_T("IP��ַ��˿ڴ���"));
				break;
			case 12://vbPasswordErr
				RunState(_T("ͨѶ���벻��ȷ��"));
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
		RunState(_T("���� DriveInfo ����"));
		return NULL;
	}
	oInfo.put_SN(_T("MC-5824T25070244"));  //��������SN
	oInfo.put_Password(_T("FFFFFFFF"));//��������ͨѶ���룬Ĭ��ֵ�� FFFFFFFF
	oInfo.put_EquptType(8);//�Ž�������
	oInfo.put_ConnType(1);//OnTCP
	oInfo.put_IP(_T("192.168.1.126")); //��������IP��ַ
	oInfo.put_NetPort(8000);//��������tcp�˿ں� Ĭ��ֵ�����

	return oInfo;
}

//���Ų���
void CTestActiveXDlg::OnBnClickedButton1()
{
	CDriveInfo oInfo = GetDriveInfo();
	if (oInfo == NULL) return;

	CDrivePortList door;
	door.CreateDispatch(_T("FCDrive8800.DrivePortList"), mpe);
	door.SetEquptType(8);//�趨Ϊ�Ž�������
	door.SetPortValue(1, 1);//�趨��1��
	door.SetPortValue(2, 1);//�趨��1��
	
	mIOMain.OpenDoor((LPDISPATCH*)&oInfo, (LPDISPATCH*)&door);
}


//��ʱ��
void CTestActiveXDlg::OnTimer(UINT_PTR nIDEvent)
{
	// TODO: �ڴ������Ϣ�����������/�����Ĭ��ֵ
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
	//�Զ������豸
	CDriveInfo oInfo;
	if (!oInfo.CreateDispatch(_T("FCDrive8800.DriveInfo"), mpe))
	{
		RunState(_T("���� DriveInfo ����"));
		return;
	}
	oInfo.put_SN(_T("MC-5824T25070244"));  //��������SN �����豸ʱ��֪��Ŀ��sn��������16��0ռλ��
	oInfo.put_Password(_T("FFFFFFFF"));//��������ͨѶ���룬Ĭ��ֵ�� FFFFFFFF
	oInfo.put_EquptType(8);//�Ž�������
	oInfo.put_ConnType(2);//OnUDP
	oInfo.put_LocalIP(_T("192.168.1.126"));//�趨UDP���ذ�IP -- ������ʱ��Ҫָ�� �����ǵ��Ե�IP
	oInfo.put_LocalNetPort(0);//�趨UDP���ذ󶨶˿ںţ�---- ���ԵĶ˿ںţ�0--����󶨡�
	oInfo.put_IP(_T("255.255.255.255")); //��������IP��ַ
	oInfo.put_NetPort(8101);//��������tcp�˿ں� Ĭ��ֵ�����

	oInfo.put_RestartCount(0);//��ֹ�ط�����
	oInfo.put_TimeOutMSEL(5000);//�趨��ʱʱ��

	mIOMain.SearchEquptOnNetNum((LPDISPATCH*)&oInfo, 1000);

}

//��ȡ��¼
void CTestActiveXDlg::OnBnClickedButton3()
{
	CDriveInfo oInfo = GetDriveInfo();
	if (oInfo == NULL) return;
	/*
		'��¼����
		Public Enum e_RecordFileCode
			vbCardRecord = 1 '������¼
			vbDoorButtonRecord '���Ű�ť��¼
			vbDoorStateRecord '�Ŵż�¼���ſ���̬��¼��
			vbSoftwareOpenRecord '������ż�¼
			vbAlarmRecord '������¼
			vbSysRecord 'ϵͳ��¼
		End Enum
	*/
	mIOMain.ReadRecord((LPDISPATCH*)&oInfo, (long)1,(long)0);
}

//��ռ�¼
void CTestActiveXDlg::OnBnClickedButton4()
{
	CDriveInfo oInfo = GetDriveInfo();
	if (oInfo == NULL) return;

	mIOMain.ClearAllRecord((LPDISPATCH*)&oInfo);
}

//��ȡ��¼��Ϣ
void CTestActiveXDlg::OnBnClickedButton5()
{
	CDriveInfo oInfo = GetDriveInfo();
	if (oInfo == NULL) return;
	mIOMain.GetRecordInfo((LPDISPATCH*)&oInfo);
}

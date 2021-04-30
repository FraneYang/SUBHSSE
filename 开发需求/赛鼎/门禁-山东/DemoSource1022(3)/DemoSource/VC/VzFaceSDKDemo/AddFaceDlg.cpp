// AddFaceDlg.cpp : implementation file
//

#include "stdafx.h"
#include "VzFaceSDKDemo.h"
#include "AddFaceDlg.h"
#include "afxdialogex.h"


// CAddFaceDlg dialog

IMPLEMENT_DYNAMIC(CAddFaceDlg, CDialogEx)

CAddFaceDlg::CAddFaceDlg(VzLPRClientHandle cam, CString filePath, CWnd* pParent /*=NULL*/)
	: CDialogEx(CAddFaceDlg::IDD, pParent)
{
	m_cam = cam;
	m_filePath = filePath;
}

CAddFaceDlg::~CAddFaceDlg()
{
	StopThread();
}



void CAddFaceDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialogEx::DoDataExchange(pDX);
	DDX_Control(pDX, IDC_COMBO2, m_ComType);
	DDX_Control(pDX, IDC_COMBO1, m_ComJur);
}


BEGIN_MESSAGE_MAP(CAddFaceDlg, CDialogEx)
	ON_BN_CLICKED(IDC_BUTTON2, &CAddFaceDlg::OnBnClickedButton2)
	ON_STN_CLICKED(IDC_PIC, &CAddFaceDlg::OnStnClickedPic)
	ON_BN_CLICKED(IDC_BTN_CANCEL, &CAddFaceDlg::OnBnClickedBtnCancel)
	ON_MESSAGE(WM_USER_MSG_ADDFACE, &CAddFaceDlg::OnUserMsg)
	ON_WM_PAINT()
END_MESSAGE_MAP()


// CAddFaceDlg message handlers


void CAddFaceDlg::OnBnClickedButton2()
{
	// TODO: Add your control notification handler code here
	CString facename, faceWG, IDCard;
	GetDlgItem(IDC_EDIT_FACENAME)->GetWindowText(facename);
	GetDlgItem(IDC_EDIT_WG)->GetWindowText(faceWG);

	if (facename.IsEmpty())
	{
		AfxMessageBox("请输入姓名");
		return;
	}	
	
	std::ifstream ifs(m_filePath, std::ios_base::binary);
	if (ifs.is_open()) {
		ifs.seekg(0, std::ios_base::end);
		std::vector<uint8_t> buf(ifs.tellg());
		ifs.seekg(0);

		ifs.read((char*)buf.data(), buf.size());
		ifs.close();
		FaceFlags face;
		std::string strName = util::Convert<util::utf8>(facename.GetBuffer());
		strncpy(face.faceName, strName.c_str(), sizeof(face.faceName));
		strncpy(face.resv, IDCard, 100);
		face.wgCardNO = atoll(faceWG);
		FaceImage img;
		img.img = buf.data();
		img.img_len = buf.size();

		/*img.img = (unsigned char *)1234;
		img.img_len = 4;*/

		SYSTEMTIME	tt;
		GetSystemTime(&tt);
		CString strFaceId;
		GetDlgItem(IDC_EDIT_ID)->GetWindowTextA(strFaceId);
		if (strFaceId.IsEmpty())
		{
			strFaceId.Format("%04d%02d%02d%02d%02d%02d%03d", tt.wYear, tt.wMonth, tt.wDay, tt.wHour, tt.wMinute, tt.wSecond, tt.wMilliseconds);
		}
		strncpy(face.faceID, strFaceId, sizeof(face.faceID));

		SYSTEMTIME t, t1;
		((CDateTimeCtrl*)GetDlgItem(IDC_DATE_S))->GetTime(&t);
		((CDateTimeCtrl*)GetDlgItem(IDC_TIME_S))->GetTime(&t1);
		CTime time(t.wYear, t.wMonth, t.wDay, t1.wHour, t1.wMinute, t1.wSecond);
		//((CDateTimeCtrl*)GetDlgItem(IDC_DATE_S))->GetTime(time);
		//((CDateTimeCtrl*)GetDlgItem(IDC_TIME_S))->GetTime(time);
		face.effectStartTime = time.GetTime();
		if (face.effectStartTime < 0)
		{
			face.effectStartTime = 0;
		}
		((CDateTimeCtrl*)GetDlgItem(IDC_DATE_E2))->GetTime(&t);
		((CDateTimeCtrl*)GetDlgItem(IDC_TIME_E2))->GetTime(&t1);
		CTime time2(t.wYear, t.wMonth, t.wDay, t1.wHour, t1.wMinute, t1.wSecond);
		face.effectTime = time2.GetTime(); 
		int nPos = m_ComType.GetCurSel();
		face.role = nPos + 1;

		int nType = m_ComJur.GetCurSel();
		face.usr_type = nType;
		CString IDCard;
		GetDlgItem(IDC_EDIT_WG2)->GetWindowTextA(IDCard);
		strncpy(face.resv, IDCard, 100);
		if (m_nType == 1)
		{

			strncpy(face.faceID, m_faceInfo->personID, sizeof(face.faceID));
			int nRet = ZBX_ModifyFaces(m_cam, &face, &img);
			if (0 == nRet){
				AfxMessageBox("修改成功");
			}
			else
			{
				AfxMessageBox("修改失败");
			}
		}
		else
		{
			int nRet = ZBX_AddJpgFaces(m_cam, &face, &img, 1, 0);
			if (0 == nRet){
				AfxMessageBox("添加成功");
			}
			else
			{
				AfxMessageBox("添加失败");
			}
		}
		
	}
	m_filePath.ReleaseBuffer();
	OnOK();
}
void CAddFaceDlg::SetData(QueryFaceInfoEx* pInfo){
	if (pInfo)
	{
		m_faceInfo = pInfo;
		m_listTask.AddHead(1);
		m_nType = 1;
	}
}
void CAddFaceDlg::TrdInitUI(){
	
}
BOOL CAddFaceDlg::OnInitDialog()
{
	CDialogEx::OnInitDialog();

	// TODO:  在此添加额外的初始化
	StartThread(0, 300);
	int nCout = m_ComJur.GetCount();
	m_ComJur.InsertString(0, "无");
	for (int i = 0; i < 4; i++)
	{
		CString str;
		str = theApp.m_mapUserRightCfgs[m_cam]->user_rights[i].name;
		if (str.IsEmpty())
		{
			str.Format("权限%d", i + 1);
		}
		m_ComJur.InsertString(i + 1, str);
	}
	m_ComJur.SetCurSel(0);

	m_ComType.InsertString(0, "白名单");
	m_ComType.InsertString(1, "黑名单");
	m_ComType.SetCurSel(0);


	CTime time(4102416000);
	((CDateTimeCtrl*)GetDlgItem(IDC_DATE_E))->SetTime(&time);
	((CDateTimeCtrl*)GetDlgItem(IDC_TIME_E))->SetTime(&time);

	CTime times(0);
	((CDateTimeCtrl*)GetDlgItem(IDC_DATE_S))->SetTime(&times);
	((CDateTimeCtrl*)GetDlgItem(IDC_TIME_S))->SetTime(&times);
	return TRUE;  // return TRUE unless you set the focus to a control
	// 异常:  OCX 属性页应返回 FALSE
}

bool CAddFaceDlg::ShowPic(CString strfile){
	if (strfile.IsEmpty())
	{
		return -1;
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
	HRESULT hr = img.Load(strfile);
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
}

void CAddFaceDlg::OnStnClickedPic()
{
	// TODO:  在此添加控件通知处理程序代码
}


void CAddFaceDlg::OnBnClickedBtnCancel()
{
	// TODO:  在此添加控件通知处理程序代码
	OnCancel();
}


void CAddFaceDlg::OnPaint()
{
	CPaintDC dc(this); // device context for painting
	// TODO:  在此处添加消息处理程序代码
	// 不为绘图消息调用 __super::OnPaint()	
	m_listTask.AddHead(2);
}


void CAddFaceDlg::UpdataInfo(const QueryFaceInfoEx* faceQueryInfo){
	if (!faceQueryInfo)
	{
		return;
	}	
	PostMessage(WM_USER_MSG_ADDFACE, (WPARAM)MSG_QUERY, (LPARAM)faceQueryInfo);
}

LRESULT CAddFaceDlg::OnUserMsg(WPARAM w, LPARAM l)
{
	switch ((int)w)
	{
	case MSG_QUERY:
		ShowQueryResult(l);
		break;	
	default:
		break;
	}

	return(0);
}

void CAddFaceDlg::ShowQueryResult(LPARAM l)
{
	GetDlgItem(IDC_BUTTON2)->SetWindowTextA("修改");
	QueryFaceInfoEx *faceQueryInfo = (QueryFaceInfoEx *)l;
	std::string strperName(faceQueryInfo->personName, 16);
	strperName = util::Convert<util::ascii>(strperName);
	GetDlgItem(IDC_EDIT_FACENAME)->SetWindowTextA(strperName.c_str());
	CString str;
	str.Format("%u", faceQueryInfo->wgCardNO);
	GetDlgItem(IDC_EDIT_WG)->SetWindowTextA(str);
	if (faceQueryInfo->role==2)
	{
		m_ComType.SetCurSel(1);
	}
	m_ComJur.SetCurSel(faceQueryInfo->user_type);
	GetDlgItem(IDC_EDIT_WG2)->SetWindowTextA(faceQueryInfo->idcardper);
	CTime te(faceQueryInfo->effectStartTime);
	CTime ts(faceQueryInfo->effectTime);
	((CDateTimeCtrl*)GetDlgItem(IDC_DATE_S))->SetTime(&te);
	((CDateTimeCtrl*)GetDlgItem(IDC_TIME_S))->SetTime(&te);

	((CDateTimeCtrl*)GetDlgItem(IDC_DATE_E))->SetTime(&ts);
	((CDateTimeCtrl*)GetDlgItem(IDC_TIME_E))->SetTime(&ts);
	GetDlgItem(IDC_EDIT_ID)->SetWindowTextA(faceQueryInfo->personID);

	GetDlgItem(IDC_EDIT_ID)->EnableWindow(FALSE);
}
void CAddFaceDlg::Run()
{
	int iCmd = -1;
	if (m_listTask.IsEmpty())
		return;

	iCmd = m_listTask.RemoveHead();
	if (iCmd == 1)
	{
		UpdataInfo(m_faceInfo);
	}
	else if (iCmd == 2)
	{
		ShowPic(m_filePath);
	}
}
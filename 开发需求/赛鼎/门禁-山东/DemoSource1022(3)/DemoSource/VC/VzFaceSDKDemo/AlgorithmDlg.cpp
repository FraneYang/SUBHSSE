// AlgorithmDlg.cpp : implementation file
//

#include "stdafx.h"
#include "VzFaceSDKDemo.h"
#include "AlgorithmDlg.h"
#include "afxdialogex.h"

// CAlgorithmDlg dialog

IMPLEMENT_DYNAMIC(CAlgorithmDlg, CDialogEx)

CAlgorithmDlg::CAlgorithmDlg(VzLPRClientHandle cam,CWnd* pParent /*=NULL*/)
	: CDialogEx(CAlgorithmDlg::IDD, pParent){
	m_cam = cam;
}

CAlgorithmDlg::~CAlgorithmDlg()
{
	StopThread();
}

void CAlgorithmDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialogEx::DoDataExchange(pDX);
	DDX_Control(pDX, IDC_COMBO1, m_ComMin);
	DDX_Control(pDX, IDC_COMBO2, m_ComMax);
	DDX_Control(pDX, IDC_SLIDER1, m_Slider);
}


void CAlgorithmDlg::Run()
{
	int iCmd = -1;
	if (m_listTask.IsEmpty())
		return;

	iCmd = m_listTask.RemoveHead();
	if (iCmd == 1)
	{
		PostMessage(WM_USER_MSG_ALGORITHM, (WPARAM)MSG_INIT, NULL);
	}
}

BEGIN_MESSAGE_MAP(CAlgorithmDlg, CDialogEx)
//	ON_BN_CLICKED(IDC_BTN_RESET, &CAlgorithmDlg::OnBnClickedBtnReset)
	ON_MESSAGE(WM_USER_MSG_ALGORITHM, &CAlgorithmDlg::OnUserMsg)
//	ON_BN_CLICKED(IDC_BTN_SIMILARSET, &CAlgorithmDlg::OnBnClickedBtnSimilarset)
//	ON_BN_CLICKED(IDC_BTN_SAVE, &CAlgorithmDlg::OnBnClickedBtnSave)
	ON_BN_CLICKED(IDC_BTN_RESULT, &CAlgorithmDlg::OnBnClickedBtnResult)
	ON_BN_CLICKED(IDC_RADIO2, &CAlgorithmDlg::OnBnClickedRadio2)
	ON_BN_CLICKED(IDC_RADIO1, &CAlgorithmDlg::OnBnClickedRadio1)
//	ON_BN_CLICKED(IDC_BTN_IDCARD, &CAlgorithmDlg::OnBnClickedBtnIdcard)
//	ON_BN_CLICKED(IDC_BTN_RESET2, &CAlgorithmDlg::OnBnClickedBtnReset2)
//	ON_BN_CLICKED(IDC_BTN_SIMILARSET2, &CAlgorithmDlg::OnBnClickedBtnSimilarset2)
//	ON_BN_CLICKED(IDC_BTN_IDCARD2, &CAlgorithmDlg::OnBnClickedBtnIdcard2)
//	ON_BN_CLICKED(IDC_BTN_SAVE2, &CAlgorithmDlg::OnBnClickedBtnSave2)
	ON_BN_CLICKED(IDC_BTN_RESULT2, &CAlgorithmDlg::OnBnClickedBtnResult2)
//	ON_BN_CLICKED(IDC_BTN_DISTREAD, &CAlgorithmDlg::OnBnClickedBtnDistread)
//	ON_BN_CLICKED(IDC_BTN_DISTSET, &CAlgorithmDlg::OnBnClickedBtnDistset)
	ON_BN_CLICKED(IDC_CHECK_SAFETY, &CAlgorithmDlg::OnBnClickedCheckSafety)
	ON_BN_CLICKED(IDC_BTN_READ, &CAlgorithmDlg::OnBnClickedBtnRead)
	ON_BN_CLICKED(IDC_BTN_IDCARD, &CAlgorithmDlg::OnBnClickedBtnIdcard)
	ON_WM_HSCROLL()
	ON_WM_TIMER()
END_MESSAGE_MAP()


// CAlgorithmDlg message handlers


//void CAlgorithmDlg::OnBnClickedBtnReset()
//{
//	// TODO: Add your control notification handler code here
//	CString str;
//	GetDlgItem(IDC_EDIT1)->GetWindowTextA(str);
//	int nLevel = atoi(str);
//	if (nLevel > 100 || nLevel < 1)
//	{
//		AfxMessageBox("��������1~100֮��");
//		return;
//	}
//	if (0 == ZBX_SetClusterTimesInterval(m_cam, nLevel)){
//		AfxMessageBox("���óɹ�");
//	}
//	else
//	{
//		AfxMessageBox("����ʧ��");
//	}
//}
LRESULT CAlgorithmDlg::OnUserMsg(WPARAM w, LPARAM l)
{
	int nScore;
	int nRet = ZBX_GetMatchScore(m_cam, &nScore);
	CString strScore;
	strScore.Format("%d", nScore);
	GetDlgItem(IDC_EDIT2)->SetWindowTextA(strScore);
	m_stData.ModelS = nScore;
	unsigned int nTime = 0;
	if ((0 == ZBX_GetClusterTimesInterval(m_cam, &nTime))){
		SetDlgItemInt(IDC_EDIT1, nTime);
	}
	else
	{
		if (m_bRead)
		{
			AfxMessageBox("��ȡʧ��");
			return 0l;
		}
	}

	m_stData.Rep = nTime;
	char Level[10];
	nRet = ZBX_GetPushMode(m_cam, Level);
	CString str = Level;
	if (nRet == 0)
	{
		if (atoi(str) == 0)
		{
			((CButton *)GetDlgItem(IDC_RADIO1))->SetCheck(TRUE);
		}
		else if (atoi(str) == 1)
		{
			((CButton *)GetDlgItem(IDC_RADIO2))->SetCheck(TRUE);
		}
	}
	else
	{
		if (m_bRead)
		{
			AfxMessageBox("��ȡʧ��");
			return 0l;
		}
	}
	int nEnable = -1;
	nRet = ZBX_GetSafetyHat(m_cam, &nEnable);
	m_stData.SaftHad = nEnable;
	if (nRet == 0)
	{
		((CButton*)GetDlgItem(IDC_CHECK_SAFETY))->SetCheck(nEnable);	
		if (nEnable)
		{
			GetDlgItem(IDC_CHECK_STOP)->EnableWindow(TRUE);
		}
	}
	else
	{
		if (m_bRead)
		{
			AfxMessageBox("��ȡʧ��");
			return 0l;
		}
	}

	nRet = ZBX_GetAliveDetectEnable(m_cam, &nEnable);
	m_stData.bActive = nEnable;
	if (nRet == 0)
	{
		((CButton*)GetDlgItem(IDC_CHECK_ACTIVE))->SetCheck(nEnable);
	}
	else
	{
		if (m_bRead)
		{
			AfxMessageBox("��ȡʧ��");
			return 0l;
		}
	}

	nRet = ZBX_GetFaceShow(m_cam, &nEnable);
	m_stData.FaceShow = nEnable;
	if (nRet == 0)
	{
		((CButton*)GetDlgItem(IDC_CHECK_FACESHOW))->SetCheck(nEnable);
	}
	else
	{
		if (m_bRead)
		{
			AfxMessageBox("��ȡʧ��");
			return 0l;
		}
	}

	nRet = ZBX_GetWaterMark(m_cam, &nEnable);
	m_stData.WaterMar = nEnable;
	if (nRet == 0)
	{
		((CButton*)GetDlgItem(IDC_CHECK_PICWAITER))->SetCheck(nEnable);
	}
	else
	{
		if (m_bRead)
		{
			AfxMessageBox("��ȡʧ��");
			return 0l;
		}
	}

	nRet = ZBX_GetSafetyHatStatus(m_cam, &nEnable);
	m_stData.saftpass = nEnable;
	if (nRet == 0)
	{
		((CButton*)GetDlgItem(IDC_CHECK_STOP))->SetCheck(nEnable);
	}
	else
	{
		if (m_bRead)
		{
			AfxMessageBox("��ȡʧ��");
			return 0l;
		}
	}

	nRet = ZBX_GetIDCardScore(m_cam, &nEnable);
	m_stData.IdcardS = nEnable;
	if (nRet == 0)
	{

		SetDlgItemInt(IDC_EDIT_ID, nEnable);
	}
	else
	{
		if (m_bRead)
		{
			AfxMessageBox("��ȡʧ��");
			return 0l;
		}
	}

	double dmin, dmax;
	nRet = ZBX_GetRecoDist(m_cam, &dmin, &dmax);
	m_stData.RecoDistmin = dmin;
	m_stData.RecoDistmax = dmax;
	if (nRet == 0)
	{
		CString str;
		str.Format("%0.1f", dmin);
		GetDlgItem(IDC_COMBO1)->SetWindowTextA(str);
		str.Format("%0.1f", dmax);
		GetDlgItem(IDC_COMBO2)->SetWindowTextA(str);
	}
	else
	{
		if (m_bRead)
		{
			AfxMessageBox("��ȡʧ��");
			return 0l;
		}
	}

	
	nRet = ZBX_GetOutputCtl(m_cam, &nEnable);
	m_stData.OutputCtl = nEnable;
	if (nRet == 0)
	{
		((CButton*)GetDlgItem(IDC_CHECK_MODE))->SetCheck(nEnable);
	}
	else
	{
		if (m_bRead)
		{
			AfxMessageBox("��ȡʧ��");
			return 0l;
		}
	}
	{
		int nAng, nTmp;
		nRet = ZBX_GetValidAngleEnable(m_cam,&nAng,&nTmp);
		if (nRet)
		{
			AfxMessageBox("��ȡ���ʶ��Ƕ�ʧ��");
			return 0l;
		}
		m_stData.angle = nAng;
		m_nVol = nAng;
		SetDlgItemInt(IDC_EDIT_A, nAng);
		m_Slider.SetPos(nAng);
		if (m_bRead)
		{
			AfxMessageBox("��ȡ���");
			m_bRead = FALSE;
		}
	}
	return 1l;
}

//void CAlgorithmDlg::OnBnClickedBtnSimilarset()
//{
//	// TODO: Add your control notification handler code here
//	CString strScore;
//	GetDlgItem(IDC_EDIT2)->GetWindowTextA(strScore);
//	int nScore = atoi(strScore);
//	if (0 > nScore || nScore > 100)
//	{
//		AfxMessageBox("��������ȷ�����ƶ� ӦΪ0~100");
//		return;
//	}
//	int nRet = ZBX_SetMatchScore(m_cam, nScore);
//	if (!nRet)
//	{
//		AfxMessageBox("���óɹ�");
//	}
//	else
//	{
//		AfxMessageBox("����ʧ��");
//	}
//}


//void CAlgorithmDlg::OnBnClickedBtnSave()
//{
//	// TODO: Add your control notification handler code here
//	int nPreData = -1;
//	int nUIData = -1;
//	int nRet = -1;
//	nUIData = ((CButton*)GetDlgItem(IDC_CHECK_SAFETY))->GetCheck();
//	nRet = ZBX_SetSafetyHat(m_cam, nUIData);
//	if (nRet != 0)
//	{
//		AfxMessageBox("���ð�ȫñʧ��");
//		Log() << "ZBX_SetSafetyHat Config fiail nRet = " << nRet << "\r\n";
//	}
//	else{
//		CString strTmp;
//		strTmp.Format("%d", nUIData);
//		WritePrivateProfileStringA("Save", "SafetyHat", strTmp, ".\\Demo.ini");
//	}
//	
//	nUIData = ((CButton*)GetDlgItem(IDC_CHECK_ACTIVE))->GetCheck();
//	nRet = ZBX_SetAliveDetectEnable(m_cam, nUIData);
//	if (nRet != 0)
//	{
//		AfxMessageBox("���û���ʧ��");
//		Log() << "ZBX_SetAliveDetectEnable Config fiail nRet = " << nRet << "\r\n";
//	}
//		
//	
//	nUIData = ((CButton*)GetDlgItem(IDC_CHECK_FACESHOW))->GetCheck();
//	nRet = ZBX_SetFaceShow(m_cam, nUIData);
//	if (nRet != 0)
//	{
//		AfxMessageBox("�����������ٿ�ʧ��");
//		Log() << "ZBX_SetAliveDetectEnable Config fiail nRet = " << nRet << "\r\n";
//	}
//	nUIData = ((CButton*)GetDlgItem(IDC_CHECK_PICWAITER))->GetCheck();
//	nRet = ZBX_SetWaterMark(m_cam, nUIData);
//	if (nRet != 0)
//	{
//		AfxMessageBox("����ˮӡʧ��");
//		Log() << "ZBX_SetAliveDetectEnable Config fiail nRet = " << nRet << "\r\n";
//	}
//
//	nUIData = ((CButton*)GetDlgItem(IDC_CHECK_STOP))->GetCheck();
//	nRet = ZBX_SetSafetyHatStatus(m_cam, nUIData);
//	if (nRet != 0)
//	{
//		AfxMessageBox("���ð�ȫñͨ��ʧ��");
//		Log() << "ZBX_SetAliveDetectEnable Config fiail nRet = " << nRet << "\r\n";
//	}
//
//	nUIData = ((CButton*)GetDlgItem(IDC_CHECK_MODE))->GetCheck();
//	nRet = ZBX_SetOutputCtl(m_cam, nUIData);
//	if (nRet != 0)
//	{
//		AfxMessageBox("���ô���ģʽʧ��");
//		Log() << "ZBX_SetAliveDetectEnable Config fiail nRet = " << nRet << "\r\n";
//	}
//
//	AfxMessageBox("���óɹ�");
//}


void CAlgorithmDlg::OnBnClickedBtnResult()
{
	// TODO: Add your control notification handler code here
	int nRet = ZBX_SetPushMode(m_cam, m_bPushMode);
	if (nRet == 0)
	{
		AfxMessageBox("���óɹ�");
	}
	else
	{
		AfxMessageBox("����ʧ��");
	}
}


BOOL CAlgorithmDlg::OnInitDialog()
{
	CDialogEx::OnInitDialog();

	// TODO:  Add extra initialization here
	m_ComMin.InsertString(0, "0.3");
	m_ComMin.InsertString(1, "0.5");
	m_ComMin.InsertString(2, "1.0");
	m_ComMin.InsertString(3, "1.5");
	m_ComMin.InsertString(4, "2.0");

	m_ComMin.SetCurSel(0);
	m_ComMax.InsertString(0, "0.5");
	m_ComMax.InsertString(1, "1.0");
	m_ComMax.InsertString(2, "1.5");
	m_ComMax.InsertString(3, "2.0");
	m_ComMax.InsertString(4, "2.5");
	m_ComMax.SetCurSel(0);
	StartThread(0, 10);
	GetDlgItem(IDC_CHECK_STOP)->EnableWindow(FALSE);
	m_listTask.AddHead(1);
	m_Slider.SetRange(0, 90);
	//PostMessage(WM_USER_MSG_ALGORITHM, (WPARAM)MSG_INIT, NULL);
	//SetTimer(1, 200, NULL);
	return TRUE;  // return TRUE unless you set the focus to a control
	// EXCEPTION: OCX Property Pages should return FALSE
}


BOOL CAlgorithmDlg::PreTranslateMessage(MSG* pMsg)
{
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


void CAlgorithmDlg::OnBnClickedRadio2()
{
	// TODO: Add your control notification handler code here
	m_bPushMode = true;
}


void CAlgorithmDlg::OnBnClickedRadio1()
{
	// TODO: Add your control notification handler code here
	m_bPushMode = false;
}


//void CAlgorithmDlg::OnBnClickedBtnIdcard()
//{
//	// TODO:  �ڴ���ӿؼ�֪ͨ����������
//	CString str;
//	GetDlgItem(IDC_EDIT_ID)->GetWindowTextA(str);
//	
//	int nRet = ZBX_SetIDCardScore(m_cam, atoi(str));
//	if (nRet==0)
//	{
//		AfxMessageBox("���óɹ�");
//	}
//	else
//	{
//		AfxMessageBox("����ʧ��");
//	}
//}


//void CAlgorithmDlg::OnBnClickedBtnReset2()
//{
//	// TODO:  �ڴ���ӿؼ�֪ͨ����������
//	unsigned int nTime = 0;
//	if ((0 == ZBX_GetClusterTimesInterval(m_cam, &nTime))){
//		SetDlgItemInt(IDC_EDIT1, nTime); AfxMessageBox("��ȡ�ɹ�");
//	}else
//		AfxMessageBox("��ȡʧ��");
//
//}


//void CAlgorithmDlg::OnBnClickedBtnSimilarset2()
//{
//	// TODO:  �ڴ���ӿؼ�֪ͨ����������
//	int nScore = 0;
//	int nRet = ZBX_GetMatchScore(m_cam, &nScore);
//	CString strScore;
//	strScore.Format("%d", nScore);
//	GetDlgItem(IDC_EDIT2)->SetWindowTextA(strScore);
//	if (nRet == 0)
//	{
//		AfxMessageBox("��ȡ�ɹ�");
//	}
//	else
//	{
//		AfxMessageBox("��ȡʧ��");
//	}
//}


//void CAlgorithmDlg::OnBnClickedBtnIdcard2()
//{
//	// TODO:  �ڴ���ӿؼ�֪ͨ����������
//	int nTime = 0;
//	int nRet = ZBX_GetIDCardScore(m_cam, &nTime);
//	if (nRet == 0)
//	{
//		AfxMessageBox("��ȡ�ɹ�");
//		SetDlgItemInt(IDC_EDIT_ID, nTime);
//	}
//	else
//	{
//		AfxMessageBox("��ȡʧ��");
//	}
//}


//void CAlgorithmDlg::OnBnClickedBtnSave2()
//{
//	// TODO:  �ڴ���ӿؼ�֪ͨ����������
//
//	int nEnable = -1;
//	int nRet = ZBX_GetSafetyHat(m_cam, &nEnable);
//	if (nRet == 0)
//	{
//		((CButton*)GetDlgItem(IDC_CHECK_SAFETY))->SetCheck(nEnable);
//	}
//
//	nRet = ZBX_GetAliveDetectEnable(m_cam, &nEnable);
//	if (nRet == 0)
//	{
//		((CButton*)GetDlgItem(IDC_CHECK_ACTIVE))->SetCheck(nEnable);
//	}
//
//	nRet = ZBX_GetFaceShow(m_cam, &nEnable);
//	if (nRet == 0)
//	{
//		((CButton*)GetDlgItem(IDC_CHECK_FACESHOW))->SetCheck(nEnable);
//	}
//
//	nRet = ZBX_GetWaterMark(m_cam, &nEnable);
//	if (nRet == 0)
//	{
//		((CButton*)GetDlgItem(IDC_CHECK_PICWAITER))->SetCheck(nEnable);
//	}
//
//	nRet = ZBX_GetSafetyHatStatus(m_cam, &nEnable);
//	if (nRet == 0)
//	{
//		((CButton*)GetDlgItem(IDC_CHECK_STOP))->SetCheck(nEnable);
//	}
//	nRet = ZBX_GetOutputCtl(m_cam, &nEnable);
//	if (nRet == 0)
//	{
//		((CButton*)GetDlgItem(IDC_CHECK_MODE))->SetCheck(nEnable);
//	}
//	AfxMessageBox("��ȡ���");
//}


void CAlgorithmDlg::OnBnClickedBtnResult2()
{
	// TODO:  �ڴ���ӿؼ�֪ͨ����������
	char Level[10];
	int nRet = ZBX_GetPushMode(m_cam, Level);
	CString str = Level;
	if (nRet == 0)
	{
		if (atoi(str) == 0)
		{
			((CButton *)GetDlgItem(IDC_RADIO1))->SetCheck(TRUE);
		}
		else if (atoi(str) == 1)
		{
			((CButton *)GetDlgItem(IDC_RADIO2))->SetCheck(TRUE);
		}
	}
	if (nRet == 0)
	{
		AfxMessageBox("��ȡ�ɹ�");
	}
	else
	{
		AfxMessageBox("��ȡʧ��");
	}
}


//void CAlgorithmDlg::OnBnClickedBtnDistread()
//{
//	// TODO:  �ڴ���ӿؼ�֪ͨ����������
//	double dmin, dmax;
//	int nRet = ZBX_GetRecoDist(m_cam, &dmin, &dmax);
//	if (nRet == 0)
//	{
//		AfxMessageBox("��ȡ�ɹ�");
//		CString str;
//		str.Format("%0.1f", dmin);
//		GetDlgItem(IDC_COMBO1)->SetWindowTextA(str);
//		str.Format("%0.1f", dmax);
//		GetDlgItem(IDC_COMBO2)->SetWindowTextA(str);
//	}
//	else
//	{
//		AfxMessageBox("��ȡʧ��");
//	}
//}


//void CAlgorithmDlg::OnBnClickedBtnDistset()
//{
//	// TODO:  �ڴ���ӿؼ�֪ͨ����������
//	CString str;
//	GetDlgItem(IDC_COMBO2)->GetWindowTextA(str);
//	double dMax = atof(str);
//	GetDlgItem(IDC_COMBO1)->GetWindowTextA(str);
//	double dMinx = _ttof(str);
//	if (dMinx>dMax)
//	{
//		AfxMessageBox("��ѡ����ȷʶ�����");
//		return;
//	}
//	int nCurSel = m_ComMin.GetCurSel();
//	if (nCurSel==0)
//	{
//		dMinx = 0.3;
//	}
//	int nRet = ZBX_SetRecoDist(m_cam, dMinx, dMax);
//	if (nRet==0)
//	{
//		AfxMessageBox("���óɹ�");
//	}
//	else
//	{
//		AfxMessageBox("����ʧ��");
//
//	}
//}


void CAlgorithmDlg::OnBnClickedCheckSafety()
{
	// TODO:  �ڴ���ӿؼ�֪ͨ����������
	int nUIData = ((CButton*)GetDlgItem(IDC_CHECK_SAFETY))->GetCheck();
	if (nUIData)
	{

		GetDlgItem(IDC_CHECK_STOP)->EnableWindow(TRUE);
	}
	else{
		((CButton*)GetDlgItem(IDC_CHECK_STOP))->SetCheck(FALSE);
		GetDlgItem(IDC_CHECK_STOP)->EnableWindow(FALSE);
	}
}


void CAlgorithmDlg::OnBnClickedBtnRead()
{
	// TODO:  �ڴ���ӿؼ�֪ͨ����������
	m_bRead = true;
	m_listTask.AddHead(1);
}


void CAlgorithmDlg::OnBnClickedBtnIdcard()
{
	// TODO:  �ڴ���ӿؼ�֪ͨ����������
	int nRet = -1;
	int nUIData = -1;
	//���� 
	bool bUIData = ((CButton*)GetDlgItem(IDC_CHECK_ACTIVE))->GetCheck();	
	{
		if (bUIData)
		{
			nUIData = 1;
		}
		else
		{
			nUIData = 0;
		}
		if (m_stData.bActive != nUIData)
		{
			nRet = ZBX_SetAliveDetectEnable(m_cam, nUIData);
			if (nRet != 0)
			{
				AfxMessageBox("���û���ʧ��");
				return;
			}
			m_stData.bActive = nUIData;
		}
	}
	{
		bUIData = ((CButton*)GetDlgItem(IDC_CHECK_SAFETY))->GetCheck();
		if (bUIData)
		{
			nUIData = 1;
		}
		else
		{
			nUIData = 0;
		}
		if (m_stData.SaftHad != nUIData)
		{
			nRet = ZBX_SetSafetyHat(m_cam, nUIData);
			if (nRet != 0)
			{
				AfxMessageBox("���ð�ȫñ���ʧ��");
				return;
			}
			m_stData.SaftHad = nUIData;
		}
	}

	{
		bUIData = ((CButton*)GetDlgItem(IDC_CHECK_STOP))->GetCheck();
		if (bUIData)
		{
			nUIData = 1;
		}
		else
		{
			nUIData = 0;
		}
		if (m_stData.saftpass != nUIData)
		{
			
			nRet = ZBX_SetSafetyHatStatus(m_cam, nUIData);
			if (nRet != 0)
			{
				AfxMessageBox("���ð�ȫñͨ��ʧ��");
				return;
			}
			m_stData.saftpass = nUIData;
		}
	}
	{
		bUIData = ((CButton*)GetDlgItem(IDC_CHECK_PICWAITER))->GetCheck();
		if (bUIData)
		{
			nUIData = 1;
		}
		else
		{
			nUIData = 0;
		}
		if (m_stData.WaterMar != nUIData)
		{
			nRet = ZBX_SetWaterMark(m_cam, nUIData);
			if (nRet != 0)
			{
				AfxMessageBox("����ˮӡʧ��");
				return;
			}
			m_stData.WaterMar = nUIData;
		}
	}
	{
		bUIData = ((CButton*)GetDlgItem(IDC_CHECK_FACESHOW))->GetCheck();
		if (bUIData)
		{
			nUIData = 1;
		}
		else
		{
			nUIData = 0;
		}
		if (m_stData.FaceShow != nUIData)
		{
			nRet = ZBX_SetFaceShow(m_cam, nUIData);
			if (nRet != 0)
			{
				AfxMessageBox("����������ʧ��");
				return;
			}
			m_stData.FaceShow = nUIData;
		}
	}
	{
		bUIData = ((CButton*)GetDlgItem(IDC_CHECK_MODE))->GetCheck();
		if (bUIData)
		{
			nUIData = 1;
		}
		else
		{
			nUIData = 0;
		}
		if (nUIData != m_stData.OutputCtl)
		{
			nRet = ZBX_SetOutputCtl(m_cam, nUIData);
			if (nRet != 0)
			{
				AfxMessageBox("���ô���ģʽʧ��");
				return;
			}
			m_stData.OutputCtl=nUIData;
		}
		
	}
	//ʶ�����
	{
		CString str;
		GetDlgItem(IDC_COMBO2)->GetWindowTextA(str);
		double dMax = atof(str);
		GetDlgItem(IDC_COMBO1)->GetWindowTextA(str);
		double dMinx = _ttof(str);
		if (dMinx > dMax)
		{
			AfxMessageBox("��ѡ����ȷʶ�����");
			return;
		}
		int nCurSel = m_ComMin.GetCurSel();
		if (nCurSel == 0)
		{
			dMinx = 0.3;
		}
		if (dMinx!=m_stData.RecoDistmin&&dMax!=m_stData.RecoDistmax)
		{
			nRet = ZBX_SetRecoDist(m_cam, dMinx, dMax);
			if (nRet!= 0)
			{
				AfxMessageBox("����ʶ�����ʧ��");
				return;
			}
		}
	}
	//���ʶ��Ƕ�
	{
		CString strAngle;
		GetDlgItem(IDC_EDIT_A)->GetWindowTextA(strAngle);
		int nAngle = atoi(strAngle);

		if (0 > nAngle || nAngle > 100)
		{
			AfxMessageBox("������Ϊ0~90");
			return;
		}
		if (nAngle != m_stData.angle)
		{
			nRet = ZBX_SetValidAngleEnable(m_cam, nAngle,1);
			if (nRet)
			{
				AfxMessageBox("�������ʶ��Ƕ�ʧ��");
				return;
			}
			m_stData.angle = nAngle;
		}		
	}
	//ģ�����ƶ�
	{
		CString strScore;
		GetDlgItem(IDC_EDIT2)->GetWindowTextA(strScore);
		int nScore = atoi(strScore);

		if (0 > nScore || nScore > 100)
		{
			AfxMessageBox("��������ȷ�����ƶ� ӦΪ0~100");
			return;
		}
		if (nScore != m_stData.ModelS)
		{
			nRet = ZBX_SetMatchScore(m_cam, nScore);
			if (nRet)
			{
				AfxMessageBox("�������ƶ�ʧ��");
				return;
			}
			m_stData.ModelS = nScore;
		}
	}
	//���֤���ƶ�	
	{
		CString str;
		GetDlgItem(IDC_EDIT_ID)->GetWindowTextA(str);
		if (atoi(str)!=m_stData.IdcardS)
		{
			nRet = ZBX_SetIDCardScore(m_cam, atoi(str));
			if (nRet != 0)
			{
				AfxMessageBox("�������֤���ƶ�ʧ��");
				return;
			}
		}
		m_stData.IdcardS = atoi(str);
	}
	//ȥ�ظ�
	{
		CString str;
		GetDlgItem(IDC_EDIT1)->GetWindowTextA(str);
		int nLevel = atoi(str);
		if (nLevel > 100 || nLevel < 1)
		{
			AfxMessageBox("��������1~100֮��");
			return;
		}
		if (nLevel!=m_stData.Rep)
		{
			if (0 == ZBX_SetClusterTimesInterval(m_cam, nLevel)){
			}
			else
			{
				AfxMessageBox("����ȥ�ظ�ʧ��");
				return;
			}
			m_stData.Rep = nLevel;
		}		
	}
	AfxMessageBox("�������");
}


void CAlgorithmDlg::OnHScroll(UINT nSBCode, UINT nPos, CScrollBar* pScrollBar)
{
	// TODO:  �ڴ������Ϣ�����������/�����Ĭ��ֵ

	m_nVol = m_Slider.GetPos();//ȡ�õ�ǰλ��ֵ  
	SetDlgItemInt(IDC_EDIT_A, m_nVol);
	__super::OnHScroll(nSBCode, nPos, pScrollBar);
}


void CAlgorithmDlg::OnTimer(UINT_PTR nIDEvent)
{
	// TODO:  �ڴ������Ϣ�����������/�����Ĭ��ֵ
	KillTimer(nIDEvent);
	if (nIDEvent==1)
	{
		m_listTask.AddHead(1);
	}
	__super::OnTimer(nIDEvent);
}

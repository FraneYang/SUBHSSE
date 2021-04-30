// SeniorDlg.cpp : implementation file
//

#include "stdafx.h"
#include "VzFaceSDKDemo.h"
#include "SeniorDlg.h"
#include "afxdialogex.h"
#include <thread>

// CSeniorDlg dialog
//系統升級回調
CSeniorDlg *gthis = NULL;
IMPLEMENT_DYNAMIC(CSeniorDlg, CDialogEx)

CSeniorDlg::CSeniorDlg(VzLPRClientHandle cam, CWnd* pParent /*=NULL*/)
	: CDialogEx(CSeniorDlg::IDD, pParent)
{
	m_cam = cam;
}

CSeniorDlg::~CSeniorDlg()
{
}

void CSeniorDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialogEx::DoDataExchange(pDX);
	//DDX_Control(pDX, IDC_EDIT1, m_EditTSerialInfo);
	//DDX_Control(pDX, IDC_EDIT_INFO, m_TSerialInfo);
}


BEGIN_MESSAGE_MAP(CSeniorDlg, CDialogEx)
	ON_BN_CLICKED(IDC_BTN_COMSET, &CSeniorDlg::OnBnClickedBtnComset)
	ON_MESSAGE(WM_USER_MSG_SENIOR, &CSeniorDlg::OnUserMsg)
	ON_MESSAGE(WM_USRAL_MSG, &CSeniorDlg::OnUpdateSerial)
	ON_BN_CLICKED(IDC_BTN_SEND, &CSeniorDlg::OnBnClickedBtnSend)
	ON_WM_CLOSE()
	ON_BN_CLICKED(IDC_BTN_CLEAR, &CSeniorDlg::OnBnClickedBtnClear)
END_MESSAGE_MAP()


// CSeniorDlg message handlers
enum MSG_TYPE
{
	MSG_INIT =1,
	MSG_SETCOM,
};

BOOL CSeniorDlg::OnInitDialog()
{
	CDialogEx::OnInitDialog();

	// TODO:  Add extra initialization here
	GetDlgItem(IDC_COMNUM)->SetWindowTextA("0");
	PostMessage(WM_USER_MSG_SENIOR, (WPARAM)MSG_INIT, NULL);

	((CComboBox*)GetDlgItem(IDC_COM_SEND))->SetCurSel(0);
	((CComboBox*)GetDlgItem(IDC_COM_SENDDATA))->SetCurSel(0);
	((CComboBox*)GetDlgItem(IDC_COM_REV))->SetCurSel(0);
	gthis = this;
	return TRUE;  // return TRUE unless you set the focus to a control
	// EXCEPTION: OCX Property Pages should return FALSE
}

int CSeniorDlg::GetComIni(int nID){
	CString str;
	GetDlgItem(nID)->GetWindowText(str);
	if (str == "十进制")
	{
		return 0;
	}
	else
	{
		return 1;
	}
}
void CSeniorDlg::OnBnClickedBtnComset()
{
	// TODO: Add your control notification handler code here
	PostMessage(WM_USER_MSG_SENIOR, (LPARAM)MSG_SETCOM, NULL);
}

LRESULT CSeniorDlg::OnUpdateSerial(WPARAM w, LPARAM l){
	char *data = (char*)w;
	int size = (int)l;
	CString  strData2;
	std::string str1((char*)data, size);
	CString strData;
	for (int n = 0; n < size; n++)
	{
		CString str;
		str.Format(" %02x", data[n]);
		strData += str;
	}
	bool bChecked = GetComIni(IDC_COM_REV);
	if (bChecked)
	{
		GetDlgItem(IDC_EDIT_READCOM2)->SetWindowTextA(strData);
	}
	else
	{

		GetDlgItem(IDC_EDIT_READCOM2)->SetWindowTextA(str1.c_str());
	}
	//free(data);
	delete[] data;
	return (0);
}
LRESULT CSeniorDlg::OnUserMsg(WPARAM w, LPARAM l){
	int nMsg = (int)w;
	switch (w)
	{
	case MSG_INIT:
		OnMsgInit();
		break;
	case MSG_SETCOM:
		OnSetCom();
	default:
		break;
	}
	return 0l;
}
void CSeniorDlg::OnUpdateUI(const unsigned char* data, int size){
	if (!this->GetSafeHwnd())
	{
		return;
	}
	CString  strData2;
	std::string str1((char*)data, size);
	CString strData;
	for (int n = 0; n < size; n++)
	{
		CString str;
		str.Format(" %02x", data[n]);
		strData += str;
	}
	bool bChecked = GetComIni(IDC_COM_REV);
	if (bChecked)
	{
		GetDlgItem(IDC_EDIT_READCOM2)->SetWindowTextA(strData); 
	}
	else
	{

		GetDlgItem(IDC_EDIT_READCOM2)->SetWindowTextA(str1.c_str());
	}
}
void CSeniorDlg::OnMsgInit(){
	
	ZBX_RegReadTSerialCb([](ZBX_Cam* cam, int index,
		const unsigned char* data, int size,
		size_int usrParam){
		if (gthis)
		{
			gthis->OnUpdateUI(data, size);
		}
	}, (size_int)this);
	CString str, strdata;
	//GetDlgItem(IDC_COMNUM)->GetWindowTextA(str);
	char Type = 0;
	int ret = ZBX_GetRS485ProtocalNo(m_cam, &Type);
	str.Format("%d", Type);
	GetDlgItem(IDC_COMTYPE)->SetWindowTextA(str);
	int out_frque, out_parity, out_databit, out_stopbit;
	if (0 == ZBX_GetTSerial(
		m_cam, 0, &out_frque,
		&out_parity, &out_databit, &out_stopbit)){
		str.Format("%d", out_frque);
		GetDlgItem(IDC_COMBOX)->SetWindowTextA(str);
		str.Format("%d", out_databit);
		GetDlgItem(IDC_COMDATA)->SetWindowText(str);
		str.Format("%d", out_parity);
		GetDlgItem(IDC_COMCHECK)->SetWindowText(str);
		str.Format("%d", out_stopbit);
		GetDlgItem(IDC_COMSTOP)->SetWindowText(str);
	}
}

void CSeniorDlg::OnSetCom(){
	CString str, port;
	GetDlgItem(IDC_COMBOX)->GetWindowTextA(str);
	GetDlgItem(IDC_COMNUM)->GetWindowTextA(port);
	if (str.IsEmpty() || (port.IsEmpty()))
	{
		AfxMessageBox("请先输入端口号和选择波特率");
		return;
	}
	CString str3, str1, str2;
	GetDlgItem(IDC_COMDATA)->GetWindowText(str2);
	GetDlgItem(IDC_COMCHECK)->GetWindowText(str1);
	GetDlgItem(IDC_COMSTOP)->GetWindowText(str3);
	int nRetTSetial = -1;
	int nRetCom = -1;

	nRetTSetial = ZBX_OpenTSerial(m_cam, atoi(port), atoi(str), atoi(str1), atoi(str2), atoi(str3));
	char Tmp;
	CString strPro;
	GetDlgItem(IDC_COMTYPE)->GetWindowTextA(strPro);
	Tmp = atoi(strPro);
	nRetCom = ZBX_SetRS485ProtocalNo(m_cam, Tmp);
	if (!nRetTSetial&&!nRetCom)
	{
		AfxMessageBox("设置成功");
	}else
		AfxMessageBox("设置失败");
}

void CSeniorDlg::StringtoHex(BYTE *GB, int glen, BYTE* SB, int* slen)
{
	int i;    //遍历输入的字符串
	int a = 0;
	char temp;   //接收字符，用来判断是否为空格，若是则跳过
	char temp1, temp2;   //接收一个字节的两个字符  例如EB，则temp1='E',temp2 = 'B'
	*slen = 0;  //输出的16进制字符串长度
	for (i = 0; i < glen; i++)
	{
		temp = GB[i];
		if (temp == ' ')
			continue;

		if (a == 0)
			temp1 = GB[i];
		if (a == 1)
			temp2 = GB[i];
		a++;

		if (a == 2)
		{
			a = 0;
			temp1 = temp1 - '0';
			if (temp1 > 10)
				temp1 = temp1 - 7;
			temp2 = temp2 - '0';
			if (temp2 > 10)
				temp2 = temp2 - 7;

			SB[*slen] = temp1 * 16 + temp2;
			(*slen)++;
		}
	}

}

void CSeniorDlg::OnBnClickedBtnSend()
{
	// TODO: Add your control notification handler code here
	CString str, strdata;
	GetDlgItem(IDC_COMNUM)->GetWindowTextA(str);
	GetDlgItem(IDC_EDIT_READCOM)->GetWindowTextA(strdata);
	bool bChecked = GetComIni(IDC_COM_SEND);
	if (bChecked)
	{
		CByteArray HexDataBuf;
		int i = 0;
		BYTE SendBuf[128] = { 0 };
		BYTE GetData[256] = { 0 };
		int SendLen = 0;
		int GetLen = 0;
		UpdateData(TRUE);//获取编辑框内容
		GetLen = strdata.GetLength();
		for (i = 0; i < GetLen; i++)
		{
			GetData[i] = (BYTE)strdata.GetBuffer()[i];
		}
		StringtoHex(GetData, GetLen, SendBuf, &SendLen);//将字符串转化为字节数据

		HexDataBuf.SetSize(SendLen);            //设置数组大小为帧长度 
		for (i = 0; i < SendLen; i++)
		{
			HexDataBuf.SetAt(i, SendBuf[i]);
		}
		if (!ZBX_WriteTSerial(m_cam, atoi(str),
			(const unsigned char*)SendBuf, SendLen)){
			AfxMessageBox("执行成功");
		}
		else{
			AfxMessageBox("执行失败");
		};
		UpdateData(false); //更新编辑框内容
		return;
	}
	int nLeth = strdata.GetAllocLength();
	if (!ZBX_WriteTSerial(m_cam, atoi(str),
		(const unsigned char*)(LPCTSTR)strdata.GetBuffer(strdata.GetLength()), strdata.GetLength() + 1)){
		AfxMessageBox("执行成功");
	}
	else{
		AfxMessageBox("执行失败");
	};
	str.ReleaseBuffer();
	((CListBox*)GetDlgItem(IDC_LIST1))->InsertString(0, str);
}


void CSeniorDlg::OnClose()
{
	// TODO: Add your message handler code here and/or call default
	ZBX_RegReadTSerialCb(NULL, NULL);
	std::this_thread::sleep_for(std::chrono::milliseconds(500));
	CDialogEx::OnClose();
}


BOOL CSeniorDlg::PreTranslateMessage(MSG* pMsg)
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
	return CDialogEx::PreTranslateMessage(pMsg);
}


void CSeniorDlg::OnBnClickedBtnClear()
{
	// TODO:  在此添加控件通知处理程序代码
	GetDlgItem(IDC_EDIT_READCOM2)->SetWindowTextA("");

}

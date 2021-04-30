// VzFaceSDKDemoDlg.h : 头文件
//

#pragma once
#include "afxcmn.h"
#include <atlimage.h>
#include "InteractViewer.h"
#include "VzDeviceLPR.h"
#include <string>
#include <vector>

#include "afxwin.h"

#include "MyListCtrl.h"
using namespace std;



typedef struct tagFACE_RESULT_INFO
{
	char szFaceImagePath[MAX_PATH]; 
	char szFaceModelPath[MAX_PATH];
	FaceRecoInfo face_reco_info;
	IDCardRecord idCardRecord;
	VzLPRClientHandle cam;
}FACE_RESULT_INFO;

enum
{
	TYPE_NORMAL = 1,
	TYPE_OFFLINE,
};
typedef struct tagLIST_INFO
{
	CString faceName;
	CString faceId;
	CString csTime;
	CString DevIp;
	bool bSaftHat;
	int nModel;
	int nRole;    
	bool bDataSatus;  //1在线数据  0 离线数据
	int nMatchScore;
	CString faceIDCard;  //如果是身份证  就表示身份号

}TAGLIST_INFO;
// CVzFaceSDKDemoDlg 对话框
class CVzFaceSDKDemoDlg : public CDialog
{
// 构造
	enum
	{
		MSG_DEV_FOUND = 1,
		MSG_FACE_RESULT,
		MSG_IDCARD_RESULT,
		MSG_FACE_QUERY,
		MSG_FACE_OFFLINE,
		MSG_SYNC_JUR,
	};

	enum GetFileType
	{
		GET_FILE_TYPE_BIG=1,
		GET_FILE_TYPE_NORMAL,
		GET_FILE_TYPE_MODEL,
	};
	
public:
	CVzFaceSDKDemoDlg(CWnd* pParent = NULL);	// 标准构造函数

// 对话框数据
	enum { IDD = IDD_VZFACESDKDEMO_DIALOG };

	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV 支持


	void ShowVersion(VzLPRClientHandle hLPRClient);
// 实现
protected:
	HICON m_hIcon;

	// 生成的消息映射函数
	virtual BOOL OnInitDialog();
	afx_msg void OnSysCommand(UINT nID, LPARAM lParam);
	afx_msg void OnPaint();
	afx_msg HCURSOR OnQueryDragIcon();
	afx_msg void OnBnClickedBtnStart();
	afx_msg void OnClose();
	afx_msg LRESULT OnUserMsg(WPARAM w,LPARAM l);
	void OnSyncUserRightCfgs(LPARAM l);
	afx_msg LRESULT OnChangeCameraStatus(WPARAM w, LPARAM l);
	afx_msg void OnNMClickListSearchDevice(NMHDR *pNMHDR, LRESULT *pResult);
	afx_msg void OnBnClickedBtnOpen();
	void OnShowVideoButton(int nType, bool bShow);
	afx_msg void OnBnClickedBtnOutput();
	afx_msg void OnBnClickedBtnClose();
	afx_msg void OnBnClickedBtnStopPlay();
	afx_msg void OnNMClickListOpenedDevice(NMHDR *pNMHDR, LRESULT *pResult);
	DECLARE_MESSAGE_MAP()
	int m_nNopassSelect = 0;
	void ShowIp(int nIdex);
public:
	void OnDevFound(const char *pStrDevName, const char *pStrIPAddr, WORD usPort1, WORD usPort2, unsigned int SL, unsigned int SH, char* netmask, char* gateway);
	void OnDevStatus(const char *pStrIPAddr, WORD usPort1,int event);
	void DeleteDeviceInfo();
	int GetSeleIndex( );
	VzLPRClientHandle GetItemHandle( );

	void OnDeviceFound(LPARAM l);
	int ShowImg(const char* img_path, int wnd_id);
	void ShowDlgCtrl(int wnd_id, bool show);
	void OnViewerMouse0(IV_EVENT eEvent, int x, int y, int nId);
	void CloseVideo1();
	void CloseVideo2();

	void iSetCommonInfo(const char *pStrInfo);
	void addMsg(const string& sMsg);

	void OnReciveAlarmMsg(VzLPRClientHandle handle, int type);

	void SetCameraStatus(VzLPRClientHandle handle, int event);
	void UpdataInfo(VzLPRClientHandle handle, const FaceRecoInfo* face_reco_info, int nType);

	void UpdataIDCardRecord(VzLPRClientHandle handle, const IDCardRecord* alarmRecord);
	void ShowFaceResult(LPARAM l, int Type);
	CString GetDeviceIP(VzLPRClientHandle handle);
	void ShoWIdCardResult(LPARAM l);
private:
	CListCtrl m_ListDevice;
	CListCtrl m_lstOpenDevice;
	InteractViewer m_video_wnd1;
	InteractViewer m_video_wnd2;

	string m_strCommNotify;
	vector <DeviceLPR *> m_vDev;

	CListCtrl m_lstPassFace;
	CListCtrl m_lstNoPassFace;
	//CMyListCtrl m_lstPassFace;
	//CMyListCtrl m_lstNoPassFace;
	VzLPRClientHandle* m_CurSelectcam;
public:
	afx_msg void OnBnClickedBtnManagerPeople();
	bool CheckCamera();
	afx_msg void OnBnClickedBtnBasesetting();
	afx_msg void OnItemchangedListPassFace(NMHDR *pNMHDR, LRESULT *pResult);
	afx_msg void OnBnClickedBtnBasesetting2();
	afx_msg void OnBnClickedBtnManagerPeople2();
	afx_msg void OnBnClickedBtnBasesetting4();
	afx_msg void OnBnClickedBtnBasesetting3();
	afx_msg void OnItemchangedListNoPassFace(NMHDR *pNMHDR, LRESULT *pResult);
	virtual BOOL PreTranslateMessage(MSG* pMsg);
	afx_msg void OnItemchangedListOpenedDevice(NMHDR *pNMHDR, LRESULT *pResult);
	afx_msg void OnRclickListNoPassFace(NMHDR *pNMHDR, LRESULT *pResult);
	afx_msg void OnAddtoface();
	afx_msg void OnOpenpath();
	afx_msg void OnRclickListPassFace(NMHDR *pNMHDR, LRESULT *pResult);
	afx_msg void OnBnClickedBtnVideo();
	void OnCreateDir(CString data="", ZBX_Cam* handle=NULL);
	void OnMkDir(CString path);
	CString m_SaveDatePath = "";

	
private:
	struct strct_filePath
	{
		CString filepath_ip;
		//日期
		CString filepath_Data;
		//IP
		CString deviceIp;
		VzLPRClientHandle m_CurCameraHandle;
	};
	vector<strct_filePath> m_vFilePath;
	std::map<int, TAGLIST_INFO> m_MaplistInfo;
	int m_CurMatchIndex=0;
	CString GetFilePath(const VzLPRClientHandle handle, const GetFileType type, const bool result);
public:
	afx_msg void OnBnClickedBtnCut();
	void OnSaveCut(int nId);
	afx_msg void OnBnClickedBtnVideo2();
	void OnStartSaveRealData(int nId);
	afx_msg void OnBnClickedBtnCut2();
	afx_msg LRESULT OnBtnListClicked(WPARAM w, LPARAM p);
	afx_msg void OnClickListPassFace(NMHDR *pNMHDR, LRESULT *pResult);
	afx_msg void OnClickListNoPassFace(NMHDR *pNMHDR, LRESULT *pResult);

	CString m_strPicfileSavePath="";
	afx_msg void OnBnClickedButton13();
	afx_msg void OnBnClickedBtnPicset();
//	afx_msg void OnLvnItemchangingListNoPassFace(NMHDR *pNMHDR, LRESULT *pResult);
//	afx_msg void OnLvnItemchangedListNoPassFace(NMHDR *pNMHDR, LRESULT *pResult);
	afx_msg void OnDblclkVideo1();
	afx_msg void OnDblclkVideo2();
	afx_msg void OnBnClickedBtnClear();
	afx_msg void OnBnClickedBtnUnclear();
};

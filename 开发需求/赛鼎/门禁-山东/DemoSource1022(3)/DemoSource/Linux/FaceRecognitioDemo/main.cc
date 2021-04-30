

#include <fstream>
#include <iostream>
#include <vector>
#include "zbx_sdk.h"

#ifdef WIN32
#else
#include <unistd.h>
#endif



void SetCB(ZBX_Cam* cam) {
	ZBX_RegFaceRecoCb(
		cam,
		[](ZBX_Cam* cam, const FaceRecoInfo* face_reco_info, void* usrParam) {
		if (face_reco_info->modelFaceImgLen > 0 &&
			face_reco_info->modelFaceImg) {
			std::ofstream ofs("test.jpg", std::ios::binary);
			ofs.write((char*)face_reco_info->modelFaceImg,
				face_reco_info->modelFaceImgLen);
		}
		std::cout << "3" << std::endl;
	},
		NULL);
}

int main() {
	
	ZBX_Init();

	ZBX_SetNotifyConnected(1);
	int err_code = 0;
	//ZBX_Cam* handle;
	ZBX_Cam* handle = ZBX_ConnectEx("192.168.1.180", 8099, "", "", &err_code, 0,1);
	
	std::cout << "Connect = "<<ZBX_Connected(handle) << std::endl;
#if 1
	ZBX_HTTPCONFIG httpConfig;
	memset(&httpConfig, 0, sizeof(ZBX_HTTPCONFIG));
	strcpy(httpConfig.centerserver.hostname, "192.168.1.220")  ;
	httpConfig.centerserver.port = 8888;
	httpConfig.centerserver.http_timeout = 60;
	httpConfig.cs_alarm_plate.enable = 1;
	
	strcpy(httpConfig.cs_alarm_plate.uri, "/url");
	int Tmp = ZBX_SetHttpConfig((ZBX_Cam*)handle, httpConfig);


	ZBX_HTTPCONFIG httpConfig2;
	memset(&httpConfig2, 0, sizeof(ZBX_HTTPCONFIG));
	Tmp = ZBX_GetHttpConfig((ZBX_Cam*)handle, &httpConfig2);
 	std::cout << " httpConfig2.centerserver.hostname " << httpConfig2.centerserver.hostname << std::endl;
	std::cout << " httpConfig2.centerserver.port " << httpConfig2.centerserver.port << std::endl;

	ZBX_RegFaceRecoCb(
		handle,
		[](ZBX_Cam* cam, const FaceRecoInfo* face_reco_info, void* usrParam) {
		if (face_reco_info->modelFaceImgLen > 0 &&
		face_reco_info->modelFaceImg) {

		std::ofstream ofs("test.jpg", std::ios::binary);
		ofs.write((char*)face_reco_info->modelFaceImg,
		face_reco_info->modelFaceImgLen);
		}
		std::cout << " 识别人员：" << face_reco_info->matchPersonName<< std::endl;
		},
		NULL);
	ZBX_RegFaceOffLineRecoCb(
		handle,
		[](ZBX_Cam* cam, const FaceRecoInfo* face_reco_info, void* usrParam) {
		if (face_reco_info->modelFaceImgLen > 0 &&
			face_reco_info->modelFaceImg) {

			std::ofstream ofs("test.jpg", std::ios::binary);
			ofs.write((char*)face_reco_info->modelFaceImg,
				face_reco_info->modelFaceImgLen);
		}
		std::cout << "3" << std::endl;
	},
		NULL);
	
	std::ifstream ifs("3.jpg", std::ios_base::binary);
	if (ifs.is_open()) {
		ifs.seekg(0, std::ios_base::end);
		std::vector<uint8_t> buf(ifs.tellg());
		ifs.seekg(0);

		ifs.read((char*)buf.data(), buf.size());

		FaceFlags face;
		strncpy(face.faceID, "0001", sizeof(face.faceID));
		strncpy(face.faceName, "pony", sizeof(face.faceName));
		FaceImage img;
		img.img = buf.data();
		img.img_len = buf.size();
		int ret = ZBX_AddJpgFaces(handle, &face, &img, 1, 0);
		std::cout << ret << std::endl;
	}
	ifs.close();
	int nEnable = -1;
	
	std::string steMac = "c54e283a-555f17fa";	
	ZBX_SetIpBymac(steMac.c_str(), "192.168.1.124", "255.255.255.0", "192.168.1.1");
	unsigned int nTime = 0;
	ZBX_GetClusterTimesInterval(handle, &nTime);
	std::cout << "ZBX_GetClusterTimesInterval time = " << nTime << std::endl;
	int iRet = 0;
	iRet = ZBX_SetClusterTimesInterval(handle, 2);
	std::cout << "ZBX_SetClusterTimesInterval ret = " << iRet << std::endl;

	char nChar = 0;
	char nCharA[128] = { 0 };
	//std::cout << "------------------------------------------" << std::endl;
	std::cout << "------------------------------------------" << std::endl;
	ZBX_GetRS485ProtocalNo(handle, &nChar);
	std::cout << "ZBX_GetRS485ProtocalNo nChar = " << nChar << std::endl;
	iRet = ZBX_SetRS485ProtocalNo(handle, 1);
	std::cout << "ZBX_SetRS485ProtocalNo ret = " << iRet << std::endl;


	ZBX_GetLedMode(handle, nCharA);
	std::cout << "ZBX_GetLedMode ret = " << nChar << std::endl;
	ZBX_GetLedLevel(handle, nCharA);
	std::cout << "ZBX_GetLedLevel nChar = " << nChar << std::endl;

	ZBX_RegConnectEventCb(		[](ZBX_Cam* cam, const char* ip, unsigned short port, int event,
		int usrParam) {
		if (!event) {
			std::cout << "disconnect ip: " << ip << " port: " << port << ' ' << event << std::endl;
			return;
		}
		std::cout << "connect ip: " << ip << " port: " << port << ' ' << event << std::endl;
		SetCB(cam);
	},NULL);

	
	int nScore = 0;
	iRet = ZBX_GetMatchScore(handle, &nScore);
	ZBX_SetMatchScore(handle, 90);

	char Title[256] = { 0 };
	std::cout << "Screen title" << Title << std::endl;
	ZBX_GetScreenOsdTitle(handle, Title);
	ZBX_SetScreenOsdTitle(handle, "人脸识别");
	
	
	ZBX_DiscoverIpscan();
	ZBX_RegDiscoverIpscanCb([](const struct ipscan_t* ipscan,
		int usr_param){
		std::cout <<" Find Device: ip= "<< ipscan->ip << std::endl;
	}, NULL);
	 ZBX_RegFaceRecoCb(handle,
	                 [](ZBX_Cam* cam, const FaceRecoInfo* faceRecoInfo,
	                    void* usrParam) { std::cout << "3" << std::endl; },
	                 NULL);

	//串口相关
	 int a = 0, b = 0, c = 0, d = 0;
	 ZBX_GetTSerial(handle, 0, &a, &b, &c, &d);
	unsigned char m_char[] = { 0x00, 0x00, 0x12, 0x13, 0x00, 0x00, 0x67, 0x68, 0x00, 0x00,  0x00, 0x00 };
	iRet = ZBX_WriteTSerial(handle, 0, m_char, 12);
	iRet = ZBX_OpenTSerial(handle, 0, 115200, 0, 8, 1);
	ZBX_RegReadTSerialCb([](ZBX_Cam* cam, int index,
		const unsigned char* data, int size,
		int usrParam){
		std::string strData = (char*)data;
		std::cout << "index= " << index << "strData= " << strData.c_str() << std::endl;
	}, NULL);

	//设置

	iRet = ZBX_SetWiegandType(handle, WG34);
	

	/*算法推送设置与获取*/
	iRet = ZBX_GetPushMode(handle, &nChar);
	std::cout << "上传推送为" << nChar << std::endl;
	iRet = ZBX_SetPushMode(handle, 0);


	int nIdex = 0;
	ZBX_RegFaceQueryCb(handle, [](ZBX_Cam* cam, const QueryFaceInfo* faceQueryInfo, void* usrParam){
		int n = 0;
		std::cout <<"查询人员 Name = "<< faceQueryInfo->personName << std::endl;
		std::cout << "查询人员 ID = " << faceQueryInfo->personID << std::endl;
		//if (faceQueryInfo->imgBuff[0] > 0 &&
		//	faceQueryInfo->imgSize[0]) {
		//	int n = faceQueryInfo->wgCardNO;
		//	std::ofstream ofs("test.jpg", std::ios::binary);
		//	ofs.write((char*)faceQueryInfo->imgBuff[0],
		//		faceQueryInfo->imgSize[0]);
		//}
	}, NULL);

	
	//人员管理
	ZBX_DeleteFaceDataByPersonID(handle, "2019-05-13 070739814");
	//ZBX_DeleteFaceDataAll(handle);

	//人员查询
	int nCout = ZBX_GetFaceIDTotal(handle);
	std::cout << "查询人员总数 nCout: " << nCout << std::endl;
	ZBX_QueryByRole(handle, -1, 1, 15, false, 0);

	QueryCondition condition;
	memset(&condition, 0, sizeof(QueryCondition));
	strcpy(condition.faceName, "Name0"); 
	ZBX_QueryFaceEx(handle, 0, 1, 50, 0, 1, 1, 0, &condition);


	/*设置亮灯之间段  只有在灯控模式为自动时作用*/
	ZBX_LedCtrlTime time;
	time.nLevel[0] = 100;
	strcpy(time.beginTime[0], "03:30:00");
	strcpy(time.EndTime[0], "03:31:00");
	time.nLevel[1] = 100;
	strcpy(time.beginTime[1], "03:32:01");
	strcpy(time.EndTime[1], "24:00:00");
	iRet = ZBX_SetLedCtrlTime(handle, time);
	/*获取亮灯时段*/
	ZBX_LedCtrlTime time2;
	memset(&time2, 0, sizeof(ZBX_LedCtrlTime));
	iRet = ZBX_GetLedCtrlTime(handle, &time2);
	int nRet = 0;
	
	/*系统信息*/
	SystemVersionInfo version;
	iRet = ZBX_GetFaceSystemVersion(handle,&version);
	std::cout << " 系统SN 设备SN：" << version.dev_id <<  " 系统版本： " << version.firmware_ver;
	ZBX_RegIDCardRecordCb(handle, [](ZBX_Cam* cam,
		const IDCardRecord* alarmRecord,
		const void* usrParam){
		if (alarmRecord && usrParam){
			int n = 0;
			std::cout << "查询人员 Name = " << alarmRecord->name << std::endl;
		}
		//if (faceQueryInfo->imgBuff[0] > 0 &&
		//	faceQueryInfo->imgSize[0]) {
		//	int n = faceQueryInfo->wgCardNO;
		//	std::ofstream ofs("test.jpg", std::ios::binary);
		//	ofs.write((char*)faceQueryInfo->imgBuff[0],
		//		faceQueryInfo->imgSize[0]);
		//}
	}, NULL);
	nRet = ZBX_SetDevName(handle, "TEST");
	char tmp[128];
	int *Data =0;
	nRet = ZBX_GetDevName(handle, tmp, Data);
#endif

	
	nRet = -1;
	ZBX_RegWgAlarmRecordCb(handle,
		[](ZBX_Cam* cam,
		const WGAlarmRecord* alarmRecord,
		const void* usrParam){
		std::cout << "wg_id = " << alarmRecord->wg_id << "wg_type= " << alarmRecord->wg_type << std::endl;
	}, NULL);


	nRet = ZBX_SetIDCardScore(handle, 10);
	std::cout << "nRet = " << nRet;
 	nRet = ZBX_GetGatewayControlType(handle, Data);
	std::cout << "nRet = " << nRet << "*Data= " << *Data << std::endl;
	//for (int x = 0; x < 7;x++)
	{
		nRet = ZBX_SetGatewayControlType(handle, 0);
		std::cout << "nRet = " << nRet;
	}
	
	nRet = ZBX_GetIDCardScore(handle, Data);
	std::cout << "nRet = " << nRet << "nTime= " << nTime << std::endl;
	
	nRet = ZBX_GetAutoCleanEnable(handle, Data);
	std::cout << "nRet = " << nRet << "nTime= " << nTime << std::endl;
	nRet = ZBX_SetAutoCleanEnable(handle, 0);
	std::cout << "nRet = " << nRet;

	UserRightsCfg cfg;
	//节假日
	cfg.dt_slots.n_enable = 1;
	cfg.dt_slots.dt_slot[0].s_day = 20190305;
	cfg.dt_slots.dt_slot[0].e_day = 20190307;

	cfg.dt_slots.dt_slot[1].s_day = 20190405;
	cfg.dt_slots.dt_slot[1].e_day = 20190407;

	cfg.dt_slots.dt_slot[2].s_day = 20190605;
	cfg.dt_slots.dt_slot[2].e_day = 20200307;


	cfg.dt_slots.dt_slot[3].s_day = 20190505;
	cfg.dt_slots.dt_slot[3].e_day = 20190505;


	//星期
	cfg.st_slots[0].st_slot[0].s_sec = 3600 * 0;
	cfg.st_slots[0].st_slot[0].e_sec = 3600 * 24;

	cfg.st_slots[1].st_slot[0].s_sec = 3600 * 3;
	cfg.st_slots[1].st_slot[0].e_sec = 3600 * 4;

	cfg.st_slots[1].st_slot[1].s_sec = 3600 * 15+20*60;
	cfg.st_slots[1].st_slot[1].e_sec = 3600 * 23 + 30*60;

	cfg.st_slots[2].st_slot[0].s_sec = 3600 * 7;
	cfg.st_slots[2].st_slot[0].e_sec = 3600 * 9;

	cfg.st_slots[3].st_slot[0].s_sec = 3600 * 0;
	cfg.st_slots[3].st_slot[0].e_sec = 3600 * 24;

	cfg.st_slots[4].st_slot[0].s_sec = 3600 * 0;
	cfg.st_slots[4].st_slot[0].e_sec = 3600 * 0;


	cfg.st_slots[5].st_slot[0].s_sec = (3600 * 3);
	cfg.st_slots[5].st_slot[0].e_sec = 3600 * 4;

	cfg.st_slots[5].st_slot[1].s_sec = (3600 * 15) + 20*60;
	cfg.st_slots[5].st_slot[1].e_sec = 3600 * 23 + 30*60; 

	cfg.st_slots[6].st_slot[0].s_sec = 3600 * 7;
	cfg.st_slots[6].st_slot[0].e_sec = 3600 * 9;


	strcpy(cfg.name, "wode");
	UserRightsCfgs cfgs;
	cfgs.user_rights[1] = cfg;
	nRet = ZBX_SetUserRightsCfg(handle, cfgs);
	ZBX_RegUserRightsCfgCb(handle, [](ZBX_Cam* cam,
		const UserRightsCfgs* alarmRecord,
		const void* usrParam){
		std::cout << alarmRecord->user_rights[0].name << std::endl;
	}, NULL);
	ZBX_GetUserRightsCfg(handle);
  int i = 30000;
  while (i--) sleep(1000);
  
  ZBX_DeInit();
  return 0;
}

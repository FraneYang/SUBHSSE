#ifndef ZBX_SDK_DEF_H_
#define ZBX_SDK_DEF_H_
#include "cross_def.h"

#include "config_gw.h"
#include "face_reco_def.h"
#include "xsdk_def.h"
#include "discover_client.h"
#include "tf_reco_def.h"

#define ZBX_ERR_NONE 0
#define ZBX_ERR_INVALID_PARAM -1
#define ZBX_ERR_TIMEOUT -2
#define ZBX_ERR_SEND_BUF_FULL -3
#define ZBX_ERR_SYS_NOT_MATCH -4
#define ZBX_ERR_UNCONNECTED -5
#define ZBX_ERR_SNAPSHOT_UNAVAILABLE -6
#define ZBX_ERR_JPEG_ENCODE_ERROR -7
#define ZBX_ERR_JPEG_BUF_TOO_SMALL -8
#define ZBX_ERR_CANCEL -9
#define ZBX_ERR_UNABLE_TO_OPEN_FILE -10
#define ZBX_ERR_NOT_IMPLEMENTED -11
#define ZBX_ERR_COUNT_INVALID -12
#define ZBX_ERR_OUT_PUT_OF_ARRAY -13

// 提取人脸特征失败，须保证图像中有且仅有一张人脸
#define ZBX_ERR_GET_FACE_FEATURE -14
// 添加人员失败，人员id重复
#define ZBX_ERR_FACE_ID_REPEAT -15
// 修改人脸特征失败，未找到对应ID
#define ZBX_ERR_FACE_ID_NOT_EXITS -16
// 人脸提取器未初始化，请调用ZBX_InitFaceModel初始化
#define ZBX_ERR_GET_FACE_INIT -17
// 无当前记录
#define ZBX_ERR_GET_FACE_ID -18
// 错误的串口编号，目前只支持ZBX_SERIAL_RS485和ZBX_SERIAL_RS232
#define ZBX_ERR_SERIAL_INDEX -19
// 重启系统失败
#define ZBX_ERR_SYSTEM_REBOOT -20
// 重启应用程序失败
#define ZBX_ERR_APP_REBOOT -21
// 压缩图像失败
#define ZBX_ERR_ENCODE_JPG -22
// 单个人员最大支持5张图像
#define ZBX_ERR_FACES_NUM -23
// 图像解码失败  图像太大，用于提取特征的jpg图像不能超过10M，下发到相机的jpg图像
// 宽高不能超过128x128
#define ZBX_ERR_IMAGE_DECODE -24

#define ZBX_ERR_IMAGE_SIZE -25
// 文件不存在，请检查图片路径是否正确
#define ZBX_ERR_IMAGE_PATH -26
// 目前相机只支持存一张模板图像，pictureFlags必须<=1
#define ZBX_ERR_SAVE_IMG_NUM -27
// 不支持的云台控制，目前只支持5：变倍（放大） 6：变倍（缩小）
// 7：聚焦（拉近） 8：聚焦（拉远）
#define ZBX_ERR_PTZ_CTRL -28
// 不支持的控制模式，1：一次运动 2：启动 3：停止
#define ZBX_ERR_PTZ_CTRL_MODE -29

#define ZBX_ERR_DAEMON_REQUEST -30
// 人员数量已达上限
#define ZBX_ERR_UPPER_LIMIT -31
// 协议版本不匹配，请确认SDK和相机固件版本
#define ZBX_ERR_PROTOCAL_VER -32
// 不支持的操作请求
#define ZBX_ERR_REQUEST_CMD -33
// 请求数据包包含不合法字段
#define ZBX_ERR_PACKET_DATA -34
// 认证失败
#define ZBX_ERR_AUTH_FAILED -35
// 写入数据失败
#define ZBX_ERR_WRITE_DATA -36
// 读取数据失败
#define ZBX_ERR_READ_DATA -37
// 归一化图像失败
#define ZBX_ERR_TWIST_FACE -38
// 提取特征失败
#define ZBX_ERR_EXTRACT_FEATURE -39
// 人脸尺寸太小，人脸轮廓必须大于96*96
#define ZBX_ERR_MIN_FACE -40
// 人像质量太差不满足注册条件
#define ZBX_ERR_QVALUE_TOO_SMALL -41
// 无效的同步操作
#define ZBX_ERR_INVALID_SYNC_MODE -42
// 韦根卡号不支持模糊查询
#define ZBX_ERR_WG_QUERY_MODE -43
// 操作系统繁忙
#define ZBX_ERR_SYSTEM_BUSY -44
// 版本不匹配
#define ZBX_ERR_VERSION_MATCH -45
// 图像中人脸数不为1
#define ZBX_ERR_TOO_MUCH_FACE -46
// 图像中人脸不完整
#define ZBX_ERR_FACE_INCOMPLETE -47
// 人脸俯仰角太大
#define ZBX_ERR_ANGLE_PITCH -48
// 人脸侧偏角太大
#define ZBX_ERR_ANGLE_YAW -49
// 人脸不正
#define ZBX_ERR_ANGLE_ROLL -50
// 张嘴幅度过大
#define ZBX_ERR_MOUTH_OPEN -51
// 光照不均匀
#define ZBX_ERR_YINYANG_FACE -52
// 未知错误
#define ZBX_ERR_UNKNOWN -1000


struct ZBX_Cam;

typedef enum { ZBX_CHAR_ENCODE_GBK = 0, ZBX_CHAR_ENCODE_UTF8 } ZBX_CHAR_ENCODE;

typedef enum { ZBX_CAM_TYPE_TI8127, ZBX_CAM_TYPE_S2 } ZBX_CAM_TYPE;

typedef enum { ZBX_STREAM_FORMAT_JPEG = 1, ZBX_STREAM_FORMAT_H264 = 2 } ZBX_STREAM_FORMAT;



struct ZBX_AudioItem {
	int id;
	char desc[64];
};

/**/
struct ZBX_AudioConfig {
	int type;  //0：自定义语音，1：固定语音1，2：固定语音
	int volume; //音量：1 - 25
};
struct ZBXSdkVersion {
  char sdk_version[64];        // sdk版本
  char protocl_version[64];    // 协议类型
  char sdk_code_version[64];   // sdk源代码版本
  char min_firmware_ver[64];   // 支持的最低固件版本
  char algorithm_version[64];  // sdk使用得算法版本
};
struct ZBX_LedCtrlTime
{
	char beginTime[5][9]; //8:00:00
	char EndTime[5][9];  //24:00:00
	int nLevel[5];
	ZBX_LedCtrlTime(){
		//ZeroMemory(this, 0, sizeof(HA_LedCtrlTime));
		memset(this, 0, sizeof(ZBX_LedCtrlTime));
	}
};

struct ZBX_CENTERSERVER
{
	int enable_ssl;
	char hostname[16];				//服务器地址
	int http_timeout;							//超时时间 1~60s
	int port;								//推送端口号
	int ssl_port;
};
struct ZBX_CENTERSERVER_EX
{
	int enable_ssl;
	char hostname[128];				//服务器地址
	int http_timeout;							//超时时间 1~60s
	int port;								//推送端口号
	int ssl_port;
};
struct ZBX_CS_ALARM_GIOIN
{
	int enable;
	char uri[128];
};
struct ZBX_CS_ALARM_PLATE
{
	int big_img;
	int	enable;									//是否启用推送
	int	plate_rlt_level;
	int	retransmission;
	int	small_img;
	char uri[128];				//uri 地址
};
struct ZBX_CS_DEV_REG{
	int enable;      //0 取消心跳  1：普通心跳  2： comet轮询
	char uri[128];    //注册服务器 
};
struct ZBX_HTTPCONFIG
{
	ZBX_CENTERSERVER centerserver;
	ZBX_CS_ALARM_GIOIN cs_alarm_gioin;
	ZBX_CS_ALARM_PLATE cs_alarm_plate;
	ZBX_CS_DEV_REG cs_dev_reg;
	int offline_status;
	int repush_nums;
	int serv_poll_status;
};

struct ZBX_HTTPCONFIG_EX
{
	ZBX_CENTERSERVER_EX centerserver;
	ZBX_CS_ALARM_GIOIN cs_alarm_gioin;
	ZBX_CS_ALARM_PLATE cs_alarm_plate;
	ZBX_CS_DEV_REG cs_dev_reg;
	int offline_status;
	int repush_nums;
	int serv_poll_status;
};
struct ZBX_LiveStream {
  int w;
  int h;
  ZBX_STREAM_FORMAT format;
  int streamLen;
  int streamBufSize;
  char* streamBuf;
};

struct ZBX_VERSION {
  char protocl_version[64];

  char arm_version[64];
  char arm_buildtime[64];
  char arm_code_version[64];

  char dsp_version[64];
  char dsp_buildtime[64];
  char dsp_code_version[64];

  unsigned short video_width;
  unsigned short video_height;
};

/* 连接事件回调函数 */
// event 1为已连接 2为连接中断
typedef void(SDK_CALL* ZBX_ConnectEventCb_t)(ZBX_Cam* cam, const char* ip,
                                            unsigned short port, int event,
											size_int usrParam);

/* 实时流数据接收回调函数 */
typedef void(SDK_CALL* ZBX_LiveStreamCb_t)(ZBX_Cam* cam, const char* ip,
                                          const ZBX_LiveStream* stream,
										  size_int usrParam);

/* 抓拍及检测数据接收回调函数 */
// dataType 不同，data对应不同的数据结构，具体参考demo代码
typedef void(SDK_CALL* ZBX_DataReadCb_t)(ZBX_Cam* cam, const char* ip,
                                        unsigned short port, int dataType,
                                        const char* data, unsigned int dataLen,
										size_int usrParam);

typedef void(SDK_CALL* ZBX_DecodeImageCb_t)(ZBX_Cam* cam, unsigned char* rgb,
	int width, int height, size_int usrParam);

typedef void(SDK_CALL* ZBX_ReadTSerialCb_t)(ZBX_Cam* cam, int index,
                                           const unsigned char* data, int size,
										   size_int usrParam);

typedef void(SDK_CALL* ZBX_ReadGpioCb_t)(ZBX_Cam* cam, int port, int inout,
                                        int state, int errNum, char* resv);

typedef void(SDK_CALL* ZBX_GpioInputCb_t)(ZBX_Cam* cam, int type,
                                         unsigned int data, void* usrParam);

// IO口状态回调
typedef void(SDK_CALL* ZBX_IOStateCb_t)(ZBX_Cam* cam, int index, int state,
                                       void* usrParam);

//回调函数,flag-是否查询到入场记录，1-成功，0-失败
typedef void(SDK_CALL* ZBX_OfflineQueriedEntryInfoCb_t)(ZBX_Cam* cam,
                                                       const char* plate,
                                                       struct timeval timeIn,
                                                       int flag,
                                                       void* usrParam);

typedef void(SDK_CALL* ZBX_FaceRecoCb_t)(ZBX_Cam* cam,
                                        const FaceRecoInfo* faceRecoInfo,
                                        void* usrParam);

typedef void(SDK_CALL* ZBX_FaceRecoCbEx_t)(ZBX_Cam* cam,
	const FaceRecoInfo_Offline* faceRecoInfo,
	void* usrParam);


typedef void(SDK_CALL* ZBX_FaceQueryCb_t)(ZBX_Cam* cam,
                                         const QueryFaceInfo* faceQueryInfo,
                                         void* usrParam);
typedef void(SDK_CALL* ZBX_FaceQueryCbEx_t)(ZBX_Cam* cam,
	const QueryFaceInfoEx* faceQueryInfo,
	void* usrParam);
//人脸轮廓坐标回调
typedef void(SDK_CALL* ZBX_FaceRectCb_t)(ZBX_Cam* cam, const FaceRect* faceRects,
                                        int rectNum, int showIdFlag,
                                        void* usrParam);

//调试图像回调
typedef void(SDK_CALL* ZBX_FaceDebugImageCb_t)(ZBX_Cam* cam,
                                              DebugImageInfo* debugImageInfo,
                                              void* usrParam);

//删除进度回调
typedef void(SDK_CALL* ZBX_FaceDelProgressCb_t)(ZBX_Cam* cam,
                                               FaceDelProgressInfo* delProgress,
                                               void* usrParam);

//快照图像回调
typedef void(SDK_CALL* ZBX_SnapshotCb_t)(ZBX_Cam* cam, SnapshotImage* snapImage,
                                        void* usrParam);

//认证结果回调,请勿再回调函数做复杂操作
typedef void(SDK_CALL* ZBX_VerifyStatusCb_t)(ZBX_Cam* cam, const char* ip,
                                            unsigned short port, int status,
                                            void* usrParam);

//开闸信息回调，开闸纪录
typedef void(SDK_CALL* ZBX_AlarmRecordCb_t)(ZBX_Cam* cam,
                                           AlarmInfoRecord* alarmRecord,
                                           void* usrParam);

//开闸请求回调，当相机处于在线模式需要开闸时，会收到该此回调信息
typedef void(SDK_CALL* ZBX_AlarmRequestCb_t)(ZBX_Cam* cam,
                                            AlarmRequest* alarmRequest,
                                            void* usrParam);

//重注册进度回调
typedef void(SDK_CALL* ZBX_FaceReRegistProgressCb_t)(
    ZBX_Cam* cam, FaceReRegistProgressInfo* registProgress, void* usrParam);

typedef void(SDK_CALL* ZBX_FaceRecordCb_t)(ZBX_Cam* cam,
                                          const RecordData* recordInfo,
                                          void* usrParam);
//系统升级进度
//注意：如果注册此回调 该回调必须返回0 否则会终止传输
typedef int(SDK_CALL* ZBX_HTTPRESULT_PROCESS)(const void* user_data,
	double rDlTotal,
	double rDlNow,
	double rUlTotal,
	double rUlNow);


//韦根信息回调
typedef void(SDK_CALL* ZBX_WGAlarmRecordCb_t)(ZBX_Cam* cam,
	const WGAlarmRecord* alarmRecord,
	const void* usrParam);


//身份证刷卡信息
typedef void(SDK_CALL* ZBX_IDCardRecordCb_t)(ZBX_Cam* cam,
	const IDCardRecord* alarmRecord,
	const void* usrParam);

typedef void(SDK_CALL* ZBX_UserRightsCfgCb_t)(ZBX_Cam* cam,
	const UserRightsCfgs* userrightscfg,
	const void* usrParam);

//TF识别记录查询
typedef void(SDK_CALL* ZBX_tfFaceRecordCb_t)(ZBX_Cam* cam,
	const RecordFileNames* recordInfo,
	void* usrParam);
#endif  // SDK_DEF_H_
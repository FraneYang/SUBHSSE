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

// ��ȡ��������ʧ�ܣ��뱣֤ͼ�������ҽ���һ������
#define ZBX_ERR_GET_FACE_FEATURE -14
// �����Աʧ�ܣ���Աid�ظ�
#define ZBX_ERR_FACE_ID_REPEAT -15
// �޸���������ʧ�ܣ�δ�ҵ���ӦID
#define ZBX_ERR_FACE_ID_NOT_EXITS -16
// ������ȡ��δ��ʼ���������ZBX_InitFaceModel��ʼ��
#define ZBX_ERR_GET_FACE_INIT -17
// �޵�ǰ��¼
#define ZBX_ERR_GET_FACE_ID -18
// ����Ĵ��ڱ�ţ�Ŀǰֻ֧��ZBX_SERIAL_RS485��ZBX_SERIAL_RS232
#define ZBX_ERR_SERIAL_INDEX -19
// ����ϵͳʧ��
#define ZBX_ERR_SYSTEM_REBOOT -20
// ����Ӧ�ó���ʧ��
#define ZBX_ERR_APP_REBOOT -21
// ѹ��ͼ��ʧ��
#define ZBX_ERR_ENCODE_JPG -22
// ������Ա���֧��5��ͼ��
#define ZBX_ERR_FACES_NUM -23
// ͼ�����ʧ��  ͼ��̫��������ȡ������jpgͼ���ܳ���10M���·��������jpgͼ��
// ��߲��ܳ���128x128
#define ZBX_ERR_IMAGE_DECODE -24

#define ZBX_ERR_IMAGE_SIZE -25
// �ļ������ڣ�����ͼƬ·���Ƿ���ȷ
#define ZBX_ERR_IMAGE_PATH -26
// Ŀǰ���ֻ֧�ִ�һ��ģ��ͼ��pictureFlags����<=1
#define ZBX_ERR_SAVE_IMG_NUM -27
// ��֧�ֵ���̨���ƣ�Ŀǰֻ֧��5���䱶���Ŵ� 6���䱶����С��
// 7���۽��������� 8���۽�����Զ��
#define ZBX_ERR_PTZ_CTRL -28
// ��֧�ֵĿ���ģʽ��1��һ���˶� 2������ 3��ֹͣ
#define ZBX_ERR_PTZ_CTRL_MODE -29

#define ZBX_ERR_DAEMON_REQUEST -30
// ��Ա�����Ѵ�����
#define ZBX_ERR_UPPER_LIMIT -31
// Э��汾��ƥ�䣬��ȷ��SDK������̼��汾
#define ZBX_ERR_PROTOCAL_VER -32
// ��֧�ֵĲ�������
#define ZBX_ERR_REQUEST_CMD -33
// �������ݰ��������Ϸ��ֶ�
#define ZBX_ERR_PACKET_DATA -34
// ��֤ʧ��
#define ZBX_ERR_AUTH_FAILED -35
// д������ʧ��
#define ZBX_ERR_WRITE_DATA -36
// ��ȡ����ʧ��
#define ZBX_ERR_READ_DATA -37
// ��һ��ͼ��ʧ��
#define ZBX_ERR_TWIST_FACE -38
// ��ȡ����ʧ��
#define ZBX_ERR_EXTRACT_FEATURE -39
// �����ߴ�̫С�����������������96*96
#define ZBX_ERR_MIN_FACE -40
// ��������̫�����ע������
#define ZBX_ERR_QVALUE_TOO_SMALL -41
// ��Ч��ͬ������
#define ZBX_ERR_INVALID_SYNC_MODE -42
// Τ�����Ų�֧��ģ����ѯ
#define ZBX_ERR_WG_QUERY_MODE -43
// ����ϵͳ��æ
#define ZBX_ERR_SYSTEM_BUSY -44
// �汾��ƥ��
#define ZBX_ERR_VERSION_MATCH -45
// ͼ������������Ϊ1
#define ZBX_ERR_TOO_MUCH_FACE -46
// ͼ��������������
#define ZBX_ERR_FACE_INCOMPLETE -47
// ����������̫��
#define ZBX_ERR_ANGLE_PITCH -48
// ������ƫ��̫��
#define ZBX_ERR_ANGLE_YAW -49
// ��������
#define ZBX_ERR_ANGLE_ROLL -50
// ������ȹ���
#define ZBX_ERR_MOUTH_OPEN -51
// ���ղ�����
#define ZBX_ERR_YINYANG_FACE -52
// δ֪����
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
	int type;  //0���Զ���������1���̶�����1��2���̶�����
	int volume; //������1 - 25
};
struct ZBXSdkVersion {
  char sdk_version[64];        // sdk�汾
  char protocl_version[64];    // Э������
  char sdk_code_version[64];   // sdkԴ����汾
  char min_firmware_ver[64];   // ֧�ֵ���͹̼��汾
  char algorithm_version[64];  // sdkʹ�õ��㷨�汾
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
	char hostname[16];				//��������ַ
	int http_timeout;							//��ʱʱ�� 1~60s
	int port;								//���Ͷ˿ں�
	int ssl_port;
};
struct ZBX_CENTERSERVER_EX
{
	int enable_ssl;
	char hostname[128];				//��������ַ
	int http_timeout;							//��ʱʱ�� 1~60s
	int port;								//���Ͷ˿ں�
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
	int	enable;									//�Ƿ���������
	int	plate_rlt_level;
	int	retransmission;
	int	small_img;
	char uri[128];				//uri ��ַ
};
struct ZBX_CS_DEV_REG{
	int enable;      //0 ȡ������  1����ͨ����  2�� comet��ѯ
	char uri[128];    //ע������� 
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

/* �����¼��ص����� */
// event 1Ϊ������ 2Ϊ�����ж�
typedef void(SDK_CALL* ZBX_ConnectEventCb_t)(ZBX_Cam* cam, const char* ip,
                                            unsigned short port, int event,
											size_int usrParam);

/* ʵʱ�����ݽ��ջص����� */
typedef void(SDK_CALL* ZBX_LiveStreamCb_t)(ZBX_Cam* cam, const char* ip,
                                          const ZBX_LiveStream* stream,
										  size_int usrParam);

/* ץ�ļ�������ݽ��ջص����� */
// dataType ��ͬ��data��Ӧ��ͬ�����ݽṹ������ο�demo����
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

// IO��״̬�ص�
typedef void(SDK_CALL* ZBX_IOStateCb_t)(ZBX_Cam* cam, int index, int state,
                                       void* usrParam);

//�ص�����,flag-�Ƿ��ѯ���볡��¼��1-�ɹ���0-ʧ��
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
//������������ص�
typedef void(SDK_CALL* ZBX_FaceRectCb_t)(ZBX_Cam* cam, const FaceRect* faceRects,
                                        int rectNum, int showIdFlag,
                                        void* usrParam);

//����ͼ��ص�
typedef void(SDK_CALL* ZBX_FaceDebugImageCb_t)(ZBX_Cam* cam,
                                              DebugImageInfo* debugImageInfo,
                                              void* usrParam);

//ɾ�����Ȼص�
typedef void(SDK_CALL* ZBX_FaceDelProgressCb_t)(ZBX_Cam* cam,
                                               FaceDelProgressInfo* delProgress,
                                               void* usrParam);

//����ͼ��ص�
typedef void(SDK_CALL* ZBX_SnapshotCb_t)(ZBX_Cam* cam, SnapshotImage* snapImage,
                                        void* usrParam);

//��֤����ص�,�����ٻص����������Ӳ���
typedef void(SDK_CALL* ZBX_VerifyStatusCb_t)(ZBX_Cam* cam, const char* ip,
                                            unsigned short port, int status,
                                            void* usrParam);

//��բ��Ϣ�ص�����բ��¼
typedef void(SDK_CALL* ZBX_AlarmRecordCb_t)(ZBX_Cam* cam,
                                           AlarmInfoRecord* alarmRecord,
                                           void* usrParam);

//��բ����ص����������������ģʽ��Ҫ��բʱ�����յ��ô˻ص���Ϣ
typedef void(SDK_CALL* ZBX_AlarmRequestCb_t)(ZBX_Cam* cam,
                                            AlarmRequest* alarmRequest,
                                            void* usrParam);

//��ע����Ȼص�
typedef void(SDK_CALL* ZBX_FaceReRegistProgressCb_t)(
    ZBX_Cam* cam, FaceReRegistProgressInfo* registProgress, void* usrParam);

typedef void(SDK_CALL* ZBX_FaceRecordCb_t)(ZBX_Cam* cam,
                                          const RecordData* recordInfo,
                                          void* usrParam);
//ϵͳ��������
//ע�⣺���ע��˻ص� �ûص����뷵��0 �������ֹ����
typedef int(SDK_CALL* ZBX_HTTPRESULT_PROCESS)(const void* user_data,
	double rDlTotal,
	double rDlNow,
	double rUlTotal,
	double rUlNow);


//Τ����Ϣ�ص�
typedef void(SDK_CALL* ZBX_WGAlarmRecordCb_t)(ZBX_Cam* cam,
	const WGAlarmRecord* alarmRecord,
	const void* usrParam);


//���֤ˢ����Ϣ
typedef void(SDK_CALL* ZBX_IDCardRecordCb_t)(ZBX_Cam* cam,
	const IDCardRecord* alarmRecord,
	const void* usrParam);

typedef void(SDK_CALL* ZBX_UserRightsCfgCb_t)(ZBX_Cam* cam,
	const UserRightsCfgs* userrightscfg,
	const void* usrParam);

//TFʶ���¼��ѯ
typedef void(SDK_CALL* ZBX_tfFaceRecordCb_t)(ZBX_Cam* cam,
	const RecordFileNames* recordInfo,
	void* usrParam);
#endif  // SDK_DEF_H_
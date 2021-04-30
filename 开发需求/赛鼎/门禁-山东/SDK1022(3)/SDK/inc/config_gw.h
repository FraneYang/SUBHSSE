/*
 * config_gw.h
 *
 *  Created on: 2014��7��4��
 *      Author: chens
 */

#ifndef CONFIG_GW_H_
#define CONFIG_GW_H_

#include <string.h>
#include <stdio.h>

#define MAX_LANE_NUM (4)
#define MAX_FLASH_NUM (4)
#define MAX_RADAR_NUM (4)
#define MAX_INPUT_IO_NUM (8)
#define MAX_COIL_GROUP (4)
#define MAX_CABINET_STATE (8)

#define HA_SERIA_RS485 (1)
#define HA_SERIA_RS232 (2)
#define ZBX_SERIA_RS485 (1)
#define ZBX_SERIA_RS232 (2)

//��Ա��ѯ�������
typedef enum {
  //ͨ��ID��ѯ
  QUERY_BY_ID = 0x1,

  //ͨ��������ѯ
  QUERY_BY_NAME = 0x2,

  //ͨ��Τ�����Ų�ѯ
  QUERY_BY_WGNO = 0x4,

  //ͨ����Ч�ڽ�ֹʱ�䷶Χ��ѯ
  QUERY_BY_EFFECT_TIME = 0x8,

  //ͨ����Ч����ʼʱ�䷶Χ��ѯ
  QUERY_BY_EFFECT_START_TIME = 0x10
} ConditionFlag;

// ��¼��ѯ������ǡ�
enum RecordQueryFlag {
  /*! ͨ��ץ��ʱ�䷶Χ��ѯ�� */
  RECORD_QUERY_FLAG_TIME = 0x1,

  /*! ͨ���ȶԷ�����Χ��ѯ�� */
  RECORD_QUERY_FLAG_SCORE = 0x1 << 1,

  /*! ͨ���Ա��ѯ�� */
  RECORD_QUERY_FLAG_SEX = 0x1 << 2,

  /*! ͨ�����䷶Χ��ѯ�� */
  RECORD_QUERY_FLAG_AGE = 0x1 << 3,

  /*! ͨ�����ϵ���Աid��ѯ�� */
  RECORD_QUERY_FLAG_ID = 0x1 << 4,

  /*! ͨ�����ϵ���Ա������ѯ�� */
  RECORD_QUERY_FLAG_NAME = 0x1 << 5,

  /*! ͨ��ץ��ͼ�������������Χ��ѯ�� */
  RECORD_QUERY_FLAG_QVALUE = 0x1 << 6,

  /*! ͨ����¼�ϴ�״̬��ѯ�� */
  RECORD_QUERY_FLAG_UPLOAD = 0x1 << 7,

  /*! ͨ����¼���ݿ��Ų�ѯ�� */
  RECORD_QUERY_FLAG_SEQUENCE = 0x1 << 8
};

//��Ա��ѯ�������
typedef enum {
  //��ȷ��ѯ
  QUERY_EXACT = 0x0,

  //ģ����ѯ
  QUERY_FUZZY = 0x1
} QueryMode;

/// gpio���뷽ʽ��
enum GpioInType {
  /*! Τ��26Э�顣 */
  IN_STATE_WG26 = 0,

  /*! Τ��34Э�顣 */
  IN_STATE_WG34 = 1,

  /*! IO���뷽ʽ�� */
  IN_STATE_IO = 255
};

/// ͼƬ��ʽ��
typedef enum {
  /*! δ��ʼ���������ģʽ�� */
  IMAGE_FORM_NULL = 0,

  /*! ȫ���� */
  IMAGE_FORM_OVERALL = 0x1,

  /*! ��д�� */
  IMAGE_FORM_CLOSEUP = 0x1 << 1,

  /*! ȫ��+��д�� */
  IMAGE_FORM_BOTH = IMAGE_FORM_OVERALL | IMAGE_FORM_CLOSEUP
} ImageForm;

/// ���ѡ�
enum OutputOption {
  /*! ѡ��Ϊ�ա� */
  OUTPUT_OPTION_NULL = 0,

  /*! ȫ��ͼ�� */
  OUTPUT_OPTION_OVERALL = IMAGE_FORM_OVERALL,

  /*! ��дͼ�� */
  OUTPUT_OPTION_CLOSEUP = IMAGE_FORM_CLOSEUP,

  /*! �ȶ�ԭ��ͼ�� */
  OUTPUT_OPTION_PROTOTYPE = 0x1 << 2,

  /*! �������ݡ� */
  OUTPUT_OPTION_FEATURE = 0x1 << 3,

  /*! ����ͼ��(�����㷨����)*/
  OUTPUT_OPTION_TWIST_IMAGE = 0x1 << 4
};

/// ��������ѡ�
enum FuncOption {
  /*! ��ץ�Ĺ��ܣ��ز����٣��������������ѡ� */
  FUNC_OPTION_NULL = 0,

  /*! �����ȶԡ� */
  FUNC_OPTION_MATCH = 0x1,

  /*! �����⡣ */
  FUNC_OPTION_AGE = 0x1 << 1,

  /*! �Ա��⡣ */
  FUNC_OPTION_SEX = 0x1 << 2,

  /*! �����⡣ */
  FUNC_OPTION_EMOTION = 0x1 << 3,

  /*! ��ɫ��⡣ */
  FUNC_OPTION_SKIN = 0x1 << 4,

  /*! �����⡣ */
  FUNC_OPTION_ALIVE = 0x1 << 5
};

/// �����ϴ�ģʽ��
typedef enum  {
  /*! δ��ʼ���� */
  UPLOAD_MODE_NULL = 0,

  /*! TCPЭ���ϴ��� */
  UPLOAD_MODE_TCP = 1,

  /*! FTPЭ���ϴ��� */
  UPLOAD_MODE_FTP = 2,

  /*! HTTPЭ���ϴ��� */
  UPLOAD_MODE_HTTP = 3
} UploadMode;

/// �����ϴ�ģʽ��
typedef enum  UPLOAD_MODE{
	/*! δ��ʼ���� */
	UPLOADMODE_NULL = 0,

	/*! TCPЭ���ϴ��� */
	UPLOADMODE_TCP = 1,

	/*! FTPЭ���ϴ��� */
	UPLOADMODE_FTP = 2,

	/*! HTTPЭ���ϴ��� */
	UPLOADMODE_HTTP = 3
} ;


/// Τ��Э�����͡�
typedef enum {
  WG26 = 0,

  WG34 = 1,

  WG36 = 2,

  WG44 = 3
} WiegandType;

typedef enum {
  //���κβ���
  HA_SYNC_NONE = 0,

  //ɾ����Ա��Ϣ
  HA_FACE_ADD = 1,

  //�޸���Ա��Ϣ
  HA_FACE_UPDATE = 2,

  //ɾ����Ա��Ϣ
  HA_FACE_DEL = 3
} FaceSyncMode;

#define PTZ_CTRL_ZOOM_IN 5   /*! �䱶���Ŵ�*/
#define PTZ_CTRL_ZOOM_OUT 6  /*! �䱶����С��*/
#define PTZ_CTRL_FOCUS_IN 7  /*! �۽���������*/
#define PTZ_CTRL_FOCUS_OUT 8 /*! �۽�����Զ��*/

#define PTZ_MODE_ONCE 1  /*! һ���˶�*/
#define PTZ_MODE_START 2 /*! ����*/
#define PTZ_MODE_STOP 3  /*! ֹͣ*/

struct config_size {
  unsigned short width;
  unsigned short height;
};

struct config_point {
  unsigned short x;
  unsigned short y;
};

struct config_rect {
  unsigned short x;
  unsigned short y;
  unsigned short w;
  unsigned short h;
};

/******* ����ϵͳ����ʱ�估��У����Ĭ������ ********/

struct config_worktime {
  unsigned char start_hour;
  unsigned char start_min;
  unsigned char end_hour;
  unsigned char end_min;
};

/****** ��ַ��Ϣ�����á�У�顢����  ******/

struct config_addr {
  char device_id[32];
  char device_name[32];
  char addr_id[32];
  char addr_name[96];
  char direction_id[32];
  char direction_name[96];

  unsigned short lane_number;   /* ������Ŀ */
  unsigned short lane_start_id; /* ������ʼ��� */

  unsigned char match_light[MAX_LANE_NUM]; /* �����복�ƹ��� */

  char master_mode;           /* �����ģʽ */
  char slave_mode;            /* �Ӽ��ģʽ */
  char mode_change_threshold; /* ģʽ�л�ʱ��ֵ,
                                 ������ģʽ���ٴ�δ���ʱ�л�����ģʽ */

  unsigned char serial_index;
  int serial_baudrate;           // ������
  unsigned char serial_databit;  // ����λ
  unsigned char serial_parity;   // �Ƿ�ʼУ��
  unsigned char serial_stopbit;  // ֹͣλ

  char resv[113];
};

/****** ��Ȧ���ڵ����á�У�顢����  ******/

/* ��������ĳ��input io�ľ������� */
struct coil_io_attr {
  unsigned char group; /* ������Ȧ�����(������) < MAX_COIL_GROUP */
  unsigned char index; /* ���ڸ�����Ȧ�ĵڼ���IO�ź� 0 or 1 */
  unsigned char count; /* ���������� <= 2 */
  unsigned char
      match_light; /* ����ƹ���������λÿһλ(=1)��ʾ������·����� */
};

struct config_coil {
  int enable;
  unsigned int distance; /* ����Ȧ֮�����,��λcm ������������IO֮��ʱ��� */
  struct coil_io_attr io_attr[MAX_INPUT_IO_NUM];

  char resv[64];
};

/****** �״￨�ڵ����á�У�顢���� ******/

enum RADAR_TYPE {
  RADAR_TYPE_NONE = 0,
  RADAR_TYPE_CSRIN = 1,
  RADAR_TYPE_CSRIN_M = 2
};

struct config_radar {
  int enable;

  enum RADAR_TYPE type;

  /* �ܹ��ж��ٸ��״� */
  unsigned int count;

  /* �״��복��ƥ�䣬��match_lane[0] = 2���ͱ�ʾ��һ���״��Ӧ����2 */
  unsigned char match_lane[MAX_RADAR_NUM];

  /* �״��������ƥ�䣬match_light���±�n����1��ʾ�״���ţ���1��ʼ��
   * match_light[n]����Ӧ��ֵ��ʾ����Ӧ�������
   * 0x1 0x2 0x4 0x8 �ֱ��ʾ 1��2��3��4·����� 0x3���ʾ1��2·ͬʱ��
   * 0x0��ʾ������
   */
  unsigned char match_light[MAX_RADAR_NUM];

  /* �Ƿ��״����ݼ�¼����־(ͨ�����緢��) */
  int enable_log;

  char resv[64];
};

/****** ��Ƶ���ڲ��������á�У�顢����******/

enum CALC_LANENO_METHOD {
  LEFT_TO_RIGHT,  // �����������Ϊ��ʼ����1
  RIGHT_TO_LEFT
};

/****** ��Ƶ���ڲ��������á�У�顢����******/

enum vdetect_type {
  VDETECT_TYPE_RECO, /* ʹ�ó���ʶ���⳵�� */
  VDETECT_TYPE_DET,  /* ʹ����Ƶ����⳵�� */
  VDETECT_TYPE_BOTH  /* ��������ͬʱʹ�� */
};

struct config_vdetect {
  int enable; /* ��Ƶ���ʹ�� */

  enum vdetect_type type;

  int flash;                       /* ��Ƶ�������� */
  int motion;                      /* �˶���� */
  int diff;                        /* ���ʹ�� */
  struct config_rect detect_area;  /* ��Ƶ������� */
  struct config_rect virtual_coil; /* ������Ȧ���������� */

  int night_threshold; /* ������������ ��ֵ */
  int rsv2;

  unsigned skip; /* ��֡�������������Ժ���������֡����� */
  unsigned cut;  /* �����и����� */
  unsigned min_size;
  unsigned max_size;
  unsigned resize;
  float step;

  int debug;     /* ���Կ��أ������Ƿ������ͼ�� */
  int draw_coil; /* ��������Ȧ�����ڵ���ͼ���� */
  int draw_area; /* ����⵽�ĳ�����������ڵ���ͼ���� */

  enum CALC_LANENO_METHOD m;

  /* �������ƥ�䣬match_light���±�n����1��ʾ�״���ţ���1��ʼ��
   * match_light[n]����Ӧ��ֵ��ʾ����Ӧ�������
   * 0x1 0x2 0x4 0x8 �ֱ��ʾ 1��2��3��4·����� 0x3���ʾ1��2·ͬʱ��
   * 0x0��ʾ������
   */
  unsigned char match_light[MAX_LANE_NUM];

  struct config_point virtual_coil_polygon[4];

  char resv[40];
};

/****** ���������������á�У�顢���� ******/
struct config_face_detect {
  int enable;
  int debug;                      /* �Ƿ��͵���ͼ��� */
  struct config_rect detect_area; /* ��ԭͼ��ȡһ���ֽ��м�� */
  struct config_size minsize; /* ָ�����ͼ��������ռ���ط�Χ */
  struct config_size maxsize;
  float step; /* ÿ�μ�ⲽ������ */

  float ratio;       // ��ԭ��Ԥ����64�ֽ���ȡ��һ��
  unsigned interval; /* ��֡�� */

  unsigned use_motion; /* ʹ���˶�������ץ�� */

  unsigned face_step; /* ���˶����Ļ�����,�����ٴμ��һ������ */

  char resv[48]; /* Ԥ�� */
};

/* ������ɫ���˳��� */
enum reco_filter_color {
  RECO_FILTER_BLUE = 0,
  RECO_FILTER_BLACK = 1,
  RECO_FILTER_YELLOW = 2,
  RECO_FILTER_WHITE = 3,
  RECO_FILTER_GREEN = 4
};

enum reco_filter_num {
  RECO_FILTER_NULL = 0,
  RECO_FILTER_XUE = 1,
  RECO_FILTER_JING = 2
};

//�����ļ�
typedef enum {
	VOL_TYPE_SUCESS = 1,	//�ɹ���ʾ��
	VOL_TYPE_FAILURE,  //ʧ����ʾ��
	VOL_TYPE_RESWIPEIDCARD, //����ˢ���֤
	VOL_TYPE_DEADLINE, //Ȩ���ѹ���
	VOL_TYPE_WELCOME,//��������
	VOL_TYPE_SAFEHAT,//δ����ȫñ��ֹͨ��
	VOL_TYPE_OUTTIME,//δ����Чʱ��
	VOL_TYPE_BLACK,  //����������
} VOL_TYPE;


/****** ʶ����������á�У�顢���� ******/
struct config_reco {
  int enable;
  float ratio;
  char province[16];

  unsigned short min_width;
  unsigned short max_width;

  struct config_rect reco_area[MAX_LANE_NUM];

  int draw_reco_area; /* ��ʶ�����ϻ���ʶ������ */

  unsigned int filter_color;
  unsigned int filter_num;

  unsigned short same_plate_report_time;  //��ͬ�����ϱ��������λ:��

  unsigned char draw_reco_area_video;

  unsigned char reco_mode;  // 0,1Ϊ�����Ƕȣ�2Ϊ�Զ���3Ϊ��Ƕ�

  char resv[48];
};

/****** ������������á�У�顢���� */

enum PLATE_FILTER_TYPE {
  PLATE_FILTER_TYPE_NONE = 0,
  //  DROP_NO_PLATE,
  //  ONLY_KEEP_BLUE,
  //  ONLY_KEEP_YELLOW,
  //  DROP_YELLOW,
  //  DROP_BLUE
};

struct config_special {
  int merge_two;                       /* �����������ʱ���кϲ� */
  int keep_one;                        /* û����ֻ����һ��ͼƬ */
  enum PLATE_FILTER_TYPE plate_filter; /* �����ض������ĳ��� */

  char resv[32];
};

/****** ������ץ����ص����á�У�顢����  ******/

struct config_limit_speed {
  /* ץ��������ץ�ļ�� */
  unsigned short capture_count;
  unsigned short overspeed_count;
  unsigned int interval;

  unsigned short lspeed[MAX_LANE_NUM];   // �����궨����ֵ
  unsigned short rlspeed[MAX_LANE_NUM];  // ���ٴ��������ֵ

  char resv[32];
};

struct config_net {
  enum UPLOAD_MODE upload_mode;
  char ftp_server[16];
  char tcp_server[16];
  char ntp_server[16];
  int ntp_interval;
  unsigned short ftp_port;
  unsigned short tcp_port;
  char ftp_user[32];
  char ftp_passwd[32];

  char led_server[16];
  unsigned short led_port;

  unsigned short http_port;
  char http_server[16];

  char tcp_enable;
  char ftp_enable;
  char led_enable;
  char http_enable;

  char resv[88];
};

struct CONF_OSD  // ���ֵ���
{
  unsigned short imgStartX;  // ������ʼλ��X����
  unsigned short imgStartY;  // ������ʼλ��Y����

  // ToDo: add for single and composed image
  unsigned char imgFontSize;      // ���ִ�С
  unsigned char imgFontColor[3];  // ������ɫ��RGB��

  char imgOSDRules[512];  // utf-8

  char resv[16];  // ����
};

struct lamp_area {
  int lamp_num;  // 2��or3��

  unsigned short only_red_x;
  unsigned short only_red_y;
  unsigned short only_red_w;
  unsigned short only_red_h;

  unsigned short all_lamp_x;
  unsigned short all_lamp_y;
  unsigned short all_lamp_w;
  unsigned short all_lamp_h;
};

struct config_people_red {
  int enable;
  struct lamp_area lamp;

  char resv[64];
};

struct config_gw_park {
  unsigned char offline;  // 1Ϊ���ߣ�0Ϊ����, 2Ϊ�Զ������ѻ���飩
  unsigned char alarm_out_mode;         // 0Ϊ����������1Ϊ������
  unsigned char transfer_offline_data;  //�ϴ���������
  unsigned char
      diable_serial_output;  //�ж�/�ָ�ԭ���豸���ƵĴ��������͸������������ڴ˿���

  unsigned char same_count;  // ģ��ƥ�䳵�Ʒ�ֵ
  unsigned char min_volume;  //��С����
  unsigned char max_volume;  //�������
  unsigned char cur_volume;  //��ǰ����

  unsigned char light;

  unsigned char drive_direct;  // 0:ȫץ, 1:ֻץ��ͷ��2ֻץ��β

  unsigned char ctrl_light_mode;  // 0������1���ܿص�ʹ�ܣ�2���գ�3��Ȧ����ģʽ
  unsigned char day_brightness;     //�������ȷ�ֵ
  unsigned short alarmOutDuration;  //�Զ���բʱ����(500-5000ms)
  unsigned char disable_io_port;    //�ж�GPIO����
  unsigned char disable_io_output;  //�ж�/�ָ�ԭ���豸���Ƶļ̵�������ƽ���
  unsigned char gpio_in;          // GPIO INʹ�ܣ�bit[7-0]��Ӧgpio[7-0]
  unsigned char gpio_out;         // GPIO OUTʹ�ܣ�bit[7-0]��Ӧgpio[7-0]
  unsigned char flash_sync_out1;  //ͬ�����out2
  unsigned char reboot_flag;      // 0-ÿ���Զ�������1-�ز�����
  unsigned char resv[16];         //����
};

/****** ������������  ******/

/*
 * @brief   magic_number    �����޸ļ�¼
 *      3   2014-10-22 ������������ز���, ÿ������Ԥ���ռ�
 *      4   2014-12-09 �����Ƶ���ڼ����ز���
 *      5   2015-01-07 ������Ӱ���������ֵ, ����ͼ��Э�������΢��
 *      6   2015-01-21 ��ʶ�����������ӳ�����ɫ���˺ͳ��ƺ������
 *      7   2015-06-16 �������˴��������
 */
// static const int magic_number = 7;

//�Ƿ���ص�
struct config_carbinet_inturn_control {
  int isEnable;  //�Ƿ���Ч 0��Ч 1��Ч
  char ip[64];   // IP��ַ
};
struct MessageCarPortState {
  int carPortState;            //״̬ 0 �޳� 1�г� 2 ѹ�� 3 ���⳵λ
  int lightColor;              //��ɫ
  int laneNum;                 //��ǰ�м�������
  int hasCar[MAX_LANE_NUM];    //ÿ��λ���Ƿ��г�
  int hasPlate[MAX_LANE_NUM];  //�Ƿ��г���
  char plate[MAX_LANE_NUM][16];  //���ƺ���
};

//��λ��Ϣ
struct config_carbinet {
  int isSpecial;  //�Ƿ����⳵λ 0һ�㳵λ 1���⳵λ
  int portNum;    //��λ��
};

//��λ״̬��Ϣ
struct config_carbinet_state {
  int isEnable;    //�Ƿ���Ч  0��Ч 1��Ч
  int isFlicker;   //�Ƿ���˸  0���� 1��
  int lightColor;  //�Ƶ���ɫ 0�� 1�� 2�� 3�� 4��ɫ 5Ʒ�� 6�� 7��
};

//��λ����㷨����
struct config_carbinet_vdetect {
  config_point inventedRoi[MAX_LANE_NUM][4];  //������Ȧ
};

//��λ�������������Ϣ
struct config_gw_car_port {
  //�ص�ģʽ  1���õ� 2 ���õ� 3 �ڼ���
  int lightControlMode;
  //����ص�
  struct config_carbinet_inturn_control inturnControl;
  //��λ״̬����
  struct config_carbinet_state carbinetState[MAX_CABINET_STATE];
  //��λ������Ϣ
  struct config_carbinet carbinet[MAX_LANE_NUM];
  //��λ����㷨����
  struct config_carbinet_vdetect alg;
};

struct config_http {
  char http_ip[20];
  unsigned short http_port;
  unsigned short ssl_port;

  int timeout;

  unsigned char enable_ssl;
  unsigned char enable_reg;
  unsigned char enable_post_vehicle;
  unsigned char enable_img;
  unsigned char enable_plate_img;

  unsigned char enable_post_io_info;
  unsigned char enable_post_serial_data;

  unsigned char vehicle_level;

  char reg_url[96];
  char post_vehicle_url[96];
  char post_ioinfo_url[96];
  char post_serial_url[96];

  unsigned char resv[128];
};

struct device_group_cam_attr {
  char ip[20];
  char cam_name[32];
  char assistFlag;
  char inFlag;
  char resv[2];
  int r[4];
};

struct device_group_gate_attr {
  char gate_name[32];
  int cam_num;
  struct device_group_cam_attr attr[4];
};

struct config_device_group {
  int enable_group;
  int enable_group_assist;
  char ip[20];  //�����������ศip

  int gate_num;
  struct device_group_gate_attr attr[8];
};

struct config_gateway {
  int magic_number;
  struct config_worktime worktime;
  struct config_addr addr;
  struct config_reco reco;
  struct config_limit_speed limit_speed;
  struct config_radar radar;
  struct config_coil coil;
  struct config_special special;
  struct config_net net;
  struct config_face_detect face;
  struct config_vdetect vdetect;
  struct config_people_red people_red;
  struct config_gw_park park;        // ͣ�����������
  struct config_gw_car_port carpos;  // ��λ����������
  struct config_http http;
  struct config_device_group device_group;
};

/****** ��ʱѡ������� ******/
struct CONF_TEMP {
  char enableLiveImage;  // ʵʱͼ�񿪹�
  char resv[124];

  char authKey[128];    // �����루�ַ����ͣ�
  char authValue[256];  // ��Ȩ�루�ַ����ͣ�
  int authResult;       // ��Ȩ��֤���(AUTH_RESULT)
};

struct RPlate {
  char plate[16];
  int plateColor;  // 0-��ɫ 1-��ɫ 2-��ɫ 3-��ɫ 4-��ɫ 5-��ɫ 6-��ɫ
                   // 7-��ɫ(KISE)
  unsigned short plateX;
  unsigned short plateY;
  unsigned short plateW;
  unsigned short plateH;
  float platerealty;
};

struct reco_extra_info {
  int lane;
  int diff;
  int number;  // 0 or 1
  struct RPlate plate;
  unsigned short w;
  unsigned short h;
  unsigned int len;
  char *imgdata;
};

//------------------------------------------------------------//

/// ���������8�ֽڣ���
struct ServiceParam {
  /*! ����˿�(ֻ�� )�� */
  unsigned short port;

  /*! ���ͻ�������������ǰ����Ч�� */
  unsigned char max_clients;

  /*! ������ʱʱ�䣬��ǰ����Ч�� */
  unsigned char heart_timeout;

  /*! �����ֶΡ� */
  unsigned char resv[4];
};

/// �������(512�ֽ�)��
struct CameraParam {
  /*! ��������ơ� */
  char stream_url[128];

  /*! ������˿ڡ� */
  short stream_port;

  /*! ������ƶ˿ڡ� */
  short control_port;

  /*! ��ƵOSD��֧��������С� */
  char video_osd[2][96];

  /*! ֡�ʡ� */
  char fps;

  /*! ���Ͷȡ�ȡֵ��Χ��1~255�� */
  unsigned char saturation;

  /*! ���ȡ�ȡֵ��Χ��1~100�� */
  unsigned char brightness;

  /*! �Զ��ع�ʹ�ܿ��ء� */
  char enable_ae;

  /*! ����ع�ʱ�䡣��λ�����롣ȡֵ��Χ��0~100�� */
  short max_exposure;

  /*! ������档��λ��DB��ȡֵ��Χ��0~40�� */
  short max_gain;

  /*! �Աȶȡ�ȡֵ��Χ��0~128�� */
  short contrast;

  /*! ���ʡ���λ��kbps�� */
  unsigned short video_br;

  /*! ��Ƶ��ͼ���ȡ� */
  unsigned short video_width;

  /*! ��Ƶ��ͼ��߶ȡ� */
  unsigned short video_height;

  /*! ��Ƶ���������͡�1��H264��2��MJPEG�� */
  unsigned char video_enc_type;

  /*! ��Ƶ��ת�Ƕ� 0:Ĭ��ֵ 1��˳ʱ����ת90�� 2��˳ʱ����ת180��
   * 3��˳ʱ����ת270��*/
  unsigned char video_rotate;

  /*! �����ʾ������osd*/
  char screen_osd_title[64];

  /*! ������ */
  char resv[106];
};

/// ����32�ֽڣ���
struct AppServicesParam {
  /*! ���÷��� */
  struct ServiceParam config_service;

  /*! ��ѯ���� */
  struct ServiceParam query_service;

  /*! ��־���� */
  struct ServiceParam log_service;

  /*! ������ */
  struct ServiceParam resv_service;
};

/// �豸������Ϣ������224�ֽڣ���
struct DescriptionParam {
  /*! ��λ��š� */
  char addr_id[32];

  /*! ��λ���ơ� */
  char addr_name[96];

  /*! �豸��š� */
  char device_id[32];

  /*! �����ֶΡ� */
  char resv[64];
};

/// ϵͳӦ��˽�в�����
struct AppPrivateParam {
  /*! ��ϵͳ���ж��塣 */
  char resv[512];
};

/// TCP�ϴ�������
struct TcpClientParam {
  /*! ������IP��ַ�� */
  char ip[16];

  /*! �������˿ڡ� */
  int port;

  /*! ʹ�ܿ��أ�δʹ�ã����ֶν�Ϊ���ݾ�Э������룩�� */
  char enable;

  /*! ��¼��֤���ء� */
  unsigned char enable_verify;

  /*! ��¼��֤�û����� */
  char user_name[16];

  /*! ��¼��֤���롣 */
  char passwd[17];

  /*! �����ֶΡ� */
  char resv[65];
};

/// ��͸��������
struct ExtranetParam {
  /*! ��TCP�ͻ��˷�ʽֱ�������� */
  struct TcpClientParam client;

  /*! ʹ�ܿ��ء� */
  char enable;

  /*! ������ */
  char resv[7];
};

/// ������֤������48�ֽڣ�
struct AuthParam {
  /*! ������֤���� */
  unsigned char enable;

  /*! ��¼��֤�û����� */
  char user_name[16];

  /*! ��¼��֤���롣 */
  char passwd[17];

  /*! �����ֶΡ� */
  char resv[14];
};

/// Ӧ�ó���ͨ�ò���(512�ֽ�)��
struct AppCommonParam {
  struct AppServicesParam services;     //--------|-32�ֽ�--|
  struct DescriptionParam description;  //-----|-224�ֽ�-|
  struct ExtranetParam extranet;        //-----------|-128�ֽ�--|
  struct AuthParam auth;                //---------|-48�ֽ�--|

  /*! �����ֶΡ� */
  char resv[80];  //-------------------------|-80�ֽ�-|
};

// ƽ̨������

/// ����(16�ֽ�)��
struct PlatformServicesParam {
  /*! ���÷�������� */
  struct ServiceParam config_service;

  /*! ���������ò����� */
  struct ServiceParam stream_service;
};

/// ��ʱ������32�ֽڣ���Ӧ�ó���������ʧЧ��
struct TemporaryParam {
  /*! ������Ƶ���� */
  char enable_video;

  /*! ��ϵͳ���ж��塣 */
  char resv[27];
};

/// ƽ̨����(640�ֽ�)��
struct PlatformParam {
  /*! ���� */
  struct PlatformServicesParam services;

  /*! ����� */
  struct CameraParam camera;

  /*! ��ƽ̨�����ж��塣 */
  char resv[112];
};

/// ������(64�ֽ�)��
struct StreamParam {
  /*! ��Ƶ����JPEG��@ref ImageFormat �� */
  int video_format;

  /*! ������ */
  char resv[60];
};

/// Ӧ�ó������(1024�ֽ�)��
struct AppParam {
  /*! ��Ӧ�ó����ò����� */
  struct AppCommonParam common;

  /*! ˽�в����� */
  struct AppPrivateParam priv;
};

/// FTP�ϴ�������
struct FtpClientParam {
  /*! ������IP��ַ�� */
  char ip[16];

  /*! �������˿ڡ� */
  int port;

  /*! ��¼�û����� */
  char user[15];

  /*! ��¼���롣 */
  char password[15];

  /*! �ϴ�Ŀ¼�� */
  char pattern[70];
};

/// HTTP�ϴ�������
struct HttpClientParam {
  /*! ������IP��ַ�� */
  char ip[16];

  /*! �������˿ڡ� */
  unsigned short port;

  /*! ����URL�� */
  char url[102];
};

/// ���Ӳ�����
struct ClientParam {
  /*! ģʽ@ref UploadMode �� */
  char mode; /*0 δ��ʼ���� 1 TCPЭ���ϴ��� 2 FTPЭ���ϴ��� 3 HTTPЭ���ϴ���*/
  /*! ������ */
  char resv[3];
  /*! �������� */
  union {
    FtpClientParam ftp;
    TcpClientParam tcp;
    HttpClientParam http;
  };
};

// ���ݴ��䡣

/// �ϴ�������
struct UploaderParam {
  /*! �����ֶΡ� */
  char resv[4];

  /*! �ͻ������Ӳ����� */
  struct ClientParam client;
};

/// �����������СӦ�̶�Ϊ128�ֽڡ�
struct OutputerParam {
  struct UploaderParam uploader;
};

/// ��ϵͳ������
struct FaceSystemConfig {
  struct TemporaryParam temp;     //------28�ֽ�
  struct PlatformParam platform;  //---640�ֽ�
  struct StreamParam stream;      //---64�ֽ�
  struct AppParam app;            //-------------1024�ֽ�
  struct OutputerParam outputer;  //---128�ֽ�
};

/// ����㶨�塣
struct Point {
  int x;
  int y;
};

/// ����㶨�塣
struct HA_Point {
  int x;
  int y;
};
struct ZBX_Point {
  int x;
  int y;
};
struct FacePrivateParam {
  /*! ��������������� */
  char roi_border_num;

  /*! �ȶԿ��ء�ȡֵΪ0ʱ�رգ�����ȡֵ�򿪡� */
  char enable_match;

  /*! ���Կ��ء� */
  char enable_debug;

  /*! ���ȥ�ظ����ء�1���� 0���ء� */
  char enable_dereplication;

  /*!
   * �ظ���ʱ����ʱ��������Ϊ�ظ������ڿ���ȥ�ظ�ʱ��Ч����λ���롣ȡֵ��Χ��1~60��
   */
  char replication_timeout;

  /*!
   * �ظ�������������ͬһ��Ա���ϱ��������ʱ��������λ���롣ȡֵ��Χ��1~120��
   */
  char replication_interval;

  /*! ���ͼ��Ʒ�ʡ� */
  char quality;

  /*! ���������Զ������ܿ��ء� */
  char enable_auto_clean;

  /*! ������ơ� */
  int output_form;

  /*! �ȶ��������ƶ�ֵ��ȡֵ��Χ��0.2~1.0�����ƶȴﵽ��ֵʱȷ�Ŷ�Ϊ���֡� */
  float full_credit;

  /*! ���ƶȴﵽ��ֵʱ��Ϊ�ȶԳɹ���100���ƣ��� */
  short match_score;

  /*! ������GPIO������أ��˿�1����1���� 0���� */
  char gpio_enable_white;

  /*! ������GPIO������أ��˿�2����1���� 0���� */
  char gpio_enable_black;

  /*! ��δ����GPIO������أ��˿�3����1���� 0���� */
  char gpio_enable_resv;

  unsigned char serial_send_flag;
  unsigned char serial_databit[2];  // ����λ
  unsigned char serial_parity[2];   // �Ƿ�ʼУ��
  unsigned char serial_stopbit[2];  // ֹͣλ
  int serial_baudrate[2];           // ������

  /*! ����ƹ���ģʽ��1������ 2���Զ����� 3�����ա� */
  unsigned char light_mode;

  /*! ��������ȵȼ�(1~100)�� */
  unsigned char light_level;

  /*! �������ޡ���������ֵ���ڸ�ֵʱ���ơ�����ȡֵ��Χ��1~255�� */
  unsigned char light_threshold;

  /*! ����ȡֵ��Χ��0~100�� */
  unsigned char audio_volume;

  /*! �ֽڶ��룬������ */
  char resv2[2];

  /*! բ���������ͣ�0�̵����� 1Τ���� */
  unsigned char gateway_control_type;

  /*! �̵�����š� */
  unsigned char alarm_index;

  /*! �̵����Զ��պϳ���ʱ�䣬��λms(500-5000)�� */
  unsigned short alarm_duration;

  /*! Τ�����ͣ�WG26,WG34, WG36, WG44��Ŀǰֻ֧��WG26, WG34�� */
  unsigned char wiegand_type;

  /*! �����룬wg36 wg44��Ҫ���ֶ� */
  unsigned char wiegand_dcode;

  /*! Τ���Ž��������š� */
  unsigned int wiegand_public_cardid;

  /*! �Զ����ɿ���ʱ��Τ�����ŷ�Χ����Сֵ�� */
  unsigned int wiegand_card_id_min;

  /*! �Զ����ɿ���ʱ��Τ�����ŷ�Χ�����ֵ�� */
  unsigned int wiegand_card_id_max;

  /*! ����ģʽ��@ref WorkMode ���� */
  unsigned char work_mode;

  /*! �̵���״̬��0��ʾ���պ� 1��ʾ���Ͽ�*/
  unsigned char gpio_state;

  /*! �޸�¼�루���ࣩ���� */
  unsigned char cluster_enable;

  /*! ͬһ����ͨ��������������ͬһ����ͨ���Ĵ������ڵ��ڸô���ʱ�Զ�ע�� */
  unsigned char max_pass_times;

  /*! ���������ʱ�������ڸ�ʱ������ֻ��ͨ��һ�� ��λ ��*/
  unsigned int calc_times_interval;

  /*! ץ�ļ�¼���� 0:�� !0:��*/
  char record_enable;

  /*! �ϵ��������أ��Զ��ϴ��������� */
  char record_resume_enable;

  /*! ����*/
  char resv4[2];

  /*! gpio�������ͣ� 255�ͱ�ʾgpio 0��ʾwg26 1��ʾwg34*/
  int gpio_input_type;

  /*! gpio���뿪�أ�0�أ�!0��*/
  char gpio_input_enable;

  /*! ������ */
  char resv3[51];

  /*! ��������������㡣˳�����ӹ��ɼ��������� */
  struct Point roi[6];

  /*! ���������С�����ߴ� */
  short min_face_size;

  /*! �������÷��񿪹أ�0���� ��0����*/
  char serial_config_enable[2];

  /*! ��Ƕ��������˿���*/
  char valid_angle_enable;

  /*! �������������Ƕȣ���δʹ��*/
  char valid_angle;

  /*! ������ */
  char resv[310];

  /*! ������IP�� */
  char pair_ip[16];

  /*! �Ƿ�������ԡ� */
  unsigned char enable_pair;

  /*! ��������բ�������λ���롣 */
  unsigned char pair_timeout;

  /*! �����ֶ�2�� */
  unsigned char resv1[2];
};

struct FtpInfo {
  char user_name[15];  //�û���
  char passwd[15];     //����
  char path[70];       //·��
  char resv[2];        //����
};
struct FaceAppParam {
  char dev_no[32];                    //�豸���
  char point_no[32];                  //��λ���
  char point_name[96];                //��λ����
  char resv1[32];                     //�����ֶ�1
  unsigned char heart_beat_interval;  //����ʱ����
  char extranet_enale;                //�������ƿ���
  unsigned short extranet_port;       //�������Ʒ������˿�
  char extranet_ip[16];               //�������Ʒ�����ip
  unsigned char
      verify_enable;  //������¼��֤�󣬿ͻ�������������������Ӻ��Զ����͵�¼��֤����ע��ץ�Ļ���Ϊ�ͻ��ˡ�1��������¼��֤
                      // 0���رյ�¼��֤
  char user_name[15];       //��¼��֤�û���
  char passwd[16];          //��¼��֤����
  unsigned char resv2[12];  //�����ֶ�2
  unsigned short
      upload_mode;  //�����ϴ���ʽ0���ر��ϴ� 1��TCP��ʽ 2��FTP��ʽ 3��HTTP��ʽ
  unsigned short upload_port;  //�������˿�
  char upload_ip[16];          //������IP

  union {
    char upload_url[102];     //ץ�����ݷ���URL(http�ϴ���ʽʱ��Ч)
    struct FtpInfo ftp_info;  // ftp�ϴ�������Ϣ(ftp�ϴ�ʱ��Ч);
    char tcp_resv[102];       // tcp�ϴ���ʽ�ı����ֶ�
    char other_resv[102];     //�����ϴ���ʽ�����ֶ�
  } upload_info;              //�ϴ���ʽ��ʱ���˽ṹ����

  unsigned char cam_mode;  //�������ģʽ��1���Զ�ģʽ 2������ģʽ 3������ģʽ
  char resv3[17];              //�����ֶ�3
  int match_enable;            //�ȶԿ���
  int match_score;             //�ȶ�ȷ�ŷ���
  int dereplication_enable;    //�ظ����˿���
  int dereplication_interval;  //�ظ���ʱ/������ʱ��
  unsigned short output_mode;  //ͼ�������ʽ
  char resv4[256];             //�����ֶ�4
};

struct QueryCondition {
  char faceID[20];          //��ԱID
  char faceName[16];        //��Ա����
  unsigned int wgCardNO;    //Τ��Э���Ž�����
  unsigned int timeStart;   //��Ч�ڽ�ֹʱ��Ĳ�ѯ���
  unsigned int timeEnd;     //��Ч�ڽ�ֹdʱ��Ĳ�ѯ�յ�
  unsigned int time1Start;  //��Ч����ʼʱ��Ĳ�ѯ���
  unsigned int time1End;    //��Ч����ʼʱ��Ĳ�ѯ�յ�
  unsigned char resv[256];
};

/// ץ�ļ�¼��ѯ����
struct RecordCondition {
  // ץ��ͼ�����ݱ�� 0������Ҫ����0����Ҫ��
  char img_flag;

  // ע��ͼ�����ݱ�� 0������Ҫ����0����Ҫ��
  char reg_img_flag;

  // ���� ��0���
  char resv1[2];

  // ƥ��ģʽ��0��ȷƥ�䣬��0ģ��ƥ��
  unsigned short query_mode;

  // ������ϱ��
  unsigned short condition_flag;

  // ץ��ʱ���������
  unsigned int time_start;

  // ץ��ʱ�������յ�
  unsigned int time_end;

  // �ȶԷ����������
  short score_start;

  // �ȶԷ��������յ�
  short score_end;

  // �Ա�
  unsigned char sex;

  // �����������
  unsigned char age_start;

  // ���������յ�
  unsigned char age_end;

  // ���� ��0���
  char resv2[17];

  // �ȶ��ϵ���ԱID
  char person_id[20];

  // �ȶ��ϵ���Ա����
  char person_name[16];

  // ���������������
  unsigned char qvalue_start;

  // �������������յ�
  unsigned char qvalue_end;

  // �Ƿ��Ѿ��ϴ� 1:��ʾ�Ѿ��ϴ� -1����ʾδ�ϴ�
  char upload_state;

  // ���� ��0���
  char resv3[65];
};

struct SnapshotImage {
  // ����ʱ��� ��
  unsigned int timeStamp_s;

  // ����ʱ��� ����
  unsigned int timeStamp_u;

  // ����ͼ�񳤶�
  int snapImageSize;

  // ����ͼ��
  unsigned char *snapImage;
};

//��բ��¼�������բ���ϱ��Ŀ�բ��¼
struct AlarmInfoRecord {
  char cameraID[32];   //������
  char alarmTime[20];  //��բʱ��     ��ʽ��2018/3/6    16:38:20
  unsigned char alarmDeviceType;  //��բ�豸���ͣ�0���̵��� 1��Τ���豸
  char resv[3];                   //����
  char personID[20];              //��Աid��������բ����Աid
  unsigned int
      alarmDeviceId;  //��բ�豸id����������Ϊ�̵���ʱ������IDΪGPIO�˿ںš���������Ϊ֧��Τ��Э����豸ʱ������IDΪ���š�
};

//��բ���󣬵������������ģʽʱ����Ҫ��բʱ����ƽ̨���͸�����
struct AlarmRequest {
  char cameraID[32];     //������
  char personID[20];     //��Աid����Ҫ��բ����Աid
  char requestTime[20];  //����ʱ��     ��ʽ��2018/3/6    16:38:20
  unsigned char alarmDeviceType;  //����Ŀ�բ�豸���ͣ�0���̵��� 1��Τ���豸
  unsigned char alarmDeviceState;  //��ǰ��բ�豸״̬��0��δ���� 1������
  char resv[2];                    //����
  unsigned int
      alarmDeviceId;  //��բ�豸id����������Ϊ�̵���ʱ������IDΪGPIO�˿ںš���������Ϊ֧��Τ��Э����豸ʱ������IDΪ���š�
};

struct IDCardRecord
{
	unsigned int sequence;               //ʶ���±�
	int	tvsec; 							//ץ������
	int	matched;							//�ȶԽ����0��δ�ȶԡ�-1���ȶ�ʧ�ܡ�����0��ȡֵ���ȶԳɹ�ʱ��ȷ�Ŷȷ�����100���ƣ�
	int	hat;									//�Ƿ��ñ��hat -1 ��ʾû�м�⣬ 0��ʾû�� 1��ʾ��
	char idcard[18];				//���֤��
	char name[20];							//����
	char gender[8];						//�Ա�
	char national[256];						//����
	char addr[256];						//��ַ
	char birthday[8];					//����19900101
	char maker[256];				//ǩ������
	char startdate[8];				//20110520��Ч���޿�ʼ
	char enddate[8];				// "20210520", ��Ч���޽���
	int	 imglen;					// 10240, //ͼƬ����
	unsigned char *imgdata;       // "imgdata"    bmp ͼƬ�ĵ�ַ
	int	  faceimglen;				///ץ��ͼƬ����
	unsigned char *faceimgdata;		//ץ��ͼƬ����(jpeg base64����)
};

struct WGAlarmRecord
{
	int wg_id;					//Τ����
	int wg_type;				//Τ��Э��
};

struct DeviceKey
{
	int status;  //0�����ü��ܣ�1�������ü���
	char old_pass[256];  //ԭ��Կ
	char new_pass[256];  //����Կ
	DeviceKey(){
		memset(this, 0, sizeof(DeviceKey));
	}
};

const unsigned int cui_sectimeslot_num = 10;		//һ���ͨ��ʱ�������
const unsigned int cui_traveldayslot_num = 30;		//һ��Ľڼ�������
const unsigned int cui_userrights_num = 5;

//��ʼ/��������
typedef struct DayTimeSlot {

	int s_day;				//2019/10/01 ��ֵΪ 20191001
	int e_day;
} DayTimeSlot;

//��ʼ/����������һ���ڣ�
typedef struct SecTimeSlot {

	int s_sec;				//��ʼ����(һ����)
	int e_sec;
} SecTimeSlot;

//ͨ��ʱ������
typedef struct SecTimeSlots {
	SecTimeSlot st_slot[cui_sectimeslot_num];
} SecTimeSlots;

//����ʱ������
typedef struct DayTimeSlots {
	int			n_enable;		//�ڼ����Ƿ��ֹͨ��
	DayTimeSlot dt_slot[cui_traveldayslot_num];
} DayTimeSlots;

//�û�Ȩ������
typedef struct UserRightsCfg {
	char		   name[32];		//Ȩ������
	SecTimeSlots st_slots[7];		//һ������ ÿ�ܵĵ�һ�� ������ ��st_slots[0]������
	DayTimeSlots dt_slots;		//����ʱ���
	UserRightsCfg(){
		memset(this, 0, sizeof(UserRightsCfg));
	}
} UserRightsCfg;

//�û�Ȩ������
typedef struct UserRightsCfgs {
	UserRightsCfg user_rights[cui_userrights_num];
} UserRightsCfgs;

typedef struct Group_Rec {
	int status;  //�Ƿ����� 0 ������
	int per_num;  //��Ҫ����
	int time; //����ʱ��
} Group_Rec;

struct MQTT_Config_crt
{
	int tls_typ;  //[int]  0:��ʹ��tls��֤�� 1��������֤��
	int tls_set; ///[out]tls����״̬   ** -2 - ֤�鲻���� ** -1 - ֤�����   **  0 - Ĭ��ֵ��δ����֤����֤  **  1 - ֤�����óɹ�   ֻ���ڻ�ȡ����ʱ����
};
struct MQTT_Config
{
	int enable; //�Ƿ�����  1 ����
	char hostname[16]; //host   ��ʹ������ ��ʹ��MQTT_ConfigEx
	int port;  //�˿�
	char user[64];  //�û���
	char passwd[64];  //����

	int  status;   //����״̬ ֻ���ڻ�ȡ����ʱ����
	MQTT_Config_crt crt_config;
};
struct MQTT_ConfigEx
{
	int enable; //�Ƿ�����  1 ����
	char hostname[64]; //host
	int port;  //�˿�
	char user[64];  //�û���
	char passwd[64];  //����

	int  status;   //����״̬ ֻ���ڻ�ȡ����ʱ����
	MQTT_Config_crt crt_config;
};
struct Reboot_info
{
	char info[100][20];   //���100�� 
};

struct WDR_time_ctrl
{
	//
	int model;
	//��ʼʱ��
	int start_time;
	//����ʱ��
	int end_time;
};
#endif /* CONFIG_GW_H_ */

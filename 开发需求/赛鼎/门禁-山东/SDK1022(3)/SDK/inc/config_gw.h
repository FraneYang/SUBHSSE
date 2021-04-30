/*
 * config_gw.h
 *
 *  Created on: 2014年7月4日
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

//人员查询条件标记
typedef enum {
  //通过ID查询
  QUERY_BY_ID = 0x1,

  //通过姓名查询
  QUERY_BY_NAME = 0x2,

  //通过韦根卡号查询
  QUERY_BY_WGNO = 0x4,

  //通过有效期截止时间范围查询
  QUERY_BY_EFFECT_TIME = 0x8,

  //通过有效期起始时间范围查询
  QUERY_BY_EFFECT_START_TIME = 0x10
} ConditionFlag;

// 记录查询条件标记。
enum RecordQueryFlag {
  /*! 通过抓拍时间范围查询。 */
  RECORD_QUERY_FLAG_TIME = 0x1,

  /*! 通过比对分数范围查询。 */
  RECORD_QUERY_FLAG_SCORE = 0x1 << 1,

  /*! 通过性别查询。 */
  RECORD_QUERY_FLAG_SEX = 0x1 << 2,

  /*! 通过年龄范围查询。 */
  RECORD_QUERY_FLAG_AGE = 0x1 << 3,

  /*! 通过比上的人员id查询。 */
  RECORD_QUERY_FLAG_ID = 0x1 << 4,

  /*! 通过比上的人员姓名查询。 */
  RECORD_QUERY_FLAG_NAME = 0x1 << 5,

  /*! 通过抓拍图像的人像质量范围查询。 */
  RECORD_QUERY_FLAG_QVALUE = 0x1 << 6,

  /*! 通过记录上传状态查询。 */
  RECORD_QUERY_FLAG_UPLOAD = 0x1 << 7,

  /*! 通过记录数据库编号查询。 */
  RECORD_QUERY_FLAG_SEQUENCE = 0x1 << 8
};

//人员查询条件标记
typedef enum {
  //精确查询
  QUERY_EXACT = 0x0,

  //模糊查询
  QUERY_FUZZY = 0x1
} QueryMode;

/// gpio输入方式。
enum GpioInType {
  /*! 韦根26协议。 */
  IN_STATE_WG26 = 0,

  /*! 韦根34协议。 */
  IN_STATE_WG34 = 1,

  /*! IO输入方式。 */
  IN_STATE_IO = 255
};

/// 图片形式。
typedef enum {
  /*! 未初始化数据输出模式。 */
  IMAGE_FORM_NULL = 0,

  /*! 全景。 */
  IMAGE_FORM_OVERALL = 0x1,

  /*! 特写。 */
  IMAGE_FORM_CLOSEUP = 0x1 << 1,

  /*! 全景+特写。 */
  IMAGE_FORM_BOTH = IMAGE_FORM_OVERALL | IMAGE_FORM_CLOSEUP
} ImageForm;

/// 输出选项。
enum OutputOption {
  /*! 选项为空。 */
  OUTPUT_OPTION_NULL = 0,

  /*! 全景图。 */
  OUTPUT_OPTION_OVERALL = IMAGE_FORM_OVERALL,

  /*! 特写图。 */
  OUTPUT_OPTION_CLOSEUP = IMAGE_FORM_CLOSEUP,

  /*! 比对原型图。 */
  OUTPUT_OPTION_PROTOTYPE = 0x1 << 2,

  /*! 特征数据。 */
  OUTPUT_OPTION_FEATURE = 0x1 << 3,

  /*! 调试图像(用于算法调试)*/
  OUTPUT_OPTION_TWIST_IMAGE = 0x1 << 4
};

/// 人脸功能选项。
enum FuncOption {
  /*! 除抓拍功能（必不可少）外的无其它功能选项。 */
  FUNC_OPTION_NULL = 0,

  /*! 人脸比对。 */
  FUNC_OPTION_MATCH = 0x1,

  /*! 年龄检测。 */
  FUNC_OPTION_AGE = 0x1 << 1,

  /*! 性别检测。 */
  FUNC_OPTION_SEX = 0x1 << 2,

  /*! 表情检测。 */
  FUNC_OPTION_EMOTION = 0x1 << 3,

  /*! 肤色检测。 */
  FUNC_OPTION_SKIN = 0x1 << 4,

  /*! 活体检测。 */
  FUNC_OPTION_ALIVE = 0x1 << 5
};

/// 数据上传模式。
typedef enum  {
  /*! 未初始化。 */
  UPLOAD_MODE_NULL = 0,

  /*! TCP协议上传。 */
  UPLOAD_MODE_TCP = 1,

  /*! FTP协议上传。 */
  UPLOAD_MODE_FTP = 2,

  /*! HTTP协议上传。 */
  UPLOAD_MODE_HTTP = 3
} UploadMode;

/// 数据上传模式。
typedef enum  UPLOAD_MODE{
	/*! 未初始化。 */
	UPLOADMODE_NULL = 0,

	/*! TCP协议上传。 */
	UPLOADMODE_TCP = 1,

	/*! FTP协议上传。 */
	UPLOADMODE_FTP = 2,

	/*! HTTP协议上传。 */
	UPLOADMODE_HTTP = 3
} ;


/// 韦根协议类型。
typedef enum {
  WG26 = 0,

  WG34 = 1,

  WG36 = 2,

  WG44 = 3
} WiegandType;

typedef enum {
  //无任何操作
  HA_SYNC_NONE = 0,

  //删除人员信息
  HA_FACE_ADD = 1,

  //修改人员信息
  HA_FACE_UPDATE = 2,

  //删除人员信息
  HA_FACE_DEL = 3
} FaceSyncMode;

#define PTZ_CTRL_ZOOM_IN 5   /*! 变倍（放大）*/
#define PTZ_CTRL_ZOOM_OUT 6  /*! 变倍（缩小）*/
#define PTZ_CTRL_FOCUS_IN 7  /*! 聚焦（拉近）*/
#define PTZ_CTRL_FOCUS_OUT 8 /*! 聚焦（拉远）*/

#define PTZ_MODE_ONCE 1  /*! 一次运动*/
#define PTZ_MODE_START 2 /*! 启动*/
#define PTZ_MODE_STOP 3  /*! 停止*/

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

/******* 控制系统工作时间及其校验与默认设置 ********/

struct config_worktime {
  unsigned char start_hour;
  unsigned char start_min;
  unsigned char end_hour;
  unsigned char end_min;
};

/****** 地址信息的配置、校验、重置  ******/

struct config_addr {
  char device_id[32];
  char device_name[32];
  char addr_id[32];
  char addr_name[96];
  char direction_id[32];
  char direction_name[96];

  unsigned short lane_number;   /* 车道数目 */
  unsigned short lane_start_id; /* 车道起始编号 */

  unsigned char match_light[MAX_LANE_NUM]; /* 车道与车灯关联 */

  char master_mode;           /* 主检测模式 */
  char slave_mode;            /* 从检测模式 */
  char mode_change_threshold; /* 模式切换时阈值,
                                 设置主模式多少次未检测时切换到从模式 */

  unsigned char serial_index;
  int serial_baudrate;           // 波特率
  unsigned char serial_databit;  // 数据位
  unsigned char serial_parity;   // 是否开始校验
  unsigned char serial_stopbit;  // 停止位

  char resv[113];
};

/****** 线圈卡口的配置、校验、重置  ******/

/* 用来配置某个input io的具体属性 */
struct coil_io_attr {
  unsigned char group; /* 所属线圈的组号(车道号) < MAX_COIL_GROUP */
  unsigned char index; /* 属于该组线圈的第几个IO信号 0 or 1 */
  unsigned char count; /* 触发多少张 <= 2 */
  unsigned char
      match_light; /* 闪光灯关联，低四位每一位(=1)表示关联该路闪光灯 */
};

struct config_coil {
  int enable;
  unsigned int distance; /* 两线圈之间距离,单位cm 用来计算两个IO之间时间差 */
  struct coil_io_attr io_attr[MAX_INPUT_IO_NUM];

  char resv[64];
};

/****** 雷达卡口的配置、校验、重置 ******/

enum RADAR_TYPE {
  RADAR_TYPE_NONE = 0,
  RADAR_TYPE_CSRIN = 1,
  RADAR_TYPE_CSRIN_M = 2
};

struct config_radar {
  int enable;

  enum RADAR_TYPE type;

  /* 总共有多少个雷达 */
  unsigned int count;

  /* 雷达与车道匹配，如match_lane[0] = 2，就表示第一个雷达对应车道2 */
  unsigned char match_lane[MAX_RADAR_NUM];

  /* 雷达与闪光灯匹配，match_light的下标n加上1表示雷达序号（从1开始）
   * match_light[n]所对应的值表示所对应的闪光灯
   * 0x1 0x2 0x4 0x8 分别表示 1、2、3、4路闪光灯 0x3则表示1、2路同时闪
   * 0x0表示不闪灯
   */
  unsigned char match_light[MAX_RADAR_NUM];

  /* 是否将雷达数据记录到日志(通过网络发送) */
  int enable_log;

  char resv[64];
};

/****** 视频卡口参数的配置、校验、重置******/

enum CALC_LANENO_METHOD {
  LEFT_TO_RIGHT,  // 画面最左边作为起始车道1
  RIGHT_TO_LEFT
};

/****** 视频卡口参数的配置、校验、重置******/

enum vdetect_type {
  VDETECT_TYPE_RECO, /* 使用车牌识别检测车辆 */
  VDETECT_TYPE_DET,  /* 使用视频检测检测车辆 */
  VDETECT_TYPE_BOTH  /* 以上两个同时使用 */
};

struct config_vdetect {
  int enable; /* 视频检测使能 */

  enum vdetect_type type;

  int flash;                       /* 视频触发闪光 */
  int motion;                      /* 运动检测 */
  int diff;                        /* 差分使能 */
  struct config_rect detect_area;  /* 视频检测区域 */
  struct config_rect virtual_coil; /* 虚拟线圈，触发区域 */

  int night_threshold; /* 白天晚上亮度 阈值 */
  int rsv2;

  unsigned skip; /* 跳帧数，车辆触发以后跳过多少帧不检测 */
  unsigned cut;  /* 上沿切割像素 */
  unsigned min_size;
  unsigned max_size;
  unsigned resize;
  float step;

  int debug;     /* 调试开关，控制是否传输调试图像 */
  int draw_coil; /* 将虚拟线圈绘制在调试图像上 */
  int draw_area; /* 将检测到的车辆区域绘制在调试图像上 */

  enum CALC_LANENO_METHOD m;

  /* 与闪光灯匹配，match_light的下标n加上1表示雷达序号（从1开始）
   * match_light[n]所对应的值表示所对应的闪光灯
   * 0x1 0x2 0x4 0x8 分别表示 1、2、3、4路闪光灯 0x3则表示1、2路同时闪
   * 0x0表示不闪灯
   */
  unsigned char match_light[MAX_LANE_NUM];

  struct config_point virtual_coil_polygon[4];

  char resv[40];
};

/****** 人脸检测参数的配置、校验、重置 ******/
struct config_face_detect {
  int enable;
  int debug;                      /* 是否发送调试图像等 */
  struct config_rect detect_area; /* 从原图上取一部分进行检测 */
  struct config_size minsize; /* 指定检测图上人脸所占像素范围 */
  struct config_size maxsize;
  float step; /* 每次检测步进比例 */

  float ratio;       // 从原来预留的64字节中取出一点
  unsigned interval; /* 跳帧数 */

  unsigned use_motion; /* 使用运动检测进行抓拍 */

  unsigned face_step; /* 在运动检测的基础上,隔多少次检测一次人脸 */

  char resv[48]; /* 预留 */
};

/* 根据颜色过滤车牌 */
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

//声音文件
typedef enum {
	VOL_TYPE_SUCESS = 1,	//成功提示音
	VOL_TYPE_FAILURE,  //失败提示音
	VOL_TYPE_RESWIPEIDCARD, //请重刷身份证
	VOL_TYPE_DEADLINE, //权限已过期
	VOL_TYPE_WELCOME,//开机语音
	VOL_TYPE_SAFEHAT,//未带安全帽禁止通行
	VOL_TYPE_OUTTIME,//未在有效时段
	VOL_TYPE_BLACK,  //黑名单语音
} VOL_TYPE;


/****** 识别参数的配置、校验、重置 ******/
struct config_reco {
  int enable;
  float ratio;
  char province[16];

  unsigned short min_width;
  unsigned short max_width;

  struct config_rect reco_area[MAX_LANE_NUM];

  int draw_reco_area; /* 在识别结果上画出识别区域 */

  unsigned int filter_color;
  unsigned int filter_num;

  unsigned short same_plate_report_time;  //相同车牌上报间隔，单位:秒

  unsigned char draw_reco_area_video;

  unsigned char reco_mode;  // 0,1为正常角度，2为自动，3为大角度

  char resv[48];
};

/****** 特殊需求的配置、校验、重置 */

enum PLATE_FILTER_TYPE {
  PLATE_FILTER_TYPE_NONE = 0,
  //  DROP_NO_PLATE,
  //  ONLY_KEEP_BLUE,
  //  ONLY_KEEP_YELLOW,
  //  DROP_YELLOW,
  //  DROP_BLUE
};

struct config_special {
  int merge_two;                       /* 当结果有两张时进行合并 */
  int keep_one;                        /* 没超速只保留一张图片 */
  enum PLATE_FILTER_TYPE plate_filter; /* 过滤特定条件的车牌 */

  char resv[32];
};

/****** 限速与抓拍相关的配置、校验、重置  ******/

struct config_limit_speed {
  /* 抓拍张数与抓拍间隔 */
  unsigned short capture_count;
  unsigned short overspeed_count;
  unsigned int interval;

  unsigned short lspeed[MAX_LANE_NUM];   // 车道标定限速值
  unsigned short rlspeed[MAX_LANE_NUM];  // 超速处理的限速值

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

struct CONF_OSD  // 文字叠加
{
  unsigned short imgStartX;  // 文字起始位置X坐标
  unsigned short imgStartY;  // 文字起始位置Y坐标

  // ToDo: add for single and composed image
  unsigned char imgFontSize;      // 文字大小
  unsigned char imgFontColor[3];  // 文字颜色（RGB）

  char imgOSDRules[512];  // utf-8

  char resv[16];  // 保留
};

struct lamp_area {
  int lamp_num;  // 2灯or3灯

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
  unsigned char offline;  // 1为离线，0为在线, 2为自动（即脱机检查）
  unsigned char alarm_out_mode;         // 0为白名单开，1为过车开
  unsigned char transfer_offline_data;  //上传离线数据
  unsigned char
      diable_serial_output;  //中断/恢复原本设备控制的串口输出，透明串口输出不在此控制

  unsigned char same_count;  // 模糊匹配车牌阀值
  unsigned char min_volume;  //最小音量
  unsigned char max_volume;  //最大音量
  unsigned char cur_volume;  //当前音量

  unsigned char light;

  unsigned char drive_direct;  // 0:全抓, 1:只抓车头，2只抓车尾

  unsigned char ctrl_light_mode;  // 0常亮，1智能控灯使能，2常闭，3线圈闪光模式
  unsigned char day_brightness;     //白天亮度阀值
  unsigned short alarmOutDuration;  //自动开闸时间间隔(500-5000ms)
  unsigned char disable_io_port;    //中断GPIO控制
  unsigned char disable_io_output;  //中断/恢复原本设备控制的继电器、电平输出
  unsigned char gpio_in;          // GPIO IN使能，bit[7-0]对应gpio[7-0]
  unsigned char gpio_out;         // GPIO OUT使能，bit[7-0]对应gpio[7-0]
  unsigned char flash_sync_out1;  //同步输出out2
  unsigned char reboot_flag;      // 0-每天自动重启，1-重不重启
  unsigned char resv[16];         //备用
};

/****** 卡口整体配置  ******/

/*
 * @brief   magic_number    配置修改记录
 *      3   2014-10-22 添加人脸检测相关参数, 每个配置预留空间
 *      4   2014-12-09 添加视频卡口检测相关参数
 *      5   2015-01-07 卡口添加白天晚上阈值, 调试图像协议进行了微调
 *      6   2015-01-21 在识别的配置中添加车牌颜色过滤和车牌号码过滤
 *      7   2015-06-16 加入行人闯红灯配置
 */
// static const int magic_number = 7;

//是否交替控灯
struct config_carbinet_inturn_control {
  int isEnable;  //是否有效 0无效 1有效
  char ip[64];   // IP地址
};
struct MessageCarPortState {
  int carPortState;            //状态 0 无车 1有车 2 压线 3 特殊车位
  int lightColor;              //颜色
  int laneNum;                 //当前有几根车道
  int hasCar[MAX_LANE_NUM];    //每个位置是否有车
  int hasPlate[MAX_LANE_NUM];  //是否有车牌
  char plate[MAX_LANE_NUM][16];  //车牌号码
};

//车位信息
struct config_carbinet {
  int isSpecial;  //是否特殊车位 0一般车位 1特殊车位
  int portNum;    //车位号
};

//车位状态信息
struct config_carbinet_state {
  int isEnable;    //是否有效  0无效 1有效
  int isFlicker;   //是否闪烁  0不闪 1闪
  int lightColor;  //灯的颜色 0灭 1红 2绿 3黄 4蓝色 5品红 6青 7白
};

//车位相机算法配置
struct config_carbinet_vdetect {
  config_point inventedRoi[MAX_LANE_NUM][4];  //虚拟线圈
};

//车位相机整体配置信息
struct config_gw_car_port {
  //控灯模式  1内置灯 2 外置灯 3 内加外
  int lightControlMode;
  //交替控灯
  struct config_carbinet_inturn_control inturnControl;
  //车位状态配置
  struct config_carbinet_state carbinetState[MAX_CABINET_STATE];
  //车位配置信息
  struct config_carbinet carbinet[MAX_LANE_NUM];
  //车位相机算法配置
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
  char ip[20];  //本机组网的相辅ip

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
  struct config_gw_park park;        // 停车场相关配置
  struct config_gw_car_port carpos;  // 车位相机相关配置
  struct config_http http;
  struct config_device_group device_group;
};

/****** 临时选项的配置 ******/
struct CONF_TEMP {
  char enableLiveImage;  // 实时图像开关
  char resv[124];

  char authKey[128];    // 机器码（字符串型）
  char authValue[256];  // 授权码（字符串型）
  int authResult;       // 授权认证结果(AUTH_RESULT)
};

struct RPlate {
  char plate[16];
  int plateColor;  // 0-蓝色 1-黑色 2-黄色 3-白色 4-绿色 5-红色 6-灰色
                   // 7-紫色(KISE)
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

/// 服务参数（8字节）。
struct ServiceParam {
  /*! 服务端口(只读 )。 */
  unsigned short port;

  /*! 最大客户端连接数，当前不生效。 */
  unsigned char max_clients;

  /*! 心跳超时时间，当前不生效。 */
  unsigned char heart_timeout;

  /*! 保留字段。 */
  unsigned char resv[4];
};

/// 相机参数(512字节)。
struct CameraParam {
  /*! 相机流名称。 */
  char stream_url[128];

  /*! 相机流端口。 */
  short stream_port;

  /*! 相机控制端口。 */
  short control_port;

  /*! 视频OSD，支持最多两行。 */
  char video_osd[2][96];

  /*! 帧率。 */
  char fps;

  /*! 饱和度。取值范围：1~255。 */
  unsigned char saturation;

  /*! 亮度。取值范围：1~100。 */
  unsigned char brightness;

  /*! 自动曝光使能开关。 */
  char enable_ae;

  /*! 最大曝光时间。单位：毫秒。取值范围：0~100。 */
  short max_exposure;

  /*! 最大增益。单位：DB。取值范围：0~40。 */
  short max_gain;

  /*! 对比度。取值范围：0~128。 */
  short contrast;

  /*! 码率。单位：kbps。 */
  unsigned short video_br;

  /*! 视频流图像宽度。 */
  unsigned short video_width;

  /*! 视频流图像高度。 */
  unsigned short video_height;

  /*! 视频流编码类型。1：H264，2：MJPEG。 */
  unsigned char video_enc_type;

  /*! 视频旋转角度 0:默认值 1：顺时针旋转90度 2：顺时针旋转180度
   * 3：顺时针旋转270度*/
  unsigned char video_rotate;

  /*! 外接显示屏标题osd*/
  char screen_osd_title[64];

  /*! 保留。 */
  char resv[106];
};

/// 服务（32字节）。
struct AppServicesParam {
  /*! 配置服务。 */
  struct ServiceParam config_service;

  /*! 查询服务。 */
  struct ServiceParam query_service;

  /*! 日志服务。 */
  struct ServiceParam log_service;

  /*! 保留。 */
  struct ServiceParam resv_service;
};

/// 设备描述信息参数（224字节）。
struct DescriptionParam {
  /*! 点位编号。 */
  char addr_id[32];

  /*! 点位名称。 */
  char addr_name[96];

  /*! 设备编号。 */
  char device_id[32];

  /*! 保留字段。 */
  char resv[64];
};

/// 系统应用私有参数。
struct AppPrivateParam {
  /*! 各系统自行定义。 */
  char resv[512];
};

/// TCP上传参数。
struct TcpClientParam {
  /*! 服务器IP地址。 */
  char ip[16];

  /*! 服务器端口。 */
  int port;

  /*! 使能开关（未使用，该字段仅为兼容旧协议而加入）。 */
  char enable;

  /*! 登录验证开关。 */
  unsigned char enable_verify;

  /*! 登录验证用户名。 */
  char user_name[16];

  /*! 登录验证密码。 */
  char passwd[17];

  /*! 保留字段。 */
  char resv[65];
};

/// 穿透外网配置
struct ExtranetParam {
  /*! 以TCP客户端方式直达外网。 */
  struct TcpClientParam client;

  /*! 使能开关。 */
  char enable;

  /*! 保留。 */
  char resv[7];
};

/// 服务认证参数（48字节）
struct AuthParam {
  /*! 服务认证开关 */
  unsigned char enable;

  /*! 登录验证用户名。 */
  char user_name[16];

  /*! 登录验证密码。 */
  char passwd[17];

  /*! 保留字段。 */
  char resv[14];
};

/// 应用程序通用参数(512字节)。
struct AppCommonParam {
  struct AppServicesParam services;     //--------|-32字节--|
  struct DescriptionParam description;  //-----|-224字节-|
  struct ExtranetParam extranet;        //-----------|-128字节--|
  struct AuthParam auth;                //---------|-48字节--|

  /*! 保留字段。 */
  char resv[80];  //-------------------------|-80字节-|
};

// 平台参数。

/// 服务(16字节)。
struct PlatformServicesParam {
  /*! 配置服务参数。 */
  struct ServiceParam config_service;

  /*! 流服务配置参数。 */
  struct ServiceParam stream_service;
};

/// 临时参数（32字节），应用程序重启后将失效。
struct TemporaryParam {
  /*! 开关视频流。 */
  char enable_video;

  /*! 各系统自行定义。 */
  char resv[27];
};

/// 平台参数(640字节)。
struct PlatformParam {
  /*! 服务。 */
  struct PlatformServicesParam services;

  /*! 相机。 */
  struct CameraParam camera;

  /*! 各平台可自行定义。 */
  char resv[112];
};

/// 流参数(64字节)。
struct StreamParam {
  /*! 视频流或JPEG流@ref ImageFormat 。 */
  int video_format;

  /*! 保留。 */
  char resv[60];
};

/// 应用程序参数(1024字节)。
struct AppParam {
  /*! 各应用程序公用参数。 */
  struct AppCommonParam common;

  /*! 私有参数。 */
  struct AppPrivateParam priv;
};

/// FTP上传参数。
struct FtpClientParam {
  /*! 服务器IP地址。 */
  char ip[16];

  /*! 服务器端口。 */
  int port;

  /*! 登录用户名。 */
  char user[15];

  /*! 登录密码。 */
  char password[15];

  /*! 上传目录。 */
  char pattern[70];
};

/// HTTP上传参数。
struct HttpClientParam {
  /*! 服务器IP地址。 */
  char ip[16];

  /*! 服务器端口。 */
  unsigned short port;

  /*! 服务URL。 */
  char url[102];
};

/// 连接参数。
struct ClientParam {
  /*! 模式@ref UploadMode 。 */
  char mode; /*0 未初始化。 1 TCP协议上传。 2 FTP协议上传。 3 HTTP协议上传。*/
  /*! 保留。 */
  char resv[3];
  /*! 服务器。 */
  union {
    FtpClientParam ftp;
    TcpClientParam tcp;
    HttpClientParam http;
  };
};

// 数据传输。

/// 上传参数。
struct UploaderParam {
  /*! 保留字段。 */
  char resv[4];

  /*! 客户端连接参数。 */
  struct ClientParam client;
};

/// 输出参数。大小应固定为128字节。
struct OutputerParam {
  struct UploaderParam uploader;
};

/// 子系统参数。
struct FaceSystemConfig {
  struct TemporaryParam temp;     //------28字节
  struct PlatformParam platform;  //---640字节
  struct StreamParam stream;      //---64字节
  struct AppParam app;            //-------------1024字节
  struct OutputerParam outputer;  //---128字节
};

/// 坐标点定义。
struct Point {
  int x;
  int y;
};

/// 坐标点定义。
struct HA_Point {
  int x;
  int y;
};
struct ZBX_Point {
  int x;
  int y;
};
struct FacePrivateParam {
  /*! 检测跟踪区域边数。 */
  char roi_border_num;

  /*! 比对开关。取值为0时关闭，其它取值打开。 */
  char enable_match;

  /*! 调试开关。 */
  char enable_debug;

  /*! 深度去重复开关。1：开 0：关。 */
  char enable_dereplication;

  /*!
   * 重复超时。超时将不再视为重复。仅在开启去重复时有效。单位：秒。取值范围：1~60。
   */
  char replication_timeout;

  /*!
   * 重复输出间隔。对于同一人员，上报人脸结果时间间隔。单位：秒。取值范围：1~120。
   */
  char replication_interval;

  /*! 输出图像品质。 */
  char quality;

  /*! 名单过期自动清理功能开关。 */
  char enable_auto_clean;

  /*! 输出控制。 */
  int output_form;

  /*! 比对满分相似度值。取值范围：0.2~1.0。相似度达到该值时确信度为满分。 */
  float full_credit;

  /*! 相似度达到该值时认为比对成功（100分制）。 */
  short match_score;

  /*! 白名单GPIO输出开关（端口1）。1：开 0：关 */
  char gpio_enable_white;

  /*! 黑名单GPIO输出开关（端口2）。1：开 0：关 */
  char gpio_enable_black;

  /*! 暂未定义GPIO输出开关（端口3）。1：开 0：关 */
  char gpio_enable_resv;

  unsigned char serial_send_flag;
  unsigned char serial_databit[2];  // 数据位
  unsigned char serial_parity[2];   // 是否开始校验
  unsigned char serial_stopbit[2];  // 停止位
  int serial_baudrate[2];           // 波特率

  /*! 补光灯工作模式。1：常亮 2：自动控制 3：常闭。 */
  unsigned char light_mode;

  /*! 补光灯亮度等级(1~100)。 */
  unsigned char light_level;

  /*! 亮灯门限。画面亮度值低于该值时亮灯。亮度取值范围：1~255。 */
  unsigned char light_threshold;

  /*! 音量取值范围：0~100。 */
  unsigned char audio_volume;

  /*! 字节对齐，保留。 */
  char resv2[2];

  /*! 闸机控制类型：0继电器， 1韦根。 */
  unsigned char gateway_control_type;

  /*! 继电器序号。 */
  unsigned char alarm_index;

  /*! 继电器自动闭合持续时间，单位ms(500-5000)。 */
  unsigned short alarm_duration;

  /*! 韦根类型，WG26,WG34, WG36, WG44。目前只支持WG26, WG34。 */
  unsigned char wiegand_type;

  /*! 发行码，wg36 wg44需要此字段 */
  unsigned char wiegand_dcode;

  /*! 韦根门禁公共卡号。 */
  unsigned int wiegand_public_cardid;

  /*! 自动升成卡号时，韦根卡号范围，最小值。 */
  unsigned int wiegand_card_id_min;

  /*! 自动升成卡号时，韦根卡号范围，最大值。 */
  unsigned int wiegand_card_id_max;

  /*! 工作模式（@ref WorkMode ）。 */
  unsigned char work_mode;

  /*! 继电器状态，0表示常闭合 1表示常断开*/
  unsigned char gpio_state;

  /*! 无感录入（聚类）开关 */
  unsigned char cluster_enable;

  /*! 同一聚类通过的最大次数，当同一聚类通过的次数大于等于该次数时自动注册 */
  unsigned char max_pass_times;

  /*! 计算次数的时间间隔，在该时间间隔内只算通过一次 单位 秒*/
  unsigned int calc_times_interval;

  /*! 抓拍记录开关 0:关 !0:开*/
  char record_enable;

  /*! 断点续传开关，自动上传离线数据 */
  char record_resume_enable;

  /*! 保留*/
  char resv4[2];

  /*! gpio输入类型， 255就表示gpio 0表示wg26 1表示wg34*/
  int gpio_input_type;

  /*! gpio输入开关，0关，!0开*/
  char gpio_input_enable;

  /*! 保留。 */
  char resv3[51];

  /*! 检测跟踪区域坐标点。顺次连接构成检测跟踪区域。 */
  struct Point roi[6];

  /*! 人脸检测最小人脸尺寸 */
  short min_face_size;

  /*! 串口配置服务开关，0：关 非0：开*/
  char serial_config_enable[2];

  /*! 大角度人脸过滤开关*/
  char valid_angle_enable;

  /*! 过滤人脸的最大角度，暂未使用*/
  char valid_angle;

  /*! 保留。 */
  char resv[310];

  /*! 配对相机IP。 */
  char pair_ip[16];

  /*! 是否启用配对。 */
  unsigned char enable_pair;

  /*! 配对相机开闸间隔。单位：秒。 */
  unsigned char pair_timeout;

  /*! 保留字段2。 */
  unsigned char resv1[2];
};

struct FtpInfo {
  char user_name[15];  //用户名
  char passwd[15];     //密码
  char path[70];       //路径
  char resv[2];        //空闲
};
struct FaceAppParam {
  char dev_no[32];                    //设备编号
  char point_no[32];                  //点位编号
  char point_name[96];                //点位名称
  char resv1[32];                     //保留字段1
  unsigned char heart_beat_interval;  //心跳时间间隔
  char extranet_enale;                //外网控制开关
  unsigned short extranet_port;       //外网控制服务器端口
  char extranet_ip[16];               //外网控制服务器ip
  unsigned char
      verify_enable;  //开启登录验证后，客户端在与服务器建立连接后将自动发送登录验证请求。注：抓拍机作为客户端。1：开启登录验证
                      // 0：关闭登录验证
  char user_name[15];       //登录验证用户名
  char passwd[16];          //登录验证密码
  unsigned char resv2[12];  //保留字段2
  unsigned short
      upload_mode;  //数据上传方式0：关闭上传 1：TCP方式 2：FTP方式 3：HTTP方式
  unsigned short upload_port;  //服务器端口
  char upload_ip[16];          //服务器IP

  union {
    char upload_url[102];     //抓拍数据服务URL(http上传方式时有效)
    struct FtpInfo ftp_info;  // ftp上传参数信息(ftp上传时有效);
    char tcp_resv[102];       // tcp上传方式的保留字段
    char other_resv[102];     //其它上传方式保留字段
  } upload_info;              //上传方式打开时，此结构可用

  unsigned char cam_mode;  //相机工作模式。1：自动模式 2：在线模式 3：离线模式
  char resv3[17];              //保留字段3
  int match_enable;            //比对开关
  int match_score;             //比对确信分数
  int dereplication_enable;    //重复过滤开关
  int dereplication_interval;  //重复超时/输出间隔时间
  unsigned short output_mode;  //图像输出形式
  char resv4[256];             //保留字段4
};

struct QueryCondition {
  char faceID[20];          //人员ID
  char faceName[16];        //人员姓名
  unsigned int wgCardNO;    //韦根协议门禁卡号
  unsigned int timeStart;   //有效期截止时间的查询起点
  unsigned int timeEnd;     //有效期截止d时间的查询终点
  unsigned int time1Start;  //有效期起始时间的查询起点
  unsigned int time1End;    //有效期起始时间的查询终点
  unsigned char resv[256];
};

/// 抓拍记录查询条件
struct RecordCondition {
  // 抓拍图像数据标记 0：不需要，非0：需要。
  char img_flag;

  // 注册图像数据标记 0：不需要，非0：需要。
  char reg_img_flag;

  // 保留 以0填充
  char resv1[2];

  // 匹配模式，0精确匹配，非0模糊匹配
  unsigned short query_mode;

  // 条件组合标记
  unsigned short condition_flag;

  // 抓拍时间区间起点
  unsigned int time_start;

  // 抓拍时间区间终点
  unsigned int time_end;

  // 比对分数区间起点
  short score_start;

  // 比对分数区间终点
  short score_end;

  // 性别
  unsigned char sex;

  // 年龄区间起点
  unsigned char age_start;

  // 年龄区间终点
  unsigned char age_end;

  // 保留 以0填充
  char resv2[17];

  // 比对上的人员ID
  char person_id[20];

  // 比对上的人员姓名
  char person_name[16];

  // 人像质量区间起点
  unsigned char qvalue_start;

  // 人像质量区间终点
  unsigned char qvalue_end;

  // 是否已经上传 1:表示已经上传 -1：表示未上传
  char upload_state;

  // 保留 以0填充
  char resv3[65];
};

struct SnapshotImage {
  // 快照时间戳 秒
  unsigned int timeStamp_s;

  // 快照时间戳 毫秒
  unsigned int timeStamp_u;

  // 快照图像长度
  int snapImageSize;

  // 快照图像
  unsigned char *snapImage;
};

//开闸纪录，相机开闸后上报的开闸纪录
struct AlarmInfoRecord {
  char cameraID[32];   //相机编号
  char alarmTime[20];  //开闸时间     格式：2018/3/6    16:38:20
  unsigned char alarmDeviceType;  //开闸设备类型，0：继电器 1：韦根设备
  char resv[3];                   //保留
  char personID[20];              //人员id，报警开闸的人员id
  unsigned int
      alarmDeviceId;  //开闸设备id，外设类型为继电器时，外设ID为GPIO端口号。外设类型为支持韦根协议的设备时，外设ID为卡号。
};

//开闸请求，当相机处于在线模式时，需要开闸时会向平台发送该请求
struct AlarmRequest {
  char cameraID[32];     //相机编号
  char personID[20];     //人员id，需要开闸的人员id
  char requestTime[20];  //请求时间     格式：2018/3/6    16:38:20
  unsigned char alarmDeviceType;  //请求的开闸设备类型，0：继电器 1：韦根设备
  unsigned char alarmDeviceState;  //当前开闸设备状态，0：未启用 1：启用
  char resv[2];                    //保留
  unsigned int
      alarmDeviceId;  //开闸设备id，外设类型为继电器时，外设ID为GPIO端口号。外设类型为支持韦根协议的设备时，外设ID为卡号。
};

struct IDCardRecord
{
	unsigned int sequence;               //识别下标
	int	tvsec; 							//抓拍秒数
	int	matched;							//比对结果，0：未比对。-1：比对失败。大于0的取值：比对成功时的确信度分数（100分制）
	int	hat;									//是否戴帽，hat -1 表示没有检测， 0表示没有 1表示有
	char idcard[18];				//身份证号
	char name[20];							//姓名
	char gender[8];						//性别
	char national[256];						//民族
	char addr[256];						//地址
	char birthday[8];					//生日19900101
	char maker[256];				//签发机关
	char startdate[8];				//20110520有效期限开始
	char enddate[8];				// "20210520", 有效期限结束
	int	 imglen;					// 10240, //图片长度
	unsigned char *imgdata;       // "imgdata"    bmp 图片的地址
	int	  faceimglen;				///抓拍图片长度
	unsigned char *faceimgdata;		//抓拍图片数据(jpeg base64编码)
};

struct WGAlarmRecord
{
	int wg_id;					//韦根号
	int wg_type;				//韦根协议
};

struct DeviceKey
{
	int status;  //0：启用加密，1：不启用加密
	char old_pass[256];  //原密钥
	char new_pass[256];  //新密钥
	DeviceKey(){
		memset(this, 0, sizeof(DeviceKey));
	}
};

const unsigned int cui_sectimeslot_num = 10;		//一天的通行时间段数量
const unsigned int cui_traveldayslot_num = 30;		//一年的节假日数量
const unsigned int cui_userrights_num = 5;

//开始/结束日期
typedef struct DayTimeSlot {

	int s_day;				//2019/10/01 则值为 20191001
	int e_day;
} DayTimeSlot;

//开始/结束秒数（一天内）
typedef struct SecTimeSlot {

	int s_sec;				//开始秒数(一天内)
	int e_sec;
} SecTimeSlot;

//通行时段数组
typedef struct SecTimeSlots {
	SecTimeSlot st_slot[cui_sectimeslot_num];
} SecTimeSlots;

//假日时段数组
typedef struct DayTimeSlots {
	int			n_enable;		//节假日是否禁止通行
	DayTimeSlot dt_slot[cui_traveldayslot_num];
} DayTimeSlots;

//用户权限配置
typedef struct UserRightsCfg {
	char		   name[32];		//权限名称
	SecTimeSlots st_slots[7];		//一周七天 每周的第一天 是周日 即st_slots[0]是周日
	DayTimeSlots dt_slots;		//假日时间段
	UserRightsCfg(){
		memset(this, 0, sizeof(UserRightsCfg));
	}
} UserRightsCfg;

//用户权限配置
typedef struct UserRightsCfgs {
	UserRightsCfg user_rights[cui_userrights_num];
} UserRightsCfgs;

typedef struct Group_Rec {
	int status;  //是否启用 0 不启用
	int per_num;  //需要人数
	int time; //限制时间
} Group_Rec;

struct MQTT_Config_crt
{
	int tls_typ;  //[int]  0:不使用tls验证； 1：单向认证；
	int tls_set; ///[out]tls设置状态   ** -2 - 证书不存在 ** -1 - 证书错误   **  0 - 默认值：未设置证书验证  **  1 - 证书设置成功   只有在获取配置时有用
};
struct MQTT_Config
{
	int enable; //是否启用  1 启动
	char hostname[16]; //host   如使用域名 请使用MQTT_ConfigEx
	int port;  //端口
	char user[64];  //用户名
	char passwd[64];  //密码

	int  status;   //链接状态 只有在获取配置时有用
	MQTT_Config_crt crt_config;
};
struct MQTT_ConfigEx
{
	int enable; //是否启用  1 启动
	char hostname[64]; //host
	int port;  //端口
	char user[64];  //用户名
	char passwd[64];  //密码

	int  status;   //链接状态 只有在获取配置时有用
	MQTT_Config_crt crt_config;
};
struct Reboot_info
{
	char info[100][20];   //最多100条 
};

struct WDR_time_ctrl
{
	//
	int model;
	//开始时间
	int start_time;
	//结束时间
	int end_time;
};
#endif /* CONFIG_GW_H_ */

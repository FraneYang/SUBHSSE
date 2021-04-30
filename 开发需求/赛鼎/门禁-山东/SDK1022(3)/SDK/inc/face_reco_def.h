#ifndef FACE_RECO_DEF_H
#define FACE_RECO_DEF_H

struct FaceRecoInfo {
  unsigned int sequence;  //抓拍序号，从1开始，每产生一组抓拍数据增加1。
  char camId[32];    //相机编号
  char posId[32];    //点位编号
  char posName[96];  //点位名称

  unsigned int
      tvSec;  //抓拍时间秒数，从1970年01月01日00时00分00秒至抓拍时间经过的秒数。
  unsigned int tvUsec;  //抓拍时间微秒数，tvSec的尾数

  
  short isRealtimeData;  //错误码 （主错误码+副错误码）

  short
      matched;  //比对结果，0：未比对。-1：比对失败。大于0的取值：比对成功时的确信度分数（100分制）。
  char matchPersonId[20];    //人员ID
  char matchPersonName[16];  //人员姓名
  int matchRole;  //人员角色，0：普通人员。 1：白名单人员。 2：黑名单人员

  int existImg;  //全景图，是否包含全景图像。0：不包含全景图像。非0：包含全景图像。
  char imgFormat[4];          //全景图像格式
  int imgLen;                 //全景图像大小
  unsigned short faceXInImg;  //人脸位于全景图像的X坐标。
  unsigned short faceYInImg;  //人脸位于全景图像的y坐标
  unsigned short faceWInImg;  //人脸位于全景图像宽度
  unsigned short faceHInImg;  //人脸位于全景图像高度

  int existFaceImg;  //人脸图，特写图像标志，是否包含特写图像。0：不包含特写图像。非0：包含特写图像。
  char faceImgFormat[4];          //人脸图像封装格式。
  int faceImgLen;                 //特写图像大小
  unsigned short faceXInFaceImg;  //人脸位于特写图像的X坐标。
  unsigned short faceYInFaceImg;  //人脸位于特写图像的y坐标。
  unsigned short faceWInFaceImg;  //人脸位于特写图像的宽度
  unsigned short faceHInFaceImg;  //人脸位于特写图像的高度

  int existVideo;  //是否包含视频。0：不包含视频。非0：包含视频。
  unsigned int videoStartSec;   //视频起始时间（秒）
  unsigned int videoStartUsec;  // videoStartSec尾数，微妙
  unsigned int videoEndSec;     //视频结束时间（秒）
  unsigned int videoEndUsec;    // videoEndSec尾数，微妙
  char videoFormat[4];          //视频封装格式。
  int videoLen;                 //视频大小

  unsigned char sex;         //性别 0: 无此信息 1：男 2：女
  unsigned char age;         //年龄 0: 无此信息 其它值：年龄
  unsigned char expression;  //表情 0: 无此信息 其它值：暂未定义
  unsigned char skinColour;  //肤色 0: 无此信息 其它值：暂未定义
  unsigned char qValue;  //注册标准分数，分数越高越适合用来注册
  char resv[123];        //保留 第一位 是否带帽子  从65到82 预留身份证号

  unsigned char *img;           //全景图像数据
  unsigned char *faceImg;       //特写图像数据
  unsigned char *video;         //视频数据
  int feature_size;             //当前抓拍人脸的特征数据大小
  float *feature;               //当前抓拍人脸的特征数据
  int modelFaceImgLen;          //模板人脸图像长度
  char modelFaceImgFmt[4];      //模板人脸图像类型
  unsigned char *modelFaceImg;  //模板人脸图像数据
};
struct FaceRecoInfo_Offline {
	FaceRecoInfo face_reco_info;
	int Surplus;  //剩余条数
};
//相机系统时间信息
struct SystemTime {
  char time_zone;  //时区
  char date[11];   //日期 2017/12/6（2017年12月6日）
  char time[9];    //时间   17:37:05
  char resv[11];   //保留
};

struct FaceFlags {
  char faceID[20];    //人员ID
  char faceName[16];  //人员姓名
  int role;  //人员角色，0：普通人员。 1：白名单人员。 2：黑名单人员。
             //-1：所有人员。
  unsigned int wgCardNO;  //韦根协议门禁卡号
  unsigned int
      effectTime;  //有效期截止时间，该人员信息在该时间内有效,从1970年1月1日0时0分0秒到截止时间的秒数（0xFFFFFFFF表示永久有效，0表示永久失效）
  unsigned int
      effectStartTime;  //有效期起始时间，该人员信息在该时间之后有效,从1970年1月1日0时0分0秒到起始时间的秒数（0表示未初始化）

  int usr_type;			////权限类型，取值 0 - 5，默认 0
  char resv[8184];  //前100字节预留身份证
};

struct FaceImage {
  int img_seq;         //图片编号
  int img_fmt;         //图片格式 0：jpg 1：bgr
  unsigned char *img;  //要注册的人脸图片数据，支持主流图像格式
  int img_len;         // img的长度
  int width;           //图像宽度，jpg图像不填此项
  int height;          //图像高度，jpg图像不填此项
};

struct ErrorFaceImage {
  int img_seq;   //注册失败的图像编号
  int err_code;  //失败的错误码
};

//人脸查询返回
struct QueryFaceFlags {
  char personID[20];         //人员ID
  char personName[16];       //姓名
  int featureSize;           //人脸特征数据大小
  float feature[2048];       //人脸特征数据
  int imgNum;                //图像数目
  int imgSize;               //图像大小
  unsigned char img[10240];  //图像数据
  char resv[16];
};

//人脸查询回调返回
struct QueryFaceInfo {
  int record_count;     //查询的角色记录总量
  int record_no;        //当前收到的记录序号
  char personID[20];    //人员ID
  char personName[16];  //姓名
  int role;  //人员角色 0：普通人员。 1：白名单人员。 2：黑名单人员。
             //-1：所有人员。
  short feature_count;  //当前id的特征数总量
  short feature_size;   //人脸特征数据长度
  float *
      feature;  //人脸特征数据，按顺序排列所有特征数据 featureSize*feature_count
  int imgNum;   //模板图像数量
  int imgSize[5];     //图像大小，imgSize[i]为第i张图片的大小
  char imgFmt[5][4];  //图像格式,imgFmt[i]为第i张图片的格式
  unsigned char *imgBuff[5];  // imgBuff[i]位第i张图片给数据首地址
  unsigned int wgCardNO;      //韦根门禁卡号
  unsigned int
      effectTime;  //有效期截止时间，该人员信息在该时间内有效,从1970年1月1日0时0分0秒到截止时间的秒数（0xFFFFFFFF表示永久有效，0表示永久失效）
  unsigned int
      effectStartTime;  //有效期起始时间，该人员信息在该时间之后有效,从1970年1月1日0时0分0秒到起始时间的秒数（0表示未初始化）
  int user_type;  //权限 0~5
};

/// 抓拍比对纪录。
struct RecordData {
  /*! 查询的角色记录总量 */
  int record_count;

  /*! 当前收到的记录序号 */
  int record_no;

  /*! 抓拍纪录序列号 */
  unsigned int sequence;

  /*! 抓拍时间秒数，从1970年01月01日00时00分00秒至抓拍时间经过的秒数。 */
  unsigned int tvSec;

  /*! 抓拍时间微秒数，tvSec的尾数 */
  unsigned int tvUsec;

  /*! 比对状态(分数) */
  short matched;

  /*! 性别 */
  unsigned char sex;

  /*! 年龄*/
  unsigned char age;

  /*! 比对上的人员id */
  char person_id[20];

  /*! 比对上的人员姓名 */
  char person_name[16];

  /*！实时人脸图像长度 */
  int face_image_len;

  /*！实时人脸图像（jpg格式） */
  unsigned char *face_image;

  /*! 人脸位于特写图像的X坐标。 */
  unsigned short faceXInFaceImg;

  /*! 人脸位于特写图像的y坐标。 */
  unsigned short faceYInFaceImg;

  /*! 人脸位于特写图像的宽度 */
  unsigned short faceWInFaceImg;

  /*! 人脸位于特写图像的高度 */
  unsigned short faceHInFaceImg;

  /*！比对上的注册人脸图像长度，未比对上时为0*/
  int reg_image_len;

  /*！比对上的注册人脸图像（jpg格式），未比对上时为NULL */
  unsigned char *reg_image;

  /*! 人像质量。 */
  unsigned char qvalue;

  /*! 纪录是否已上传 1:表示已经上传 0：表示未上传*/
  char is_upload;

  /*! 保留 */
  char resv[2];
};

// NTP校时信息
struct NtpInfo {
  short enable_state;   // Ntp开关状态，0是关 非0是开
  short update_cycle;   //更新周期，60~600s
  char ntp_server[16];  // NTP服务器ip地址
  char resv[12];        //保留
};

//系统网络信息
struct SystemNetInfo {
  char mac_addr[18];  //网卡物理地址
  char ip_addr[16];   //相机ip地址
  char netmask[16];   //子网掩码
  char gateway[16];   //默认网关
  char dns[16];   //设备dns
  char dns1[16];   //备用dns
  char resv[14];      //保留
};

//系统版本信息
struct SystemVersionInfo {
  char dev_id[32];              //设备序列号
  char protocol_ver[8];         //协议版本
  char firmware_ver[16];        //固件版本
  char code_ver[8];             //应用程序版本
  char build_time[20];          //应用编译时间
  char resv[16];                //保留
  char systemp_type[16];        //系统类型
  char plateform[16];           //硬件平台
  char sensor_type[16];         //传感器型号
  char algorithm_ver[16];       //算法版本
  char min_sdk_ver[16];         //最低sdk版本
  unsigned int min_client_ver;  //最低客户端版本
};

struct ha_rect {
  short x;       //人脸矩形区域左上角x坐标
  short y;       //人脸矩形区域左上角y坐标
  short width;   //人脸矩形区域宽度
  short height;  //人脸矩形区域高度
};

struct FaceRect {
  unsigned int faceId;      //人脸轮廓id
  struct ha_rect faceRect;  //人脸轮廓坐标
  char resv[4];
};

struct FaceRectInfo {
  char idShowFlag;
  char resv[3];
  int rectNum;  //轮廓数量
  struct FaceRect faceRects[32];
};

struct FaceDelProgressInfo {
  int delCount;     //删除的纪录总数
  int curDelNo;     //当前删除第几条纪录
  char faceId[20];  //当前删除的人员ID
};

struct FaceReRegistProgressInfo {
  int regist_count;   //重注册的人员总数
  int cur_regist_no;  //当前重注册第几条纪录
  char faceId[20];    //当前重注册的人员id
};

struct DebugImage {
  int format;              //调试图像格式, 1:jpg
  short width;             //调试图像宽度
  short height;            //调试图像高度
  int imageLen;            //图像数据长度
  unsigned char *imgData;  //图像数据
};

struct DebugImageInfo {
  unsigned int timeStamp_s;  //时间戳 秒
  unsigned int timeStamp_u;  //时间戳 微妙
  int matched;  //比对结果，0：未比对。-1：比对失败。1：比对成功
  int matchScore;   //比对分数
  char faceId[20];  //比对上的人员id，matched等于1时有效
  int imageNum;     //调试图像数量，最大支持6张图像
  struct DebugImage debugImage[6];  //调试图像信息
};

//人脸查询回调返回
struct QueryFaceInfoEx {
	int record_count;     //查询的角色记录总量
	int record_no;        //当前收到的记录序号
	char personID[20];    //人员ID
	char personName[16];  //姓名
	int role;  //人员角色 0：普通人员。 1：白名单人员。 2：黑名单人员。
	//-1：所有人员。
	
	int imgNum;   //模板图像数量
	int imgSize[5];     //图像大小，imgSize[i]为第i张图片的大小
	char imgFmt[5][4];  //图像格式,imgFmt[i]为第i张图片的格式
	unsigned char *imgBuff[5];  // imgBuff[i]位第i张图片给数据首地址
	unsigned int wgCardNO;      //韦根门禁卡号
	unsigned int
		effectTime;  //有效期截止时间，该人员信息在该时间内有效,从1970年1月1日0时0分0秒到截止时间的秒数（0xFFFFFFFF表示永久有效，0表示永久失效）
	unsigned int
		effectStartTime;  //有效期起始时间，该人员信息在该时间之后有效,从1970年1月1日0时0分0秒到起始时间的秒数（0表示未初始化）
	char idcardper[100];  //身份证号
	int user_type;   //权限
};


#endif

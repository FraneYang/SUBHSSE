unit libFaceRecognitionSDK_x86;


interface
uses Windows,Messages,Forms,
  Dialogs;
const
  FACEDA_SDK = 'libFaceRecognitionSDK_x86.dll';


type CAM_TYPE=(
       CAM_TYPE_TI8127=0,
       CAM_TYPE_S2=1);
    CHAR_ENCODE=(
       CHAR_ENCODE_GBK = 0,
       CHAR_ENCODE_UTF8=1);


 type
  LZSSystemTime=^ZSSystemTime;
  ZSSystemTime=record
     timeZone:char;
     date:array [0..10] of char;
     time:array [0..8] of char;
     resv:array [0..10] of char;
  end;

 LZBXSdkVersion=^ZBXSdkVersion;
  ZBXSdkVersion=record
    sdkVersion:array [0..63] of char;
    protoclVersion:array [0..63] of char;
    sdkCodeVersion:array [0..63] of char;
    sdkBuildTime:array [0..63] of char;
    algorithmVersion:array [0..63] of char;
    end;


  LFaceFlags=^FaceFlags;
  FaceFlags=record
    faceID:array [0..19] of char;//人员ID
    faceName:array [0..15] of char;//人员姓名
    role:integer;         //人员角色
    wgCardNO:cardinal;    //韦根门禁卡号
    effectTime:cardinal;//截止时间，该人员信息的有效期
    effectStartTime:cardinal;//有效期起始时间，该人员信息在该时间之后有效,从1970年1月1日0时0分0秒到起始时间的秒数（0表示未初始化）
    version:Word;
    wgCardNOLong:Int64;   // 韦根门禁卡号加长 在wgCardNO长度不满足时可将wgCardNO置0使用此成员
    ScheduleMode:byte;
//    cheduleMode:byte;
    resv:array [0..8172] of char;
  end;

//struct FaceFlags
//{
//    char faceID[20];    //人员ID
//    char faceName[16];  //人员姓名
//    int role;           //人员角色，0：普通人员。 1：白名单人员。 2：黑名单人员。 -1：所有人员。
//    unsigned int wgCardNO;//韦根协议门禁卡号
//    unsigned int effectTime;   //有效期截止时间，该人员信息在该时间内有效,从1970年1月1日0时0分0秒到截止时间的秒数（0xFFFFFFFF表示永久有效，0表示永久失效）
//    unsigned int effectStartTime;//有效期起始时间，该人员信息在该时间之后有效,从1970年1月1日0时0分0秒到起始时间的秒数（0表示未初始化）
//	short version;           //特征数据版本 用于同步注册特征数据时相机校验 未使用特征数据注册填0;
//	unsigned long long  wgCardNOLong;   // 韦根门禁卡号加长 在wgCardNO长度不满足时可将wgCardNO置0使用此成员
//	unsigned char ScheduleMode; ////调度模式 0:不使用调度模式  1~5 对应 Struct KindSchedule->ScheduleNameCode模式
//	char resv[8173];



LFaceImage=^FaceImage;  //新的注册人脸库
  FaceImage=record
    img_seq:integer;  //图片编号
    img_fmt:integer;     //图片格式 0：jpg 1：bgr
    img:pbyte;         //要注册的人脸图片数据，支持主流图像格式
    img_len:integer;    //img的长度
    width:integer;      //图像宽度，jpg图像不填此项
    height:integer;      //图像高度，jpg图像不填此项
  end;

    LSystemNetInfo=^SystemNetInfo;
    SystemNetInfo=Record
      mac_addr:array [0..18] of Char;
      ip_addr:array [0..16] of Char;
       netmask:array [0..16] of Char;
        gateway:array [0..16] of Char;
        resv:array [0..14] of Char;
     end;

  arrFaceFlag=array [0..1024] of FaceFlags;
  {LHA_Cam=^HA_Cam;              //未找到此结构体说明
  HA_Cam=record
    faceID:array [0.19.] of char;
  end; }
   LZBX_Cam=Pointer;

  LFaceRecoInfo=^FaceRecoInfo;
  FaceRecoInfo=record
    sequence:cardinal;
    camId:array [0..31] of char;
    posId:array [0..31] of char;
    posName:array [0..95] of char;

    tvSec:cardinal;
    tvUsec:cardinal;

    isRealtimeData:smallint;

    matched:smallint;
    matchPersonId:array [0..19] of char;
    matchPersonName:array [0..15] of char;
    matchRole:integer;

    existImg:integer; //全景图
    imgFormat:array [0..3] of char;
    imgLen:integer;
    faceXInImg:word;
    faceYInImg:word;
    faceWInImg:word;
    faceHInImg:word;

    existFaceImg:integer; //人脸图
    faceImgFormat:array [0..3] of char;
    faceImgLen:integer;
    faceXInFaceImg:word;
    faceYInFaceImg:word;
    faceWInFaceImg:word;
    faceHInFaceImg:word;

    existVideo:integer;
    videoStartSec:cardinal;
    videoStartUsec:cardinal;
    videoEndSec:cardinal;
    videoEndUsec:cardinal;
    videoFormat:array [0..3] of char;
    videoLen:integer;

    sex:byte;
    age:byte;
    expression:byte;
    skinColour:byte;
    resv:array [0..123] of char;

    img:pbyte;
    faceImg:pbyte;
    video:pbyte;

    feature_size:integer;
    feature:psingle;
    modelFaceImgLen:integer;
    modelFaceImgFmt:array [0..3] of char;
    modelFaceImg:pbyte;
    end;

  LFaceQueryInfo=^FaceQueryInfo;
  FaceQueryInfo=record
    record_count:integer;
    record_no:integer;
    personID:array [0..19] of char;
    personName:array [0..15] of char;
    role:integer;
    feature_count:smallint;
    feature_size:smallint;
    feature:PSingle;
    imgNum:integer;
    imgSize:array [0..4] of integer;
    imgFmt:array [0..4,0..3] of char;
    imgBuff:array [0..4] of pbyte;
    wgCardNo:integer;      //韦根门禁卡号
    effectTime:cardinal; //有效截止日期
    end;



  Lipscan_t=^ipscan_t;
  ipscan_t=record
    mac:array [0..19] of char;
    ip:array [0..19] of char;
    netmask:array [0..19] of char;
    gateway:array [0..19] of char;
    manufacturer:array [0..15] of char;
    platforms:array [0..31] of char;
    systems:array [0..31] of char;
    versions:array [0..63] of char;
  end;

  ipset_t=record
    mac:array [0..19] of char;
    ip:array [0..19] of char;
    netmask:array [0..19] of char;
    gateway:array [0..19] of char;
  end;
  LZBX_rect=^ZBX_rect;
  ZBX_rect=record
    x:integer;
    y:integer;
    width:integer;
    height:integer;
    end;

 LHaSdkVersion=^HaSdkVersion;
  HaSdkVersion=record
    sdkVersion:array [0..63] of char;
    protoclVersion:array [0..63] of char;
    sdkCodeVersion:array [0..63] of char;
    sdkBuildTime:array [0..63] of char;
    algorithmVersion:array [0..63] of char;
    end;

    LSystemVersionInfoe=^SystemVersionInfo;                    //系统版本信息
    SystemVersionInfo=record
          dev_id:array [0..31] of char;        //设备序列号
          protocol_ver:array [0..7] of char;   //协议版本
          firmware_ver:array [0..15] of char;  //固件版本
          code_ver:array [0..7] of char;       //应用程序版本
          build_time:array [0..19] of char;    //应用编译时间
          resv:array [0..15] of char;          //保留
          systemp_type:array [0..15] of char;  //系统类型
          plateform:array [0..15] of char;     //硬件平台
          sensor_type:array [0..15] of char;   //传感器型号
          algorithm_ver:array [0..15] of char; //算法版本
          min_sdk_ver:array [0..15] of char;   //最低sdk版本
          min_client_ver:Integer;//最低客户端版本
          kernel_version:array [0..127] of char;  //内核版本
    end;

  LFaceAppParam=^FaceAppParam;
    FaceAppParam=record
      dev_no:array [0..31] of char;            //设备编号
      point_no:array [0..31] of char;          //点位编号
      point_name:array [0..95] of char;       //点位名称
      resv1:array [0..31] of char;          //保留字段1
      heart_beat_interval:byte;//心跳时间间隔
      extranet_enale:char;       //外网控制开关
      extranet_port:word;//外网控制服务器端口
      extranet_ip:array [0..15] of char;       //外网控制服务器ip
      verify_enable:byte;//开启登录验证后，客户端在与服务器建立连接后将自动发送登录验证请求。注：抓拍机作为客户端。1：开启登录验证 0：关闭登录验证
      user_name:array [0..14] of char;         //登录验证用户名
      passwd:array [0..15] of char;          //登录验证密码
      resv2:array [0..11] of byte;    //保留字段2
      upload_mode:word; //数据上传方式0：关闭上传 1：TCP方式 2：FTP方式 3：HTTP方式
      upload_port:word;//服务器端口
      upload_ip:array [0..15] of char;         //服务器IP

      upload_info:array [0..101] of char;                   //上传方式打开时，此结构可用

      cam_mode:byte;    //相机工作模式。1：自动模式 2：在线模式 3：离线模式
      resv3:array [0..16] of char;            //保留字段3
      match_enable:integer;        //比对开关
      match_score:integer;            //比对确信分数
      dereplication_enable:integer;    //重复过滤开关
      dereplication_interval:integer;  //重复超时/输出间隔时间
      output_mode:word;  //图像输出形式
      resv4:array [0..255] of char;
      end;


 LQueryCondition=^QueryCondition;
 QueryCondition=record

    faceID:array [0..19] of char;         //人员ID
    faceName:array [0..15] of char;      //人员姓名
    wgCardNO:cardinal;  //韦根协议门禁卡号
    timeStart:cardinal; //有效期截止时间的查询起点
    timeEnd:cardinal;   //有效期截止d时间的查询终点
    time1Start:cardinal; //有效期起始时间的查询起点
    time1End:cardinal;   //有效期起始时间的查询终点
    resv:array[0..255]of byte; //保留
 end;



 LRecordCondition=^RecordCondition;
 RecordCondition=record

  // 抓拍图像数据标记 0：不需要，非0：需要。
   img_flag:char;

  // 注册图像数据标记 0：不需要，非0：需要。
   reg_img_flag:char;

  // 保留 以0填充
   resv1:array [0..1] of char;

  // 匹配模式，0精确匹配，非0模糊匹配
   query_mode:word;

  // 条件组合标记
   condition_flag:word;

  // 抓拍时间区间起点
   time_start:cardinal;

  // 抓拍时间区间终点
   time_end:cardinal;

  // 比对分数区间起点
   score_start:smallint;

  // 比对分数区间终点
   score_end:smallint;

  // 性别
   sex:byte;

  // 年龄区间起点
   age_start:byte;

  // 年龄区间终点
   age_end:byte;

  // 保留 以0填充
   resv2:array [0..16] of char;

  // 比对上的人员ID
   person_id:array [0..19] of char;

  // 比对上的人员姓名
   person_name:array [0..15] of char;

  // 人像质量区间起点
   qvalue_start:byte;

  // 人像质量区间终点
   qvalue_end:byte;

  // 是否已经上传 1:表示已经上传 0：表示未上传
   upload_state:char;

  // 保留 以0填充
   resv3:array [0..64] of char;
 end;


LRecordData=^RecordData;
RecordData=record
   // 查询的角色记录总量
  record_count:integer;

  // 当前收到的记录序号
  record_no:integer;

  //抓拍纪录序列号
  sequence:cardinal;

  // 抓拍时间秒数，从1970年01月01日00时00分00秒至抓拍时间经过的秒数。
  tvSec:cardinal;

  //抓拍时间微秒数，tvSec的尾数
  tvUsec:cardinal;

  //比对状态(分数)
  matched:smallint;

  //性别
  sex:byte;

  // 年龄
  age:byte;

  //比对上的人员id
  person_id:array [0..19] of char;

  //比对上的人员姓名
  person_name:array [0..15] of char;

  //实时人脸图像长度
  face_image_len:integer;

  //实时人脸图像（jpg格式）
  face_image:pbyte;

  //人脸位于特写图像的X坐标。
  faceXInFaceImg:word;

  //人脸位于特写图像的y坐标。
  faceYInFaceImg:word;

  //人脸位于特写图像的宽度
  faceWInFaceImg:word;

  //人脸位于特写图像的高度
  faceHInFaceImg:word;

  //比对上的注册人脸图像长度，未比对上时为0*/
  reg_image_len:integer;

  //比对上的注册人脸图像（jpg格式），未比对上时为NULL
  reg_image:pbyte;

  //人像质量
  qvalue:byte;

  //纪录是否已上传 1:表示已经上传 0：表示未上传
  is_upload:char;

  // 保留
  resv:array [0..1] of char;
end;



LKindSchedule=^KindSchedule;
KindSchedule=record
  ScheduleMode: Integer;
  ScheduleName:array [0..15] of Char;
  ScheduleNameCode:array[1..5] of smallint;
  Schedule:Integer;   //0 SCHEDULE_MODE_DAILY 时 只读取Schedule[0] 配置  SCHEDULE_MODE_WEEKLY 时周一 周日按Schedule[0]-Schedule[7] 配置 *DailySchedule Schedule[7];
 // 保留
  resv:array [0..31] of char;
end;

// /// 分类调度。
//struct KindSchedule {
//	enum ScheduleMode Mode; //调度模式
//	char ScheduleName[16];  //类别名称  自定义
//	unsigned short ScheduleNameCode; //类别代码  取值 [1~5] 不能重复
//	/*调度模式为 SCHEDULE_MODE_DAILY 时 只读取Schedule[0] 配置
//	为 SCHEDULE_MODE_WEEKLY 时周一 周日按Schedule[0]-Schedule[7] 配置 */
//	DailySchedule Schedule[7];  //调度时间
//	char recv[32]; //保留
//};







 // 记录查询条件标记。
type RecordQueryFlag=(
  // 通过抓拍时间范围查询。 */
  RECORD_QUERY_FLAG_TIME         = 1,

  // 通过比对分数范围查询。 */
  RECORD_QUERY_FLAG_SCORE        = 2,

  //*! 通过性别查询。 */
  RECORD_QUERY_FLAG_SEX          = 4,

  //*! 通过年龄范围查询。 */
  RECORD_QUERY_FLAG_AGE          = 8,

  //*! 通过比上的人员id查询。 */
  RECORD_QUERY_FLAG_ID           = 16,

  //*! 通过比上的人员姓名查询。 */
  RECORD_QUERY_FLAG_NAME         = 32,

 //*! 通过抓拍图像的人像质量范围查询。 */
  RECORD_QUERY_FLAG_QVALUE       = 64,

  //*! 通过记录上传状态查询。 */
  RECORD_QUERY_FLAG_UPLOAD       = 128,

  //*! 通过记录数据库编号查询。 */
  RECORD_QUERY_FLAG_SEQUENCE     = 256);



type ConditionFlag=(
  //通过ID查询
  QUERY_BY_ID = 1,

  //通过姓名查询
  QUERY_BY_NAME = 2,

  //通过韦根卡号查询
  QUERY_BY_WGNO = 4,

  //通过有效期截止时间范围查询
  QUERY_BY_EFFECT_TIME = 8,

  //通过有效期起始时间范围查询
  QUERY_BY_EFFECT_START_TIME = 16);

type
  ZBX_CamHandle = Integer;
 var
  BusDll: THandle;
  ZBX_Init: function(): Integer; stdcall;
  ZBX_ConnectEx: function(pStrIP: PChar; wPort: Word;pStrUserName: PChar; Password: PChar;errorcode:Integer;channel:integer;autoReconn:integer): Integer; stdcall;
  ZBX_DeInit: function(): Integer; stdcall;
  ZBX_StartStream: function(cam_handle:ZBX_CamHandle;hWnd: HWND): Integer; stdcall;
 function LoadBusModule(): Boolean;
 //procedure UnLoadBusModule();


implementation


function LoadBusModule(): Boolean;
begin
  BusDll := LoadLibrary('libFaceRecognitionSDK_x86.dll');
  Result := BusDll <> 0;
  if Result then
  begin
    ZBX_Init := getprocaddress(BusDll, 'ZBX_Init');
    ZBX_DeInit := getprocaddress(BusDll, 'ZBX_DeInit');
    ZBX_ConnectEx := getprocaddress(BusDll, 'ZBX_ConnectEx');
    ZBX_StartStream := getprocaddress(BusDll, 'ZBX_StartStream');
  end
  else
  begin
    ShowMessage('加载dll失败！！！');
  end;
end;
end.




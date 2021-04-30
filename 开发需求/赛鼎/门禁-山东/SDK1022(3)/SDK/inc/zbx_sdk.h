#ifndef ZBX_SDK_H_
#define ZBX_SDK_H_

#include <stdint.h>
//#include "sdk_def.h"
#include "zbx_sdk_def.h"
#include "face_reco_def.h"


#ifdef __cplusplus
extern "C" {
#endif

/*
 * @brief   取得sdk版本
 * @param   version[out] sdk版本信息
 * @return  版本号    【返回值固定3】
 */
SDK_API int SDK_CALL ZBX_GetVersion(ZBXSdkVersion* version);

/**
 * @brief   sdk初始化，
 * @brief   1)最多连接9个相机。
 * @brief   2)与ZBX_InitEx这两个函数，二者只能调其中一个。
 * @brief   3)如果想连接更多相机，请调用ZBX_InitEx
 * @param   无
 * @return  无
 */
SDK_API void SDK_CALL ZBX_Init();

/**
 * @brief   sdk初始化
 * @param   maxCamNum[in] 最大连接相机数。
 * @return  无
 */
SDK_API void SDK_CALL ZBX_InitEx(unsigned int maxCamNum);



/**
 * @brief   sdk反初始化
 * @param   无
 * @return  无
 */
SDK_API void SDK_CALL ZBX_DeInit();

/**
 * @brief   注册连接事件回调函数,须先调用ZBX_SetNotifyConnected(1)才生效
 * @param   cb[in] 回调函数指针
 * @param   usrParam[in] 用户参数
 * @return  无
 */
SDK_API void SDK_CALL ZBX_RegConnectEventCb(ZBX_ConnectEventCb_t cb,
	size_int usrParam);

/**
 * @brief   注册连接事件回调函数,须先调用ZBX_SetNotifyConnected(1)才生效
 * @param   cb[in] 回调函数指针
 * @param   usrParam[in] 用户参数
 * @return  无
 */
SDK_API void SDK_CALL ZBX_RegConnectEventCbEx(ZBX_Cam* cam,
                                             ZBX_ConnectEventCb_t cb,
											 size_int usrParam);


/**
 * @brief   注册人脸抓拍数据接收回调函数
 * @param   cb[in] 回调函数指针
 * @param   usrParam[in] 用户参数
 * @return  无
 */
SDK_API void SDK_CALL ZBX_RegFaceRecoCb(ZBX_Cam* cam, ZBX_FaceRecoCb_t cb,
                                       void* usrParam);

/**
 * @brief   注册人脸查询数据回调函数
 * @param   cb[in] 回调函数指针
 * @param   usrParam[in] 用户参数
 * @return  无
 */
SDK_API void SDK_CALL ZBX_RegFaceQueryCb(ZBX_Cam* cam, ZBX_FaceQueryCb_t cb,
                                        void* usrParam);

/**
* @brief   注册人脸查询数据回调函数
* @param   cb[in] 回调函数指针
* @param   usrParam[in] 用户参数
* @return  无
*/
SDK_API void SDK_CALL ZBX_RegFaceQueryCbEx(ZBX_Cam* cam, ZBX_FaceQueryCbEx_t cb,
	void* usrParam);



/**
 * @brief   注册搜索相机回调函数
 * @param   cb[in] 回调函数指针
 * @param   usrParam[in] 用户参数
 * @return  无
 */
SDK_API void SDK_CALL ZBX_RegDiscoverIpscanCb(discover_ipscan_cb_t cb,
	size_int usrParam);

/**

 * @brief   搜索相机
 * @param   无
 * @return  无
 */
SDK_API void SDK_CALL ZBX_DiscoverIpscan();

/**
 * @brief   通过mac地址，跨网段设置相机IP
 * @param   mac[in] mac地址
 * @param   ip[in] 相机IP
 * @param   netmask[in] 子网掩码
 * @param   gateway[in] 默认网关
 * @return  无
 */
SDK_API void SDK_CALL ZBX_SetIpBymac(const char* mac, const char* ip,
                                    const char* netmask, const char* gateway);

/**
 * @brief   是否连接相机
 * @param   cam[in]   相机句柄
 * @return  0 未连接
 * @return  1 已连接
 */
SDK_API int SDK_CALL ZBX_Connected(ZBX_Cam* cam);

/**
 * @brief   连接相机。请用ZBX_ConnectEx替代
 * @brief   默认为不支持重连接,如需重连，请使用下一个函数
 * @param   ip[in]   相机ip
 * @param   port[in]   相机端口，固定为9527
 * @param   usrName[in]   用户名，目前版本无效，传空即可
 * @param   password[in]   密码，目前版本无效，传空即可
 * @param   errorNum[out]  连接失败错误号，0为连接成功，-1为连接失败
 * @return  NULL 连接失败
 * @return  非NULL 连接成功
 */
SDK_API ZBX_Cam* SDK_CALL ZBX_Connect(const char* ip, unsigned short port,
                                    const char* usrName, const char* password,
                                    int* errorNum);

/**
 * @brief   连接相机
 * @param   ip[in]   相机ip
 * @param   port[in]   相机端口，固定为9527
 * @param   usrName[in]   用户名，目前版本无效，传空即可
 * @param   password[in]   密码，目前版本无效，传空即可
 * @param   errorNum[out]  连接失败错误号，0为连接成功，-1为连接失败
 * @param   channel[in]
 * 码流通道号，有特殊需求的用户使用，无特殊需求用户直接传0通道即可
 * @param   synctime[in]
 * 自动同步电脑时间
 * @param   autoReconn[in] 自动重连标志，为1自动重连，0不会自动重连
 * @return  autoReconn为1时，固定返回相机句柄
 * @return  autoReconn为0时，连接成功时返回相机句柄，连接失败时返回NULL
 * @return  建议用户使用自动重连,autoReconn为1
 */
SDK_API ZBX_Cam* SDK_CALL ZBX_ConnectEx(const char* ip, unsigned short port,
                                      const char* usrName, const char* password,
                                      int* errorNum, unsigned int channel,
                                      int autoReconn,bool bsync=true);


/**
 * @brief   断开相机
 * @param   cam[in]   相机句柄
 * @return  无
 */
SDK_API void SDK_CALL ZBX_DisConnect(ZBX_Cam* cam);


/**
 * @brief   开始显示视频流
 * @param   cam[in]   相机句柄
 * @param   hWnd[in]   窗口句柄
 * @return  无
 */
SDK_API void SDK_CALL ZBX_StartStream(ZBX_Cam* cam, HWND hWnd);


/**
 * @brief   终止显示某一个窗口句柄视频流
 * @param   cam[in]   相机句柄
 * @return  无
 */
SDK_API void SDK_CALL ZBX_StopStreamEx(ZBX_Cam* cam, HWND hWnd);

/**
 * @brief   终止显示视频流
 * @param   cam[in]   相机句柄
 * @return  无
 */
SDK_API void SDK_CALL ZBX_StopStream(ZBX_Cam* cam);

/*
* @brief  获取视频实时fps
* @param   cam[in]   相机句柄
*/
SDK_API int SDK_CALL ZBX_GetStreamFps(ZBX_Cam* cam);

/**
 * @brief   触发相机
 * @param   cam   相机句柄
 * @param   usrParam   此版本无效，传0即可
 * @return  0 触发成功
 * @return  -1 触发失败
 */
SDK_API int SDK_CALL ZBX_Trigger(ZBX_Cam* cam, size_int usrParam);


/**
 * @brief   获取人脸相机固件信息
 * @param   cam[in]   相机句柄
 * @param   version[out] 固件版本信息
 * @return  0 获取成功
 * @return  <0 获取失败
 */
SDK_API int SDK_CALL ZBX_GetFaceSystemVersion(ZBX_Cam* cam,
                                             SystemVersionInfo* version);

/**
 * @brief   获取相机系统时间
 * @param   cam[in]   相机句柄
 * @param   sysTime[out] 相机时间信息
 * @return  0 获取成功
 * @return  <0 获取失败
 */
SDK_API int SDK_CALL ZBX_GetSystemTime(ZBX_Cam* cam, SystemTime* sysTime);

/**
 * @brief   设置相机系统时间
 * @param   cam[in]   相机句柄
 * @param   sysTime[in] 相机时间信息
 * @return  0 设置成功
 * @return  <0 设置失败
 */
SDK_API int SDK_CALL ZBX_SetSystemTime(ZBX_Cam* cam, SystemTime* sysTime);


/**
 * @brief   获取闸机韦根类型
 * @param   cam[in]   相机句柄
 * @param   type[out] 韦根类型 枚举类型为WG26,WG34, WG36, WG44，目前只支持WG26,
 * WG34
 * @return  0 获取成功
 * @return  <0 获取失败
 */
SDK_API int SDK_CALL ZBX_GetWiegandType(ZBX_Cam* cam, int* type);

/**
 * @brief   设置闸机韦根类型
 * @param   cam[in]   相机句柄
 * @param   type[in] 韦根类型 枚举类型为WG26,WG34, WG36, WG44，目前只支持WG26,
 * WG34
 * @return  0 设置成功
 * @return  <0 设置失败
 */
SDK_API int SDK_CALL ZBX_SetWiegandType(ZBX_Cam* cam, int type);


/**
 * @brief   获取计算人员通过次数的间隔时间，在该时间内人员只算通过一次
 * @param   cam[in]   相机句柄
 * @param   interval[out] 计算人员通过次数的间隔时间，单位：秒
 * @return  0 获取成功
 * @return  <0 获取失败
 */
SDK_API int SDK_CALL ZBX_GetClusterTimesInterval(ZBX_Cam* cam,
                                                unsigned int* interval);

/**
 * @brief   设置计算人员通过次数的间隔时间，在该时间内人员只算通过一次
 * @param   cam[in]   相机句柄
 * @param   interval[out] 计算人员通过次数的间隔时间，单位：秒
 * @return  0 获取成功
 * @return  <0 获取失败
 */
SDK_API int SDK_CALL ZBX_SetClusterTimesInterval(ZBX_Cam* cam,
                                                unsigned int interval);

/**
 * @brief   获取人脸比对确性分数
 * @param   cam[in]   相机句柄
 * @param   score[out] 确信分数（0-100分）
 * @return  0 获取成功
 * @return  <0 获取失败  配置.h并没有更新
 */
SDK_API int SDK_CALL ZBX_GetMatchScore(ZBX_Cam* cam, int* score);

/**
 * @brief   设置人脸比对确性分数
 * @param   cam[in]   相机句柄
 * @param   score[in] 确信分数（0-100分）
 * @return  0 设置成功
 * @return  <0 设置失败  配置.h并没有更新
 */
SDK_API int SDK_CALL ZBX_SetMatchScore(ZBX_Cam* cam, int score);


/**
 * @brief   获取活体检测开关状态
 * @param   cam[in]   相机句柄
 * @param   enable[out]  0:关 1:开
 * @return  0 获取成功
 * @return  <0 获取失败  配置.h并没有更新
 */
SDK_API int SDK_CALL ZBX_GetAliveDetectEnable(ZBX_Cam* cam, int* enable);

/**
 * @brief   设置活体检测开关
 * @param   cam[in]   相机句柄
 * @param   enable[in] 0:关 1:开
 * @return  0 设置成功
 * @return  <0 设置失败  配置.h并没有更新
 */
SDK_API int SDK_CALL ZBX_SetAliveDetectEnable(ZBX_Cam* cam, int enable);

/**
 * @brief   获取外接显示屏标题
 * @param   cam[in]   相机句柄
 * @param   screen_title[out]  外接显示屏标题 UTF8格式 最大64个字节
 * @return  0 获取成功
 * @return  <0 获取失败  参考错误码
 */
SDK_API int SDK_CALL ZBX_GetScreenOsdTitle(ZBX_Cam* cam, char* screen_title);

/**
 * @brief   设置外接显示屏标题
 * @param   cam[in]   相机句柄
 * @param   screen_title[in] 外接显示屏标题 UTF8格式 最大64个字节
 * @return  0 设置成功
 * @return  <0 设置失败  参考错误码
 */
SDK_API int SDK_CALL ZBX_SetScreenOsdTitle(ZBX_Cam* cam, char* screen_title);


/**
 * @brief   查看网络参数配置
 * @param   cam[in]   相机句柄
 * @param   netInfo[out] 网络参数
 * @return  0 获取成功
 * @return  <0 获取失败  参考错误码
 */
SDK_API int SDK_CALL ZBX_GetNetConfig(ZBX_Cam* cam, SystemNetInfo* netInfo);

/**
 * @brief   设置网络参数配置
 * @param   cam[in]   相机句柄
 * @param   netInfo[in] 网络参数
 * @return  0 设置成功
 * @return  <0 设置失败  参考错误码
 */
SDK_API int SDK_CALL ZBX_SetNetConfig(ZBX_Cam* cam, SystemNetInfo* netInfo);

/**
 * @brief   获取led灯模式
 * @param   cam[in]   相机句柄
 * @param   led_mode[out] led灯模式 1：常亮 2：自动控制 3：常闭
 * @return  0 获取成功
 * @return  <0 获取失败  参考错误码
 */
SDK_API int SDK_CALL ZBX_GetLedMode(ZBX_Cam* cam, char* led_mode);

/**
 * @brief   设置led灯模式
 * @param   cam[in]   相机句柄
 * @param   led_mode[in] led灯模式 1：常亮 2：自动控制 3：常闭
 * @return  0 设置成功
 * @return  <0 设置失败  参考错误码
 */
SDK_API int SDK_CALL ZBX_SetLedMode(ZBX_Cam* cam, char led_mode);

/**
 * @brief   获取led亮度
 * @param   cam[in]   相机句柄
 * @param   led_level[out] 亮度 1~100
 * @return  0 获取成功
 * @return  <0 获取失败  参考错误码
 */
SDK_API int SDK_CALL ZBX_GetLedLevel(ZBX_Cam* cam, char* led_level);

/**
 * @brief   设置led灯亮度
 * @param   cam[in]   相机句柄
 * @param   led_level[in] 亮度 1~100
 * @return  0 设置成功
 * @return  <0 设置失败  参考错误码
 */
SDK_API int SDK_CALL ZBX_SetLedLevel(ZBX_Cam* cam, char led_level);



/**
 * @brief   获取485输出协议编号
 * @param   cam[in]   相机句柄
 * @param   rs485_protocal_no[out] rs485输出协议编号 0：表示关
 * @return  0 获取成功
 * @return  <0 获取失败  参考错误码
 */
SDK_API int SDK_CALL ZBX_GetRS485ProtocalNo(ZBX_Cam* cam,
                                           char* rs485_protocal_no);

/**
 * @brief   设置485输出协议编号
 * @param   cam[in]   相机句柄
 * @param   rs485_protocal_no[in] rs485输出协议编号 0：表示关
 * @return  0 设置成功
 * @return  <0 设置失败  参考错误码
 */
SDK_API int SDK_CALL ZBX_SetRS485ProtocalNo(ZBX_Cam* cam, char rs485_protocal_no);


/**
 * @brief   触发白名单报警，强制模式开闸
 * @param   cam[in]   相机句柄
 * @param   inout[in]  输入、输出 1输入 2输出
 * @param   onoff[in] 开关 1连通 0断开
 * @return  0 成功
 * @return  <0 失败
 */
SDK_API int SDK_CALL ZBX_WhiteListAlarm(ZBX_Cam* cam, int inout, int onoff);

/**
 * @brief   触发黑名单报警,强制模式开闸
 * @param   cam[in]   相机句柄
 * @param   inout[in]  输入、输出 1输入 2输出
 * @param   onoff[in] 开关 1连通 0断开
 * @return  0 成功
 * @return  <0 失败
 */
SDK_API int SDK_CALL ZBX_BlackListAlarm(ZBX_Cam* cam, int inout, int onoff);



//===========================透明串口==============================begin

/**
 * @brief   注册读透明串口
 * @param   cb[in] 透明串口返回数据回调
 * @param   usrParam[in] 用户参数
 * @return  0 成功
 * @return  <0 失败
 */
SDK_API int SDK_CALL ZBX_RegReadTSerialCb(ZBX_ReadTSerialCb_t cb, size_int usrParam);

/**
 * @brief   注册读透明串口
 * @param   cb[in] 透明串口返回数据回调
 * @param   usrParam[in] 用户参数
 * @return  0 成功
 * @return  <0 失败
 */
SDK_API int SDK_CALL ZBX_RegReadTSerialCbEx(ZBX_Cam* cam, ZBX_ReadTSerialCb_t cb,
	size_int usrParam);

/**
 * @brief   获取透明串口参数
 * @param   cam[in]   相机句柄
 * @param   index[in] 第N路串口,目前只支持 ZBX_SERIA_RS485  ZBX_SERIA_RS232
 * @param   baudrate[out] 波特率
 * @param   baudrate:只能为以下值：1200, 2400, 4800, 9600, 14400, 19200, 38400,
 * 56000, 57600, 115200, 128000, 256000
 * @param   parity[out] 校验位。只能为0，无校验位
 * @param   databit[out] 数据位，只能为5，6，7，8
 * @param   stopbit[out] 停止位，只能为1，2
 * @return  0 成功
 * @return  <0 失败
 */
SDK_API int SDK_CALL ZBX_GetTSerial(ZBX_Cam* cam, int index, int* baudrate,
                                   int* parity, int* databit, int* stopbit);

/**
 * @brief   打开透明串口
 * @param   cam[in]   相机句柄
 * @param   index[in] 第N路串口,目前只支持 ZBX_SERIA_RS485  ZBX_SERIA_RS232
 * @param   baudrate[in] 波特率
 * @param   baudrate:只能为以下值：1200, 2400, 4800, 9600, 14400, 19200, 38400,
 * 56000, 57600, 115200, 128000, 256000
 * @param   parity[in] 校验位。0:none, 1:odd, 2:even, 3:mark, 4:space
 * @param   databit[in] 数据位，只能为5，6，7，8
 * @param   stopbit[in] 停止位，只能为1，2
 * @return  0 成功
 * @return  <0 失败
 */
SDK_API int SDK_CALL ZBX_OpenTSerial(ZBX_Cam* cam, int index, int baudrate,
                                    int parity, int databit, int stopbit);

/**
 * @brief   写透明串口
 * @param   cam[in]   相机句柄
 * @param   index[in] 第N路串口,目前只支持 ZBX_SERIA_RS485  ZBX_SERIA_RS232
 * @param   data[in] 数据
 * @param   size[in] 数据长度
 * @return  0 成功
 * @return  <0 失败
 */
SDK_API int SDK_CALL ZBX_WriteTSerial(ZBX_Cam* cam, int index,
                                     const unsigned char* data, int size);

/*
 * @brief   关闭透明串口
 * @param   cam[in]   相机句柄
 * @param   index[in] 第N路串口,目前只支持 ZBX_SERIA_RS485  ZBX_SERIA_RS232
 * @return  0 成功
 * @return  <0 失败
 */
SDK_API int SDK_CALL ZBX_CloseTSerial(ZBX_Cam* cam, int index);

//===========================透明串口==============================end

//===========================相机参数=============================begin

/**
 */
SDK_API void SDK_CALL ZBX_RebootCam(ZBX_Cam* cam);
// SDK_API void SDK_CALL ZBX_ResetCamParam(ZBX_Cam* cam);


/**
 * @brief   获取相机时间
 * @param   cam[in]   相机句柄
 * @param   time[in] Unix时间
 * @return  0 成功
 * @return  <0 失败
 */
SDK_API int SDK_CALL ZBX_GetSysTime(ZBX_Cam* cam, int* time);

/**
 * @brief   设置相机时间
 * @param   cam[in]   相机句柄
 * @param   year[in] 年份（如：2016）
 * @param   month[in] 月份（如：5）
 * @param   day[in] 日期（如：6）
 * @param   hour[in] 小时（如：14）
 * @param   minute[in] 分钟（如：35）
 * @param   second[in] 秒（如：20）
 * @return  0 成功
 * @return  <0 失败
 */
SDK_API int SDK_CALL ZBX_SetSysTimeEx(ZBX_Cam* cam, int year, int month, int day,
                                     int hour, int minute, int second);

/**
 * @brief   获取相机时间
 * @param   cam[in]   相机句柄
 * @param   year[in] 年份（如：2016）
 * @param   month[in] 月份（如：5）
 * @param   day[in] 日期（如：6）
 * @param   hour[in] 小时（如：14）
 * @param   minute[in] 分钟（如：35）
 * @param   second[in] 秒（如：20）
 * @return  0 成功
 * @return  <0 失败
 */
SDK_API int SDK_CALL ZBX_GetSysTimeEx(ZBX_Cam* cam, int* year, int* month,
                                     int* day, int* hour, int* minute,
                                     int* second);

//设置是否需要相机连接上的事件的回调通知
SDK_API void SDK_CALL ZBX_SetNotifyConnected(int notify);



/**
 *  @brief 注册人脸到相机，支持单个id多张人脸 最大5张人脸图像
 *  @param  [IN] cam 要注册的相机句柄
 *  @param  [IN] faceID 人员标记，用于唯一标记注册的人脸
 *  @param  [IN] jpg 人脸图像路径数组，图像格式须为JPG
 *  @param  [IN] img_count 图像路径数量
 *  @param  [IN] picture_flags 下发图像到相机的标识，0表示不存图片到相机, >0
 * 表示存到相机的图片数量
 *  @return 返回值为0表示成功，返回负数表示失败，具体参考错误码
 */
SDK_API int SDK_CALL ZBX_AddJpgPaths(ZBX_Cam* cam, FaceFlags* faceID, char* jpg[],
                                    int img_count, int picture_Flags);

SDK_API int SDK_CALL ZBX_AddImagePaths(ZBX_Cam* cam, FaceFlags* faceID,
                                      char* jpg[], int img_count,
                                      int picture_flags);

/**
 *  @brief 注册人脸到相机，支持单个id多张人脸
 *  @param  [IN] cam 要注册的相机句柄
 *  @param  [IN] type 注册类型， 0表示添加 1表示修改
 *  @param  [IN] faceID 人员标记，用于唯一标记注册的人脸
 *  @param  [IN] jpg 人脸图像路径数组
 *  @param  [IN] img_count 图像数量
 *  @param  [IN] picture_flags 下发图像到相机的标识，0表示不存图片到相机, >0
 * 表示存到相机的图片数量
 *  @param  [OUT] err_imgs 注册失败的人脸图像，图片编号对应imgs下的图片编号
 *  @param  [OUT] err_imgs_count 注册失败的人脸图像数量
 *  @return 返回值为0表示成功，返回负数表示失败，具体参考错误码
 */
SDK_API int SDK_CALL ZBX_JpgPathsEx(ZBX_Cam* cam, int type, FaceFlags* faceID,
                                   char* jpg[], int img_count,
                                   int picture_Flags, ErrorFaceImage* err_imgs,
                                   int* err_imgs_count);

/**
 *  @brief 注册人脸到相机，支持单个id多张人脸 最大5张人脸图像
 *  @param  [IN] cam 要注册的相机句柄
 *  @param  [IN] faceID 人员标记，用于唯一标记注册的人脸
 *  @param  [IN] imgs 人脸图像，图像格式须为JPG
 *  @param  [IN] img_count 图像数量
 *  @param  [IN] picture_flags 下发图像到相机的标识，0表示不存图片到相机, >0
 * 表示存到相机的图片数量
 *  @return 返回值为0表示成功，返回负数表示失败，具体参考错误码
 */
SDK_API int SDK_CALL ZBX_AddJpgFaces(ZBX_Cam* cam, FaceFlags* faceID,
                                    FaceImage* imgs, int img_count,
                                    int picture_flags);

/**

 *  @brief 注册人脸到相机，支持单个id多张人脸 最大5张人脸图像
 *  @param  [IN] cam 要注册的相机句柄
 *  @param  [IN] type 注册类型， 0表示添加 1表示修改
 *  @param  [IN] faceID 人员标记，用于唯一标记注册的人脸
 *  @param  [IN] imgs 人脸图像，图像格式须为JPG
 *  @param  [IN] img_count 图像数量
 *  @param  [IN] picture_flags 下发图像到相机的标识，0表示不存图片到相机, >0
 * 表示存到相机的图片数量
 *  @param  [OUT] err_imgs 注册失败的人脸图像，图片编号对应imgs下的图片编号
 *  @param  [OUT] err_imgs_count 注册失败的人脸图像数量
 *  @return 返回值为0表示成功，返回负数表示失败，具体参考错误码
 */
SDK_API int SDK_CALL ZBX_JpgFacesEx(ZBX_Cam* cam, int type, FaceFlags* faceID,
                                   FaceImage* imgs, int img_count,
                                   int picture_flags, ErrorFaceImage* err_imgs,
                                   int* err_imgs_count);

/**
 *  @brief 注册人脸到相机，注册图像尺寸要求大于100*100，注册人脸尺寸大于80*80
 *  @param  [IN] cam 要注册的相机句柄
 *  @param  [IN] faceID 人员标记，用于唯一标记注册的人脸
 *  @param  [IN] jpg 人脸图像，图像格式须为JPG
 *  @param  [IN] len jpg数据长度
 *  @return 返回值为0表示成功，返回负数表示失败，具体参考错误码
 */
SDK_API int SDK_CALL ZBX_AddJpgFace(ZBX_Cam* cam, FaceFlags* faceID,
                                   const unsigned char* jpg, int len);

/**
 *  @brief 注册人脸到相机，支持单个id多张人脸 最大5张人脸图像
 *  @param  [IN] cam 要注册的相机句柄
 *  @param  [IN] faceID 人员标记，用于唯一标记注册的人脸
 *  @param  [IN] imgs 人脸图像，图像格式须为JPG
 *  @param  [IN] img_count 图像数量
 *  @param  [IN] picture_flags 下发图像到相机的标识，0表示不存图片到相机, >0
 * 表示存到相机的图片数量
 *  @return 返回值为0表示成功，返回负数表示失败，具体参考错误码
 */
SDK_API int SDK_CALL ZBX_AddFaces(ZBX_Cam* cam, FaceFlags* faceID,
                                 FaceImage* imgs, int img_count,
                                 int picture_flags);

/**
 *  @brief 注册人脸到相机，支持单个id多张人脸 最大5张人脸图像
 *  @param  [IN] cam 要注册的相机句柄
 *  @param  [IN] type 注册类型， 0表示添加 1表示修改
 *  @param  [IN] faceID 人员标记，用于唯一标记注册的人脸
 *  @param  [IN] imgs 人脸图像，图像格式须为JPG
 *  @param  [IN] img_count 图像数量
 *  @param  [IN] picture_flags 下发图像到相机的标识，0表示不存图片到相机, >0
 * 表示存到相机的图片数量
 *  @param  [OUT] err_imgs 注册失败的人脸图像，图片编号对应imgs下的图片编号
 *  @param  [OUT] err_imgs_count 注册失败的人脸图像数量
 *  @return 返回值为0表示成功，返回负数表示失败，具体参考错误码
 */
SDK_API int SDK_CALL ZBX_FacesEx(ZBX_Cam* cam, int type, FaceFlags* faceID,
                                FaceImage* imgs, int img_count,
                                int picture_flags, ErrorFaceImage* err_imgs,
                                int* err_imgs_count);

/**
 *  @brief 删除一个人员信息
 *  @param  [IN] cam 要注销的相机句柄
 *  @param  [IN] personID  需要删除的人脸ID
 *  @return 返回值为0表示成功，返回负数表示失败，具体参考错误码
 */
SDK_API int SDK_CALL ZBX_DeleteFaceDataByPersonID(ZBX_Cam* cam,
                                                 const char* personID);

/**
 *  @brief 删除所有人脸
 *  @param  [IN] cam 要删除的相机句柄
 *  @return 返回值为0表示成功，返回负数表示失败，具体参考错误码
 */
SDK_API int SDK_CALL ZBX_DeleteFaceDataAll(ZBX_Cam* cam);

/**
 *  @brief 获取已经添加的人脸中总数
 *  @param  [IN] cam 相机句柄
 *  @return 返回已经添加的人脸总数，返回值小于0表示出错，参考错误码
 */
SDK_API int SDK_CALL ZBX_GetFaceIDTotal(ZBX_Cam* cam);

/**
/**
 *  @brief 通过人员角色查询
 *  @param  [IN] cam 要查看的相机句柄
 *  @param  [IN] role 要查询的人员角色 0：普通人员。 1：白名单人员。
 * 2：黑名单人员。 -1：所有人员。
 *  @param  [IN] page_no 要查询的页码
 *  @param  [IN] page_size 每页的数据条数，用于数据分页 最大值100
 *  @param  [IN] featureFlags
 * 特征查询标记，是否查询特征信息，0表示需要，非0表示不需要
 *  @param  [IN] imgFlags 是否查询人脸图像
 *  @return 返回值为0表示成功，返回负数表示失败，具体参考错误码
 */
SDK_API int SDK_CALL ZBX_QueryByRole(ZBX_Cam* cam, int role, int page_no,
                                    int page_size, char featureFlags,
                                    char imgFlags);

/**
 *  @brief 人员查询扩展，支持按条件查询，以及模糊查询
 *  @param  [IN] cam 要查看的相机句柄
 *  @param  [IN] role 要查询的人员角色 0：普通人员。 1：白名单人员。
 * 2：黑名单人员。 -1：所有人员。
 *  @param  [IN] page_no 要查询的页码
 *  @param  [IN] page_size 每页的数据条数，用于数据分页 最大值100
 *  @param  [IN] featureFlags
 * 特征查询标记，是否查询特征信息，0表示需要，非0表示不需要
 *  @param  [IN] imgFlags 是否查询人脸图像
 *  @param  [IN] condition_flag 用于标记按哪些条件查询，使用enum
 * ConditionFlag来控制，0：无效，非0：有效
 *  @param  [IN] query_mode 0表示精确查询，非0表示模糊查询
 *  @param  [IN] condition 查询条件
 *  @return 返回值为0表示成功，返回负数表示失败，具体参考错误码
 */
SDK_API int SDK_CALL ZBX_QueryFaceEx(ZBX_Cam* cam, int role, int page_no,
                                    int page_size, char featureFlags,
                                    char imgFlags, short condition_flag,
                                    short query_mode,
                                    QueryCondition* condition);

/**
* @brief  获取对比失败是否上传数据配置
* @param   cam[in]   相机句柄
* @param   //0：都上传，1：只上传对比成功的数据
* @return  0 获取成功
* @return  <0 获取失败  参考错误码
*/
SDK_API int SDK_CALL ZBX_GetPushMode(ZBX_Cam* cam, char* mode);

/**
* @brief  设置对比失败是否上传数据配置
* @param   cam[in]   相机句柄
* @param   //0：都上传，1：只上传对比成功的数据
* @return  0 获取成功
* @return  <0 获取失败  参考错误码
*/
SDK_API int SDK_CALL ZBX_SetPushMode(ZBX_Cam* cam, char mode);


/**
* @brief  设置语音配置
* @param   cam[in]   相机句柄
* @param   //0：自定义语音，1：固定语音1，2：固定语音2
* @return  0 获取成功
* @return  <0 获取失败  参考错误码
*/
SDK_API int SDK_CALL ZBX_SetAudioConfig(ZBX_Cam* cam, ZBX_AudioConfig audioconfig);

/**
* @brief  获取语音配置
* @param   cam[in]   相机句柄
* @param   //0：自定义语音，1：固定语音1，2：固定语音2
* @return  0 获取成功
* @return  <0 获取失败  参考错误码
*/
SDK_API int SDK_CALL ZBX_GetAudioConfig(ZBX_Cam* cam, ZBX_AudioConfig* audioconfig);

/**
* @brief  设置是否开启戴帽检测
* @param   cam[in]   相机句柄
* @param   //0：不开启，1：开启
* @return  0 获取成功
* @return  <0 获取失败  参考错误码
*/
SDK_API int SDK_CALL ZBX_SetSafetyHat(ZBX_Cam* cam, int enable);

/**
* @brief  获取是否开启戴帽检测
* @param   cam[in]   相机句柄
* @param   //0：不开启，1：开启
* @return  0 获取成功
* @return  <0 获取失败  参考错误码
*/
SDK_API int SDK_CALL ZBX_GetSafetyHat(ZBX_Cam* cam, int* enable);

/**
* @brief  设置是否开启戴帽通行
* @param   cam[in]   相机句柄
* @param   //0：不开启，1：开启 开启不带安全帽 则禁止通行
* @return  0 获取成功
* @return  <0 获取失败  参考错误码
*/
SDK_API int SDK_CALL ZBX_SetSafetyHatStatus(ZBX_Cam* cam, int enable);

/**
* @brief  获取是否开启戴帽通行
* @param   cam[in]   相机句柄
* @param   //0：不开启，1：开启   开启不带安全帽 则禁止通行
* @return  0 获取成功
* @return  <0 获取失败  参考错误码
*/
SDK_API int SDK_CALL ZBX_GetSafetyHatStatus(ZBX_Cam* cam, int* enable);

/**
* @brief  获取亮灯时段
* @param   cam[in]   相机句柄
* @param   CtrlTime[out]  亮度设置
* @return  0 获取成功
* @return  <0 获取失败  参考错误码
*/
SDK_API int SDK_CALL ZBX_GetLedCtrlTime(ZBX_Cam* cam, ZBX_LedCtrlTime* CtrlTime);

/**
* @brief  设置亮灯时段
* @param   cam[in]   相机句柄
* @param   Level[in]  亮度等级
* @return  0 获取成功
* @return  <0 获取失败  参考错误码
*/
SDK_API int SDK_CALL ZBX_SetLedCtrlTime(ZBX_Cam* cam, ZBX_LedCtrlTime CtrlTime);

/**
* @brief  设置 Http 推送配置
* @param   cam[in]   相机句柄
* @param   Level[in]  亮度等级
* @return  0 获取成功
* @return  <0 获取失败  参考错误码
*/
SDK_API int SDK_CALL ZBX_SetHttpConfig(ZBX_Cam* cam, ZBX_HTTPCONFIG httpConfig);


int SDK_CALL ZBX_SetHttpConfig_Ex(ZBX_Cam* cam, ZBX_HTTPCONFIG_EX httpConfig);
/**
* @brief  获取 Http 推送配置
* @param   cam[in]   相机句柄
* @param   Level[in]  亮度等级
* @return  0 获取成功
* @return  <0 获取失败  参考错误码
*/
SDK_API int SDK_CALL ZBX_GetHttpConfig(ZBX_Cam* cam, ZBX_HTTPCONFIG* httpConfig);

SDK_API int SDK_CALL ZBX_GetHttpConfig_Ex(ZBX_Cam* cam, ZBX_HTTPCONFIG_EX* httpConfig);
/*
* @brief   升级接口
* @param   系统文件路径
* @param   系统升级完成必须重启设备  或者调用接口ZBX_RebootCam
* @return 0 成功
*/
SDK_API int SDK_CALL ZBX_UpdateSystem(ZBX_Cam* cam, const char* filePth);



SDK_API void SDK_CALL ZBX_SetUpdateSystem_CB(ZBX_Cam* cam, ZBX_HTTPRESULT_PROCESS cb, void* user_data);

/**
* @brief   注册人脸抓拍数据离线回调函数
* @param   cb[in] 回调函数指针
* @param   usrParam[in] 用户参数
* @return  无
*/
SDK_API void SDK_CALL ZBX_RegFaceOffLineRecoCb(ZBX_Cam* cam, ZBX_FaceRecoCb_t cb,
	void* usrParam);

/**
* @brief   注册人脸抓拍数据离线回调函数
* @param   cb[in] 回调函数指针
* @param   usrParam[in] 用户参数
* @return  无
*/
SDK_API void SDK_CALL ZBX_RegFaceOffLineRecoCbEx(ZBX_Cam* cam, ZBX_FaceRecoCbEx_t cb,
	void* usrParam);


/**
* @brief   屏幕熄屏时间获取
* @param   time[out] 时间s
* @param    //1 - 24 * 60 * 60,范围外为永不休眠
* @return  无
**/
SDK_API int SDK_CALL ZBX_GetExtinguishingScreenTime(ZBX_Cam* cam, int* time);

/**
* @brief   屏幕熄屏时间设置
* @param    time[in] 时间 单位：秒
* @param    //1 - 24 * 60 * 60,范围外为永不休眠
* @return  无
**/
SDK_API int SDK_CALL ZBX_SetExtinguishingScreenTime(ZBX_Cam* cam, int time);

/**
* @brief  水印开关设置
* @param    status[in]
* @param    //0:关闭，1：开启
* @return  无
**/
SDK_API int SDK_CALL ZBX_SetWaterMark(ZBX_Cam* cam, int status);

/**
* @brief   水印开关获取
* @param    status[in]
* @param    //0:关闭，1：开启
* @return  无
**/
SDK_API int SDK_CALL ZBX_GetWaterMark(ZBX_Cam* cam, int* status);

/**
* @brief  人脸跟踪框开关设置
* @param    status[in]
* @param    //0:关闭，1：开启
* @return  无
**/
SDK_API int SDK_CALL ZBX_SetFaceShow(ZBX_Cam* cam, int status);

/**
* @brief   人脸跟踪框开关获取
* @param    status[in]
* @param    //0:关闭，1：开启
* @return  无
**/
SDK_API int SDK_CALL ZBX_GetFaceShow(ZBX_Cam* cam, int* status);

/**
* @brief   注册韦根输入信息回调
* @param   cb[in] 回调函数指针
* @param   usrParam[in] 用户参数
* @return  无
*/
SDK_API void SDK_CALL ZBX_RegWgAlarmRecordCb(ZBX_Cam* cam,
	ZBX_WGAlarmRecordCb_t cb,
	void *usrParam);

/**
* @brief   注册身份证输入信息回调
* @param   cb[in] 回调函数指针
* @param   usrParam[in] 用户参数
* @return  无
*/
SDK_API void SDK_CALL ZBX_RegIDCardRecordCb(ZBX_Cam* cam,
	ZBX_IDCardRecordCb_t cb,
	void *usrParam);


/**
* @brief   进入厂测模式
* @ 请勿进入厂测模式 否则将断开与相机的连接
* @return  无
*/
SDK_API void SDK_CALL ZBX_EnterFactory(ZBX_Cam* cam);

/**
* @brief   进入老化模式
* @设备将全速运行 请谨慎进入
* @ 进入老化模式
* @return  无
*/
SDK_API int SDK_CALL ZBX_SetAging(ZBX_Cam* cam, int status);

/**
* @brief   停止老化模式
* @ 
* @return  无
*/
SDK_API int SDK_CALL ZBX_GetAging(ZBX_Cam* cam, int *status);


/**
* @brief   获取闸机继电器闭合持续时间
* @param   cam[in]   相机句柄
* @param   duration[out] 继电器闭合持续时间(500-5000ms)
* @return  0 获取成功
* @return  <0 获取失败
*/
SDK_API int SDK_CALL ZBX_GetAlarmDuration(ZBX_Cam* cam, int* duration);

/**
* @brief   设置闸机继电器闭合持续时间
* @param   cam[in]   相机句柄
* @param   duration[in] 继电器闭合持续时间(500-5000ms)
* @return  0 设置成功
* @return  <0 设置失败
*/
SDK_API int SDK_CALL ZBX_SetAlarmDuration(ZBX_Cam* cam, int duration);


/**
* @brief   获取闸机开闸类型
* @param   cam[in]  相机句柄
* @param   type[in]  //0：刷脸，1：刷卡，2：刷身份证，3：刷脸+刷卡
* @mode //4：刷脸+刷身份证，5：刷脸或刷卡，6：刷脸或刷身份证，7：过人开闸
* @return  0 获取成功
* @return  <0 获取失败
*/
SDK_API int SDK_CALL ZBX_GetGatewayControlType(ZBX_Cam* cam, int* type);

/**
* @brief   设置闸机开闸类型
* @param   cam[in]  相机句柄
* @param   type[in]  //0：刷脸，1：刷卡，2：刷身份证，3：刷脸+刷卡
* @mode //4：刷脸+刷身份证，5：刷脸或刷卡，6：刷脸或刷身份证，7：过人开闸
* @return  0 设置成功
* @return  <0 设置失败
*/
SDK_API int SDK_CALL ZBX_SetGatewayControlType(ZBX_Cam* cam, int type);

/**
* @brief   设置身份证对比准确性数据
* @return  无
*/
SDK_API int SDK_CALL ZBX_SetIDCardScore(ZBX_Cam* cam, int score);



/**
* @brief   获取身份证对比准确性数据
* @return  无
*/
SDK_API int SDK_CALL ZBX_GetIDCardScore(ZBX_Cam* cam, int *score);

/**
* @brief   查看过期自动清理开关
* @param   cam[in]   相机句柄
* @param   enable[out] 清理开关:关 1:开
* @return  0 获取成功
* @return  <0 获取失败  参考错误码
*/
SDK_API int SDK_CALL ZBX_GetAutoCleanEnable(ZBX_Cam* cam, int* enable);

/**
* @brief   设置过期自动清理开关
* @param   cam[in]   相机句柄
* @param   enable[in] 清理开关，0:关 1:开
* @return  0 设置成功
* @return  <0 设置失败  参考错误码
*/
SDK_API int SDK_CALL ZBX_SetAutoCleanEnable(ZBX_Cam* cam, int enable);


/**
* @brief   设置相机点位编号
* @return  无
*/
SDK_API int SDK_CALL ZBX_SetDevName(ZBX_Cam* cam, const char* name);

/**
* @brief   获取相机点位编号
* @return  无
*/
SDK_API int SDK_CALL ZBX_GetDevName(ZBX_Cam* cam, char* name, int* nameSize);



/**
* @brief   设置用户权限
* @return  无
*/
SDK_API int SDK_CALL ZBX_SetUserRightsCfg(ZBX_Cam* cam, UserRightsCfgs cfg);


/**
* @brief   注册用户权限信息回调
* @param   cb[in] 回调函数指针
* @param   usrParam[in] 用户参数
* @return  无
*/
SDK_API void SDK_CALL ZBX_RegUserRightsCfgCb(ZBX_Cam* cam,ZBX_UserRightsCfgCb_t cb,void *usrParam);


/**
* @brief   设置设备加密密码
* @return  无
*/
SDK_API int SDK_CALL ZBX_SetDeviceKey(ZBX_Cam* cam, DeviceKey devKey);

/**
* @brief   获取用户权限
* @return  无
*/
SDK_API void SDK_CALL ZBX_GetUserRightsCfg(ZBX_Cam* cam);

/*
* @brief   上传背景图接口
* @param   文件路径（图片名必须为bmp）
* @param
* @return 0 成功
*/
SDK_API int SDK_CALL ZBX_UpdateBackgroud(ZBX_Cam* cam, const char* filePth);

/**
* @brief   恢复出厂界面
* @return  无
*/
SDK_API int SDK_CALL ZBX_SetBackGroudDefault(ZBX_Cam* cam);

/**
* @brief   更新屏幕显示界面
* @return  无
*/
SDK_API int SDK_CALL ZBX_UpdateBackGroudDefault(ZBX_Cam* cam);

/**
* @brief   设置群组
* @return  无
*/
SDK_API int SDK_CALL ZBX_SetGroupRec(ZBX_Cam* cam, Group_Rec grop_rec);

/**
* @brief   获取群组
* @return  无
*/
SDK_API int SDK_CALL ZBX_GetGroupRec(ZBX_Cam* cam, Group_Rec *grop_rec);

/**
* @brief   验证密钥
* @return  无
*/
SDK_API void SDK_CALL ZBX_SetAppKey(ZBX_Cam* cam, const char* key, int nsize);

/**
* @brief   获取相机工作模式
* @param   cam[in]   相机句柄
* @param   work_mode[out] 相机工作模式。//0：离线，1：在线，2：自动
* @return  0 获取成功
* @return  <0 获取失败
*/
SDK_API int SDK_CALL ZBX_GetCameraWorkMode(ZBX_Cam* cam,unsigned char* work_mode);

/**
* @brief   设置相机工作模式
* @param   cam[in]   相机句柄
* @param   work_mode[in] 相机工作模式。//0：离线，1：在线，2：自动
* @return  0 设置成功
* @return  <0 设置失败
*/
SDK_API int SDK_CALL ZBX_SetCameraWorkMode(ZBX_Cam* cam, unsigned char work_mode);


/**
*  @brief 修改人脸信息
*  @param  [IN] cam 要修改的相机句柄
*  @param  [IN] faceID 人员标记，用于唯一标记注册的人脸
*  @param  [IN] imgs 人脸图像，图像格式须为JPG
*  @return 返回值为0表示成功，返回负数表示失败，具体参考错误码
*/
SDK_API int SDK_CALL ZBX_ModifyFaces(ZBX_Cam* cam, FaceFlags* faceID, FaceImage* imgs);



/**
*  @brief 修改语音文件
*  @param  [IN] cam 要修改的相机句柄
*  @param  [IN] filepath 文件的路径  目前只支持wav格式
*  @param  [IN] 需要上传的语音类型
*  @return 返回值为0表示成功，返回负数表示失败，具体参考错误码
*/
SDK_API int SDK_CALL ZBX_ModifyAudio(ZBX_Cam* cam, const char* filePth, VOL_TYPE ntype);

/**
*  @brief 恢复语音文件
*  @param  [IN] cam 要修改的相机句柄
*  @param  [IN] 需要上传的语音类型
*  @return 返回值为0表示成功，返回负数表示失败，具体参考错误码
*/
SDK_API int SDK_CALL ZBX_ModifyFactoryAudio(ZBX_Cam* cam, VOL_TYPE ntype);


/**
*  @brief 试听语音文件
*  @param  [IN] cam 要修改的相机句柄
*  @param  [IN] 需要上传的语音类型
*  @return 返回值为0表示成功，返回负数表示失败，具体参考错误码
*/
SDK_API int SDK_CALL ZBX_TestAudio(ZBX_Cam* cam, VOL_TYPE ntype);


/**
* @brief   开始录像
* @param   cam[in]   相机句柄
* @param   sFileName[in] 录像文件路径 目前只支持录制avi
* @return  0 成功
* @return  <0 失败
*/
SDK_API int SDK_CALL ZBX_SaveRealDate(ZBX_Cam* cam, char* sFileName);

/**
* @brief   停止录像
* @param   cam[in]   相机句柄
* @return  0 成功
* @return  <0 失败
*/
SDK_API int SDK_CALL ZBX_StopSaveRealDate(ZBX_Cam* cam);


/**
* @brief   获取相机gpio工作状态
* @param   cam[in]   相机句柄
* @param   state[out] gpio状态。 //0:自动，1：常闭，2：常开
* @return  0 获取成功
* @return  <0 获取失败
*/
SDK_API int SDK_CALL ZBX_GetGpioWorkState(ZBX_Cam* cam, int* state);

/**
* @brief   设置相机gpio工作状态
* @param   cam[in]   相机句柄
* @param   state[in] gpio状态。  //0:自动，1：常闭，2：常开
* @return  0 获取成功
* @return  <0 获取失败
*/
SDK_API int SDK_CALL ZBX_SetGpioWorkState(ZBX_Cam* cam,int state);


/**
* @brief   获取人脸抓拍图片模式
* @param   cam[in]   相机句柄
* @param   ctl[out]   //0:普通，1：大脸模式
* 16:调试图像（功能复选的时候，对对应数字做与操作）
* @return  0 获取成功
* @return  <0 获取失败  
*/
SDK_API int SDK_CALL ZBX_GetOutputCtl(ZBX_Cam* cam, int* ctl);

/**
* @brief   设置模式
* @param   cam[in]   相机句柄
* @param   ctl[in] 输出控制，//0:普通，1：大脸模式
* 16:调试图像（功能复选的话，对应数字做或操作）
* @return  0 设置成功
* @return  <0 设置失败 
*/
SDK_API int SDK_CALL ZBX_SetOutputCtl(ZBX_Cam* cam, int ctl);


/**
* @brief   获取人脸识别距离
* @param   cam[in]   相机句柄
* @param   min最小距离
* @param   max最大距离
* @return  0 获取成功
* @return  <0 获取失败
*/
SDK_API int SDK_CALL ZBX_GetRecoDist(ZBX_Cam* cam, double* min,double* max);

/**
* @brief   设置人脸识别距离
* @param   cam[in]   相机句柄
* @param   min最小距离
* @param   max最大距离
* @return  0 设置成功
* @return  <0 设置失败
*/
SDK_API int SDK_CALL ZBX_SetRecoDist(ZBX_Cam* cam, double min, double max);


/**
* @brief   触发韦根开闸,需指定开闸模式
* @param   cam[in]   相机句柄
* @param   wiegand_no[in]  韦根卡号
* @param   alarm_mode[in] 暂时无效 传0即可
* @param   person_id[in] 暂时无效 传NULL即可
* @return  0 成功
* @return  <0 失败
*/
SDK_API int SDK_CALL ZBX_WiegandAlarmEx(ZBX_Cam* cam, unsigned int wiegand_no,
	unsigned char alarm_mode,
	unsigned char* person_id);

/**
* @brief   设置定时重启
* @param   cam[in]   相机句柄
* @param   enable[in]  0：不启用，1：启用
* @param   time[in] 一天的秒数
* @return  0 成功
* @return  <0 失败
*/
SDK_API int SDK_CALL ZBX_SetAutoReboot(ZBX_Cam* cam, int enable,
	int time);


/**
* @brief   获取定时重启
* @param   cam[in]   相机句柄
* @param   enable[out]  0：不启用，1：启用
* @param   time[out] 一天的秒数
* @return  0 成功
* @return  <0 失败
*/
SDK_API int SDK_CALL ZBX_GetAutoReboot(ZBX_Cam* cam, int* enable,
	int* time);

/**
* @brief   查询TF卡的文件夹
* @param   cam[in]   相机句柄
* @param   folder[out]  
* @return  0 成功
* @return  <0 失败
*/
SDK_API int SDK_CALL ZBX_GetTFFolders(ZBX_Cam* cam, RecordFolders* folder);

/**
* @brief   注册TF记录查询
* @param   cb[in] 回调函数指针
* @param   usrParam[in] 用户参数
* @return  无
*/
SDK_API void SDK_CALL ZBX_RegTFRecordCb(ZBX_Cam* cam, ZBX_tfFaceRecordCb_t cb,
	void* usrParam);

/**
* @brief   TF记录查询
* @param   cam[in] 相机句柄
* @param   folderName[in] 文件夹名称
* @param  
* @return  无
*/
SDK_API void SDK_CALL ZBX_QueryTFRecord(ZBX_Cam* cam, const char* folderName);


/**
* @brief   TF记录图片查询
* @param   cam[in] 相机句柄
* @param   time[in] 抓拍日期  
* @param   filename[in] 图片名称
* @param   img[out] 数据长度
* @return  无
*/
SDK_API int SDK_CALL ZBX_QueryTFRecordimg(ZBX_Cam* cam, const tfRecordData time, const char* filename, RecordImg* img);

/**
* @brief   查询磁盘信息
* @param   cam[in] 相机句柄
* @param   diskinfo[out] 磁盘信息
* @return  无
*/
SDK_API int SDK_CALL ZBX_QueryDiskInfo(ZBX_Cam* cam, tf_diskinfo* diskinfo);

/**
* @brief   格式化磁盘
* @param   cam[in] 相机句柄
* @param   diskName[int] 磁盘分区名
* @return  无
*/
SDK_API int SDK_CALL ZBX_FormatDisk(ZBX_Cam* cam, const char* diskName);


/**
* @brief   删除磁盘信息
* @param   cam[in] 相机句柄
* @return  无
*/
SDK_API int SDK_CALL ZBX_DelDiskData(ZBX_Cam* cam);

/**
* @brief   获取最大角度人脸过滤开关
* @param   cam[in]   相机句柄
* @param   angle[out] 过滤的最大角度
* @param   enable[out] 目前为!0
* @return  0 获取成功
* @return  <0 获取失败
*/
SDK_API int SDK_CALL ZBX_GetValidAngleEnable(ZBX_Cam* cam, int* angle,
	int* enable);

/**
* @brief   设置最大角度人脸过滤开关
* @param   cam[in]   相机句柄
* @param   angle[in] 过滤的最大角度 0~90度
* @param   enable[in] 目前请填!0
* @return  0 获取成功
* @return  <0 获取失败
*/
SDK_API int SDK_CALL ZBX_SetValidAngleEnable(ZBX_Cam* cam,const int angle,
	const int enable);


/**
* @brief   设置UI更新包路径
* @param   cam[in]   相机句柄
* @param   path[in] UI包路径
* @enable  是否启用  为1则直接启用  如果为0 则为初始化为最初界面
* @return  0 获取成功
* @return  <0 获取失败
*/
SDK_API int SDK_CALL ZBX_SetUIPackage(ZBX_Cam* cam, const char* angle,
	const int enable);


/**
* @brief   查看MQTT参数配置
* @param   cam[in]   相机句柄
* @param   mqttInfo[out] MQTT参数
* @return  0 获取成功
* @return  <0 获取失败  参考错误码
*/
SDK_API int SDK_CALL ZBX_GetMQTTConfig(ZBX_Cam* cam, MQTT_Config* mqttInfo);

/**
* @brief   设置MQTT参数配置
* @param   cam[in]   相机句柄
* @param   mqttInfo[in] MQTT参数
* @return  0 设置成功
* @return  <0 设置失败  参考错误码
*/
SDK_API int SDK_CALL ZBX_SetMQTTConfig(ZBX_Cam* cam, MQTT_Config mqttInfo);



/**
* @brief   查看MQTT参数配置
* @param   cam[in]   相机句柄
* @param   mqttInfo[out] MQTT参数
* @return  0 获取成功
* @return  <0 获取失败  参考错误码
*/
SDK_API int SDK_CALL ZBX_GetMQTTConfigEx(ZBX_Cam* cam, MQTT_ConfigEx* mqttInfo);

/**
* @brief   设置MQTT参数配置
* @param   cam[in]   相机句柄
* @param   mqttInfo[in] MQTT参数
* @return  0 设置成功
* @return  <0 设置失败  参考错误码
*/
SDK_API int SDK_CALL ZBX_SetMQTTConfigEx(ZBX_Cam* cam, MQTT_ConfigEx mqttInfo);

/**
*  @brief 设置宽动态模式
*  @param  [IN] cam 要修改的相机句柄
*  @param  [IN] 设置的模式
*  @param  [IN] 0:auto,1:close,2:open
*  @return 返回值为0表示成功，返回负数表示失败，具体参考错误码
*/
SDK_API int SDK_CALL ZBX_SetIspWdr(ZBX_Cam* cam, int mode);

/**
*  @brief 获取宽动态模式
*  @param  [IN] cam 要修改的相机句柄
*  @param  [IN] 宽动态模式
*  @param  [IN] 0:auto,1:close,2:open
*  @return 返回值为0表示成功，返回负数表示失败，具体参考错误码
*/
SDK_API int SDK_CALL ZBX_GetIspWdr(ZBX_Cam* cam, int *mode);

/**
*  @brief 设置宽动态模式
*  @param  [IN] cam 要修改的相机句柄
*  @param  [IN] 设置的模式
*  @param  [IN] 0:auto,1:close,2:open 3:TimeSlot
*  @return 返回值为0表示成功，返回负数表示失败，具体参考错误码
*/
SDK_API int SDK_CALL ZBX_SetIspWdrEx(ZBX_Cam* cam, WDR_time_ctrl mode_ctrl);

/**
*  @brief 获取宽动态模式
*  @param  [IN] cam 要修改的相机句柄
*  @param  [IN] 宽动态模式
*  @param  [IN] 0:auto,1:close,2:open 3:TimeSlot
*  @return 返回值为0表示成功，返回负数表示失败，具体参考错误码
*/
SDK_API int SDK_CALL ZBX_GetIspWdrEx(ZBX_Cam* cam, WDR_time_ctrl* mode_ctrl);

/*
* @brief   注入用户校验码
* @param   cam[in] 相机句柄
* @param   auth[in] 校验码数据
* @param   size[in] 校验码长度
* @return  0 成功
* @return  <0 失败
*/
SDK_API int SDK_CALL ZBX_WriteCustomerAuthCode(ZBX_Cam* cam, char* auth,
	int size);

/*
* @brief   读取用户校验码
* @param   cam[in] 相机句柄
* @param   auth[out] 校验码数据
* @param   size[out] 校验码长度
* @return  0 成功
* @return  <0 失败
*/
SDK_API int SDK_CALL ZBX_ReadCustomerAuthCode(ZBX_Cam* cam, char* auth,
	int* size);



/*
* @brief  特殊韦根号设置
* @param   cam[in] 相机句柄
* @param   size[in] 
* @return  0 成功
* @return  <0 失败
*/
SDK_API int SDK_CALL ZBX_SetSpecialWg(ZBX_Cam* cam, wg_special wgs);

/*
* @brief  特殊韦根号获取
* @param   cam[in] 相机句柄
* @param   size[in]
* @return  0 成功
* @return  <0 失败
*/
SDK_API int SDK_CALL ZBX_GetSpecialWg(ZBX_Cam* cam, wg_special* wgs);


/*
* @brief  韦根输入输出模式设置 仅支持AI80
* @param   cam[in] 相机句柄 
* @param   type[in] //0：IN，1：OUT
* @return  0 成功
* @return  <0 失败
*/
SDK_API int SDK_CALL ZBX_SetWgIO_type(ZBX_Cam* cam, int type);

/*
* @brief 输出模式获取
* @param   cam[in] 相机句柄
* @param   type[in] //0：IN，1：OUT
* @return  0 成功
* @return  <0 失败
*/
SDK_API int SDK_CALL ZBX_GetWgIO_type(ZBX_Cam* cam, int* type);



/*
* @brief 获取离线数据
* @brief  该接口无效
* @param   cam[in] 相机句柄
* @param   squece[in] 需要查寻询的记录ID 从0开始  
* @param  
* @return  0 成功
* @return  <0 失败
*/
SDK_API int SDK_CALL ZBX_QueryFaceOffLineReco(ZBX_Cam* cam,
	const int squece,
	FaceRecoInfo *face_info);


/*
* @brief   上传证书接口
* @param   文件路径（文件格式必须为crt）
* @param
* @return 0 成功
*/
SDK_API int SDK_CALL ZBX_UpdateCrtFile(ZBX_Cam* cam, const char* filePth);

/*
* @brief   上传广告接口
* @param   文件路径
* @param   文件格式必须为ad_0.jpg ad_1.jpg  ad_2.jpg ad_3.jpg ad_4.jpg 
* @param
* @return 0 成功
*/
SDK_API int SDK_CALL ZBX_UpdateAdFile(ZBX_Cam* cam, const char* filePth);

/**
*  @brief  获取重启日志
*  @param  [IN] cam 要获的相机句柄
*  @param  [IN]
*  @param  [OUT]
*  @return 返回值为0表示成功，返回负数表示失败，具体参考错误码
*/
SDK_API int SDK_CALL ZBX_GetRebootLog(ZBX_Cam* cam, Reboot_info *info);
#ifdef __cplusplus
}
#endif

#endif  // SDK_H_
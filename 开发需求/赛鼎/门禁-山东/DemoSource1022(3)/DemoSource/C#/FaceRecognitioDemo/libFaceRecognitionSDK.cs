using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;

namespace FaceRecognitioDemo
{
    class libFaceRecognitionSDK
    {
        //public CDiscoverDeviceDlg gthis = NULL;

        [System.Runtime.InteropServices.StructLayoutAttribute(System.Runtime.InteropServices.LayoutKind.Sequential)]
        //系统网络信息
        public struct SystemNetInfo
        {
            [MarshalAsAttribute(UnmanagedType.ByValTStr, SizeConst = 18)]
            public string mac_addr;  //网卡物理地址
            [MarshalAsAttribute(UnmanagedType.ByValTStr, SizeConst = 16)]
            public string ip_addr;   //相机ip地址
            [MarshalAsAttribute(UnmanagedType.ByValTStr, SizeConst = 16)]
            public string netmask;   //子网掩码
            [MarshalAsAttribute(UnmanagedType.ByValTStr, SizeConst = 16)]
            public string gateway;   //默认网关
            [MarshalAsAttribute(UnmanagedType.ByValTStr, SizeConst = 14)]
            public string resv;      //保留
        };


           [System.Runtime.InteropServices.StructLayoutAttribute(System.Runtime.InteropServices.LayoutKind.Sequential)]
        public struct QueryFaceInfo
        {
            //人脸查询回调返回
            public int record_count;     //查询的角色记录总量
            public int record_no;        //当前收到的记录序号
            [MarshalAsAttribute(UnmanagedType.ByValTStr, SizeConst = 20)]
            public string personID;    //人员ID
            [System.Runtime.InteropServices.MarshalAsAttribute(System.Runtime.InteropServices.UnmanagedType.ByValArray, SizeConst = 16, ArraySubType = System.Runtime.InteropServices.UnmanagedType.I1)]
            public  byte[]   personName;  //姓名
            int role;  //人员角色 0：普通人员。 1：白名单人员。 2：黑名单人员。
            //-1：所有人员。
            public short feature_count;  //当前id的特征数总量
            public short feature_size;   //人脸特征数据长度
            public IntPtr
                 feature;  //人脸特征数据，按顺序排列所有特征数据 featureSize*feature_count
            public int imgNum;   //模板图像数量

            [MarshalAsAttribute(UnmanagedType.ByValArray, SizeConst = 5, ArraySubType = UnmanagedType.I1)]
            public int[] imgSize;     //图像大小，imgSize[i]为第i张图片的大小
            [MarshalAsAttribute(UnmanagedType.ByValArray, SizeConst = 5 * 4, ArraySubType = UnmanagedType.I1)]
            public char[] imgFmt;  //图像格式,imgFmt[i]为第i张图片的格式

            // [MarshalAsAttribute(UnmanagedType.ByValArray, SizeConst = 1, ArraySubType = UnmanagedType.I1)]
            //BYTE byRes[1];  //  public byte[]			byRes;	//预留例子1

            [MarshalAsAttribute(UnmanagedType.ByValArray, SizeConst = 5, ArraySubType = UnmanagedType.I1)]
            public IntPtr[] imgBuff;  // imgBuff[i]位第i张图片给数据首地址
            public uint wgCardNO;      //韦根门禁卡号
            public uint
                 effectTime;  //有效期截止时间，该人员信息在该时间内有效,从1970年1月1日0时0分0秒到截止时间的秒数（0xFFFFFFFF表示永久有效，0表示永久失效）
            public uint
                 effectStartTime;  //有效期起始时间，该人员信息在该时间之后有效,从1970年1月1日0时0分0秒到起始时间的秒数（0表示未初始化）


        };

        [System.Runtime.InteropServices.StructLayoutAttribute(System.Runtime.InteropServices.LayoutKind.Sequential)]
        public struct FaceFlags
        {
            [MarshalAsAttribute(UnmanagedType.ByValTStr, SizeConst = 20)]
            public string faceID;    //人员ID
          //[MarshalAsAttribute(UnmanagedType.ByValTStr, SizeConst = 16)]
            //[System.Runtime.InteropServices.MarshalAsAttribute(System.Runtime.InteropServices.UnmanagedType.ByValArray,
            //    SizeConst = 16, ArraySubType = System.Runtime.InteropServices.UnmanagedType.I1)]
            [MarshalAsAttribute(UnmanagedType.ByValArray, SizeConst = 16,ArraySubType = UnmanagedType.I1)]
            public byte[]   faceName;  //人员姓名
            int role;  //人员角色，0：普通人员。 1：白名单人员。 2：黑名单人员。
            //-1：所有人员。
            public uint wgCardNO;  //韦根协议门禁卡号
            public uint
                 effectTime;  //有效期截止时间，该人员信息在该时间内有效,从1970年1月1日0时0分0秒到截止时间的秒数（0xFFFFFFFF表示永久有效，0表示永久失效）
            public uint
               effectStartTime;  //有效期起始时间，该人员信息在该时间之后有效,从1970年1月1日0时0分0秒到起始时间的秒数（0表示未初始化）
            [MarshalAsAttribute(UnmanagedType.ByValTStr, SizeConst = 8184)]
            public string resv;
        };
        [System.Runtime.InteropServices.StructLayoutAttribute(System.Runtime.InteropServices.LayoutKind.Sequential)]
        public struct FaceImage
        {
            public int img_seq;         //图片编号
            public int img_fmt;         //图片格式 0：jpg 1：bgr
            public IntPtr img;  //要注册的人脸图片数据，支持主流图像格式
            public int img_len;         // img的长度
            public int width;           //图像宽度，jpg图像不填此项
            public int height;          //图像高度，jpg图像不填此项
        };





        [System.Runtime.InteropServices.StructLayoutAttribute(System.Runtime.InteropServices.LayoutKind.Sequential)]
        public struct ipscan_t
        {


            [MarshalAsAttribute(UnmanagedType.ByValTStr, SizeConst = 20)]
            //  [MarshalAs(UnmanagedType.ByValTStr, SizeConst = 20)]
            //mac 地址
            public string mac;
            //IP
            [MarshalAsAttribute(UnmanagedType.ByValTStr, SizeConst = 20)]
            public string ip;

            [MarshalAsAttribute(UnmanagedType.ByValTStr, SizeConst = 20)]
            public string netmask;
               [System.Runtime.InteropServices.MarshalAsAttribute(System.Runtime.InteropServices.UnmanagedType.ByValArray,
                   SizeConst = 20, ArraySubType = System.Runtime.InteropServices.UnmanagedType.I1)]
            //制造商
         //   [MarshalAsAttribute(UnmanagedType.ByValTStr, SizeConst = 20)]
            public byte[] manufacturer;

            [MarshalAsAttribute(UnmanagedType.ByValTStr, SizeConst = 20)]

            public string platform;
            [MarshalAsAttribute(UnmanagedType.ByValTStr, SizeConst = 20)]
            public string system;
            [MarshalAsAttribute(UnmanagedType.ByValTStr, SizeConst = 20)]
            public string version;
        };

        [System.Runtime.InteropServices.StructLayoutAttribute(System.Runtime.InteropServices.LayoutKind.Sequential)]
        public struct FaceRecoInfo
        {
            public uint sequence;  //抓拍序号，从1开始，每产生一组抓拍数据增加1。

            [MarshalAsAttribute(UnmanagedType.ByValTStr, SizeConst = 32)]
            public string camId;    //相机编号

            [MarshalAsAttribute(UnmanagedType.ByValTStr, SizeConst = 32)]
            public string posId;    //点位编号

            [MarshalAsAttribute(UnmanagedType.ByValTStr, SizeConst = 96)]
            public string posName;  //点位名称

            public uint tvSec;  //抓拍时间秒数，从1970年01月01日00时00分00秒至抓拍时间经过的秒数。
            public uint tvUsec;  //抓拍时间微秒数，tvSec的尾数

            public short isRealtimeData;  //实时抓拍标志，0：非实时抓拍数据。非0：实时抓拍数据。

            public short matched;  //比对结果，0：未比对。-1：比对失败。大于0的取值：比对成功时的确信度分数（100分制）。

            [MarshalAsAttribute(UnmanagedType.ByValTStr, SizeConst = 20)]
            public string matchPersonId;    //人员ID

          [System.Runtime.InteropServices.MarshalAsAttribute(System.Runtime.InteropServices.UnmanagedType.ByValArray, SizeConst = 16, ArraySubType = System.Runtime.InteropServices.UnmanagedType.I1)]
            public byte[] matchPersonName;  //人员姓名
            public int matchRole;  //人员角色，0：普通人员。 1：白名单人员。 2：黑名单人员

            public int existImg;  //全景图，是否包含全景图像。0：不包含全景图像。非0：包含全景图像。

            [MarshalAsAttribute(UnmanagedType.ByValTStr, SizeConst = 4)]
            public string imgFormat;          //全景图像格式
            public int imgLen;                 //全景图像大小
            public ushort faceXInImg;  //人脸位于全景图像的X坐标。
            public ushort faceYInImg;  //人脸位于全景图像的y坐标
            public ushort faceWInImg;  //人脸位于全景图像宽度
            public ushort faceHInImg;  //人脸位于全景图像高度

            public int existFaceImg;  //人脸图，特写图像标志，是否包含特写图像。0：不包含特写图像。非0：包含特写图像。

            [MarshalAsAttribute(UnmanagedType.ByValTStr, SizeConst = 4)]
            public string faceImgFormat;          //人脸图像封装格式。
            public int faceImgLen;                 //特写图像大小
            public ushort faceXInFaceImg;  //人脸位于特写图像的X坐标。
            public ushort faceYInFaceImg;  //人脸位于特写图像的y坐标。
            public ushort faceWInFaceImg;  //人脸位于特写图像的宽度
            public ushort faceHInFaceImg;  //人脸位于特写图像的高度

            public int existVideo;  //是否包含视频。0：不包含视频。非0：包含视频。
            public uint videoStartSec;   //视频起始时间（秒）
            public uint videoStartUsec;  // videoStartSec尾数，微妙
            public uint videoEndSec;     //视频结束时间（秒）
            public uint videoEndUsec;    // videoEndSec尾数，微妙
            [MarshalAs(UnmanagedType.ByValTStr, SizeConst = 4)]
            public string videoFormat;          //视频封装格式。
            public int videoLen;                 //视频大小

            public byte sex;         //性别 0: 无此信息 1：男 2：女
            public byte age;         //年龄 0: 无此信息 其它值：年龄
            public byte expression;  //表情 0: 无此信息 其它值：暂未定义
            public byte skinColour;  //肤色 0: 无此信息 其它值：暂未定义
            public byte qValue;  //注册标准分数，分数越高越适合用来注册

            [MarshalAsAttribute(UnmanagedType.ByValTStr, SizeConst = 123)]
            public string resv;        //保留


            //    [MarshalAs(UnmanagedType.LPArray)]
            public IntPtr img;           //全景图像数据

            //   [MarshalAs(UnmanagedType.LPArray)]
            public IntPtr faceImg;       //特写图像数据
            //    [MarshalAs(UnmanagedType.LPArray)]
            public IntPtr video;         //视频数据
            public int feature_size;             //当前抓拍人脸的特征数据大小
            public IntPtr feature;               //当前抓拍人脸的特征数据
            public int modelFaceImgLen;          //模板人脸图像长度

            [MarshalAsAttribute(UnmanagedType.ByValTStr, SizeConst = 4)]
            public string modelFaceImgFmt;      //模板人脸图像类型
            // [MarshalAs(UnmanagedType.LPArray)]
            public IntPtr modelFaceImg;  //模板人脸图像数据
        }

        public libFaceRecognitionSDK()
        {

        }


        /**
         * @brief   sdk初始化，
         * @brief   1)最多连接9个相机。
         * @brief   2)与ZBX_InitEx这两个函数，二者只能调其中一个。
         * @brief   3)如果想连接更多相机，请调用ZBX_InitEx
         * @param   无
         * @return  无
         */
        [DllImport("libFaceRecognitionSDK_x86.dll")]
        public static extern void ZBX_Init();

        //设置是否需要相机连接上的事件的回调通知
        [DllImport("libFaceRecognitionSDK_x86.dll")]
        public static extern void ZBX_SetNotifyConnected(int notify);


        /**
         * @brief   断开相机
         * @param   cam[in]   相机句柄
         * @return  无
         */
        [DllImport("libFaceRecognitionSDK_x86.dll")]
        public static extern void ZBX_DisConnect(IntPtr cam);

        /**
 * @brief   连接相机
 * @param   ip[in]   相机ip
 * @param   port[in]   相机端口，固定为9527
 * @param   usrName[in]   用户名，目前版本无效，传空即可
 * @param   password[in]   密码，目前版本无效，传空即可
 * @param   errorNum[out]  连接失败错误号，0为连接成功，-1为连接失败
 * @param   channel[in]
 * 码流通道号，有特殊需求的用户使用，无特殊需求用户直接传0通道即可
 * @param   autoReconn[in] 自动重连标志，为1自动重连，0不会自动重连
 * @return  autoReconn为1时，固定返回相机句柄
 * @return  autoReconn为0时，连接成功时返回相机句柄，连接失败时返回NULL
 * @return  建议用户使用自动重连,autoReconn为1
 */
        [DllImport("libFaceRecognitionSDK_x86.dll")]
        public static extern IntPtr ZBX_ConnectEx(string ip, ushort port,
            string usrName, string password, ref IntPtr errorNum, uint channel,
                                      int autoReconn);


        /**
 * @brief   是否连接相机
 * @param   cam[in]   相机句柄
 * @return  0 未连接
 * @return  1 已连接
 */
        [DllImport("libFaceRecognitionSDK_x86.dll")]
        public static extern int ZBX_Connected(IntPtr cam);



        public delegate void ZBX_FaceRecoCb_t(IntPtr cam, ref  FaceRecoInfo pUserData,
                                                         IntPtr usrParam);


        /**
 * @brief   注册人脸抓拍数据接收回调函数
 * @param   cb[in] 回调函数指针
 * @param   usrParam[in] 用户参数
 * @return  无
 */

        [DllImport("libFaceRecognitionSDK_x86.dll", CallingConvention = CallingConvention.StdCall)]
        // [DllImport("libFaceRecognitionSDK_x86.dll")]
        public static extern void ZBX_RegFaceRecoCb(IntPtr cam, ZBX_FaceRecoCb_t fun, IntPtr usrParam);
        //SDK_API void SDK_CALL ZBX_RegFaceRecoCb(ZBX_Cam* cam, ZBX_FaceRecoCb_t cb,
        //                               void* usrParam);

        /**

  * @brief   搜索相机
  * @param   无
  * @return  无
  */
        [DllImport("libFaceRecognitionSDK_x86.dll")]
        public static extern void ZBX_DiscoverIpscan();

        /**
 * @brief   注册搜索相机回调函数
 * @param   cb[in] 回调函数指针
 * @param   usrParam[in] 用户参数
 * @return  无
 */

        public delegate void discover_ipscan_cb_t(ref  ipscan_t ipscan,
                                             int usr_param);
        [DllImport("libFaceRecognitionSDK_x86.dll", CallingConvention = CallingConvention.StdCall)]
        public static extern void ZBX_RegDiscoverIpscanCb(discover_ipscan_cb_t cb,
                                             int usrParam);

        /**
 * @brief   开始显示视频流
 * @param   cam[in]   相机句柄
 * @param   hWnd[in]   窗口句柄
 * @return  无 
 */
        [DllImport("libFaceRecognitionSDK_x86.dll")]
        public static extern void ZBX_StartStream(IntPtr cam, IntPtr hWnd);
        //SDK_API void SDK_CALL ZBX_StartStream(ZBX_Cam* cam, HWND hWnd);

        /**
 * @brief   终止显示某一个窗口句柄视频流
 * @param   cam[in]   相机句柄
 * @return  无
 */
        [DllImport("libFaceRecognitionSDK_x86.dll")]
        public static extern void ZBX_StopStreamEx(IntPtr cam, IntPtr hWnd);



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
        [DllImport("libFaceRecognitionSDK_x86.dll")]
        public static extern int ZBX_AddJpgFaces(IntPtr cam, ref FaceFlags faceID,
                                     ref FaceImage imgs, int img_count,
                                    int picture_flags);

        //   [UnmanagedFunctionPointer(CallingConvention.Cdecl, CharSet = CharSet.Ansi)]
        public delegate void ZBX_FaceQueryCb_t(IntPtr cam,
                                        ref QueryFaceInfo faceQueryInfo,
                                        IntPtr usrParam);

        /**
 * @brief   注册人脸查询数据回调函数
 * @param   cb[in] 回调函数指针
 * @param   usrParam[in] 用户参数
 * @return  无
 */
        [DllImport("libFaceRecognitionSDK_x86.dll", CallingConvention = CallingConvention.StdCall)]
        public static extern void ZBX_RegFaceQueryCb(IntPtr cam, ZBX_FaceQueryCb_t cb,
                                       IntPtr usrParam);


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
        [DllImport("libFaceRecognitionSDK_x86.dll")]
        public static extern int ZBX_QueryByRole(IntPtr cam, int role, int page_no,
                                            int page_size, char featureFlags,
                                            char imgFlags);

        /**
 *  @brief 删除一个人员信息
 *  @param  [IN] cam 要注销的相机句柄
 *  @param  [IN] personID  需要删除的人脸ID
 *  @return 返回值为0表示成功，返回负数表示失败，具体参考错误码
 */
        [DllImport("libFaceRecognitionSDK_x86.dll")]
        public static extern int ZBX_DeleteFaceDataByPersonID(IntPtr cam,
                                                    string personID);

        /**
*  @brief 获取已经添加的人脸中总数
*  @param  [IN] cam 相机句柄
*  @return 返回已经添加的人脸总数，返回值小于0表示出错，参考错误码
*/
        [DllImport("libFaceRecognitionSDK_x86.dll")]
        public static extern int ZBX_GetFaceIDTotal(IntPtr cam
                                                   );

        /**
 *  @brief 删除所有人脸
 *  @param  [IN] cam 要删除的相机句柄
 *  @return 返回值为0表示成功，返回负数表示失败，具体参考错误码
 */
        [DllImport("libFaceRecognitionSDK_x86.dll")]
        public static extern int ZBX_DeleteFaceDataAll(IntPtr cam);

        /**
 * @brief   设置外网sdk服务参数
 * @param   cam[in]   相机句柄
 * @param   enable[in] 0:关 !0：开
 * @return  ip[in] 服务端sdk服务地址
 * @return  port[in] 服务端sdk服务端口
 * @return  resv[in] 11个字节保留字段
 * @return  <0 设置失败  参考错误码
 */
        [DllImport("libFaceRecognitionSDK_x86.dll")]
        public static extern int ZBX_SetServerSdkParam(IntPtr cam, int enable, string ip,
                                                  int port, string resv);



        /**
 * @brief   获取人脸比对确性分数
 * @param   cam[in]   相机句柄
 * @param   score[out] 确信分数（0-100分）
 * @return  0 获取成功
 * @return  <0 获取失败  配置.h并没有更新
 */
        [DllImport("libFaceRecognitionSDK_x86.dll")]
        public static extern int ZBX_GetMatchScore(IntPtr cam, ref IntPtr score);

        /**
 * @brief   设置人脸比对确性分数
 * @param   cam[in]   相机句柄
 * @param   score[in] 确信分数（0-100分）
 * @return  0 设置成功
 * @return  <0 设置失败  配置.h并没有更新
 */
        [DllImport("libFaceRecognitionSDK_x86.dll")]
        public static extern int ZBX_SetMatchScore(IntPtr cam, int score);

        /**
 * @brief   获取计算人员通过次数的间隔时间，在该时间内人员只算通过一次
 * @param   cam[in]   相机句柄
 * @param   interval[out] 计算人员通过次数的间隔时间，单位：秒
 * @return  0 获取成功
 * @return  <0 获取失败
 */
        [DllImport("libFaceRecognitionSDK_x86.dll")]
        public static extern int ZBX_GetClusterTimesInterval(IntPtr cam,
                                                     ref   UIntPtr interval);

        /**
 * @brief   设置计算人员通过次数的间隔时间，在该时间内人员只算通过一次
 * @param   cam[in]   相机句柄
 * @param   interval[out] 计算人员通过次数的间隔时间，单位：秒
 * @return  0 获取成功
 * @return  <0 获取失败
 */
        [DllImport("libFaceRecognitionSDK_x86.dll")]
        public static extern int ZBX_SetClusterTimesInterval(IntPtr cam,
                                                       uint interval);

        /**
 * @brief   获取led亮度
 * @param   cam[in]   相机句柄
 * @param   led_level[out] 亮度 1~100
 * @return  0 获取成功
 * @return  <0 获取失败  参考错误码
 */
        [DllImport("libFaceRecognitionSDK_x86.dll")]
        public static extern int ZBX_GetLedLevel(IntPtr cam,  byte[] led_level);

        /**
 * @brief   获取led灯模式
 * @param   cam[in]   相机句柄
 * @param   led_mode[out] led灯模式 1：常亮 2：自动控制 3：常闭
 * @return  0 获取成功
 * @return  <0 获取失败  参考错误码
 */
        [DllImport("libFaceRecognitionSDK_x86.dll")]
        public static extern int ZBX_GetLedMode(IntPtr cam, ref  IntPtr  led_mode);

        /**
 * @brief   设置led灯亮度
 * @param   cam[in]   相机句柄
 * @param   led_level[in] 亮度 1~100
 * @return  0 设置成功
 * @return  <0 设置失败  参考错误码
 */
        [DllImport("libFaceRecognitionSDK_x86.dll")]
        public static extern int ZBX_SetLedLevel(IntPtr cam, char led_level);

        /**
 * @brief   设置led灯模式
 * @param   cam[in]   相机句柄
 * @param   led_mode[in] led灯模式 1：常亮 2：自动控制 3：常闭
 * @return  0 设置成功
 * @return  <0 设置失败  参考错误码
 */
        [DllImport("libFaceRecognitionSDK_x86.dll")]
        public static extern int ZBX_SetLedMode(IntPtr cam, char led_mode);

        /**
 * @brief   获取外接显示屏标题
 * @param   cam[in]   相机句柄
 * @param   screen_title[out]  外接显示屏标题 UTF8格式 最大64个字节
 * @return  0 获取成功
 * @return  <0 获取失败  参考错误码
 */[DllImport("libFaceRecognitionSDK_x86.dll")]
        public static extern int ZBX_GetScreenOsdTitle(IntPtr cam,  byte[] screen_title);

        /**
 * @brief   设置外接显示屏标题
 * @param   cam[in]   相机句柄
 * @param   screen_title[in] 外接显示屏标题 UTF8格式 最大64个字节
 * @return  0 设置成功
 * @return  <0 设置失败  参考错误码
 */
   [DllImport("libFaceRecognitionSDK_x86.dll")]
   public static extern int ZBX_SetScreenOsdTitle(IntPtr cam,  byte[] screen_title);

        /**
* @brief  设置对比失败是否上传数据配置
* @param   cam[in]   相机句柄
* @param   //0：都上传，1：只上传对比成功的数据
* @return  0 获取成功
* @return  <0 获取失败  参考错误码
*/   [DllImport("libFaceRecognitionSDK_x86.dll")]
   public static extern int ZBX_SetPushMode(IntPtr cam, char mode);

        /**
 * @brief   设置闸机韦根类型
 * @param   cam[in]   相机句柄
 * @param   type[in] 韦根类型 枚举类型为WG26,WG34, WG36, WG44，目前只支持WG26,
 * WG34
 * @return  0 设置成功
 * @return  <0 设置失败
 */ [DllImport("libFaceRecognitionSDK_x86.dll")]
     public static extern int ZBX_SetWiegandType(IntPtr cam, int type);

        /**
 * @brief   获取闸机韦根类型
 * @param   cam[in]   相机句柄
 * @param   type[out] 韦根类型 枚举类型为WG26,WG34, WG36, WG44，目前只支持WG26,
 * WG34
 * @return  0 获取成功
 * @return  <0 获取失败
 */
        [DllImport("libFaceRecognitionSDK_x86.dll")]
    public static extern int ZBX_GetWiegandType(IntPtr cam,ref IntPtr type);


        /**
 * @brief   查看网络参数配置
 * @param   cam[in]   相机句柄
 * @param   netInfo[out] 网络参数
 * @return  0 获取成功
 * @return  <0 获取失败  参考错误码
 */
        [DllImport("libFaceRecognitionSDK_x86.dll")]
        public static extern int ZBX_GetNetConfig(IntPtr cam,
            ref SystemNetInfo netInfo);

        /**
 * @brief   设置网络参数配置
 * @param   cam[in]   相机句柄
 * @param   netInfo[in] 网络参数
 * @return  0 设置成功
 * @return  <0 设置失败  参考错误码
 */   [DllImport("libFaceRecognitionSDK_x86.dll")]
        public static extern int ZBX_SetNetConfig(IntPtr cam,
          ref  SystemNetInfo netInfo);

        /**
 * @brief   获取相机时间
 * @param   cam[in]   相机句柄
 * @param   time[in] Unix时间
 * @return  0 成功
 * @return  <0 失败
 */  [DllImport("libFaceRecognitionSDK_x86.dll")]
      public static extern int ZBX_GetSysTime(IntPtr cam, ref IntPtr time);

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
 */ [DllImport("libFaceRecognitionSDK_x86.dll")]
     public static extern int ZBX_SetSysTimeEx(IntPtr cam, int year, int month, int day,
                                     int hour, int minute, int second);

/**
 * @brief   通过mac地址，跨网段设置相机IP
 * @param   mac[in] mac地址
 * @param   ip[in] 相机IP
 * @param   netmask[in] 子网掩码
 * @param   gateway[in] 默认网关
 * @return  无
 */
   [DllImport("libFaceRecognitionSDK_x86.dll")]
 public static extern void ZBX_SetIpBymac(string mac, string ip,
                                    string netmask, string gateway);


//系统升级进度
//注意：如果注册此回调 该回调必须返回0 否则会终止传输
   public delegate  int ZBX_HTTPRESULT_PROCESS(IntPtr user_data,
	double rDlTotal,
	double rDlNow,
	double rUlTotal, 
	double rUlNow);

   [DllImport("libFaceRecognitionSDK_x86.dll", CallingConvention = CallingConvention.StdCall)]
   public static extern void ZBX_SetUpdateSystem_CB(IntPtr cam, 
            ZBX_HTTPRESULT_PROCESS cb,ref  IntPtr  user_data);

        /*
* @brief   升级接口
* @param   系统文件路径
* 

* @return 0 成功
*/
    [DllImport("libFaceRecognitionSDK_x86.dll")]
   public static extern int  ZBX_UpdateSystem(IntPtr cam,byte[] filePth);

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
 */[DllImport("libFaceRecognitionSDK_x86.dll")]
    public static extern int ZBX_OpenTSerial(IntPtr cam, int index, int baudrate,
                                    int parity, int databit, int stopbit);


        /**
 * @brief   设置485输出协议编号
 * @param   cam[in]   相机句柄
 * @param   rs485_protocal_no[in] rs485输出协议编号 0：表示关
 * @return  0 设置成功
 * @return  <0 设置失败  参考错误码
 */[DllImport("libFaceRecognitionSDK_x86.dll")]
   public static extern int ZBX_SetRS485ProtocalNo(IntPtr cam, char rs485_protocal_no);

        /**
 * @brief   写透明串口
 * @param   cam[in]   相机句柄
 * @param   index[in] 第N路串口,目前只支持 ZBX_SERIA_RS485  ZBX_SERIA_RS232
 * @param   data[in] 数据
 * @param   size[in] 数据长度
 * @return  0 成功
 * @return  <0 失败
 */[DllImport("libFaceRecognitionSDK_x86.dll")]
   public static extern int  ZBX_WriteTSerial(IntPtr cam, int index,
                                     byte[] data, int size);

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
 */[DllImport("libFaceRecognitionSDK_x86.dll")]
   public static extern int ZBX_GetTSerial(IntPtr cam, int index, ref IntPtr baudrate,
                                  ref IntPtr parity,ref IntPtr databit,ref IntPtr stopbit);

        /**
 * @brief   获取485输出协议编号
 * @param   cam[in]   相机句柄
 * @param   rs485_protocal_no[out] rs485输出协议编号 0：表示关
 * @return  0 获取成功
 * @return  <0 获取失败  参考错误码
 */[DllImport("libFaceRecognitionSDK_x86.dll")]
   public static extern int ZBX_GetRS485ProtocalNo(IntPtr cam,
                                           ref  IntPtr rs485_protocal_no);
  


    /**
 * @brief   注册连接事件回调函数,须先调用ZBX_SetNotifyConnected(1)才生效
 * @param   cb[in] 回调函数指针
 * @param   usrParam[in] 用户参数
 * @return  无
 */
    [DllImport("libFaceRecognitionSDK_x86.dll", CallingConvention = CallingConvention.StdCall)]
  public static extern void  ZBX_RegConnectEventCb(ZBX_ConnectEventCb_t cb,
                                           int usrParam);

    /* 连接事件回调函数 */
// event 1为已连接 2为连接中断
   public delegate void ZBX_ConnectEventCb_t(IntPtr cam, string  ip,
                                           ushort port, int event1,
                                            int usrParam);

 // 判断是否是服务端的conn
        [DllImport("libFaceRecognitionSDK_x86.dll")]
   public static extern int  ZBX_IsServer(IntPtr cam);
  }
}

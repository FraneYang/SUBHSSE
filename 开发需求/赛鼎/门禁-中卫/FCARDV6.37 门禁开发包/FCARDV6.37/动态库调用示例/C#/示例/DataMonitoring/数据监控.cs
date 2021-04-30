using FCardCDrive;
using FCardCDrive.Connect;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace DataMonitoring
{
    public partial class 数据监控 : Form
    {
        public 数据监控()
        {
            InitializeComponent();
        }

        //定义全局命令操作对象
        FCardCDrive.ConnectMain mIO = null;
        private void Monitor_Load(object sender, EventArgs e)
        {
            //初始化枚举对应含义数组 用于显示枚举对应事件名称
            Init();
            //初始化命令操作对象
            if (mIO == null)
            {
                mIO = new FCardCDrive.ConnectMain();
                mIO.CommandAchieve += _CommandAchieve;//命令成功事件
                mIO.CommandTimeout += _CommandTimeout;//命令超时事件
                mIO.ConnectError += _ConnectError;//连接错误事件
                mIO.PasswordError += _PasswordError;//密码错误事件
                mIO.WatchEvent += _WatchEvent;
            }
        }



        private void btnMonitor_Click(object sender, EventArgs e)
        {
            mIO.Command(GetConnectInfo(), "BeginWatch");

            //mIO.Command(GetConnectInfo(), "BeginWatch_Bro");//无返回

        }

        private void btnMonitorClose_Click(object sender, EventArgs e)
        {
            mIO.Command(GetConnectInfo(), "CloseWatch");

            //mIO.Command(GetConnectInfo(), "CloseWatch_Bro");//无返回

        }

        //创建连接参数对象
        private FCardCDrive.Connect.ConnectInfo GetConnectInfo()
        {
            FCardCDrive.Connect.ConnectInfo oInfo = new FCardCDrive.Connect.ConnectInfo();
            oInfo.SN = "MC-5824T25070244";// 16个字符
            oInfo.IP = "192.168.1.116";//IP地址
            oInfo.NetPort = 8000;//TCP默认端口为8000
            oInfo.Password = "FFFFFFFF";//通信秘密 8位十六进制字符
            oInfo.EquptType = FCardCDrive.Connect.ConnectInfo.e_EquptType.FC8900;//指定设备类型
            oInfo.ConnType = FCardCDrive.Connect.ConnectInfo.e_ConnectType.OnTCPClient;//指定连接类型
            oInfo.RestartCount = 3;//重试次数
            oInfo.TimeOutMSEL = 600;//超时
            return oInfo;
        }

        #region 事件相应方法
        //事件相应方法
        /// <summary>
        /// 命令成功事件
        /// </summary>
        /// <param name="oInfo">原封不动返回执行命令时候的连接参数对象</param>
        /// <param name="iCommandCode">命令代码，与枚举对象一一对应</param>
        /// <param name="oValue">命令返回值</param>
        private void _CommandAchieve(ConnectInfo oInfo, int iCommandCode, object oValue)
        {
            if (iCommandCode == (int)FCardCDrive.ConnectMain.eCommandCode.cmdReadRecord)
            {
                //非排序
                //通过iCommandCode判定属于哪个命令的事件返回
            }
        }

        /// <summary>
        /// 命令超时
        /// </summary>
        /// <param name="oInfo">原封不动返回执行命令时候的连接参数对象</param>
        /// <param name="iCommandCode">命令代码，与枚举对象一一对应</param
        /// <param name="iStep">错误出现所在的步骤</param>
        /// <param name="oValue">命令返回值</param>
        private void _CommandTimeout(ConnectInfo oInfo, int iCommandCode, int iStep, object oValue)
        {
            //命令超时
        }

        /// <summary>
        /// 连接错误
        /// </summary>
        /// <param name="oInfo">原封不动返回执行命令时候的连接参数对象</param>
        /// <param name="iCommandCode">命令代码，与枚举对象一一对应</param>
        /// <param name="oValue">命令返回值</param>
        private void _ConnectError(ConnectInfo oInfo, int iCommandCode, object oValue)
        {
            //throw new NotImplementedException();
        }

        /// <summary>
        /// 密码错误
        /// </summary>
        /// <param name="oInfo">原封不动返回执行命令时候的连接参数对象</param>
        /// <param name="iCommandCode">命令代码，与枚举对象一一对应</param>
        /// <param name="oValue">命令返回值</param>
        private void _PasswordError(ConnectInfo oInfo, int iCommandCode, object oValue)
        {
            switch (iCommandCode)
            {
                case (int)FCardCDrive.ConnectMain.eCommandCode.cmdBeginWatch:
                    MessageBox.Show("【打开监控】由于通讯密码错误，命令处理失败！", "错误", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                    break;
                case (int)FCardCDrive.ConnectMain.eCommandCode.cmdCloseWatch:

                    MessageBox.Show("【关闭监控】由于通讯密码错误，命令处理失败！", "错误", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                    break;
                default:
                    break;
            }
        }

        /// <summary>
        /// 数据监控
        /// </summary>
        /// <param name="oInfo">原封不动返回执行命令时候的连接参数对象</param>
        /// <param name="iRecordCode">记录代码</param>
        /// <param name="bData">数据</param>
        private void _WatchEvent(FCardCDrive.Connect.ConnectInfo oInfo, int iRecordCode, byte[] bData)
        {
            Record oRecord = null;
            switch (iRecordCode)
            {
                case 0x23:
                    //连接确认信息
                    break;
                case 0x22:
                    //连接保活（心跳保活）                    
                    break;
                case 0x24:
                    //客户端离线                    
                    break;
                case 0x25:
                    //客户端上线
                    break;
                case 0xF0:

                    break;
                default:
                    if (mIO.WatchRecordDecompile(ConnectInfo.e_EquptType.FC8900, iRecordCode, (byte[])bData, ref oRecord))
                    {
                        string sDate = "时间异常";
                        if (!(oRecord.EventDate == System.DateTime.MinValue))
                        {
                            sDate += oRecord.EventDate.ToString("yyyy-MM-dd HH:mm:ss");
                            Invoke(new Action(() => { txtEvent.Text += sDate + "\r\n"; }));
                        }
                        //oRecord.RecordType   记录类型 详见下方对应枚举
                        //oRecord.EventCode     操作事件类型 详见下方对应枚举
                        Invoke(new Action(() => { txtEvent.Text += $"事件：{mRecordTypeName[(int)oRecord.RecordType]}\t操作：{mEvnetCodeName[(int)oRecord.EventCode]}\r\n"; }));

                    }
                    break;
            }

        }

        #endregion


        private void Monitor_FormClosing(object sender, FormClosingEventArgs e)
        {
            //窗口关闭事件释放资源
            mIO.StopCommand();//停止所有命令
            mIO.Release();//释放类库所有资源
            mIO = null;
        }


        private string[] mRecordTypeName = new string[11];//记录类型 含义数组集合
        private string[] mEvnetCodeName = new string[301];//操作事件类型含义 含义数组集合

        /// <summary>
        /// 初始化上方 含义数组
        /// </summary>
        private void Init()
        {
            ///记录类型 
            mRecordTypeName[(int)Record.eRecordType.eCardRecord] = "读卡事件";
            mRecordTypeName[(int)Record.eRecordType.eButtonRecord] = "按钮记录";
            mRecordTypeName[(int)Record.eRecordType.eDoorStateRecord] = "门磁记录";
            mRecordTypeName[(int)Record.eRecordType.eSoftwareRecord] = "软件记录";
            mRecordTypeName[(int)Record.eRecordType.eAlarmRecord] = "报警记录";
            mRecordTypeName[(int)Record.eRecordType.eSystemRecord] = "系统记录";
            ///操作事件类型含义
            //读卡记录读卡记录
            mEvnetCodeName[(int)Record.eRecordEvent.eCardOpen] = "合法开门";
            mEvnetCodeName[(int)Record.eRecordEvent.ePasswordOpen] = "密码开门";
            mEvnetCodeName[(int)Record.eRecordEvent.eCardAndPasswordOpen] = "卡加密码";
            mEvnetCodeName[(int)Record.eRecordEvent.eInputCardOpen] = "手动输入卡加密码";
            mEvnetCodeName[(int)Record.eRecordEvent.eFirstCardOpen] = "首卡开门";
            mEvnetCodeName[(int)Record.eRecordEvent.eCardHoldOpen] = "门常开-读卡";
            mEvnetCodeName[(int)Record.eRecordEvent.eMuchCardOpen] = "多卡--门未开，等待继续读卡";
            mEvnetCodeName[(int)Record.eRecordEvent.eCardRepeat] = "重复读卡";
            mEvnetCodeName[(int)Record.eRecordEvent.eCardExpire] = "有效期过期";
            mEvnetCodeName[(int)Record.eRecordEvent.eCardTimeGroupExpire] = "开门时段过期";
            mEvnetCodeName[(int)Record.eRecordEvent.eHolidayInvalid] = "节假日无效";
            mEvnetCodeName[(int)Record.eRecordEvent.eCardInvalid] = "非法卡";
            mEvnetCodeName[(int)Record.eRecordEvent.ePatrolCard] = "巡更卡";
            mEvnetCodeName[(int)Record.eRecordEvent.eProbeLocked] = "探测锁定";
            mEvnetCodeName[(int)Record.eRecordEvent.eCardOpenCountInvalid] = "有效次数已用尽";
            mEvnetCodeName[(int)Record.eRecordEvent.eSlipInto] = "防潜回";
            mEvnetCodeName[(int)Record.eRecordEvent.ePasswordError] = "密码错误";
            mEvnetCodeName[(int)Record.eRecordEvent.eCardPasswordError] = "密码加卡-密码错误";
            mEvnetCodeName[(int)Record.eRecordEvent.eCardLocked] = "锁定时禁止读卡";
            mEvnetCodeName[(int)Record.eRecordEvent.eLockedPassword] = "锁定时禁止密码";
            mEvnetCodeName[(int)Record.eRecordEvent.eFirstCardInvalid] = "首卡未开门";
            mEvnetCodeName[(int)Record.eRecordEvent.eCardLose] = "挂失卡";
            mEvnetCodeName[(int)Record.eRecordEvent.eCardBlacklist] = "黑名单卡";
            mEvnetCodeName[(int)Record.eRecordEvent.ePeopleFull] = "门内上限已满，禁止入门";
            mEvnetCodeName[(int)Record.eRecordEvent.eOpenAntiTheft_Card] = "开启防盗主机(设置卡)";
            mEvnetCodeName[(int)Record.eRecordEvent.eCloseAntiTheft_Card] = "关闭防盗主机(设置卡)";
            mEvnetCodeName[(int)Record.eRecordEvent.eOpenAntiTheft_PWD] = "开启防盗主机(密码)";
            mEvnetCodeName[(int)Record.eRecordEvent.eCloseAntiTheft_PWD] = "关闭防盗主机(密码)";
            mEvnetCodeName[(int)Record.eRecordEvent.eInterlockCardInvalid] = "互锁时禁止读卡";
            mEvnetCodeName[(int)Record.eRecordEvent.eInterlockPasswordInvalid] = "互锁时禁止密码";
            mEvnetCodeName[(int)Record.eRecordEvent.eCardRegFree] = "全卡开门";
            mEvnetCodeName[(int)Record.eRecordEvent.eMuchCardWait] = "多卡-等待下张卡";
            mEvnetCodeName[(int)Record.eRecordEvent.eMuchCardError] = "多卡--组合错误";
            mEvnetCodeName[(int)Record.eRecordEvent.eMuchCard] = "非首卡时段禁止读卡";
            mEvnetCodeName[(int)Record.eRecordEvent.eFirstCardTimeInvalid] = "非首卡时段禁止密码";
            mEvnetCodeName[(int)Record.eRecordEvent.eForbidCard] = "禁止读卡开门";
            mEvnetCodeName[(int)Record.eRecordEvent.eForbidPassword] = "禁止密码开门";
            mEvnetCodeName[(int)Record.eRecordEvent.eWaitEnterRequest] = "门内已读卡，等待门外读卡";
            mEvnetCodeName[(int)Record.eRecordEvent.eWaitExitRequest] = "门外已读卡，等待门内读卡";
            mEvnetCodeName[(int)Record.eRecordEvent.eWaitManager] = "已读普通卡，请读管理卡";
            mEvnetCodeName[(int)Record.eRecordEvent.eWaitCustomer] = "已读管理卡，请读普通卡";
            mEvnetCodeName[(int)Record.eRecordEvent.eFirstCardPasswordInvalid] = "首卡时段禁止密码";
            mEvnetCodeName[(int)Record.eRecordEvent.eControlInvalid_Card] = "控制器已过期_读卡";
            mEvnetCodeName[(int)Record.eRecordEvent.eControlInvalid_PWD] = "控制器已过期_密码";
            mEvnetCodeName[(int)Record.eRecordEvent.eCardImminentInvalid] = "合法开门—有效期即将过期";
            mEvnetCodeName[(int)Record.eRecordEvent.eAreaCheckRepeatInoutOffline] = "区域防潜回-拒绝进入(与服务器失去连接)";
            mEvnetCodeName[(int)Record.eRecordEvent.eArealinkageLockOffline] = "区域互锁-拒绝进入(与服务器失去连接)";
            mEvnetCodeName[(int)Record.eRecordEvent.eAreaCheckRepeatInout] = "区域防潜回--拒绝开门";
            mEvnetCodeName[(int)Record.eRecordEvent.eArealinkageLock] = "区域互锁--有门未关好，拒绝开门";




            //出门按钮事件出门按钮事件
            mEvnetCodeName[(int)Record.eRecordEvent.eButton] = "按钮开门";
            mEvnetCodeName[(int)Record.eRecordEvent.eButtonTimeInvalid] = "开门时段过期";
            mEvnetCodeName[(int)Record.eRecordEvent.eButtonLocked] = "锁定时按钮";
            mEvnetCodeName[(int)Record.eRecordEvent.eButtonControlExpire] = "控制器已过期";
            mEvnetCodeName[(int)Record.eRecordEvent.eButtonInvalid_Interlock] = "互锁时禁止按钮";





            //门磁记录门磁记录
            mEvnetCodeName[(int)Record.eRecordEvent.eOpenedState] = "开门";
            mEvnetCodeName[(int)Record.eRecordEvent.eClosedState] = "关门";
            mEvnetCodeName[(int)Record.eRecordEvent.eOpenAntiLockPicking] = "进入门磁报警布防状态";
            mEvnetCodeName[(int)Record.eRecordEvent.eCloseAntiLockPicking] = "退出门磁报警布防状态";
            mEvnetCodeName[(int)Record.eRecordEvent.eNoClosed] = "门未关好";



            //软件操作记录软件操作记录"
            mEvnetCodeName[(int)Record.eRecordEvent.eSoftwareOpen] = "软件开门";
            mEvnetCodeName[(int)Record.eRecordEvent.eSoftwareClose] = "软件关门";
            mEvnetCodeName[(int)Record.eRecordEvent.eSoftwareHoldOpen] = "软件常开";
            mEvnetCodeName[(int)Record.eRecordEvent.eSoftwareAutoHoldOpen] = "控制器自动进入常开";
            mEvnetCodeName[(int)Record.eRecordEvent.eSoftwareAutoClosed] = "控制器自动关闭门";
            mEvnetCodeName[(int)Record.eRecordEvent.eButtonHoldOpen] = "长按出门按钮常开";
            mEvnetCodeName[(int)Record.eRecordEvent.eButtonHoldClose] = "长按出门按钮常闭";
            mEvnetCodeName[(int)Record.eRecordEvent.eSoftwareLocked] = "软件锁定";
            mEvnetCodeName[(int)Record.eRecordEvent.eSoftwareUnlocked] = "软件解除锁定";
            mEvnetCodeName[(int)Record.eRecordEvent.eSoftwareAutoLocked] = "控制器定时锁定";
            mEvnetCodeName[(int)Record.eRecordEvent.eSoftwareAutoUnlocked] = "控制器定时解除锁定";
            mEvnetCodeName[(int)Record.eRecordEvent.eAlarmLocked] = "报警--锁定";
            mEvnetCodeName[(int)Record.eRecordEvent.eAlarmUnlocked] = "报警--解除锁定";
            mEvnetCodeName[(int)Record.eRecordEvent.eSoftwareOpenInvalid_Interlock] = "互锁时禁止远程开门";


            //报警记录报警记录
            mEvnetCodeName[(int)Record.eRecordEvent.eAlarmLockPicking] = "门磁报警";
            mEvnetCodeName[(int)Record.eRecordEvent.eAlarmLockPickingClose] = "门磁报警撤销";
            mEvnetCodeName[(int)Record.eRecordEvent.eAlarmLockPickingSoftwortClose] = "门磁报警撤销(远程关闭)";
            mEvnetCodeName[(int)Record.eRecordEvent.eAlarmBandit] = "匪警报警";
            mEvnetCodeName[(int)Record.eRecordEvent.eAlarmBanditClose] = "匪警报警撤销";
            mEvnetCodeName[(int)Record.eRecordEvent.eAlarmBanditSoftwortClose] = "匪警报警撤销(远程关闭)";
            mEvnetCodeName[(int)Record.eRecordEvent.eAlarmFire] = "消防报警";
            mEvnetCodeName[(int)Record.eRecordEvent.eAlarmFireClose] = "消防报警撤销";
            mEvnetCodeName[(int)Record.eRecordEvent.eAlarmFireSoftwortClose] = "消防报警撤销(远程关闭)";
            mEvnetCodeName[(int)Record.eRecordEvent.eAlarmInvalidCard] = "非法卡刷报警";
            mEvnetCodeName[(int)Record.eRecordEvent.eAlarmInvalidCardClose] = "软件非法卡刷报警撤销";
            mEvnetCodeName[(int)Record.eRecordEvent.eAlarmInvalidCardSoftwortClose] = "非法卡刷报警撤销(软件关闭)";
            mEvnetCodeName[(int)Record.eRecordEvent.eAlarmKidnap] = "胁迫报警";
            mEvnetCodeName[(int)Record.eRecordEvent.eAlarmKidnapClose] = "胁迫报警撤销";
            mEvnetCodeName[(int)Record.eRecordEvent.eAlarmKidnapSoftwortClose] = "胁迫报警撤销(远程关闭)";
            mEvnetCodeName[(int)Record.eRecordEvent.eAlarmFireSoftwort] = "消防报警(远程关闭)";
            mEvnetCodeName[(int)Record.eRecordEvent.eAlarmSmog] = "烟雾报警";
            mEvnetCodeName[(int)Record.eRecordEvent.eAlarmSmogClose] = "烟雾报警撤销";
            mEvnetCodeName[(int)Record.eRecordEvent.eAlarmSmogSoftwortClose] = "烟雾报警撤销(远程关闭)";
            mEvnetCodeName[(int)Record.eRecordEvent.eAlarmTheft] = "防盗报警";
            mEvnetCodeName[(int)Record.eRecordEvent.eAlarmTheftClose] = "防盗报警撤销";
            mEvnetCodeName[(int)Record.eRecordEvent.eAlarmTheftSoftwortClose] = "防盗报警撤销(远程关闭)";
            mEvnetCodeName[(int)Record.eRecordEvent.eAlarmBalcklist] = "黑名单报警";
            mEvnetCodeName[(int)Record.eRecordEvent.eAlarmBalcklistClose] = "关闭黑名单报警";
            mEvnetCodeName[(int)Record.eRecordEvent.eAlarmBalcklistSoftwortClose] = "关闭黑名单报警(软件关闭)";
            mEvnetCodeName[(int)Record.eRecordEvent.eAlarmNoClosed] = "开门超时报警";
            mEvnetCodeName[(int)Record.eRecordEvent.eAlarmNoClosedClose] = "开门超时报警撤销";
            mEvnetCodeName[(int)Record.eRecordEvent.eAlarmNoClosedSoftwortClose] = "开门超时报警撤销(远程关闭)";


            //系统记录系统记录
            mEvnetCodeName[(int)Record.eRecordEvent.eSystemRun] = "系统加电";
            mEvnetCodeName[(int)Record.eRecordEvent.eSystemRestart] = "系统错误复位";
            mEvnetCodeName[(int)Record.eRecordEvent.eSystemFormat] = "设备格式化记录";
            mEvnetCodeName[(int)Record.eRecordEvent.eSystemTemperatureHigh] = "系统高温记录，温度大于>75";
            mEvnetCodeName[(int)Record.eRecordEvent.eSystemUPS] = "系统UPS供电记录";
            mEvnetCodeName[(int)Record.eRecordEvent.eSystemTemperatureFault] = "温度传感器损坏，温度大于>100";
            mEvnetCodeName[(int)Record.eRecordEvent.eSystemVoltageLow] = "电压过低，小于<09V";
            mEvnetCodeName[(int)Record.eRecordEvent.eSystemVHigh] = "电压过高，大于>14V";
            mEvnetCodeName[(int)Record.eRecordEvent.eSystemReaderLineReverse] = "读卡器接反";
            mEvnetCodeName[(int)Record.eRecordEvent.eSystemReaderLineError] = "读卡器线路未接好";
            mEvnetCodeName[(int)Record.eRecordEvent.eSystemReaderInvalid] = "无法识别的读卡器";
            mEvnetCodeName[(int)Record.eRecordEvent.eSystemVRecover] = "电压恢复正常，小于14V，大于9V";
            mEvnetCodeName[(int)Record.eRecordEvent.eLANDiscon] = "网线已断开";
            mEvnetCodeName[(int)Record.eRecordEvent.eLANRecover] = "网线已接入";
        }



        /***************************** 
         *  ###############################
            ########## 记录类型 ############
            ###############################
        //    Record.eRecordType.eCardRecord 读卡事件
            
        //    Record.eRecordType.eButtonRecord 按钮记录
        //    Record.eRecordType.eDoorStateRecord 门磁记录
        //    Record.eRecordType.eSoftwareRecord 软件记录
        //    Record.eRecordType.eAlarmRecord 报警记录
        //    Record.eRecordType.eSystemRecord 系统记录

        *****************************/



        /******************************** 
         *     ###########################################
          	// ############# 操作事件类型含义 #############
               ###########################################
			FCardCDrive.Record.eRecordEvent.eCardOpen 合法开门
            FCardCDrive.Record.eRecordEvent.ePasswordOpen 密码开门
            FCardCDrive.Record.eRecordEvent.eCardAndPasswordOpen 卡加密码
            FCardCDrive.Record.eRecordEvent.eInputCardOpen 手动输入卡加密码
            FCardCDrive.Record.eRecordEvent.eFirstCardOpen 首卡开门
            FCardCDrive.Record.eRecordEvent.eCardHoldOpen 门常开-读卡
            FCardCDrive.Record.eRecordEvent.eMuchCardOpen 多卡--门未开，等待继续读卡
            FCardCDrive.Record.eRecordEvent.eCardRepeat 重复读卡
            FCardCDrive.Record.eRecordEvent.eCardExpire 有效期过期
            FCardCDrive.Record.eRecordEvent.eCardTimeGroupExpire 开门时段过期
            FCardCDrive.Record.eRecordEvent.eHolidayInvalid 节假日无效
            FCardCDrive.Record.eRecordEvent.eCardInvalid 非法卡
            FCardCDrive.Record.eRecordEvent.ePatrolCard 巡更卡
            FCardCDrive.Record.eRecordEvent.eProbeLocked 探测锁定
            FCardCDrive.Record.eRecordEvent.eCardOpenCountInvalid 有效次数已用尽
            FCardCDrive.Record.eRecordEvent.eSlipInto 防潜回
            FCardCDrive.Record.eRecordEvent.ePasswordError 密码错误
            FCardCDrive.Record.eRecordEvent.eCardPasswordError 密码加卡-密码错误
            FCardCDrive.Record.eRecordEvent.eCardLocked 锁定时禁止读卡
            FCardCDrive.Record.eRecordEvent.eLockedPassword 锁定时禁止密码
            FCardCDrive.Record.eRecordEvent.eFirstCardInvalid 首卡未开门
            FCardCDrive.Record.eRecordEvent.eCardLose 挂失卡
            FCardCDrive.Record.eRecordEvent.eCardBlacklist 黑名单卡
            FCardCDrive.Record.eRecordEvent.ePeopleFull 门内上限已满，禁止入门
            FCardCDrive.Record.eRecordEvent.eOpenAntiTheft_Card 开启防盗主机(设置卡)";
            FCardCDrive.Record.eRecordEvent.eCloseAntiTheft_Card 关闭防盗主机(设置卡)";
            FCardCDrive.Record.eRecordEvent.eOpenAntiTheft_PWD 开启防盗主机(密码)";
            FCardCDrive.Record.eRecordEvent.eCloseAntiTheft_PWD 关闭防盗主机(密码)";
            FCardCDrive.Record.eRecordEvent.eInterlockCardInvalid 互锁时禁止读卡
            FCardCDrive.Record.eRecordEvent.eInterlockPasswordInvalid 互锁时禁止密码
            FCardCDrive.Record.eRecordEvent.eCardRegFree 全卡开门
            FCardCDrive.Record.eRecordEvent.eMuchCardWait 多卡-等待下张卡
            FCardCDrive.Record.eRecordEvent.eMuchCardError 多卡--组合错误
            FCardCDrive.Record.eRecordEvent.eMuchCard 非首卡时段禁止读卡
            FCardCDrive.Record.eRecordEvent.eFirstCardTimeInvalid 非首卡时段禁止密码
            FCardCDrive.Record.eRecordEvent.eForbidCard 禁止读卡开门
            FCardCDrive.Record.eRecordEvent.eForbidPassword 禁止密码开门
            FCardCDrive.Record.eRecordEvent.eWaitEnterRequest 门内已读卡，等待门外读卡
            FCardCDrive.Record.eRecordEvent.eWaitExitRequest 门外已读卡，等待门内读卡
            FCardCDrive.Record.eRecordEvent.eWaitManager 已读普通卡，请读管理卡
            FCardCDrive.Record.eRecordEvent.eWaitCustomer 已读管理卡，请读普通卡
            FCardCDrive.Record.eRecordEvent.eFirstCardPasswordInvalid 首卡时段禁止密码
            FCardCDrive.Record.eRecordEvent.eControlInvalid_Card 控制器已过期_读卡
            FCardCDrive.Record.eRecordEvent.eControlInvalid_PWD 控制器已过期_密码
            FCardCDrive.Record.eRecordEvent.eCardImminentInvalid 合法开门—有效期即将过期
            FCardCDrive.Record.eRecordEvent.eAreaCheckRepeatInoutOffline 区域防潜回-拒绝进入(与服务器失去连接)";
            FCardCDrive.Record.eRecordEvent.eArealinkageLockOffline 区域互锁-拒绝进入(与服务器失去连接)";
            FCardCDrive.Record.eRecordEvent.eAreaCheckRepeatInout 区域防潜回--拒绝开门
            FCardCDrive.Record.eRecordEvent.eArealinkageLock 区域互锁--有门未关好，拒绝开门

            //出门按钮事件出门按钮事件
            FCardCDrive.Record.eRecordEvent.eButton 按钮开门
            FCardCDrive.Record.eRecordEvent.eButtonTimeInvalid 开门时段过期
            FCardCDrive.Record.eRecordEvent.eButtonLocked 锁定时按钮
            FCardCDrive.Record.eRecordEvent.eButtonControlExpire 控制器已过期
            FCardCDrive.Record.eRecordEvent.eButtonInvalid_Interlock 互锁时禁止按钮

            //门磁记录门磁记录
            FCardCDrive.Record.eRecordEvent.eOpenedState 开门
            FCardCDrive.Record.eRecordEvent.eClosedState 关门
            FCardCDrive.Record.eRecordEvent.eOpenAntiLockPicking 进入门磁报警布防状态
            FCardCDrive.Record.eRecordEvent.eCloseAntiLockPicking 退出门磁报警布防状态
            FCardCDrive.Record.eRecordEvent.eNoClosed 门未关好

            //软件操作记录软件操作记录"
            FCardCDrive.Record.eRecordEvent.eSoftwareOpen 软件开门
            FCardCDrive.Record.eRecordEvent.eSoftwareClose 软件关门
            FCardCDrive.Record.eRecordEvent.eSoftwareHoldOpen 软件常开
            FCardCDrive.Record.eRecordEvent.eSoftwareAutoHoldOpen 控制器自动进入常开
            FCardCDrive.Record.eRecordEvent.eSoftwareAutoClosed 控制器自动关闭门
            FCardCDrive.Record.eRecordEvent.eButtonHoldOpen 长按出门按钮常开
            FCardCDrive.Record.eRecordEvent.eButtonHoldClose 长按出门按钮常闭
            FCardCDrive.Record.eRecordEvent.eSoftwareLocked 软件锁定
            FCardCDrive.Record.eRecordEvent.eSoftwareUnlocked 软件解除锁定
            FCardCDrive.Record.eRecordEvent.eSoftwareAutoLocked 控制器定时锁定
            FCardCDrive.Record.eRecordEvent.eSoftwareAutoUnlocked 控制器定时解除锁定
            FCardCDrive.Record.eRecordEvent.eAlarmLocked 报警--锁定
            FCardCDrive.Record.eRecordEvent.eAlarmUnlocked 报警--解除锁定
            FCardCDrive.Record.eRecordEvent.eSoftwareOpenInvalid_Interlock 互锁时禁止远程开门

            //报警记录报警记录
            FCardCDrive.Record.eRecordEvent.eAlarmLockPicking 门磁报警
            FCardCDrive.Record.eRecordEvent.eAlarmLockPickingClose 门磁报警撤销
            FCardCDrive.Record.eRecordEvent.eAlarmLockPickingSoftwortClose 门磁报警撤销(远程关闭)";
            FCardCDrive.Record.eRecordEvent.eAlarmBandit 匪警报警
            FCardCDrive.Record.eRecordEvent.eAlarmBanditClose 匪警报警撤销
            FCardCDrive.Record.eRecordEvent.eAlarmBanditSoftwortClose 匪警报警撤销(远程关闭)";
            FCardCDrive.Record.eRecordEvent.eAlarmFire 消防报警
            FCardCDrive.Record.eRecordEvent.eAlarmFireClose 消防报警撤销
            FCardCDrive.Record.eRecordEvent.eAlarmFireSoftwortClose 消防报警撤销(远程关闭)";
            FCardCDrive.Record.eRecordEvent.eAlarmInvalidCard 非法卡刷报警
            FCardCDrive.Record.eRecordEvent.eAlarmInvalidCardClose 软件非法卡刷报警撤销
            FCardCDrive.Record.eRecordEvent.eAlarmInvalidCardSoftwortClose 非法卡刷报警撤销(软件关闭)";
            FCardCDrive.Record.eRecordEvent.eAlarmKidnap 胁迫报警
            FCardCDrive.Record.eRecordEvent.eAlarmKidnapClose 胁迫报警撤销
            FCardCDrive.Record.eRecordEvent.eAlarmKidnapSoftwortClose 胁迫报警撤销(远程关闭)";
            FCardCDrive.Record.eRecordEvent.eAlarmFireSoftwort 消防报警(远程关闭)";
            FCardCDrive.Record.eRecordEvent.eAlarmSmog 烟雾报警
            FCardCDrive.Record.eRecordEvent.eAlarmSmogClose 烟雾报警撤销
            FCardCDrive.Record.eRecordEvent.eAlarmSmogSoftwortClose 烟雾报警撤销(远程关闭)";
            FCardCDrive.Record.eRecordEvent.eAlarmTheft 防盗报警
            FCardCDrive.Record.eRecordEvent.eAlarmTheftClose 防盗报警撤销
            FCardCDrive.Record.eRecordEvent.eAlarmTheftSoftwortClose 防盗报警撤销(远程关闭)";
            FCardCDrive.Record.eRecordEvent.eAlarmBalcklist 黑名单报警
            FCardCDrive.Record.eRecordEvent.eAlarmBalcklistClose 关闭黑名单报警
            FCardCDrive.Record.eRecordEvent.eAlarmBalcklistSoftwortClose 关闭黑名单报警(软件关闭)";
            FCardCDrive.Record.eRecordEvent.eAlarmNoClosed 开门超时报警
            FCardCDrive.Record.eRecordEvent.eAlarmNoClosedClose 开门超时报警撤销
            FCardCDrive.Record.eRecordEvent.eAlarmNoClosedSoftwortClose 开门超时报警撤销(远程关闭)";

            //系统记录系统记录
            FCardCDrive.Record.eRecordEvent.eSystemRun 系统加电
            FCardCDrive.Record.eRecordEvent.eSystemRestart 系统错误复位
            FCardCDrive.Record.eRecordEvent.eSystemFormat 设备格式化记录
            FCardCDrive.Record.eRecordEvent.eSystemTemperatureHigh 系统高温记录，温度大于>75
            FCardCDrive.Record.eRecordEvent.eSystemUPS 系统UPS供电记录
            FCardCDrive.Record.eRecordEvent.eSystemTemperatureFault 温度传感器损坏，温度大于>100
            FCardCDrive.Record.eRecordEvent.eSystemVoltageLow 电压过低，小于<09V
            FCardCDrive.Record.eRecordEvent.eSystemVHigh 电压过高，大于>14V
            FCardCDrive.Record.eRecordEvent.eSystemReaderLineReverse 读卡器接反
            FCardCDrive.Record.eRecordEvent.eSystemReaderLineError 读卡器线路未接好
            FCardCDrive.Record.eRecordEvent.eSystemReaderInvalid 无法识别的读卡器
            FCardCDrive.Record.eRecordEvent.eSystemVRecover 电压恢复正常，小于14V，大于9V
            FCardCDrive.Record.eRecordEvent.eLANDiscon 网线已断开
            FCardCDrive.Record.eRecordEvent.eLANRecover 网线已接入         
         *******************/

    }
}

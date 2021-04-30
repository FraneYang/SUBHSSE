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

namespace CollectRecord
{
    public partial class 记录采集 : Form
    {
        public 记录采集()
        {
            InitializeComponent();
        }

        //定义全局命令操作对象
        FCardCDrive.ConnectMain mIO = null;
        private void Collect_Load(object sender, EventArgs e)
        {
            //初始化命令操作对象
            if (mIO == null)
            {
                mIO = new FCardCDrive.ConnectMain();
                mIO.CommandAchieve += _CommandAchieve;//命令成功事件
                mIO.CommandTimeout += _CommandTimeout;//命令超时事件
                mIO.ConnectError += _ConnectError;//连接错误事件
                mIO.PasswordError += _PasswordError;//密码错误事件
            }
        }
        private void btnCollect_Click(object sender, EventArgs e)
        {
            /*
             * 参数3：枚举类型表示读取参数的类型
             * FCardCDrive.Record.eRecordType.eCardRecord 读卡事件
             * FCardCDrive.Record.eRecordType.eButtonRecord 按钮记录
             * FCardCDrive.Record.eRecordType.eDoorStateRecord 门磁记录
             * FCardCDrive.Record.eRecordType.eSoftwareRecord 软件记录
             * FCardCDrive.Record.eRecordType.eAlarmRecord 报警记录
             * FCardCDrive.Record.eRecordType.eSystemRecord 系统记录
             * 参数4：要读取的记录数量
             * 参数5：在89系列中指定单个包大小只能在 20~200
            */
            mIO.Command(GetConnectInfo(), "ReadRecord",FCardCDrive.Record.eRecordType.eAlarmRecord,10,20);
        }
        //创建连接参数对象
        private FCardCDrive.Connect.ConnectInfo GetConnectInfo()
        {
            FCardCDrive.Connect.ConnectInfo oInfo = new FCardCDrive.Connect.ConnectInfo();
            oInfo.SN = "MC-5824T25070244";// 16个字符
            oInfo.IP = "192.168.1.87";//IP地址
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
            
        }

        /// <summary>
        /// 密码错误
        /// </summary>
        /// <param name="oInfo">原封不动返回执行命令时候的连接参数对象</param>
        /// <param name="iCommandCode">命令代码，与枚举对象一一对应</param>
        /// <param name="oValue">命令返回值</param>
        private void _PasswordError(ConnectInfo oInfo, int iCommandCode, object oValue)
        {

        }

        #endregion

        private void Collect_FormClosing(object sender, FormClosingEventArgs e)
        {
            //窗口关闭事件释放资源
            mIO.StopCommand();//停止所有命令
            mIO.Release();//释放类库所有资源
            mIO = null;
        }
    }
}

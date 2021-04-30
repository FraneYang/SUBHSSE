using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using FCardCDrive;
using FCardCDrive.Connect;
using System.IO.Ports;
using FCardCDrive.FC8900;
using DataTool;
using System.Net;
using FCardCDrive.Connect.TCPServer;

namespace CSharpDemo
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }
        ConnectMain mIo = null;
        private void Form1_Load(object sender, EventArgs e)
        {
            //mIo.CommandAchieve
            Init();
            if (mIo == null)
            {
                mIo = new ConnectMain();
                mIo.CommandAchieve += _CommandAchieve;//命令成功事件
                mIo.CommandTimeout += _CommandTimeout;//命令超时事件
                mIo.ConnectError += _ConnectError;//连接错误事件
                mIo.PasswordError += _PasswordError;//密码错误事件
            }
        }
        /// <summary>
        /// 初始化方法
        /// </summary>
        private void Init()
        {
            gbConfig.Size = new Size(318, 210);
            GetCOMList();
        }

        delegate void CmdAchieve(ConnectInfo oInfo, object oValue);//事件处理委托 
        Dictionary<int, CmdAchieve> FunList = null;//命令代码 & 委托对象
        /// <summary>
        /// 为对应命令代码和委托对象添加到字典类中
        /// </summary>
        /// <param name="key"></param>
        /// <param name="val"></param>
        private void AddProcessFun(int key, CmdAchieve val)
        {
            if (FunList == null)
                FunList = new Dictionary<int, CmdAchieve>();
            //判断是否存在此命令代码
            if (!FunList.ContainsKey(key))
            {
                FunList.Add(key, val);
            }
        }

        #region Event
        private void _PasswordError(ConnectInfo oInfo, int iCommandCode, object oValue)
        {

        }

        private void _ConnectError(ConnectInfo oInfo, int iCommandCode, object oValue)
        {
            if (iCommandCode == (int)ConnectMain.eCommandCode.cmdSearchEquptOnNetNum)
            {
                _searchCount = _searchCountMax;//停止命令，搜索次数达到最大以停止搜索
                this.Invoke(new Action(SearchEquptOver));
            }
        }

        private void _CommandTimeout(ConnectInfo oInfo, int iCommandCode, int iStep, object oValue)
        {
            if (iCommandCode == (int)ConnectMain.eCommandCode.cmdSearchEquptOnNetNum)
            {
                this.Invoke(new Action(SearchEquptOver));//结束搜索，处理搜索到的设备
            }
        }

        private void _CommandAchieve(ConnectInfo oInfo, int iCommandCode, object oValue)
        {
            //ConnectInfo oInfo, int iCommandCode, object oValue
            if (FunList != null)
            {
                if (FunList.ContainsKey(iCommandCode))
                    FunList[iCommandCode](oInfo, oValue);//执行字典中与命令代码对应的委托
            }
        }


        #endregion


        private ConnectInfo GetConnInfo(int RestartCount = 1, int iTimeout = 1500)
        {
            ConnectInfo oInfo = new ConnectInfo();

            //TCP客户端模式
            if (ChkTCPClient.Checked)
            {
                int translate = 0;
                int.TryParse(TxtIPPort_TCPClient.Text, out translate);
                oInfo.ConnType = ConnectInfo.e_ConnectType.OnTCPClient;
                oInfo.IP = TxtIPAddr_TCPClient.Text;
                oInfo.NetPort = (ushort)translate;

                oInfo.RestartCount = RestartCount + 3;
            }
            //串口
            if (ChkCOM.Checked)
            {
                oInfo.ConnType = ConnectInfo.e_ConnectType.OnComm;
                string sCOM = CmbSerialPort.Text;
                if (sCOM.Length > 0)
                {
                    sCOM = sCOM.Replace("COM", string.Empty);
                    oInfo.CommPort = Int16.Parse(sCOM);
                }
                else
                {
                    oInfo.CommPort = 1;
                }
                oInfo.CommBaudrate = 19200;
            }
            //UDP
            if (ChkUDP.Checked)
            {
                oInfo.ConnType = ConnectInfo.e_ConnectType.OnUDP;
                oInfo.IP = TxtIPAddr_UDP.Text;
                oInfo.NetPort = (ushort)TxtIPPort_UDP.Value;
                if (ChkBroadcast.Checked)
                {
                    oInfo.UDPBroadcast = true;
                }
            }

            if (ChkTCPServer.Checked)
            {

            }

            oInfo.EquptType = ConnectInfo.e_EquptType.FC8900;
            oInfo.SN = TxtConnSN.Text;
            oInfo.Password = gbConfig.Text;

            oInfo.RestartCount = RestartCount;
            oInfo.TimeOutMSEL = iTimeout;
            return oInfo;
        }

        private void btnOpenDoors_Click(object sender, EventArgs e)
        {
            mIo.Command(GetConnInfo(), "OpenRelay", new bool[] { true, true, true, true });
        }

        #region RadionButton
        private void ChkTCPClient_CheckedChanged(object sender, EventArgs e)
        {
            if (ChkTCPClient.Checked)
            {
                gbTCPClient.Visible = true;
                gbTCPClient.Location = new Point(27, 51);
                gbTCPServer.Visible = false;
                gbUDP.Visible = false;
                gbCOM.Visible = false;
            }
        }

        private void ChkTCPServer_CheckedChanged(object sender, EventArgs e)
        {
            if (ChkTCPServer.Checked)
            {
                gbTCPServer.Visible = true;
                gbTCPServer.Location = new Point(27, 51);
                gbTCPClient.Visible = false;
                gbUDP.Visible = false;
                gbCOM.Visible = false;
            }
        }

        private void ChkCOM_CheckedChanged(object sender, EventArgs e)
        {
            if (ChkCOM.Checked)
            {
                gbCOM.Visible = true;
                gbCOM.Location = new Point(27, 51);
                gbTCPServer.Visible = false;
                gbUDP.Visible = false;
                gbTCPClient.Visible = false;
            }
        }

        private void ChkUDP_CheckedChanged(object sender, EventArgs e)
        {
            if (ChkUDP.Checked)
            {
                gbUDP.Visible = true;
                gbUDP.Location = new Point(27, 51);
                gbTCPServer.Visible = false;
                gbTCPClient.Visible = false;
                gbCOM.Visible = false;
            }
        }

        #endregion

        private void btnRefresh_Click(object sender, EventArgs e)
        {
            GetCOMList();
        }

        /// <summary>
        /// 获取串口列表
        /// </summary>
        /// <remarks></remarks>
        private void GetCOMList()
        {
            CmbSerialPort.Items.Clear();
            string[] sList = null;

            sList = SerialPort.GetPortNames();
            if (sList.Length > 0)
            {
                Array.Sort(sList);
                //串口列表在控件中显示
                CmbSerialPort.Items.AddRange(sList);
                CmbSerialPort.SelectedIndex = 0;
            }
        }

        private void Form1_FormClosing(object sender, FormClosingEventArgs e)
        {
            mIo.StopCommand();
            mIo.Release();
            mIo = null;
        }

        private void btnCloseDoor_Click(object sender, EventArgs e)
        {
            mIo.Command(GetConnInfo(), "CloseRelay", new bool[] { true, false, false, false });
        }

        private void btnCardReadAll_Click(object sender, EventArgs e)
        {
            mIo.Command(GetConnInfo(1, 5000), "GetCardList", CmbOptCardMode.SelectedIndex + 1);
            AddProcessFun((int)ConnectMain.eCommandCode.cmdGetCardList, GetCardListResult);
        }

        private void GetCardListResult(ConnectInfo oInfo, object oValue)
        {

        }
        /// <summary>
        /// 通过反射获取对象
        /// </summary>
        /// <param name="obj">对象</param>
        /// <param name="PropertyName">属性名</param>
        /// <returns></returns>
        public object GetObjValue(object obj, string PropertyName)
        {
            Type type = obj.GetType();
            object ret = type.GetProperty(PropertyName).GetValue(obj, null);
            if (ret.GetType().FullName == "System.UInt32")
                ret = (int)(uint)ret;
            return ret;
            object val = null;
            if (!ret.GetType().IsGenericType)
            {
                //非泛型
                val = Convert.ChangeType(ret, ret.GetType());//PropertyType);
                //default()

            }
            else
            {
                Type genericTypeDefinition = ret.GetType().GetGenericTypeDefinition();
                if (genericTypeDefinition == typeof(Nullable<>))
                {
                    val = Convert.ChangeType(ret, Nullable.GetUnderlyingType(ret.GetType()));
                }
            }
            return val;
        }

        private void btnWriteSortCardList_Click(object sender, EventArgs e)
        {
            List<Card> mCards = new List<Card>();
            for (int i = 0; i < 10; i++)
            {
                mCards.Add(new FC8900Card { Card = (uint)(2345678 + i), CardType = Card.eCardType.eNormal, ExpiryDate = new DateTime(2018, 2, 28), OpenCount = 100 });
            }
            mIo.Command(GetConnInfo(50, 2000), "WriteSortCardList", mCards);
        }

        private void btnCardWrite_Click(object sender, EventArgs e)
        {
            List<Card> mCards = new List<Card>();
            for (int i = 0; i < 10; i++)
            {
                mCards.Add(new FC8900Card { Card = (uint)(2345678 + i), CardType = Card.eCardType.eNormal, ExpiryDate = new DateTime(2018, 2, 28), OpenCount = 100 });
            }
            mIo.Command(GetConnInfo(50, 2000), "WriteCardList", mCards);
            AddProcessFun((int)ConnectMain.eCommandCode.cmdWriteCardList, WriteCardListResult);
        }
        private void WriteCardListResult(ConnectInfo oInfo, object oValue)
        {
            List<Card> oCardList = (List<Card>)oValue;//上传失败卡列表

            if (oCardList.Count > 0)
            {
                //上传失败数量
            }
        }

        private void btnCardClear_Click(object sender, EventArgs e)
        {
            mIo.Command(GetConnInfo(1, 5000), "ClearCard", CmbOptCardMode.SelectedIndex + 1);
            AddProcessFun((int)ConnectMain.eCommandCode.cmdClearCard, ClearCardResult);
        }

        private void ClearCardResult(ConnectInfo oInfo, object oValue)
        {
            MessageBox.Show("清空成功!");
        }

        private void btnWriteTime_Click(object sender, EventArgs e)
        {
            mIo.Command(GetConnInfo(), "WriteTime", ChkBroadcast.Checked);
        }

        private void btnWriteTimeDefine_Click(object sender, EventArgs e)
        {
            System.DateTime oDate = new DateTime(2018, 2, 28, 18, 13, 52);

            mIo.Command(GetConnInfo(), "WriteTimeDefine", oDate);
        }

        private void btnWriteAutoTimeRepair_Click(object sender, EventArgs e)
        {
            //0表示调慢，1表示调快
            mIo.Command(GetConnInfo(), "WriteAutoTimeRepair", 1, 10);
        }

        private void btnReadTime_Click(object sender, EventArgs e)
        {

            mIo.Command(GetConnInfo(), "ReadTime");
            AddProcessFun((int)ConnectMain.eCommandCode.cmdReadTime, ReadTimeResult);
        }

        private void ReadTimeResult(ConnectInfo oInfo, object oValue)
        {

        }

        private void btnReadAutoTimeRepair_Click(object sender, EventArgs e)
        {
            mIo.Command(GetConnInfo(), "ReadAutoTimeRepair");
            AddProcessFun((int)ConnectMain.eCommandCode.cmdReadAutoTimeRepair, ReadAutoTimeRepairResult);
        }

        private void ReadAutoTimeRepairResult(ConnectInfo oInfo, object oValue)
        {

        }
        long _searchNetNum = 0;
        int _searchCountMax = 0;
        int _searchCount = 0;
        List<SearchData> _searchSN = null;
        private void btnSearch_Click(object sender, EventArgs e)
        {
            long lNetNum = 0;
            Random rand = new Random();
            lNetNum = rand.Next(1, 65535);
            _searchNetNum = lNetNum;
            _searchCountMax = 3;
            _searchCount = 1;
            if (_searchSN == null)
            {
                _searchSN = new List<SearchData>();
            }
            _searchSN.Clear();
            ConnectInfo oInfo = GetConnInfo(0, 5000);
            if (mIo.Command(oInfo, "SearchEquptOnNetNum", lNetNum, ChkBroadcast.Checked))
            {
                btnSearch.Enabled = false;
            }

            AddProcessFun((int)ConnectMain.eCommandCode.cmdSearchEquptOnNetNum, SearchEquptStep);
        }

        private void SearchEquptStep(ConnectInfo oInfo, object oValue)
        {
            //搜索到设备
            bool bSave = false;


            TCPInfo_FC8000 oTCP = (TCPInfo_FC8000)GetObjValue(oValue, "TCP");
            string sSearchSN = (string)GetObjValue(oValue, "SN");
            byte[] bSN = (byte[])GetObjValue(oValue, "SNByte");
            bSave = true;
            foreach (SearchData oSN in _searchSN)
            {
                if (oSN.SNByte.BytesEquals(bSN))
                {
                    //判断是否已经存在这个设备
                    bSave = false;
                    break; // TODO: might not be correct. Was : Exit For
                }
            }

            if (bSave)
            {
                //添加到集合并发送设置指令
                SearchData oSN = new SearchData(sSearchSN, bSN, oTCP);
                _searchSN.Add(oSN);
                ConnectInfo oSnedInfo = GetConnInfo(iTimeout: 5000);
                oSnedInfo.SN = sSearchSN;
                mIo.Command(oSnedInfo, "SetEquptNetNum", _searchNetNum, ChkBroadcast.Checked);

                _searchCountMax = _searchCount + 3;
                //往后延伸三次
                if (_searchCountMax > 10)
                {
                    _searchCountMax = 10;
                }
            }
        }

        private void SearchEquptOver()
        {
            //搜索结束
            if (_searchCount < _searchCountMax)
            {
                //继续搜索
                _searchCount += 1;
                mIo.Command(GetConnInfo(0, 5000), "SearchEquptOnNetNum", _searchNetNum, ChkBroadcast.Checked);
            }
            else
            {
                btnSearch.Enabled = true;

                int i = 0;
                cmbDrives.Items.Clear();
                for (i = 0; i <= _searchSN.Count - 1; i++)
                {
                    if (!CheckSN(_searchSN[i].SN))
                    {
                        _searchSN[i].SN = "0x" + _searchSN[i].SNByte.ToHex();
                    }
                    //在下拉列表中显示设备SN
                    int index = cmbDrives.Items.Add(_searchSN[i].SN);
                }
            }
        }

        /// <summary>
        /// 检查SN是否合法
        /// </summary>
        /// <param name="sSN"></param>
        /// <returns></returns>
        /// <remarks></remarks>
        private bool CheckSN(string sSN)
        {
            bool[] bChar = new bool[256];
            byte[] bData = System.Text.ASCIIEncoding.Default.GetBytes("0123456789ABCEDFGHIJKLMNOPQRSTUVWXYZ- abcdefghijklmnopqrstuvwxyz");
            for (int i = 0; i <= bData.Length - 1; i++)
            {
                bChar[bData[i]] = true;
            }
            //开始检测是否有非法字符
            bData = System.Text.ASCIIEncoding.Default.GetBytes(sSN);//DebugSs
            for (int i = 0; i <= bData.Length - 1; i++)
            {
                if (!bChar[bData[i]])
                {
                    return false;
                }
            }

            return true;
        }


        private class SearchData
        {
            public FCardCDrive.TCPInfo_FC8000 TCP;
            public string SN;
            public byte[] SNByte;
            public SearchData(string sSN, byte[] bSNByte, TCPInfo_FC8000 oTCP)
            {
                TCP = oTCP;
                SN = sSN;
                SNByte = bSNByte;
            }
        }

        private void btnStop_Click(object sender, EventArgs e)
        {
            mIo.StopCommand(GetConnInfo(), -1);
        }

        private void cmbDrives_SelectedIndexChanged(object sender, EventArgs e)
        {
            //把下拉列表选中设备的连接信息填充到“通讯参数”中，并请求通讯密码
            SearchData sd = _searchSN.Find(o => o.SN == cmbDrives.SelectedItem.ToString());
            if (sd != null)
            {
                TxtIPAddr_TCPClient.Text = sd.TCP.IP;
                TxtIPPort_TCPClient.Value = sd.TCP.TCPPort;
                TxtConnSN.Text = sd.SN;
                TxtIPAddr_UDP.Text = sd.TCP.IP;
                TxtIPPort_UDP.Value = sd.TCP.UDPPort;
                ConnectInfo oInfo = GetConnInfo();
                oInfo.ConnType = ConnectInfo.e_ConnectType.OnTCPClient;
                oInfo.IP = sd.TCP.IP;
                oInfo.NetPort = sd.TCP.TCPPort;
                oInfo.Password = "FFFFFFFF";
                //请求通讯密码
                mIo.Command(oInfo, "ReadConnPassword", "4643617264597A", ChkBroadcast.Checked);
                AddProcessFun((int)ConnectMain.eCommandCode.cmdReadConnPassword, ReadConnPasswordDecompile);
            }
        }

        private void ReadConnPasswordDecompile(ConnectInfo oInfo, object oValue)
        {
            Invoke(new Action(() => { TxtConnPassword.Text = oValue as string; }));
        }
        bool mBeginServer;
        private int mListenPort;
        private void btnBeginServer_Click(object sender, EventArgs e)
        {
            if (mBeginServer)
            {
                mIo.StopListen_IOCP(mListenPort);
                mBeginServer = false;
                btnBeginServer.Text = "开启服务";
                TxtServerPort.Enabled = true;
            }
            else
            {
                int lServerPort = (int)TxtServerPort.Value;
                IPEndPoint oIP = new IPEndPoint(IPAddress.Any, lServerPort);
                mListenPort = lServerPort;
                bool b = mIo.BeginListen_IOCP(oIP);
                if (!b)
                {
                    MessageBox.Show("服务器端口被占用！");
                    return;
                }

                //注册事件回调，当有客户端连接时并发送第一个数据包时，触发此回调
                mIo.RegClientVerificationCallBlack((ushort)lServerPort, ClientVerificationCallBlack);                
                mBeginServer = true;
                btnBeginServer.Text = "关闭服务";
                TxtServerPort.Enabled = false;

            }
        }

        private bool ClientVerificationCallBlack(IOCPTCPServer.IOCPClientDetils ClientInfo, byte[] bBuf, int iBufLen)
        {
            if (bBuf[0] == 0x7e)
            {
                var oFCPacketDe = new FCardCDrive.Packet.FC8800Packet.FC8800PacketDecompile();
                List<FCardCDrive.Packet.INPacket> oFCPacketList = new List<FCardCDrive.Packet.INPacket>();
                if (oFCPacketDe.DeCompile(bBuf, 0, iBufLen, oFCPacketList, null))
                {
                    FCardCDrive.Packet.INPacket pak = oFCPacketList[0];
                    ClientInfo.SN = pak.SN;
                    if (pak.Data.CmdType == 0x19 & pak.Data.CmdIndex == 0x23)
                    {
                        AddClientToList(ClientInfo);
                    }
                }
                return true;
            }
            return false;
        }
        private class ClientInfo
        {
            public long Handle;

            public string RemoteEndPoint;
            public override string ToString()
            {
                return RemoteEndPoint;
            }
        }
        private void AddClientToList(FCardCDrive.Connect.TCPServer.IOCPTCPServer.IOCPClientDetils ClientInfo)
        {
            ClientInfo oClient = null;
            if (oClient != null)
            {
                oClient.RemoteEndPoint = ClientInfo.IP + " " + ClientInfo.SN;//.GetObjValue("IP + " " + ClientInfo.GetObjValue("SN;
                return;
            }
            oClient = new ClientInfo();
            oClient.RemoteEndPoint = ClientInfo.IP + " " + ClientInfo.SN;
            oClient.Handle = ClientInfo.ClientHandle;
         
        }


    }




}

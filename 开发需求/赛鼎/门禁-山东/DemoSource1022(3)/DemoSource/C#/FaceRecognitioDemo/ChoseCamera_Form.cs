using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Collections;
using System.Threading;
using FaceRecognitionDemo;


namespace FaceRecognitioDemo
{
        public struct iPimformation
        {
            public string ip;
            public string mac;
            public string manufacturer;
        }
    public partial class ChoseCamera_Form : Form
    {
        public bool chooseip;
        public string  cameraip;
        Hashtable m_unorder = new Hashtable();
    //  Dictonary<key,value> m_unorder = new Dictonary<key,value>();
        private SynchronizationContext m_SyncContext = null;
    
        public  iPimformation m_camera;
        private static int num = 0;
        private libFaceRecognitionSDK.discover_ipscan_cb_t m_discover_ip = null;//回调指针
        private void discover_ipscan_cb(ref  libFaceRecognitionSDK.ipscan_t ipscan,
                                             int usr_param) 
        {
       //   if (ipscan.mac == null || ipscan.mac.Length == 0) return;
            if (!m_unorder.Contains(ipscan.mac ))
            {
               num++;
                m_unorder.Add(num.ToString(), ipscan.mac);
                m_camera.ip = ipscan.ip;
                m_camera.mac = ipscan.mac;
                m_camera.manufacturer =apidata.GetDefaultString( ipscan.manufacturer);
                m_SyncContext.Post(ListViewShow, m_camera);
            }
        }



        public ChoseCamera_Form()
        {
            InitializeComponent();
            m_SyncContext = SynchronizationContext.Current;
        }
   
        public void ListViewShow(object infor) 
        {
            iPimformation camera = (iPimformation)infor;
            ListViewItem li = new ListViewItem();
            li.SubItems[0].Text = (camera.ip);
            li.SubItems.Add(camera.mac);
            li.SubItems.Add(camera.manufacturer);
            this.IPlist.Items.Add(li);
        }
        private void button1_Click(object sender, EventArgs e)
        {
            if (this.IPlist.FocusedItem != null)//这个if必须的，不然会得到值但会报错
            {
                //MessageBox.Show(this.listView1.FocusedItem.SubItems[0].Text);
                string cameraIp = this.IPlist.FocusedItem.SubItems[0].Text;//获得的listView的值显示在文本框里SubItems[i]第i列

                if (cameraIp == null || cameraIp.Length == 0)
                { MessageBox.Show("选中无效"); return; }
                if (libFaceRecognitionSDK.ZBX_Connected(apidata.getcamera()) == 0)
                {
                    IntPtr errorNum = new IntPtr(0);
                    IntPtr cameraHandle = libFaceRecognitionSDK.ZBX_ConnectEx(cameraIp, 8099, "", "", ref errorNum, 0, 1);
                    if (libFaceRecognitionSDK.ZBX_Connected(cameraHandle) != 0)
                    {
                        apidata.setcameraip(cameraIp);
                        apidata.setcamera(cameraHandle);
                        MessageBox.Show("连接成功");
                        //发送消息给主界面更改连接状态button20_Click
                        {
                            FaceRecognitionSDK_Form form = (FaceRecognitionSDK_Form )this.Owner;
                            form.getconntetstate(true);
                        }
                        this.Close();
                    }
                    else { MessageBox.Show("连接失败"); return; }
                }
                else { MessageBox.Show("相机已经连接，请先断开连接"); return; }

            } else    { MessageBox.Show("选中无效"); return; }
        }

        private void ChoseCamera_Form_Load(object sender, EventArgs e)
        {
            this.IPlist.Columns.Add("IP", 125);
            this.IPlist.Columns.Add("SN", 125);
            this.IPlist.Columns.Add("制造商", 125);
            this.IPlist.GridLines = true;  //显示网格线
            this.IPlist.FullRowSelect = true;  //显示全行
            this.IPlist.MultiSelect = false;  //设置只能单选
            this.IPlist.View = View.Details;  //设置显示模式为详细
            int gthis = 0;
             m_discover_ip = new libFaceRecognitionSDK.discover_ipscan_cb_t(discover_ipscan_cb);
            libFaceRecognitionSDK.ZBX_RegDiscoverIpscanCb(m_discover_ip, gthis);
            libFaceRecognitionSDK. ZBX_DiscoverIpscan();

    
        }

        private void listView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

 

        private void IPlist_DoubleClick(object sender, EventArgs e)
        {
            button1_Click(sender, e);
        }

        private void IPlist_MouseClick(object sender, MouseEventArgs e)
        {
            if (this.IPlist.FocusedItem != null)//这个if必须的，不然会得到值但会报错
            {
                //MessageBox.Show(this.listView1.FocusedItem.SubItems[0].Text);
                string a = this.IPlist.FocusedItem.SubItems[0].Text;//获得的listView的值显示在文本框里SubItems[i]第i列

            } 
        }

    }
}

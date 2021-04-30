using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace FaceRecognitioDemo
{
    
    public partial class NetSettings_Forms : Form
    {
        private bool m_connet;
        private SynchronizationContext m_SyncContext = null;
        private libFaceRecognitionSDK.discover_ipscan_cb_t m_discover_ip = null;//回调指针
        Hashtable m_unorder = new Hashtable();
        public iPimformation m_camera;
        private int num ;
        private int  m_choice;
        public NetSettings_Forms()
        {
            InitializeComponent();
            m_SyncContext = SynchronizationContext.Current;
            m_connet = false;
            if (apidata.CheckCamera())
            {  m_connet = true; }
            num = 0;
          
        //    comboBox1.SelectedIndex = 0;
            m_choice =  0;
        }

          
       // 回调函数
        private void discover_ipscan_cb(ref  libFaceRecognitionSDK.ipscan_t ipscan,
                                       int usr_param)
        {
            if (ipscan.mac == null || ipscan.mac.Length == 0) return;
          
            if (!m_unorder.Contains(ipscan.mac))
            {

                if (m_choice ==1)
                {
                    string s = ipscan.ip;//.DisplayMember.Substring(0, 11);
                    if (s == "192.168.1.100")
                    {
                        return;
                    }
                }
                else if (m_choice ==0)
                {
                    string s = ipscan.ip;//.DisplayMember.Substring(0, 11);
                    if (s != "192.168.1.100")
                    return;
                }
                num++;
                m_unorder.Add(num.ToString(), ipscan.mac);
                m_camera.ip = ipscan.ip;
                m_camera.mac = ipscan.mac;
                m_camera.manufacturer =apidata.GetDefaultString( ipscan.manufacturer);
                m_SyncContext.Post(ListViewShow, m_camera);
                return;
            }
            
        }

        private void ListViewShow1(object infor)
        {
                this.listView1.Items.Clear();  //只移除所有的项。
                m_unorder.Clear();
                num = 0;
                return;
        }

      private void ListViewShow(object infor)
        {
            iPimformation camera = (iPimformation)infor;
         
            ListViewItem li = new ListViewItem();
            li.SubItems.Add(camera.ip);
            li.SubItems.Add(camera.mac);
            li.SubItems.Add(camera.manufacturer);
            this.listView1.Items.Add(li);
            textBox4.Text = num.ToString();
        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void label3_Click_1(object sender, EventArgs e)
        {

        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void label7_Click(object sender, EventArgs e)
        {

        }

        public class Info
        {
            public string Id { get; set; }
            public string Name { get; set; }

        }


        private void NetSettings_Forms_Load(object sender, EventArgs e)
        {
         
            libFaceRecognitionSDK.SystemNetInfo netinfo = new libFaceRecognitionSDK.SystemNetInfo();
            listView1.CheckBoxes = true;
            this.listView1.Columns.Add("选择", 80);
            this.listView1.Columns.Add("IP", 125);
            this.listView1.Columns.Add("SN", 125);
            this.listView1.Columns.Add("进度", 125);
            this.listView1.GridLines = true;  //显示网格线
            this.listView1.FullRowSelect = true;  //显示全行
            this.listView1.MultiSelect = false ;  //设置只能单选
            this.listView1.View = View.Details;  //设置显示模式为详细
            if (m_connet)
            {
                int ret = libFaceRecognitionSDK.ZBX_GetNetConfig(apidata.getcamera(), ref netinfo);
                camip.Text = netinfo.ip_addr;
                textBox2.Text = netinfo.netmask;
                textBox3.Text = netinfo.gateway;
                textBox8.Text = netinfo.netmask;
                textBox7.Text = netinfo.gateway;
                IList<Info> infoList = new List<Info>();
                Info info1 = new Info() { Id = "1", Name = "192.168.1.100" };
                Info info2 = new Info() { Id = "2", Name = "非192.168.1.100" };
                Info info3 = new Info() { Id = "3", Name = "全部" };
                infoList.Add(info1);
                infoList.Add(info2);
                infoList.Add(info3);
                comboBox1.DataSource = infoList;
                comboBox1.ValueMember = "Id";
                comboBox1.DisplayMember = "Name";
            }
        
      
        }

        private void button1_Click(object sender, EventArgs e)
        {
            libFaceRecognitionSDK. SystemNetInfo netinfo=new  libFaceRecognitionSDK.SystemNetInfo();
            if (m_connet)
            {
                int ret = libFaceRecognitionSDK.ZBX_GetNetConfig(apidata.getcamera(), ref netinfo);
                camip.Text = netinfo.ip_addr;
           textBox2.Text = netinfo.netmask;
           textBox8.Text = netinfo.netmask;
            textBox7.Text = netinfo.gateway;
                textBox3.Text = netinfo.gateway;
                MessageBox.Show("获取网络信息成功");
            }
            else
            {
                MessageBox.Show("获取网络信息失败");
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            libFaceRecognitionSDK.SystemNetInfo netinfo = new libFaceRecognitionSDK.SystemNetInfo();
           netinfo.ip_addr=  camip.Text ;
           netinfo.netmask=  textBox2.Text ;
           netinfo.gateway= textBox3.Text ;
           if (apidata.stringIsEmpty(netinfo.ip_addr) || 
               apidata.stringIsEmpty(netinfo.netmask) || 
               apidata.stringIsEmpty(netinfo.gateway))
           {
               MessageBox.Show("请填写正确的参数");
               return;
           }
           int ret = libFaceRecognitionSDK.ZBX_SetNetConfig(apidata.getcamera(), ref netinfo);
           if (ret == 0)
           {
               MessageBox.Show("设置成功");
           }
           else
           {
               MessageBox.Show("连接是失败 ,网络设置已更新 请重新连接");
           }
        }

        private void groupBox2_Enter(object sender, EventArgs e)
        {

        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            m_choice = comboBox1.SelectedIndex;
            m_SyncContext.Post(ListViewShow1, "");
            int t = 0;
            m_discover_ip = new libFaceRecognitionSDK.discover_ipscan_cb_t(discover_ipscan_cb);
            libFaceRecognitionSDK.ZBX_RegDiscoverIpscanCb(m_discover_ip, t);
            libFaceRecognitionSDK.ZBX_DiscoverIpscan();
        }

        private void button6_Click(object sender, EventArgs e)
        {
            string ip_addr  = textBox5.Text;
       
           if( !apidata.IsLegal_Ip(ip_addr))
           {
               MessageBox.Show("起始ip不合法");return ;
           }
    
             string netmask=textBox8.Text;
         string gateway=textBox7.Text;
            string mac;

            int number = 0;string forip=null;
            int j = 0; int ip = 0;
            while (j < ip_addr.Length)
            {
                while (number < 3)
                {
                    if (ip_addr[j] == '.') { number++; } forip += ip_addr[j]; 
                    j++;
                }
                ip = ip * 10 + ip_addr[j++]-'0';
            }
            int k = 0;
            int m = listView1.CheckedItems.Count;
            string[] a = new string[m];
            for (int i = 0; i < m; i++)
            {
                if (listView1.CheckedItems[i].Checked)
                {
                    a[i] = listView1.CheckedItems[i].SubItems[2].Text;
                    libFaceRecognitionSDK.ZBX_SetIpBymac(a[i], forip + (ip + 1).ToString(),
                                  netmask, gateway);
                }
                label11.Text = forip + (ip + m - 1).ToString();
            }
            MessageBox.Show("设置完成");
 
        }
    }
}

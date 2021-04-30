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
    public partial class dialog_Form : Form
    {
      
        private byte[] m_filePathByte;
        private string m_flie_name;
        private libFaceRecognitionSDK.ZBX_HTTPRESULT_PROCESS m_upgrade = null;//回调指针
        private libFaceRecognitionSDK.discover_ipscan_cb_t m_discover_ip = null;//回调指针
        private SynchronizationContext m_SyncContext = null;
        Hashtable m_unorder = new Hashtable();
        private int num = 0;
        public dialog_Form()
        {
            InitializeComponent();
            m_SyncContext = SynchronizationContext.Current;
            this.listView1.Columns.Add("选择", 80);
            this.listView1.Columns.Add("IP", 125);
            this.listView1.Columns.Add("进度", 125);
            this.listView1.GridLines = true;  //显示网格线
            this.listView1.FullRowSelect = true;  //显示全行
            this.listView1.MultiSelect = true ;  //设置多选
            this.listView1.View = View.Details;  //设置显示模式为详细
            m_discover_ip = new libFaceRecognitionSDK.discover_ipscan_cb_t(discoveripscan);
            int t = 0;
            libFaceRecognitionSDK.ZBX_RegDiscoverIpscanCb(m_discover_ip, t);
            libFaceRecognitionSDK.ZBX_DiscoverIpscan();
        }
                private void discoveripscan(ref  libFaceRecognitionSDK.ipscan_t ipscan,
                                       int usr_param)
                {
                    if (ipscan.mac == null || ipscan.mac.Length == 0) return;
                    if (!m_unorder.Contains(ipscan.mac)) 
                    {
                        num++;
                        m_unorder.Add(num.ToString(), ipscan.mac);
           
                        m_SyncContext.Post(ListViewShow, ipscan.ip);
                    }
                }

                private void ListViewShow(object imf) 
                {
                    string ip = (imf.ToString());
                    ListViewItem li = new ListViewItem();
                    li.SubItems.Add(imf.ToString());
                    li.SubItems.Add("等待选择");
                    this.listView1.Items.Add(li);
                }

        private void progressBarShow(object imf) 
        {
            int pro = (int)imf;
            progressBar1.Value = pro;

            if (pro == 100) MessageBox.Show("升级完成");
        }


        private int UpdataProcessCallback(IntPtr user_data,
	double rDlTotal,
	double rDlNow,
	double rUlTotal,
    double rUlNow)
        {
            if (!(rUlTotal==0) && !(rUlNow==0))
            {
                return 0;
            } return 0;
            int process = (int)(rUlNow * 100 / rUlTotal);

            m_SyncContext.Post(progressBarShow, process);
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void progressBar1_Click(object sender, EventArgs e)
        {

        }

        private void button6_Click(object sender, EventArgs e)
        {

            int k = 0;
            int m = listView1.CheckedItems.Count;
            if (m == 0) MessageBox.Show("请选择升级的相机");
            if(apidata.stringIsEmpty( m_flie_name))MessageBox.Show("请先选择升级的镜像");
            string cameraip;
            for (int i = 0; i < m; i++)
            {
                if (listView1.CheckedItems[i].Checked)
                {
                    cameraip = listView1.CheckedItems[i].SubItems[1].Text;
                   //升级
                    listView1.CheckedItems[i].SubItems[2].Text = "开始上传镜像";
                    IntPtr err_code=IntPtr.Zero;
                    IntPtr cam =libFaceRecognitionSDK. ZBX_ConnectEx(cameraip, 
                        8099, "", "", ref err_code, 0, 0);
                    if (libFaceRecognitionSDK.ZBX_Connected(cam) != 1)
                    {
                       listView1.CheckedItems[i].SubItems[2].Text= "连接相机失败";
                        continue;
                    }
                    listView1.CheckedItems[i].SubItems[2].Text = "  已连接相机 上传镜像中...";
                    int iRet = libFaceRecognitionSDK.ZBX_UpdateSystem(cam, m_filePathByte);
                    if (iRet == 0)
                    {
                        listView1.CheckedItems[i].SubItems[2].Text = "镜像上传完成 正在重启...";
                        if (apidata.CheckCamera())
                            libFaceRecognitionSDK.ZBX_DisConnect(apidata.getcamera());
                        //   apidata.setcameraip(null);
                        //    apidata.setcamera(IntPtr.Zero);
                        listView1.CheckedItems[i].SubItems[2].Text = "升级完成";
                    }
                    else 
                    {
                        listView1.CheckedItems[i].SubItems[2].Text = "升级错误，错误码为" + iRet.ToString();
                    }
                }
                MySleep(2000);
             
            }
        }

           [System.Runtime.InteropServices.DllImport("kernel32.dll")]
        static extern uint GetTickCount();
           static void MySleep(uint ms)
           {
               uint start = GetTickCount();
               while (GetTickCount() - start < ms)
               {
                   Application.DoEvents();
               }
           }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void dialog_Form_Load(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            OpenFileDialog file = new OpenFileDialog();
            file.ShowDialog();
          //   m_flie_name = file.SafeFileName;
            m_flie_name = file.FileName;
             Console.WriteLine(m_flie_name);
             textBox1.Text = m_flie_name;
             m_filePathByte = System.Text.Encoding.UTF8.GetBytes(m_flie_name);
           
        }

        private void cameraIP_Click(object sender, EventArgs e)
        {

        }

        private void groupBox1_Enter(object sender, EventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {
            if (!apidata.CheckCamera())
            { MessageBox.Show("请先连接相机"); return; }
       if(  apidata.stringIsEmpty( m_flie_name)) MessageBox.Show("请先选择升级的镜像");
            m_upgrade = new libFaceRecognitionSDK.ZBX_HTTPRESULT_PROCESS(
                UpdataProcessCallback);
            IntPtr IntPtrnull = IntPtr.Zero;
            libFaceRecognitionSDK.ZBX_SetUpdateSystem_CB(apidata.getcamera(), 
                UpdataProcessCallback,ref IntPtrnull);
           int iRet = libFaceRecognitionSDK.ZBX_UpdateSystem(apidata.getcamera(),
               m_filePathByte); // 没分配空间

           if (iRet == 0)
           {
               MessageBox.Show("升级完成 设备即将重启");
               //ZBX_RebootCam(m_cam);
               ///::SendMessage(m_parent->GetSafeHwnd(), User_MSG, NULL, NULL);
               //OnCancel();
               //OnOK();
               if(apidata.CheckCamera())
               libFaceRecognitionSDK.ZBX_DisConnect(apidata.getcamera());
               apidata.setcameraip(null);
               apidata.setcamera(IntPtr.Zero);
             
           }
           else
           {
               MessageBox.Show("升级失败 请重试");
           }

        }
    }
}

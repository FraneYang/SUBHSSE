using FaceRecognitioDemo;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Net;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading;
using System.Windows.Forms;

namespace FaceRecognitionDemo
{

    public partial class FaceRecognitionSDK_Form : Form
    {
        public IntPtr hwndMain;
        private const int MSG_PLATE_INFO = 0x901;
        private SynchronizationContext m_SyncContext = null;  //同步指针
        private string m_save_path;// 保存图片路径
        private bool m_bConnect;   //相机连接状态
        private IntPtr m_cameraHandle;
        private string m_local_ip;//本机ip;
        private libFaceRecognitionSDK.ZBX_FaceRecoCb_t m_RecoCb_t = null;//回调指针
        private libFaceRecognitionSDK.ZBX_ConnectEventCb_t m_ConnectEventCb = null;//回调指针
        private IntPtr m_gThis;
        private bool  m_pictureBox3Click;
           public ListViewItem ListViewShow(string ID) 
        {
            ListViewItem li = new ListViewItem();
            li.SubItems[0].Text = (ID);
        
          //  listView1.Items.Add(li);
               return li;
        }

           private struct FaceRecoinf
        {
               public string  matchPersonName;
               public string  matchPersonId;
               public string  time;
       
        }

           //qpi更新连接信息
   public  void  getconntetstate(object conntetstate )
   {
       bool connet = (bool)conntetstate;
       if (connet) 
       {
           m_cameraHandle = apidata.getcamera();
          m_bConnect = true;
           ConnetCamera.Text ="断开相机";
           CameraIP.Text =apidata.getcameraip() ;

           m_RecoCb_t = new libFaceRecognitionSDK.ZBX_FaceRecoCb_t(OnPlateResult);
           libFaceRecognitionSDK.ZBX_RegFaceRecoCb(m_cameraHandle, m_RecoCb_t, m_gThis);

           //libFaceRecognitionSDK.ZBX_StartStream(m_cameraHandle, pictureBox3.Handle);
           //pictureBox3.Tag = m_cameraHandle;
       }
       else     {
          m_bConnect = false; ;
          ConnetCamera.Text = "连接相机";
       }
   }
        //更新显示信息
           private void listshowPersonImf(object messimf)
           {
               apidata.FaceReco temp = (apidata.FaceReco)messimf;
               ListViewItem li = new ListViewItem();
               if (temp.personname == null || temp.personname.Length == 0)
               {
                  // ListViewItem li;
                   li.SubItems[0].Text = temp.time;
                   unidentifiedImf.Items.Insert(0,li);
                //   unidentifiedImf.Items.Add(li);
               }
               else 
               {
                   this.identifiedimf.BeginUpdate();
                   li.SubItems[0].Text =apidata. UTF8ToGB2312(temp.personname);
                   //string c = apidata.UTF8ToUnicode(temp.personname, 16);
                   //string d = apidata.GB2312ToUTF8(temp.personname);
                   //c = apidata.UTF8ToGB2312(d);
                   li.SubItems.Add(temp.personid);
                   li.SubItems.Add(temp.time);
                   this.identifiedimf.Items.Insert(0, li);
                //   this.identifiedimf.Items.Add(li);
                   this.identifiedimf.EndUpdate();  

               }
               CapturedImage.Image = temp.faceimage;
               modeImage.Image = temp.modelFaceImg;
              //rodo显示及保存图片
           }
        // 接收错误信息
       private     void seterrorImf(object error) 
           {
               MessageBox.Show(error.ToString());
           }

       private Image IntPtrToImage (IntPtr imageIntPtr ,int image_len)
       {
           Image reImage;
           try
           {
               byte[] imgtemp = new byte[image_len];
               Marshal.Copy(imageIntPtr, imgtemp, 0, image_len);
               MemoryStream ms = new MemoryStream(imgtemp, 0, imgtemp.Length);
               //设置图片
               reImage = Image.FromStream(ms);
             //  plateInfo.faceimagelen = pUserData.faceImgLen;
           }
           catch (Exception ex)
           {
               m_SyncContext.Post(seterrorImf, ex.ToString()); return null ;
           }
           return reImage;
       }

        //抓拍回调
       private void OnPlateResult(IntPtr cam, ref libFaceRecognitionSDK.FaceRecoInfo pUserData, IntPtr usrParam)
       {
           //   if( (bool)temp )
           {
               apidata.FaceReco plateInfo = new apidata.FaceReco();
             //  DateTime begindt = new DateTime(1970, 1, 1, 0, 0, 0);
               DateTime dt1970 = new DateTime(1970, 1, 1, 8, 0, 0, 0);
               if (pUserData.matched == -1)
               {
                   // DateTime ts = new DateTime(begindt.Ticks + pUserData.tvSec);
                //   DateTime dt1970 = new DateTime(1970, 1, 1, 0, 0, 0, 0);
                   long t = 10000000;
                   t = dt1970.Ticks + pUserData.tvSec * t;
                   DateTime ts = new DateTime(t);
               //    DateTime ts = DateTime.Now;
                 
                   plateInfo.time = ts.ToString("yyyy.MM.dd.HH.mm.ss.ffff");
                   // pictureBox1.
                   if (pUserData.faceImgLen > 0)
                   {
                       plateInfo.personname = "";
                       plateInfo.faceimage=  IntPtrToImage(pUserData.faceImg, pUserData.faceImgLen);
                     
                       plateInfo.faceimagelen = pUserData.faceImgLen;
                   
                       //   IntPtr tmp = pUserData.faceImg + pUserData.faceImgLen - 4;
                       plateInfo.saveimage_path = m_save_path + "\\unidentified\\";
                       plateInfo.modelFaceImg = null;
                       if (!Directory.Exists(plateInfo.saveimage_path))
                       {
                           Directory.CreateDirectory(plateInfo.saveimage_path);
                       }
                       string filename = plateInfo.saveimage_path + ts.ToString("yyyy.MM.dd.HH.mm.ss.ffff") + ".jpg";
                       plateInfo.faceimage.Save(filename);

                   }
                   else { return; }
               }
               else
               {
                   plateInfo.personname =apidata.GetDefaultString( pUserData.matchPersonName);
                   if (plateInfo.personname == null || plateInfo.personname.Length == 0)
                   {
                       plateInfo.personname = "1";
                   }
                   plateInfo.personid = pUserData.matchPersonId;
                   long t = 10000000;
                   t = dt1970.Ticks + pUserData.tvSec * t;
                   DateTime ts = new DateTime(t);
               //    DateTime ts = DateTime.Now;
                   plateInfo.time = ts.ToString("yyyy.MM.dd.HH.mm.ss.ffff");
                   plateInfo.faceimage = IntPtrToImage(pUserData.faceImg, pUserData.faceImgLen);
                   plateInfo.modelFaceImglen = pUserData.faceImgLen;
                   plateInfo.modelFaceImg = IntPtrToImage(pUserData.modelFaceImg, pUserData.modelFaceImgLen);
                   plateInfo.modelFaceImglen = pUserData.modelFaceImgLen;

                   plateInfo.saveimage_path = m_save_path + "\\identified\\";
                   if (!Directory.Exists(plateInfo.saveimage_path))
                   {
                       Directory.CreateDirectory(plateInfo.saveimage_path);
                   }
                   string filename = plateInfo.saveimage_path + ts.ToString("yyyy.MM.dd.HH.mm.ss.ffff") +".jpg";
                   plateInfo.faceimage.Save(filename);

                  string   save_mode_path= m_save_path + "\\mode\\";
                  if (!Directory.Exists(save_mode_path))
                   {
                       Directory.CreateDirectory(save_mode_path);
                   }
                  filename = save_mode_path + ts.ToString("yyyy.MM.dd.HH.mm.ss.ffff") + ".jpg";
                  plateInfo.modelFaceImg.Save(filename);
               }

               m_SyncContext.Post(listshowPersonImf, plateInfo);
           }

           return ;
       }

       private void ConnectEventCb(IntPtr cam, string ip,
                                           ushort port, int event1,
                                            int usrParam)
       {
           if (event1 == 0)
           {
               if (libFaceRecognitionSDK.ZBX_IsServer(cam) == 1)
               {
                   libFaceRecognitionSDK.ZBX_DisConnect(cam);
               }
               return;
           }

       }
       
        
        public FaceRecognitionSDK_Form()
        {

            InitializeComponent();
            m_bConnect = false ;
            m_SyncContext = SynchronizationContext.Current;
            textBox1.Text = apidata.GetLocalIp();
            m_pictureBox3Click = false;
        }

   
        //初始化
        private void FaceRecognitionSDK_Form_Load(object sender, EventArgs e)
        {
            libFaceRecognitionSDK.ZBX_Init();
          libFaceRecognitionSDK.ZBX_SetNotifyConnected(1);
          m_ConnectEventCb = new libFaceRecognitionSDK.ZBX_ConnectEventCb_t(ConnectEventCb);
          libFaceRecognitionSDK.ZBX_RegConnectEventCb(m_ConnectEventCb, 0);

          ImageList imgList = new ImageList();
          imgList.ImageSize = new Size(1, 15);// 设置行高 20 //分别是宽和高
          identifiedimf.SmallImageList = imgList; //这里设置listView的SmallImageList ,用imgList将其撑大

          imgList.ImageSize = new Size(1, 15);// 设置行高 20 //分别是宽和高
          unidentifiedImf.SmallImageList = imgList; //这里设置listView的SmallImageList ,用imgList将其撑大

          this.identifiedimf.Columns.Add("姓名", 80);
          this.identifiedimf.Columns.Add("ID", 80);
          this.identifiedimf.Columns.Add("时间", 80);
          this.identifiedimf.GridLines = true;  //显示网格线
          this.identifiedimf.FullRowSelect = true;  //显示全行
          this.identifiedimf.MultiSelect = false;  //设置只能单选
          this.identifiedimf.View = View.Details;  //设置显示模式为详细
          this.unidentifiedImf.Columns.Add("时间", 230);
          this.unidentifiedImf.GridLines = true;  //显示网格线
          this.unidentifiedImf.FullRowSelect = true;  //显示全行
          this.unidentifiedImf.MultiSelect = false;  //设置只能单选
          this.unidentifiedImf.View = View.Details;  //设置显示模式为详细

    
       //     Control.CheckForIllegalCrossThreadCalls = false;//多线程更新消息 不推荐
          //  ListViewItem li = new ListViewItem();
          //li.SubItems[0].Text = ("sda");
          //li.SubItems.Add("se");
          //li.SubItems.Add("323");
          //listView1.Items.Add(li);
          // li = new ListViewItem();
          //li.SubItems[0].Text = ("sda");
          //li.SubItems.Add("se");
          //li.SubItems.Add("323");
          //listView1.Items.Add(li);
            m_save_path = this.image_save_path.Text;
        }

        private void groupBox1_Enter(object sender, EventArgs e)
        {

        }



        private void groupBox2_Enter(object sender, EventArgs e)
        {

        }

        private void groupBox4_Enter(object sender, EventArgs e)
        {

        }

        private void groupBox8_Enter(object sender, EventArgs e)
        {

        }

        private void button15_Click(object sender, EventArgs e)
        {
           //  btnSelectPath_Click
          
            FolderBrowserDialog path = new FolderBrowserDialog();
            path.ShowDialog();
            string npath = path.SelectedPath;
            Console.WriteLine(m_save_path);
            if (path == null || npath.Length == 0)
            { return; }
            m_save_path = npath;
            image_save_path.Text = m_save_path;
            try
            {
                if (!Directory.Exists(m_save_path))
                {
                    Directory.CreateDirectory(m_save_path);
                }
            }
            catch (Exception ex) 
            {
                MessageBox.Show(ex.ToString());
                return;
            }
        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void image_save_path_TextChanged(object sender, EventArgs e)
        {
          
        }

        private void button18_Click(object sender, EventArgs e)
        {
            ChoseCamera_Form showChoseCamera = new ChoseCamera_Form();
            showChoseCamera.StartPosition = FormStartPosition.CenterScreen;
            ///   showChoseCamera.SetLPRHandle(lprHandle);
            showChoseCamera.ShowDialog();
        }



        private bool CheckCamera()
        {
          
           return  libFaceRecognitionSDK.ZBX_Connected(apidata.getcamera()) == 1;
           
           // return m_bConnect;
        }
   
      

      //  private IntPtr m_gThis;
        private void button2_Click(object sender, EventArgs e)
        {
            if (!CheckCamera())
            {
                MessageBox.Show("请先添加相机");
                return;
            }
            else
            {
                degregmng_Form degregmng = new degregmng_Form();
                degregmng.StartPosition = FormStartPosition.CenterScreen;
             //    serialForm.SetLPRHandle(lprHandle);
                degregmng.ShowDialog();
            }
        }


        private void button11_Click(object sender, EventArgs e)
        {
            if (!CheckCamera())
            {
                MessageBox.Show("请先添加相机");
                return;
            }
            else
            {
                //todo
            }
        }

        private void button7_Click(object sender, EventArgs e)
        {
            dialog_Form showdialog = new dialog_Form();
            showdialog.StartPosition = FormStartPosition.CenterScreen;
                //serialForm.SetLPRHandle(lprHandle);
            showdialog.ShowDialog();
        }

        private void button9_Click(object sender, EventArgs e)
        {

            RecogSetting_Form showRecogSetting = new RecogSetting_Form();
            showRecogSetting.StartPosition = FormStartPosition.CenterScreen;
                //serialForm.SetLPRHandle(lprHandle);
            showRecogSetting.ShowDialog();
        }


        private void listView2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void button14_Click(object sender, EventArgs e)
        {
            string strCameraIp = apidata.getcameraip();
           if (!m_bConnect)
            {
                MessageBox.Show("请先连接相机");
                return;
            }
          //  int lprHandle = 0;
            AddFaceForm serialForm = new AddFaceForm();
            serialForm.StartPosition = FormStartPosition.CenterScreen;
      //??     serialForm.SetLPRHandle(lprHandle);//本窗口句柄
            serialForm.ShowDialog();
        }

        private void button8_Click(object sender, EventArgs e)
        {
            NetSettings_Forms showNetSettings = new NetSettings_Forms();
            showNetSettings.StartPosition = FormStartPosition.CenterScreen;
            showNetSettings.ShowDialog();
        }

        //private void button13_Click(object sender, EventArgs e)
        //{
          
  
        //    {
        //        //OnBnClickedButton8();
        //        if (m_bConnect)
        //        {
        //            libFaceRecognitionSDK.ZBX_DisConnect( m_cameraHandle);
        //            m_bConnect = false;

        //            //return;
        //        }
        //        m_cameraHandle = IntPtr.Zero;
        //      String strCameraIp;
        //     //   dlg.GetCameraIP(strCameraIp);
        //      ChoseCamera_Form showChoseCamera = new ChoseCamera_Form();
        //      showChoseCamera.StartPosition = FormStartPosition.CenterScreen;

        //      showChoseCamera.ShowDialog();


        //      strCameraIp = apidata.getcameraip(); 
        //      if (strCameraIp==null||strCameraIp.Length == 0)
        //        {
        //            MessageBox.Show("请先选择相机ip");
        //            return;
        //        }
        //        if (m_local_ip == strCameraIp)
        //        {
                    
        //            MessageBox.Show("设备IP与本机IP冲突");
        //            return;
        //        }
        //        IntPtr err_code = new IntPtr(0); ;
        //        m_cameraHandle = libFaceRecognitionSDK.ZBX_ConnectEx(strCameraIp, 8099, "", "", ref err_code, 0, 1);
        //        if (m_cameraHandle != IntPtr.Zero)
        //        {
        //            if (libFaceRecognitionSDK.ZBX_Connected( m_cameraHandle)==0)
        //            {
        //                MessageBox.Show("连接成功");
        //                CameraIP.Text = strCameraIp;
        //                 MessageBox.Show("断开相机");
        //                 m_RecoCb_t = new libFaceRecognitionSDK.ZBX_FaceRecoCb_t(OnPlateResult);
        //                 libFaceRecognitionSDK.ZBX_RegFaceRecoCb(m_cameraHandle,  m_RecoCb_t, m_gThis);
        //                m_bConnect = true;
        //            }
        //            else
        //            {
        //                MessageBox.Show("连接失败");
        //            }
        //            //ZBX_RegFaceRecoCb(m_cameraHandle, RegFaceRecofunCb_t, gThis);
        //            //ZBX_RegFaceRecoCb(m_cameraHandle, RegFaceRecofunCb_t, gThis);

        //        }
        //        else
        //        {
        //            MessageBox.Show("连接失败");
        //        }
        //    };

        //}

        private void label3_Click(object sender, EventArgs e)
        {

        }


        private void button20_Click(object sender, EventArgs e)
        {
            if (CheckCamera())
           {
               libFaceRecognitionSDK.ZBX_DisConnect(m_cameraHandle);
               m_bConnect = false;
               ConnetCamera.Text = "连接相机";
               m_cameraHandle = IntPtr.Zero;
               //libFaceRecognitionSDK.ZBX_StopStreamEx(m_cameraHandle, pictureBox3.Handle);
               //pictureBox3.Tag = m_cameraHandle;
               apidata.setcamera(m_cameraHandle);
               return;
           }
           else 
           {
               m_local_ip = apidata.GetLocalIp();
              string cameraIp= CameraIP.Text;
               //判断输入是否合法
              if (!apidata.IsLegal_Ip(cameraIp))
               {
                   MessageBox.Show("输入有误");
                   return;
               }
              apidata.setcameraip(cameraIp);
             //  int num =0;
                   //for (int i = 0; i < m_local_ip.Length && num < 3; ++i)
                   //{
                   //    if (m_local_ip[i] == '.') num++;
                   //    if (m_local_ip[i] != cameraIp[i])
                   //    {
                   //            MessageBox.Show("本机与相机必须相机一个网段");
                   //            return;
                   //    }
                   //}
               if ((cameraIp == "0.0.0.0"))
               {
                   MessageBox.Show("请先输入ip");
                   return;
               }
               if (m_local_ip == cameraIp)
               {
                   MessageBox.Show("设备IP与本机IP冲突");
                   return;
               }
               IntPtr errorNum=new IntPtr(0);
               m_cameraHandle = libFaceRecognitionSDK.ZBX_ConnectEx(cameraIp, 8099, "", "", ref errorNum, 0, 1);

               if (m_cameraHandle != IntPtr.Zero)
               {
                 
                  if (libFaceRecognitionSDK.ZBX_Connected( m_cameraHandle)!=0)
                   {
                       apidata.setcamera(m_cameraHandle);
                       MessageBox.Show("连接成功");
                       ConnetCamera.Text = "断开相机";
                       m_bConnect = true;
                       m_RecoCb_t = new libFaceRecognitionSDK.ZBX_FaceRecoCb_t(OnPlateResult);
                       libFaceRecognitionSDK.ZBX_RegFaceRecoCb(m_cameraHandle, m_RecoCb_t, m_gThis);

                       //播放视频

                       //libFaceRecognitionSDK.ZBX_StartStream(m_cameraHandle, pictureBox3.Handle);
                       //pictureBox3.Tag = m_cameraHandle;
                      
                   }
                  else
                  {
                      MessageBox.Show("连接失败");
                  }

               }
               else
               {
                   MessageBox.Show("连接失败");
               }
           }
        }

        private void connnetserver_Click(object sender, EventArgs e)
        {
            string serveIp = textBox1.Text;
            if (!apidata.IsLegal_Ip(serveIp))
            {
                MessageBox.Show("输入有误");
                return;
            }
            if (!CheckCamera())
            {
                MessageBox.Show("请先添加相机");
                return;
            }
            int iRet = libFaceRecognitionSDK.ZBX_SetServerSdkParam(apidata.getcamera(), 1, serveIp, 8091, null);
            if (iRet >=0) MessageBox.Show("设置成功");
            else MessageBox.Show("设置失败");

        }



        private void pictureBox3_Click(object sender, EventArgs e)
        {
            if (!m_pictureBox3Click)
                if (!CheckCamera()) { MessageBox.Show("请先连接相机"); return; }
                else
                {
                    m_pictureBox3Click = true;
                    libFaceRecognitionSDK.ZBX_StartStream(m_cameraHandle, pictureBox3.Handle);
                    pictureBox3.Tag = m_cameraHandle;
                }
            else 
            {
                libFaceRecognitionSDK.ZBX_StopStreamEx(m_cameraHandle, pictureBox3.Handle);
                pictureBox3.Tag = null;
                m_pictureBox3Click = false;
            }
        }

        private void button1_Click_1(object sender, EventArgs e)
        {
            ChoseCamera_Form showChoseCamera = new ChoseCamera_Form();
            showChoseCamera.StartPosition = FormStartPosition.CenterScreen;
            showChoseCamera.Owner = this;
            ///   showChoseCamera.SetLPRHandle(lprHandle);
            showChoseCamera.ShowDialog();
        }

        private void pictureBox1_Click_1(object sender, EventArgs e)
        {

        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void SimilaritySetting_Click(object sender, EventArgs e)
        {
            if (!CheckCamera())
            {
                MessageBox.Show("请先添加相机");
                return;
            }
            similarity_setting_Form showsimilarity = new similarity_setting_Form();
            showsimilarity.StartPosition = FormStartPosition.CenterScreen;
        //    showsimilarity.Owner = this;
            ///   showChoseCamera.SetLPRHandle(lprHandle);
            showsimilarity.ShowDialog();
            
       
        }

        private void repetition_Click(object sender, EventArgs e)
        {
            if (!CheckCamera())
            {
                MessageBox.Show("请先添加相机");
                return;
            }
            Repetition_Form ShowRepetition = new Repetition_Form();
            ShowRepetition.StartPosition = FormStartPosition.CenterScreen;
            //    showsimilarity.Owner = this;
            ///   showChoseCamera.SetLPRHandle(lprHandle);
            ShowRepetition.ShowDialog();
        }

        private void LightSetting_Click(object sender, EventArgs e)
        {
            if (!CheckCamera())
            {
                MessageBox.Show("请先添加相机");
                return;
            }
            light_setting_Form light_setting = new light_setting_Form();
            light_setting.StartPosition = FormStartPosition.CenterScreen;
            //    showsimilarity.Owner = this;
            ///   showChoseCamera.SetLPRHandle(lprHandle);
            light_setting.ShowDialog();
        }

        private void TagSetting_Click(object sender, EventArgs e)
        {
            if (!CheckCamera())
            {
                MessageBox.Show("请先添加相机");
                return;
            }
            tag_Form tagset = new tag_Form();
            tagset.StartPosition = FormStartPosition.CenterScreen;
            //    showsimilarity.Owner = this;
            ///   showChoseCamera.SetLPRHandle(lprHandle);
            tagset.ShowDialog();
        }

        private void timesetting_Click(object sender, EventArgs e)
        {
            if (!CheckCamera())
            {
                MessageBox.Show("请先添加相机");
                return;
            }
            time_setting_Form tagset = new time_setting_Form();
            tagset.StartPosition = FormStartPosition.CenterScreen;
         
            tagset.ShowDialog();
        }

        private void button3_Click_1(object sender, EventArgs e)
        {
            if (!CheckCamera())
            {
                MessageBox.Show("请先添加相机");
                return;
            }
            Uploading_Form Form = new Uploading_Form();
            Form.StartPosition = FormStartPosition.CenterScreen;

            Form.ShowDialog();
        }

        private void WG_Click(object sender, EventArgs e)
        {
            if (!CheckCamera())
            {
                MessageBox.Show("请先添加相机");
                return;
            }
            wg_Form Form = new wg_Form();
            Form.StartPosition = FormStartPosition.CenterScreen;

            Form.ShowDialog();
        }

        private void NetSetting_Click(object sender, EventArgs e)
        {
            if (!CheckCamera())
            {
                MessageBox.Show("请先添加相机");
                return;
            }
            NetSettings_Forms Form = new NetSettings_Forms();
            Form.StartPosition = FormStartPosition.CenterScreen;
            Form.ShowDialog();
        }

        private void SystemUpgrade_Click(object sender, EventArgs e)
        {
            //if (!CheckCamera())
            //{
            //    MessageBox.Show("请先添加相机");
            //    return;
            //}
            dialog_Form Form = new dialog_Form();
            Form.StartPosition = FormStartPosition.CenterScreen;
            Form.ShowDialog();
        }

        private void SerialPortSettings_Click(object sender, EventArgs e)
        {
            if (!CheckCamera())
            {
                MessageBox.Show("请先添加相机");
                return;
            }
            串口设置 Form = new 串口设置();
            Form.StartPosition = FormStartPosition.CenterScreen;
            Form.ShowDialog();
        }

        private void identifiedimf_MouseClick(object sender, MouseEventArgs e)
        {
            if (this.identifiedimf.FocusedItem != null)
            {//这个if必须的，不然会得到值但会报错
                string showtime = this.identifiedimf.FocusedItem.SubItems[2].Text;//获得的listView的值显示在文本框里SubItems[i]第i列
                string filename = m_save_path + "\\identified\\" + showtime + ".jpg";
                bool succ;
                Bitmap identified = apidata.ReadImageFile(filename, out succ);
                CapturedImage.Image = identified;
                filename = m_save_path + "\\mode\\" + showtime + ".jpg";
                Bitmap modeimg = apidata.ReadImageFile(filename, out succ);
                this.modeImage.Image = modeimg;
                if (!succ) MessageBox.Show("未能读取到图片,请检查图片保存路径是否已更改");
            }
        }

        private void unidentifiedImf_MouseClick(object sender, MouseEventArgs e)
        {
            if (this.unidentifiedImf.FocusedItem != null)
            {
                string showtime = this.unidentifiedImf.FocusedItem.SubItems[0].Text;//获得的listView的值显示在文本框里SubItems[i]第i列
                string filename = m_save_path + "\\unidentified\\" + showtime + ".jpg";
                bool succ;
                Bitmap unidentified = apidata.ReadImageFile(filename, out succ);
                this.CapturedImage.Image = unidentified;
                this.modeImage.Image = null;
                if (!succ) MessageBox.Show("未能读取到图片,请检查图片保存路径是否已更改");
            }
        }


        //private delegate void ShowResultPicThread();
        ////触发结果显示
        //public void ShowPicResult(string path)
        //{
        //    ShowResultPicThread picDelegate = delegate()
        //    {
        //        pictureBox3.Image = Image.FromFile(path);
        //    };
        //    pictureBox3.Invoke(picDelegate);
        //}
        //public void SetPicPath(string picpath)
        //{
        //    ShowPicResult(picpath);
        //}

    }
}

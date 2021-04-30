using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace FaceRecognitioDemo
{
    public partial class AddFaceForm : Form
    {
        private string m_flie_name;
        private string m_personname;
        private string m_personid;

        private libFaceRecognitionSDK.FaceFlags m_face;
         private libFaceRecognitionSDK.FaceImage m_img;
        public AddFaceForm()
        {
            InitializeComponent();
        }

        private void AddFaceForm_Load(object sender, EventArgs e)
        {

        }

        private void button3_Click(object sender, EventArgs e)
        {

        }

        private void groupBox1_Enter(object sender, EventArgs e)
        {

        }

        public static Bitmap ReadImageFile(string path)
        {
            FileStream fs = File.OpenRead(path); //OpenRead
            int filelength = 0;
            filelength = (int)fs.Length; //获得文件长度 
            Byte[] image = new Byte[filelength]; //建立一个字节数组 
            fs.Read(image, 0, filelength); //按字节流读取 
            System.Drawing.Image result = System.Drawing.Image.FromStream(fs);
            fs.Close();
            Bitmap bit = new Bitmap(result);
            return bit;
        }

        private void button4_Click(object sender, EventArgs e)
        {
            OpenFileDialog file = new OpenFileDialog();
            file.ShowDialog();
          //  m_flie_name = file.SafeFileName;
            m_flie_name = file.FileName;
            Console.WriteLine(m_flie_name);
            textBox3.Text = m_flie_name;
        }




        private void button1_Click(object sender, EventArgs e)
        {
            IntPtr cam = apidata.getcamera();
           if ((m_personid == null || m_personid.Length == 0) ||
               ( m_personname == null || m_personname.Length==0))
           {MessageBox.Show("请输入完整信息");
           return;}
           m_face.faceID =m_personid;
          // m_face.faceName =apidata.GB2312ToUTF8(m_personname);
         //  m_face.faceName= System.Text.Encoding.UTF8.GetBytes(m_personname);
        //    Bitmap b = ReadImageFile(m_flie_name);  //读取图片

           byte[] byName = System.Text.Encoding.UTF8.GetBytes(m_personname);
           m_face.faceName = new byte[32];
           byName.CopyTo(m_face.faceName,0);
            FileStream fs = File.OpenRead(m_flie_name); //OpenRead
            int filelength = 0;
            filelength = (int)fs.Length; //获得文件长度 
            Byte[] image = new Byte[filelength]; //建立一个字节数组 
            fs.Read(image, 0, filelength); //按字节流读取 
            fs.Close();

            IntPtr buffer = Marshal.AllocHGlobal(image.Length);
      
            try
            {
                Marshal.Copy(image, 0, buffer, image.Length);
              
                m_img.img = buffer;
                m_img.img_fmt = 0;
                m_img.img_len = filelength;
                int k = libFaceRecognitionSDK.ZBX_AddJpgFaces(cam, ref m_face,
                                        ref m_img, 1, 0);
               
                if (k == 0)
                {
                    MessageBox.Show("添加成功"); }
                else { 
                    MessageBox.Show("添加失败"); }
            }catch(Exception err){
                MessageBox.Show(err.ToString());
            }
            finally
            {
                Marshal.FreeHGlobal(buffer);
            }
            //GCHandle hObject = GCHandle.Alloc(image, GCHandleType.Pinned);
            //IntPtr pObject = hObject.AddrOfPinnedObject();
          
        }

        private void textBox3_TextChanged(object sender, EventArgs e)
        {
            m_flie_name = textBox3.Text;
        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {
            m_personname = textBox2.Text;
        }

        private void groupBox2_Enter(object sender, EventArgs e)
        {

        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {
            m_personid= textBox1.Text;
        }
    }
}


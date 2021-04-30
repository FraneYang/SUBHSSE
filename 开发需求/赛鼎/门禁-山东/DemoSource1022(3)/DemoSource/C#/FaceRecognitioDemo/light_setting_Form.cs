using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace FaceRecognitioDemo
{
    public partial class light_setting_Form : Form
    {
        public light_setting_Form()
        {
            InitializeComponent();
        }
          [System.Runtime.InteropServices.StructLayoutAttribute(System.Runtime.InteropServices.LayoutKind.Sequential)]
        public struct Level1
        {
          
               [MarshalAsAttribute(UnmanagedType.ByValTStr, SizeConst = 10)]
              public char[] Level;
               [MarshalAsAttribute(UnmanagedType.ByValTStr, SizeConst = 10)]
          public  string led_mode;
        }

        private void getting_Click(object sender, EventArgs e)
        {

            byte[] led_level = new byte[10];
            int ret = libFaceRecognitionSDK.ZBX_GetLedLevel(apidata.getcamera(), led_level);
            textBox1.Text = apidata.GetDefaultString(led_level);
            //IntPtr level = IntPtr.Zero;
            IntPtr led_mode = IntPtr.Zero;
            //int ret = libFaceRecognitionSDK.ZBX_GetLedLevel(apidata.getcamera(),  ref led_mode);
            //textBox1.Text = ((int)led_mode).ToString();
            //string c = Marshal.PtrToStringAnsi(led_mode);
            //textBox1.Text = apidata.UTF8ToGB2312(c);
          
            int retModel = libFaceRecognitionSDK.ZBX_GetLedMode(apidata.getcamera(), ref led_mode);
            textBox2.Text = ((char)led_mode).ToString();
            if ((ret == 0) && (retModel == 0))
            {
                return; 
            }
            else
            {
                MessageBox.Show("获取信息失败");
            }
        }

        private void setting_Click(object sender, EventArgs e)
        {
            if( (textBox1.Text == null || textBox1.Text.Length == 0) || (textBox2.Text == null || textBox2.Text.Length == 0))
                {
                    MessageBox.Show("请输入值"); return;
                }
            try { int.Parse(textBox1.Text); int.Parse(textBox2.Text); }
            catch { MessageBox.Show("输入无效"); }
            int Level = int.Parse(textBox1.Text);
            int led_mode = int.Parse(textBox2.Text);
            if (0 < Level && Level > 100)
            {
                MessageBox.Show("请输入0~100"); return;
            }
            int nRet = libFaceRecognitionSDK.ZBX_SetLedLevel(apidata.getcamera(), (char)Level);
            if (0 <= led_mode && led_mode > 3)
            {
                MessageBox.Show("请输入正确的模式 应为1~3");
                return;
            }
            int nRetModel = libFaceRecognitionSDK.ZBX_SetLedMode(apidata.getcamera(), (char)led_mode);
            if (nRetModel == 0) 
            {
                MessageBox.Show("设置成功");
            }
            else { MessageBox.Show("设置失败"); }

        }

        private void light_setting_Form_Load(object sender, EventArgs e)
        {
            getting_Click(sender, e);
        }
    }
}

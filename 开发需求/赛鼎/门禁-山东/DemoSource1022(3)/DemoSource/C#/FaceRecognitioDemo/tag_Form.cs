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
    public partial class tag_Form : Form
    {
        public tag_Form()
        {
            InitializeComponent();
        }
      //  private string title;

        private void SettingTag_Click(object sender, EventArgs e)
        {
            TagTitle Title1;
         //   Title1.Title = textBox1.Text;

          //  Title1.Title =apidata. GB2312ToUTF8(Title1.Title);
            byte[] byteArray = System.Text.Encoding.UTF8.GetBytes((textBox1.Text));
            int iRet = libFaceRecognitionSDK.ZBX_SetScreenOsdTitle(apidata.getcamera(), byteArray);
            if (iRet == 0)
            {
                MessageBox.Show("设置成功");
            }
            else { MessageBox.Show("设置失败"); }
        }

        [System.Runtime.InteropServices.StructLayoutAttribute(System.Runtime.InteropServices.LayoutKind.Sequential)]
        //系统网络信息
        public struct TagTitle
        {
            [MarshalAsAttribute(UnmanagedType.ByValTStr, SizeConst = 256)]
            public byte[] Title;  //网卡物理地址
        };

        private void GettingTag_Click(object sender, EventArgs e)
        {

            byte[] tt = new byte[100];
            int iRet = libFaceRecognitionSDK.ZBX_GetScreenOsdTitle(apidata.getcamera(),    tt);
            textBox1.Text = apidata.GetDefaultString(tt);

            if (iRet != 0)
            {
                MessageBox.Show("获取标题失败");
            }
            else { MessageBox.Show("获取标题成功"); }
        }

        private void tag_Form_Load(object sender, EventArgs e)
        {
            byte[] tt = new byte[100];
            int iRet = libFaceRecognitionSDK.ZBX_GetScreenOsdTitle(apidata.getcamera(), tt);
            textBox1.Text = apidata.GetDefaultString(tt);
        }
    }
}

using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace FaceRecognitioDemo
{
    public partial class Repetition_Form : Form
    {
        public Repetition_Form()
        {
            InitializeComponent();
        }

        private void GetValue_Click(object sender, EventArgs e)
        {
            UIntPtr nTime=UIntPtr.Zero;
            int reback = libFaceRecognitionSDK.ZBX_GetClusterTimesInterval(
                apidata.getcamera(),ref  nTime);
            if (reback == 0)
            {
                textBox1.Text = ((uint)nTime).ToString();
              //  MessageBox.Show("获取成功"); 
            }
            else
                MessageBox.Show("获取失败"); 
        }

        private void SaveValue_Click(object sender, EventArgs e)
        {
            if ((textBox1.Text == null || textBox1.Text.Length == 0))
            {
                MessageBox.Show("请输入值"); return;
            }
            try { int.Parse(textBox1.Text);  }
            catch { MessageBox.Show("输入无效"); }
            int Interval = int.Parse(textBox1.Text);
            if (Interval <= 0) { MessageBox.Show("输入无效"); return ; }
            if (0 == libFaceRecognitionSDK.ZBX_SetClusterTimesInterval(apidata.getcamera(), (uint)Interval))
                MessageBox.Show("设置成功");
            else MessageBox.Show("设置失败");
        }

        private void Repetition_Form_Load(object sender, EventArgs e)
        {
            GetValue_Click(sender, e);
    
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }
    }
}

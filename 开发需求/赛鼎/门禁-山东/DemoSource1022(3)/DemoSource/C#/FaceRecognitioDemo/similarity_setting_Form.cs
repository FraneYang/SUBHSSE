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
    public partial class similarity_setting_Form : Form
    {
        public similarity_setting_Form()
        {
            InitializeComponent();
         
        }

        private void getsimilarity_Click(object sender, EventArgs e)
        {
           IntPtr nScore=IntPtr.Zero;
           int nRet = libFaceRecognitionSDK.ZBX_GetMatchScore(apidata.getcamera(), ref nScore);
           if (nRet==0)
           {
               this.textBox1.Text = ((int)nScore).ToString();
              // MessageBox.Show ("获取成功");
           }
           else
           {
               MessageBox.Show("获取失败");
           }
        }

        private void SetSimilarity_Click(object sender, EventArgs e)
        {
            if ((textBox1.Text == null || textBox1.Text.Length == 0) )
            {
                MessageBox.Show("请输入值"); return;
            }
            try { int.Parse(textBox1.Text); }
            catch { MessageBox.Show("输入无效"); }
            int nScore = int.Parse(this.textBox1.Text);
            if ( nScore<0 || nScore > 100)
            {
                MessageBox.Show("请输入正确的相似度 应为0~100");
                return;
            }
            int nRet = libFaceRecognitionSDK.ZBX_SetMatchScore(
                apidata.getcamera(),  nScore);
            if (nRet == 0)
            {
                MessageBox.Show("设置成功");
            }
            else MessageBox.Show("设置失败");
        }

        private void similarity_setting_Form_Load(object sender, EventArgs e)
        {
            getsimilarity_Click(sender, e);
 
        }
    }
}

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
    public partial class Uploading_Form : Form
    {
        public Uploading_Form()
        {
            InitializeComponent();
            
        }
        

        private  char m_bInit;

        private void Uploading_Form_Load(object sender, EventArgs e)
        {

        }

        private void radioButton2_CheckedChanged(object sender, EventArgs e)
        {
            m_bInit = (char)0;
        }

        private void radioButton1_CheckedChanged(object sender, EventArgs e)
        {
            m_bInit = (char)1;
        }

        private void save_Click(object sender, EventArgs e)
        {
            int nRet = libFaceRecognitionSDK. ZBX_SetPushMode(apidata.getcamera(), (char)m_bInit);
            if (nRet == 0)
            {
                MessageBox.Show("设置成功");
            }
            else
            {
                MessageBox.Show("设置失败");
            }
        }
    }
}

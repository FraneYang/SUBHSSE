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
    public partial class wg_Form : Form
    {
        public wg_Form()
        {
            InitializeComponent();
            for (int i = 0; i < 5; i++)
            {

                comboBox1.Items.Add(i );

            }

        }

        private void wg_Form_Load(object sender, EventArgs e)
        {
            IntPtr nType = IntPtr.Zero;
            int nRet = libFaceRecognitionSDK.ZBX_GetWiegandType(apidata.getcamera(), ref nType);
            if (nRet == 0) comboBox1.SelectedIndex = (int)nType;
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {
            int type=comboBox1.SelectedIndex;
            int nRet = libFaceRecognitionSDK.ZBX_SetWiegandType(apidata.getcamera(), type);
            if (nRet == 0)
            {
                MessageBox.Show("设置成功");
            }
            else
            {
                MessageBox.Show("设置失败");
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            IntPtr nType = IntPtr.Zero;
            int nRet = libFaceRecognitionSDK.ZBX_GetWiegandType(apidata.getcamera(), ref nType);
            if (nRet == 0)
            {
                comboBox1.SelectedIndex=(int)nType;
                MessageBox.Show("获取成功");
            }
            else
            {
                MessageBox.Show("获取失败");
            }
        }
    }
}

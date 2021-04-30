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
    public partial class time_setting_Form : Form
    {
        public time_setting_Form()
        {
            InitializeComponent();

            IntPtr nTime=IntPtr.Zero;
            int ret = libFaceRecognitionSDK.ZBX_GetSysTime(apidata.getcamera(), ref nTime);
            DateTime dt1970 = new DateTime(1970, 1, 1, 0, 0, 0, 0);
            long t = 10000000;
            t = dt1970.Ticks + (int)nTime * t;
            DateTime camedata=  new DateTime(t);
            string dataday = camedata.ToString("d");
            string temp = camedata.ToString("T");
	if (ret == 0)
	{
        dateTimePicker1.Value = camedata;
        starttimehour.Value = camedata;
	}
        }

        private void time_setting_Form_Load(object sender, EventArgs e)
        {

        }

        private void dateTimePicker1_ValueChanged(object sender, EventArgs e)
        {
         //   dateTimePicker1.Value=
        }

        private void GetTime_Click(object sender, EventArgs e)
        {
            IntPtr nTime = IntPtr.Zero;
            int ret = libFaceRecognitionSDK.ZBX_GetSysTime(apidata.getcamera(), ref nTime);
            DateTime dt1970 = new DateTime(1970, 1, 1, 8, 0, 0, 0);
            long t = 10000000;
            t = dt1970.Ticks + (int)nTime * t;
            DateTime camedata = new DateTime(t);
         //   string dataday = camedata.ToString("d");
        //    string temp = camedata.ToString("T");
            if (ret == 0)
            {
              
                starttimehour.Value = camedata;
                dateTimePicker1.Value = camedata;
                MessageBox.Show("获取成功");
            }
            else
            { MessageBox.Show("获取失败"); }
        }

        private void SetTime_Click(object sender, EventArgs e)
        {
            DateTime camedata = dateTimePicker1.Value;
            DateTime camedata1 = starttimehour.Value;
        // camedata=   camedata.AddHours((int)(-camedata.Hour + camedata1.Hour));
        // camedata=   camedata.AddMinutes((int)(-camedata.Minute + camedata1.Minute));
        //camedata=    camedata.AddSeconds((int)(-camedata.Second + camedata1.Second));
        int ret = libFaceRecognitionSDK.ZBX_SetSysTimeEx(apidata.getcamera(),
           camedata.Year, camedata.Month, camedata.Day, camedata1.Hour, camedata1.Minute, camedata1.Second);
        if (ret == 0)
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

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
         

    public partial class 串口设置 : Form
    {
        private Dictionary<int, int> m_BaudRateMap = new Dictionary<int, int>();
 
 
      private  int m_BaudRate;
            private  int m_parity ;
            private  int m_databit ;
            private  int m_stopbit ;

        public 串口设置()
        {

            InitializeComponent();
            m_BaudRateMap[0] = 1200;
            m_BaudRateMap[1] = 2400;
            m_BaudRateMap[2] = 4800;
            m_BaudRateMap[3] = 9600;
            m_BaudRateMap[4] = 14400;
            m_BaudRateMap[5] = 19200;
            m_BaudRateMap[6] = 38400;
            m_BaudRateMap[7] = 56000;
            m_BaudRateMap[8] = 57600;
            m_BaudRateMap[9] = 115200;
            m_BaudRateMap[10] = 128000;
            m_BaudRateMap[11] = 256000;

             m_BaudRate = 1200;
            m_parity = 0;
            m_databit =5;
             m_stopbit =1;
            for (int i = 0; i < 12; ++i) 
            {
                comboBox1.Items.Add(m_BaudRateMap[i]);
            }
            for(int i=0;i<4;++i)
            {
                 comboBox2.Items.Add(i);
            }
                    for(int i=0;i<4;++i)
            {
                 comboBox3.Items.Add(i+5);
            }
                    for(int i=0;i<2;++i)
            {
                 comboBox4.Items.Add(i+1);
            }
        }

        private void Serial_port_Settings_Form_Load(object sender, EventArgs e)
        {
            IntPtr rs485_protocal_no = IntPtr.Zero;
            libFaceRecognitionSDK.ZBX_GetRS485ProtocalNo(apidata.getcamera(),
                ref rs485_protocal_no);
            textBox6.Text = ((int)rs485_protocal_no).ToString();
            IntPtr baudrate = IntPtr.Zero;
            IntPtr parity = IntPtr.Zero;
            IntPtr databit = IntPtr.Zero;
            IntPtr stopbit = IntPtr.Zero;
            IntPtr BaudRate = IntPtr.Zero;

            int tag = libFaceRecognitionSDK.ZBX_GetTSerial(apidata.getcamera(),
                0, ref baudrate, ref parity,
                ref  databit, ref stopbit);
            if (tag == 0)
            {
                m_BaudRate = (int)baudrate;
                m_parity = (int)parity;
                m_databit = (int)databit;
                m_stopbit = (int)stopbit;
                comboBox1.SelectedIndex = findMapkey(m_BaudRateMap, m_BaudRate);// m_BaudRateMap.ElementAt(k => k.Value == m_BaudRate).Key;
                comboBox2.SelectedIndex = m_parity;
                comboBox3.SelectedIndex = m_databit - 5;
                comboBox4.SelectedIndex = m_stopbit - 1;
            }
        }

        private int  findMapkey(Dictionary<int, int> m_BaudRateMap,int value)
        {
            for (int i = 0; i < m_BaudRateMap.Count; ++i) 
            {
               if( m_BaudRateMap[i]==value)return i;
            }
            return 0;
        }

        private void setting_Click(object sender, EventArgs e)
        {
           

            if (apidata.stringIsEmpty(textBox1.Text)) { MessageBox.Show("串口号为空");return ;}
             if (apidata.stringIsEmpty(textBox6.Text)) { MessageBox.Show("协议为空");return ; }
    
     //  int t= comboBox1.Items.
          //  if (apidata.stringIsEmpty(textBox2.Text)) { MessageBox.Show("波特率为空"); }
         //   int.Parse
             int temp = int.Parse(textBox1.Text);
            int tag = libFaceRecognitionSDK.ZBX_OpenTSerial(apidata.getcamera(),
                temp, m_BaudRate, m_parity,
                m_databit, m_stopbit );
            if (tag == 0)
            {
                MessageBox.Show("设置串口成功");
            }
            else { MessageBox.Show("设置串口失败"); }
            SettingProtocol_Click(sender, e);
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            m_BaudRate = m_BaudRateMap[comboBox1.SelectedIndex]; 
        }

        private void comboBox3_SelectedIndexChanged(object sender, EventArgs e)
        {
            m_databit = comboBox3.SelectedIndex + 5;
        }

        private void comboBox4_SelectedIndexChanged(object sender, EventArgs e)
        {
            m_stopbit = comboBox4.SelectedIndex+1;
        }

        private void comboBox2_SelectedIndexChanged(object sender, EventArgs e)
        {
            m_parity = comboBox2.SelectedIndex ;
        }

        private void gettingparam_Click(object sender, EventArgs e)
        {
             IntPtr rs485_protocal_no=IntPtr.Zero;
             libFaceRecognitionSDK.ZBX_GetRS485ProtocalNo(apidata.getcamera(),
                 ref rs485_protocal_no);
             textBox6.Text = ((int)rs485_protocal_no).ToString();
            IntPtr baudrate = IntPtr.Zero;
            IntPtr parity = IntPtr.Zero;
            IntPtr databit = IntPtr.Zero;
             IntPtr stopbit = IntPtr.Zero;
            IntPtr BaudRate = IntPtr.Zero;
        
            int tag = libFaceRecognitionSDK.ZBX_GetTSerial(apidata.getcamera(),
                0, ref baudrate, ref parity,
                ref  databit,ref stopbit);
            if (tag == 0)
            {
                m_BaudRate = (int)baudrate;
                m_parity =  (int)parity;
                m_databit = (int)databit;
                m_stopbit = (int)stopbit;
                comboBox1.SelectedIndex = findMapkey(m_BaudRateMap, m_BaudRate);// m_BaudRateMap.ElementAt(m_BaudRate).Key;
                comboBox2.SelectedIndex = m_parity;
                comboBox3.SelectedIndex = m_databit-5;
                comboBox4.SelectedIndex = m_stopbit-1;
                MessageBox.Show("获取成功");
            }
            else  MessageBox.Show("获取失败");
        }

        private void SettingProtocol_Click(object sender, EventArgs e)
        {
            if (apidata.stringIsEmpty(textBox6.Text)) { MessageBox.Show("协议为空"); return; }
            if (libFaceRecognitionSDK.ZBX_SetRS485ProtocalNo(apidata.getcamera(),
              (char)int.Parse(textBox6.Text)) == 0)
            {
                MessageBox.Show("设置串口协议成功");
            }
            else MessageBox.Show("设置串口协议失败");
        }

        private void SendData_Click(object sender, EventArgs e)
        {
              if (apidata.stringIsEmpty(textBox6.Text)) { MessageBox.Show("协议为空"); return; }
                 byte[] tempBuffer = System.Text.Encoding.UTF8.GetBytes(textBox7.Text);//string转UTF8 byte[]
                 int len=    apidata.getValidLength(tempBuffer);
                int tag= libFaceRecognitionSDK.ZBX_WriteTSerial(apidata.getcamera(), int.Parse(textBox6.Text),
                    tempBuffer, len);
                if (tag == 0)  MessageBox.Show("执行成功"); 
                else MessageBox.Show("执行失败");
        }
    }
}

using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Sockets;
using System.Text;
using System.Threading.Tasks;

namespace FaceRecognitioDemo
{
    class apidata
    {
        public static string m_cameraIp;
        private static IntPtr m_cam;

        public static bool stringIsEmpty(string s)
        {
            return s == null || s.Length == 0;
        }


        [System.Runtime.InteropServices.StructLayoutAttribute(System.Runtime.InteropServices.LayoutKind.Sequential)]
        public struct FaceReco
        {
            public string personname;
            public string personid;
            public string time;
            public string saveimage_path;
            public Image faceimage;
            public int faceimagelen;
            public Image modelFaceImg;
            public int modelFaceImglen;
        }

        [System.Runtime.InteropServices.StructLayoutAttribute(System.Runtime.InteropServices.LayoutKind.Sequential)]
        public struct Faceimf
        {
            public string personname;
            public string personid;
            public string wgCardNO;
            public IntPtr imgBuff;
            public Image img;

        }
        public static void setcamera(IntPtr cam) { m_cam = cam; }
        public static IntPtr getcamera() { return m_cam; }
        public static void setcameraip(string ip) { m_cameraIp = ip; }
        public static string getcameraip() { return m_cameraIp; }
        public static string GetLocalIp()
        {
           // string AddressIP = string.Empty;
               string HostName = Dns.GetHostName(); //得到主机名
                IPHostEntry IpEntry = Dns.GetHostEntry(HostName);
                for (int i = 0; i < IpEntry.AddressList.Length; i++)
                {
                    //从IP地址列表中筛选出IPv4类型的IP地址
                    //AddressFamily.InterNetwork表示此IP为IPv4,
                    //AddressFamily.InterNetworkV6表示此地址为IPv6类型
                    if (IpEntry.AddressList[i].AddressFamily == AddressFamily.InterNetwork)
                    {
                  //      AddressIP = IpEntry.AddressList[i].ToString();
                        return IpEntry.AddressList[i].ToString();
                    }
                }
                return null;
            ///获取本地的IP地址
        }
     

        public  static string UTF8ToGB2312(string str)
        {
            System.Text.Encoding utf8, gb2312;
            //utf8   
            utf8 = System.Text.Encoding.GetEncoding("utf-8");
            //gb2312   
            gb2312 = System.Text.Encoding.GetEncoding("gb2312");
            byte[] utf;
            utf = utf8.GetBytes(str);
            utf = System.Text.Encoding.Convert(utf8, gb2312, utf);
            //返回转换后的字符   
            return gb2312.GetString(utf);
        }

         public static  string GB2312ToUTF8(string str)
         {
             //声明字符集   
             System.Text.Encoding utf8, gb2312;
             //gb2312   
             gb2312 = System.Text.Encoding.GetEncoding("gb2312");
             //utf8   
             utf8 = System.Text.Encoding.GetEncoding("utf-8");
             byte[] gb;
             gb = gb2312.GetBytes(str);
             gb = System.Text.Encoding.Convert(gb2312, utf8, gb);
             //返回转换后的字符   
             return utf8.GetString(gb);
        }


         //UTF8 byte[] 转string
        public static string GetDefaultString(byte[] utf8String)
        {
            utf8String = Encoding.Convert(Encoding.GetEncoding("UTF-8"), Encoding.Unicode, utf8String);
            string strUnicode = Encoding.Unicode.GetString(utf8String);
            strUnicode = strUnicode.Substring(0, strUnicode.IndexOf('\0'));
            return strUnicode; 
        }
        public static void GetUTF8Buffer(string inputString, int bufferLen, out byte[] utf8Buffer)
        {
            utf8Buffer = new byte[bufferLen];
            byte[] tempBuffer = System.Text.Encoding.UTF8.GetBytes(inputString);//string转UTF8 byte[]
            for (int i = 0; i < tempBuffer.Length; ++i)
            {
                utf8Buffer[i] = tempBuffer[i];
            }
        }

        /**
 * 获取byte的实际长度
 * @param bytes
 * @return
 */
public static  int getValidLength(byte[] bytes){
    int i = 0;
    if (null == bytes || 0 == bytes.Length)
        return i ;
    for (; i < bytes.Length; i++)
    {
        if (bytes[i] == '\0')
            break;
    }
    return i + 1;
}


        public static bool CheckCamera()
        {
            return libFaceRecognitionSDK.ZBX_Connected(apidata.getcamera()) == 1;
            // return m_bConnect;
        }

        //ip地址是否合法，
        public static bool IsLegal_Ip(string ipaddr)
        {
            int len = ipaddr.Length;//计算字符串的长度
            int stage = 0;//该IP地址共有几部分
            int stage_value = 0;//每个部分的值
            int is_stage = 0;//判断当前部分是否有值

            //if (isalpha(ipaddr[0]))//===》if(ipaddr[i]>='a'&&ipaddr[i]<='z'&&ipaddr[i]>='A'&&ipaddr[i]<='Z')
            //    return false;

            for (int i = 0; i < len; ++i)
            {
                if (ipaddr[i] >= '0' && ipaddr[i] <= '9')
                {
                    stage_value = stage_value * 10 + (ipaddr[i] - '0');
                    ++is_stage;
                }
                else if (ipaddr[i] == '.')
                {
                    if (stage_value <= 255 && is_stage > 0)
                        ++stage;
                    else
                        return false;

                    //进行下一轮判断,重新置为0
                    is_stage = 0;
                    stage_value = 0;
                }
                else//判断有负数的情况
                    return false;
            }

            //判断第四部分是否满足IP地址的要求
            if (stage_value <= 255 && is_stage > 0)
                ++stage;

            if (stage == 4)
                return true;
            else
                return false;
        }

        //读取图片返回图片及是否成功
        public static Bitmap ReadImageFile(string path,out bool succ)
        {
            succ = false;
            FileStream fs = File.OpenRead(path); //OpenRead
            int filelength = 0;
            filelength = (int)fs.Length; //获得文件长度 
            if (filelength == 0) return null;
            Byte[] image = new Byte[filelength]; //建立一个字节数组 
            fs.Read(image, 0, filelength); //按字节流读取 
            System.Drawing.Image result = System.Drawing.Image.FromStream(fs);
            fs.Close();
            Bitmap bit = new Bitmap(result);
            succ = true;
            return bit;
        }

    
    }
}

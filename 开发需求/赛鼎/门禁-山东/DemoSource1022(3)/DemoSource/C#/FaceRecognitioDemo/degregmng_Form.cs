using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Threading;
using System.Runtime.InteropServices;
using System.IO;

namespace FaceRecognitioDemo
{
    public partial class degregmng_Form : Form
    {
        private SynchronizationContext m_SyncContext = null;
        private int m_all_num_personid;
        Dictionary<string, Image> m_pictureMap = new Dictionary<string, Image>();
      //  Dictionary<string, int> m_picturesizeMap = new Dictionary<string, int>();

        private int m_num;//查询每页条数；
        private int m_idxpage;//当前查询页码
        private int m_tnum;
        public degregmng_Form()
        {
            InitializeComponent();
            m_SyncContext = SynchronizationContext.Current;
            m_all_num_personid = libFaceRecognitionSDK.ZBX_GetFaceIDTotal(apidata.getcamera());
            m_deleteall = false;
            m_idxpage = 1;
            m_num = 10;

             m_tnum = m_all_num_personid / m_num;
            if (m_all_num_personid % m_num == 0)
                m_tnum++;

        }

        private apidata.Faceimf imforamtion_person;
        private void FaceQueryCb_t_call(IntPtr cam,
                         ref libFaceRecognitionSDK.QueryFaceInfo faceQueryInfo,
                                        IntPtr usrParam)
        {
            //   this.showPersonImf.BeginUpdate();   //数据更新，UI暂时挂起，直到EndUpdate绘制控件，可以有效避免闪烁并大大提高加载速度
            {
                try
                {
                    if (faceQueryInfo.personName != null && faceQueryInfo.personName.Length > 0)
                    {
                        imforamtion_person.personname = apidata.GetDefaultString(faceQueryInfo.personName);
                    }
                    imforamtion_person.personid = faceQueryInfo.personID;
                    imforamtion_person.wgCardNO = (faceQueryInfo.wgCardNO.ToString());


                    byte[] imgtemp = new byte[faceQueryInfo.imgSize[0]];
                    Marshal.Copy(faceQueryInfo.imgBuff[0], imgtemp, 0, faceQueryInfo.imgSize[0]);
                    MemoryStream ms = new MemoryStream(imgtemp, 0, imgtemp.Length);
                    //设置图片
                 //   m_pictureMap[imforamtion_person.personid] = Image.FromStream(ms);
                    imforamtion_person.img = Image.FromStream(ms); 
                    
                    // faceQueryInfo.imgBuff[0];
                    //   byte[] byData = new byte[imagelen];
                    //  Marshal.Copy(imageIntPtr, byData, 0, imagelen);
                    //根据路径转换为Byte[]数组
                    // byte[] imgBytes = GetImageByPath(filePath);
                }
                catch (Exception ex)
                {
                    m_SyncContext.Post(seterrorImf, ex.ToString()); return;
                }
                // m_picturesizeMap[imforamtion_person.personid] = faceQueryInfo.imgSize[0];
                m_SyncContext.Post(setshowPersonImf, imforamtion_person);

            }
            //   this.showPersonImf.EndUpdate();
        }

        public void seterrorImf(object error)
        {
            MessageBox.Show(error.ToString());
        }

        private libFaceRecognitionSDK.ZBX_FaceQueryCb_t FaceQueryCb_t = null;//回调指针

        private IntPtr m_gThis;
        private void button1_Click(object sender, EventArgs e)
        {
            this.showPersonImf.Items.Clear();  //只移除所有的项。
           // m_picturesizeMap.Clear();
            m_pictureMap.Clear();
            IntPtr cam = apidata.getcamera();
            int t11 = m_tnum;
            textBox1.Text = m_tnum.ToString();
       //     this.page.Text = m_idxpage.ToString();
            if (libFaceRecognitionSDK.ZBX_Connected(cam) != 0)
            //    IntPtr a = IntPtr.Zero;
            {
                char t = '0';
                FaceQueryCb_t = new libFaceRecognitionSDK.ZBX_FaceQueryCb_t(FaceQueryCb_t_call);
                libFaceRecognitionSDK.ZBX_RegFaceQueryCb(cam, FaceQueryCb_t, m_gThis);
                if (m_all_num_personid <= 0) { MessageBox.Show("无人员信息"); return; }
                //  libFaceRecognitionSDK.ZBX_QueryByRole(cam, -1, 1, m_all_num_personid, t, t);
                libFaceRecognitionSDK.ZBX_QueryByRole(cam, -1, m_idxpage, m_num, t, t);
            }
        }

        private void degregmng_Form_Load(object sender, EventArgs e)
        {
            //ImageList imgList = new ImageList();
            //imgList.ImageSize = new Size(1, 15);// 设置行高 20 //分别是宽和高
            //showPersonImf.SmallImageList = imgList; //这里设置listView的SmallImageList ,用imgList将其撑大


            this.showPersonImf.Columns.Add("姓名", 120);
            this.showPersonImf.Columns.Add("id", 120);
            this.showPersonImf.Columns.Add("韦根", 120);
            this.showPersonImf.GridLines = true;  //显示网格线
            this.showPersonImf.FullRowSelect = true;  //显示全行
            this.showPersonImf.MultiSelect = false;  //设置只能单选
            this.showPersonImf.View = View.Details;  //设置显示模式为详细
            //   Control.CheckForIllegalCrossThreadCalls = false;//多线程更新消息 不推荐
            button1_Click(sender, e);


        }
        private void setshowPersonImf(object messimf)
        {
            this.showPersonImf.BeginUpdate();

            apidata.Faceimf temp = (apidata.Faceimf)messimf;
            ListViewItem li = new ListViewItem();
            li.SubItems[0].Text = apidata.UTF8ToGB2312(temp.personname);
            li.SubItems.Add(temp.personid);
            li.SubItems.Add(temp.wgCardNO);
            showPersonImf.Items.Add(li);
            this.showPersonImf.EndUpdate();
            m_pictureMap[temp.personid] = temp.img;
        }

        private void showPersonImf_SelectedIndexChanged(object sender, EventArgs e)
        {

        }


        private void deletepeopleimfo_Click(object sender, EventArgs e)
        {
            if (this.showPersonImf.FocusedItem != null)//这个if必须的，不然会得到值但会报错
            {
                //MessageBox.Show(this.listView1.FocusedItem.SubItems[0].Text);
                string personid = this.showPersonImf.FocusedItem.SubItems[1].Text;//获得的listView的值显示在文本框里SubItems[i]第i列
                if (libFaceRecognitionSDK.ZBX_DeleteFaceDataByPersonID(apidata.getcamera(), personid) == 0)
                {
                    --m_all_num_personid;
                    m_tnum = m_all_num_personid / m_num;
                    if (m_all_num_personid % m_num == 0) m_tnum++;
                    textBox1.Text = m_tnum.ToString();
                    if (m_idxpage > m_tnum) 
                    { m_idxpage = m_tnum; this.page.Text = m_idxpage.ToString(); }
                    MessageBox.Show("删除的成功");
                    button1_Click(sender, e);
                }
                else MessageBox.Show("删除失败");

            }
            else { MessageBox.Show("请先选择要删除的人员"); return; }

        }

        private bool m_deleteall;
        public void succdeleteall(bool result) { m_deleteall = result; }
        private void deletepeopleimfo_all_Click(object sender, EventArgs e)
        {
            m_deleteall = false;
            Form2 suredelete = new Form2();
            suredelete.StartPosition = FormStartPosition.CenterScreen;
            suredelete.Owner = this;
            suredelete.ShowDialog();
            if (m_deleteall)
            {
                if (libFaceRecognitionSDK.ZBX_DeleteFaceDataAll(apidata.getcamera()) == 0)
                {
                    MessageBox.Show("删除成功");
                    m_all_num_personid = 0;

                    m_tnum = m_all_num_personid / m_num;
                    if (m_all_num_personid % m_num == 0) m_tnum++;
                    m_idxpage = 1;
                    textBox1.Text = m_tnum.ToString();
                }
                else MessageBox.Show("删除失败");
            }

        }


        private void previous_page_Click(object sender, EventArgs e)
        {
            if (int.Parse(this.page.Text) - 1 < 1 || m_tnum < int.Parse(this.page.Text) -1)
            { MessageBox.Show("已经是第一页了"); this.page.Text ="1"; return; }
            m_idxpage = int.Parse(this.page.Text) - 1;
            this.page.Text = m_idxpage.ToString();
            button1_Click(sender, e);
        }

        private void later_page_Click(object sender, EventArgs e)
        {
            if (m_tnum < int.Parse(this.page.Text) + 1 || int.Parse(this.page.Text)  < 1)
                    { MessageBox.Show("已经是最后一页了"); this.page.Text = m_tnum.ToString(); return; }
            m_idxpage = int.Parse(this.page.Text) + 1;
           this.page.Text = m_idxpage.ToString();

            button1_Click(sender, e);
        }

        private void page_TextChanged(object sender, EventArgs e)
        {
        }

        private void junp_to_Click(object sender, EventArgs e)
        {
            if (this.page.Text == null || this.page.Text.Length == 0) { MessageBox.Show("请输入跳转页码"); return; }
            try { int.Parse(this.page.Text); }
            catch { MessageBox.Show("输入无效"); }
            if (int.Parse(this.page.Text) < 1 || int.Parse(this.page.Text) > m_tnum)
            { MessageBox.Show("选中页码不存在"); this.page.Text = m_tnum.ToString(); return; }
            m_idxpage = int.Parse(this.page.Text);
            button1_Click(sender, e);
        }

        private void page_KeyDown(object sender, KeyEventArgs e)
        {
          //  junp_to_Click(sender, e);
        }

        private void showPersonImf_MouseClick(object sender, MouseEventArgs e)
        {
            if (this.showPersonImf.FocusedItem != null)//这个if必须的，不然会得到值但会报错
            {
                //    this.IPlist.FocusedItem.SubItems[0].Text
                string strID = this.showPersonImf.FocusedItem.SubItems[1].Text;//获得的listView的值显示在文本框里SubItems[i]第i列
                //    string strFile= m_sModelPath+strID+".jpg";
                //   int imagelen = 0;
                // Console.WriteLine( strID);
                Image returnImage;
                show_picture.Image = m_pictureMap[strID];
                //if ( m_pictureMap.TryGetValue(strID, out returnImage))
                //{
                //    try
                //    {

                //        //  Image im = System.Drawing.Bitmap.FromStream(returnImage);
                //      //  show_picture.Image = returnImage;

                //    }
                //    catch (Exception ex)
                //    {
                //        MessageBox.Show(ex.ToString());
                //    }
                //}

            }
            else MessageBox.Show("选中无效");
        }
    }
}

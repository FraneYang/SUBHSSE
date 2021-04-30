namespace FaceRecognitionDemo
{
    partial class FaceRecognitionSDK_Form
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.button15 = new System.Windows.Forms.Button();
            this.image_save_path = new System.Windows.Forms.TextBox();
            this.groupBox4 = new System.Windows.Forms.GroupBox();
            this.label4 = new System.Windows.Forms.Label();
            this.CapturedImage = new System.Windows.Forms.PictureBox();
            this.unidentifiedImf = new System.Windows.Forms.ListView();
            this.groupBox3 = new System.Windows.Forms.GroupBox();
            this.label2 = new System.Windows.Forms.Label();
            this.modeImage = new System.Windows.Forms.PictureBox();
            this.identifiedimf = new System.Windows.Forms.ListView();
            this.label1 = new System.Windows.Forms.Label();
            this.CameraIP = new System.Windows.Forms.TextBox();
            this.ConnetCamera = new System.Windows.Forms.Button();
            this.label3 = new System.Windows.Forms.Label();
            this.connnetserver = new System.Windows.Forms.Button();
            this.button2 = new System.Windows.Forms.Button();
            this.button14 = new System.Windows.Forms.Button();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.SerialPortSettings = new System.Windows.Forms.Button();
            this.SystemUpgrade = new System.Windows.Forms.Button();
            this.NetSetting = new System.Windows.Forms.Button();
            this.WG = new System.Windows.Forms.Button();
            this.button3 = new System.Windows.Forms.Button();
            this.timesetting = new System.Windows.Forms.Button();
            this.TagSetting = new System.Windows.Forms.Button();
            this.LightSetting = new System.Windows.Forms.Button();
            this.repetition = new System.Windows.Forms.Button();
            this.SimilaritySetting = new System.Windows.Forms.Button();
            this.button1 = new System.Windows.Forms.Button();
            this.groupBox8 = new System.Windows.Forms.GroupBox();
            this.label6 = new System.Windows.Forms.Label();
            this.pictureBox3 = new System.Windows.Forms.PictureBox();
            this.groupBox5 = new System.Windows.Forms.GroupBox();
            this.textBox1 = new System.Windows.Forms.TextBox();
            this.label5 = new System.Windows.Forms.Label();
            this.groupBox2.SuspendLayout();
            this.groupBox4.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.CapturedImage)).BeginInit();
            this.groupBox3.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.modeImage)).BeginInit();
            this.groupBox1.SuspendLayout();
            this.groupBox8.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox3)).BeginInit();
            this.groupBox5.SuspendLayout();
            this.SuspendLayout();
            // 
            // groupBox2
            // 
            this.groupBox2.Controls.Add(this.button15);
            this.groupBox2.Controls.Add(this.image_save_path);
            this.groupBox2.Controls.Add(this.groupBox4);
            this.groupBox2.Controls.Add(this.groupBox3);
            this.groupBox2.Controls.Add(this.label1);
            this.groupBox2.Location = new System.Drawing.Point(6, 140);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(700, 446);
            this.groupBox2.TabIndex = 1;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "抓拍信息";
            this.groupBox2.Enter += new System.EventHandler(this.groupBox2_Enter);
            // 
            // button15
            // 
            this.button15.Location = new System.Drawing.Point(318, 405);
            this.button15.Name = "button15";
            this.button15.Size = new System.Drawing.Size(97, 23);
            this.button15.TabIndex = 17;
            this.button15.Text = "选择存储路径";
            this.button15.UseVisualStyleBackColor = true;
            this.button15.Click += new System.EventHandler(this.button15_Click);
            // 
            // image_save_path
            // 
            this.image_save_path.BackColor = System.Drawing.SystemColors.MenuBar;
            this.image_save_path.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.image_save_path.Enabled = false;
            this.image_save_path.Location = new System.Drawing.Point(96, 405);
            this.image_save_path.Name = "image_save_path";
            this.image_save_path.Size = new System.Drawing.Size(175, 21);
            this.image_save_path.TabIndex = 19;
            this.image_save_path.Text = "D:\\test";
            this.image_save_path.TextChanged += new System.EventHandler(this.image_save_path_TextChanged);
            // 
            // groupBox4
            // 
            this.groupBox4.Controls.Add(this.label4);
            this.groupBox4.Controls.Add(this.CapturedImage);
            this.groupBox4.Controls.Add(this.unidentifiedImf);
            this.groupBox4.Location = new System.Drawing.Point(388, 25);
            this.groupBox4.Name = "groupBox4";
            this.groupBox4.Size = new System.Drawing.Size(280, 355);
            this.groupBox4.TabIndex = 1;
            this.groupBox4.TabStop = false;
            this.groupBox4.Text = "未识别人员";
            this.groupBox4.Enter += new System.EventHandler(this.groupBox4_Enter);
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Enabled = false;
            this.label4.Location = new System.Drawing.Point(129, 334);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(41, 12);
            this.label4.TabIndex = 20;
            this.label4.Text = "抓拍图";
            // 
            // CapturedImage
            // 
            this.CapturedImage.Location = new System.Drawing.Point(15, 152);
            this.CapturedImage.Name = "CapturedImage";
            this.CapturedImage.Size = new System.Drawing.Size(228, 179);
            this.CapturedImage.SizeMode = System.Windows.Forms.PictureBoxSizeMode.Zoom;
            this.CapturedImage.TabIndex = 9;
            this.CapturedImage.TabStop = false;
            this.CapturedImage.Click += new System.EventHandler(this.pictureBox1_Click_1);
            // 
            // unidentifiedImf
            // 
            this.unidentifiedImf.AllowColumnReorder = true;
            this.unidentifiedImf.Font = new System.Drawing.Font("宋体", 9F);
            this.unidentifiedImf.FullRowSelect = true;
            this.unidentifiedImf.GridLines = true;
            this.unidentifiedImf.Location = new System.Drawing.Point(21, 16);
            this.unidentifiedImf.Name = "unidentifiedImf";
            this.unidentifiedImf.Size = new System.Drawing.Size(228, 130);
            this.unidentifiedImf.TabIndex = 5;
            this.unidentifiedImf.UseCompatibleStateImageBehavior = false;
            this.unidentifiedImf.View = System.Windows.Forms.View.Details;
            this.unidentifiedImf.SelectedIndexChanged += new System.EventHandler(this.listView2_SelectedIndexChanged);
            this.unidentifiedImf.MouseClick += new System.Windows.Forms.MouseEventHandler(this.unidentifiedImf_MouseClick);
       
            // 
            // groupBox3
            // 
            this.groupBox3.Controls.Add(this.label2);
            this.groupBox3.Controls.Add(this.modeImage);
            this.groupBox3.Controls.Add(this.identifiedimf);
            this.groupBox3.Location = new System.Drawing.Point(22, 20);
            this.groupBox3.Name = "groupBox3";
            this.groupBox3.Size = new System.Drawing.Size(318, 360);
            this.groupBox3.TabIndex = 0;
            this.groupBox3.TabStop = false;
            this.groupBox3.Text = "已识别人员";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Enabled = false;
            this.label2.Location = new System.Drawing.Point(138, 345);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(65, 12);
            this.label2.TabIndex = 19;
            this.label2.Text = "模板图像：";
            // 
            // modeImage
            // 
            this.modeImage.Location = new System.Drawing.Point(35, 150);
            this.modeImage.Name = "modeImage";
            this.modeImage.Size = new System.Drawing.Size(244, 179);
            this.modeImage.SizeMode = System.Windows.Forms.PictureBoxSizeMode.Zoom;
            this.modeImage.TabIndex = 8;
            this.modeImage.TabStop = false;
            // 
            // identifiedimf
            // 
            this.identifiedimf.AllowColumnReorder = true;
            this.identifiedimf.Font = new System.Drawing.Font("宋体", 9F);
            this.identifiedimf.FullRowSelect = true;
            this.identifiedimf.GridLines = true;
            this.identifiedimf.Location = new System.Drawing.Point(35, 20);
            this.identifiedimf.Name = "identifiedimf";
            this.identifiedimf.Size = new System.Drawing.Size(244, 124);
            this.identifiedimf.TabIndex = 7;
            this.identifiedimf.UseCompatibleStateImageBehavior = false;
            this.identifiedimf.View = System.Windows.Forms.View.Details;
            this.identifiedimf.MouseClick += new System.Windows.Forms.MouseEventHandler(this.identifiedimf_MouseClick);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Enabled = false;
            this.label1.Location = new System.Drawing.Point(13, 407);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(77, 12);
            this.label1.TabIndex = 18;
            this.label1.Text = "抓拍图路径：";
            this.label1.Click += new System.EventHandler(this.label1_Click);
            // 
            // CameraIP
            // 
            this.CameraIP.BackColor = System.Drawing.SystemColors.HighlightText;
            this.CameraIP.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.CameraIP.Location = new System.Drawing.Point(71, 17);
            this.CameraIP.Name = "CameraIP";
            this.CameraIP.Size = new System.Drawing.Size(100, 21);
            this.CameraIP.TabIndex = 23;
            this.CameraIP.Text = "192.168.1.124";
            // 
            // ConnetCamera
            // 
            this.ConnetCamera.Location = new System.Drawing.Point(177, 17);
            this.ConnetCamera.Name = "ConnetCamera";
            this.ConnetCamera.Size = new System.Drawing.Size(65, 23);
            this.ConnetCamera.TabIndex = 21;
            this.ConnetCamera.Text = "连接相机";
            this.ConnetCamera.UseVisualStyleBackColor = true;
            this.ConnetCamera.Click += new System.EventHandler(this.button20_Click);
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(6, 22);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(47, 12);
            this.label3.TabIndex = 19;
            this.label3.Text = "相机IP:";
            this.label3.Click += new System.EventHandler(this.label3_Click);
            // 
            // connnetserver
            // 
            this.connnetserver.Location = new System.Drawing.Point(177, 61);
            this.connnetserver.Name = "connnetserver";
            this.connnetserver.Size = new System.Drawing.Size(65, 23);
            this.connnetserver.TabIndex = 22;
            this.connnetserver.Text = "连接服务器";
            this.connnetserver.UseVisualStyleBackColor = true;
            this.connnetserver.Click += new System.EventHandler(this.connnetserver_Click);
            // 
            // button2
            // 
            this.button2.Location = new System.Drawing.Point(96, 20);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(75, 23);
            this.button2.TabIndex = 1;
            this.button2.Text = "人员查询";
            this.button2.UseVisualStyleBackColor = true;
            this.button2.Click += new System.EventHandler(this.button2_Click);
            // 
            // button14
            // 
            this.button14.Location = new System.Drawing.Point(15, 20);
            this.button14.Name = "button14";
            this.button14.Size = new System.Drawing.Size(75, 22);
            this.button14.TabIndex = 16;
            this.button14.Text = "人脸添加";
            this.button14.UseVisualStyleBackColor = true;
            this.button14.Click += new System.EventHandler(this.button14_Click);
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.SerialPortSettings);
            this.groupBox1.Controls.Add(this.SystemUpgrade);
            this.groupBox1.Controls.Add(this.NetSetting);
            this.groupBox1.Controls.Add(this.WG);
            this.groupBox1.Controls.Add(this.button3);
            this.groupBox1.Controls.Add(this.timesetting);
            this.groupBox1.Controls.Add(this.TagSetting);
            this.groupBox1.Controls.Add(this.LightSetting);
            this.groupBox1.Controls.Add(this.repetition);
            this.groupBox1.Controls.Add(this.SimilaritySetting);
            this.groupBox1.Controls.Add(this.button14);
            this.groupBox1.Controls.Add(this.button2);
            this.groupBox1.Location = new System.Drawing.Point(6, 6);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(365, 128);
            this.groupBox1.TabIndex = 0;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "功能";
            this.groupBox1.Enter += new System.EventHandler(this.groupBox1_Enter);
            // 
            // SerialPortSettings
            // 
            this.SerialPortSettings.Location = new System.Drawing.Point(265, 52);
            this.SerialPortSettings.Name = "SerialPortSettings";
            this.SerialPortSettings.Size = new System.Drawing.Size(75, 23);
            this.SerialPortSettings.TabIndex = 33;
            this.SerialPortSettings.Text = "串口设置";
            this.SerialPortSettings.UseVisualStyleBackColor = true;
            this.SerialPortSettings.Click += new System.EventHandler(this.SerialPortSettings_Click);
            // 
            // SystemUpgrade
            // 
            this.SystemUpgrade.Location = new System.Drawing.Point(265, 87);
            this.SystemUpgrade.Name = "SystemUpgrade";
            this.SystemUpgrade.Size = new System.Drawing.Size(75, 23);
            this.SystemUpgrade.TabIndex = 32;
            this.SystemUpgrade.Text = "系统升级";
            this.SystemUpgrade.UseVisualStyleBackColor = true;
            this.SystemUpgrade.Click += new System.EventHandler(this.SystemUpgrade_Click);
            // 
            // NetSetting
            // 
            this.NetSetting.Location = new System.Drawing.Point(184, 87);
            this.NetSetting.Name = "NetSetting";
            this.NetSetting.Size = new System.Drawing.Size(75, 23);
            this.NetSetting.TabIndex = 31;
            this.NetSetting.Text = "网络设置";
            this.NetSetting.UseVisualStyleBackColor = true;
            this.NetSetting.Click += new System.EventHandler(this.NetSetting_Click);
            // 
            // WG
            // 
            this.WG.Location = new System.Drawing.Point(96, 52);
            this.WG.Name = "WG";
            this.WG.Size = new System.Drawing.Size(75, 23);
            this.WG.TabIndex = 30;
            this.WG.Text = "韦根";
            this.WG.UseVisualStyleBackColor = true;
            this.WG.Click += new System.EventHandler(this.WG_Click);
            // 
            // button3
            // 
            this.button3.Location = new System.Drawing.Point(15, 52);
            this.button3.Name = "button3";
            this.button3.Size = new System.Drawing.Size(75, 23);
            this.button3.TabIndex = 29;
            this.button3.Text = "识别设置";
            this.button3.UseVisualStyleBackColor = true;
            this.button3.Click += new System.EventHandler(this.button3_Click_1);
            // 
            // timesetting
            // 
            this.timesetting.Location = new System.Drawing.Point(184, 52);
            this.timesetting.Name = "timesetting";
            this.timesetting.Size = new System.Drawing.Size(75, 23);
            this.timesetting.TabIndex = 28;
            this.timesetting.Text = "时间设置";
            this.timesetting.UseVisualStyleBackColor = true;
            this.timesetting.Click += new System.EventHandler(this.timesetting_Click);
            // 
            // TagSetting
            // 
            this.TagSetting.Location = new System.Drawing.Point(96, 87);
            this.TagSetting.Name = "TagSetting";
            this.TagSetting.Size = new System.Drawing.Size(75, 23);
            this.TagSetting.TabIndex = 27;
            this.TagSetting.Text = "设置标题";
            this.TagSetting.UseVisualStyleBackColor = true;
            this.TagSetting.Click += new System.EventHandler(this.TagSetting_Click);
            // 
            // LightSetting
            // 
            this.LightSetting.Location = new System.Drawing.Point(15, 87);
            this.LightSetting.Name = "LightSetting";
            this.LightSetting.Size = new System.Drawing.Size(75, 23);
            this.LightSetting.TabIndex = 26;
            this.LightSetting.Text = "灯控背景";
            this.LightSetting.UseVisualStyleBackColor = true;
            this.LightSetting.Click += new System.EventHandler(this.LightSetting_Click);
            // 
            // repetition
            // 
            this.repetition.Location = new System.Drawing.Point(265, 20);
            this.repetition.Name = "repetition";
            this.repetition.Size = new System.Drawing.Size(75, 23);
            this.repetition.TabIndex = 25;
            this.repetition.Text = "去重复";
            this.repetition.UseVisualStyleBackColor = true;
            this.repetition.Click += new System.EventHandler(this.repetition_Click);
            // 
            // SimilaritySetting
            // 
            this.SimilaritySetting.Location = new System.Drawing.Point(184, 20);
            this.SimilaritySetting.Name = "SimilaritySetting";
            this.SimilaritySetting.Size = new System.Drawing.Size(75, 23);
            this.SimilaritySetting.TabIndex = 24;
            this.SimilaritySetting.Text = "相似度设置";
            this.SimilaritySetting.UseVisualStyleBackColor = true;
            this.SimilaritySetting.Click += new System.EventHandler(this.SimilaritySetting_Click);
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(696, 26);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(75, 23);
            this.button1.TabIndex = 23;
            this.button1.Text = "搜索相机";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click_1);
            // 
            // groupBox8
            // 
            this.groupBox8.Controls.Add(this.label6);
            this.groupBox8.Controls.Add(this.pictureBox3);
            this.groupBox8.Location = new System.Drawing.Point(745, 120);
            this.groupBox8.Name = "groupBox8";
            this.groupBox8.Size = new System.Drawing.Size(331, 352);
            this.groupBox8.TabIndex = 2;
            this.groupBox8.TabStop = false;
            this.groupBox8.Text = "视频";
            this.groupBox8.Enter += new System.EventHandler(this.groupBox8_Enter);
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(14, 20);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(167, 12);
            this.label6.TabIndex = 25;
            this.label6.Text = "单机下方块播放/停止播放视频";
            // 
            // pictureBox3
            // 
            this.pictureBox3.Location = new System.Drawing.Point(16, 38);
            this.pictureBox3.Name = "pictureBox3";
            this.pictureBox3.Size = new System.Drawing.Size(300, 282);
            this.pictureBox3.TabIndex = 1;
            this.pictureBox3.TabStop = false;
            this.pictureBox3.Click += new System.EventHandler(this.pictureBox3_Click);
            // 
            // groupBox5
            // 
            this.groupBox5.Controls.Add(this.textBox1);
            this.groupBox5.Controls.Add(this.label5);
            this.groupBox5.Controls.Add(this.connnetserver);
            this.groupBox5.Controls.Add(this.CameraIP);
            this.groupBox5.Controls.Add(this.ConnetCamera);
            this.groupBox5.Controls.Add(this.label3);
            this.groupBox5.Location = new System.Drawing.Point(416, 12);
            this.groupBox5.Name = "groupBox5";
            this.groupBox5.Size = new System.Drawing.Size(258, 95);
            this.groupBox5.TabIndex = 3;
            this.groupBox5.TabStop = false;
            this.groupBox5.Text = "连接设置";
            // 
            // textBox1
            // 
            this.textBox1.BackColor = System.Drawing.SystemColors.HighlightText;
            this.textBox1.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.textBox1.Location = new System.Drawing.Point(71, 64);
            this.textBox1.Name = "textBox1";
            this.textBox1.Size = new System.Drawing.Size(100, 21);
            this.textBox1.TabIndex = 25;
            this.textBox1.Text = "192.168.1.125";
            this.textBox1.TextChanged += new System.EventHandler(this.textBox1_TextChanged);
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(6, 66);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(65, 12);
            this.label5.TabIndex = 24;
            this.label5.Text = "服务器IP：";
            // 
            // FaceRecognitionSDK_Form
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1100, 608);
            this.Controls.Add(this.groupBox5);
            this.Controls.Add(this.groupBox8);
            this.Controls.Add(this.groupBox2);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.button1);
            this.Name = "FaceRecognitionSDK_Form";
            this.Text = "人脸识别";
            this.Load += new System.EventHandler(this.FaceRecognitionSDK_Form_Load);
            this.groupBox2.ResumeLayout(false);
            this.groupBox2.PerformLayout();
            this.groupBox4.ResumeLayout(false);
            this.groupBox4.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.CapturedImage)).EndInit();
            this.groupBox3.ResumeLayout(false);
            this.groupBox3.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.modeImage)).EndInit();
            this.groupBox1.ResumeLayout(false);
            this.groupBox8.ResumeLayout(false);
            this.groupBox8.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox3)).EndInit();
            this.groupBox5.ResumeLayout(false);
            this.groupBox5.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.GroupBox groupBox4;
        private System.Windows.Forms.GroupBox groupBox3;
        private System.Windows.Forms.Button button15;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox image_save_path;
        private System.Windows.Forms.ListView identifiedimf;
        private System.Windows.Forms.ListView unidentifiedImf;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Button connnetserver;
        private System.Windows.Forms.Button ConnetCamera;
        private System.Windows.Forms.TextBox CameraIP;
        private System.Windows.Forms.Button button2;
        private System.Windows.Forms.Button button14;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.GroupBox groupBox8;
        private System.Windows.Forms.PictureBox pictureBox3;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.PictureBox CapturedImage;
        private System.Windows.Forms.PictureBox modeImage;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.GroupBox groupBox5;
        private System.Windows.Forms.TextBox textBox1;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Button SimilaritySetting;
        private System.Windows.Forms.Button repetition;
        private System.Windows.Forms.Button LightSetting;
        private System.Windows.Forms.Button TagSetting;
        private System.Windows.Forms.Button timesetting;
        private System.Windows.Forms.Button button3;
        private System.Windows.Forms.Button WG;
        private System.Windows.Forms.Button NetSetting;
        private System.Windows.Forms.Button SystemUpgrade;
        private System.Windows.Forms.Button SerialPortSettings;
        private System.Windows.Forms.Label label6;

    }
}
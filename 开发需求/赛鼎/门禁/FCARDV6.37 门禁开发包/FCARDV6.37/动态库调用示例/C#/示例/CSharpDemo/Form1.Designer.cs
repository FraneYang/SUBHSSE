namespace CSharpDemo
{
    partial class Form1
    {
        /// <summary>
        /// 必需的设计器变量。
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// 清理所有正在使用的资源。
        /// </summary>
        /// <param name="disposing">如果应释放托管资源，为 true；否则为 false。</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows 窗体设计器生成的代码

        /// <summary>
        /// 设计器支持所需的方法 - 不要修改
        /// 使用代码编辑器修改此方法的内容。
        /// </summary>
        private void InitializeComponent()
        {
            this.btnOpenDoors = new System.Windows.Forms.Button();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.btnCloseDoor = new System.Windows.Forms.Button();
            this.gbConfig = new System.Windows.Forms.GroupBox();
            this.gbUDP = new System.Windows.Forms.GroupBox();
            this.TxtIPPort_UDP = new System.Windows.Forms.NumericUpDown();
            this.label5 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.TxtIPAddr_UDP = new System.Windows.Forms.TextBox();
            this.ChkBroadcast = new System.Windows.Forms.CheckBox();
            this.TxtConnPassword = new System.Windows.Forms.TextBox();
            this.TxtConnSN = new System.Windows.Forms.TextBox();
            this.label7 = new System.Windows.Forms.Label();
            this.label6 = new System.Windows.Forms.Label();
            this.gbCOM = new System.Windows.Forms.GroupBox();
            this.btnRefresh = new System.Windows.Forms.Button();
            this.label3 = new System.Windows.Forms.Label();
            this.CmbSerialPort = new System.Windows.Forms.ComboBox();
            this.gbTCPClient = new System.Windows.Forms.GroupBox();
            this.TxtIPPort_TCPClient = new System.Windows.Forms.NumericUpDown();
            this.label2 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.TxtIPAddr_TCPClient = new System.Windows.Forms.TextBox();
            this.gbTCPServer = new System.Windows.Forms.GroupBox();
            this.TxtServerPort = new System.Windows.Forms.NumericUpDown();
            this.btnBeginServer = new System.Windows.Forms.Button();
            this.label8 = new System.Windows.Forms.Label();
            this.ChkUDP = new System.Windows.Forms.RadioButton();
            this.ChkCOM = new System.Windows.Forms.RadioButton();
            this.ChkTCPServer = new System.Windows.Forms.RadioButton();
            this.ChkTCPClient = new System.Windows.Forms.RadioButton();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.btnCardClear = new System.Windows.Forms.Button();
            this.btnCardWrite = new System.Windows.Forms.Button();
            this.btnWriteSortCardList = new System.Windows.Forms.Button();
            this.btnCardReadAll = new System.Windows.Forms.Button();
            this.CmbOptCardMode = new System.Windows.Forms.ComboBox();
            this.groupBox3 = new System.Windows.Forms.GroupBox();
            this.btnReadAutoTimeRepair = new System.Windows.Forms.Button();
            this.btnReadTime = new System.Windows.Forms.Button();
            this.btnWriteAutoTimeRepair = new System.Windows.Forms.Button();
            this.btnWriteTimeDefine = new System.Windows.Forms.Button();
            this.btnWriteTime = new System.Windows.Forms.Button();
            this.btnSearch = new System.Windows.Forms.Button();
            this.groupBox4 = new System.Windows.Forms.GroupBox();
            this.btnStop = new System.Windows.Forms.Button();
            this.cmbDrives = new System.Windows.Forms.ComboBox();
            this.groupBox1.SuspendLayout();
            this.gbConfig.SuspendLayout();
            this.gbUDP.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.TxtIPPort_UDP)).BeginInit();
            this.gbCOM.SuspendLayout();
            this.gbTCPClient.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.TxtIPPort_TCPClient)).BeginInit();
            this.gbTCPServer.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.TxtServerPort)).BeginInit();
            this.groupBox2.SuspendLayout();
            this.groupBox3.SuspendLayout();
            this.groupBox4.SuspendLayout();
            this.SuspendLayout();
            // 
            // btnOpenDoors
            // 
            this.btnOpenDoors.Location = new System.Drawing.Point(23, 29);
            this.btnOpenDoors.Name = "btnOpenDoors";
            this.btnOpenDoors.Size = new System.Drawing.Size(75, 23);
            this.btnOpenDoors.TabIndex = 0;
            this.btnOpenDoors.Text = "开门";
            this.btnOpenDoors.UseVisualStyleBackColor = true;
            this.btnOpenDoors.Click += new System.EventHandler(this.btnOpenDoors_Click);
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.btnCloseDoor);
            this.groupBox1.Controls.Add(this.btnOpenDoors);
            this.groupBox1.Location = new System.Drawing.Point(23, 223);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(202, 64);
            this.groupBox1.TabIndex = 1;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "门操作";
            // 
            // btnCloseDoor
            // 
            this.btnCloseDoor.Location = new System.Drawing.Point(104, 29);
            this.btnCloseDoor.Name = "btnCloseDoor";
            this.btnCloseDoor.Size = new System.Drawing.Size(75, 23);
            this.btnCloseDoor.TabIndex = 0;
            this.btnCloseDoor.Text = "关门";
            this.btnCloseDoor.UseVisualStyleBackColor = true;
            this.btnCloseDoor.Click += new System.EventHandler(this.btnCloseDoor_Click);
            // 
            // gbConfig
            // 
            this.gbConfig.Controls.Add(this.gbUDP);
            this.gbConfig.Controls.Add(this.TxtConnPassword);
            this.gbConfig.Controls.Add(this.TxtConnSN);
            this.gbConfig.Controls.Add(this.label7);
            this.gbConfig.Controls.Add(this.label6);
            this.gbConfig.Controls.Add(this.gbCOM);
            this.gbConfig.Controls.Add(this.gbTCPClient);
            this.gbConfig.Controls.Add(this.gbTCPServer);
            this.gbConfig.Controls.Add(this.ChkUDP);
            this.gbConfig.Controls.Add(this.ChkCOM);
            this.gbConfig.Controls.Add(this.ChkTCPServer);
            this.gbConfig.Controls.Add(this.ChkTCPClient);
            this.gbConfig.Location = new System.Drawing.Point(23, 12);
            this.gbConfig.Name = "gbConfig";
            this.gbConfig.Size = new System.Drawing.Size(889, 203);
            this.gbConfig.TabIndex = 2;
            this.gbConfig.TabStop = false;
            this.gbConfig.Text = "通讯参数";
            // 
            // gbUDP
            // 
            this.gbUDP.Controls.Add(this.TxtIPPort_UDP);
            this.gbUDP.Controls.Add(this.label5);
            this.gbUDP.Controls.Add(this.label4);
            this.gbUDP.Controls.Add(this.TxtIPAddr_UDP);
            this.gbUDP.Controls.Add(this.ChkBroadcast);
            this.gbUDP.Location = new System.Drawing.Point(246, 51);
            this.gbUDP.Name = "gbUDP";
            this.gbUDP.Size = new System.Drawing.Size(200, 100);
            this.gbUDP.TabIndex = 3;
            this.gbUDP.TabStop = false;
            this.gbUDP.Text = "UDP";
            this.gbUDP.Visible = false;
            // 
            // TxtIPPort_UDP
            // 
            this.TxtIPPort_UDP.Location = new System.Drawing.Point(46, 50);
            this.TxtIPPort_UDP.Maximum = new decimal(new int[] {
            65535,
            0,
            0,
            0});
            this.TxtIPPort_UDP.Minimum = new decimal(new int[] {
            1,
            0,
            0,
            0});
            this.TxtIPPort_UDP.Name = "TxtIPPort_UDP";
            this.TxtIPPort_UDP.Size = new System.Drawing.Size(120, 21);
            this.TxtIPPort_UDP.TabIndex = 2;
            this.TxtIPPort_UDP.Value = new decimal(new int[] {
            8101,
            0,
            0,
            0});
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(6, 56);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(35, 12);
            this.label5.TabIndex = 2;
            this.label5.Text = "端口:";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(6, 20);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(23, 12);
            this.label4.TabIndex = 1;
            this.label4.Text = "IP:";
            // 
            // TxtIPAddr_UDP
            // 
            this.TxtIPAddr_UDP.Location = new System.Drawing.Point(46, 17);
            this.TxtIPAddr_UDP.Name = "TxtIPAddr_UDP";
            this.TxtIPAddr_UDP.Size = new System.Drawing.Size(154, 21);
            this.TxtIPAddr_UDP.TabIndex = 1;
            // 
            // ChkBroadcast
            // 
            this.ChkBroadcast.AutoSize = true;
            this.ChkBroadcast.Checked = true;
            this.ChkBroadcast.CheckState = System.Windows.Forms.CheckState.Checked;
            this.ChkBroadcast.Location = new System.Drawing.Point(46, 78);
            this.ChkBroadcast.Name = "ChkBroadcast";
            this.ChkBroadcast.Size = new System.Drawing.Size(48, 16);
            this.ChkBroadcast.TabIndex = 0;
            this.ChkBroadcast.Text = "广播";
            this.ChkBroadcast.UseVisualStyleBackColor = true;
            // 
            // TxtConnPassword
            // 
            this.TxtConnPassword.Location = new System.Drawing.Point(65, 178);
            this.TxtConnPassword.Name = "TxtConnPassword";
            this.TxtConnPassword.Size = new System.Drawing.Size(158, 21);
            this.TxtConnPassword.TabIndex = 6;
            this.TxtConnPassword.Text = "FFFFFFFF";
            // 
            // TxtConnSN
            // 
            this.TxtConnSN.Location = new System.Drawing.Point(65, 153);
            this.TxtConnSN.Name = "TxtConnSN";
            this.TxtConnSN.Size = new System.Drawing.Size(158, 21);
            this.TxtConnSN.TabIndex = 6;
            this.TxtConnSN.Text = "MC-5824T25070244";
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(15, 181);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(35, 12);
            this.label7.TabIndex = 5;
            this.label7.Text = "密码:";
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(15, 156);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(23, 12);
            this.label6.TabIndex = 4;
            this.label6.Text = "SN:";
            // 
            // gbCOM
            // 
            this.gbCOM.Controls.Add(this.btnRefresh);
            this.gbCOM.Controls.Add(this.label3);
            this.gbCOM.Controls.Add(this.CmbSerialPort);
            this.gbCOM.Location = new System.Drawing.Point(690, 51);
            this.gbCOM.Name = "gbCOM";
            this.gbCOM.Size = new System.Drawing.Size(200, 100);
            this.gbCOM.TabIndex = 3;
            this.gbCOM.TabStop = false;
            this.gbCOM.Text = "COM";
            this.gbCOM.Visible = false;
            // 
            // btnRefresh
            // 
            this.btnRefresh.Location = new System.Drawing.Point(151, 39);
            this.btnRefresh.Name = "btnRefresh";
            this.btnRefresh.Size = new System.Drawing.Size(43, 23);
            this.btnRefresh.TabIndex = 2;
            this.btnRefresh.Text = "刷新";
            this.btnRefresh.UseVisualStyleBackColor = true;
            this.btnRefresh.Click += new System.EventHandler(this.btnRefresh_Click);
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(10, 46);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(29, 12);
            this.label3.TabIndex = 1;
            this.label3.Text = "COM:";
            // 
            // CmbSerialPort
            // 
            this.CmbSerialPort.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.CmbSerialPort.FormattingEnabled = true;
            this.CmbSerialPort.Location = new System.Drawing.Point(48, 42);
            this.CmbSerialPort.Name = "CmbSerialPort";
            this.CmbSerialPort.Size = new System.Drawing.Size(97, 20);
            this.CmbSerialPort.TabIndex = 0;
            // 
            // gbTCPClient
            // 
            this.gbTCPClient.Controls.Add(this.TxtIPPort_TCPClient);
            this.gbTCPClient.Controls.Add(this.label2);
            this.gbTCPClient.Controls.Add(this.label1);
            this.gbTCPClient.Controls.Add(this.TxtIPAddr_TCPClient);
            this.gbTCPClient.Location = new System.Drawing.Point(23, 51);
            this.gbTCPClient.Name = "gbTCPClient";
            this.gbTCPClient.Size = new System.Drawing.Size(200, 100);
            this.gbTCPClient.TabIndex = 3;
            this.gbTCPClient.TabStop = false;
            this.gbTCPClient.Text = "TCPClient";
            // 
            // TxtIPPort_TCPClient
            // 
            this.TxtIPPort_TCPClient.Location = new System.Drawing.Point(47, 61);
            this.TxtIPPort_TCPClient.Maximum = new decimal(new int[] {
            65535,
            0,
            0,
            0});
            this.TxtIPPort_TCPClient.Minimum = new decimal(new int[] {
            1,
            0,
            0,
            0});
            this.TxtIPPort_TCPClient.Name = "TxtIPPort_TCPClient";
            this.TxtIPPort_TCPClient.Size = new System.Drawing.Size(120, 21);
            this.TxtIPPort_TCPClient.TabIndex = 3;
            this.TxtIPPort_TCPClient.Value = new decimal(new int[] {
            8000,
            0,
            0,
            0});
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(6, 63);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(35, 12);
            this.label2.TabIndex = 2;
            this.label2.Text = "端口:";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(6, 23);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(23, 12);
            this.label1.TabIndex = 1;
            this.label1.Text = "IP:";
            // 
            // TxtIPAddr_TCPClient
            // 
            this.TxtIPAddr_TCPClient.Location = new System.Drawing.Point(42, 20);
            this.TxtIPAddr_TCPClient.Name = "TxtIPAddr_TCPClient";
            this.TxtIPAddr_TCPClient.Size = new System.Drawing.Size(152, 21);
            this.TxtIPAddr_TCPClient.TabIndex = 0;
            this.TxtIPAddr_TCPClient.Text = "192.168.1.116";
            // 
            // gbTCPServer
            // 
            this.gbTCPServer.Controls.Add(this.TxtServerPort);
            this.gbTCPServer.Controls.Add(this.btnBeginServer);
            this.gbTCPServer.Controls.Add(this.label8);
            this.gbTCPServer.Location = new System.Drawing.Point(484, 51);
            this.gbTCPServer.Name = "gbTCPServer";
            this.gbTCPServer.Size = new System.Drawing.Size(200, 100);
            this.gbTCPServer.TabIndex = 3;
            this.gbTCPServer.TabStop = false;
            this.gbTCPServer.Text = "TCPServer";
            this.gbTCPServer.Visible = false;
            // 
            // TxtServerPort
            // 
            this.TxtServerPort.Location = new System.Drawing.Point(45, 25);
            this.TxtServerPort.Maximum = new decimal(new int[] {
            65535,
            0,
            0,
            0});
            this.TxtServerPort.Minimum = new decimal(new int[] {
            1,
            0,
            0,
            0});
            this.TxtServerPort.Name = "TxtServerPort";
            this.TxtServerPort.Size = new System.Drawing.Size(55, 21);
            this.TxtServerPort.TabIndex = 1;
            this.TxtServerPort.Value = new decimal(new int[] {
            9010,
            0,
            0,
            0});
            // 
            // btnBeginServer
            // 
            this.btnBeginServer.Location = new System.Drawing.Point(106, 23);
            this.btnBeginServer.Name = "btnBeginServer";
            this.btnBeginServer.Size = new System.Drawing.Size(75, 23);
            this.btnBeginServer.TabIndex = 0;
            this.btnBeginServer.Text = "开启服务";
            this.btnBeginServer.UseVisualStyleBackColor = true;
            this.btnBeginServer.Click += new System.EventHandler(this.btnBeginServer_Click);
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Location = new System.Drawing.Point(6, 28);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(35, 12);
            this.label8.TabIndex = 1;
            this.label8.Text = "端口:";
            // 
            // ChkUDP
            // 
            this.ChkUDP.AutoSize = true;
            this.ChkUDP.Location = new System.Drawing.Point(246, 20);
            this.ChkUDP.Name = "ChkUDP";
            this.ChkUDP.Size = new System.Drawing.Size(41, 16);
            this.ChkUDP.TabIndex = 2;
            this.ChkUDP.Text = "UDP";
            this.ChkUDP.UseVisualStyleBackColor = true;
            this.ChkUDP.CheckedChanged += new System.EventHandler(this.ChkUDP_CheckedChanged);
            // 
            // ChkCOM
            // 
            this.ChkCOM.AutoSize = true;
            this.ChkCOM.Location = new System.Drawing.Point(187, 20);
            this.ChkCOM.Name = "ChkCOM";
            this.ChkCOM.Size = new System.Drawing.Size(53, 16);
            this.ChkCOM.TabIndex = 2;
            this.ChkCOM.Text = "RS485";
            this.ChkCOM.UseVisualStyleBackColor = true;
            this.ChkCOM.CheckedChanged += new System.EventHandler(this.ChkCOM_CheckedChanged);
            // 
            // ChkTCPServer
            // 
            this.ChkTCPServer.AutoSize = true;
            this.ChkTCPServer.Location = new System.Drawing.Point(104, 20);
            this.ChkTCPServer.Name = "ChkTCPServer";
            this.ChkTCPServer.Size = new System.Drawing.Size(77, 16);
            this.ChkTCPServer.TabIndex = 1;
            this.ChkTCPServer.Text = "TCPServer";
            this.ChkTCPServer.UseVisualStyleBackColor = true;
            this.ChkTCPServer.CheckedChanged += new System.EventHandler(this.ChkTCPServer_CheckedChanged);
            // 
            // ChkTCPClient
            // 
            this.ChkTCPClient.AutoSize = true;
            this.ChkTCPClient.Checked = true;
            this.ChkTCPClient.Location = new System.Drawing.Point(21, 20);
            this.ChkTCPClient.Name = "ChkTCPClient";
            this.ChkTCPClient.Size = new System.Drawing.Size(77, 16);
            this.ChkTCPClient.TabIndex = 0;
            this.ChkTCPClient.TabStop = true;
            this.ChkTCPClient.Text = "TCPClient";
            this.ChkTCPClient.UseVisualStyleBackColor = true;
            this.ChkTCPClient.CheckedChanged += new System.EventHandler(this.ChkTCPClient_CheckedChanged);
            // 
            // groupBox2
            // 
            this.groupBox2.Controls.Add(this.btnCardClear);
            this.groupBox2.Controls.Add(this.btnCardWrite);
            this.groupBox2.Controls.Add(this.btnWriteSortCardList);
            this.groupBox2.Controls.Add(this.btnCardReadAll);
            this.groupBox2.Controls.Add(this.CmbOptCardMode);
            this.groupBox2.Location = new System.Drawing.Point(252, 221);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(217, 137);
            this.groupBox2.TabIndex = 3;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "卡片操作";
            // 
            // btnCardClear
            // 
            this.btnCardClear.Location = new System.Drawing.Point(111, 104);
            this.btnCardClear.Name = "btnCardClear";
            this.btnCardClear.Size = new System.Drawing.Size(97, 23);
            this.btnCardClear.TabIndex = 3;
            this.btnCardClear.Text = "清空卡片";
            this.btnCardClear.UseVisualStyleBackColor = true;
            this.btnCardClear.Click += new System.EventHandler(this.btnCardClear_Click);
            // 
            // btnCardWrite
            // 
            this.btnCardWrite.Location = new System.Drawing.Point(111, 75);
            this.btnCardWrite.Name = "btnCardWrite";
            this.btnCardWrite.Size = new System.Drawing.Size(97, 23);
            this.btnCardWrite.TabIndex = 2;
            this.btnCardWrite.Text = "上传至非排序区";
            this.btnCardWrite.UseVisualStyleBackColor = true;
            this.btnCardWrite.Click += new System.EventHandler(this.btnCardWrite_Click);
            // 
            // btnWriteSortCardList
            // 
            this.btnWriteSortCardList.Location = new System.Drawing.Point(111, 46);
            this.btnWriteSortCardList.Name = "btnWriteSortCardList";
            this.btnWriteSortCardList.Size = new System.Drawing.Size(97, 23);
            this.btnWriteSortCardList.TabIndex = 1;
            this.btnWriteSortCardList.Text = "上传至排序区";
            this.btnWriteSortCardList.UseVisualStyleBackColor = true;
            this.btnWriteSortCardList.Click += new System.EventHandler(this.btnWriteSortCardList_Click);
            // 
            // btnCardReadAll
            // 
            this.btnCardReadAll.Location = new System.Drawing.Point(111, 17);
            this.btnCardReadAll.Name = "btnCardReadAll";
            this.btnCardReadAll.Size = new System.Drawing.Size(97, 23);
            this.btnCardReadAll.TabIndex = 0;
            this.btnCardReadAll.Text = "读所有名单";
            this.btnCardReadAll.UseVisualStyleBackColor = true;
            this.btnCardReadAll.Click += new System.EventHandler(this.btnCardReadAll_Click);
            // 
            // CmbOptCardMode
            // 
            this.CmbOptCardMode.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.CmbOptCardMode.FormattingEnabled = true;
            this.CmbOptCardMode.Items.AddRange(new object[] {
            "排序区",
            "非排序区",
            "全部区域"});
            this.CmbOptCardMode.Location = new System.Drawing.Point(8, 20);
            this.CmbOptCardMode.Name = "CmbOptCardMode";
            this.CmbOptCardMode.Size = new System.Drawing.Size(97, 20);
            this.CmbOptCardMode.TabIndex = 0;
            // 
            // groupBox3
            // 
            this.groupBox3.Controls.Add(this.btnReadAutoTimeRepair);
            this.groupBox3.Controls.Add(this.btnReadTime);
            this.groupBox3.Controls.Add(this.btnWriteAutoTimeRepair);
            this.groupBox3.Controls.Add(this.btnWriteTimeDefine);
            this.groupBox3.Controls.Add(this.btnWriteTime);
            this.groupBox3.Location = new System.Drawing.Point(492, 221);
            this.groupBox3.Name = "groupBox3";
            this.groupBox3.Size = new System.Drawing.Size(215, 137);
            this.groupBox3.TabIndex = 4;
            this.groupBox3.TabStop = false;
            this.groupBox3.Text = "日期时间";
            // 
            // btnReadAutoTimeRepair
            // 
            this.btnReadAutoTimeRepair.Location = new System.Drawing.Point(109, 79);
            this.btnReadAutoTimeRepair.Name = "btnReadAutoTimeRepair";
            this.btnReadAutoTimeRepair.Size = new System.Drawing.Size(87, 23);
            this.btnReadAutoTimeRepair.TabIndex = 4;
            this.btnReadAutoTimeRepair.Text = "读取修正参数";
            this.btnReadAutoTimeRepair.UseVisualStyleBackColor = true;
            this.btnReadAutoTimeRepair.Click += new System.EventHandler(this.btnReadAutoTimeRepair_Click);
            // 
            // btnReadTime
            // 
            this.btnReadTime.Location = new System.Drawing.Point(109, 20);
            this.btnReadTime.Name = "btnReadTime";
            this.btnReadTime.Size = new System.Drawing.Size(87, 23);
            this.btnReadTime.TabIndex = 3;
            this.btnReadTime.Text = "读取时间";
            this.btnReadTime.UseVisualStyleBackColor = true;
            this.btnReadTime.Click += new System.EventHandler(this.btnReadTime_Click);
            // 
            // btnWriteAutoTimeRepair
            // 
            this.btnWriteAutoTimeRepair.Location = new System.Drawing.Point(15, 79);
            this.btnWriteAutoTimeRepair.Name = "btnWriteAutoTimeRepair";
            this.btnWriteAutoTimeRepair.Size = new System.Drawing.Size(88, 23);
            this.btnWriteAutoTimeRepair.TabIndex = 2;
            this.btnWriteAutoTimeRepair.Text = "自修正";
            this.btnWriteAutoTimeRepair.UseVisualStyleBackColor = true;
            this.btnWriteAutoTimeRepair.Click += new System.EventHandler(this.btnWriteAutoTimeRepair_Click);
            // 
            // btnWriteTimeDefine
            // 
            this.btnWriteTimeDefine.Location = new System.Drawing.Point(15, 50);
            this.btnWriteTimeDefine.Name = "btnWriteTimeDefine";
            this.btnWriteTimeDefine.Size = new System.Drawing.Size(88, 23);
            this.btnWriteTimeDefine.TabIndex = 1;
            this.btnWriteTimeDefine.Text = "自定义时间";
            this.btnWriteTimeDefine.UseVisualStyleBackColor = true;
            this.btnWriteTimeDefine.Click += new System.EventHandler(this.btnWriteTimeDefine_Click);
            // 
            // btnWriteTime
            // 
            this.btnWriteTime.Location = new System.Drawing.Point(15, 20);
            this.btnWriteTime.Name = "btnWriteTime";
            this.btnWriteTime.Size = new System.Drawing.Size(88, 23);
            this.btnWriteTime.TabIndex = 0;
            this.btnWriteTime.Text = "电脑时间校准";
            this.btnWriteTime.UseVisualStyleBackColor = true;
            this.btnWriteTime.Click += new System.EventHandler(this.btnWriteTime_Click);
            // 
            // btnSearch
            // 
            this.btnSearch.Location = new System.Drawing.Point(6, 20);
            this.btnSearch.Name = "btnSearch";
            this.btnSearch.Size = new System.Drawing.Size(75, 23);
            this.btnSearch.TabIndex = 5;
            this.btnSearch.Text = "搜索";
            this.btnSearch.UseVisualStyleBackColor = true;
            this.btnSearch.Click += new System.EventHandler(this.btnSearch_Click);
            // 
            // groupBox4
            // 
            this.groupBox4.Controls.Add(this.btnStop);
            this.groupBox4.Controls.Add(this.cmbDrives);
            this.groupBox4.Controls.Add(this.btnSearch);
            this.groupBox4.Location = new System.Drawing.Point(12, 355);
            this.groupBox4.Name = "groupBox4";
            this.groupBox4.Size = new System.Drawing.Size(240, 100);
            this.groupBox4.TabIndex = 6;
            this.groupBox4.TabStop = false;
            this.groupBox4.Text = "搜索";
            // 
            // btnStop
            // 
            this.btnStop.Location = new System.Drawing.Point(6, 49);
            this.btnStop.Name = "btnStop";
            this.btnStop.Size = new System.Drawing.Size(75, 23);
            this.btnStop.TabIndex = 7;
            this.btnStop.Text = "停止";
            this.btnStop.UseVisualStyleBackColor = true;
            this.btnStop.Click += new System.EventHandler(this.btnStop_Click);
            // 
            // cmbDrives
            // 
            this.cmbDrives.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbDrives.FormattingEnabled = true;
            this.cmbDrives.Location = new System.Drawing.Point(87, 20);
            this.cmbDrives.Name = "cmbDrives";
            this.cmbDrives.Size = new System.Drawing.Size(141, 20);
            this.cmbDrives.TabIndex = 6;
            this.cmbDrives.SelectedIndexChanged += new System.EventHandler(this.cmbDrives_SelectedIndexChanged);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(924, 479);
            this.Controls.Add(this.groupBox4);
            this.Controls.Add(this.groupBox3);
            this.Controls.Add(this.groupBox2);
            this.Controls.Add(this.gbConfig);
            this.Controls.Add(this.groupBox1);
            this.Name = "Form1";
            this.Text = "Form1C# - Demo总成";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.Form1_FormClosing);
            this.Load += new System.EventHandler(this.Form1_Load);
            this.groupBox1.ResumeLayout(false);
            this.gbConfig.ResumeLayout(false);
            this.gbConfig.PerformLayout();
            this.gbUDP.ResumeLayout(false);
            this.gbUDP.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.TxtIPPort_UDP)).EndInit();
            this.gbCOM.ResumeLayout(false);
            this.gbCOM.PerformLayout();
            this.gbTCPClient.ResumeLayout(false);
            this.gbTCPClient.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.TxtIPPort_TCPClient)).EndInit();
            this.gbTCPServer.ResumeLayout(false);
            this.gbTCPServer.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.TxtServerPort)).EndInit();
            this.groupBox2.ResumeLayout(false);
            this.groupBox3.ResumeLayout(false);
            this.groupBox4.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button btnOpenDoors;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.GroupBox gbConfig;
        private System.Windows.Forms.RadioButton ChkUDP;
        private System.Windows.Forms.RadioButton ChkCOM;
        private System.Windows.Forms.RadioButton ChkTCPServer;
        private System.Windows.Forms.RadioButton ChkTCPClient;
        private System.Windows.Forms.GroupBox gbUDP;
        private System.Windows.Forms.GroupBox gbCOM;
        private System.Windows.Forms.GroupBox gbTCPClient;
        private System.Windows.Forms.GroupBox gbTCPServer;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox TxtIPAddr_TCPClient;
        private System.Windows.Forms.NumericUpDown TxtIPPort_TCPClient;
        private System.Windows.Forms.Button btnRefresh;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.ComboBox CmbSerialPort;
        private System.Windows.Forms.NumericUpDown TxtIPPort_UDP;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.TextBox TxtIPAddr_UDP;
        private System.Windows.Forms.CheckBox ChkBroadcast;
        private System.Windows.Forms.TextBox TxtConnPassword;
        private System.Windows.Forms.TextBox TxtConnSN;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Button btnCloseDoor;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.Button btnCardReadAll;
        private System.Windows.Forms.ComboBox CmbOptCardMode;
        private System.Windows.Forms.Button btnCardWrite;
        private System.Windows.Forms.Button btnWriteSortCardList;
        private System.Windows.Forms.Button btnCardClear;
        private System.Windows.Forms.GroupBox groupBox3;
        private System.Windows.Forms.Button btnReadAutoTimeRepair;
        private System.Windows.Forms.Button btnReadTime;
        private System.Windows.Forms.Button btnWriteAutoTimeRepair;
        private System.Windows.Forms.Button btnWriteTimeDefine;
        private System.Windows.Forms.Button btnWriteTime;
        private System.Windows.Forms.Button btnSearch;
        private System.Windows.Forms.GroupBox groupBox4;
        private System.Windows.Forms.ComboBox cmbDrives;
        private System.Windows.Forms.Button btnStop;
        private System.Windows.Forms.NumericUpDown TxtServerPort;
        private System.Windows.Forms.Button btnBeginServer;
        private System.Windows.Forms.Label label8;
    }
}


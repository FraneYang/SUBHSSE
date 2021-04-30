<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class Form1
    Inherits System.Windows.Forms.Form

    'Form 重写 Dispose，以清理组件列表。
    <System.Diagnostics.DebuggerNonUserCode()> _
    Protected Overrides Sub Dispose(ByVal disposing As Boolean)
        Try
            If disposing AndAlso components IsNot Nothing Then
                components.Dispose()
            End If
        Finally
            MyBase.Dispose(disposing)
        End Try
    End Sub

    'Windows 窗体设计器所必需的
    Private components As System.ComponentModel.IContainer

    '注意: 以下过程是 Windows 窗体设计器所必需的
    '可以使用 Windows 窗体设计器修改它。  
    '不要使用代码编辑器修改它。
    <System.Diagnostics.DebuggerStepThrough()> _
    Private Sub InitializeComponent()
        Me.groupBox3 = New System.Windows.Forms.GroupBox()
        Me.btnReadAutoTimeRepair = New System.Windows.Forms.Button()
        Me.btnReadTime = New System.Windows.Forms.Button()
        Me.btnWriteAutoTimeRepair = New System.Windows.Forms.Button()
        Me.btnWriteTimeDefine = New System.Windows.Forms.Button()
        Me.btnWriteTime = New System.Windows.Forms.Button()
        Me.groupBox2 = New System.Windows.Forms.GroupBox()
        Me.btnCardClear = New System.Windows.Forms.Button()
        Me.btnCardWrite = New System.Windows.Forms.Button()
        Me.btnWriteSortCardList = New System.Windows.Forms.Button()
        Me.btnCardReadAll = New System.Windows.Forms.Button()
        Me.CmbOptCardMode = New System.Windows.Forms.ComboBox()
        Me.gbConfig = New System.Windows.Forms.GroupBox()
        Me.gbUDP = New System.Windows.Forms.GroupBox()
        Me.TxtIPPort_UDP = New System.Windows.Forms.NumericUpDown()
        Me.label5 = New System.Windows.Forms.Label()
        Me.label4 = New System.Windows.Forms.Label()
        Me.TxtIPAddr_UDP = New System.Windows.Forms.TextBox()
        Me.ChkBroadcast = New System.Windows.Forms.CheckBox()
        Me.TxtConnPassword = New System.Windows.Forms.TextBox()
        Me.TxtConnSN = New System.Windows.Forms.TextBox()
        Me.label7 = New System.Windows.Forms.Label()
        Me.label6 = New System.Windows.Forms.Label()
        Me.gbCOM = New System.Windows.Forms.GroupBox()
        Me.btnRefresh = New System.Windows.Forms.Button()
        Me.label3 = New System.Windows.Forms.Label()
        Me.CmbSerialPort = New System.Windows.Forms.ComboBox()
        Me.gbTCPClient = New System.Windows.Forms.GroupBox()
        Me.TxtIPPort_TCPClient = New System.Windows.Forms.NumericUpDown()
        Me.label2 = New System.Windows.Forms.Label()
        Me.label1 = New System.Windows.Forms.Label()
        Me.TxtIPAddr_TCPClient = New System.Windows.Forms.TextBox()
        Me.gbTCPServer = New System.Windows.Forms.GroupBox()
        Me.TxtServerPort = New System.Windows.Forms.NumericUpDown()
        Me.btnBeginServer = New System.Windows.Forms.Button()
        Me.label8 = New System.Windows.Forms.Label()
        Me.ChkUDP = New System.Windows.Forms.RadioButton()
        Me.ChkCOM = New System.Windows.Forms.RadioButton()
        Me.ChkTCPServer = New System.Windows.Forms.RadioButton()
        Me.ChkTCPClient = New System.Windows.Forms.RadioButton()
        Me.groupBox1 = New System.Windows.Forms.GroupBox()
        Me.btnCloseDoor = New System.Windows.Forms.Button()
        Me.btnOpenDoors = New System.Windows.Forms.Button()
        Me.groupBox4 = New System.Windows.Forms.GroupBox()
        Me.btnStop = New System.Windows.Forms.Button()
        Me.cmbDrives = New System.Windows.Forms.ComboBox()
        Me.btnSearch = New System.Windows.Forms.Button()
        Me.groupBox3.SuspendLayout()
        Me.groupBox2.SuspendLayout()
        Me.gbConfig.SuspendLayout()
        Me.gbUDP.SuspendLayout()
        CType(Me.TxtIPPort_UDP, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.gbCOM.SuspendLayout()
        Me.gbTCPClient.SuspendLayout()
        CType(Me.TxtIPPort_TCPClient, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.gbTCPServer.SuspendLayout()
        CType(Me.TxtServerPort, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.groupBox1.SuspendLayout()
        Me.groupBox4.SuspendLayout()
        Me.SuspendLayout()
        '
        'groupBox3
        '
        Me.groupBox3.Controls.Add(Me.btnReadAutoTimeRepair)
        Me.groupBox3.Controls.Add(Me.btnReadTime)
        Me.groupBox3.Controls.Add(Me.btnWriteAutoTimeRepair)
        Me.groupBox3.Controls.Add(Me.btnWriteTimeDefine)
        Me.groupBox3.Controls.Add(Me.btnWriteTime)
        Me.groupBox3.Location = New System.Drawing.Point(493, 226)
        Me.groupBox3.Name = "groupBox3"
        Me.groupBox3.Size = New System.Drawing.Size(215, 137)
        Me.groupBox3.TabIndex = 8
        Me.groupBox3.TabStop = False
        Me.groupBox3.Text = "日期时间"
        '
        'btnReadAutoTimeRepair
        '
        Me.btnReadAutoTimeRepair.Location = New System.Drawing.Point(109, 79)
        Me.btnReadAutoTimeRepair.Name = "btnReadAutoTimeRepair"
        Me.btnReadAutoTimeRepair.Size = New System.Drawing.Size(87, 23)
        Me.btnReadAutoTimeRepair.TabIndex = 4
        Me.btnReadAutoTimeRepair.Text = "读取修正参数"
        Me.btnReadAutoTimeRepair.UseVisualStyleBackColor = True
        '
        'btnReadTime
        '
        Me.btnReadTime.Location = New System.Drawing.Point(109, 20)
        Me.btnReadTime.Name = "btnReadTime"
        Me.btnReadTime.Size = New System.Drawing.Size(87, 23)
        Me.btnReadTime.TabIndex = 3
        Me.btnReadTime.Text = "读取时间"
        Me.btnReadTime.UseVisualStyleBackColor = True
        '
        'btnWriteAutoTimeRepair
        '
        Me.btnWriteAutoTimeRepair.Location = New System.Drawing.Point(15, 79)
        Me.btnWriteAutoTimeRepair.Name = "btnWriteAutoTimeRepair"
        Me.btnWriteAutoTimeRepair.Size = New System.Drawing.Size(88, 23)
        Me.btnWriteAutoTimeRepair.TabIndex = 2
        Me.btnWriteAutoTimeRepair.Text = "自修正"
        Me.btnWriteAutoTimeRepair.UseVisualStyleBackColor = True
        '
        'btnWriteTimeDefine
        '
        Me.btnWriteTimeDefine.Location = New System.Drawing.Point(15, 50)
        Me.btnWriteTimeDefine.Name = "btnWriteTimeDefine"
        Me.btnWriteTimeDefine.Size = New System.Drawing.Size(88, 23)
        Me.btnWriteTimeDefine.TabIndex = 1
        Me.btnWriteTimeDefine.Text = "自定义时间"
        Me.btnWriteTimeDefine.UseVisualStyleBackColor = True
        '
        'btnWriteTime
        '
        Me.btnWriteTime.Location = New System.Drawing.Point(15, 20)
        Me.btnWriteTime.Name = "btnWriteTime"
        Me.btnWriteTime.Size = New System.Drawing.Size(88, 23)
        Me.btnWriteTime.TabIndex = 0
        Me.btnWriteTime.Text = "电脑时间校准"
        Me.btnWriteTime.UseVisualStyleBackColor = True
        '
        'groupBox2
        '
        Me.groupBox2.Controls.Add(Me.btnCardClear)
        Me.groupBox2.Controls.Add(Me.btnCardWrite)
        Me.groupBox2.Controls.Add(Me.btnWriteSortCardList)
        Me.groupBox2.Controls.Add(Me.btnCardReadAll)
        Me.groupBox2.Controls.Add(Me.CmbOptCardMode)
        Me.groupBox2.Location = New System.Drawing.Point(253, 226)
        Me.groupBox2.Name = "groupBox2"
        Me.groupBox2.Size = New System.Drawing.Size(217, 137)
        Me.groupBox2.TabIndex = 7
        Me.groupBox2.TabStop = False
        Me.groupBox2.Text = "卡片操作"
        '
        'btnCardClear
        '
        Me.btnCardClear.Location = New System.Drawing.Point(111, 104)
        Me.btnCardClear.Name = "btnCardClear"
        Me.btnCardClear.Size = New System.Drawing.Size(97, 23)
        Me.btnCardClear.TabIndex = 3
        Me.btnCardClear.Text = "清空卡片"
        Me.btnCardClear.UseVisualStyleBackColor = True
        '
        'btnCardWrite
        '
        Me.btnCardWrite.Location = New System.Drawing.Point(111, 75)
        Me.btnCardWrite.Name = "btnCardWrite"
        Me.btnCardWrite.Size = New System.Drawing.Size(97, 23)
        Me.btnCardWrite.TabIndex = 2
        Me.btnCardWrite.Text = "上传至非排序区"
        Me.btnCardWrite.UseVisualStyleBackColor = True
        '
        'btnWriteSortCardList
        '
        Me.btnWriteSortCardList.Location = New System.Drawing.Point(111, 46)
        Me.btnWriteSortCardList.Name = "btnWriteSortCardList"
        Me.btnWriteSortCardList.Size = New System.Drawing.Size(97, 23)
        Me.btnWriteSortCardList.TabIndex = 1
        Me.btnWriteSortCardList.Text = "上传至排序区"
        Me.btnWriteSortCardList.UseVisualStyleBackColor = True
        '
        'btnCardReadAll
        '
        Me.btnCardReadAll.Location = New System.Drawing.Point(111, 17)
        Me.btnCardReadAll.Name = "btnCardReadAll"
        Me.btnCardReadAll.Size = New System.Drawing.Size(97, 23)
        Me.btnCardReadAll.TabIndex = 0
        Me.btnCardReadAll.Text = "读所有名单"
        Me.btnCardReadAll.UseVisualStyleBackColor = True
        '
        'CmbOptCardMode
        '
        Me.CmbOptCardMode.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList
        Me.CmbOptCardMode.FormattingEnabled = True
        Me.CmbOptCardMode.Items.AddRange(New Object() {"排序区", "非排序区", "全部区域"})
        Me.CmbOptCardMode.Location = New System.Drawing.Point(8, 20)
        Me.CmbOptCardMode.Name = "CmbOptCardMode"
        Me.CmbOptCardMode.Size = New System.Drawing.Size(97, 20)
        Me.CmbOptCardMode.TabIndex = 0
        '
        'gbConfig
        '
        Me.gbConfig.Controls.Add(Me.gbUDP)
        Me.gbConfig.Controls.Add(Me.TxtConnPassword)
        Me.gbConfig.Controls.Add(Me.TxtConnSN)
        Me.gbConfig.Controls.Add(Me.label7)
        Me.gbConfig.Controls.Add(Me.label6)
        Me.gbConfig.Controls.Add(Me.gbCOM)
        Me.gbConfig.Controls.Add(Me.gbTCPClient)
        Me.gbConfig.Controls.Add(Me.gbTCPServer)
        Me.gbConfig.Controls.Add(Me.ChkUDP)
        Me.gbConfig.Controls.Add(Me.ChkCOM)
        Me.gbConfig.Controls.Add(Me.ChkTCPServer)
        Me.gbConfig.Controls.Add(Me.ChkTCPClient)
        Me.gbConfig.Location = New System.Drawing.Point(24, 12)
        Me.gbConfig.Name = "gbConfig"
        Me.gbConfig.Size = New System.Drawing.Size(889, 203)
        Me.gbConfig.TabIndex = 6
        Me.gbConfig.TabStop = False
        Me.gbConfig.Text = "通讯参数"
        '
        'gbUDP
        '
        Me.gbUDP.Controls.Add(Me.TxtIPPort_UDP)
        Me.gbUDP.Controls.Add(Me.label5)
        Me.gbUDP.Controls.Add(Me.label4)
        Me.gbUDP.Controls.Add(Me.TxtIPAddr_UDP)
        Me.gbUDP.Controls.Add(Me.ChkBroadcast)
        Me.gbUDP.Location = New System.Drawing.Point(246, 51)
        Me.gbUDP.Name = "gbUDP"
        Me.gbUDP.Size = New System.Drawing.Size(200, 100)
        Me.gbUDP.TabIndex = 3
        Me.gbUDP.TabStop = False
        Me.gbUDP.Text = "UDP"
        Me.gbUDP.Visible = False
        '
        'TxtIPPort_UDP
        '
        Me.TxtIPPort_UDP.Location = New System.Drawing.Point(46, 50)
        Me.TxtIPPort_UDP.Maximum = New Decimal(New Integer() {65535, 0, 0, 0})
        Me.TxtIPPort_UDP.Minimum = New Decimal(New Integer() {1, 0, 0, 0})
        Me.TxtIPPort_UDP.Name = "TxtIPPort_UDP"
        Me.TxtIPPort_UDP.Size = New System.Drawing.Size(120, 21)
        Me.TxtIPPort_UDP.TabIndex = 2
        Me.TxtIPPort_UDP.Value = New Decimal(New Integer() {8101, 0, 0, 0})
        '
        'label5
        '
        Me.label5.AutoSize = True
        Me.label5.Location = New System.Drawing.Point(6, 56)
        Me.label5.Name = "label5"
        Me.label5.Size = New System.Drawing.Size(35, 12)
        Me.label5.TabIndex = 2
        Me.label5.Text = "端口:"
        '
        'label4
        '
        Me.label4.AutoSize = True
        Me.label4.Location = New System.Drawing.Point(6, 20)
        Me.label4.Name = "label4"
        Me.label4.Size = New System.Drawing.Size(23, 12)
        Me.label4.TabIndex = 1
        Me.label4.Text = "IP:"
        '
        'TxtIPAddr_UDP
        '
        Me.TxtIPAddr_UDP.Location = New System.Drawing.Point(46, 17)
        Me.TxtIPAddr_UDP.Name = "TxtIPAddr_UDP"
        Me.TxtIPAddr_UDP.Size = New System.Drawing.Size(154, 21)
        Me.TxtIPAddr_UDP.TabIndex = 1
        '
        'ChkBroadcast
        '
        Me.ChkBroadcast.AutoSize = True
        Me.ChkBroadcast.Checked = True
        Me.ChkBroadcast.CheckState = System.Windows.Forms.CheckState.Checked
        Me.ChkBroadcast.Location = New System.Drawing.Point(46, 78)
        Me.ChkBroadcast.Name = "ChkBroadcast"
        Me.ChkBroadcast.Size = New System.Drawing.Size(48, 16)
        Me.ChkBroadcast.TabIndex = 0
        Me.ChkBroadcast.Text = "广播"
        Me.ChkBroadcast.UseVisualStyleBackColor = True
        '
        'TxtConnPassword
        '
        Me.TxtConnPassword.Location = New System.Drawing.Point(65, 178)
        Me.TxtConnPassword.Name = "TxtConnPassword"
        Me.TxtConnPassword.Size = New System.Drawing.Size(158, 21)
        Me.TxtConnPassword.TabIndex = 6
        Me.TxtConnPassword.Text = "FFFFFFFF"
        '
        'TxtConnSN
        '
        Me.TxtConnSN.Location = New System.Drawing.Point(65, 153)
        Me.TxtConnSN.Name = "TxtConnSN"
        Me.TxtConnSN.Size = New System.Drawing.Size(158, 21)
        Me.TxtConnSN.TabIndex = 6
        Me.TxtConnSN.Text = "MC-5824T25070244"
        '
        'label7
        '
        Me.label7.AutoSize = True
        Me.label7.Location = New System.Drawing.Point(15, 181)
        Me.label7.Name = "label7"
        Me.label7.Size = New System.Drawing.Size(35, 12)
        Me.label7.TabIndex = 5
        Me.label7.Text = "密码:"
        '
        'label6
        '
        Me.label6.AutoSize = True
        Me.label6.Location = New System.Drawing.Point(15, 156)
        Me.label6.Name = "label6"
        Me.label6.Size = New System.Drawing.Size(23, 12)
        Me.label6.TabIndex = 4
        Me.label6.Text = "SN:"
        '
        'gbCOM
        '
        Me.gbCOM.Controls.Add(Me.btnRefresh)
        Me.gbCOM.Controls.Add(Me.label3)
        Me.gbCOM.Controls.Add(Me.CmbSerialPort)
        Me.gbCOM.Location = New System.Drawing.Point(675, 51)
        Me.gbCOM.Name = "gbCOM"
        Me.gbCOM.Size = New System.Drawing.Size(200, 100)
        Me.gbCOM.TabIndex = 3
        Me.gbCOM.TabStop = False
        Me.gbCOM.Text = "COM"
        Me.gbCOM.Visible = False
        '
        'btnRefresh
        '
        Me.btnRefresh.Location = New System.Drawing.Point(151, 39)
        Me.btnRefresh.Name = "btnRefresh"
        Me.btnRefresh.Size = New System.Drawing.Size(43, 23)
        Me.btnRefresh.TabIndex = 2
        Me.btnRefresh.Text = "刷新"
        Me.btnRefresh.UseVisualStyleBackColor = True
        '
        'label3
        '
        Me.label3.AutoSize = True
        Me.label3.Location = New System.Drawing.Point(10, 46)
        Me.label3.Name = "label3"
        Me.label3.Size = New System.Drawing.Size(29, 12)
        Me.label3.TabIndex = 1
        Me.label3.Text = "COM:"
        '
        'CmbSerialPort
        '
        Me.CmbSerialPort.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList
        Me.CmbSerialPort.FormattingEnabled = True
        Me.CmbSerialPort.Location = New System.Drawing.Point(48, 42)
        Me.CmbSerialPort.Name = "CmbSerialPort"
        Me.CmbSerialPort.Size = New System.Drawing.Size(97, 20)
        Me.CmbSerialPort.TabIndex = 0
        '
        'gbTCPClient
        '
        Me.gbTCPClient.Controls.Add(Me.TxtIPPort_TCPClient)
        Me.gbTCPClient.Controls.Add(Me.label2)
        Me.gbTCPClient.Controls.Add(Me.label1)
        Me.gbTCPClient.Controls.Add(Me.TxtIPAddr_TCPClient)
        Me.gbTCPClient.Location = New System.Drawing.Point(23, 51)
        Me.gbTCPClient.Name = "gbTCPClient"
        Me.gbTCPClient.Size = New System.Drawing.Size(200, 100)
        Me.gbTCPClient.TabIndex = 3
        Me.gbTCPClient.TabStop = False
        Me.gbTCPClient.Text = "TCPClient"
        '
        'TxtIPPort_TCPClient
        '
        Me.TxtIPPort_TCPClient.Location = New System.Drawing.Point(47, 61)
        Me.TxtIPPort_TCPClient.Maximum = New Decimal(New Integer() {65535, 0, 0, 0})
        Me.TxtIPPort_TCPClient.Minimum = New Decimal(New Integer() {1, 0, 0, 0})
        Me.TxtIPPort_TCPClient.Name = "TxtIPPort_TCPClient"
        Me.TxtIPPort_TCPClient.Size = New System.Drawing.Size(120, 21)
        Me.TxtIPPort_TCPClient.TabIndex = 3
        Me.TxtIPPort_TCPClient.Value = New Decimal(New Integer() {8000, 0, 0, 0})
        '
        'label2
        '
        Me.label2.AutoSize = True
        Me.label2.Location = New System.Drawing.Point(6, 63)
        Me.label2.Name = "label2"
        Me.label2.Size = New System.Drawing.Size(35, 12)
        Me.label2.TabIndex = 2
        Me.label2.Text = "端口:"
        '
        'label1
        '
        Me.label1.AutoSize = True
        Me.label1.Location = New System.Drawing.Point(6, 23)
        Me.label1.Name = "label1"
        Me.label1.Size = New System.Drawing.Size(23, 12)
        Me.label1.TabIndex = 1
        Me.label1.Text = "IP:"
        '
        'TxtIPAddr_TCPClient
        '
        Me.TxtIPAddr_TCPClient.Location = New System.Drawing.Point(42, 20)
        Me.TxtIPAddr_TCPClient.Name = "TxtIPAddr_TCPClient"
        Me.TxtIPAddr_TCPClient.Size = New System.Drawing.Size(152, 21)
        Me.TxtIPAddr_TCPClient.TabIndex = 0
        Me.TxtIPAddr_TCPClient.Text = "192.168.1.116"
        '
        'gbTCPServer
        '
        Me.gbTCPServer.Controls.Add(Me.TxtServerPort)
        Me.gbTCPServer.Controls.Add(Me.btnBeginServer)
        Me.gbTCPServer.Controls.Add(Me.label8)
        Me.gbTCPServer.Location = New System.Drawing.Point(469, 51)
        Me.gbTCPServer.Name = "gbTCPServer"
        Me.gbTCPServer.Size = New System.Drawing.Size(200, 100)
        Me.gbTCPServer.TabIndex = 3
        Me.gbTCPServer.TabStop = False
        Me.gbTCPServer.Text = "TCPServer"
        Me.gbTCPServer.Visible = False
        '
        'TxtServerPort
        '
        Me.TxtServerPort.Location = New System.Drawing.Point(52, 41)
        Me.TxtServerPort.Maximum = New Decimal(New Integer() {65535, 0, 0, 0})
        Me.TxtServerPort.Minimum = New Decimal(New Integer() {1, 0, 0, 0})
        Me.TxtServerPort.Name = "TxtServerPort"
        Me.TxtServerPort.Size = New System.Drawing.Size(55, 21)
        Me.TxtServerPort.TabIndex = 3
        Me.TxtServerPort.Value = New Decimal(New Integer() {9010, 0, 0, 0})
        '
        'btnBeginServer
        '
        Me.btnBeginServer.Location = New System.Drawing.Point(113, 39)
        Me.btnBeginServer.Name = "btnBeginServer"
        Me.btnBeginServer.Size = New System.Drawing.Size(75, 23)
        Me.btnBeginServer.TabIndex = 2
        Me.btnBeginServer.Text = "开启服务"
        Me.btnBeginServer.UseVisualStyleBackColor = True
        '
        'label8
        '
        Me.label8.AutoSize = True
        Me.label8.Location = New System.Drawing.Point(13, 44)
        Me.label8.Name = "label8"
        Me.label8.Size = New System.Drawing.Size(35, 12)
        Me.label8.TabIndex = 4
        Me.label8.Text = "端口:"
        '
        'ChkUDP
        '
        Me.ChkUDP.AutoSize = True
        Me.ChkUDP.Location = New System.Drawing.Point(246, 20)
        Me.ChkUDP.Name = "ChkUDP"
        Me.ChkUDP.Size = New System.Drawing.Size(41, 16)
        Me.ChkUDP.TabIndex = 2
        Me.ChkUDP.Text = "UDP"
        Me.ChkUDP.UseVisualStyleBackColor = True
        '
        'ChkCOM
        '
        Me.ChkCOM.AutoSize = True
        Me.ChkCOM.Location = New System.Drawing.Point(187, 20)
        Me.ChkCOM.Name = "ChkCOM"
        Me.ChkCOM.Size = New System.Drawing.Size(53, 16)
        Me.ChkCOM.TabIndex = 2
        Me.ChkCOM.Text = "RS485"
        Me.ChkCOM.UseVisualStyleBackColor = True
        '
        'ChkTCPServer
        '
        Me.ChkTCPServer.AutoSize = True
        Me.ChkTCPServer.Location = New System.Drawing.Point(104, 20)
        Me.ChkTCPServer.Name = "ChkTCPServer"
        Me.ChkTCPServer.Size = New System.Drawing.Size(77, 16)
        Me.ChkTCPServer.TabIndex = 1
        Me.ChkTCPServer.Text = "TCPServer"
        Me.ChkTCPServer.UseVisualStyleBackColor = True
        '
        'ChkTCPClient
        '
        Me.ChkTCPClient.AutoSize = True
        Me.ChkTCPClient.Checked = True
        Me.ChkTCPClient.Location = New System.Drawing.Point(21, 20)
        Me.ChkTCPClient.Name = "ChkTCPClient"
        Me.ChkTCPClient.Size = New System.Drawing.Size(77, 16)
        Me.ChkTCPClient.TabIndex = 0
        Me.ChkTCPClient.TabStop = True
        Me.ChkTCPClient.Text = "TCPClient"
        Me.ChkTCPClient.UseVisualStyleBackColor = True
        '
        'groupBox1
        '
        Me.groupBox1.Controls.Add(Me.btnCloseDoor)
        Me.groupBox1.Controls.Add(Me.btnOpenDoors)
        Me.groupBox1.Location = New System.Drawing.Point(24, 226)
        Me.groupBox1.Name = "groupBox1"
        Me.groupBox1.Size = New System.Drawing.Size(202, 64)
        Me.groupBox1.TabIndex = 5
        Me.groupBox1.TabStop = False
        Me.groupBox1.Text = "门操作"
        '
        'btnCloseDoor
        '
        Me.btnCloseDoor.Location = New System.Drawing.Point(104, 29)
        Me.btnCloseDoor.Name = "btnCloseDoor"
        Me.btnCloseDoor.Size = New System.Drawing.Size(75, 23)
        Me.btnCloseDoor.TabIndex = 0
        Me.btnCloseDoor.Text = "关门"
        Me.btnCloseDoor.UseVisualStyleBackColor = True
        '
        'btnOpenDoors
        '
        Me.btnOpenDoors.Location = New System.Drawing.Point(23, 29)
        Me.btnOpenDoors.Name = "btnOpenDoors"
        Me.btnOpenDoors.Size = New System.Drawing.Size(75, 23)
        Me.btnOpenDoors.TabIndex = 0
        Me.btnOpenDoors.Text = "开门"
        Me.btnOpenDoors.UseVisualStyleBackColor = True
        '
        'groupBox4
        '
        Me.groupBox4.Controls.Add(Me.btnStop)
        Me.groupBox4.Controls.Add(Me.cmbDrives)
        Me.groupBox4.Controls.Add(Me.btnSearch)
        Me.groupBox4.Location = New System.Drawing.Point(12, 315)
        Me.groupBox4.Name = "groupBox4"
        Me.groupBox4.Size = New System.Drawing.Size(240, 100)
        Me.groupBox4.TabIndex = 9
        Me.groupBox4.TabStop = False
        Me.groupBox4.Text = "搜索"
        '
        'btnStop
        '
        Me.btnStop.Location = New System.Drawing.Point(6, 49)
        Me.btnStop.Name = "btnStop"
        Me.btnStop.Size = New System.Drawing.Size(75, 23)
        Me.btnStop.TabIndex = 7
        Me.btnStop.Text = "停止"
        Me.btnStop.UseVisualStyleBackColor = True
        '
        'cmbDrives
        '
        Me.cmbDrives.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList
        Me.cmbDrives.FormattingEnabled = True
        Me.cmbDrives.Location = New System.Drawing.Point(87, 20)
        Me.cmbDrives.Name = "cmbDrives"
        Me.cmbDrives.Size = New System.Drawing.Size(141, 20)
        Me.cmbDrives.TabIndex = 6
        '
        'btnSearch
        '
        Me.btnSearch.Location = New System.Drawing.Point(6, 20)
        Me.btnSearch.Name = "btnSearch"
        Me.btnSearch.Size = New System.Drawing.Size(75, 23)
        Me.btnSearch.TabIndex = 5
        Me.btnSearch.Text = "搜索"
        Me.btnSearch.UseVisualStyleBackColor = True
        '
        'Form1
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 12.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(934, 459)
        Me.Controls.Add(Me.groupBox4)
        Me.Controls.Add(Me.groupBox3)
        Me.Controls.Add(Me.groupBox2)
        Me.Controls.Add(Me.gbConfig)
        Me.Controls.Add(Me.groupBox1)
        Me.Name = "Form1"
        Me.Text = "Form1VB - Demo总成"
        Me.groupBox3.ResumeLayout(False)
        Me.groupBox2.ResumeLayout(False)
        Me.gbConfig.ResumeLayout(False)
        Me.gbConfig.PerformLayout()
        Me.gbUDP.ResumeLayout(False)
        Me.gbUDP.PerformLayout()
        CType(Me.TxtIPPort_UDP, System.ComponentModel.ISupportInitialize).EndInit()
        Me.gbCOM.ResumeLayout(False)
        Me.gbCOM.PerformLayout()
        Me.gbTCPClient.ResumeLayout(False)
        Me.gbTCPClient.PerformLayout()
        CType(Me.TxtIPPort_TCPClient, System.ComponentModel.ISupportInitialize).EndInit()
        Me.gbTCPServer.ResumeLayout(False)
        Me.gbTCPServer.PerformLayout()
        CType(Me.TxtServerPort, System.ComponentModel.ISupportInitialize).EndInit()
        Me.groupBox1.ResumeLayout(False)
        Me.groupBox4.ResumeLayout(False)
        Me.ResumeLayout(False)

    End Sub

    Private WithEvents groupBox3 As GroupBox
    Private WithEvents btnReadAutoTimeRepair As Button
    Private WithEvents btnReadTime As Button
    Private WithEvents btnWriteAutoTimeRepair As Button
    Private WithEvents btnWriteTimeDefine As Button
    Private WithEvents btnWriteTime As Button
    Private WithEvents groupBox2 As GroupBox
    Private WithEvents btnCardClear As Button
    Private WithEvents btnCardWrite As Button
    Private WithEvents btnWriteSortCardList As Button
    Private WithEvents btnCardReadAll As Button
    Private WithEvents CmbOptCardMode As ComboBox
    Private WithEvents gbConfig As GroupBox
    Private WithEvents gbUDP As GroupBox
    Private WithEvents TxtIPPort_UDP As NumericUpDown
    Private WithEvents label5 As Label
    Private WithEvents label4 As Label
    Private WithEvents TxtIPAddr_UDP As TextBox
    Private WithEvents ChkBroadcast As CheckBox
    Private WithEvents TxtConnPassword As TextBox
    Private WithEvents TxtConnSN As TextBox
    Private WithEvents label7 As Label
    Private WithEvents label6 As Label
    Private WithEvents gbCOM As GroupBox
    Private WithEvents btnRefresh As Button
    Private WithEvents label3 As Label
    Private WithEvents CmbSerialPort As ComboBox
    Private WithEvents gbTCPClient As GroupBox
    Private WithEvents TxtIPPort_TCPClient As NumericUpDown
    Private WithEvents label2 As Label
    Private WithEvents label1 As Label
    Private WithEvents TxtIPAddr_TCPClient As TextBox
    Private WithEvents gbTCPServer As GroupBox
    Private WithEvents ChkUDP As RadioButton
    Private WithEvents ChkCOM As RadioButton
    Private WithEvents ChkTCPServer As RadioButton
    Private WithEvents ChkTCPClient As RadioButton
    Private WithEvents groupBox1 As GroupBox
    Private WithEvents btnCloseDoor As Button
    Private WithEvents btnOpenDoors As Button
    Private WithEvents groupBox4 As GroupBox
    Private WithEvents btnStop As Button
    Private WithEvents cmbDrives As ComboBox
    Private WithEvents btnSearch As Button
    Private WithEvents TxtServerPort As NumericUpDown
    Private WithEvents btnBeginServer As Button
    Private WithEvents label8 As Label
End Class

VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   4500
   ClientLeft      =   120
   ClientTop       =   465
   ClientWidth     =   9030
   LinkTopic       =   "Form1"
   ScaleHeight     =   4500
   ScaleWidth      =   9030
   StartUpPosition =   3  '窗口缺省
   Begin VB.CommandButton Command1 
      Caption         =   "Command1"
      Height          =   300
      Left            =   3600
      TabIndex        =   15
      Top             =   3000
      Width           =   975
   End
   Begin MSComCtl2.DTPicker DTPicker1 
      Height          =   255
      Left            =   2160
      TabIndex        =   14
      Top             =   3000
      Width           =   1335
      _ExtentX        =   2355
      _ExtentY        =   450
      _Version        =   393216
      Format          =   225050625
      CurrentDate     =   43161
   End
   Begin VB.Frame Frame2 
      Caption         =   "时间"
      Height          =   2055
      Left            =   5400
      TabIndex        =   8
      Top             =   120
      Width           =   3255
      Begin VB.CommandButton btnWriteAutoTimeRepair 
         Caption         =   "自修正"
         Height          =   375
         Left            =   240
         TabIndex        =   13
         Top             =   1440
         Width           =   1215
      End
      Begin VB.CommandButton btnWriteTimeDefine 
         Caption         =   "自定义时间"
         Height          =   375
         Left            =   240
         TabIndex        =   12
         Top             =   960
         Width           =   1215
      End
      Begin VB.CommandButton btnWriteTime 
         Caption         =   "电脑时间校准"
         Height          =   375
         Left            =   240
         TabIndex        =   11
         Top             =   360
         Width           =   1215
      End
      Begin VB.CommandButton btnReadAutoTimeRepair 
         Caption         =   "读取修正参数"
         Height          =   375
         Left            =   1920
         TabIndex        =   10
         Top             =   1440
         Width           =   1215
      End
      Begin VB.CommandButton btnReadTime 
         Caption         =   "读取时间"
         Height          =   375
         Left            =   1920
         TabIndex        =   9
         Top             =   360
         Width           =   1215
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "卡片操作"
      Height          =   2055
      Left            =   1560
      TabIndex        =   2
      Top             =   120
      Width           =   3615
      Begin VB.CommandButton btnCardClear 
         Caption         =   "清空卡"
         Height          =   375
         Left            =   1440
         TabIndex        =   7
         Top             =   1560
         Width           =   1335
      End
      Begin VB.CommandButton btnWriteSortCardList 
         Caption         =   "上传排序区"
         Height          =   375
         Left            =   1440
         TabIndex        =   6
         Top             =   1080
         Width           =   1335
      End
      Begin VB.CommandButton btnCardWrite 
         Caption         =   "上传非排序区"
         Height          =   375
         Left            =   1440
         TabIndex        =   5
         Top             =   600
         Width           =   1335
      End
      Begin VB.CommandButton btnReadCardData 
         Caption         =   "采集授权卡"
         Height          =   255
         Left            =   1440
         TabIndex        =   4
         Top             =   240
         Width           =   1335
      End
      Begin VB.ComboBox CmbDownloadEquptCardType 
         Height          =   300
         ItemData        =   "Form1.frx":0000
         Left            =   120
         List            =   "Form1.frx":000D
         TabIndex        =   3
         Text            =   "Combo1"
         Top             =   240
         Width           =   1335
      End
   End
   Begin VB.CommandButton btnCloseDoors 
      Caption         =   "远程关门"
      Height          =   495
      Left            =   120
      TabIndex        =   1
      Top             =   720
      Width           =   1215
   End
   Begin VB.CommandButton btnOpenDoors 
      Caption         =   "远程开门"
      Height          =   495
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   1215
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
    
    Dim WithEvents mIO As DriveMain
Attribute mIO.VB_VarHelpID = -1

Private Sub btnCardClear_Click()
    mIO.ClearCard MConn(3), GetDownloadEquptCardType
End Sub

Private Sub btnCardWrite_Click()
    Dim Cards As New DriveCardLists
    Dim oCard As DriveCard
    Set oCard = Cards.Add()
    With oCard
        .SetCardData 2345678 '设置卡号
    End With
    mIO.WriteUserCard MConn(3, 8), Cards
    
End Sub

Private Sub btnReadAutoTimeRepair_Click()
    '读取修正参数
    mIO.ReadTimePar MConn
End Sub

Private Sub btnReadTime_Click()
    '读取时间
    mIO.ReadTime MConn
End Sub

Private Sub btnWriteAutoTimeRepair_Click()
    Dim lTimeMode As Integer
    Dim lSecond As Integer
    lTimeMode = 1 '0：调慢，1：调快
    lSecond = 21 '0~255
    
    mIO.WriteTimePar MConn, lTimeMode, lSecond
End Sub

Private Sub btnWriteSortCardList_Click()
    Dim Cards As New DriveCardLists
    Dim oCard As DriveCard
    Set oCard = Cards.Add()
    With oCard
        .SetCardData 2345679 '设置卡号
    End With
    mIO.WriteSequenceCard MConn(3, 8), Cards
End Sub

'远程开门
Private Sub btnOpenDoors_Click()

    Dim oPortList As New FCDrive8800.DrivePortList

    
    oPortList.SetEquptType FC8800 '设置设备类型
    For i = 0 To 3
        oPortList.SetPortValue i + 1, 1 '设置所有门的开关状态
    Next
'    Dim oInfo As New FCDrive8800.DriveInfo
'    With oInfo
'        .EquptType = FC8800
'        .SN = "MC-5824T25070244"
'        .Password = "FFFFFFFF"
'        .IP = "192.168.1.116"
'        .NetPort = 8000
'        .ConnType = OnTCP
'    End With
    mIO.OpenDoor MConn, oPortList
End Sub

'远程关门
Private Sub btnCloseDoors_Click()
    Dim oPortList As New DrivePortList
    oPortList.SetEquptType FC8800
    For i = 0 To 3
        oPortList.SetPortValue i + 1, 1 '设置所有门的开关状态
    Next
    mIO.CloseDoor MConn, oPortList
End Sub


Private Function GetDownloadEquptCardType() As Long
    Select Case CmbDownloadEquptCardType.ListIndex
        Case 0 '排序卡
            GetDownloadEquptCardType = vbSequenceCard
        Case 1 '非排序卡
            GetDownloadEquptCardType = vbNoSequenceCard
        Case 2 '所有卡
            GetDownloadEquptCardType = vbEquptDownloadAllCard
    End Select
End Function
'获取连接参数对象
Private Function MConn(Optional ByVal lTimeOut As Long = -1, Optional ByVal lRCount As Long = 8) As DriveInfo
    '获得一个新的通讯信息
   
    Set MConn = New DriveInfo
'    lTimeOut = lTimeOut + 3

        MConn.ConnType = OnTCP
        MConn.IP = "192.168.1.126"
        MConn.NetPort = 8000
    
    MConn.BeginTime = Time
    MConn.BeginTimeSec = timeGetTime
    
    
    MConn.SN = "MC-5824T25070244" 'SN
    MConn.EquptType = FC8800

    MConn.Password = "FFFFFFFF" '密码
    
    MConn.RestartCount = lRCount '重试次数
    '超时
    If lTimeOut = -1 Then
        MConn.TimeOutMSEL = 5000
    Else
        lTimeOut = lTimeOut + 2
        MConn.TimeOutMSEL = lTimeOut * 1000
    End If
End Function


Private Sub GetSelectDoor(bDoor() As Boolean)
    '获得选中的门
    
    Dim i As Integer
    ReDim bDoor(3)
    
    For i = 0 To 3
        If ChkDoor(i).Value = 1 Then
            bDoor(i) = True
        Else
            bDoor(i) = False
        End If
    Next
End Sub



Private Sub btnReadCardData_Click()
    mIO.GetCards MConn(10), GetDownloadEquptCardType
End Sub




Private Sub btnWriteTime_Click()
    Dim oConn As DriveInfo
    Set oConn = MConn
    oConn.Name = Now
    mIO.WriteTime oConn
End Sub

Private Sub btnWriteTimeDefine_Click()
    Dim oConn As DriveInfo
    Dim dDate As Date
    dDate = "2001/06/01" '最小从2001年开始
    dDate = dDate + "12:12:12"
    Set oConn = MConn
    If Not oConn Is Nothing Then
        oConn.Name = dDate
        mIO.WriteTimeDefine oConn, dDate
    End If
End Sub



Private Sub Command1_Click()
    MsgBox DTPicker1.Value
End Sub

Private Sub Form_Load()
    Set mIO = New DriveMain '窗体加载事件，初始化命令发送对象
End Sub

Private Sub Form_Unload(Cancel As Integer)
    mIO.Unload '窗体关闭，释放资源
    Set mIO = Nothing
End Sub

Private Sub mIO_FrameAchieve(objConnInfo As FCDrive8800.DriveInfo, ByVal iFunc As Integer, ByVal sValue As String)
    Dim oValueList As DriveValueList
    Set oValueList = mIO.AchieveValuetoList(objConnInfo, iFunc, sValue)
    '自修正 （读取）
    If iFunc = 72 Then
        Dim s As Long
        Dim p As Long
        s = oValueList.GetValue_Num("Second")  '秒数
        p = oValueList.GetValue_Num("ParMode")  '模式
        MsgBox "修正值:" & s & "，" & "模式:" & p '输出
    ElseIf iFunc = 19 Then
        Dim t As String
        t = oValueList.GetValue_String("DateTime")  '时间
        MsgBox "t:" & t
    End If
    'MsgBox iFunc
    
    
End Sub

Private Sub mIO_PasswordErr(objConnInfo As FCDrive8800.DriveInfo, ByVal iFunc As Integer)
    'MsgBox "Password Error"
End Sub

Private Sub mIO_ReadCardAchieve(objConnInfo As FCDrive8800.DriveInfo, objCol As FCDrive8800.DriveCardLists)
    MsgBox "OK"
    'objCol.
End Sub

Private Sub mIO_ReadTimeGroupAchieve(objConnInfo As FCDrive8800.DriveInfo, objCol As FCDrive8800.DriveTimeGroupLists)
    MsgBox objCol.Item
    
End Sub

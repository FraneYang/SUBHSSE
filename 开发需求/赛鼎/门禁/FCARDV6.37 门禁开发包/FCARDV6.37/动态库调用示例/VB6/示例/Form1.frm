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
   StartUpPosition =   3  '����ȱʡ
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
      Caption         =   "ʱ��"
      Height          =   2055
      Left            =   5400
      TabIndex        =   8
      Top             =   120
      Width           =   3255
      Begin VB.CommandButton btnWriteAutoTimeRepair 
         Caption         =   "������"
         Height          =   375
         Left            =   240
         TabIndex        =   13
         Top             =   1440
         Width           =   1215
      End
      Begin VB.CommandButton btnWriteTimeDefine 
         Caption         =   "�Զ���ʱ��"
         Height          =   375
         Left            =   240
         TabIndex        =   12
         Top             =   960
         Width           =   1215
      End
      Begin VB.CommandButton btnWriteTime 
         Caption         =   "����ʱ��У׼"
         Height          =   375
         Left            =   240
         TabIndex        =   11
         Top             =   360
         Width           =   1215
      End
      Begin VB.CommandButton btnReadAutoTimeRepair 
         Caption         =   "��ȡ��������"
         Height          =   375
         Left            =   1920
         TabIndex        =   10
         Top             =   1440
         Width           =   1215
      End
      Begin VB.CommandButton btnReadTime 
         Caption         =   "��ȡʱ��"
         Height          =   375
         Left            =   1920
         TabIndex        =   9
         Top             =   360
         Width           =   1215
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "��Ƭ����"
      Height          =   2055
      Left            =   1560
      TabIndex        =   2
      Top             =   120
      Width           =   3615
      Begin VB.CommandButton btnCardClear 
         Caption         =   "��տ�"
         Height          =   375
         Left            =   1440
         TabIndex        =   7
         Top             =   1560
         Width           =   1335
      End
      Begin VB.CommandButton btnWriteSortCardList 
         Caption         =   "�ϴ�������"
         Height          =   375
         Left            =   1440
         TabIndex        =   6
         Top             =   1080
         Width           =   1335
      End
      Begin VB.CommandButton btnCardWrite 
         Caption         =   "�ϴ���������"
         Height          =   375
         Left            =   1440
         TabIndex        =   5
         Top             =   600
         Width           =   1335
      End
      Begin VB.CommandButton btnReadCardData 
         Caption         =   "�ɼ���Ȩ��"
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
      Caption         =   "Զ�̹���"
      Height          =   495
      Left            =   120
      TabIndex        =   1
      Top             =   720
      Width           =   1215
   End
   Begin VB.CommandButton btnOpenDoors 
      Caption         =   "Զ�̿���"
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
        .SetCardData 2345678 '���ÿ���
    End With
    mIO.WriteUserCard MConn(3, 8), Cards
    
End Sub

Private Sub btnReadAutoTimeRepair_Click()
    '��ȡ��������
    mIO.ReadTimePar MConn
End Sub

Private Sub btnReadTime_Click()
    '��ȡʱ��
    mIO.ReadTime MConn
End Sub

Private Sub btnWriteAutoTimeRepair_Click()
    Dim lTimeMode As Integer
    Dim lSecond As Integer
    lTimeMode = 1 '0��������1������
    lSecond = 21 '0~255
    
    mIO.WriteTimePar MConn, lTimeMode, lSecond
End Sub

Private Sub btnWriteSortCardList_Click()
    Dim Cards As New DriveCardLists
    Dim oCard As DriveCard
    Set oCard = Cards.Add()
    With oCard
        .SetCardData 2345679 '���ÿ���
    End With
    mIO.WriteSequenceCard MConn(3, 8), Cards
End Sub

'Զ�̿���
Private Sub btnOpenDoors_Click()

    Dim oPortList As New FCDrive8800.DrivePortList

    
    oPortList.SetEquptType FC8800 '�����豸����
    For i = 0 To 3
        oPortList.SetPortValue i + 1, 1 '���������ŵĿ���״̬
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

'Զ�̹���
Private Sub btnCloseDoors_Click()
    Dim oPortList As New DrivePortList
    oPortList.SetEquptType FC8800
    For i = 0 To 3
        oPortList.SetPortValue i + 1, 1 '���������ŵĿ���״̬
    Next
    mIO.CloseDoor MConn, oPortList
End Sub


Private Function GetDownloadEquptCardType() As Long
    Select Case CmbDownloadEquptCardType.ListIndex
        Case 0 '����
            GetDownloadEquptCardType = vbSequenceCard
        Case 1 '������
            GetDownloadEquptCardType = vbNoSequenceCard
        Case 2 '���п�
            GetDownloadEquptCardType = vbEquptDownloadAllCard
    End Select
End Function
'��ȡ���Ӳ�������
Private Function MConn(Optional ByVal lTimeOut As Long = -1, Optional ByVal lRCount As Long = 8) As DriveInfo
    '���һ���µ�ͨѶ��Ϣ
   
    Set MConn = New DriveInfo
'    lTimeOut = lTimeOut + 3

        MConn.ConnType = OnTCP
        MConn.IP = "192.168.1.126"
        MConn.NetPort = 8000
    
    MConn.BeginTime = Time
    MConn.BeginTimeSec = timeGetTime
    
    
    MConn.SN = "MC-5824T25070244" 'SN
    MConn.EquptType = FC8800

    MConn.Password = "FFFFFFFF" '����
    
    MConn.RestartCount = lRCount '���Դ���
    '��ʱ
    If lTimeOut = -1 Then
        MConn.TimeOutMSEL = 5000
    Else
        lTimeOut = lTimeOut + 2
        MConn.TimeOutMSEL = lTimeOut * 1000
    End If
End Function


Private Sub GetSelectDoor(bDoor() As Boolean)
    '���ѡ�е���
    
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
    dDate = "2001/06/01" '��С��2001�꿪ʼ
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
    Set mIO = New DriveMain '��������¼�����ʼ������Ͷ���
End Sub

Private Sub Form_Unload(Cancel As Integer)
    mIO.Unload '����رգ��ͷ���Դ
    Set mIO = Nothing
End Sub

Private Sub mIO_FrameAchieve(objConnInfo As FCDrive8800.DriveInfo, ByVal iFunc As Integer, ByVal sValue As String)
    Dim oValueList As DriveValueList
    Set oValueList = mIO.AchieveValuetoList(objConnInfo, iFunc, sValue)
    '������ ����ȡ��
    If iFunc = 72 Then
        Dim s As Long
        Dim p As Long
        s = oValueList.GetValue_Num("Second")  '����
        p = oValueList.GetValue_Num("ParMode")  'ģʽ
        MsgBox "����ֵ:" & s & "��" & "ģʽ:" & p '���
    ElseIf iFunc = 19 Then
        Dim t As String
        t = oValueList.GetValue_String("DateTime")  'ʱ��
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

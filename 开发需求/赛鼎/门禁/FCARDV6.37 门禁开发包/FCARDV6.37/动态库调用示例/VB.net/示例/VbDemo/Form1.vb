Imports System.IO.Ports
Imports FCardCDrive
Imports FCardCDrive.Connect
Imports FCardCDrive.FC8900
Imports DataTool
Imports FCardCDrive.Connect.TCPServer
Imports System.Net

Public Class Form1

    Dim mIo As ConnectMain

    Delegate Sub CmdAchieve(ByVal oInfo As ConnectInfo, ByVal oValue As Object)
    Dim FunList As Dictionary(Of Integer, CmdAchieve)
    Private Sub AddProcessFun(ByVal key As Integer, ByVal val As CmdAchieve)

        If FunList Is Nothing Then
            FunList = New Dictionary(Of Integer, CmdAchieve)
            If Not FunList.ContainsKey(key) Then
                FunList.Add(key, val)
            End If
        End If
    End Sub

    Private Sub ChkTCPClient_CheckedChanged(sender As Object, e As EventArgs) Handles ChkTCPClient.CheckedChanged
        If ChkTCPClient.Checked Then
            gbTCPClient.Visible = True
            gbTCPClient.Location = New Point(27, 51)
            gbTCPServer.Visible = False
            gbUDP.Visible = False
            gbCOM.Visible = False
        End If

    End Sub
    Private Sub ChkTCPServer_CheckedChanged(sender As Object, e As EventArgs) Handles ChkTCPServer.CheckedChanged
        If ChkTCPServer.Checked Then
            gbTCPServer.Visible = True
            gbTCPServer.Location = New Point(27, 51)
            gbTCPClient.Visible = False
            gbUDP.Visible = False
            gbCOM.Visible = False
        End If

    End Sub

    Private Sub ChkCOM_CheckedChanged(sender As Object, e As EventArgs) Handles ChkCOM.CheckedChanged
        If ChkCOM.Checked Then
            gbCOM.Visible = True
            gbCOM.Location = New Point(27, 51)
            gbTCPServer.Visible = False
            gbUDP.Visible = False
            gbTCPClient.Visible = False
        End If
    End Sub

    Private Sub ChkUDP_CheckedChanged(sender As Object, e As EventArgs) Handles ChkUDP.CheckedChanged
        If ChkUDP.Checked Then
            gbUDP.Visible = True
            gbUDP.Location = New Point(27, 51)
            gbTCPServer.Visible = False
            gbTCPClient.Visible = False
            gbCOM.Visible = False
        End If
    End Sub

    Private Sub Form1_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        If mIo Is Nothing Then
            mIo = New ConnectMain
            AddHandler mIo.CommandAchieve, AddressOf _CommandAchieve
            AddHandler mIo.CommandTimeout, AddressOf _CommandTimeout
            AddHandler mIo.ConnectError, AddressOf _ConnectError
            AddHandler mIo.PasswordError, AddressOf _PasswordError
        End If

    End Sub
    Private Sub Init()
        gbConfig.Size = New Size(318, 210)
        GetCOMList()
    End Sub
    ''' <summary>
    ''' 获取串口列表
    ''' </summary>
    Private Sub GetCOMList()
        CmbSerialPort.Items.Clear()
        Dim sList As String() = Nothing
        sList = SerialPort.GetPortNames()
        If sList.Length > 0 Then
            Array.Sort(sList)
            CmbSerialPort.Items.AddRange(sList)
            CmbSerialPort.SelectedIndex = 0
        End If
    End Sub

    Private Sub _PasswordError(oInfo As ConnectInfo, iCommandCode As Integer, oValue As Object)

    End Sub

    Private Sub _ConnectError(oInfo As ConnectInfo, iCommandCode As Integer, oValue As Object)
        If iCommandCode = ConnectMain.eCommandCode.cmdSearchEquptOnNetNum Then
            _searchCount = _searchCountMax
            Me.Invoke(Sub()
                          Call SearchEquptOver()
                      End Sub)
        End If
    End Sub

    Private Sub _CommandTimeout(oInfo As ConnectInfo, iCommandCode As Integer, iStep As Integer, oValue As Object)
        If iCommandCode = ConnectMain.eCommandCode.cmdSearchEquptOnNetNum Then
            Me.Invoke(Sub()
                          Call SearchEquptOver()
                      End Sub)
        End If
    End Sub

    Private Sub _CommandAchieve(ByVal oInfo As ConnectInfo, ByVal iCommandCode As Integer, ByVal oValue As Object)
        '命令成功
        If FunList IsNot Nothing Then
            If (FunList.ContainsKey(iCommandCode)) Then
                FunList(iCommandCode)(oInfo, oValue)
            End If
        End If
    End Sub
    Private Function GetConnInfo(Optional ByVal RestartCount As Integer = 1, Optional ByVal iTimeout As Integer = 1500) As ConnectInfo

        Dim oInfo As ConnectInfo = New ConnectInfo()

        'TCP客户端模式
        If ChkTCPClient.Checked Then

            Dim translate As Integer = 0
            Integer.TryParse(TxtIPPort_TCPClient.Text, translate)
            oInfo.ConnType = ConnectInfo.e_ConnectType.OnTCPClient
            oInfo.IP = TxtIPAddr_TCPClient.Text
            oInfo.NetPort = translate

            oInfo.RestartCount = RestartCount + 3
        End If

        '串口
        If (ChkCOM.Checked) Then

            oInfo.ConnType = ConnectInfo.e_ConnectType.OnComm
            Dim sCOM As String = CmbSerialPort.Text
            If (sCOM.Length > 0) Then
                sCOM = sCOM.Replace("COM", String.Empty)
                oInfo.CommPort = Int16.Parse(sCOM)
            End If
        Else

            oInfo.CommPort = 1

            oInfo.CommBaudrate = 19200
        End If

        'UDP
        If (ChkUDP.Checked) Then

            oInfo.ConnType = ConnectInfo.e_ConnectType.OnUDP
            oInfo.IP = TxtIPAddr_UDP.Text
            oInfo.NetPort = TxtIPPort_UDP.Value
            If (ChkBroadcast.Checked) Then

                oInfo.UDPBroadcast = True
            End If

        End If


        If ChkTCPServer.Checked Then

        End If

        oInfo.EquptType = ConnectInfo.e_EquptType.FC8900
        oInfo.SN = TxtConnSN.Text
        oInfo.Password = gbConfig.Text

        oInfo.RestartCount = RestartCount
        oInfo.TimeOutMSEL = iTimeout

        Return oInfo

    End Function
    Private Sub btnOpenDoors_Click(sender As Object, e As EventArgs) Handles btnOpenDoors.Click
        mIo.Command(GetConnInfo(), "OpenRelay", New Boolean() {True, True, True, True})
    End Sub
    Private Sub btnCloseDoor_Click(sender As Object, e As EventArgs) Handles btnCloseDoor.Click
        mIo.Command(GetConnInfo(), "CloseRelay", New Boolean() {True, False, False, False})
    End Sub

    Private Sub Form1_FormClosed(sender As Object, e As FormClosedEventArgs) Handles MyBase.FormClosed
        If mIo IsNot Nothing Then
            mIo.StopCommand()
            mIo.Release()
            mIo = Nothing
        End If
    End Sub

    Private Sub btnCardReadAll_Click(sender As Object, e As EventArgs) Handles btnCardReadAll.Click
        mIo.Command(GetConnInfo(1, 5000), "GetCardList", CmbOptCardMode.SelectedIndex + 1)
        AddProcessFun(ConnectMain.eCommandCode.cmdGetCardList, AddressOf GetCardListResult)
    End Sub


    Private Sub GetCardListResult(ByVal oInfo As ConnectInfo, ByVal oValue As Object)
        Dim uploadCount As Integer = oValue.uploadCount '已经上传总计
        Dim oCardList As List(Of Card) = oValue.CardList '卡片数据
    End Sub

    Private Sub btnWriteSortCardList_Click(sender As Object, e As EventArgs) Handles btnWriteSortCardList.Click
        Dim mCards As List(Of Card) = New List(Of Card)()
        For i As Integer = 0 To 10 - 1
            mCards.Add(New FC8900Card With {.Card = 2345678 + i, .CardType = Card.eCardType.eNormal, .ExpiryDate = New DateTime(2018, 2, 28), .OpenCount = 100})
        Next
        mIo.Command(GetConnInfo(50, 2000), "WriteSortCardList", mCards)
    End Sub

    Private Sub btnCardWrite_Click(sender As Object, e As EventArgs) Handles btnCardWrite.Click
        Dim mCards As List(Of Card) = New List(Of Card)()
        For i As Integer = 0 To 10 - 1
            mCards.Add(New FC8900Card With {.Card = 2345678 + i, .CardType = Card.eCardType.eNormal, .ExpiryDate = New DateTime(2018, 2, 28), .OpenCount = 100})
        Next
        mIo.Command(GetConnInfo(50, 2000), "WriteCardList", mCards)
    End Sub

    Private Sub btnCardClear_Click(sender As Object, e As EventArgs) Handles btnCardClear.Click
        mIo.Command(GetConnInfo(1, 5000), "ClearCard", CmbOptCardMode.SelectedIndex + 1)
        AddProcessFun(ConnectMain.eCommandCode.cmdClearCard, AddressOf ClearCardResult)
    End Sub

    Private Sub ClearCardResult(oInfo As ConnectInfo, oValue As Object)
        MessageBox.Show("清空成功!")
    End Sub

    Private Sub btnWriteTime_Click(sender As Object, e As EventArgs) Handles btnWriteTime.Click
        mIo.Command(GetConnInfo(), "WriteTime", ChkBroadcast.Checked)
    End Sub

    Private Sub btnWriteTimeDefine_Click(sender As Object, e As EventArgs) Handles btnWriteTimeDefine.Click
        Dim oDate As System.DateTime = New DateTime(2018, 2, 28, 18, 13, 52)

        'MessageBox.Show("时间取值范围是 2000年 - 2099年，请重新输入！", "错误", MessageBoxButtons.OK);
        mIo.Command(GetConnInfo(), "WriteTimeDefine", oDate)
    End Sub

    Private Sub btnWriteAutoTimeRepair_Click(sender As Object, e As EventArgs) Handles btnWriteAutoTimeRepair.Click
        '0表示调慢，1表示调快
        mIo.Command(GetConnInfo(), "WriteAutoTimeRepair", 1, 10)
    End Sub

    Private Sub btnReadTime_Click(sender As Object, e As EventArgs) Handles btnReadTime.Click
        mIo.Command(GetConnInfo(), "ReadTime")
        AddProcessFun(ConnectMain.eCommandCode.cmdReadTime, AddressOf ReadTimeResult)
    End Sub

    Private Sub ReadTimeResult(oInfo As ConnectInfo, oValue As Object)

    End Sub

    Private Sub btnReadAutoTimeRepair_Click(sender As Object, e As EventArgs) Handles btnReadAutoTimeRepair.Click
        mIo.Command(GetConnInfo(), "ReadAutoTimeRepair")
        AddProcessFun(ConnectMain.eCommandCode.cmdReadAutoTimeRepair, AddressOf ReadAutoTimeRepairResult)
    End Sub

    Private Sub ReadAutoTimeRepairResult(oInfo As ConnectInfo, oValue As Object)

    End Sub

    Private Sub btnRefresh_Click(sender As Object, e As EventArgs) Handles btnRefresh.Click
        GetCOMList()
    End Sub

    Private Class SearchData
        Public TCP As FCardCDrive.TCPInfo_FC8000
        Public SN As String
        Public SNByte() As Byte
        Public Sub New(ByVal sSN As String, ByVal bSNByte() As Byte, ByVal oTCP As TCPInfo_FC8000)
            TCP = oTCP
            SN = sSN
            SNByte = bSNByte
        End Sub
    End Class
    Dim _searchNetNum As Long = 0
    Dim _searchCountMax As Integer = 0
    Dim _searchCount As Integer = 0
    Dim _searchSN As List(Of SearchData) = Nothing

    Private Sub btnSearch_Click(sender As Object, e As EventArgs) Handles btnSearch.Click
        Dim lNetNum As Long = 0
        Dim rand = New System.Random()
        lNetNum = rand.Next(1, 65530)
        _searchNetNum = lNetNum
        _searchCountMax = 3
        _searchCount = 1
        If _searchSN Is Nothing Then

            _searchSN = New List(Of SearchData)()
        End If
        _searchSN.Clear()
        Dim oInfo = GetConnInfo(0, 5000)
        If (mIo.Command(oInfo, "SearchEquptOnNetNum", lNetNum, ChkBroadcast.Checked)) Then

            btnSearch.Enabled = False
        End If

        AddProcessFun(ConnectMain.eCommandCode.cmdSearchEquptOnNetNum, AddressOf SearchEquptStep)
    End Sub

    Private Sub SearchEquptStep(oInfo As ConnectInfo, oValue As Object)
        '搜索到设备
        Dim bSave As Boolean = False


        Dim oTCP As TCPInfo_FC8000 = oValue.TCP
        Dim sSearchSN As String = oValue.SN
        Dim bSN() As Byte = oValue.SNByte
        bSave = True
        For Each oSN As SearchData In _searchSN
            If oSN.SNByte.BytesEquals(bSN) Then
                bSave = False
                Exit For
            End If
        Next
        If (bSave) Then

            '添加到集合并发送设置指令
            Dim oSN As SearchData = New SearchData(sSearchSN, bSN, oTCP)
            _searchSN.Add(oSN)
            Dim oSnedInfo As ConnectInfo = GetConnInfo(, 5000)
            oSnedInfo.SN = sSearchSN
            mIo.Command(oSnedInfo, "SetEquptNetNum", _searchNetNum, ChkBroadcast.Checked)

            _searchCountMax = _searchCount + 3
            '往后延伸三次
            If _searchCountMax > 10 Then

                _searchCountMax = 10
            End If
        End If
    End Sub

    Private Sub SearchEquptOver()

        '搜索结束
        If _searchCount < _searchCountMax Then

            '继续搜索
            _searchCount += 1
            mIo.Command(GetConnInfo(0, 5000), "SearchEquptOnNetNum", _searchNetNum, ChkBroadcast.Checked)

        Else

            btnSearch.Enabled = True

            Dim i As Integer = 0
            cmbDrives.Items.Clear()
            For i = 0 To _searchSN.Count - 1

                If Not CheckSN(_searchSN(i).SN) Then

                    _searchSN(i).SN = "0x" + _searchSN(i).SNByte.ToHex()
                End If
                '在下拉列表中显示设备SN
                Dim Index As Integer = cmbDrives.Items.Add(_searchSN(i).SN)
            Next
        End If
    End Sub

    ''' <summary>
    ''' 检查SN是否合法
    ''' </summary>
    ''' <param name="sSN"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Private Function CheckSN(ByVal sSN As String) As Boolean
        Dim bChar(255) As Boolean
        Dim bData() As Byte = UserEncoding.GetBytes("0123456789ABCEDFGHIJKLMNOPQRSTUVWXYZ- abcdefghijklmnopqrstuvwxyz")
        For i As Integer = 0 To bData.Length - 1
            bChar(bData(i)) = True
        Next
        '开始检测是否有非法字符
        bData = UserEncoding.GetBytes(sSN)
        For i As Integer = 0 To bData.Length - 1
            If Not bChar(bData(i)) Then
                Return False
            End If
        Next

        Return True
    End Function

    Private Sub btnStop_Click(sender As Object, e As EventArgs) Handles btnStop.Click
        mIo.StopCommand(GetConnInfo(), -1)
    End Sub

    Private Sub cmbDrives_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cmbDrives.SelectedIndexChanged
        '把下拉列表选中设备的连接信息填充到“通讯参数”中，并请求通讯密码
        Dim sd As SearchData = _searchSN.Find(Function(o) o.SN = cmbDrives.SelectedItem.ToString())
        If sd IsNot Nothing Then
            TxtIPAddr_TCPClient.Text = sd.TCP.IP
            TxtIPPort_TCPClient.Value = sd.TCP.TCPPort
            TxtConnSN.Text = sd.SN
            TxtIPAddr_UDP.Text = sd.TCP.IP
            TxtIPPort_UDP.Value = sd.TCP.UDPPort
            Dim oInfo As ConnectInfo = GetConnInfo()
            oInfo.ConnType = ConnectInfo.e_ConnectType.OnTCPClient
            oInfo.IP = sd.TCP.IP
            oInfo.NetPort = sd.TCP.TCPPort
            oInfo.Password = "FFFFFFFF"
            '请求通讯密码
            mIo.Command(oInfo, "ReadConnPassword", "4643617264597A", ChkBroadcast.Checked)
            AddProcessFun(ConnectMain.eCommandCode.cmdReadConnPassword, AddressOf ReadConnPasswordDecompile)
        End If
    End Sub

    Private Sub ReadConnPasswordDecompile(oInfo As ConnectInfo, oValue As Object)

        Invoke(New Action(Function() TxtConnPassword.Text = oValue))

    End Sub
    Dim mBeginServer As Boolean
    Dim mListenPort As Integer
    Private Sub btnBeginServer_Click(sender As Object, e As EventArgs) Handles btnBeginServer.Click
        If mBeginServer Then
            mIo.StopListen_IOCP(mListenPort)
            mBeginServer = False
            btnBeginServer.Text = "开启服务"
            TxtServerPort.Enabled = True
        Else
            Dim lServerPort = TxtServerPort.Value
            Dim oIP = New IPEndPoint(IPAddress.Any, lServerPort)
            mListenPort = lServerPort
            Dim b = mIo.BeginListen_IOCP(oIP)
            If Not b Then
                MessageBox.Show("服务器端口被占用！")
                Return
            End If
            '注册事件回调，当有客户端连接时并发送第一个数据包时，触发此回调
            mIo.RegClientVerificationCallBlack(lServerPort, AddressOf ClientVerificationCallBlack)
            mBeginServer = True
            btnBeginServer.Text = "关闭服务"
            TxtServerPort.Enabled = False

        End If
    End Sub

    Private Function ClientVerificationCallBlack(ClientInfo As IOCPTCPServer.IOCPClientDetils, bBuf() As Byte, iBufLen As Integer) As Boolean
        If bBuf(0) = &H7E Then

            Dim oFCPacketDe = New FCardCDrive.Packet.FC8800Packet.FC8800PacketDecompile()
            Dim oFCPacketList = New List(Of FCardCDrive.Packet.INPacket)()
            If (oFCPacketDe.DeCompile(bBuf, 0, iBufLen, oFCPacketList, Nothing)) Then

                Dim pak = oFCPacketList(0)
                ClientInfo.SN = pak.SN
                If pak.Data.CmdType = &H19 & pak.Data.CmdIndex = &H23 Then

                    AddClientToList(ClientInfo)

                End If
                Return True

                Return False
            End If
        End If
        Return False
    End Function

    Private Class ClientInfo

        Public Handle As Long
        Public RemoteEndPoint As String
        Public Overrides Function ToString() As String

            Return RemoteEndPoint
        End Function
    End Class
    Private Sub AddClientToList(ByVal ClientInfo As FCardCDrive.Connect.TCPServer.IOCPTCPServer.IOCPClientDetils)

        Dim oClient As ClientInfo = Nothing

        If oClient IsNot Nothing Then

            oClient.RemoteEndPoint = ClientInfo.IP + " " + ClientInfo.SN '.GetObjValue("IP + " " + ClientInfo.GetObjValue("SN
            Return
        End If

        oClient = New ClientInfo()
        oClient.RemoteEndPoint = ClientInfo.IP + " " + ClientInfo.SN
        oClient.Handle = ClientInfo.ClientHandle

    End Sub

End Class

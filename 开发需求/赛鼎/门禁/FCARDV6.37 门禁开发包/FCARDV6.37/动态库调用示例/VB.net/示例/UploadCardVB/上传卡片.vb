Imports FCardCDrive
Imports FCardCDrive.Connect
Imports FCardCDrive.FC8900

Public Class 上传卡片

    '定义全局命令操作对象
    Private mIO As FCardCDrive.ConnectMain = Nothing
    Private Sub UploadCard_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        '初始化命令操作对象
        If mIO Is Nothing Then

            mIO = New FCardCDrive.ConnectMain()
            AddHandler mIO.CommandAchieve, AddressOf _CommandAchieve '命令成功事件
            AddHandler mIO.CommandTimeout, AddressOf _CommandTimeout '命令超时事件
            AddHandler mIO.ConnectError, AddressOf _ConnectError '连接错误事件
            AddHandler mIO.PasswordError, AddressOf _PasswordError '密码错误事件
        End If
    End Sub

    '上传到非排序区
    Private Sub btnUploadCard_Click(sender As Object, e As EventArgs) Handles btnUploadCard.Click
        Dim mCards As List(Of Card) = New List(Of Card)() '创建卡片对象列表
        For i = 0 To 10
            '初始化卡片并添加到列表中
            mCards.Add(New FC8900Card With {.Card = 2345678 + i, .CardType = Card.eCardType.eNormal, .ExpiryDate = New DateTime(2018, 2, 28), .OpenCount = 100})
        Next
        mIO.Command(GetConnectInfo(), "WriteCardList", mCards)
    End Sub

    '上传到排序区
    Private Sub btnUploadSortArea_Click(sender As Object, e As EventArgs) Handles btnUploadSortArea.Click
        Dim mCards As List(Of Card) = New List(Of Card)() '创建卡片对象列表
        For i = 0 To 10
            '初始化卡片并添加到列表中
            mCards.Add(New FC8900Card With {.Card = 2345678 + i, .CardType = Card.eCardType.eNormal, .ExpiryDate = New DateTime(2018, 2, 28), .OpenCount = 100})
        Next
        mIO.Command(GetConnectInfo(), "WriteSortCardList", mCards)
    End Sub

    '清空卡片
    Private Sub btnClearCard_Click(sender As Object, e As EventArgs) Handles btnClearCard.Click
        '1：排序区 2： 非排序区 3： 全部区域
        mIO.Command(GetConnectInfo(), "ClearCard", 1)
    End Sub

    '创建连接参数对象
    Private Function GetConnectInfo() As FCardCDrive.Connect.ConnectInfo

        Dim oInfo As FCardCDrive.Connect.ConnectInfo = New FCardCDrive.Connect.ConnectInfo()
        oInfo.SN = "MC-5824T25070244" '16个字符
        oInfo.IP = "192.168.1.126" 'IP地址
        oInfo.NetPort = 8000 'TCP默认端口为8000
        oInfo.Password = "FFFFFFFF" '通信秘密 8位十六进制字符
        oInfo.EquptType = FCardCDrive.Connect.ConnectInfo.e_EquptType.FC8900 '指定设备类型
        oInfo.ConnType = FCardCDrive.Connect.ConnectInfo.e_ConnectType.OnTCPClient '指定连接类型
        oInfo.RestartCount = 3 '重试次数
        oInfo.TimeOutMSEL = 600 '超时
        Return oInfo
    End Function

#Region "事件"
    ''' <summary>
    ''' 命令成功事件
    ''' </summary>
    ''' <param name="oInfo">原封不动返回执行命令时候的连接参数对象</param>
    ''' <param name="iCommandCode">命令代码，与枚举对象一一对应</param>
    ''' <param name="oValue">命令返回值</param>
    Private Sub _CommandAchieve(oInfo As ConnectInfo, iCommandCode As Integer, oValue As Object)
        If iCommandCode = FCardCDrive.ConnectMain.eCommandCode.cmdGetCardList Then

        End If
    End Sub

    ''' <summary>
    ''' 命令超时
    ''' </summary>
    ''' <param name="oInfo">原封不动返回执行命令时候的连接参数对象</param>
    ''' <param name="iCommandCode">命令代码，与枚举对象一一对应</param
    ''' <param name="iStep">错误出现所在的步骤</param>
    ''' <param name="oValue">命令返回值</param>
    Private Sub _CommandTimeout(oInfo As ConnectInfo, iCommandCode As Integer, iStep As Integer, oValue As Object)
        Throw New NotImplementedException()
    End Sub


    ''' <summary>
    ''' 连接错误
    ''' </summary>
    ''' <param name="oInfo">原封不动返回执行命令时候的连接参数对象</param>
    ''' <param name="iCommandCode">命令代码，与枚举对象一一对应</param>
    ''' <param name="oValue">命令返回值</param>
    Private Sub _ConnectError(oInfo As ConnectInfo, iCommandCode As Integer, oValue As Object)
        Throw New NotImplementedException()
    End Sub

    ''' <summary>
    ''' 密码错误
    ''' </summary>
    ''' <param name="oInfo">原封不动返回执行命令时候的连接参数对象</param>
    ''' <param name="iCommandCode">命令代码，与枚举对象一一对应</param>
    ''' <param name="oValue">命令返回值</param>
    Private Sub _PasswordError(oInfo As ConnectInfo, iCommandCode As Integer, oValue As Object)
        Throw New NotImplementedException()
    End Sub

    Private Sub OpenDoor_FormClosing(sender As Object, e As FormClosingEventArgs) Handles MyBase.FormClosing
        '窗口关闭事件释放资源
        If mIO IsNot Nothing Then
            mIO.StopCommand() '停止所有命令
            mIO.Release() '释放类库所有资源
            mIO = Nothing
        End If
    End Sub



#End Region

End Class

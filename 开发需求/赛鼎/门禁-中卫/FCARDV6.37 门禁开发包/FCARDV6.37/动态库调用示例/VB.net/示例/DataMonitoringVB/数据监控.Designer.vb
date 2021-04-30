<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class 数据监控
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
        Me.btnMonitorClose = New System.Windows.Forms.Button()
        Me.btnMonitor = New System.Windows.Forms.Button()
        Me.txtEvent = New System.Windows.Forms.TextBox()
        Me.SuspendLayout()
        '
        'btnMonitorClose
        '
        Me.btnMonitorClose.Location = New System.Drawing.Point(73, 58)
        Me.btnMonitorClose.Name = "btnMonitorClose"
        Me.btnMonitorClose.Size = New System.Drawing.Size(75, 23)
        Me.btnMonitorClose.TabIndex = 3
        Me.btnMonitorClose.Text = "关闭监控"
        Me.btnMonitorClose.UseVisualStyleBackColor = True
        '
        'btnMonitor
        '
        Me.btnMonitor.Location = New System.Drawing.Point(73, 12)
        Me.btnMonitor.Name = "btnMonitor"
        Me.btnMonitor.Size = New System.Drawing.Size(75, 23)
        Me.btnMonitor.TabIndex = 2
        Me.btnMonitor.Text = "开启监控"
        Me.btnMonitor.UseVisualStyleBackColor = True
        '
        'txtEvent
        '
        Me.txtEvent.Anchor = CType((((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Bottom) _
            Or System.Windows.Forms.AnchorStyles.Left) _
            Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.txtEvent.Location = New System.Drawing.Point(0, 82)
        Me.txtEvent.Multiline = True
        Me.txtEvent.Name = "txtEvent"
        Me.txtEvent.ReadOnly = True
        Me.txtEvent.ScrollBars = System.Windows.Forms.ScrollBars.Vertical
        Me.txtEvent.Size = New System.Drawing.Size(336, 216)
        Me.txtEvent.TabIndex = 4
        '
        '数据监控
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 12.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(335, 300)
        Me.Controls.Add(Me.txtEvent)
        Me.Controls.Add(Me.btnMonitorClose)
        Me.Controls.Add(Me.btnMonitor)
        Me.Name = "数据监控"
        Me.Text = "数据监控"
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub

    Private WithEvents btnMonitorClose As Button
    Private WithEvents btnMonitor As Button
    Private WithEvents txtEvent As TextBox
End Class

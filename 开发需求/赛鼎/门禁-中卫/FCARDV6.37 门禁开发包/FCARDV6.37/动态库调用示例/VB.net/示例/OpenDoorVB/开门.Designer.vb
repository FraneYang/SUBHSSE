<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class 开门
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
        Me.btnOpenDoor = New System.Windows.Forms.Button()
        Me.SuspendLayout()
        '
        'btnOpenDoor
        '
        Me.btnOpenDoor.Location = New System.Drawing.Point(76, 100)
        Me.btnOpenDoor.Name = "btnOpenDoor"
        Me.btnOpenDoor.Size = New System.Drawing.Size(100, 34)
        Me.btnOpenDoor.TabIndex = 1
        Me.btnOpenDoor.Text = "开门"
        Me.btnOpenDoor.UseVisualStyleBackColor = True
        '
        'OpenDoor
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 12.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(284, 261)
        Me.Controls.Add(Me.btnOpenDoor)
        Me.Name = "OpenDoor"
        Me.Text = "Form1"
        Me.ResumeLayout(False)

    End Sub

    Private WithEvents btnOpenDoor As Button
End Class

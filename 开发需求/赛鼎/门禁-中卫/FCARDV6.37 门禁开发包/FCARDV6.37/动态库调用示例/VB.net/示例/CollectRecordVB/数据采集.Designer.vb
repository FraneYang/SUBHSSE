<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class 数据采集
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
        Me.btnCollect = New System.Windows.Forms.Button()
        Me.SuspendLayout()
        '
        'btnCollect
        '
        Me.btnCollect.Location = New System.Drawing.Point(94, 118)
        Me.btnCollect.Name = "btnCollect"
        Me.btnCollect.Size = New System.Drawing.Size(75, 23)
        Me.btnCollect.TabIndex = 1
        Me.btnCollect.Text = "采集记录"
        Me.btnCollect.UseVisualStyleBackColor = True
        '
        'CollectRecord
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 12.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(284, 261)
        Me.Controls.Add(Me.btnCollect)
        Me.Name = "CollectRecord"
        Me.Text = "采集记录"
        Me.ResumeLayout(False)

    End Sub

    Private WithEvents btnCollect As Button
End Class

<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class 上传卡片
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
        Me.btnUploadSortArea = New System.Windows.Forms.Button()
        Me.btnUploadCard = New System.Windows.Forms.Button()
        Me.btnClearCard = New System.Windows.Forms.Button()
        Me.SuspendLayout()
        '
        'btnUploadSortArea
        '
        Me.btnUploadSortArea.Location = New System.Drawing.Point(72, 100)
        Me.btnUploadSortArea.Name = "btnUploadSortArea"
        Me.btnUploadSortArea.Size = New System.Drawing.Size(123, 23)
        Me.btnUploadSortArea.TabIndex = 3
        Me.btnUploadSortArea.Text = "上传卡片(排序区)"
        Me.btnUploadSortArea.UseVisualStyleBackColor = True
        '
        'btnUploadCard
        '
        Me.btnUploadCard.Location = New System.Drawing.Point(72, 64)
        Me.btnUploadCard.Name = "btnUploadCard"
        Me.btnUploadCard.Size = New System.Drawing.Size(123, 23)
        Me.btnUploadCard.TabIndex = 2
        Me.btnUploadCard.Text = "上传卡片(非排序区)"
        Me.btnUploadCard.UseVisualStyleBackColor = True
        '
        'btnClearCard
        '
        Me.btnClearCard.Location = New System.Drawing.Point(72, 129)
        Me.btnClearCard.Name = "btnClearCard"
        Me.btnClearCard.Size = New System.Drawing.Size(75, 23)
        Me.btnClearCard.TabIndex = 4
        Me.btnClearCard.Text = "清空卡片"
        Me.btnClearCard.UseVisualStyleBackColor = True
        '
        'UploadCard
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 12.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(284, 261)
        Me.Controls.Add(Me.btnClearCard)
        Me.Controls.Add(Me.btnUploadSortArea)
        Me.Controls.Add(Me.btnUploadCard)
        Me.Name = "UploadCard"
        Me.Text = "上传卡片"
        Me.ResumeLayout(False)

    End Sub

    Private WithEvents btnUploadSortArea As Button
    Private WithEvents btnUploadCard As Button
    Private WithEvents btnClearCard As Button
End Class

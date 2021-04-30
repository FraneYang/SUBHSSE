namespace DataMonitoring
{
    partial class 数据监控
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
            this.btnMonitor = new System.Windows.Forms.Button();
            this.btnMonitorClose = new System.Windows.Forms.Button();
            this.txtEvent = new System.Windows.Forms.TextBox();
            this.SuspendLayout();
            // 
            // btnMonitor
            // 
            this.btnMonitor.Location = new System.Drawing.Point(37, 12);
            this.btnMonitor.Name = "btnMonitor";
            this.btnMonitor.Size = new System.Drawing.Size(75, 23);
            this.btnMonitor.TabIndex = 0;
            this.btnMonitor.Text = "开启监控";
            this.btnMonitor.UseVisualStyleBackColor = true;
            this.btnMonitor.Click += new System.EventHandler(this.btnMonitor_Click);
            // 
            // btnMonitorClose
            // 
            this.btnMonitorClose.Location = new System.Drawing.Point(37, 58);
            this.btnMonitorClose.Name = "btnMonitorClose";
            this.btnMonitorClose.Size = new System.Drawing.Size(75, 23);
            this.btnMonitorClose.TabIndex = 1;
            this.btnMonitorClose.Text = "关闭监控";
            this.btnMonitorClose.UseVisualStyleBackColor = true;
            this.btnMonitorClose.Click += new System.EventHandler(this.btnMonitorClose_Click);
            // 
            // txtEvent
            // 
            this.txtEvent.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.txtEvent.Location = new System.Drawing.Point(0, 147);
            this.txtEvent.Multiline = true;
            this.txtEvent.Name = "txtEvent";
            this.txtEvent.ReadOnly = true;
            this.txtEvent.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.txtEvent.Size = new System.Drawing.Size(365, 167);
            this.txtEvent.TabIndex = 2;
            // 
            // 数据监控
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(366, 314);
            this.Controls.Add(this.txtEvent);
            this.Controls.Add(this.btnMonitorClose);
            this.Controls.Add(this.btnMonitor);
            this.Name = "数据监控";
            this.Text = "数据监控";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.Monitor_FormClosing);
            this.Load += new System.EventHandler(this.Monitor_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btnMonitor;
        private System.Windows.Forms.Button btnMonitorClose;
        private System.Windows.Forms.TextBox txtEvent;
    }
}


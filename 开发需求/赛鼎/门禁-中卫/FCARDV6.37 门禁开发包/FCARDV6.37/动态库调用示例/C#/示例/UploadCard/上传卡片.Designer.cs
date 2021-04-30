namespace UploadCard
{
    partial class 上传卡片
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
            this.btnUploadCard = new System.Windows.Forms.Button();
            this.btnUploadSortArea = new System.Windows.Forms.Button();
            this.btnClearCard = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // btnUploadCard
            // 
            this.btnUploadCard.Location = new System.Drawing.Point(77, 71);
            this.btnUploadCard.Name = "btnUploadCard";
            this.btnUploadCard.Size = new System.Drawing.Size(123, 23);
            this.btnUploadCard.TabIndex = 0;
            this.btnUploadCard.Text = "上传卡片(非排序区)";
            this.btnUploadCard.UseVisualStyleBackColor = true;
            this.btnUploadCard.Click += new System.EventHandler(this.btnUploadCard_Click);
            // 
            // btnUploadSortArea
            // 
            this.btnUploadSortArea.Location = new System.Drawing.Point(77, 107);
            this.btnUploadSortArea.Name = "btnUploadSortArea";
            this.btnUploadSortArea.Size = new System.Drawing.Size(123, 23);
            this.btnUploadSortArea.TabIndex = 1;
            this.btnUploadSortArea.Text = "上传卡片(排序区)";
            this.btnUploadSortArea.UseVisualStyleBackColor = true;
            this.btnUploadSortArea.Click += new System.EventHandler(this.btnUploadSortArea_Click);
            // 
            // btnClearCard
            // 
            this.btnClearCard.Location = new System.Drawing.Point(77, 149);
            this.btnClearCard.Name = "btnClearCard";
            this.btnClearCard.Size = new System.Drawing.Size(75, 23);
            this.btnClearCard.TabIndex = 2;
            this.btnClearCard.Text = "清空卡片";
            this.btnClearCard.UseVisualStyleBackColor = true;
            this.btnClearCard.Click += new System.EventHandler(this.btnClearCard_Click);
            // 
            // upload
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(284, 261);
            this.Controls.Add(this.btnClearCard);
            this.Controls.Add(this.btnUploadSortArea);
            this.Controls.Add(this.btnUploadCard);
            this.Name = "upload";
            this.Text = "上传卡片";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.upload_FormClosing);
            this.Load += new System.EventHandler(this.upload_Load);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button btnUploadCard;
        private System.Windows.Forms.Button btnUploadSortArea;
        private System.Windows.Forms.Button btnClearCard;
    }
}


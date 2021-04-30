namespace FaceRecognitioDemo
{
    partial class Form2
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.label3 = new System.Windows.Forms.Label();
            this.sure = new System.Windows.Forms.Button();
            this.cannel = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(72, 20);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(89, 12);
            this.label3.TabIndex = 20;
            this.label3.Text = "确定删除所有？";
            // 
            // sure
            // 
            this.sure.Location = new System.Drawing.Point(25, 56);
            this.sure.Name = "sure";
            this.sure.Size = new System.Drawing.Size(75, 23);
            this.sure.TabIndex = 21;
            this.sure.Text = "确定";
            this.sure.UseVisualStyleBackColor = true;
            this.sure.Click += new System.EventHandler(this.sure_Click);
            // 
            // cannel
            // 
            this.cannel.Location = new System.Drawing.Point(120, 56);
            this.cannel.Name = "cannel";
            this.cannel.Size = new System.Drawing.Size(75, 23);
            this.cannel.TabIndex = 22;
            this.cannel.Text = "取消";
            this.cannel.UseVisualStyleBackColor = true;
            this.cannel.Click += new System.EventHandler(this.cannel_Click);
            // 
            // Form2
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(242, 108);
            this.Controls.Add(this.cannel);
            this.Controls.Add(this.sure);
            this.Controls.Add(this.label3);
            this.Name = "Form2";
            this.Text = "Form2";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Button sure;
        private System.Windows.Forms.Button cannel;

    }
}
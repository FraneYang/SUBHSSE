namespace FaceRecognitioDemo
{
    partial class similarity_setting_Form
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
            this.label1 = new System.Windows.Forms.Label();
            this.textBox1 = new System.Windows.Forms.TextBox();
            this.SetSimilarity = new System.Windows.Forms.Button();
            this.getsimilarity = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(12, 29);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(53, 12);
            this.label1.TabIndex = 0;
            this.label1.Text = "相似度：";
            // 
            // textBox1
            // 
            this.textBox1.Location = new System.Drawing.Point(95, 26);
            this.textBox1.Name = "textBox1";
            this.textBox1.Size = new System.Drawing.Size(100, 21);
            this.textBox1.TabIndex = 1;
            // 
            // SetSimilarity
            // 
            this.SetSimilarity.Location = new System.Drawing.Point(199, 53);
            this.SetSimilarity.Name = "SetSimilarity";
            this.SetSimilarity.Size = new System.Drawing.Size(75, 23);
            this.SetSimilarity.TabIndex = 2;
            this.SetSimilarity.Text = "设置";
            this.SetSimilarity.UseVisualStyleBackColor = true;
            this.SetSimilarity.Click += new System.EventHandler(this.SetSimilarity_Click);
            // 
            // getsimilarity
            // 
            this.getsimilarity.Location = new System.Drawing.Point(118, 53);
            this.getsimilarity.Name = "getsimilarity";
            this.getsimilarity.Size = new System.Drawing.Size(75, 23);
            this.getsimilarity.TabIndex = 3;
            this.getsimilarity.Text = "获取";
            this.getsimilarity.UseVisualStyleBackColor = true;
            this.getsimilarity.Click += new System.EventHandler(this.getsimilarity_Click);
            // 
            // similarity_setting_Form
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(286, 98);
            this.Controls.Add(this.getsimilarity);
            this.Controls.Add(this.SetSimilarity);
            this.Controls.Add(this.textBox1);
            this.Controls.Add(this.label1);
            this.Name = "similarity_setting_Form";
            this.Text = "相似度设置";
            this.Load += new System.EventHandler(this.similarity_setting_Form_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox textBox1;
        private System.Windows.Forms.Button SetSimilarity;
        private System.Windows.Forms.Button getsimilarity;
    }
}
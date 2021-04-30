namespace FaceRecognitioDemo
{
    partial class tag_Form
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
            this.GettingTag = new System.Windows.Forms.Button();
            this.SettingTag = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(31, 28);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(29, 12);
            this.label1.TabIndex = 0;
            this.label1.Text = "标题";
            // 
            // textBox1
            // 
            this.textBox1.Location = new System.Drawing.Point(78, 25);
            this.textBox1.Name = "textBox1";
            this.textBox1.Size = new System.Drawing.Size(346, 21);
            this.textBox1.TabIndex = 1;
            // 
            // GettingTag
            // 
            this.GettingTag.Location = new System.Drawing.Point(249, 55);
            this.GettingTag.Name = "GettingTag";
            this.GettingTag.Size = new System.Drawing.Size(75, 23);
            this.GettingTag.TabIndex = 2;
            this.GettingTag.Text = "获取";
            this.GettingTag.UseVisualStyleBackColor = true;
            this.GettingTag.Click += new System.EventHandler(this.GettingTag_Click);
            // 
            // SettingTag
            // 
            this.SettingTag.Location = new System.Drawing.Point(349, 52);
            this.SettingTag.Name = "SettingTag";
            this.SettingTag.Size = new System.Drawing.Size(75, 23);
            this.SettingTag.TabIndex = 3;
            this.SettingTag.Text = "设置";
            this.SettingTag.UseVisualStyleBackColor = true;
            this.SettingTag.Click += new System.EventHandler(this.SettingTag_Click);
            // 
            // tag_Form
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(466, 90);
            this.Controls.Add(this.SettingTag);
            this.Controls.Add(this.GettingTag);
            this.Controls.Add(this.textBox1);
            this.Controls.Add(this.label1);
            this.Name = "tag_Form";
            this.Text = "标题设置";
            this.Load += new System.EventHandler(this.tag_Form_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox textBox1;
        private System.Windows.Forms.Button GettingTag;
        private System.Windows.Forms.Button SettingTag;
    }
}
namespace FaceRecognitioDemo
{
    partial class Repetition_Form
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
            this.textBox1 = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.GetValue = new System.Windows.Forms.Button();
            this.SaveValue = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // textBox1
            // 
            this.textBox1.Location = new System.Drawing.Point(106, 32);
            this.textBox1.Name = "textBox1";
            this.textBox1.Size = new System.Drawing.Size(100, 21);
            this.textBox1.TabIndex = 0;
            this.textBox1.TextChanged += new System.EventHandler(this.textBox1_TextChanged);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(12, 35);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(89, 12);
            this.label1.TabIndex = 1;
            this.label1.Text = "重复人员间隔：";
            // 
            // GetValue
            // 
            this.GetValue.Location = new System.Drawing.Point(119, 68);
            this.GetValue.Name = "GetValue";
            this.GetValue.Size = new System.Drawing.Size(75, 23);
            this.GetValue.TabIndex = 2;
            this.GetValue.Text = "获取";
            this.GetValue.UseVisualStyleBackColor = true;
            this.GetValue.Click += new System.EventHandler(this.GetValue_Click);
            // 
            // SaveValue
            // 
            this.SaveValue.Location = new System.Drawing.Point(218, 68);
            this.SaveValue.Name = "SaveValue";
            this.SaveValue.Size = new System.Drawing.Size(75, 23);
            this.SaveValue.TabIndex = 3;
            this.SaveValue.Text = "保存";
            this.SaveValue.UseVisualStyleBackColor = true;
            this.SaveValue.Click += new System.EventHandler(this.SaveValue_Click);
            // 
            // Repetition_Form
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(336, 103);
            this.Controls.Add(this.SaveValue);
            this.Controls.Add(this.GetValue);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.textBox1);
            this.Name = "Repetition_Form";
            this.Text = "去重复设置";
            this.Load += new System.EventHandler(this.Repetition_Form_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.TextBox textBox1;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button GetValue;
        private System.Windows.Forms.Button SaveValue;
    }
}
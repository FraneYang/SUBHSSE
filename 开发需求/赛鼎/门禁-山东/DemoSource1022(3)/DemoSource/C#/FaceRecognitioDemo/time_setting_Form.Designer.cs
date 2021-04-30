namespace FaceRecognitioDemo
{
    partial class time_setting_Form
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
            this.SetTime = new System.Windows.Forms.Button();
            this.GetTime = new System.Windows.Forms.Button();
            this.dateTimePicker1 = new System.Windows.Forms.DateTimePicker();
            this.starttimehour = new System.Windows.Forms.DateTimePicker();
            this.SuspendLayout();
            // 
            // SetTime
            // 
            this.SetTime.Location = new System.Drawing.Point(337, 29);
            this.SetTime.Name = "SetTime";
            this.SetTime.Size = new System.Drawing.Size(75, 23);
            this.SetTime.TabIndex = 0;
            this.SetTime.Text = "设置时间";
            this.SetTime.UseVisualStyleBackColor = true;
            this.SetTime.Click += new System.EventHandler(this.SetTime_Click);
            // 
            // GetTime
            // 
            this.GetTime.Location = new System.Drawing.Point(256, 29);
            this.GetTime.Name = "GetTime";
            this.GetTime.Size = new System.Drawing.Size(75, 23);
            this.GetTime.TabIndex = 1;
            this.GetTime.Text = "获取时间";
            this.GetTime.UseVisualStyleBackColor = true;
            this.GetTime.Click += new System.EventHandler(this.GetTime_Click);
            // 
            // dateTimePicker1
            // 
            this.dateTimePicker1.CustomFormat = "";
            this.dateTimePicker1.Format = System.Windows.Forms.DateTimePickerFormat.Short;
            this.dateTimePicker1.Location = new System.Drawing.Point(29, 31);
            this.dateTimePicker1.Name = "dateTimePicker1";
            this.dateTimePicker1.Size = new System.Drawing.Size(102, 21);
            this.dateTimePicker1.TabIndex = 2;
            this.dateTimePicker1.Value = new System.DateTime(2019, 5, 20, 0, 0, 0, 0);
            this.dateTimePicker1.ValueChanged += new System.EventHandler(this.dateTimePicker1_ValueChanged);
            // 
            // starttimehour
            // 
            this.starttimehour.Format = System.Windows.Forms.DateTimePickerFormat.Time;
            this.starttimehour.ImeMode = System.Windows.Forms.ImeMode.NoControl;
            this.starttimehour.Location = new System.Drawing.Point(154, 31);
            this.starttimehour.Name = "starttimehour";
            this.starttimehour.ShowUpDown = true;
            this.starttimehour.Size = new System.Drawing.Size(83, 21);
            this.starttimehour.TabIndex = 3;
            // 
            // time_setting_Form
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(424, 82);
            this.Controls.Add(this.starttimehour);
            this.Controls.Add(this.dateTimePicker1);
            this.Controls.Add(this.GetTime);
            this.Controls.Add(this.SetTime);
            this.Name = "time_setting_Form";
            this.Text = "设置时间";
            this.Load += new System.EventHandler(this.time_setting_Form_Load);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button SetTime;
        private System.Windows.Forms.Button GetTime;
        private System.Windows.Forms.DateTimePicker dateTimePicker1;
        private System.Windows.Forms.DateTimePicker starttimehour;
    }
}
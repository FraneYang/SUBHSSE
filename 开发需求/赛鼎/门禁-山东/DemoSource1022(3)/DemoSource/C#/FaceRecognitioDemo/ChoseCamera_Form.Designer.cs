namespace FaceRecognitioDemo
{
    partial class ChoseCamera_Form
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
            this.button1 = new System.Windows.Forms.Button();
            this.IPlist = new System.Windows.Forms.ListView();
            this.SuspendLayout();
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(358, 263);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(75, 23);
            this.button1.TabIndex = 0;
            this.button1.Text = "连接";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // IPlist
            // 
            this.IPlist.AllowColumnReorder = true;
            this.IPlist.FullRowSelect = true;
            this.IPlist.GridLines = true;
            this.IPlist.Location = new System.Drawing.Point(12, 12);
            this.IPlist.Name = "IPlist";
            this.IPlist.Size = new System.Drawing.Size(387, 213);
            this.IPlist.TabIndex = 1;
            this.IPlist.UseCompatibleStateImageBehavior = false;
            this.IPlist.View = System.Windows.Forms.View.Details;
            this.IPlist.SelectedIndexChanged += new System.EventHandler(this.listView1_SelectedIndexChanged);
            this.IPlist.DoubleClick += new System.EventHandler(this.IPlist_DoubleClick);
            this.IPlist.MouseClick += new System.Windows.Forms.MouseEventHandler(this.IPlist_MouseClick);
            // 
            // ChoseCamera_Form
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(445, 298);
            this.Controls.Add(this.IPlist);
            this.Controls.Add(this.button1);
            this.Name = "ChoseCamera_Form";
            this.Text = "选择相机";
            this.Load += new System.EventHandler(this.ChoseCamera_Form_Load);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.ListView IPlist;
    }
}
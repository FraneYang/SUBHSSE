namespace FaceRecognitioDemo
{
    partial class degregmng_Form
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
            this.deletepeopleimfo = new System.Windows.Forms.Button();
            this.deletepeopleimfo_all = new System.Windows.Forms.Button();
            this.showPersonImf = new System.Windows.Forms.ListView();
            this.show_picture = new System.Windows.Forms.PictureBox();
            this.later_page = new System.Windows.Forms.Button();
            this.previous_page = new System.Windows.Forms.Button();
            this.page = new System.Windows.Forms.TextBox();
            this.junp_to = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.textBox1 = new System.Windows.Forms.TextBox();
            ((System.ComponentModel.ISupportInitialize)(this.show_picture)).BeginInit();
            this.SuspendLayout();
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(23, 26);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(75, 23);
            this.button1.TabIndex = 0;
            this.button1.Text = "查询";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // deletepeopleimfo
            // 
            this.deletepeopleimfo.Location = new System.Drawing.Point(186, 26);
            this.deletepeopleimfo.Name = "deletepeopleimfo";
            this.deletepeopleimfo.Size = new System.Drawing.Size(75, 23);
            this.deletepeopleimfo.TabIndex = 1;
            this.deletepeopleimfo.Text = "删除";
            this.deletepeopleimfo.UseVisualStyleBackColor = true;
            this.deletepeopleimfo.Click += new System.EventHandler(this.deletepeopleimfo_Click);
            // 
            // deletepeopleimfo_all
            // 
            this.deletepeopleimfo_all.Location = new System.Drawing.Point(371, 26);
            this.deletepeopleimfo_all.Name = "deletepeopleimfo_all";
            this.deletepeopleimfo_all.Size = new System.Drawing.Size(75, 23);
            this.deletepeopleimfo_all.TabIndex = 2;
            this.deletepeopleimfo_all.Text = "删除所有";
            this.deletepeopleimfo_all.UseVisualStyleBackColor = true;
            this.deletepeopleimfo_all.Click += new System.EventHandler(this.deletepeopleimfo_all_Click);
            // 
            // showPersonImf
            // 
            this.showPersonImf.AllowColumnReorder = true;
            this.showPersonImf.FullRowSelect = true;
            this.showPersonImf.GridLines = true;
            this.showPersonImf.Location = new System.Drawing.Point(23, 55);
            this.showPersonImf.Name = "showPersonImf";
            this.showPersonImf.Size = new System.Drawing.Size(423, 194);
            this.showPersonImf.TabIndex = 3;
            this.showPersonImf.UseCompatibleStateImageBehavior = false;
            this.showPersonImf.View = System.Windows.Forms.View.Details;
            this.showPersonImf.SelectedIndexChanged += new System.EventHandler(this.showPersonImf_SelectedIndexChanged);
            this.showPersonImf.MouseClick += new System.Windows.Forms.MouseEventHandler(this.showPersonImf_MouseClick);
         
            // 
            // show_picture
            // 
            this.show_picture.Location = new System.Drawing.Point(514, 26);
            this.show_picture.Name = "show_picture";
            this.show_picture.Size = new System.Drawing.Size(218, 223);
            this.show_picture.SizeMode = System.Windows.Forms.PictureBoxSizeMode.Zoom;
            this.show_picture.TabIndex = 4;
            this.show_picture.TabStop = false;
            // 
            // later_page
            // 
            this.later_page.Location = new System.Drawing.Point(264, 253);
            this.later_page.Name = "later_page";
            this.later_page.Size = new System.Drawing.Size(64, 21);
            this.later_page.TabIndex = 26;
            this.later_page.Text = "下一页";
            this.later_page.UseVisualStyleBackColor = true;
            this.later_page.Click += new System.EventHandler(this.later_page_Click);
            // 
            // previous_page
            // 
            this.previous_page.Location = new System.Drawing.Point(23, 255);
            this.previous_page.Name = "previous_page";
            this.previous_page.Size = new System.Drawing.Size(64, 21);
            this.previous_page.TabIndex = 27;
            this.previous_page.Text = "上一页";
            this.previous_page.UseVisualStyleBackColor = true;
            this.previous_page.Click += new System.EventHandler(this.previous_page_Click);
            // 
            // page
            // 
            this.page.BackColor = System.Drawing.SystemColors.HighlightText;
            this.page.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.page.Location = new System.Drawing.Point(116, 255);
            this.page.Name = "page";
            this.page.Size = new System.Drawing.Size(40, 21);
            this.page.TabIndex = 29;
            this.page.Text = "1";
            this.page.TextChanged += new System.EventHandler(this.page_TextChanged);
            this.page.KeyDown += new System.Windows.Forms.KeyEventHandler(this.page_KeyDown);
            // 
            // junp_to
            // 
            this.junp_to.Location = new System.Drawing.Point(162, 252);
            this.junp_to.Name = "junp_to";
            this.junp_to.Size = new System.Drawing.Size(52, 23);
            this.junp_to.TabIndex = 30;
            this.junp_to.Text = "转到";
            this.junp_to.UseVisualStyleBackColor = true;
            this.junp_to.Click += new System.EventHandler(this.junp_to_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(360, 257);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(17, 12);
            this.label1.TabIndex = 31;
            this.label1.Text = "共";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(429, 256);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(17, 12);
            this.label2.TabIndex = 32;
            this.label2.Text = "页";
            // 
            // textBox1
            // 
            this.textBox1.BackColor = System.Drawing.SystemColors.HighlightText;
            this.textBox1.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.textBox1.Location = new System.Drawing.Point(383, 254);
            this.textBox1.Name = "textBox1";
            this.textBox1.Size = new System.Drawing.Size(40, 21);
            this.textBox1.TabIndex = 33;
            this.textBox1.Text = "1";
            // 
            // degregmng_Form
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 298);
            this.Controls.Add(this.textBox1);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.junp_to);
            this.Controls.Add(this.page);
            this.Controls.Add(this.previous_page);
            this.Controls.Add(this.later_page);
            this.Controls.Add(this.show_picture);
            this.Controls.Add(this.showPersonImf);
            this.Controls.Add(this.deletepeopleimfo_all);
            this.Controls.Add(this.deletepeopleimfo);
            this.Controls.Add(this.button1);
            this.Name = "degregmng_Form";
            this.Text = "查询";
            this.Load += new System.EventHandler(this.degregmng_Form_Load);
            ((System.ComponentModel.ISupportInitialize)(this.show_picture)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.Button deletepeopleimfo;
        private System.Windows.Forms.Button deletepeopleimfo_all;
        private System.Windows.Forms.ListView showPersonImf;
        private System.Windows.Forms.PictureBox show_picture;
        private System.Windows.Forms.Button later_page;
        private System.Windows.Forms.Button previous_page;
        private System.Windows.Forms.TextBox page;
        private System.Windows.Forms.Button junp_to;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox textBox1;
    }
}
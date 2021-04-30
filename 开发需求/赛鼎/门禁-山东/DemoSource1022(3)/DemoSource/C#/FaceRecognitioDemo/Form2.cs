using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace FaceRecognitioDemo
{
    public partial class Form2 : Form
    {
        public Form2()
        {
            InitializeComponent();
        }

        private void sure_Click(object sender, EventArgs e)
        {
            degregmng_Form form = (degregmng_Form)this.Owner;
            form.succdeleteall(true);
            this.Close();
        }

        private void cannel_Click(object sender, EventArgs e)
        {
            degregmng_Form form = (degregmng_Form)this.Owner;
            form.succdeleteall(false);
            this.Close();
        }

    }
}

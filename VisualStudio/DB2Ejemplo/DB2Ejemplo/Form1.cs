using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace DB2Ejemplo
{
    public partial class Form1 : Form
    {
        SqlConnection conexion;
        public Form1()
        {
            InitializeComponent();
        }

        private void cmdAlumnos_Click(object sender, EventArgs e)
        {
            frmAlumnos frm = new frmAlumnos();
            frm.StartPosition = FormStartPosition.CenterScreen;
            frm.ShowDialog();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            try
            {
                String url = "Server = 3.128.144.165; Database = DB2202503V; User Id = db2; Password = 123;";
                conexion = new SqlConnection(url);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void cmdMaterias_Click(object sender, EventArgs e)
        {
            frmMateria frm = new frmMateria(conexion);
            frm.StartPosition = FormStartPosition.CenterScreen;
            frm.ShowDialog();
        }
    }
}

using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace DB2Ejemplo
{
    public partial class frmAlumnos : Form
    {
        public frmAlumnos()
        {
            InitializeComponent();
        }

        private void frmAlumnos_Load(object sender, EventArgs e)
        {
            try
            {
                String url = "Server = 3.128.144.165; Database = DB2202503V; User Id = db2; Password = 123;";
                SqlConnection conexion = new SqlConnection(url);
                SqlDataAdapter adpatador = new SqlDataAdapter("select * from vAlumnoCarrera", conexion);
                DataTable tabAlumnos = new DataTable();

                adpatador.Fill(tabAlumnos);
                dataGridView1.DataSource = tabAlumnos;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
    }
}

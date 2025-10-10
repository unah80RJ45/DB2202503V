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
    public partial class frmMateria : Form
    {
        SqlConnection connect;
        SqlDataAdapter adpMateria;
        DataTable tabMateria;

        public frmMateria()
        {
            InitializeComponent();
        }
        public frmMateria(SqlConnection cnx)
        {
            InitializeComponent();

            connect = cnx;
        }

        private void frmMateria_Load(object sender, EventArgs e)
        {
            try
            {
                SqlCommand cmd = new SqlCommand("spDeleteMateria", connect);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@materiaid", SqlDbType.Int, 4, "MateriaID");

                adpMateria = new SqlDataAdapter();
                adpMateria.SelectCommand = new SqlCommand();
                adpMateria.SelectCommand.CommandText = "spSelectMateria";
                adpMateria.SelectCommand.Connection = connect;
                adpMateria.SelectCommand.CommandType = CommandType.StoredProcedure;

                adpMateria.InsertCommand = new SqlCommand("spInsertMateria", connect);
                adpMateria.InsertCommand.CommandType = CommandType.StoredProcedure;
                adpMateria.InsertCommand.Parameters.Add("@mat", SqlDbType.Int, 4, "MateriaID");
                adpMateria.InsertCommand.Parameters.Add("@nom", SqlDbType.VarChar, 50, "Nombre");
                adpMateria.InsertCommand.Parameters.Add("@unidades", SqlDbType.Int, 4, "UV");
                adpMateria.InsertCommand.Parameters.Add("@lab", SqlDbType.Bit, 1, "laboratorio");
                adpMateria.InsertCommand.Parameters["@mat"].Direction = ParameterDirection.InputOutput;

                adpMateria.UpdateCommand = new SqlCommand("spUpdateMateria");
                adpMateria.UpdateCommand.Connection = connect;
                adpMateria.UpdateCommand.CommandType = CommandType.StoredProcedure;
                adpMateria.UpdateCommand.Parameters.Add("@materiaid", SqlDbType.Int, 4, "MateriaID");
                adpMateria.UpdateCommand.Parameters.Add("@nombre", SqlDbType.VarChar, 50, "Nombre");
                adpMateria.UpdateCommand.Parameters.Add("@laboratorio", SqlDbType.Bit, 1, "laboratorio");
                adpMateria.UpdateCommand.Parameters.Add("@uv", SqlDbType.Int, 4, "UV");

                adpMateria.DeleteCommand = cmd;

                tabMateria = new DataTable();
                adpMateria.Fill(tabMateria);
                dataGridView1.DataSource = tabMateria;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void cmdSalvar_Click(object sender, EventArgs e)
        {
            try
            {
                adpMateria.Update(tabMateria);
                MessageBox.Show("Datos salvados satisfactoriamente", "Confimacion", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
    }
}

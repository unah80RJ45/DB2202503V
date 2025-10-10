namespace DB2Ejemplo
{
    partial class Form1
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
            this.cmdAlumnos = new System.Windows.Forms.Button();
            this.cmdMaterias = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // cmdAlumnos
            // 
            this.cmdAlumnos.Location = new System.Drawing.Point(67, 80);
            this.cmdAlumnos.Name = "cmdAlumnos";
            this.cmdAlumnos.Size = new System.Drawing.Size(208, 54);
            this.cmdAlumnos.TabIndex = 0;
            this.cmdAlumnos.Text = "Vista Alumnos";
            this.cmdAlumnos.UseVisualStyleBackColor = true;
            this.cmdAlumnos.Click += new System.EventHandler(this.cmdAlumnos_Click);
            // 
            // cmdMaterias
            // 
            this.cmdMaterias.Location = new System.Drawing.Point(281, 80);
            this.cmdMaterias.Name = "cmdMaterias";
            this.cmdMaterias.Size = new System.Drawing.Size(208, 54);
            this.cmdMaterias.TabIndex = 1;
            this.cmdMaterias.Text = "Materias";
            this.cmdMaterias.UseVisualStyleBackColor = true;
            this.cmdMaterias.Click += new System.EventHandler(this.cmdMaterias_Click);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(722, 451);
            this.Controls.Add(this.cmdMaterias);
            this.Controls.Add(this.cmdAlumnos);
            this.Name = "Form1";
            this.Text = "Form1";
            this.Load += new System.EventHandler(this.Form1_Load);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button cmdAlumnos;
        private System.Windows.Forms.Button cmdMaterias;
    }
}


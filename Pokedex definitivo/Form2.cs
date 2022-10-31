using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.IO;

namespace Pokedex_definitivo
{
    public partial class Form2 : Form
    {
        public Form2()
        {
            InitializeComponent();
        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {

        }

        private void Form2_Load(object sender, EventArgs e)
        {
            // TODO: esta línea de código carga datos en la tabla 'pokedexDataSet.Entrenador' Puede moverla o quitarla según sea necesario.
            this.entrenadorTableAdapter.Fill(this.pokedexDataSet.Entrenador);

        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void label7_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
           
            // Mostrara un mensaje si los campos no estan llenos 
            if (textBox2.Text.Trim().Equals("") || textBox3.Text.Trim().Equals(""))
            {
                MessageBox.Show("Los campos estan basios");
                return;

            }

            

            using (Model.PokedexEntities db = new Model.PokedexEntities())
            {
                // Conexiona a la base de datos y enviado del mismo
                Model.Entrenador oentre = new Model.Entrenador();
                  
                oentre.en_usuario = textBox2.Text.Trim();
                oentre.en_clave = textBox3.Text.Trim();
                oentre.en_nombre = textBox4.Text.Trim();
                oentre.en_edad = Convert.ToInt32(textBox5.Text);
                oentre.en_genero = comboBox1.Text.Trim();


                db.Entrenadors.Add(oentre);
                
                db.SaveChanges();
                MessageBox.Show("Enviado a la base de datos");

                
                textBox2.Clear();
                textBox3.Clear();
                textBox4.Clear();
                textBox5.Clear();
                
            }
    }

        private void button2_Click(object sender, EventArgs e)
        {
            // Cambio a la siguiente ventana
            Form3 form3 = new Form3();
            form3.Show();
            this.Hide();
        }
    }
}
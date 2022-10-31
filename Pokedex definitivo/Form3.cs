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
    public partial class Form3 : Form
    {
        public Form3()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {

            if (textBox2.Text.Trim().Equals("") || textBox3.Text.Trim().Equals(""))
            {
                MessageBox.Show("Los campos estan vacios");
                return;

            }

            byte[] file = null;

            Stream myStream = openFileDialog1.OpenFile();
            using (MemoryStream ms = new MemoryStream())
            {
                myStream.CopyTo(ms);
                file = ms.ToArray();


            }

            using (Model.PokedexEntities db = new Model.PokedexEntities())
            {

                Model.Pokemon oentre = new Model.Pokemon();
                
                oentre.pk_nombre = textBox2.Text.Trim();
                oentre.pk_altura = Convert.ToDouble(textBox3.Text);
                oentre.pk_peso = Convert.ToDouble(textBox4.Text);
                oentre.pk_descripcion = textBox5.Text.Trim();
                oentre.pk_foto = file;
                oentre.pk_genero = comboBox1.Text.Trim();



                db.Pokemons.Add(oentre);

                db.SaveChanges();
                MessageBox.Show("Se guardo exitosamente.");


                textBox2.Clear();
                textBox3.Clear();
                textBox4.Clear();
                textBox5.Clear();
                textBox6.Clear();
                
            }


        }

        private void Form3_Load(object sender, EventArgs e)
        {
            

            
    }

        private void button3_Click(object sender, EventArgs e)
        {
            openFileDialog1.InitialDirectory = "C:\\";
            openFileDialog1.Filter = "Imágenes png (*.png) |*.png|Imágenes png (*.png)|*.png  ";
            openFileDialog1.FilterIndex = 1;
            openFileDialog1.RestoreDirectory = true;


            if (openFileDialog1.ShowDialog() == DialogResult.OK)
            {
                textBox6.Text = openFileDialog1.FileName;
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Form4 form4 = new Form4();
            form4.Show();
            this.Hide();
        }
    }
}
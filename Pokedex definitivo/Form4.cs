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

namespace Pokedex_definitivo
{
    public partial class Form4 : Form
    {
        public Form4()
        {
            InitializeComponent();
        }

        private int pokemon = 1;
        private int resultado = 6;

        private void suma()
        {


            textBox1.Text = Convert.ToString(resultado);
        }

        private void mostrardatas()
        {


            SqlConnection conexion = new SqlConnection("server=DESKTOP-7OJ18SU\\SQLEXPRESS ; database=Pokedex ; integrated security = true");

            SqlCommand comadno = new SqlCommand("Select * from Pokemon where n_pokedex = @n_pokedex  ", conexion);
            comadno.Parameters.AddWithValue("@n_pokedex", textBox1.Text);
            conexion.Open();
            SqlDataReader dr = comadno.ExecuteReader();

            if (dr.Read())
            {
                textBox2.Text = dr["pk_nombre"].ToString();
                textBox3.Text = dr["pk_altura"].ToString();
                textBox4.Text = dr["pk_peso"].ToString();
                textBox5.Text = dr["pk_descripcion"].ToString();
                textBox6.Text = dr["pk_genero"].ToString();


            }



        }
        private void mostrarimagen()
        {
            string file = pokemon.ToString("000");

            //D:\Descargas D\Visual Studio\Pokedex definitivo\Pokedex definitivo\Imagen Pokemon
            string pfile = $"C:\\Users\\Daniel Villacres\\Downloads\\Pokedex definitivo\\Pokedex definitivo\\images Pokemon\\{ file}.png";
            pictureBox1.Image = Image.FromFile(pfile);

        }

        private void Form4_Load(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            Form3 form3 = new Form3();
            form3.Show();
            this.Hide();
        }

        private void button2_Click(object sender, EventArgs e)
        {

            if (pokemon < 100 )
            {
                pokemon++;
                resultado++;

            }
            
            mostrarimagen();
            suma();
            mostrardatas();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            if (pokemon < 100 || resultado < 100)
            {
                pokemon--;
                resultado--;

            }
            mostrarimagen();
            suma();
            mostrardatas();
        }
    }
}

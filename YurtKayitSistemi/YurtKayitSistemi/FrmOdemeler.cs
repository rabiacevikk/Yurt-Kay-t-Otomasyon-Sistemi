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

namespace YurtKayitSistemi
{
    public partial class FrmOdemeler: Form
    {
        public FrmOdemeler()
        {
            InitializeComponent();
        }
        Sqlbaglantim bgl = new Sqlbaglantim();
        private void FrmOdemeler_Load(object sender, EventArgs e)
        {
            // TODO: This line of code loads data into the 'yurtKayitDBDataSet3.Borclar' table. You can move, or remove it, as needed.
            this.borclarTableAdapter.Fill(this.yurtKayitDBDataSet3.Borclar);

        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            int secilen;
            string id, ad, soyad, kalan;
            secilen = dataGridView1.SelectedCells[0].RowIndex;
            id = dataGridView1.Rows[secilen].Cells[0].Value.ToString();
            ad = dataGridView1.Rows[secilen].Cells[1].Value.ToString();
            soyad = dataGridView1.Rows[secilen].Cells[2].Value.ToString();
            kalan = dataGridView1.Rows[secilen].Cells[3].Value.ToString();
            TxtAd.Text = ad;
            TxtSoyad.Text = soyad;
            TxtKalanBorc.Text = kalan;
            Txtid.Text = id;


        }

        private void BtnOdemeAl_Click(object sender, EventArgs e)
        {
            //Ödenen Tutarı kalan tutardan düşme
            int odenen, kalan,yeniborc;
            odenen = Convert.ToInt32(TxtOdenen.Text);
            kalan = Convert.ToInt32(TxtKalanBorc.Text);
            yeniborc = kalan - odenen;
            TxtKalanBorc.Text = yeniborc.ToString();
            //Yeni tutartı veri tabanına kaydetme
            SqlCommand komut = new SqlCommand("update Borclar set OgrKalanBorc=@p1 where Ogrid=@p2", bgl.baglanti());
            komut.Parameters.AddWithValue("p2", Txtid.Text);
            komut.Parameters.AddWithValue("@p1", TxtKalanBorc.Text);
            komut.ExecuteNonQuery();
            bgl.baglanti().Close();
            MessageBox.Show("Borç Ödendi");
            this.borclarTableAdapter.Fill(this.yurtKayitDBDataSet3.Borclar);


            //Kasa Tablosuna Ekleme Yapma
            SqlCommand komut2 = new SqlCommand("insert into Kasa (OdemeAy,OdemeMiktar) values (@k1,@k2)", bgl.baglanti());
            komut2.Parameters.AddWithValue("@k1", TxtOdenenAy.Text);
            komut2.Parameters.AddWithValue("@k2", TxtOdenen.Text);
            komut2.ExecuteNonQuery();
            bgl.baglanti().Close();


        }
    }
}

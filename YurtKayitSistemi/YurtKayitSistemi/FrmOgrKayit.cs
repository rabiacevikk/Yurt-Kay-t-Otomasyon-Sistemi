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
    public partial class FrmOgrKayit : Form
    {
        public FrmOgrKayit()
        {
            InitializeComponent();
        }
        Sqlbaglantim bgl = new Sqlbaglantim();
        private void FrmOgrKayit_Load(object sender, EventArgs e)
        {
            SqlCommand komut = new SqlCommand("Select BolumAd From Bolumler", bgl.baglanti());
                //Bölümleri Listeleme Komutu
            
            SqlDataReader oku = komut.ExecuteReader();
            while (oku.Read())
            {
                CmbBolum.Items.Add(oku[0].ToString());
            }
            bgl.baglanti().Close();

             //Boş Odaları Listeleme Komutu
            SqlCommand komut2 = new SqlCommand("Select OdaNo From Odalar where  OdaKapasite !=OdaAktif", bgl.baglanti());
            SqlDataReader oku2 = komut2.ExecuteReader();
            while (oku2.Read())
            {
                cmbOdaNo.Items.Add(oku2[0].ToString());
            }
            bgl.baglanti().Close();
        }

        private void btnKaydet_Click(object sender, EventArgs e)
        {
           
                SqlCommand komutkaydet = new SqlCommand("insert into Ogrenci (OgrAd,OgrSoyad,OgrTc,OgrTelefon,OgrDogum,OgrBolum,OgrMail,OgrOdaNo,OgrVeliAdSoyad,OgrVeliTelefon,OgrVeliAdres) values (@p1,@p2,@p3,@p4,@p5,@p6,@p7,@p8,@p9,@p10,@p11)", bgl.baglanti());
                komutkaydet.Parameters.AddWithValue("@p1", TxtAd.Text);
                komutkaydet.Parameters.AddWithValue("@p2", TxtSoyad.Text);
                komutkaydet.Parameters.AddWithValue("@p3", MskTC.Text);
                komutkaydet.Parameters.AddWithValue("@p4", MskTelefon.Text);
                komutkaydet.Parameters.AddWithValue("@p5", MskDogumTarihi.Text);
                komutkaydet.Parameters.AddWithValue("@p6", CmbBolum.Text);
                komutkaydet.Parameters.AddWithValue("@p7", txtMail.Text);
                komutkaydet.Parameters.AddWithValue("@p8", cmbOdaNo.Text);
                komutkaydet.Parameters.AddWithValue("@p9", TxtVeliAdSoy.Text);
                komutkaydet.Parameters.AddWithValue("@p10", MskVeliTelefon.Text);
                komutkaydet.Parameters.AddWithValue("@p11", RtAdres.Text);
                komutkaydet.ExecuteNonQuery();
                MessageBox.Show("Kayıt Başarılı Şekilde Yapıldı", "Bilgi", MessageBoxButtons.OK, MessageBoxIcon.Information);



                //Öğrenci id yi labele çekme
                SqlCommand komut = new SqlCommand("select Ogrid, OgrAd, OgrSoyad from Ogrenci", bgl.baglanti());
                SqlDataReader oku = komut.ExecuteReader();
                while (oku.Read())
                {
                    label12.Text = oku[0].ToString();
                TxtAd.Text = oku[1].ToString();
                TxtSoyad.Text = oku[2].ToString();
                }



                //Öğrenci Borç Alanı Oluşturma
                
                SqlCommand komutkaydet2 = new SqlCommand("insert into Borclar (Ogrid,OgrAd,OgrSoyad) values (@b1,@b2,@b3)", bgl.baglanti());
                komutkaydet2.Parameters.AddWithValue("@b1",label12.Text);
                komutkaydet2.Parameters.AddWithValue("@b2",TxtAd.Text);
                komutkaydet2.Parameters.AddWithValue("@b3", TxtSoyad.Text);
                komutkaydet2.ExecuteNonQuery();
                bgl.baglanti().Close();

            //Öğrenci Oda Kontejanı Arttırma
            SqlCommand komutoda = new SqlCommand("update Odalar set OdaAktif=OdaAktif+1 where OdaNo=@oda1", bgl.baglanti());
            komutoda.Parameters.AddWithValue("@oda1", cmbOdaNo.Text);
            komutoda.ExecuteNonQuery();
            bgl.baglanti().Close();
        }
    }
}

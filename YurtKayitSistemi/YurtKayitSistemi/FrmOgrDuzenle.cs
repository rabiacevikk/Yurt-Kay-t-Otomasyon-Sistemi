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
    public partial class FrmOgrDuzenle : Form
    {
        public FrmOgrDuzenle()
        {
            InitializeComponent();
        }
        Sqlbaglantim bgl = new Sqlbaglantim();
        public string id, ad, soyad, TC, telefon, dogum, bolum;

        private void BtnSil_Click(object sender, EventArgs e)
        {
            //Öğrenci Silme
            SqlCommand komutsil = new SqlCommand("delete from Ogrenci where ogrid=@k1", bgl.baglanti());
            komutsil.Parameters.AddWithValue("@k1", Txtid.Text);
            komutsil.ExecuteNonQuery();
            bgl.baglanti().Close();
            MessageBox.Show("Kayıt Silindi", "Bilgi", MessageBoxButtons.OK, MessageBoxIcon.Information);

            //Odanın Aktif Öğrenci Sayısını Azaltma
            SqlCommand komutoda = new SqlCommand("update Odalar set OdaAktif=OdaAktif-1 where OdaNo=@oda", bgl.baglanti());
            komutoda.Parameters.AddWithValue("@oda", cmbOdaNo.Text);
            komutoda.ExecuteNonQuery();
            bgl.baglanti().Close();
        }

        private void BtnGuncelle_Click(object sender, EventArgs e)
        {
            try
            {


                SqlCommand komut = new SqlCommand("update Ogrenci set OgrAd=@p2,OgrSoyad=@p3,OgrTc=@p4,OgrTelefon=@p5,OgrDogum=@p6,OgrBolum=@p7,OgrMail=@p8,OgrOdaNo=@p9,OgrVeliAdSoyad=@p10,OgrVeliTelefon=@p11,OgrVeliAdres=@p12 Where Ogrid=@p1", bgl.baglanti());
                komut.Parameters.AddWithValue("@p1", Txtid.Text);
                komut.Parameters.AddWithValue("@p2", TxtAd.Text);
                komut.Parameters.AddWithValue("@p3", TxtSoyad.Text);
                komut.Parameters.AddWithValue("@p4", MskTC.Text);
                komut.Parameters.AddWithValue("@p5", MskTelefon.Text);
                komut.Parameters.AddWithValue("@p6", MskDogumTarihi.Text);
                komut.Parameters.AddWithValue("@p7", CmbBolum.Text);
                komut.Parameters.AddWithValue("@p8", txtMail.Text);
                komut.Parameters.AddWithValue("@p9", cmbOdaNo.Text);
                komut.Parameters.AddWithValue("@p10", TxtVeliAdSoy.Text);
                komut.Parameters.AddWithValue("@p11", MskVeliTelefon.Text);
                komut.Parameters.AddWithValue("@p12", RtAdres.Text);
                komut.ExecuteNonQuery();
                MessageBox.Show("Güncelleme Yapıldı!", "Bilgi", MessageBoxButtons.OK, MessageBoxIcon.Information);
                bgl.baglanti().Close();
            }
            catch (Exception)
            {

                MessageBox.Show("Hata!!!", "Bilgi", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }

        }

        public string mail, odaNo, veliAd, veliTel, adres;
        private void FrmOgrDuzenle_Load(object sender, EventArgs e)
        {
            Txtid.Text = id;
            TxtAd.Text = ad;
            TxtSoyad.Text = soyad;
            MskTC.Text = TC;
            MskTelefon.Text = telefon;
            MskDogumTarihi.Text = dogum;
            CmbBolum.Text = bolum;
            txtMail.Text = mail;
            cmbOdaNo.Text = odaNo;
            TxtVeliAdSoy.Text = veliAd;
            MskVeliTelefon.Text = veliTel;
            RtAdres.Text = adres;
        }
    }
}

USE [master]
GO
/****** Object:  Database [YurtKayitDB]    Script Date: 21.02.2021 10:42:30 ******/
CREATE DATABASE [YurtKayitDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'YurtKayitDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER01\MSSQL\DATA\YurtKayitDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'YurtKayitDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER01\MSSQL\DATA\YurtKayitDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [YurtKayitDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [YurtKayitDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [YurtKayitDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [YurtKayitDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [YurtKayitDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [YurtKayitDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [YurtKayitDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [YurtKayitDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [YurtKayitDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [YurtKayitDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [YurtKayitDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [YurtKayitDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [YurtKayitDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [YurtKayitDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [YurtKayitDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [YurtKayitDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [YurtKayitDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [YurtKayitDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [YurtKayitDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [YurtKayitDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [YurtKayitDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [YurtKayitDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [YurtKayitDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [YurtKayitDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [YurtKayitDB] SET RECOVERY FULL 
GO
ALTER DATABASE [YurtKayitDB] SET  MULTI_USER 
GO
ALTER DATABASE [YurtKayitDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [YurtKayitDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [YurtKayitDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [YurtKayitDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [YurtKayitDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [YurtKayitDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'YurtKayitDB', N'ON'
GO
ALTER DATABASE [YurtKayitDB] SET QUERY_STORE = OFF
GO
USE [YurtKayitDB]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 21.02.2021 10:42:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[Yoneticiid] [tinyint] IDENTITY(1,1) NOT NULL,
	[YoneticiAd] [varchar](20) NULL,
	[YoneticiSifre] [varchar](20) NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[Yoneticiid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bolumler]    Script Date: 21.02.2021 10:42:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bolumler](
	[Bolumid] [int] IDENTITY(1,1) NOT NULL,
	[BolumAd] [varchar](50) NULL,
 CONSTRAINT [PK_Bolumler] PRIMARY KEY CLUSTERED 
(
	[Bolumid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Borclar]    Script Date: 21.02.2021 10:42:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Borclar](
	[Ogrid] [int] NULL,
	[OgrAd] [varchar](50) NULL,
	[OgrSoyad] [nchar](10) NULL,
	[OgrKalanBorc] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Giderler]    Script Date: 21.02.2021 10:42:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Giderler](
	[Odemeid] [smallint] IDENTITY(1,1) NOT NULL,
	[Elektrik] [int] NULL,
	[Su] [int] NULL,
	[Dogalgaz] [int] NULL,
	[internet] [int] NULL,
	[Gıda] [int] NULL,
	[Personel] [int] NULL,
	[Diger] [int] NULL,
 CONSTRAINT [PK_Giderler] PRIMARY KEY CLUSTERED 
(
	[Odemeid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kasa]    Script Date: 21.02.2021 10:42:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kasa](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[OdemeAy] [varchar](50) NULL,
	[OdemeMiktar] [int] NULL,
 CONSTRAINT [PK_Kasa] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Odalar]    Script Date: 21.02.2021 10:42:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Odalar](
	[Odaid] [tinyint] IDENTITY(1,1) NOT NULL,
	[OdaNo] [char](3) NULL,
	[OdaKapasite] [char](1) NULL,
	[OdaAktif] [char](1) NULL,
	[OdaDurum] [bit] NULL,
 CONSTRAINT [PK_Odalar] PRIMARY KEY CLUSTERED 
(
	[Odaid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ogrenci]    Script Date: 21.02.2021 10:42:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ogrenci](
	[Ogrid] [int] IDENTITY(1,1) NOT NULL,
	[OgrAd] [varchar](20) NULL,
	[OgrSoyad] [varchar](30) NULL,
	[OgrTc] [char](11) NULL,
	[OgrTelefon] [varchar](20) NULL,
	[OgrDogum] [varchar](12) NULL,
	[OgrBolum] [varchar](25) NULL,
	[OgrMail] [varchar](50) NULL,
	[OgrOdaNo] [char](3) NULL,
	[OgrVeliAdSoyad] [varchar](50) NULL,
	[OgrVeliTelefon] [varchar](20) NULL,
	[OgrVeliAdres] [varchar](200) NULL,
 CONSTRAINT [PK_Ogrenci] PRIMARY KEY CLUSTERED 
(
	[Ogrid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Personel]    Script Date: 21.02.2021 10:42:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Personel](
	[Personelid] [tinyint] IDENTITY(1,1) NOT NULL,
	[PersonelAdSoyad] [varchar](50) NULL,
	[PersonelDepartman] [varchar](30) NULL,
 CONSTRAINT [PK_Personel] PRIMARY KEY CLUSTERED 
(
	[Personelid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Admin] ON 

INSERT [dbo].[Admin] ([Yoneticiid], [YoneticiAd], [YoneticiSifre]) VALUES (1, N'yurtotosisadmin', N'123456**')
INSERT [dbo].[Admin] ([Yoneticiid], [YoneticiAd], [YoneticiSifre]) VALUES (2, N'yonetici7', N'20304050--')
INSERT [dbo].[Admin] ([Yoneticiid], [YoneticiAd], [YoneticiSifre]) VALUES (3, N'admin1010', N'01010102*')
INSERT [dbo].[Admin] ([Yoneticiid], [YoneticiAd], [YoneticiSifre]) VALUES (5, N'Derya2134', N'01040708')
INSERT [dbo].[Admin] ([Yoneticiid], [YoneticiAd], [YoneticiSifre]) VALUES (6, N'admin', N'123')
INSERT [dbo].[Admin] ([Yoneticiid], [YoneticiAd], [YoneticiSifre]) VALUES (8, N'rabia', N'7777')
SET IDENTITY_INSERT [dbo].[Admin] OFF
GO
SET IDENTITY_INSERT [dbo].[Bolumler] ON 

INSERT [dbo].[Bolumler] ([Bolumid], [BolumAd]) VALUES (1, N'Bilgisayar Mühendisliği')
INSERT [dbo].[Bolumler] ([Bolumid], [BolumAd]) VALUES (2, N'Elektronik Mühendisi')
INSERT [dbo].[Bolumler] ([Bolumid], [BolumAd]) VALUES (3, N'Otomotiv Mühendisliği')
INSERT [dbo].[Bolumler] ([Bolumid], [BolumAd]) VALUES (4, N'Mekatronik Mühendisliği')
INSERT [dbo].[Bolumler] ([Bolumid], [BolumAd]) VALUES (5, N'İşletme')
INSERT [dbo].[Bolumler] ([Bolumid], [BolumAd]) VALUES (6, N'Uluslarası İlişkiler')
INSERT [dbo].[Bolumler] ([Bolumid], [BolumAd]) VALUES (7, N'Eczacı')
INSERT [dbo].[Bolumler] ([Bolumid], [BolumAd]) VALUES (8, N'Tıp')
INSERT [dbo].[Bolumler] ([Bolumid], [BolumAd]) VALUES (9, N'Hukuk')
INSERT [dbo].[Bolumler] ([Bolumid], [BolumAd]) VALUES (10, N'Hemşire')
INSERT [dbo].[Bolumler] ([Bolumid], [BolumAd]) VALUES (11, N'Yazılım Mühendisliği')
INSERT [dbo].[Bolumler] ([Bolumid], [BolumAd]) VALUES (12, N'Türkçe Öğretmeni')
INSERT [dbo].[Bolumler] ([Bolumid], [BolumAd]) VALUES (13, N'Diş Hekimliği')
INSERT [dbo].[Bolumler] ([Bolumid], [BolumAd]) VALUES (14, N'Veterinerlik')
INSERT [dbo].[Bolumler] ([Bolumid], [BolumAd]) VALUES (15, N'Matematik')
INSERT [dbo].[Bolumler] ([Bolumid], [BolumAd]) VALUES (16, N'Coğrafya')
INSERT [dbo].[Bolumler] ([Bolumid], [BolumAd]) VALUES (17, N'Fizik')
INSERT [dbo].[Bolumler] ([Bolumid], [BolumAd]) VALUES (18, N'İç Mimar')
INSERT [dbo].[Bolumler] ([Bolumid], [BolumAd]) VALUES (19, N'Makine Mühendisliği')
INSERT [dbo].[Bolumler] ([Bolumid], [BolumAd]) VALUES (20, N'İnşaat Mühendisliği')
INSERT [dbo].[Bolumler] ([Bolumid], [BolumAd]) VALUES (21, N'Gemi Mühendisliği')
INSERT [dbo].[Bolumler] ([Bolumid], [BolumAd]) VALUES (23, N'Uçak Mühendisliği')
INSERT [dbo].[Bolumler] ([Bolumid], [BolumAd]) VALUES (26, N'Diyetisyenlik')
INSERT [dbo].[Bolumler] ([Bolumid], [BolumAd]) VALUES (27, N'Adalet ')
SET IDENTITY_INSERT [dbo].[Bolumler] OFF
GO
INSERT [dbo].[Borclar] ([Ogrid], [OgrAd], [OgrSoyad], [OgrKalanBorc]) VALUES (18, N'Halime', N'Kılıç     ', 2900)
INSERT [dbo].[Borclar] ([Ogrid], [OgrAd], [OgrSoyad], [OgrKalanBorc]) VALUES (1, N'Gülin', N'Yıldırım  ', 2500)
INSERT [dbo].[Borclar] ([Ogrid], [OgrAd], [OgrSoyad], [OgrKalanBorc]) VALUES (2, N'Rabia', N'Çevik     ', 2328)
INSERT [dbo].[Borclar] ([Ogrid], [OgrAd], [OgrSoyad], [OgrKalanBorc]) VALUES (12, N'Zehra', N'Bulut     ', 2650)
INSERT [dbo].[Borclar] ([Ogrid], [OgrAd], [OgrSoyad], [OgrKalanBorc]) VALUES (19, N'Ela', N'Erdoğan   ', 3000)
INSERT [dbo].[Borclar] ([Ogrid], [OgrAd], [OgrSoyad], [OgrKalanBorc]) VALUES (20, N'Samira', N'Demiroğ   ', 3000)
INSERT [dbo].[Borclar] ([Ogrid], [OgrAd], [OgrSoyad], [OgrKalanBorc]) VALUES (21, N'Selma', N'dddsd     ', 3000)
INSERT [dbo].[Borclar] ([Ogrid], [OgrAd], [OgrSoyad], [OgrKalanBorc]) VALUES (22, N'Ela', N'Erdoğan   ', 3000)
INSERT [dbo].[Borclar] ([Ogrid], [OgrAd], [OgrSoyad], [OgrKalanBorc]) VALUES (23, N'Meryem', N'Çevik     ', 2750)
GO
SET IDENTITY_INSERT [dbo].[Giderler] ON 

INSERT [dbo].[Giderler] ([Odemeid], [Elektrik], [Su], [Dogalgaz], [internet], [Gıda], [Personel], [Diger]) VALUES (1, 1800, 2700, 5000, 150, 7000, 12000, 7800)
SET IDENTITY_INSERT [dbo].[Giderler] OFF
GO
SET IDENTITY_INSERT [dbo].[Kasa] ON 

INSERT [dbo].[Kasa] ([id], [OdemeAy], [OdemeMiktar]) VALUES (1, N'13 Şubat ', 250)
INSERT [dbo].[Kasa] ([id], [OdemeAy], [OdemeMiktar]) VALUES (2, N'15 Şubat', 500)
INSERT [dbo].[Kasa] ([id], [OdemeAy], [OdemeMiktar]) VALUES (3, N'17 Şubat ', 1000)
INSERT [dbo].[Kasa] ([id], [OdemeAy], [OdemeMiktar]) VALUES (4, N'17 Mart', 260)
INSERT [dbo].[Kasa] ([id], [OdemeAy], [OdemeMiktar]) VALUES (5, N'22 Mart', 400)
INSERT [dbo].[Kasa] ([id], [OdemeAy], [OdemeMiktar]) VALUES (6, N'2 Şubat', 280)
INSERT [dbo].[Kasa] ([id], [OdemeAy], [OdemeMiktar]) VALUES (7, N'7 Nisan', 350)
INSERT [dbo].[Kasa] ([id], [OdemeAy], [OdemeMiktar]) VALUES (8, N'17 Nisan', 100)
INSERT [dbo].[Kasa] ([id], [OdemeAy], [OdemeMiktar]) VALUES (9, N'14 Şubat', 300)
INSERT [dbo].[Kasa] ([id], [OdemeAy], [OdemeMiktar]) VALUES (10, N'14 Şubat', 250)
SET IDENTITY_INSERT [dbo].[Kasa] OFF
GO
SET IDENTITY_INSERT [dbo].[Odalar] ON 

INSERT [dbo].[Odalar] ([Odaid], [OdaNo], [OdaKapasite], [OdaAktif], [OdaDurum]) VALUES (1, N'101', N'1', N'1', 1)
INSERT [dbo].[Odalar] ([Odaid], [OdaNo], [OdaKapasite], [OdaAktif], [OdaDurum]) VALUES (2, N'102', N'1', N'0', 1)
INSERT [dbo].[Odalar] ([Odaid], [OdaNo], [OdaKapasite], [OdaAktif], [OdaDurum]) VALUES (3, N'103', N'1', N'1', 1)
INSERT [dbo].[Odalar] ([Odaid], [OdaNo], [OdaKapasite], [OdaAktif], [OdaDurum]) VALUES (4, N'104', N'1', N'0', 1)
INSERT [dbo].[Odalar] ([Odaid], [OdaNo], [OdaKapasite], [OdaAktif], [OdaDurum]) VALUES (5, N'105', N'1', N'1', 1)
INSERT [dbo].[Odalar] ([Odaid], [OdaNo], [OdaKapasite], [OdaAktif], [OdaDurum]) VALUES (6, N'201', N'2', N'0', 1)
INSERT [dbo].[Odalar] ([Odaid], [OdaNo], [OdaKapasite], [OdaAktif], [OdaDurum]) VALUES (7, N'202', N'2', N'0', 1)
INSERT [dbo].[Odalar] ([Odaid], [OdaNo], [OdaKapasite], [OdaAktif], [OdaDurum]) VALUES (8, N'203', N'2', N'0', 1)
INSERT [dbo].[Odalar] ([Odaid], [OdaNo], [OdaKapasite], [OdaAktif], [OdaDurum]) VALUES (9, N'204', N'2', N'0', 1)
INSERT [dbo].[Odalar] ([Odaid], [OdaNo], [OdaKapasite], [OdaAktif], [OdaDurum]) VALUES (10, N'205', N'2', N'0', 1)
INSERT [dbo].[Odalar] ([Odaid], [OdaNo], [OdaKapasite], [OdaAktif], [OdaDurum]) VALUES (11, N'301', N'3', N'0', 1)
INSERT [dbo].[Odalar] ([Odaid], [OdaNo], [OdaKapasite], [OdaAktif], [OdaDurum]) VALUES (12, N'302', N'3', N'3', 1)
INSERT [dbo].[Odalar] ([Odaid], [OdaNo], [OdaKapasite], [OdaAktif], [OdaDurum]) VALUES (13, N'303', N'3', N'0', 1)
INSERT [dbo].[Odalar] ([Odaid], [OdaNo], [OdaKapasite], [OdaAktif], [OdaDurum]) VALUES (14, N'304', N'3', N'0', 1)
INSERT [dbo].[Odalar] ([Odaid], [OdaNo], [OdaKapasite], [OdaAktif], [OdaDurum]) VALUES (15, N'305', N'3', N'0', 1)
INSERT [dbo].[Odalar] ([Odaid], [OdaNo], [OdaKapasite], [OdaAktif], [OdaDurum]) VALUES (16, N'401', N'4', N'1', 1)
INSERT [dbo].[Odalar] ([Odaid], [OdaNo], [OdaKapasite], [OdaAktif], [OdaDurum]) VALUES (17, N'402', N'4', N'4', 1)
INSERT [dbo].[Odalar] ([Odaid], [OdaNo], [OdaKapasite], [OdaAktif], [OdaDurum]) VALUES (18, N'403', N'4', N'0', 1)
INSERT [dbo].[Odalar] ([Odaid], [OdaNo], [OdaKapasite], [OdaAktif], [OdaDurum]) VALUES (19, N'404', N'4', N'0', 1)
INSERT [dbo].[Odalar] ([Odaid], [OdaNo], [OdaKapasite], [OdaAktif], [OdaDurum]) VALUES (20, N'405', N'4', N'0', 1)
SET IDENTITY_INSERT [dbo].[Odalar] OFF
GO
SET IDENTITY_INSERT [dbo].[Ogrenci] ON 

INSERT [dbo].[Ogrenci] ([Ogrid], [OgrAd], [OgrSoyad], [OgrTc], [OgrTelefon], [OgrDogum], [OgrBolum], [OgrMail], [OgrOdaNo], [OgrVeliAdSoyad], [OgrVeliTelefon], [OgrVeliAdres]) VALUES (1, N'Gülin', N'Yıldırım', N'22222222222', N'(531) 123-1212', N'15.02.2000', N'Makine Mühendisliği', N'guliny@hotmail.com', N'404', N'Tülin Yıldırım', N'(531) 123-1212', N'Başakşehir/İstanbul')
INSERT [dbo].[Ogrenci] ([Ogrid], [OgrAd], [OgrSoyad], [OgrTc], [OgrTelefon], [OgrDogum], [OgrBolum], [OgrMail], [OgrOdaNo], [OgrVeliAdSoyad], [OgrVeliTelefon], [OgrVeliAdres]) VALUES (2, N'Rabia', N'Çevik', N'22222222222', N'(533) 234-2324', N'11.10.2000', N'Bilgisayar Mühendisliği', N'rabiacevik7@gmail.com', N'103', N'Dürdane Çevik', N'(537) 777-7777', N'Başakşehir Mahallesi Başakşehir/İstanbul')
INSERT [dbo].[Ogrenci] ([Ogrid], [OgrAd], [OgrSoyad], [OgrTc], [OgrTelefon], [OgrDogum], [OgrBolum], [OgrMail], [OgrOdaNo], [OgrVeliAdSoyad], [OgrVeliTelefon], [OgrVeliAdres]) VALUES (5, N'Ceyda', N'Yılmaz', N'77777777777', N'(577) 777-7777', N'17.07.1997', N'Matematik', N'ceyda123@hotmail.com', N'405', N'Ayşe Yılmaz', N'(531) 279-8797', N'Adana')
INSERT [dbo].[Ogrenci] ([Ogrid], [OgrAd], [OgrSoyad], [OgrTc], [OgrTelefon], [OgrDogum], [OgrBolum], [OgrMail], [OgrOdaNo], [OgrVeliAdSoyad], [OgrVeliTelefon], [OgrVeliAdres]) VALUES (6, N'Aynur', N'Akın', N'10110101010', N'(547) 123-1415', N'10.10.2000', N'Fizik', N'aynura@gmail.com', N'302', N'Halime Akın', N'(547) 645-4343', N'Bursa')
INSERT [dbo].[Ogrenci] ([Ogrid], [OgrAd], [OgrSoyad], [OgrTc], [OgrTelefon], [OgrDogum], [OgrBolum], [OgrMail], [OgrOdaNo], [OgrVeliAdSoyad], [OgrVeliTelefon], [OgrVeliAdres]) VALUES (8, N'Melin', N'Solmaz', N'55555555555', N'(555) 543-2323', N'15.05.2002', N'Veterinerlik', N'msolmaz@icloud.com', N'301', N'Habibe Solmaz', N'(537) 231-1212', N'Aydın')
INSERT [dbo].[Ogrenci] ([Ogrid], [OgrAd], [OgrSoyad], [OgrTc], [OgrTelefon], [OgrDogum], [OgrBolum], [OgrMail], [OgrOdaNo], [OgrVeliAdSoyad], [OgrVeliTelefon], [OgrVeliAdres]) VALUES (9, N'Yaren', N'Anku', N' 7654345656', N'(534) 234-1212', N'18.12.1999', N'Hemşire', N'anku_654@hotmail.com', N'404', N'Ebru Anku', N'(544) 460-9765', N'Trabzon')
INSERT [dbo].[Ogrenci] ([Ogrid], [OgrAd], [OgrSoyad], [OgrTc], [OgrTelefon], [OgrDogum], [OgrBolum], [OgrMail], [OgrOdaNo], [OgrVeliAdSoyad], [OgrVeliTelefon], [OgrVeliAdres]) VALUES (10, N'Medine', N'Hakkın', N'6555555555 ', N'(546) 238-7654', N'09.11.1999', N'İç Mimar', N'medineh@gmail.com', N'202', N'Çiler Hakkın', N'(533) 345-3745', N'Ankara')
INSERT [dbo].[Ogrenci] ([Ogrid], [OgrAd], [OgrSoyad], [OgrTc], [OgrTelefon], [OgrDogum], [OgrBolum], [OgrMail], [OgrOdaNo], [OgrVeliAdSoyad], [OgrVeliTelefon], [OgrVeliAdres]) VALUES (11, N'Suzan', N'Hayat', N'12131415186', N'(543) 297-5656', N'17.11.1999', N'İç Mimar', N'ddskdkdf@hotmail.com', N'103', N'Hayal Hayat', N'(538) 756-4545', N'Aydın')
INSERT [dbo].[Ogrenci] ([Ogrid], [OgrAd], [OgrSoyad], [OgrTc], [OgrTelefon], [OgrDogum], [OgrBolum], [OgrMail], [OgrOdaNo], [OgrVeliAdSoyad], [OgrVeliTelefon], [OgrVeliAdres]) VALUES (12, N'Zehra', N'Bulut', N'04542200202', N'(539) 857-4646', N'08.12.1999', N'Uluslarası İlişkiler', N'zehrabulut@gmail.com', N'403', N'Deniz Bulut', N'(532) 123-1543', N'Ankara')
INSERT [dbo].[Ogrenci] ([Ogrid], [OgrAd], [OgrSoyad], [OgrTc], [OgrTelefon], [OgrDogum], [OgrBolum], [OgrMail], [OgrOdaNo], [OgrVeliAdSoyad], [OgrVeliTelefon], [OgrVeliAdres]) VALUES (15, N'Sema Nur', N'Yavuzay', N'74664455544', N'(543) 256-4357', N'18.11.2000', N'Otomotiv Mühendisliği', N'semanur_556@hotmail.com', N'204', N'Asude Yavuzayy', N'(533) 278-9644', N'Bakırköy/İstanbul')
INSERT [dbo].[Ogrenci] ([Ogrid], [OgrAd], [OgrSoyad], [OgrTc], [OgrTelefon], [OgrDogum], [OgrBolum], [OgrMail], [OgrOdaNo], [OgrVeliAdSoyad], [OgrVeliTelefon], [OgrVeliAdres]) VALUES (22, N'Ela', N'Erdoğan', N'55656566556', N'(544) 322-343', N'15.07.2003', N'Mekatronik Mühendisliği', N'3445@gmail.com', N'302', N'Ebru Erdoğan', N'(534) 323-3423', N'Florya/İstanbul')
SET IDENTITY_INSERT [dbo].[Ogrenci] OFF
GO
SET IDENTITY_INSERT [dbo].[Personel] ON 

INSERT [dbo].[Personel] ([Personelid], [PersonelAdSoyad], [PersonelDepartman]) VALUES (1, N'Dürdane Çevik', N'Müdür')
INSERT [dbo].[Personel] ([Personelid], [PersonelAdSoyad], [PersonelDepartman]) VALUES (2, N'Meryem Çevik', N'Yönetici')
INSERT [dbo].[Personel] ([Personelid], [PersonelAdSoyad], [PersonelDepartman]) VALUES (3, N'Nuriye Yılmaz', N'Aşçı')
INSERT [dbo].[Personel] ([Personelid], [PersonelAdSoyad], [PersonelDepartman]) VALUES (4, N'Zeynep Türkan', N'Temizlik Görevlisi')
INSERT [dbo].[Personel] ([Personelid], [PersonelAdSoyad], [PersonelDepartman]) VALUES (5, N'Atakan Bulut', N'Güvenlik')
INSERT [dbo].[Personel] ([Personelid], [PersonelAdSoyad], [PersonelDepartman]) VALUES (6, N'Emel Sare Erdoğan', N'Müdür Yardımcısı')
INSERT [dbo].[Personel] ([Personelid], [PersonelAdSoyad], [PersonelDepartman]) VALUES (8, N'Celal Çevik', N'Güvenlik')
SET IDENTITY_INSERT [dbo].[Personel] OFF
GO
ALTER TABLE [dbo].[Borclar] ADD  CONSTRAINT [DF_Borclar_OgrKalanBorc]  DEFAULT ((3000)) FOR [OgrKalanBorc]
GO
ALTER TABLE [dbo].[Odalar] ADD  CONSTRAINT [DF_Odalar_OdaAktif]  DEFAULT ((0)) FOR [OdaAktif]
GO
ALTER TABLE [dbo].[Odalar] ADD  CONSTRAINT [DF_Odalar_OdaDurum]  DEFAULT ((1)) FOR [OdaDurum]
GO
USE [master]
GO
ALTER DATABASE [YurtKayitDB] SET  READ_WRITE 
GO

USE [master]
GO
/****** Object:  Database [Katastar]    Script Date: 4/5/2021 1:54:14 AM ******/
CREATE DATABASE [Katastar]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Katastar', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Katastar.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Katastar_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Katastar_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Katastar] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Katastar].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Katastar] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Katastar] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Katastar] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Katastar] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Katastar] SET ARITHABORT OFF 
GO
ALTER DATABASE [Katastar] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Katastar] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Katastar] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Katastar] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Katastar] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Katastar] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Katastar] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Katastar] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Katastar] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Katastar] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Katastar] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Katastar] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Katastar] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Katastar] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Katastar] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Katastar] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Katastar] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Katastar] SET RECOVERY FULL 
GO
ALTER DATABASE [Katastar] SET  MULTI_USER 
GO
ALTER DATABASE [Katastar] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Katastar] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Katastar] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Katastar] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Katastar] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Katastar', N'ON'
GO
ALTER DATABASE [Katastar] SET QUERY_STORE = OFF
GO
USE [Katastar]
GO
/****** Object:  Table [dbo].[KatastarskeOpstine]    Script Date: 4/5/2021 1:54:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KatastarskeOpstine](
	[IDKatOpstina] [int] NOT NULL,
	[Naziv] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_KatastarskeOpstine] PRIMARY KEY CLUSTERED 
(
	[IDKatOpstina] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Objekti]    Script Date: 4/5/2021 1:54:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Objekti](
	[IDObjekta] [int] NOT NULL,
	[Vlasnik] [nvarchar](max) NOT NULL,
	[Kvadratura] [int] NOT NULL,
	[Uknjizeno] [bit] NULL,
	[IDParcele] [int] NOT NULL,
	[IDKatOpstina] [int] NOT NULL,
 CONSTRAINT [PK_Objekti] PRIMARY KEY CLUSTERED 
(
	[IDObjekta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Parcele]    Script Date: 4/5/2021 1:54:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Parcele](
	[IDParcele] [int] NOT NULL,
	[IDKatOpstina] [int] NOT NULL,
	[Povrsina] [int] NOT NULL,
	[Adresa] [nvarchar](max) NOT NULL,
	[Vlasnistvo] [nvarchar](max) NULL,
 CONSTRAINT [PK_Parcele] PRIMARY KEY CLUSTERED 
(
	[IDParcele] ASC,
	[IDKatOpstina] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[KatastarskeOpstine] ([IDKatOpstina], [Naziv]) VALUES (1, N'Opstina1')
INSERT [dbo].[KatastarskeOpstine] ([IDKatOpstina], [Naziv]) VALUES (2, N'Opstina2')
INSERT [dbo].[KatastarskeOpstine] ([IDKatOpstina], [Naziv]) VALUES (3, N'Opstina3')
INSERT [dbo].[KatastarskeOpstine] ([IDKatOpstina], [Naziv]) VALUES (4, N'Opstina4')
INSERT [dbo].[Objekti] ([IDObjekta], [Vlasnik], [Kvadratura], [Uknjizeno], [IDParcele], [IDKatOpstina]) VALUES (1, N'Nikola', 4, 0, 1, 1)
INSERT [dbo].[Objekti] ([IDObjekta], [Vlasnik], [Kvadratura], [Uknjizeno], [IDParcele], [IDKatOpstina]) VALUES (2, N'Neko2', 6, 0, 2, 2)
INSERT [dbo].[Objekti] ([IDObjekta], [Vlasnik], [Kvadratura], [Uknjizeno], [IDParcele], [IDKatOpstina]) VALUES (3, N'Neko3', 5, 0, 3, 3)
INSERT [dbo].[Objekti] ([IDObjekta], [Vlasnik], [Kvadratura], [Uknjizeno], [IDParcele], [IDKatOpstina]) VALUES (4, N'Kenjaros2', 16, 0, 4, 1)
INSERT [dbo].[Objekti] ([IDObjekta], [Vlasnik], [Kvadratura], [Uknjizeno], [IDParcele], [IDKatOpstina]) VALUES (5, N'Kenjaros3', 17, 0, 5, 4)
INSERT [dbo].[Objekti] ([IDObjekta], [Vlasnik], [Kvadratura], [Uknjizeno], [IDParcele], [IDKatOpstina]) VALUES (55, N'Kenjaros', 15, 0, 1, 4)
INSERT [dbo].[Parcele] ([IDParcele], [IDKatOpstina], [Povrsina], [Adresa], [Vlasnistvo]) VALUES (1, 1, 10, N'Adresa1', N'privatno')
INSERT [dbo].[Parcele] ([IDParcele], [IDKatOpstina], [Povrsina], [Adresa], [Vlasnistvo]) VALUES (1, 4, 16, N'Adresa6', N'privatno')
INSERT [dbo].[Parcele] ([IDParcele], [IDKatOpstina], [Povrsina], [Adresa], [Vlasnistvo]) VALUES (2, 2, 11, N'Adresa2', N'drzavno')
INSERT [dbo].[Parcele] ([IDParcele], [IDKatOpstina], [Povrsina], [Adresa], [Vlasnistvo]) VALUES (3, 3, 12, N'Adresa3', N'na koriscenje')
INSERT [dbo].[Parcele] ([IDParcele], [IDKatOpstina], [Povrsina], [Adresa], [Vlasnistvo]) VALUES (4, 1, 13, N'Adresa4', N'privatno')
INSERT [dbo].[Parcele] ([IDParcele], [IDKatOpstina], [Povrsina], [Adresa], [Vlasnistvo]) VALUES (5, 4, 14, N'Adresa5', N'privatno')
ALTER TABLE [dbo].[Objekti]  WITH CHECK ADD  CONSTRAINT [FK_Objekti_KatastarskeOpstine] FOREIGN KEY([IDKatOpstina])
REFERENCES [dbo].[KatastarskeOpstine] ([IDKatOpstina])
GO
ALTER TABLE [dbo].[Objekti] CHECK CONSTRAINT [FK_Objekti_KatastarskeOpstine]
GO
ALTER TABLE [dbo].[Objekti]  WITH CHECK ADD  CONSTRAINT [FK_Objekti_Parcele] FOREIGN KEY([IDParcele], [IDKatOpstina])
REFERENCES [dbo].[Parcele] ([IDParcele], [IDKatOpstina])
GO
ALTER TABLE [dbo].[Objekti] CHECK CONSTRAINT [FK_Objekti_Parcele]
GO
USE [master]
GO
ALTER DATABASE [Katastar] SET  READ_WRITE 
GO

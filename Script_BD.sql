USE [master]
GO
/****** Object:  Database [TP_W24]    Script Date: 2021-08-23 7:02:02 PM ******/
CREATE DATABASE [TP_W24]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TP_W24', FILENAME = N'D:\Programming\Sql Express 2019\MSSQL15.SQLEXPRESS\MSSQL\DATA\TP_W24.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TP_W24_log', FILENAME = N'D:\Programming\Sql Express 2019\MSSQL15.SQLEXPRESS\MSSQL\DATA\TP_W24_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TP_W24] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TP_W24].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TP_W24] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TP_W24] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TP_W24] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TP_W24] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TP_W24] SET ARITHABORT OFF 
GO
ALTER DATABASE [TP_W24] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TP_W24] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TP_W24] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TP_W24] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TP_W24] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TP_W24] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TP_W24] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TP_W24] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TP_W24] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TP_W24] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TP_W24] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TP_W24] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TP_W24] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TP_W24] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TP_W24] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TP_W24] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TP_W24] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TP_W24] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TP_W24] SET  MULTI_USER 
GO
ALTER DATABASE [TP_W24] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TP_W24] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TP_W24] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TP_W24] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TP_W24] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TP_W24] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [TP_W24] SET QUERY_STORE = OFF
GO
USE [TP_W24]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 2021-08-23 7:02:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 2021-08-23 7:02:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 2021-08-23 7:02:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 2021-08-23 7:02:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 2021-08-23 7:02:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 2021-08-23 7:02:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 2021-08-23 7:02:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 2021-08-23 7:02:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 2021-08-23 7:02:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Cat_ID] [int] IDENTITY(1,1) NOT NULL,
	[Cat_Nom] [varchar](100) NOT NULL,
	[Cat_Description] [varchar](500) NOT NULL,
	[Cat_Images] [varchar](255) NULL,
	[Cat_Active] [bit] NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Cat_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Questions]    Script Date: 2021-08-23 7:02:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Questions](
	[Que_ID] [int] IDENTITY(1,1) NOT NULL,
	[FK_Cat_ID] [int] NOT NULL,
	[FK_User] [nvarchar](450) NULL,
	[Que_Titre] [varchar](255) NOT NULL,
	[Que_Texte] [varchar](8000) NOT NULL,
	[Que_Date] [datetime] NOT NULL,
	[Que_Views] [int] NULL,
	[Que_Active] [bit] NOT NULL,
 CONSTRAINT [PK_Questions] PRIMARY KEY CLUSTERED 
(
	[Que_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reponses]    Script Date: 2021-08-23 7:02:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reponses](
	[Rep_ID] [int] IDENTITY(1,1) NOT NULL,
	[FK_Que_ID] [int] NOT NULL,
	[FK_User] [nvarchar](450) NULL,
	[Rep_Texte] [varchar](8000) NOT NULL,
	[Rep_Date] [datetime] NOT NULL,
	[Rep_Active] [bit] NOT NULL,
 CONSTRAINT [PK_Reponses] PRIMARY KEY CLUSTERED 
(
	[Rep_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'00000000000000_CreateIdentitySchema', N'5.0.4')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'1', N'Admin', N'ADMIN', N'Admin')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'2', N'Moderator', N'MODERATOR', N'Moderator')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'b0c438a2-9637-47ad-bf21-04402dc7f428', N'1')
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'2ec1fa37-0927-4ef2-a2a0-e69cb60bf7cc', N'Dude', N'DUDE', N'Dude@farout.ca', N'DUDE@FAROUT.CA', 1, N'AQAAAAEAACcQAAAAEARqUK22OVJR38EfHrapMZmg01RoxLuffdtosCQ7KatK7rP5msjwcEHl08KWbww7Zw==', N'MPZPKMDUKSXP7RJMVU6QFCOQRNQVBAET', N'4e065631-d921-40fe-b6d5-46714d381ca6', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'8273a531-28d1-4262-9916-24b706305c13', N'User1', N'USER1', N'User1@user.com', N'USER1@USER.COM', 1, N'AQAAAAEAACcQAAAAEByrHoy16mHech9tQmbcZ4mbDiJ498S1w0v9xWuc97Pv976wp/7R7zulsVwxabF3Bw==', N'JYSGX4YC3UPJYPYSY53JBVYORXRIUJIW', N'48f96516-6ecc-48ab-824f-0370de1a960d', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'b0c438a2-9637-47ad-bf21-04402dc7f428', N'Admin', N'ADMIN', N'Admin@Boss.ca', N'ADMIN@BOSS.CA', 1, N'AQAAAAEAACcQAAAAEDbsJ7XJgGlSf5i6fhpNQZyYzYWF97CzBGy8s5MIYmDKvQKK/2y9YBBx8saSOv4pXw==', N'7N3PGDLQR2KJRKWTE4UXAH4UYWLJZPUH', N'244c0dd1-3e8f-4793-9e88-92872cc517c5', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'd70224e7-2cec-4c59-9f3b-faf90ee64619', N'User2', N'USER2', N'User@user.com', N'USER@USER.COM', 1, N'AQAAAAEAACcQAAAAEP0bI766coxkroi2uVf7MtL5FWWk+5ckQCenKAcdqEKIA/6LWR8A2PRiSN0EUGITag==', N'V2LV5G5IZMACBIB4FNSGEW33X6R24IM2', N'8881fdfa-e05d-476d-9f2f-38e02a8ef22c', NULL, 0, 0, NULL, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Cat_ID], [Cat_Nom], [Cat_Description], [Cat_Images], [Cat_Active]) VALUES (1, N'Gouvernements', N'Regroupement de tous sujets de conspirations étant reliés aux différents gouvernements mondiaux.', NULL, 1)
INSERT [dbo].[Categories] ([Cat_ID], [Cat_Nom], [Cat_Description], [Cat_Images], [Cat_Active]) VALUES (2, N'Aliens', N'Regroupement de tous sujets de conspirations étant reliés aux aliens et l''espace', NULL, 1)
INSERT [dbo].[Categories] ([Cat_ID], [Cat_Nom], [Cat_Description], [Cat_Images], [Cat_Active]) VALUES (3, N'Vaccins', N'<p>Regroupement de tous sujets de conspirations &eacute;tant reli&eacute;s aux vaccins et leurs effet n&eacute;fastes.</p>', NULL, 1)
INSERT [dbo].[Categories] ([Cat_ID], [Cat_Nom], [Cat_Description], [Cat_Images], [Cat_Active]) VALUES (1003, N'Sriracha 2:  Reloaded', N'<p>Gotta go&nbsp;<strong>HOT</strong></p>', NULL, 1)
INSERT [dbo].[Categories] ([Cat_ID], [Cat_Nom], [Cat_Description], [Cat_Images], [Cat_Active]) VALUES (1004, N'Sriracha 3: Revolutions', N'<p>Encore du Sriracha</p>', NULL, 1)
INSERT [dbo].[Categories] ([Cat_ID], [Cat_Nom], [Cat_Description], [Cat_Images], [Cat_Active]) VALUES (1005, N'Test', N'<p><strong>Bold</strong></p>', NULL, 0)
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Questions] ON 

INSERT [dbo].[Questions] ([Que_ID], [FK_Cat_ID], [FK_User], [Que_Titre], [Que_Texte], [Que_Date], [Que_Views], [Que_Active]) VALUES (2, 1, N'b0c438a2-9637-47ad-bf21-04402dc7f428', N'Allo!', N'<p>Bonsoir!</p>', CAST(N'2021-04-05T15:43:38.000' AS DateTime), 3, 1)
INSERT [dbo].[Questions] ([Que_ID], [FK_Cat_ID], [FK_User], [Que_Titre], [Que_Texte], [Que_Date], [Que_Views], [Que_Active]) VALUES (3, 2, N'b0c438a2-9637-47ad-bf21-04402dc7f428', N'Aliens?', N'Des aliens partout!', CAST(N'2021-04-05T16:09:19.103' AS DateTime), 7, 1)
INSERT [dbo].[Questions] ([Que_ID], [FK_Cat_ID], [FK_User], [Que_Titre], [Que_Texte], [Que_Date], [Que_Views], [Que_Active]) VALUES (4, 2, N'b0c438a2-9637-47ad-bf21-04402dc7f428', N'Les cercles dans les champs', N'Pourquoi autant de cercles? d''où vient les cercles? Surement pas mamie en chaise roulants!', CAST(N'2021-04-05T20:10:08.107' AS DateTime), 4, 1)
INSERT [dbo].[Questions] ([Que_ID], [FK_Cat_ID], [FK_User], [Que_Titre], [Que_Texte], [Que_Date], [Que_Views], [Que_Active]) VALUES (5, 2, N'b0c438a2-9637-47ad-bf21-04402dc7f428', N'Testing', N'Bluuuuuuuuuuuuuuuuuuuuuuuu', CAST(N'2021-04-05T20:13:11.580' AS DateTime), 0, 0)
INSERT [dbo].[Questions] ([Que_ID], [FK_Cat_ID], [FK_User], [Que_Titre], [Que_Texte], [Que_Date], [Que_Views], [Que_Active]) VALUES (6, 1, N'b0c438a2-9637-47ad-bf21-04402dc7f428', N'Facepalm', N'facepalm facpelma faceplamf eacplm', CAST(N'2021-04-06T13:54:00.000' AS DateTime), 0, 0)
INSERT [dbo].[Questions] ([Que_ID], [FK_Cat_ID], [FK_User], [Que_Titre], [Que_Texte], [Que_Date], [Que_Views], [Que_Active]) VALUES (20, 3, N'b0c438a2-9637-47ad-bf21-04402dc7f428', N'Vaccins 3', N'J''aime pas les vaccins', CAST(N'2021-04-06T15:49:52.000' AS DateTime), 15, 1)
INSERT [dbo].[Questions] ([Que_ID], [FK_Cat_ID], [FK_User], [Que_Titre], [Que_Texte], [Que_Date], [Que_Views], [Que_Active]) VALUES (1020, 2, N'b0c438a2-9637-47ad-bf21-04402dc7f428', N'Le feu dans le ciel?', N'Avez-vous vu les grands feux dans le ciel? D''après moi c''est les apôtre stélaires de Jésus venant sauver nos âme de la grande purge', CAST(N'2021-04-06T18:37:41.167' AS DateTime), 4, 1)
INSERT [dbo].[Questions] ([Que_ID], [FK_Cat_ID], [FK_User], [Que_Titre], [Que_Texte], [Que_Date], [Que_Views], [Que_Active]) VALUES (1022, 2, N'b0c438a2-9637-47ad-bf21-04402dc7f428', N'Un autre test d''aliens', N'Dans les milles de Que_ID?', CAST(N'2021-04-06T18:56:23.833' AS DateTime), 0, 0)
INSERT [dbo].[Questions] ([Que_ID], [FK_Cat_ID], [FK_User], [Que_Titre], [Que_Texte], [Que_Date], [Que_Views], [Que_Active]) VALUES (1023, 1, N'8273a531-28d1-4262-9916-24b706305c13', N'OK GOOGLE', N'<p>RICARDO COMMENT FAIRE BISCUIT AU CHOCOLAT</p>', CAST(N'2021-04-06T19:11:31.000' AS DateTime), 94, 1)
INSERT [dbo].[Questions] ([Que_ID], [FK_Cat_ID], [FK_User], [Que_Titre], [Que_Texte], [Que_Date], [Que_Views], [Que_Active]) VALUES (2020, 3, N'b0c438a2-9637-47ad-bf21-04402dc7f428', N'Les Anti-Antivaxx', N'Antivaxx etc etc', CAST(N'2021-04-07T13:56:19.677' AS DateTime), 4, 1)
INSERT [dbo].[Questions] ([Que_ID], [FK_Cat_ID], [FK_User], [Que_Titre], [Que_Texte], [Que_Date], [Que_Views], [Que_Active]) VALUES (2021, 3, N'b0c438a2-9637-47ad-bf21-04402dc7f428', N'Test de vaccins à supprimer', N'Delete delete delete delete', CAST(N'2021-04-13T18:57:00.000' AS DateTime), 1, 0)
INSERT [dbo].[Questions] ([Que_ID], [FK_Cat_ID], [FK_User], [Que_Titre], [Que_Texte], [Que_Date], [Que_Views], [Que_Active]) VALUES (2022, 1, N'b0c438a2-9637-47ad-bf21-04402dc7f428', N'Obama', N'<p><strong>Thanks Obama</strong></p>', CAST(N'2021-05-01T16:55:06.000' AS DateTime), 3, 1)
INSERT [dbo].[Questions] ([Que_ID], [FK_Cat_ID], [FK_User], [Que_Titre], [Que_Texte], [Que_Date], [Que_Views], [Que_Active]) VALUES (2023, 1, N'b0c438a2-9637-47ad-bf21-04402dc7f428', N'Trump?', N'<p><em>Cheetos</em></p>', CAST(N'2021-05-01T17:08:32.000' AS DateTime), 1, 1)
INSERT [dbo].[Questions] ([Que_ID], [FK_Cat_ID], [FK_User], [Que_Titre], [Que_Texte], [Que_Date], [Que_Views], [Que_Active]) VALUES (2024, 1, N'b0c438a2-9637-47ad-bf21-04402dc7f428', N'Trudeau', N'<p>Joke de trou d''eau</p>', CAST(N'2021-05-01T17:11:26.000' AS DateTime), 0, 0)
INSERT [dbo].[Questions] ([Que_ID], [FK_Cat_ID], [FK_User], [Que_Titre], [Que_Texte], [Que_Date], [Que_Views], [Que_Active]) VALUES (2025, 1, N'b0c438a2-9637-47ad-bf21-04402dc7f428', N'Test', N'<p>Je suis un test de suppression de question</p>', CAST(N'2021-05-01T19:16:35.000' AS DateTime), 2, 0)
INSERT [dbo].[Questions] ([Que_ID], [FK_Cat_ID], [FK_User], [Que_Titre], [Que_Texte], [Que_Date], [Que_Views], [Que_Active]) VALUES (2026, 3, N'd70224e7-2cec-4c59-9f3b-faf90ee64619', N'Vaccins contre la Covid', N'<p>Test</p>', CAST(N'2021-05-02T10:48:27.000' AS DateTime), 6, 1)
SET IDENTITY_INSERT [dbo].[Questions] OFF
GO
SET IDENTITY_INSERT [dbo].[Reponses] ON 

INSERT [dbo].[Reponses] ([Rep_ID], [FK_Que_ID], [FK_User], [Rep_Texte], [Rep_Date], [Rep_Active]) VALUES (2, 3, N'b0c438a2-9637-47ad-bf21-04402dc7f428', N'Ca marche tu?', CAST(N'2021-04-05T17:29:16.427' AS DateTime), 0)
INSERT [dbo].[Reponses] ([Rep_ID], [FK_Que_ID], [FK_User], [Rep_Texte], [Rep_Date], [Rep_Active]) VALUES (3, 3, N'd70224e7-2cec-4c59-9f3b-faf90ee64619', N'Test Reponse par web', CAST(N'2021-04-05T18:59:00.000' AS DateTime), 0)
INSERT [dbo].[Reponses] ([Rep_ID], [FK_Que_ID], [FK_User], [Rep_Texte], [Rep_Date], [Rep_Active]) VALUES (5, 3, N'd70224e7-2cec-4c59-9f3b-faf90ee64619', N'jtfjftjftj', CAST(N'2021-04-05T19:55:02.240' AS DateTime), 0)
INSERT [dbo].[Reponses] ([Rep_ID], [FK_Que_ID], [FK_User], [Rep_Texte], [Rep_Date], [Rep_Active]) VALUES (6, 3, N'd70224e7-2cec-4c59-9f3b-faf90ee64619', N'Blaaaaaaaaaa lba bla', CAST(N'2021-04-05T20:09:21.097' AS DateTime), 0)
INSERT [dbo].[Reponses] ([Rep_ID], [FK_Que_ID], [FK_User], [Rep_Texte], [Rep_Date], [Rep_Active]) VALUES (7, 4, N'd70224e7-2cec-4c59-9f3b-faf90ee64619', N'C''est duuuuuuuuuuuuuuuuuuuuuuuuuure man', CAST(N'2021-04-05T20:10:23.707' AS DateTime), 0)
INSERT [dbo].[Reponses] ([Rep_ID], [FK_Que_ID], [FK_User], [Rep_Texte], [Rep_Date], [Rep_Active]) VALUES (8, 5, N'd70224e7-2cec-4c59-9f3b-faf90ee64619', N'reponses 101', CAST(N'2021-04-05T20:13:20.390' AS DateTime), 0)
INSERT [dbo].[Reponses] ([Rep_ID], [FK_Que_ID], [FK_User], [Rep_Texte], [Rep_Date], [Rep_Active]) VALUES (10, 5, N'd70224e7-2cec-4c59-9f3b-faf90ee64619', N'jtfjftjftj', CAST(N'2021-04-06T13:33:26.340' AS DateTime), 0)
INSERT [dbo].[Reponses] ([Rep_ID], [FK_Que_ID], [FK_User], [Rep_Texte], [Rep_Date], [Rep_Active]) VALUES (11, 5, N'd70224e7-2cec-4c59-9f3b-faf90ee64619', N'jfyjrjftj', CAST(N'2021-04-06T13:37:04.640' AS DateTime), 0)
INSERT [dbo].[Reponses] ([Rep_ID], [FK_Que_ID], [FK_User], [Rep_Texte], [Rep_Date], [Rep_Active]) VALUES (12, 20, N'd70224e7-2cec-4c59-9f3b-faf90ee64619', N'T''es juste une tapette debords!', CAST(N'2021-04-06T15:53:06.290' AS DateTime), 0)
INSERT [dbo].[Reponses] ([Rep_ID], [FK_Que_ID], [FK_User], [Rep_Texte], [Rep_Date], [Rep_Active]) VALUES (13, 20, N'd70224e7-2cec-4c59-9f3b-faf90ee64619', N'Pis toé', CAST(N'2021-04-06T15:53:18.033' AS DateTime), 0)
INSERT [dbo].[Reponses] ([Rep_ID], [FK_Que_ID], [FK_User], [Rep_Texte], [Rep_Date], [Rep_Active]) VALUES (1002, 20, N'd70224e7-2cec-4c59-9f3b-faf90ee64619', N'Eille non là, c''est serieux la le 5G dans le veine qui report tout ce que tu dit et fait à Microsoft!', CAST(N'2021-04-06T19:08:17.173' AS DateTime), 0)
INSERT [dbo].[Reponses] ([Rep_ID], [FK_Que_ID], [FK_User], [Rep_Texte], [Rep_Date], [Rep_Active]) VALUES (1003, 20, N'd70224e7-2cec-4c59-9f3b-faf90ee64619', N'...T''as tu un cellulaire dans tes poches?', CAST(N'2021-04-06T19:10:48.823' AS DateTime), 0)
INSERT [dbo].[Reponses] ([Rep_ID], [FK_Que_ID], [FK_User], [Rep_Texte], [Rep_Date], [Rep_Active]) VALUES (1004, 20, N'd70224e7-2cec-4c59-9f3b-faf90ee64619', N'...Fair', CAST(N'2021-04-06T19:10:59.800' AS DateTime), 0)
INSERT [dbo].[Reponses] ([Rep_ID], [FK_Que_ID], [FK_User], [Rep_Texte], [Rep_Date], [Rep_Active]) VALUES (1005, 1023, N'd70224e7-2cec-4c59-9f3b-faf90ee64619', N'<p>https://www.ricardocuisine.com/hiver/recette.php?c=douceurs-hiver&amp;id=4874</p>', CAST(N'2021-04-06T19:11:53.000' AS DateTime), 1)
INSERT [dbo].[Reponses] ([Rep_ID], [FK_Que_ID], [FK_User], [Rep_Texte], [Rep_Date], [Rep_Active]) VALUES (1006, 1023, N'd70224e7-2cec-4c59-9f3b-faf90ee64619', N'<p>??!?!?&nbsp; !!!!</p>', CAST(N'2021-04-06T19:12:11.000' AS DateTime), 0)
INSERT [dbo].[Reponses] ([Rep_ID], [FK_Que_ID], [FK_User], [Rep_Texte], [Rep_Date], [Rep_Active]) VALUES (2002, 4, N'd70224e7-2cec-4c59-9f3b-faf90ee64619', N'T''essaiera de te trouver du parking en ville, je peux comprendre qu''ils prennent les champs pour se poser', CAST(N'2021-04-07T14:18:44.697' AS DateTime), 1)
INSERT [dbo].[Reponses] ([Rep_ID], [FK_Que_ID], [FK_User], [Rep_Texte], [Rep_Date], [Rep_Active]) VALUES (2003, 1023, N'd70224e7-2cec-4c59-9f3b-faf90ee64619', N'Test', CAST(N'2021-05-01T16:22:00.000' AS DateTime), 0)
INSERT [dbo].[Reponses] ([Rep_ID], [FK_Que_ID], [FK_User], [Rep_Texte], [Rep_Date], [Rep_Active]) VALUES (2004, 1023, N'b0c438a2-9637-47ad-bf21-04402dc7f428', N'<p>moi jaime bien ricardo............................. amusant......</p>', CAST(N'2021-05-01T19:04:44.000' AS DateTime), 1)
INSERT [dbo].[Reponses] ([Rep_ID], [FK_Que_ID], [FK_User], [Rep_Texte], [Rep_Date], [Rep_Active]) VALUES (2005, 1023, N'b0c438a2-9637-47ad-bf21-04402dc7f428', N'<p>Ses biscuits aux p&eacute;pittes de chocolats sont les <strong>meilleurs!</strong></p>', CAST(N'2021-05-01T19:06:43.000' AS DateTime), 1)
INSERT [dbo].[Reponses] ([Rep_ID], [FK_Que_ID], [FK_User], [Rep_Texte], [Rep_Date], [Rep_Active]) VALUES (2006, 1023, N'b0c438a2-9637-47ad-bf21-04402dc7f428', N'<p>Pas autant que ses galettes &agrave; la m&eacute;lasse!</p>', CAST(N'2021-05-01T19:08:24.000' AS DateTime), 1)
INSERT [dbo].[Reponses] ([Rep_ID], [FK_Que_ID], [FK_User], [Rep_Texte], [Rep_Date], [Rep_Active]) VALUES (2007, 1023, N'b0c438a2-9637-47ad-bf21-04402dc7f428', N'<p>Allo je suis un test de suppression</p>', CAST(N'2021-05-01T19:15:38.000' AS DateTime), 0)
INSERT [dbo].[Reponses] ([Rep_ID], [FK_Que_ID], [FK_User], [Rep_Texte], [Rep_Date], [Rep_Active]) VALUES (2008, 2025, N'b0c438a2-9637-47ad-bf21-04402dc7f428', N'<p>newnewnew</p>', CAST(N'2021-05-01T19:16:58.000' AS DateTime), 1)
INSERT [dbo].[Reponses] ([Rep_ID], [FK_Que_ID], [FK_User], [Rep_Texte], [Rep_Date], [Rep_Active]) VALUES (2009, 2026, N'2ec1fa37-0927-4ef2-a2a0-e69cb60bf7cc', N'<p>Va refaire ta science de secondaire 2</p>', CAST(N'2021-05-02T10:50:39.000' AS DateTime), 1)
INSERT [dbo].[Reponses] ([Rep_ID], [FK_Que_ID], [FK_User], [Rep_Texte], [Rep_Date], [Rep_Active]) VALUES (2010, 1023, N'2ec1fa37-0927-4ef2-a2a0-e69cb60bf7cc', N'<p>Vous essayerez son Tofu G&eacute;n&eacute;ral Tao! Vraiment dure &agrave; battre, 10/10</p>', CAST(N'2021-05-02T14:16:39.000' AS DateTime), 1)
INSERT [dbo].[Reponses] ([Rep_ID], [FK_Que_ID], [FK_User], [Rep_Texte], [Rep_Date], [Rep_Active]) VALUES (2011, 1023, N'2ec1fa37-0927-4ef2-a2a0-e69cb60bf7cc', N'<p>On en fait about une fois par mois moi et ma blonde, super <strong>facile </strong>en plus</p>
<p>&nbsp;</p>', CAST(N'2021-05-02T14:17:11.000' AS DateTime), 1)
INSERT [dbo].[Reponses] ([Rep_ID], [FK_Que_ID], [FK_User], [Rep_Texte], [Rep_Date], [Rep_Active]) VALUES (2012, 1023, N'd70224e7-2cec-4c59-9f3b-faf90ee64619', N'<p>Oui mais c''est quoi le lien avec le gouvernement?<br /><br /><strong>Edit:</strong> Je sais que c''est les internets mais quand m&ecirc;me l&agrave;</p>', CAST(N'2021-05-02T14:18:02.000' AS DateTime), 0)
INSERT [dbo].[Reponses] ([Rep_ID], [FK_Que_ID], [FK_User], [Rep_Texte], [Rep_Date], [Rep_Active]) VALUES (2013, 1023, N'8273a531-28d1-4262-9916-24b706305c13', N'<p>facebook mon petit fils jonathan</p>', CAST(N'2021-05-02T14:19:29.000' AS DateTime), 1)
INSERT [dbo].[Reponses] ([Rep_ID], [FK_Que_ID], [FK_User], [Rep_Texte], [Rep_Date], [Rep_Active]) VALUES (2014, 1023, N'8273a531-28d1-4262-9916-24b706305c13', N'<p>mon site email . com</p>', CAST(N'2021-05-02T14:20:02.000' AS DateTime), 1)
INSERT [dbo].[Reponses] ([Rep_ID], [FK_Que_ID], [FK_User], [Rep_Texte], [Rep_Date], [Rep_Active]) VALUES (2015, 1023, N'b0c438a2-9637-47ad-bf21-04402dc7f428', N'<p>Le forum manque une fonction "Lock"</p>', CAST(N'2021-05-02T14:20:54.000' AS DateTime), 1)
INSERT [dbo].[Reponses] ([Rep_ID], [FK_Que_ID], [FK_User], [Rep_Texte], [Rep_Date], [Rep_Active]) VALUES (2016, 2020, N'b0c438a2-9637-47ad-bf21-04402dc7f428', N'<p>Nouveau commentaire test</p>', CAST(N'2021-08-23T18:48:02.000' AS DateTime), 0)
INSERT [dbo].[Reponses] ([Rep_ID], [FK_Que_ID], [FK_User], [Rep_Texte], [Rep_Date], [Rep_Active]) VALUES (2017, 20, N'd70224e7-2cec-4c59-9f3b-faf90ee64619', N'<p>Moi non plus!</p>', CAST(N'2021-08-23T18:58:04.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Reponses] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 2021-08-23 7:02:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 2021-08-23 7:02:02 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 2021-08-23 7:02:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 2021-08-23 7:02:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 2021-08-23 7:02:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 2021-08-23 7:02:02 PM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 2021-08-23 7:02:02 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Questions]  WITH CHECK ADD  CONSTRAINT [FK_Questions_Categories] FOREIGN KEY([FK_Cat_ID])
REFERENCES [dbo].[Categories] ([Cat_ID])
GO
ALTER TABLE [dbo].[Questions] CHECK CONSTRAINT [FK_Questions_Categories]
GO
ALTER TABLE [dbo].[Reponses]  WITH CHECK ADD  CONSTRAINT [FK_Reponses_Questions] FOREIGN KEY([FK_Que_ID])
REFERENCES [dbo].[Questions] ([Que_ID])
GO
ALTER TABLE [dbo].[Reponses] CHECK CONSTRAINT [FK_Reponses_Questions]
GO
USE [master]
GO
ALTER DATABASE [TP_W24] SET  READ_WRITE 
GO

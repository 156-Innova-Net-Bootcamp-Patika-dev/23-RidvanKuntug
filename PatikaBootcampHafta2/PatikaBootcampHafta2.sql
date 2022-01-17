USE [master]
GO
/****** Database settings, name and properties are specified ******/
/****** Object:  Database [PatikaBootcampHafta2]    Script Date: 17.01.2022 21:39:44 ******/
CREATE DATABASE [PatikaBootcampHafta2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PatikaBootcampHafta2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\PatikaBootcampHafta2.mdf' , SIZE = 10240KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'PatikaBootcampHafta2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\PatikaBootcampHafta2_log.ldf' , SIZE = 5120KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [PatikaBootcampHafta2] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PatikaBootcampHafta2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PatikaBootcampHafta2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PatikaBootcampHafta2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PatikaBootcampHafta2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PatikaBootcampHafta2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PatikaBootcampHafta2] SET ARITHABORT OFF 
GO
ALTER DATABASE [PatikaBootcampHafta2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PatikaBootcampHafta2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PatikaBootcampHafta2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PatikaBootcampHafta2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PatikaBootcampHafta2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PatikaBootcampHafta2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PatikaBootcampHafta2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PatikaBootcampHafta2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PatikaBootcampHafta2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PatikaBootcampHafta2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PatikaBootcampHafta2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PatikaBootcampHafta2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PatikaBootcampHafta2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PatikaBootcampHafta2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PatikaBootcampHafta2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PatikaBootcampHafta2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PatikaBootcampHafta2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PatikaBootcampHafta2] SET RECOVERY FULL 
GO
ALTER DATABASE [PatikaBootcampHafta2] SET  MULTI_USER 
GO
ALTER DATABASE [PatikaBootcampHafta2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PatikaBootcampHafta2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PatikaBootcampHafta2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PatikaBootcampHafta2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PatikaBootcampHafta2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PatikaBootcampHafta2] SET QUERY_STORE = OFF
GO
USE [PatikaBootcampHafta2]
GO


/****** Adding Users Table and columns ******/
/****** Object:  Table [dbo].[users]    Script Date: 17.01.2022 21:39:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[name] [varchar](50) NOT NULL,
	[tcNo] [bigint] NOT NULL,
	[authority] [tinyint] NOT NULL,
 CONSTRAINT [PK_users_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


/****** Adding Books Table and columns ******/
/****** Object:  Table [dbo].[book]    Script Date: 17.01.2022 21:39:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[book](
	[id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[name] [varchar](50) NOT NULL,
	[isbn] [nvarchar](50) NOT NULL,
	[writer_id] [int] NOT NULL,
 CONSTRAINT [PK_book_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Adding Taken Table and columns ******/
/****** This table is for registering book borrowers to the system ******/
/****** Object:  Table [dbo].[taken]    Script Date: 17.01.2022 21:39:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[taken](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[book_id] [int] NOT NULL,
	[date] [datetime] NOT NULL,
	[is_return] [bit] NOT NULL,
 CONSTRAINT [PK_taken_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


/****** Adding Taken View and columns ******/
/****** This View is for book borrowers to easily withdraw from the system. ******/
/****** Object:  View [dbo].[taken_logs]    Script Date: 17.01.2022 21:39:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[taken_logs] 
AS SELECT
  users.name AS [User Name]
 ,book.name AS [Book Name]
 ,taken.date AS [Taken Date]
FROM dbo.taken
INNER JOIN dbo.book
  ON taken.book_id = book.id
INNER JOIN dbo.users
  ON taken.user_id = users.id
GO


/****** Adding Writers Table and columns ******/
/****** Object:  Table [dbo].[writers]    Script Date: 17.01.2022 21:39:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[writers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
 CONSTRAINT [PK_writer_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[book] ON 

INSERT [dbo].[book] ([id], [name], [isbn], [writer_id]) VALUES (1, N'Yüzüklerin Efendisi: Yüzük Kardeşliği', N'5475gtf57', 1)
INSERT [dbo].[book] ([id], [name], [isbn], [writer_id]) VALUES (2, N'Yüzüklerin Efendisi: İki Kule', N'e56h754g7jh6', 1)
INSERT [dbo].[book] ([id], [name], [isbn], [writer_id]) VALUES (3, N'Yüzüklerin Efendisi: Kralın Dönüşü', N'67j66uhj68jh76', 1)
INSERT [dbo].[book] ([id], [name], [isbn], [writer_id]) VALUES (4, N'Silmarillion', N'6h4575h76', 1)
INSERT [dbo].[book] ([id], [name], [isbn], [writer_id]) VALUES (5, N'Bitmemiş Öyküler', N'65h7658gdf', 1)
INSERT [dbo].[book] ([id], [name], [isbn], [writer_id]) VALUES (6, N'Ben Robot', N'776j67g56765', 2)
INSERT [dbo].[book] ([id], [name], [isbn], [writer_id]) VALUES (8, N'Sonsuzluğun sonu', N'f45tf45', 2)
INSERT [dbo].[book] ([id], [name], [isbn], [writer_id]) VALUES (9, N'Vakıf', N'ghh688478h', 2)
INSERT [dbo].[book] ([id], [name], [isbn], [writer_id]) VALUES (10, N'Otostopçunun Galaksi Rehberi', N'467768575987g', 4)
INSERT [dbo].[book] ([id], [name], [isbn], [writer_id]) VALUES (11, N'Yaşam Evren ve Her Şey', N'657gh64ytg', 4)
INSERT [dbo].[book] ([id], [name], [isbn], [writer_id]) VALUES (12, N'Sherlock Holmes: Kızıl Soruşturma', N'65gg6g45j3f', 3)
INSERT [dbo].[book] ([id], [name], [isbn], [writer_id]) VALUES (13, N'Sherlock Holmes: Korku Vadisi', N'37h459rgjnh', 3)
SET IDENTITY_INSERT [dbo].[book] OFF
SET IDENTITY_INSERT [dbo].[taken] ON 

INSERT [dbo].[taken] ([id], [user_id], [book_id], [date], [is_return]) VALUES (2, 1, 1, CAST(N'2020-11-17T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[taken] ([id], [user_id], [book_id], [date], [is_return]) VALUES (5, 4, 6, CAST(N'2021-11-19T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[taken] ([id], [user_id], [book_id], [date], [is_return]) VALUES (6, 9, 10, CAST(N'2022-01-10T00:00:00.000' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[taken] OFF
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([id], [name], [tcNo], [authority]) VALUES (1, N'Rıdvan Küntuğ', 12345678910, 5)
INSERT [dbo].[users] ([id], [name], [tcNo], [authority]) VALUES (4, N'M.H. Küntuğ', 23456789101, 1)
INSERT [dbo].[users] ([id], [name], [tcNo], [authority]) VALUES (9, N'H. Küntuğ', 34567891012, 1)
INSERT [dbo].[users] ([id], [name], [tcNo], [authority]) VALUES (10, N'Y. Küntuğ', 45678910123, 1)
INSERT [dbo].[users] ([id], [name], [tcNo], [authority]) VALUES (11, N'asd', 3242345, 1)
SET IDENTITY_INSERT [dbo].[users] OFF
SET IDENTITY_INSERT [dbo].[writers] ON 

INSERT [dbo].[writers] ([id], [name]) VALUES (1, N'J.R.R Tolkien')
INSERT [dbo].[writers] ([id], [name]) VALUES (2, N'Isaac Asimov
')
INSERT [dbo].[writers] ([id], [name]) VALUES (3, N'Sir Arthur Conan Doyle')
INSERT [dbo].[writers] ([id], [name]) VALUES (4, N'Douglas Adams
')
SET IDENTITY_INSERT [dbo].[writers] OFF
ALTER TABLE [dbo].[taken] ADD  CONSTRAINT [DF__taken__return__4E88ABD4]  DEFAULT ((1)) FOR [is_return]
GO
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [DF__users__authority__4CA06362]  DEFAULT ((1)) FOR [authority]
GO
ALTER TABLE [dbo].[book]  WITH CHECK ADD  CONSTRAINT [FK_book_writer_id] FOREIGN KEY([writer_id])
REFERENCES [dbo].[writers] ([id])
GO
ALTER TABLE [dbo].[book] CHECK CONSTRAINT [FK_book_writer_id]
GO
ALTER TABLE [dbo].[taken]  WITH CHECK ADD  CONSTRAINT [FK_taken_book_id] FOREIGN KEY([book_id])
REFERENCES [dbo].[book] ([id])
GO
ALTER TABLE [dbo].[taken] CHECK CONSTRAINT [FK_taken_book_id]
GO
ALTER TABLE [dbo].[taken]  WITH CHECK ADD  CONSTRAINT [FK_taken_user_id] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[taken] CHECK CONSTRAINT [FK_taken_user_id]
GO
EXEC [PatikaBootcampHafta2].sys.sp_addextendedproperty @name=N'MS_Description', @value=N'PatikaBootcampHafta2' 
GO
USE [master]
GO
ALTER DATABASE [PatikaBootcampHafta2] SET  READ_WRITE 
GO

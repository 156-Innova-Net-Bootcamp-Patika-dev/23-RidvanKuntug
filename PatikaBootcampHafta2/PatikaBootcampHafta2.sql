USE [master]
GO

/****** Database settings, name and properties are specified ******/
/****** Object:  Database [PatikaBootcampHafta2]    Script Date: 18.01.2022 12:00:19 ******/
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
/****** Object:  Table [dbo].[users]    Script Date: 18.01.2022 12:00:20 ******/
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
/****** Object:  Table [dbo].[book]    Script Date: 18.01.2022 12:00:20 ******/
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
/****** Object:  Table [dbo].[taken]    Script Date: 18.01.2022 12:00:20 ******/
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
/****** Object:  View [dbo].[taken_logs]    Script Date: 18.01.2022 12:00:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[taken_logs]
AS
SELECT        dbo.users.name AS [User Name], dbo.book.name AS [Book Name], dbo.taken.date AS [Taken Date], dbo.taken.is_return AS Situation
FROM            dbo.taken INNER JOIN
                         dbo.book ON dbo.taken.book_id = dbo.book.id INNER JOIN
                         dbo.users ON dbo.taken.user_id = dbo.users.id
GO

/****** Adding Writers Table and columns ******/
/****** Object:  Table [dbo].[writers]    Script Date: 18.01.2022 12:00:20 ******/
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
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[58] 4[21] 2[12] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "taken"
            Begin Extent = 
               Top = 18
               Left = 386
               Bottom = 174
               Right = 556
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "book"
            Begin Extent = 
               Top = 145
               Left = 691
               Bottom = 286
               Right = 861
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "users"
            Begin Extent = 
               Top = 148
               Left = 54
               Bottom = 282
               Right = 224
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'taken_logs'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'taken_logs'
GO
USE [master]
GO
ALTER DATABASE [PatikaBootcampHafta2] SET  READ_WRITE 
GO

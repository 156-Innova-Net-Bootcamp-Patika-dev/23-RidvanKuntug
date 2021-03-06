USE [master]
GO

/****** Database settings, name and properties are specified ******/
/****** Object:  Database [PatikaBootcampHafta2]    Script Date: 19.01.2022 15:37:57 ******/
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

/****** Creating address Table and columns ******/
/****** Object:  Table [dbo].[address]    Script Date: 19.01.2022 15:37:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[address](
	[id] [int] NOT NULL,
	[tel] [nvarchar](50) NOT NULL,
	[address] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_address] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Creating users Table and columns ******/
/****** Object:  Table [dbo].[users]    Script Date: 19.01.2022 15:37:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[name] [varchar](50) NOT NULL,
	[tcNo] [bigint] NOT NULL,
	[address_id] [int] NOT NULL,
 CONSTRAINT [PK_users_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Creating products Table and columns ******/
/****** Object:  Table [dbo].[products]    Script Date: 19.01.2022 15:37:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[barcode] [nvarchar](50) NOT NULL,
	[owner_id] [int] NOT NULL,
	[productVariant_id] [int] NOT NULL,
	[number] [int] NOT NULL,
 CONSTRAINT [PK_book_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Creating order history Table and columns ******/
/****** Object:  Table [dbo].[orderHistory]    Script Date: 19.01.2022 15:37:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orderHistory](
	[id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[number] [int] NOT NULL,
	[date] [date] NOT NULL,
	[currentPrice] [money] NOT NULL,
 CONSTRAINT [PK_sellHistory] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Creating product variant Table and columns ******/
/****** Object:  Table [dbo].[productVariant]    Script Date: 19.01.2022 15:37:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[productVariant](
	[id] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[type] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_productVariant] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Creating order logs View ******/
/****** Object:  View [dbo].[orders_log]    Script Date: 19.01.2022 15:37:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[orders_log]
AS
SELECT        dbo.users.name AS [Custumer Name], dbo.address.tel AS [Phone Number], dbo.address.address AS Address, dbo.products.name AS [Product Name], dbo.productVariant.name AS [Product Variant], 
                         dbo.products.barcode AS Barcode, dbo.productVariant.type AS [Product Type], dbo.orderHistory.date AS Date
FROM            dbo.users INNER JOIN
                         dbo.address ON dbo.users.address_id = dbo.address.id INNER JOIN
                         dbo.orderHistory ON dbo.users.id = dbo.orderHistory.user_id INNER JOIN
                         dbo.products ON dbo.orderHistory.product_id = dbo.products.id INNER JOIN
                         dbo.productVariant ON dbo.products.productVariant_id = dbo.productVariant.id
GO

/****** Creating authority Table and columns ******/
/****** Object:  Table [dbo].[authority]    Script Date: 19.01.2022 15:37:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[authority](
	[id] [int] NOT NULL,
	[addProduct] [bit] NOT NULL,
	[deleteProduct] [bit] NOT NULL,
	[giveProduct] [bit] NOT NULL,
	[takeProduct] [bit] NOT NULL,
	[saleProduct] [bit] NOT NULL,
	[buyProduct] [bit] NOT NULL,
	[changeProduct] [bit] NOT NULL,
	[addUser] [bit] NOT NULL,
	[deleteUser] [bit] NOT NULL,
	[changeUser] [bit] NOT NULL,
	[confirmUser] [bit] NOT NULL,
 CONSTRAINT [PK_authority] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Creating buy history Table and columns ******/
/****** Object:  Table [dbo].[buyHistory]    Script Date: 19.01.2022 15:37:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[buyHistory](
	[id] [int] NOT NULL,
	[companies_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[number] [int] NOT NULL,
	[date] [date] NOT NULL,
	[currentPrice] [money] NOT NULL,
 CONSTRAINT [PK_buyHistory] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Creating companies Table and columns ******/
/****** Object:  Table [dbo].[companies]    Script Date: 19.01.2022 15:37:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[companies](
	[id] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[address_id] [int] NOT NULL,
 CONSTRAINT [PK_companies] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Creating owners Table and columns ******/
/****** Object:  Table [dbo].[owners]    Script Date: 19.01.2022 15:37:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[owners](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[about] [varchar](50) NOT NULL,
 CONSTRAINT [PK_writer_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Creating payment companies Table and columns ******/
/****** Object:  Table [dbo].[paymentCompanies]    Script Date: 19.01.2022 15:37:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[paymentCompanies](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[paymentMethod_id] [int] NOT NULL,
	[address_id] [int] NOT NULL,
 CONSTRAINT [PK_paymentCompanies_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Creating payment methods Table and columns ******/
/****** Object:  Table [dbo].[paymentMethods]    Script Date: 19.01.2022 15:37:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[paymentMethods](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[method] [varchar](50) NULL,
 CONSTRAINT [PK_paymentMethods_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Creating personels Table and columns ******/
/****** Object:  Table [dbo].[personels]    Script Date: 19.01.2022 15:37:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[personels](
	[id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
	[personel_no] [int] IDENTITY(1,1) NOT NULL,
	[position] [nvarchar](50) NOT NULL,
	[authority_id] [int] NOT NULL,
 CONSTRAINT [PK_personels] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Creating producer Table and columns ******/
/****** Object:  Table [dbo].[producer]    Script Date: 19.01.2022 15:37:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[producer](
	[id] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[address_id] [int] NOT NULL,
 CONSTRAINT [PK_producer] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Creating product Price Table and columns ******/
/****** Object:  Table [dbo].[productPrice]    Script Date: 19.01.2022 15:37:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[productPrice](
	[id] [int] NOT NULL,
	[sellPrice] [money] NOT NULL,
	[buyPrice] [money] NOT NULL,
	[product_id] [int] NOT NULL,
	[modifiedDate] [date] NOT NULL,
 CONSTRAINT [PK_bookPrice] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Creating rent history Table and columns ******/
/****** Object:  Table [dbo].[rentHistory]    Script Date: 19.01.2022 15:37:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rentHistory](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[date] [datetime] NOT NULL,
	[is_return] [bit] NOT NULL,
 CONSTRAINT [PK_taken_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Creating shipping companies Table and columns ******/
/****** Object:  Table [dbo].[shippingCompanies]    Script Date: 19.01.2022 15:37:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[shippingCompanies](
	[id] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[price] [money] NOT NULL,
	[address_id] [int] NOT NULL,
 CONSTRAINT [PK_shippingCompanies] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[rentHistory] ADD  CONSTRAINT [DF__taken__return__4E88ABD4]  DEFAULT ((1)) FOR [is_return]
GO
ALTER TABLE [dbo].[buyHistory]  WITH CHECK ADD  CONSTRAINT [FK_buyHistory_books] FOREIGN KEY([product_id])
REFERENCES [dbo].[products] ([id])
GO
ALTER TABLE [dbo].[buyHistory] CHECK CONSTRAINT [FK_buyHistory_books]
GO
ALTER TABLE [dbo].[buyHistory]  WITH CHECK ADD  CONSTRAINT [FK_buyHistory_companies] FOREIGN KEY([companies_id])
REFERENCES [dbo].[companies] ([id])
GO
ALTER TABLE [dbo].[buyHistory] CHECK CONSTRAINT [FK_buyHistory_companies]
GO
ALTER TABLE [dbo].[companies]  WITH CHECK ADD  CONSTRAINT [FK_companies_address] FOREIGN KEY([address_id])
REFERENCES [dbo].[address] ([id])
GO
ALTER TABLE [dbo].[companies] CHECK CONSTRAINT [FK_companies_address]
GO
ALTER TABLE [dbo].[orderHistory]  WITH CHECK ADD  CONSTRAINT [FK_sellHistory_books] FOREIGN KEY([product_id])
REFERENCES [dbo].[products] ([id])
GO
ALTER TABLE [dbo].[orderHistory] CHECK CONSTRAINT [FK_sellHistory_books]
GO
ALTER TABLE [dbo].[orderHistory]  WITH CHECK ADD  CONSTRAINT [FK_sellHistory_users] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[orderHistory] CHECK CONSTRAINT [FK_sellHistory_users]
GO
ALTER TABLE [dbo].[paymentCompanies]  WITH CHECK ADD  CONSTRAINT [FK_paymentCompanies_address] FOREIGN KEY([address_id])
REFERENCES [dbo].[address] ([id])
GO
ALTER TABLE [dbo].[paymentCompanies] CHECK CONSTRAINT [FK_paymentCompanies_address]
GO
ALTER TABLE [dbo].[paymentCompanies]  WITH CHECK ADD  CONSTRAINT [FK_paymentCompanies_paymentMethods] FOREIGN KEY([paymentMethod_id])
REFERENCES [dbo].[paymentMethods] ([id])
GO
ALTER TABLE [dbo].[paymentCompanies] CHECK CONSTRAINT [FK_paymentCompanies_paymentMethods]
GO
ALTER TABLE [dbo].[personels]  WITH CHECK ADD  CONSTRAINT [FK_personels_authority] FOREIGN KEY([authority_id])
REFERENCES [dbo].[authority] ([id])
GO
ALTER TABLE [dbo].[personels] CHECK CONSTRAINT [FK_personels_authority]
GO
ALTER TABLE [dbo].[personels]  WITH CHECK ADD  CONSTRAINT [FK_personels_users] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[personels] CHECK CONSTRAINT [FK_personels_users]
GO
ALTER TABLE [dbo].[producer]  WITH CHECK ADD  CONSTRAINT [FK_producer_address] FOREIGN KEY([address_id])
REFERENCES [dbo].[address] ([id])
GO
ALTER TABLE [dbo].[producer] CHECK CONSTRAINT [FK_producer_address]
GO
ALTER TABLE [dbo].[productPrice]  WITH CHECK ADD  CONSTRAINT [FK_bookPrice_books] FOREIGN KEY([product_id])
REFERENCES [dbo].[products] ([id])
GO
ALTER TABLE [dbo].[productPrice] CHECK CONSTRAINT [FK_bookPrice_books]
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD  CONSTRAINT [FK_book_writer_id] FOREIGN KEY([owner_id])
REFERENCES [dbo].[owners] ([id])
GO
ALTER TABLE [dbo].[products] CHECK CONSTRAINT [FK_book_writer_id]
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD  CONSTRAINT [FK_products_productVariant] FOREIGN KEY([productVariant_id])
REFERENCES [dbo].[productVariant] ([id])
GO
ALTER TABLE [dbo].[products] CHECK CONSTRAINT [FK_products_productVariant]
GO
ALTER TABLE [dbo].[rentHistory]  WITH CHECK ADD  CONSTRAINT [FK_taken_book_id] FOREIGN KEY([product_id])
REFERENCES [dbo].[products] ([id])
GO
ALTER TABLE [dbo].[rentHistory] CHECK CONSTRAINT [FK_taken_book_id]
GO
ALTER TABLE [dbo].[rentHistory]  WITH CHECK ADD  CONSTRAINT [FK_taken_user_id] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[rentHistory] CHECK CONSTRAINT [FK_taken_user_id]
GO
ALTER TABLE [dbo].[shippingCompanies]  WITH CHECK ADD  CONSTRAINT [FK_shippingCompanies_address] FOREIGN KEY([address_id])
REFERENCES [dbo].[address] ([id])
GO
ALTER TABLE [dbo].[shippingCompanies] CHECK CONSTRAINT [FK_shippingCompanies_address]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [FK_users_address] FOREIGN KEY([address_id])
REFERENCES [dbo].[address] ([id])
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [FK_users_address]
GO
EXEC [PatikaBootcampHafta2].sys.sp_addextendedproperty @name=N'MS_Description', @value=N'PatikaBootcampHafta2' 
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[37] 4[32] 2[19] 3) )"
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
         Begin Table = "users"
            Begin Extent = 
               Top = 17
               Left = 31
               Bottom = 147
               Right = 201
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "address"
            Begin Extent = 
               Top = 97
               Left = 256
               Bottom = 210
               Right = 426
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "orderHistory"
            Begin Extent = 
               Top = 6
               Left = 502
               Bottom = 169
               Right = 672
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "products"
            Begin Extent = 
               Top = 6
               Left = 870
               Bottom = 176
               Right = 1053
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "productVariant"
            Begin Extent = 
               Top = 46
               Left = 1138
               Bottom = 159
               Right = 1308
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
         Alias = 1650
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
    ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'orders_log'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'     Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'orders_log'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'orders_log'
GO
USE [master]
GO
ALTER DATABASE [PatikaBootcampHafta2] SET  READ_WRITE 
GO

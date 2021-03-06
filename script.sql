USE [master]
GO
/****** Object:  Database [ECommerceDb]    Script Date: 5.5.2022 18:43:56 ******/
CREATE DATABASE [ECommerceDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ECommerceDb', FILENAME = N'C:\Users\KURSAD\ECommerceDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ECommerceDb_log', FILENAME = N'C:\Users\KURSAD\ECommerceDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ECommerceDb] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ECommerceDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ECommerceDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ECommerceDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ECommerceDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ECommerceDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ECommerceDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [ECommerceDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ECommerceDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ECommerceDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ECommerceDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ECommerceDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ECommerceDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ECommerceDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ECommerceDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ECommerceDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ECommerceDb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ECommerceDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ECommerceDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ECommerceDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ECommerceDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ECommerceDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ECommerceDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ECommerceDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ECommerceDb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ECommerceDb] SET  MULTI_USER 
GO
ALTER DATABASE [ECommerceDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ECommerceDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ECommerceDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ECommerceDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ECommerceDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ECommerceDb] SET QUERY_STORE = OFF
GO
USE [ECommerceDb]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [ECommerceDb]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 5.5.2022 18:43:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[EMail] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](25) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 5.5.2022 18:43:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[OrderDate] [datetime2](7) NOT NULL,
	[ShipName] [nvarchar](100) NOT NULL,
	[ShipAddress] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 5.5.2022 18:43:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[UnitPrice] [decimal](18, 2) NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC,
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 5.5.2022 18:43:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](50) NOT NULL,
	[UnitPrice] [decimal](18, 2) NOT NULL,
	[UnitsInStock] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[CompanyId] [int] NOT NULL,
	[BarcodeNumber] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[User_Orders]    Script Date: 5.5.2022 18:43:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[User_Orders] as
select u.FirstName, u.LastName, od.OrderId, o.OrderDate, p.ProductName, od.Quantity, od.UnitPrice, od.UnitPrice*od.Quantity as TotalPrice
from Users u
inner join Orders o
on u.UserId = o.UserId
inner join OrderDetails od
on o.OrderId = od.OrderId
inner join Products p
on od.ProductId = p.ProductId
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 5.5.2022 18:43:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UIX_CategoryName]    Script Date: 5.5.2022 18:43:56 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UIX_CategoryName] ON [dbo].[Categories]
(
	[CategoryName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderId]    Script Date: 5.5.2022 18:43:56 ******/
CREATE NONCLUSTERED INDEX [IX_OrderId] ON [dbo].[OrderDetails]
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductId]    Script Date: 5.5.2022 18:43:56 ******/
CREATE NONCLUSTERED INDEX [IX_ProductId] ON [dbo].[OrderDetails]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderDate]    Script Date: 5.5.2022 18:43:56 ******/
CREATE NONCLUSTERED INDEX [IX_OrderDate] ON [dbo].[Orders]
(
	[OrderDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserId]    Script Date: 5.5.2022 18:43:56 ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[Orders]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CategoryId]    Script Date: 5.5.2022 18:43:56 ******/
CREATE NONCLUSTERED INDEX [IX_CategoryId] ON [dbo].[Products]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ProductName]    Script Date: 5.5.2022 18:43:56 ******/
CREATE NONCLUSTERED INDEX [IX_ProductName] ON [dbo].[Products]
(
	[ProductName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UIX_Company_BarcodeNumber]    Script Date: 5.5.2022 18:43:56 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UIX_Company_BarcodeNumber] ON [dbo].[Products]
(
	[CompanyId] ASC,
	[BarcodeNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_LastName]    Script Date: 5.5.2022 18:43:56 ******/
CREATE NONCLUSTERED INDEX [IX_LastName] ON [dbo].[Users]
(
	[LastName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UIX_EMail]    Script Date: 5.5.2022 18:43:56 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UIX_EMail] ON [dbo].[Users]
(
	[EMail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Categories] ADD  CONSTRAINT [DF_Categories_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Categories] ADD  CONSTRAINT [DF_Categories_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_OrderDate]  DEFAULT (getdate()) FOR [OrderDate]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([OrderId])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Users]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([CategoryId])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [CK_Quantity] CHECK  (([Quantity]>(0)))
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [CK_Quantity]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [CK_UnitPrice] CHECK  (([UnitPrice]>(0)))
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [CK_UnitPrice]
GO
ALTER TABLE [dbo].[Products]  WITH NOCHECK ADD  CONSTRAINT [CK_ProductsInStock] CHECK  (([UnitsInStock]>=(0)))
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [CK_ProductsInStock]
GO
ALTER TABLE [dbo].[Products]  WITH NOCHECK ADD  CONSTRAINT [CK_ProductsUnitPrice] CHECK  (([UnitPrice]>(0)))
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [CK_ProductsUnitPrice]
GO
/****** Object:  Trigger [dbo].[TRG_SatisIptal_StokArttir]    Script Date: 5.5.2022 18:43:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[TRG_SatisIptal_StokArttir]
ON [dbo].[OrderDetails]
AFTER DELETE
AS
	DECLARE @productId INT
	DECLARE @orderCount INT
	SELECT @productId=ProductId, @orderCount=Quantity FROM deleted
	UPDATE Products SET UnitsInStock=UnitsInStock+@orderCount
	WHERE ProductId=@productId
GO
ALTER TABLE [dbo].[OrderDetails] ENABLE TRIGGER [TRG_SatisIptal_StokArttir]
GO
/****** Object:  Trigger [dbo].[TRG_SatisUpdate_StokDegistir]    Script Date: 5.5.2022 18:43:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[TRG_SatisUpdate_StokDegistir]
ON [dbo].[OrderDetails]
AFTER UPDATE
AS
	DECLARE @productId INT
	DECLARE @orderCount INT
	DECLARE @newOrderCount INT
	SELECT @productId=ProductId, @orderCount=Quantity FROM deleted
	SELECT @productId=ProductId, @newOrderCount=Quantity FROM inserted
	UPDATE Products SET UnitsInStock=UnitsInStock+(@orderCount-@newOrderCount)
	WHERE ProductId=@productId
GO
ALTER TABLE [dbo].[OrderDetails] ENABLE TRIGGER [TRG_SatisUpdate_StokDegistir]
GO
/****** Object:  Trigger [dbo].[TRG_StokAzalt]    Script Date: 5.5.2022 18:43:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[TRG_StokAzalt]
ON [dbo].[OrderDetails]
AFTER INSERT
AS
	DECLARE @productId INT
	DECLARE @orderCount INT
	SELECT @productId=ProductId, @orderCount=Quantity FROM inserted
	UPDATE Products SET UnitsInStock=UnitsInStock-@orderCount
	WHERE ProductId=@productId
GO
ALTER TABLE [dbo].[OrderDetails] ENABLE TRIGGER [TRG_StokAzalt]
GO
USE [master]
GO
ALTER DATABASE [ECommerceDb] SET  READ_WRITE 
GO

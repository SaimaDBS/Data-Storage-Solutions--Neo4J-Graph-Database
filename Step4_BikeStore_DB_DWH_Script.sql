USE [master]
GO
/****** Object:  Database [BikeStores_DW]    Script Date: 05/08/2022 15:21:45 ******/
CREATE DATABASE [BikeStores_DW]
 
GO
ALTER DATABASE [BikeStores_DW] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BikeStores_DW].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BikeStores_DW] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BikeStores_DW] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BikeStores_DW] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BikeStores_DW] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BikeStores_DW] SET ARITHABORT OFF 
GO
ALTER DATABASE [BikeStores_DW] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BikeStores_DW] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BikeStores_DW] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BikeStores_DW] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BikeStores_DW] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BikeStores_DW] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BikeStores_DW] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BikeStores_DW] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BikeStores_DW] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BikeStores_DW] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BikeStores_DW] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BikeStores_DW] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BikeStores_DW] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BikeStores_DW] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BikeStores_DW] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BikeStores_DW] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BikeStores_DW] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BikeStores_DW] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BikeStores_DW] SET  MULTI_USER 
GO
ALTER DATABASE [BikeStores_DW] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BikeStores_DW] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BikeStores_DW] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BikeStores_DW] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BikeStores_DW] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BikeStores_DW] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [BikeStores_DW] SET QUERY_STORE = OFF
GO
USE [BikeStores_DW]
GO
/****** Object:  Table [dbo].[Calendar_Dim]    Script Date: 05/08/2022 15:21:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Calendar_Dim](
	[CalendarKey] [int] IDENTITY(1,1) NOT NULL,
	[FullDate] [date] NULL,
	[DayofWeek_] [char](15) NULL,
	[DayType] [char](20) NULL,
	[DayofMonth_] [int] NULL,
	[Month_] [char](10) NULL,
	[Quarter_] [char](2) NULL,
	[Year_] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CalendarKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer_Dim]    Script Date: 05/08/2022 15:21:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer_Dim](
	[CustomerKey] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[FirstName] [varchar](255) NOT NULL,
	[LastName] [varchar](255) NOT NULL,
	[Phone] [varchar](25) NULL,
	[Email] [varchar](255) NOT NULL,
	[Street] [varchar](255) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](25) NULL,
	[ZipCode] [varchar](5) NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_Dim]    Script Date: 05/08/2022 15:21:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Dim](
	[ProductKey] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [varchar](5) NOT NULL,
	[ProductName] [varchar](255) NOT NULL,
	[ProductPrice] [decimal](10, 2) NOT NULL,
	[ModelYear] [smallint] NOT NULL,
	[ProductBrandName] [varchar](255) NOT NULL,
	[ProductCategoryName] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SalesOrder_Fact]    Script Date: 05/08/2022 15:21:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesOrder_Fact](
	[CalendarKey] [int] NULL,
	[StoreKey] [int] NULL,
	[ProductKey] [int] NOT NULL,
	[CustomerKey] [int] NULL,
	[OrderId] [varchar](10) NOT NULL,
	[OrderDate] [date] NULL,
	[DollarsSold] [int] NULL,
	[UnitsSold] [int] NULL,
	[Status] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductKey] ASC,
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Store_Dim]    Script Date: 05/08/2022 15:21:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Store_Dim](
	[StoreKey] [int] IDENTITY(1,1) NOT NULL,
	[StoreId] [int] NOT NULL,
	[StoreName] [varchar](255) NOT NULL,
	[Phone] [varchar](25) NULL,
	[Email] [varchar](255) NULL,
	[Street] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[State] [varchar](10) NULL,
	[ZipCode] [varchar](5) NULL,
PRIMARY KEY CLUSTERED 
(
	[StoreKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SalesOrder_Fact]  WITH NOCHECK ADD FOREIGN KEY([CalendarKey])
REFERENCES [dbo].[Calendar_Dim] ([CalendarKey])
GO
ALTER TABLE [dbo].[SalesOrder_Fact]  WITH NOCHECK ADD FOREIGN KEY([CustomerKey])
REFERENCES [dbo].[Customer_Dim] ([CustomerKey])
GO
ALTER TABLE [dbo].[SalesOrder_Fact]  WITH NOCHECK ADD FOREIGN KEY([ProductKey])
REFERENCES [dbo].[Product_Dim] ([ProductKey])
GO
ALTER TABLE [dbo].[SalesOrder_Fact]  WITH NOCHECK ADD FOREIGN KEY([StoreKey])
REFERENCES [dbo].[Store_Dim] ([StoreKey])
GO
/****** Object:  StoredProcedure [dbo].[usp_GetAllProducts]    Script Date: 05/08/2022 15:21:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Rajendra Kumar

-- Description:	Return all products
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetAllProducts]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT  [ProductKey]
      ,[ProductID]
      ,[ProductName]
      ,[ProductPrice]
      ,[ModelYear]
      ,[ProductBrandName]
      ,[ProductCategoryName]
  FROM [BikeStores_DW].[dbo].[Product_Dim]
END
GO
/****** Object:  StoredProcedure [dbo].[usp_InnerQuery]    Script Date: 05/08/2022 15:21:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_InnerQuery]
@id int
AS
SELECT sf.OrderId, SUM(sf.DollarsSold) [Sold Amt], c.FullDate, s.Storeid
FROM SalesOrder_Fact sf
INNER JOIN Store_Dim s
ON
Sf.Storekey=s.Storekey
INNER JOIN Calendar_Dim c
ON sf.Calendarkey=c.CalendarKey
WHERE s.StoreID = @id
GROUP BY s.Storeid, sf.OrderId, c.FullDate
GO
/****** Object:  StoredProcedure [dbo].[usp_OuterQuery]    Script Date: 05/08/2022 15:21:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_OuterQuery]
AS
SELECT s.Storeid, SUM(sf.DollarsSold) AS Sales
FROM SalesOrder_Fact sf
INNER JOIN Store_Dim s
ON sf.Storekey=s.Storekey
GROUP BY s.StoreID
GO
/****** Object:  StoredProcedure [dbo].[usp_TotalSalesByStore]    Script Date: 05/08/2022 15:21:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_TotalSalesByStore]
@id INT
AS
SELECT SUM(sf.DollarsSold) as TotalSales, s.StoreId, p.ProductName, p.ProductCategoryName, 
p.ProductPrice, c.Month_, c.Year_
FROM SalesOrder_Fact sf
INNER JOIN Product_Dim p
ON sf.ProductKey=p.ProductKey
INNER JOIN Calendar_Dim c
ON sf.CalendarKey=c.CalendarKey
INNER JOIN
Store_Dim s ON sf.StoreKey = s.StoreKey
WHERE s.StoreID=@id
GROUP BY s.StoreId, p.ProductName, p.ProductCategoryName, p.ProductPrice, c.Month_, c.Year_ 
GO
USE [master]
GO
ALTER DATABASE [BikeStores_DW] SET  READ_WRITE 
GO

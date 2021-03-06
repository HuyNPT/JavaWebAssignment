USE [master]
GO
/****** Object:  Database [Assignment]    Script Date: 7/12/2021 3:48:09 PM ******/
CREATE DATABASE [Assignment]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Assignment', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.HUYNPT\MSSQL\DATA\Assignment.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Assignment_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.HUYNPT\MSSQL\DATA\Assignment_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Assignment] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Assignment].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Assignment] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Assignment] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Assignment] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Assignment] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Assignment] SET ARITHABORT OFF 
GO
ALTER DATABASE [Assignment] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Assignment] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Assignment] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Assignment] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Assignment] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Assignment] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Assignment] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Assignment] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Assignment] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Assignment] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Assignment] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Assignment] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Assignment] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Assignment] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Assignment] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Assignment] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Assignment] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Assignment] SET RECOVERY FULL 
GO
ALTER DATABASE [Assignment] SET  MULTI_USER 
GO
ALTER DATABASE [Assignment] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Assignment] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Assignment] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Assignment] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Assignment] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Assignment] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Assignment', N'ON'
GO
ALTER DATABASE [Assignment] SET QUERY_STORE = OFF
GO
USE [Assignment]
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 7/12/2021 3:48:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brand](
	[BrandId] [int] IDENTITY(1,1) NOT NULL,
	[BrandName] [nvarchar](250) NULL,
 CONSTRAINT [PK_Brand] PRIMARY KEY CLUSTERED 
(
	[BrandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 7/12/2021 3:48:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[orderId] [int] NULL,
	[productId] [int] NULL,
	[quantity] [int] NULL,
	[price] [float] NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 7/12/2021 3:48:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[email] [nchar](50) NULL,
	[userId] [nchar](20) NULL,
	[address] [nchar](250) NULL,
	[phone] [nchar](11) NULL,
	[total] [float] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 7/12/2021 3:48:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[Imgurl] [nvarchar](max) NULL,
	[Price] [float] NULL,
	[Title] [nvarchar](250) NULL,
	[Description] [nvarchar](max) NULL,
	[Quantity] [int] NULL,
	[BrandId] [int] NULL,
	[isDelete] [bit] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 7/12/2021 3:48:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [nchar](20) NOT NULL,
	[name] [nchar](250) NULL,
	[password] [nchar](50) NULL,
	[role] [int] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Brand] ON 

INSERT [dbo].[Brand] ([BrandId], [BrandName]) VALUES (1, N'Asus')
INSERT [dbo].[Brand] ([BrandId], [BrandName]) VALUES (2, N'Dell')
INSERT [dbo].[Brand] ([BrandId], [BrandName]) VALUES (3, N'Lenovo')
SET IDENTITY_INSERT [dbo].[Brand] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Id], [Name], [Imgurl], [Price], [Title], [Description], [Quantity], [BrandId], [isDelete]) VALUES (1, N'Asus Vivo Book', N'images/3563465165_524fac886d_z.jpg', 121212, N'Laptop 2021', N'Asus TUF Gaming F17 is a Windows 10 Professional laptop with a 17.30-inch display. It is powered by a Core i5 processor.

Graphics are powered by Nvidia GeForce RTX 3050. Connectivity options include Wi-Fi 802.11 a/b/g/n/ac/Yes, Bluetooth, Ethernet and it comes with 4 USB ports, USB 3.2 Gen 1 (Type A), Thunderbolt 4 (Type C), HDMI Port, Headphone and Mic Combo Jack, RJ45 (LAN) ports.

As of 3rd July 2021, Asus TUF Gaming F17 price in India starts at Rs. 92,990.', 5, 2, 0)
INSERT [dbo].[Product] ([Id], [Name], [Imgurl], [Price], [Title], [Description], [Quantity], [BrandId], [isDelete]) VALUES (2, N'Asus Zenbook Book', N'https://anphat.com.vn/media/product/31629_5328_asus_a412fa_ek155t_anh4_2.jpg', 200, N'Laptop 2021', N'Asus TUF Gaming F17 is a Windows 10 Professional laptop with a 17.30-inch display. It is powered by a Core i5 processor.

Graphics are powered by Nvidia GeForce RTX 3050. Connectivity options include Wi-Fi 802.11 a/b/g/n/ac/Yes, Bluetooth, Ethernet and it comes with 4 USB ports, USB 3.2 Gen 1 (Type A), Thunderbolt 4 (Type C), HDMI Port, Headphone and Mic Combo Jack, RJ45 (LAN) ports.

As of 3rd July 2021, Asus TUF Gaming F17 price in India starts at Rs. 92,990.', 12, 1, 1)
INSERT [dbo].[Product] ([Id], [Name], [Imgurl], [Price], [Title], [Description], [Quantity], [BrandId], [isDelete]) VALUES (3, N'Asus Zenbook Boo00k', N'images/3563465165_524fac886d_z.jpg', 5012, N'Laptop 2021', N'Laptop 202333', 19, 1, 0)
INSERT [dbo].[Product] ([Id], [Name], [Imgurl], [Price], [Title], [Description], [Quantity], [BrandId], [isDelete]) VALUES (4, N'Test', N'https://anphat.com.vn/media/product/31629_5328_asus_a412fa_ek155t_anh4_2.jpg', 100, N'Test', N'Asus TUF Gaming F17 is a Windows 10 Professional laptop with a 17.30-inch display. It is powered by a Core i5 processor.

Graphics are powered by Nvidia GeForce RTX 3050. Connectivity options include Wi-Fi 802.11 a/b/g/n/ac/Yes, Bluetooth, Ethernet and it comes with 4 USB ports, USB 3.2 Gen 1 (Type A), Thunderbolt 4 (Type C), HDMI Port, Headphone and Mic Combo Jack, RJ45 (LAN) ports.

As of 3rd July 2021, Asus TUF Gaming F17 price in India starts at Rs. 92,990.', 6, 2, 0)
INSERT [dbo].[Product] ([Id], [Name], [Imgurl], [Price], [Title], [Description], [Quantity], [BrandId], [isDelete]) VALUES (5, N'1', N'images/3563465165_524fac886d_z.jpg', 1, N'1', N'1', 1, 1, 0)
INSERT [dbo].[Product] ([Id], [Name], [Imgurl], [Price], [Title], [Description], [Quantity], [BrandId], [isDelete]) VALUES (6, N'test', N'images/3563465165_524fac886d_z.jpg', 1, N'images/3563465165_524fac886d_z.jpg', N'1', 12, 3, 0)
INSERT [dbo].[Product] ([Id], [Name], [Imgurl], [Price], [Title], [Description], [Quantity], [BrandId], [isDelete]) VALUES (7, N'1', N'images/185569532_997424997676973_1808680890549122549_n.jpg', 10, N'1', N'1', 1, 3, 0)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
INSERT [dbo].[User] ([Id], [name], [password], [role]) VALUES (N'huy1                ', N'Nguyen PhuocThanh Huy                                                                                                                                                                                                                                     ', N'1234                                              ', 2)
INSERT [dbo].[User] ([Id], [name], [password], [role]) VALUES (N'huynpt              ', N'Nguyen PhuocThanh Huy                                                                                                                                                                                                                                     ', N'1234                                              ', 1)
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Orders] FOREIGN KEY([orderId])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Orders]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Product] FOREIGN KEY([productId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Product]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_User1] FOREIGN KEY([userId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_User1]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Brand] FOREIGN KEY([BrandId])
REFERENCES [dbo].[Brand] ([BrandId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Brand]
GO
USE [master]
GO
ALTER DATABASE [Assignment] SET  READ_WRITE 
GO

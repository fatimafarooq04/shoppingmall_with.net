USE [master]
GO
/****** Object:  Database [ABCD_Mall]    Script Date: 11/17/2024 8:14:54 PM ******/
CREATE DATABASE [ABCD_Mall]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ABCD_Mall', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\ABCD_Mall.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ABCD_Mall_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\ABCD_Mall_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ABCD_Mall] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ABCD_Mall].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ABCD_Mall] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ABCD_Mall] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ABCD_Mall] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ABCD_Mall] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ABCD_Mall] SET ARITHABORT OFF 
GO
ALTER DATABASE [ABCD_Mall] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ABCD_Mall] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ABCD_Mall] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ABCD_Mall] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ABCD_Mall] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ABCD_Mall] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ABCD_Mall] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ABCD_Mall] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ABCD_Mall] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ABCD_Mall] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ABCD_Mall] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ABCD_Mall] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ABCD_Mall] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ABCD_Mall] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ABCD_Mall] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ABCD_Mall] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ABCD_Mall] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ABCD_Mall] SET RECOVERY FULL 
GO
ALTER DATABASE [ABCD_Mall] SET  MULTI_USER 
GO
ALTER DATABASE [ABCD_Mall] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ABCD_Mall] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ABCD_Mall] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ABCD_Mall] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ABCD_Mall] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ABCD_Mall] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ABCD_Mall] SET QUERY_STORE = OFF
GO
USE [ABCD_Mall]
GO
/****** Object:  Table [dbo].[Admins]    Script Date: 11/17/2024 8:14:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admins](
	[AdminID] [int] IDENTITY(1,1) NOT NULL,
	[AdminName] [varchar](100) NOT NULL,
	[Email] [varchar](255) NOT NULL,
	[PasswordHash] [varchar](255) NOT NULL,
	[RoleID] [int] NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
	[image] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[AdminID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bookings]    Script Date: 11/17/2024 8:14:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bookings](
	[BookingId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Phone] [nvarchar](15) NOT NULL,
	[MovieId] [int] NULL,
	[ShowtimeId] [int] NULL,
	[RandomId] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[BookingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 11/17/2024 8:14:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](100) NOT NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dishes]    Script Date: 11/17/2024 8:14:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dishes](
	[DishID] [int] IDENTITY(1,1) NOT NULL,
	[DishName] [varchar](100) NOT NULL,
	[FoodCourtShopID] [int] NULL,
	[Price] [decimal](10, 2) NOT NULL,
	[Description] [text] NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[DishID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 11/17/2024 8:14:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[FeedbackID] [int] IDENTITY(1,1) NOT NULL,
	[ClientName] [varchar](100) NULL,
	[Comments] [text] NULL,
	[CreatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[FeedbackID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Floors]    Script Date: 11/17/2024 8:14:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Floors](
	[FloorID] [int] IDENTITY(1,1) NOT NULL,
	[FloorNumber] [int] NOT NULL,
	[Description] [varchar](255) NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[FloorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FoodCategory]    Script Date: 11/17/2024 8:14:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FoodCategory](
	[FoodCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[FoodCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FoodCourtImages]    Script Date: 11/17/2024 8:14:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FoodCourtImages](
	[FoodCourtImageID] [int] IDENTITY(1,1) NOT NULL,
	[FoodCourtShopID] [int] NULL,
	[ImageURL] [varchar](255) NOT NULL,
	[CreatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[FoodCourtImageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FoodCourtShops]    Script Date: 11/17/2024 8:14:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FoodCourtShops](
	[FoodCourtShopID] [int] IDENTITY(1,1) NOT NULL,
	[ShopName] [varchar](100) NOT NULL,
	[FloorID] [int] NULL,
	[ImageURL] [varchar](255) NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
	[FoodCategoryID] [int] NULL,
	[Description] [varchar](255) NULL,
	[Location] [varchar](255) NULL,
	[Phone] [varchar](255) NULL,
	[Email] [varchar](255) NULL,
	[StoreHours] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[FoodCourtShopID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gallery]    Script Date: 11/17/2024 8:14:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gallery](
	[GalleryID] [int] IDENTITY(1,1) NOT NULL,
	[ImageURL] [varchar](255) NULL,
	[CreatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[GalleryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Movies]    Script Date: 11/17/2024 8:14:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movies](
	[MovieId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[ReleaseDate] [date] NULL,
	[Language] [nvarchar](100) NULL,
	[Director] [nvarchar](255) NULL,
	[Actors] [nvarchar](max) NULL,
	[Poster] [nvarchar](max) NULL,
	[Trailer] [nvarchar](max) NULL,
	[Genre] [nvarchar](255) NULL,
	[Runtime] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MovieId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MovieShowtimes]    Script Date: 11/17/2024 8:14:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovieShowtimes](
	[ShowtimeId] [int] IDENTITY(1,1) NOT NULL,
	[MovieId] [int] NOT NULL,
	[ShowDate] [date] NOT NULL,
	[StartTime] [time](7) NOT NULL,
	[EndTime] [time](7) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ShowtimeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 11/17/2024 8:14:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](50) NOT NULL,
	[CreatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SeatBookings]    Script Date: 11/17/2024 8:14:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SeatBookings](
	[SeatBookingId] [int] IDENTITY(1,1) NOT NULL,
	[BookingId] [int] NULL,
	[SeatId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[SeatBookingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Seats]    Script Date: 11/17/2024 8:14:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Seats](
	[SeatID] [int] IDENTITY(1,1) NOT NULL,
	[ShowTimeID] [int] NOT NULL,
	[Price] [decimal](10, 2) NOT NULL,
	[SeatCode] [nvarchar](10) NOT NULL,
	[IsBooked] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SeatID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShopImages]    Script Date: 11/17/2024 8:14:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShopImages](
	[ShopImageID] [int] IDENTITY(1,1) NOT NULL,
	[ShopID] [int] NULL,
	[ImageURL] [varchar](255) NOT NULL,
	[CreatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ShopImageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shops]    Script Date: 11/17/2024 8:14:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shops](
	[ShopID] [int] IDENTITY(1,1) NOT NULL,
	[ShopName] [varchar](100) NOT NULL,
	[CategoryID] [int] NULL,
	[FloorID] [int] NULL,
	[ImageURL] [varchar](255) NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
	[Description] [nvarchar](max) NULL,
	[Location] [nvarchar](max) NULL,
	[Phone] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[StoreHours] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ShopID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 11/17/2024 8:14:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](255) NOT NULL,
	[Email] [nvarchar](255) NOT NULL,
	[Password] [nvarchar](255) NOT NULL,
	[FirstName] [nvarchar](255) NOT NULL,
	[LastName] [nvarchar](255) NOT NULL,
	[Userimg] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Bookings] ON 

INSERT [dbo].[Bookings] ([BookingId], [CustomerName], [Email], [Phone], [MovieId], [ShowtimeId], [RandomId]) VALUES (1015, N'fatima', N'ab@gmail.com', N'11312', 14, 1095, N'XILXZI8V')
INSERT [dbo].[Bookings] ([BookingId], [CustomerName], [Email], [Phone], [MovieId], [ShowtimeId], [RandomId]) VALUES (1016, N'fatima', N'ab@gmail.com', N'12345678901', 17, 1101, N'49WJS85Q')
INSERT [dbo].[Bookings] ([BookingId], [CustomerName], [Email], [Phone], [MovieId], [ShowtimeId], [RandomId]) VALUES (1017, N'fatima', N'ab@gmail.com', N'12345678909', 17, 1101, N'55DT33ZT')
INSERT [dbo].[Bookings] ([BookingId], [CustomerName], [Email], [Phone], [MovieId], [ShowtimeId], [RandomId]) VALUES (1018, N'fatima', N'ab@gmail.com', N'12345678901', 12, 1102, N'RUZYH7KB')
INSERT [dbo].[Bookings] ([BookingId], [CustomerName], [Email], [Phone], [MovieId], [ShowtimeId], [RandomId]) VALUES (1019, N'fatima', N'ab@gmail.com', N'12345678909', 17, 1101, N'PL8GFDGG')
INSERT [dbo].[Bookings] ([BookingId], [CustomerName], [Email], [Phone], [MovieId], [ShowtimeId], [RandomId]) VALUES (1020, N'fatima', N'ab@gmail.com', N'12345678909', 12, 1102, N'2VTEZNUB')
INSERT [dbo].[Bookings] ([BookingId], [CustomerName], [Email], [Phone], [MovieId], [ShowtimeId], [RandomId]) VALUES (1021, N'fatima', N'ab@gmail.com', N'12345678901', 17, 1101, N'ZZSI7A8Z')
SET IDENTITY_INSERT [dbo].[Bookings] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [CreatedAt], [UpdatedAt]) VALUES (1, N'Cosmetics', CAST(N'2024-09-26T20:15:32.330' AS DateTime), CAST(N'2024-09-26T20:15:32.330' AS DateTime))
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [CreatedAt], [UpdatedAt]) VALUES (2, N'Electronics', CAST(N'2024-09-26T20:25:26.120' AS DateTime), CAST(N'2024-09-26T20:25:26.120' AS DateTime))
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [CreatedAt], [UpdatedAt]) VALUES (3, N'Clothing', CAST(N'2024-10-03T18:12:16.640' AS DateTime), CAST(N'2024-10-03T18:12:16.640' AS DateTime))
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [CreatedAt], [UpdatedAt]) VALUES (4, N'Home Decor', CAST(N'2024-10-03T18:13:13.430' AS DateTime), CAST(N'2024-10-03T18:13:13.430' AS DateTime))
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [CreatedAt], [UpdatedAt]) VALUES (5, N'Jewelry and Watches', CAST(N'2024-10-03T18:13:30.657' AS DateTime), CAST(N'2024-10-03T18:13:30.657' AS DateTime))
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Feedback] ON 

INSERT [dbo].[Feedback] ([FeedbackID], [ClientName], [Comments], [CreatedAt]) VALUES (1, N'fatima', N'rergxfd', CAST(N'2024-10-22T14:21:55.690' AS DateTime))
INSERT [dbo].[Feedback] ([FeedbackID], [ClientName], [Comments], [CreatedAt]) VALUES (2, N'fatima', N'okay', CAST(N'2024-10-24T18:24:30.240' AS DateTime))
SET IDENTITY_INSERT [dbo].[Feedback] OFF
GO
SET IDENTITY_INSERT [dbo].[Floors] ON 

INSERT [dbo].[Floors] ([FloorID], [FloorNumber], [Description], [CreatedAt], [UpdatedAt]) VALUES (2, 1, N'first', CAST(N'2024-09-26T17:09:26.763' AS DateTime), CAST(N'2024-09-26T17:09:26.763' AS DateTime))
INSERT [dbo].[Floors] ([FloorID], [FloorNumber], [Description], [CreatedAt], [UpdatedAt]) VALUES (3, 2, N'second', CAST(N'2024-09-26T18:34:49.487' AS DateTime), CAST(N'2024-09-26T18:34:49.487' AS DateTime))
INSERT [dbo].[Floors] ([FloorID], [FloorNumber], [Description], [CreatedAt], [UpdatedAt]) VALUES (4, 3, N'Foodcourt', CAST(N'2024-09-26T18:39:32.927' AS DateTime), CAST(N'2024-09-26T18:39:32.927' AS DateTime))
SET IDENTITY_INSERT [dbo].[Floors] OFF
GO
SET IDENTITY_INSERT [dbo].[FoodCategory] ON 

INSERT [dbo].[FoodCategory] ([FoodCategoryID], [CategoryName]) VALUES (2, N'Fast Food')
INSERT [dbo].[FoodCategory] ([FoodCategoryID], [CategoryName]) VALUES (3, N'Desserts')
INSERT [dbo].[FoodCategory] ([FoodCategoryID], [CategoryName]) VALUES (4, N'Drinks')
SET IDENTITY_INSERT [dbo].[FoodCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[FoodCourtImages] ON 

INSERT [dbo].[FoodCourtImages] ([FoodCourtImageID], [FoodCourtShopID], [ImageURL], [CreatedAt]) VALUES (48, 7, N'pizza.jpg', CAST(N'2024-10-07T18:31:56.290' AS DateTime))
INSERT [dbo].[FoodCourtImages] ([FoodCourtImageID], [FoodCourtShopID], [ImageURL], [CreatedAt]) VALUES (49, 7, N'pizza2.jpg', CAST(N'2024-10-07T18:31:56.387' AS DateTime))
INSERT [dbo].[FoodCourtImages] ([FoodCourtImageID], [FoodCourtShopID], [ImageURL], [CreatedAt]) VALUES (57, 10, N'cake.jpg', CAST(N'2024-10-07T19:04:50.363' AS DateTime))
INSERT [dbo].[FoodCourtImages] ([FoodCourtImageID], [FoodCourtShopID], [ImageURL], [CreatedAt]) VALUES (58, 10, N'cake2.jpg', CAST(N'2024-10-07T19:04:50.423' AS DateTime))
INSERT [dbo].[FoodCourtImages] ([FoodCourtImageID], [FoodCourtShopID], [ImageURL], [CreatedAt]) VALUES (59, 11, N'drink.jpg', CAST(N'2024-10-07T19:05:34.633' AS DateTime))
INSERT [dbo].[FoodCourtImages] ([FoodCourtImageID], [FoodCourtShopID], [ImageURL], [CreatedAt]) VALUES (60, 11, N'drink2.jpg', CAST(N'2024-10-07T19:05:34.633' AS DateTime))
INSERT [dbo].[FoodCourtImages] ([FoodCourtImageID], [FoodCourtShopID], [ImageURL], [CreatedAt]) VALUES (61, 12, N'coffee.jpg', CAST(N'2024-10-07T19:06:05.190' AS DateTime))
INSERT [dbo].[FoodCourtImages] ([FoodCourtImageID], [FoodCourtShopID], [ImageURL], [CreatedAt]) VALUES (62, 12, N'coffee2.jpg', CAST(N'2024-10-07T19:06:05.190' AS DateTime))
INSERT [dbo].[FoodCourtImages] ([FoodCourtImageID], [FoodCourtShopID], [ImageURL], [CreatedAt]) VALUES (63, 8, N'burger.jpg', CAST(N'2024-10-07T19:14:26.057' AS DateTime))
INSERT [dbo].[FoodCourtImages] ([FoodCourtImageID], [FoodCourtShopID], [ImageURL], [CreatedAt]) VALUES (64, 8, N'burger2.jpg', CAST(N'2024-10-07T19:14:26.060' AS DateTime))
INSERT [dbo].[FoodCourtImages] ([FoodCourtImageID], [FoodCourtShopID], [ImageURL], [CreatedAt]) VALUES (65, 9, N'icecream.jpg', CAST(N'2024-10-07T19:15:40.690' AS DateTime))
INSERT [dbo].[FoodCourtImages] ([FoodCourtImageID], [FoodCourtShopID], [ImageURL], [CreatedAt]) VALUES (66, 9, N'icecream2.jpg', CAST(N'2024-10-07T19:15:40.693' AS DateTime))
SET IDENTITY_INSERT [dbo].[FoodCourtImages] OFF
GO
SET IDENTITY_INSERT [dbo].[FoodCourtShops] ON 

INSERT [dbo].[FoodCourtShops] ([FoodCourtShopID], [ShopName], [FloorID], [ImageURL], [CreatedAt], [UpdatedAt], [FoodCategoryID], [Description], [Location], [Phone], [Email], [StoreHours]) VALUES (7, N'Pizza Hut', 4, N'pizzashop cardimage.jpg', CAST(N'2024-10-05T16:54:02.200' AS DateTime), CAST(N'2024-10-05T16:54:02.200' AS DateTime), 2, N'Welcome to Slice & Stack Pizza Shop  At Slice & Stack, we believe in creating more than just pizza – we craft moments of joy with every slice. Our pizzas are made fresh daily with hand-tossed dough, slow-cooked sauces, and only the finest ingredients.', N'Main Entrance, Block A', N'123-456-7890', N'info@electroworld.com', N'Mon-Fri: 10 AM - 9 PM')
INSERT [dbo].[FoodCourtShops] ([FoodCourtShopID], [ShopName], [FloorID], [ImageURL], [CreatedAt], [UpdatedAt], [FoodCategoryID], [Description], [Location], [Phone], [Email], [StoreHours]) VALUES (8, N'Kababjess', 4, N'kabbabjees.jpg', CAST(N'2024-10-05T17:24:12.480' AS DateTime), CAST(N'2024-10-05T17:24:12.480' AS DateTime), 2, N' Welcome to Kababjess, where juicy patties meet fresh ingredients! Our gourmet burgers are handcrafted with locally sourced beef, topped with an array of toppings from creamy avocado to crispy bacon.', N'Main Entrance, Block A', N'123-456-7890', N'info@electroworld.com', N'Mon-Fri: 10 AM - 9 PM')
INSERT [dbo].[FoodCourtShops] ([FoodCourtShopID], [ShopName], [FloorID], [ImageURL], [CreatedAt], [UpdatedAt], [FoodCategoryID], [Description], [Location], [Phone], [Email], [StoreHours]) VALUES (9, N'Alpine', 4, N'icecream cardimage.jfif', CAST(N'2024-10-05T17:27:24.250' AS DateTime), CAST(N'2024-10-05T17:27:24.250' AS DateTime), 2, N'At Alpine Gelato, we specialize in crafting artisanal gelato and ice cream that transports you to the charming streets of Italy. Our creamy creations are made fresh daily, using authentic Italian recipes and only the finest, locally sourced ingredient', N'Main Entrance, Block A', N'123-456-7890', N'info@electroworld.com', N'Mon-Fri: 10 AM - 9 PM')
INSERT [dbo].[FoodCourtShops] ([FoodCourtShopID], [ShopName], [FloorID], [ImageURL], [CreatedAt], [UpdatedAt], [FoodCategoryID], [Description], [Location], [Phone], [Email], [StoreHours]) VALUES (10, N'Delizia CakeShop', 4, N'cacke Cardimage.jfif', CAST(N'2024-10-05T17:29:31.317' AS DateTime), CAST(N'2024-10-05T17:29:31.317' AS DateTime), 2, N'Welcome to Delizia Cake Shop At Delizia, we take pride in crafting exquisite cakes and desserts that delight your taste buds and create unforgettable moments', N'Main Entrance, Block A', N'123-456-7890', N'info@electroworld.com', N'Mon-Fri: 10 AM - 9 PM')
INSERT [dbo].[FoodCourtShops] ([FoodCourtShopID], [ShopName], [FloorID], [ImageURL], [CreatedAt], [UpdatedAt], [FoodCategoryID], [Description], [Location], [Phone], [Email], [StoreHours]) VALUES (11, N'The Drink Den', 4, N'juice card image.jfif', CAST(N'2024-10-05T17:31:43.463' AS DateTime), CAST(N'2024-10-05T17:31:43.463' AS DateTime), 4, N' The Drink Den is your cozy retreat for all things refreshing! Our extensive menu boasts an array of drinks, from rich espressos and frothy cappuccinos to vibrant smoothies and bubble teas.', N'Main Entrance, Block A', N'123-456-7890', N'info@electroworld.com', N'Mon-Fri: 10 AM - 9 PM')
INSERT [dbo].[FoodCourtShops] ([FoodCourtShopID], [ShopName], [FloorID], [ImageURL], [CreatedAt], [UpdatedAt], [FoodCategoryID], [Description], [Location], [Phone], [Email], [StoreHours]) VALUES (12, N'Coffee shop', 4, N'Coffee cardimage.jpg', CAST(N'2024-10-05T17:33:20.160' AS DateTime), CAST(N'2024-10-05T17:33:20.160' AS DateTime), 4, N': At Café Serenity, we believe in the calming power of a good cup of coffee. Our tranquil environment invites you to unwind as you enjoy our selection of artisanal coffees, soothing teas', N'Main Entrance, Block A', N'123-456-7890', N'info@electroworld.com', N'Mon-Fri: 10 AM - 9 PM')
SET IDENTITY_INSERT [dbo].[FoodCourtShops] OFF
GO
SET IDENTITY_INSERT [dbo].[Gallery] ON 

INSERT [dbo].[Gallery] ([GalleryID], [ImageURL], [CreatedAt]) VALUES (16, N'images.jfif', CAST(N'2024-10-09T00:38:17.700' AS DateTime))
INSERT [dbo].[Gallery] ([GalleryID], [ImageURL], [CreatedAt]) VALUES (19, N'burger.jpg', CAST(N'2024-10-09T12:31:26.880' AS DateTime))
INSERT [dbo].[Gallery] ([GalleryID], [ImageURL], [CreatedAt]) VALUES (20, N'burger2.jpg', CAST(N'2024-10-09T12:31:26.880' AS DateTime))
INSERT [dbo].[Gallery] ([GalleryID], [ImageURL], [CreatedAt]) VALUES (21, N'cacke Cardimage.jfif', CAST(N'2024-10-09T12:41:23.337' AS DateTime))
SET IDENTITY_INSERT [dbo].[Gallery] OFF
GO
SET IDENTITY_INSERT [dbo].[Movies] ON 

INSERT [dbo].[Movies] ([MovieId], [Title], [Description], [ReleaseDate], [Language], [Director], [Actors], [Poster], [Trailer], [Genre], [Runtime]) VALUES (12, N'Oppenheimer', N'The story of American scientist J. Robert Oppenheimer and his role in the development of the atomic bomb.', CAST(N'2023-07-21' AS Date), N'English, German, Italian', N'Christopher Nolan', N'Cillian Murphy, Emily Blunt, Matt Damon', N'https://m.media-amazon.com/images/M/MV5BMDBmYTZjNjUtN2M1MS00MTQ2LTk2ODgtNzc2M2QyZGE5NTVjXkEyXkFqcGdeQXVyNzAwMjU2MTY@._V1_SX300.jpg', N'https://www.youtube.com/watch?v=uYPbbksJxIg', N'Biography, Drama, History', N'180 min')
INSERT [dbo].[Movies] ([MovieId], [Title], [Description], [ReleaseDate], [Language], [Director], [Actors], [Poster], [Trailer], [Genre], [Runtime]) VALUES (14, N'Titanic', N'A seventeen-year-old aristocrat falls in love with a kind but poor artist aboard the luxurious, ill-fated R.M.S. Titanic.', CAST(N'1997-12-19' AS Date), N'English, Swedish, Italian, French', N'James Cameron', N'Leonardo DiCaprio, Kate Winslet, Billy Zane', N'https://m.media-amazon.com/images/M/MV5BMDdmZGU3NDQtY2E5My00ZTliLWIzOTUtMTY4ZGI1YjdiNjk3XkEyXkFqcGdeQXVyNTA4NzY1MzY@._V1_SX300.jpg', N'https://www.youtube.com/watch?v=kVrqfYjkTdQ', N'Drama, Romance', N'194 min')
INSERT [dbo].[Movies] ([MovieId], [Title], [Description], [ReleaseDate], [Language], [Director], [Actors], [Poster], [Trailer], [Genre], [Runtime]) VALUES (15, N'Student of the Year', N'Several alumni reminisce about their final year at St. Theresa''s College and the events that shaped their lives.', CAST(N'2012-10-19' AS Date), N'Hindi', N'Karan Johar, Abhishek Varman', N'Alia Bhatt, Sidharth Malhotra, Varun Dhawan', N'https://m.media-amazon.com/images/M/MV5BZjMxY2M4YWQtMGU1OS00NDNmLTgyZTctY2ExZmMyOGE1ZTcxXkEyXkFqcGc@._V1_SX300.jpg', N'https://www.youtube.com/watch?v=fivOhPjX9YM', N'Comedy, Drama, Music', N'146 min')
INSERT [dbo].[Movies] ([MovieId], [Title], [Description], [ReleaseDate], [Language], [Director], [Actors], [Poster], [Trailer], [Genre], [Runtime]) VALUES (16, N'Gangubai Kathiawadi', N'Duped and sold to a brothel, a young woman fearlessly reclaims her power, using underworld connections to preside over the world she was once a pawn in.', CAST(N'2022-02-25' AS Date), N'Hindi', N'Sanjay Leela Bhansali', N'Alia Bhatt, Shantanu Maheshwari, Vijay Raaz', N'https://m.media-amazon.com/images/M/MV5BYjliYjA0MWUtMjVkNi00MDc0LTg1MDgtYWExNGM0OWQ1NjBhXkEyXkFqcGc@._V1_SX300.jpg', N'https://www.youtube.com/watch?v=N1ZwRv3vJJY', N'Biography, Crime, Drama', N'152 min')
INSERT [dbo].[Movies] ([MovieId], [Title], [Description], [ReleaseDate], [Language], [Director], [Actors], [Poster], [Trailer], [Genre], [Runtime]) VALUES (17, N'Barbie', N'Barbie and Ken are having the time of their lives in the colorful and seemingly perfect world of Barbie Land. However, when they get a chance to go to the real world, they soon discover the joys and perils of living among humans.', CAST(N'2023-07-21' AS Date), N'English, Spanish', N'Greta Gerwig', N'Margot Robbie, Ryan Gosling, Issa Rae', N'https://m.media-amazon.com/images/M/MV5BYjI3NDU0ZGYtYjA2YS00Y2RlLTgwZDAtYTE2YTM5ZjE1M2JlXkEyXkFqcGc@._V1_SX300.jpg', N'https://www.youtube.com/watch?v=pBk4NYhWNMM', N'Adventure, Comedy, Fantasy', N'114 min')
SET IDENTITY_INSERT [dbo].[Movies] OFF
GO
SET IDENTITY_INSERT [dbo].[MovieShowtimes] ON 

INSERT [dbo].[MovieShowtimes] ([ShowtimeId], [MovieId], [ShowDate], [StartTime], [EndTime], [CreatedDate], [UpdatedDate]) VALUES (1094, 14, CAST(N'2024-10-17' AS Date), CAST(N'21:02:00' AS Time), CAST(N'00:16:00' AS Time), CAST(N'2024-10-16T14:44:02.010' AS DateTime), CAST(N'2024-10-16T14:44:02.010' AS DateTime))
INSERT [dbo].[MovieShowtimes] ([ShowtimeId], [MovieId], [ShowDate], [StartTime], [EndTime], [CreatedDate], [UpdatedDate]) VALUES (1095, 14, CAST(N'2024-10-15' AS Date), CAST(N'22:04:00' AS Time), CAST(N'00:30:00' AS Time), CAST(N'2024-10-16T14:44:02.143' AS DateTime), CAST(N'2024-10-16T14:44:02.143' AS DateTime))
INSERT [dbo].[MovieShowtimes] ([ShowtimeId], [MovieId], [ShowDate], [StartTime], [EndTime], [CreatedDate], [UpdatedDate]) VALUES (1096, 15, CAST(N'2024-10-15' AS Date), CAST(N'22:04:00' AS Time), CAST(N'00:30:00' AS Time), CAST(N'2024-10-20T12:48:07.243' AS DateTime), CAST(N'2024-10-20T12:48:07.243' AS DateTime))
INSERT [dbo].[MovieShowtimes] ([ShowtimeId], [MovieId], [ShowDate], [StartTime], [EndTime], [CreatedDate], [UpdatedDate]) VALUES (1097, 15, CAST(N'2024-10-13' AS Date), CAST(N'20:30:00' AS Time), CAST(N'22:56:00' AS Time), CAST(N'2024-10-20T12:48:07.420' AS DateTime), CAST(N'2024-10-20T12:48:07.420' AS DateTime))
INSERT [dbo].[MovieShowtimes] ([ShowtimeId], [MovieId], [ShowDate], [StartTime], [EndTime], [CreatedDate], [UpdatedDate]) VALUES (1098, 15, CAST(N'2024-10-13' AS Date), CAST(N'22:31:00' AS Time), CAST(N'00:57:00' AS Time), CAST(N'2024-10-20T12:48:07.437' AS DateTime), CAST(N'2024-10-20T12:48:07.437' AS DateTime))
INSERT [dbo].[MovieShowtimes] ([ShowtimeId], [MovieId], [ShowDate], [StartTime], [EndTime], [CreatedDate], [UpdatedDate]) VALUES (1099, 15, CAST(N'2024-11-01' AS Date), CAST(N'21:34:00' AS Time), CAST(N'21:34:00' AS Time), CAST(N'2024-10-20T12:48:07.443' AS DateTime), CAST(N'2024-10-20T12:48:07.443' AS DateTime))
INSERT [dbo].[MovieShowtimes] ([ShowtimeId], [MovieId], [ShowDate], [StartTime], [EndTime], [CreatedDate], [UpdatedDate]) VALUES (1101, 17, CAST(N'2024-11-13' AS Date), CAST(N'09:23:00' AS Time), CAST(N'11:17:00' AS Time), CAST(N'2024-11-02T07:22:08.733' AS DateTime), CAST(N'2024-11-02T07:22:08.733' AS DateTime))
INSERT [dbo].[MovieShowtimes] ([ShowtimeId], [MovieId], [ShowDate], [StartTime], [EndTime], [CreatedDate], [UpdatedDate]) VALUES (1102, 12, CAST(N'2024-11-13' AS Date), CAST(N'11:39:00' AS Time), CAST(N'14:39:00' AS Time), CAST(N'2024-11-02T11:39:03.720' AS DateTime), CAST(N'2024-11-02T11:39:03.720' AS DateTime))
SET IDENTITY_INSERT [dbo].[MovieShowtimes] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([RoleID], [RoleName], [CreatedAt]) VALUES (3, N'admin', CAST(N'2024-09-25T20:29:23.247' AS DateTime))
INSERT [dbo].[Roles] ([RoleID], [RoleName], [CreatedAt]) VALUES (5, N'user12', CAST(N'2024-09-25T22:12:53.500' AS DateTime))
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[SeatBookings] ON 

INSERT [dbo].[SeatBookings] ([SeatBookingId], [BookingId], [SeatId]) VALUES (1007, 1015, 1142)
INSERT [dbo].[SeatBookings] ([SeatBookingId], [BookingId], [SeatId]) VALUES (1008, 1015, 1143)
INSERT [dbo].[SeatBookings] ([SeatBookingId], [BookingId], [SeatId]) VALUES (1009, 1015, 1144)
INSERT [dbo].[SeatBookings] ([SeatBookingId], [BookingId], [SeatId]) VALUES (1011, 1016, 1318)
INSERT [dbo].[SeatBookings] ([SeatBookingId], [BookingId], [SeatId]) VALUES (1010, 1016, 1319)
INSERT [dbo].[SeatBookings] ([SeatBookingId], [BookingId], [SeatId]) VALUES (1012, 1017, 1303)
INSERT [dbo].[SeatBookings] ([SeatBookingId], [BookingId], [SeatId]) VALUES (1013, 1017, 1304)
INSERT [dbo].[SeatBookings] ([SeatBookingId], [BookingId], [SeatId]) VALUES (1016, 1018, 1342)
INSERT [dbo].[SeatBookings] ([SeatBookingId], [BookingId], [SeatId]) VALUES (1014, 1018, 1343)
INSERT [dbo].[SeatBookings] ([SeatBookingId], [BookingId], [SeatId]) VALUES (1015, 1018, 1344)
INSERT [dbo].[SeatBookings] ([SeatBookingId], [BookingId], [SeatId]) VALUES (1019, 1019, 1315)
INSERT [dbo].[SeatBookings] ([SeatBookingId], [BookingId], [SeatId]) VALUES (1018, 1019, 1316)
INSERT [dbo].[SeatBookings] ([SeatBookingId], [BookingId], [SeatId]) VALUES (1017, 1019, 1317)
INSERT [dbo].[SeatBookings] ([SeatBookingId], [BookingId], [SeatId]) VALUES (1021, 1020, 1340)
INSERT [dbo].[SeatBookings] ([SeatBookingId], [BookingId], [SeatId]) VALUES (1020, 1020, 1341)
INSERT [dbo].[SeatBookings] ([SeatBookingId], [BookingId], [SeatId]) VALUES (1022, 1021, 1295)
INSERT [dbo].[SeatBookings] ([SeatBookingId], [BookingId], [SeatId]) VALUES (1023, 1021, 1296)
SET IDENTITY_INSERT [dbo].[SeatBookings] OFF
GO
SET IDENTITY_INSERT [dbo].[Seats] ON 

INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1110, 1094, CAST(1000.00 AS Decimal(10, 2)), N'A1', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1111, 1094, CAST(1000.00 AS Decimal(10, 2)), N'A2', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1112, 1094, CAST(1000.00 AS Decimal(10, 2)), N'A3', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1113, 1094, CAST(1000.00 AS Decimal(10, 2)), N'A4', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1114, 1094, CAST(1000.00 AS Decimal(10, 2)), N'A5', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1115, 1094, CAST(1000.00 AS Decimal(10, 2)), N'B1', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1116, 1094, CAST(1000.00 AS Decimal(10, 2)), N'B2', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1117, 1094, CAST(1000.00 AS Decimal(10, 2)), N'B3', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1118, 1094, CAST(1000.00 AS Decimal(10, 2)), N'B4', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1119, 1094, CAST(1000.00 AS Decimal(10, 2)), N'B5', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1120, 1094, CAST(1000.00 AS Decimal(10, 2)), N'C1', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1121, 1094, CAST(1000.00 AS Decimal(10, 2)), N'C2', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1122, 1094, CAST(1000.00 AS Decimal(10, 2)), N'C3', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1123, 1094, CAST(1000.00 AS Decimal(10, 2)), N'C4', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1124, 1094, CAST(1000.00 AS Decimal(10, 2)), N'C5', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1125, 1094, CAST(1000.00 AS Decimal(10, 2)), N'D1', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1126, 1094, CAST(1000.00 AS Decimal(10, 2)), N'D2', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1127, 1094, CAST(1000.00 AS Decimal(10, 2)), N'D3', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1128, 1094, CAST(1000.00 AS Decimal(10, 2)), N'D4', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1129, 1094, CAST(1000.00 AS Decimal(10, 2)), N'D5', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1130, 1094, CAST(1000.00 AS Decimal(10, 2)), N'E1', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1131, 1094, CAST(1000.00 AS Decimal(10, 2)), N'E2', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1132, 1094, CAST(1000.00 AS Decimal(10, 2)), N'E3', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1133, 1094, CAST(1000.00 AS Decimal(10, 2)), N'E4', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1134, 1094, CAST(1000.00 AS Decimal(10, 2)), N'E5', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1135, 1095, CAST(2000.00 AS Decimal(10, 2)), N'A1', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1136, 1095, CAST(2000.00 AS Decimal(10, 2)), N'A2', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1137, 1095, CAST(2000.00 AS Decimal(10, 2)), N'A3', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1138, 1095, CAST(2000.00 AS Decimal(10, 2)), N'A4', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1139, 1095, CAST(2000.00 AS Decimal(10, 2)), N'A5', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1140, 1095, CAST(2000.00 AS Decimal(10, 2)), N'B1', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1141, 1095, CAST(2000.00 AS Decimal(10, 2)), N'B2', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1142, 1095, CAST(2000.00 AS Decimal(10, 2)), N'B3', 1)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1143, 1095, CAST(2000.00 AS Decimal(10, 2)), N'B4', 1)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1144, 1095, CAST(2000.00 AS Decimal(10, 2)), N'B5', 1)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1145, 1095, CAST(2000.00 AS Decimal(10, 2)), N'C1', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1146, 1095, CAST(2000.00 AS Decimal(10, 2)), N'C2', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1147, 1095, CAST(2000.00 AS Decimal(10, 2)), N'C3', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1148, 1095, CAST(2000.00 AS Decimal(10, 2)), N'C4', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1149, 1095, CAST(2000.00 AS Decimal(10, 2)), N'C5', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1150, 1095, CAST(2000.00 AS Decimal(10, 2)), N'D1', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1151, 1095, CAST(2000.00 AS Decimal(10, 2)), N'D2', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1152, 1095, CAST(2000.00 AS Decimal(10, 2)), N'D3', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1153, 1095, CAST(2000.00 AS Decimal(10, 2)), N'D4', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1154, 1095, CAST(2000.00 AS Decimal(10, 2)), N'D5', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1155, 1095, CAST(2000.00 AS Decimal(10, 2)), N'E1', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1156, 1095, CAST(2000.00 AS Decimal(10, 2)), N'E2', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1157, 1095, CAST(2000.00 AS Decimal(10, 2)), N'E3', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1158, 1095, CAST(2000.00 AS Decimal(10, 2)), N'E4', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1159, 1095, CAST(2000.00 AS Decimal(10, 2)), N'E5', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1160, 1096, CAST(1000.00 AS Decimal(10, 2)), N'A1', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1161, 1096, CAST(1000.00 AS Decimal(10, 2)), N'A2', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1162, 1096, CAST(1000.00 AS Decimal(10, 2)), N'A3', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1163, 1096, CAST(1000.00 AS Decimal(10, 2)), N'A4', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1164, 1096, CAST(1000.00 AS Decimal(10, 2)), N'A5', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1165, 1096, CAST(1000.00 AS Decimal(10, 2)), N'B1', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1166, 1096, CAST(1000.00 AS Decimal(10, 2)), N'B2', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1167, 1096, CAST(1000.00 AS Decimal(10, 2)), N'B3', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1168, 1096, CAST(1000.00 AS Decimal(10, 2)), N'B4', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1169, 1096, CAST(1000.00 AS Decimal(10, 2)), N'B5', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1170, 1096, CAST(1000.00 AS Decimal(10, 2)), N'C1', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1171, 1096, CAST(1000.00 AS Decimal(10, 2)), N'C2', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1172, 1096, CAST(1000.00 AS Decimal(10, 2)), N'C3', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1173, 1096, CAST(1000.00 AS Decimal(10, 2)), N'C4', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1174, 1096, CAST(1000.00 AS Decimal(10, 2)), N'C5', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1175, 1096, CAST(1000.00 AS Decimal(10, 2)), N'D1', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1176, 1096, CAST(1000.00 AS Decimal(10, 2)), N'D2', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1177, 1096, CAST(1000.00 AS Decimal(10, 2)), N'D3', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1178, 1096, CAST(1000.00 AS Decimal(10, 2)), N'D4', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1179, 1096, CAST(1000.00 AS Decimal(10, 2)), N'D5', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1180, 1096, CAST(1000.00 AS Decimal(10, 2)), N'E1', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1181, 1096, CAST(1000.00 AS Decimal(10, 2)), N'E2', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1182, 1096, CAST(1000.00 AS Decimal(10, 2)), N'E3', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1183, 1096, CAST(1000.00 AS Decimal(10, 2)), N'E4', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1184, 1096, CAST(1000.00 AS Decimal(10, 2)), N'E5', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1185, 1097, CAST(2000.00 AS Decimal(10, 2)), N'A1', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1186, 1097, CAST(2000.00 AS Decimal(10, 2)), N'A2', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1187, 1097, CAST(2000.00 AS Decimal(10, 2)), N'A3', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1188, 1097, CAST(2000.00 AS Decimal(10, 2)), N'A4', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1189, 1097, CAST(2000.00 AS Decimal(10, 2)), N'A5', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1190, 1097, CAST(2000.00 AS Decimal(10, 2)), N'B1', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1191, 1097, CAST(2000.00 AS Decimal(10, 2)), N'B2', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1192, 1097, CAST(2000.00 AS Decimal(10, 2)), N'B3', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1193, 1097, CAST(2000.00 AS Decimal(10, 2)), N'B4', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1194, 1097, CAST(2000.00 AS Decimal(10, 2)), N'B5', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1195, 1097, CAST(2000.00 AS Decimal(10, 2)), N'C1', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1196, 1097, CAST(2000.00 AS Decimal(10, 2)), N'C2', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1197, 1097, CAST(2000.00 AS Decimal(10, 2)), N'C3', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1198, 1097, CAST(2000.00 AS Decimal(10, 2)), N'C4', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1199, 1097, CAST(2000.00 AS Decimal(10, 2)), N'C5', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1200, 1097, CAST(2000.00 AS Decimal(10, 2)), N'D1', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1201, 1097, CAST(2000.00 AS Decimal(10, 2)), N'D2', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1202, 1097, CAST(2000.00 AS Decimal(10, 2)), N'D3', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1203, 1097, CAST(2000.00 AS Decimal(10, 2)), N'D4', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1204, 1097, CAST(2000.00 AS Decimal(10, 2)), N'D5', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1205, 1097, CAST(2000.00 AS Decimal(10, 2)), N'E1', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1206, 1097, CAST(2000.00 AS Decimal(10, 2)), N'E2', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1207, 1097, CAST(2000.00 AS Decimal(10, 2)), N'E3', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1208, 1097, CAST(2000.00 AS Decimal(10, 2)), N'E4', 0)
GO
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1209, 1097, CAST(2000.00 AS Decimal(10, 2)), N'E5', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1210, 1098, CAST(1000.00 AS Decimal(10, 2)), N'A1', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1211, 1098, CAST(1000.00 AS Decimal(10, 2)), N'A2', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1212, 1098, CAST(1000.00 AS Decimal(10, 2)), N'A3', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1213, 1098, CAST(1000.00 AS Decimal(10, 2)), N'A4', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1214, 1098, CAST(1000.00 AS Decimal(10, 2)), N'A5', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1215, 1098, CAST(1000.00 AS Decimal(10, 2)), N'B1', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1216, 1098, CAST(1000.00 AS Decimal(10, 2)), N'B2', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1217, 1098, CAST(1000.00 AS Decimal(10, 2)), N'B3', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1218, 1098, CAST(1000.00 AS Decimal(10, 2)), N'B4', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1219, 1098, CAST(1000.00 AS Decimal(10, 2)), N'B5', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1220, 1098, CAST(1000.00 AS Decimal(10, 2)), N'C1', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1221, 1098, CAST(1000.00 AS Decimal(10, 2)), N'C2', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1222, 1098, CAST(1000.00 AS Decimal(10, 2)), N'C3', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1223, 1098, CAST(1000.00 AS Decimal(10, 2)), N'C4', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1224, 1098, CAST(1000.00 AS Decimal(10, 2)), N'C5', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1225, 1098, CAST(1000.00 AS Decimal(10, 2)), N'D1', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1226, 1098, CAST(1000.00 AS Decimal(10, 2)), N'D2', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1227, 1098, CAST(1000.00 AS Decimal(10, 2)), N'D3', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1228, 1098, CAST(1000.00 AS Decimal(10, 2)), N'D4', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1229, 1098, CAST(1000.00 AS Decimal(10, 2)), N'D5', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1230, 1098, CAST(1000.00 AS Decimal(10, 2)), N'E1', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1231, 1098, CAST(1000.00 AS Decimal(10, 2)), N'E2', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1232, 1098, CAST(1000.00 AS Decimal(10, 2)), N'E3', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1233, 1098, CAST(1000.00 AS Decimal(10, 2)), N'E4', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1234, 1098, CAST(1000.00 AS Decimal(10, 2)), N'E5', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1235, 1099, CAST(3000.00 AS Decimal(10, 2)), N'A1', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1236, 1099, CAST(3000.00 AS Decimal(10, 2)), N'A2', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1237, 1099, CAST(3000.00 AS Decimal(10, 2)), N'A3', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1238, 1099, CAST(3000.00 AS Decimal(10, 2)), N'A4', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1239, 1099, CAST(3000.00 AS Decimal(10, 2)), N'A5', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1240, 1099, CAST(3000.00 AS Decimal(10, 2)), N'B1', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1241, 1099, CAST(3000.00 AS Decimal(10, 2)), N'B2', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1242, 1099, CAST(3000.00 AS Decimal(10, 2)), N'B3', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1243, 1099, CAST(3000.00 AS Decimal(10, 2)), N'B4', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1244, 1099, CAST(3000.00 AS Decimal(10, 2)), N'B5', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1245, 1099, CAST(3000.00 AS Decimal(10, 2)), N'C1', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1246, 1099, CAST(3000.00 AS Decimal(10, 2)), N'C2', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1247, 1099, CAST(3000.00 AS Decimal(10, 2)), N'C3', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1248, 1099, CAST(3000.00 AS Decimal(10, 2)), N'C4', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1249, 1099, CAST(3000.00 AS Decimal(10, 2)), N'C5', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1250, 1099, CAST(3000.00 AS Decimal(10, 2)), N'D1', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1251, 1099, CAST(3000.00 AS Decimal(10, 2)), N'D2', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1252, 1099, CAST(3000.00 AS Decimal(10, 2)), N'D3', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1253, 1099, CAST(3000.00 AS Decimal(10, 2)), N'D4', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1254, 1099, CAST(3000.00 AS Decimal(10, 2)), N'D5', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1255, 1099, CAST(3000.00 AS Decimal(10, 2)), N'E1', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1256, 1099, CAST(3000.00 AS Decimal(10, 2)), N'E2', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1257, 1099, CAST(3000.00 AS Decimal(10, 2)), N'E3', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1258, 1099, CAST(3000.00 AS Decimal(10, 2)), N'E4', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1259, 1099, CAST(3000.00 AS Decimal(10, 2)), N'E5', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1295, 1101, CAST(2000.00 AS Decimal(10, 2)), N'A1', 1)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1296, 1101, CAST(2000.00 AS Decimal(10, 2)), N'A2', 1)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1297, 1101, CAST(2000.00 AS Decimal(10, 2)), N'A3', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1298, 1101, CAST(2000.00 AS Decimal(10, 2)), N'A4', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1299, 1101, CAST(2000.00 AS Decimal(10, 2)), N'A5', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1300, 1101, CAST(2000.00 AS Decimal(10, 2)), N'B1', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1301, 1101, CAST(2000.00 AS Decimal(10, 2)), N'B2', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1302, 1101, CAST(2000.00 AS Decimal(10, 2)), N'B3', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1303, 1101, CAST(2000.00 AS Decimal(10, 2)), N'B4', 1)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1304, 1101, CAST(2000.00 AS Decimal(10, 2)), N'B5', 1)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1305, 1101, CAST(2000.00 AS Decimal(10, 2)), N'C1', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1306, 1101, CAST(2000.00 AS Decimal(10, 2)), N'C2', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1307, 1101, CAST(2000.00 AS Decimal(10, 2)), N'C3', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1308, 1101, CAST(2000.00 AS Decimal(10, 2)), N'C4', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1309, 1101, CAST(2000.00 AS Decimal(10, 2)), N'C5', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1310, 1101, CAST(2000.00 AS Decimal(10, 2)), N'D1', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1311, 1101, CAST(2000.00 AS Decimal(10, 2)), N'D2', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1312, 1101, CAST(2000.00 AS Decimal(10, 2)), N'D3', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1313, 1101, CAST(2000.00 AS Decimal(10, 2)), N'D4', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1314, 1101, CAST(2000.00 AS Decimal(10, 2)), N'D5', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1315, 1101, CAST(2000.00 AS Decimal(10, 2)), N'E1', 1)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1316, 1101, CAST(2000.00 AS Decimal(10, 2)), N'E2', 1)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1317, 1101, CAST(2000.00 AS Decimal(10, 2)), N'E3', 1)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1318, 1101, CAST(2000.00 AS Decimal(10, 2)), N'E4', 1)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1319, 1101, CAST(2000.00 AS Decimal(10, 2)), N'E5', 1)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1320, 1102, CAST(3000.00 AS Decimal(10, 2)), N'A1', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1321, 1102, CAST(3000.00 AS Decimal(10, 2)), N'A2', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1322, 1102, CAST(3000.00 AS Decimal(10, 2)), N'A3', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1323, 1102, CAST(3000.00 AS Decimal(10, 2)), N'A4', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1324, 1102, CAST(3000.00 AS Decimal(10, 2)), N'A5', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1325, 1102, CAST(3000.00 AS Decimal(10, 2)), N'B1', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1326, 1102, CAST(3000.00 AS Decimal(10, 2)), N'B2', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1327, 1102, CAST(3000.00 AS Decimal(10, 2)), N'B3', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1328, 1102, CAST(3000.00 AS Decimal(10, 2)), N'B4', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1329, 1102, CAST(3000.00 AS Decimal(10, 2)), N'B5', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1330, 1102, CAST(3000.00 AS Decimal(10, 2)), N'C1', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1331, 1102, CAST(3000.00 AS Decimal(10, 2)), N'C2', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1332, 1102, CAST(3000.00 AS Decimal(10, 2)), N'C3', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1333, 1102, CAST(3000.00 AS Decimal(10, 2)), N'C4', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1334, 1102, CAST(3000.00 AS Decimal(10, 2)), N'C5', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1335, 1102, CAST(3000.00 AS Decimal(10, 2)), N'D1', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1336, 1102, CAST(3000.00 AS Decimal(10, 2)), N'D2', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1337, 1102, CAST(3000.00 AS Decimal(10, 2)), N'D3', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1338, 1102, CAST(3000.00 AS Decimal(10, 2)), N'D4', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1339, 1102, CAST(3000.00 AS Decimal(10, 2)), N'D5', 0)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1340, 1102, CAST(3000.00 AS Decimal(10, 2)), N'E1', 1)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1341, 1102, CAST(3000.00 AS Decimal(10, 2)), N'E2', 1)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1342, 1102, CAST(3000.00 AS Decimal(10, 2)), N'E3', 1)
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1343, 1102, CAST(3000.00 AS Decimal(10, 2)), N'E4', 1)
GO
INSERT [dbo].[Seats] ([SeatID], [ShowTimeID], [Price], [SeatCode], [IsBooked]) VALUES (1344, 1102, CAST(3000.00 AS Decimal(10, 2)), N'E5', 1)
SET IDENTITY_INSERT [dbo].[Seats] OFF
GO
SET IDENTITY_INSERT [dbo].[ShopImages] ON 

INSERT [dbo].[ShopImages] ([ShopImageID], [ShopID], [ImageURL], [CreatedAt]) VALUES (41, 2, N'huda beauty.jpg', CAST(N'2024-10-03T20:47:44.977' AS DateTime))
INSERT [dbo].[ShopImages] ([ShopImageID], [ShopID], [ImageURL], [CreatedAt]) VALUES (42, 2, N'hudabeauty 2.jpg', CAST(N'2024-10-03T20:47:44.977' AS DateTime))
INSERT [dbo].[ShopImages] ([ShopImageID], [ShopID], [ImageURL], [CreatedAt]) VALUES (43, 3, N'iphone 1.jpg', CAST(N'2024-10-03T20:57:17.417' AS DateTime))
INSERT [dbo].[ShopImages] ([ShopImageID], [ShopID], [ImageURL], [CreatedAt]) VALUES (44, 3, N'iphone 2.jpg', CAST(N'2024-10-03T20:57:17.417' AS DateTime))
INSERT [dbo].[ShopImages] ([ShopImageID], [ShopID], [ImageURL], [CreatedAt]) VALUES (45, 1, N'maybelline 1.jpg', CAST(N'2024-10-03T20:57:40.040' AS DateTime))
INSERT [dbo].[ShopImages] ([ShopImageID], [ShopID], [ImageURL], [CreatedAt]) VALUES (46, 1, N'maybelline 2.jpg', CAST(N'2024-10-03T20:57:40.040' AS DateTime))
INSERT [dbo].[ShopImages] ([ShopImageID], [ShopID], [ImageURL], [CreatedAt]) VALUES (47, 4, N'samsung 2.jpg', CAST(N'2024-10-03T21:00:19.447' AS DateTime))
INSERT [dbo].[ShopImages] ([ShopImageID], [ShopID], [ImageURL], [CreatedAt]) VALUES (48, 4, N'samsung.jpg', CAST(N'2024-10-03T21:00:19.447' AS DateTime))
INSERT [dbo].[ShopImages] ([ShopImageID], [ShopID], [ImageURL], [CreatedAt]) VALUES (49, 5, N'Maria B 2.jpg', CAST(N'2024-10-03T21:03:10.840' AS DateTime))
INSERT [dbo].[ShopImages] ([ShopImageID], [ShopID], [ImageURL], [CreatedAt]) VALUES (50, 5, N'Maria B.jpg', CAST(N'2024-10-03T21:03:10.843' AS DateTime))
INSERT [dbo].[ShopImages] ([ShopImageID], [ShopID], [ImageURL], [CreatedAt]) VALUES (51, 6, N'Gul Ahmed 1.jpg', CAST(N'2024-10-03T21:10:38.287' AS DateTime))
INSERT [dbo].[ShopImages] ([ShopImageID], [ShopID], [ImageURL], [CreatedAt]) VALUES (52, 6, N'Gul Ahmed.jpg', CAST(N'2024-10-03T21:10:38.287' AS DateTime))
INSERT [dbo].[ShopImages] ([ShopImageID], [ShopID], [ImageURL], [CreatedAt]) VALUES (53, 7, N'Havenly Decor 1.jpg', CAST(N'2024-10-03T21:14:15.033' AS DateTime))
INSERT [dbo].[ShopImages] ([ShopImageID], [ShopID], [ImageURL], [CreatedAt]) VALUES (54, 7, N'Havenly Decor.jpg', CAST(N'2024-10-03T21:14:15.040' AS DateTime))
SET IDENTITY_INSERT [dbo].[ShopImages] OFF
GO
SET IDENTITY_INSERT [dbo].[Shops] ON 

INSERT [dbo].[Shops] ([ShopID], [ShopName], [CategoryID], [FloorID], [ImageURL], [CreatedAt], [UpdatedAt], [Description], [Location], [Phone], [Email], [StoreHours]) VALUES (1, N'Maybelline', 1, 2, N'maybelline card.jpg', CAST(N'2024-09-28T19:19:26.070' AS DateTime), CAST(N'2024-09-28T19:19:26.070' AS DateTime), N'Step into the vibrant world of beauty at Maybelline Shop, your ultimate destination for all things makeup. Our store is a haven for beauty enthusiasts, offering an extensive range of high-quality products to help you express your unique style. From iconic foundations and bold lip colors to stunning eyeshadows and professional-grade mascaras, we have everything you need to create your perfect look.  At Maybelline Shop, we pride ourselves on providing personalized service, ensuring you find the right products tailored to your skin type and preferences. Our knowledgeable beauty advisors are here to guide you through our collection and offer tips and tricks to enhance your beauty routine.', N'Main Entrance, Block A', N'123-456-7890', N'info@electroworld.com', N'Mon-Fri: 10 AM - 9 PM')
INSERT [dbo].[Shops] ([ShopID], [ShopName], [CategoryID], [FloorID], [ImageURL], [CreatedAt], [UpdatedAt], [Description], [Location], [Phone], [Email], [StoreHours]) VALUES (2, N'Huda Beauty', 1, 3, N'hudabeauty card.jpg', CAST(N'2024-09-28T19:25:05.093' AS DateTime), CAST(N'2024-09-28T19:25:05.093' AS DateTime), N'Step into the luxurious world of Huda Beauty, where beauty knows no bounds. Our shop is a celebration of empowerment, individuality, and the art of makeup, inspired by the vision of beauty mogul Huda Kattan. Here, we offer an extensive range of high-performance cosmetics designed to enhance your natural beauty and help you express yourself confidently.  Explore our iconic collection of products, featuring everything from stunning eyeshadow palettes and full-coverage foundations to luscious lipsticks and game-changing skincare. Each product is crafted with precision and love, using high-quality ingredients that deliver professional results while being accessible to everyone.', N'Main Entrance, Block A', N'123-456-7890', N'info@electroworld.com', N'Mon-Fri: 10 AM - 9 PM')
INSERT [dbo].[Shops] ([ShopID], [ShopName], [CategoryID], [FloorID], [ImageURL], [CreatedAt], [UpdatedAt], [Description], [Location], [Phone], [Email], [StoreHours]) VALUES (3, N'IPhone', 2, 3, N'iphone card.jpg', CAST(N'2024-09-28T19:59:01.970' AS DateTime), CAST(N'2024-09-28T19:59:01.970' AS DateTime), N'Discover the future of technology at our iPhone shop, your premier destination for all things Apple. Here, we celebrate innovation, style, and functionality, offering the latest iPhone models designed to elevate your digital lifestyle. Whether you’re a tech enthusiast, a creative professional, or someone who loves to stay connected, we have the perfect device for you.  Explore our extensive collection of the latest iPhone models, featuring cutting-edge technology, stunning designs, and advanced features that redefine what a smartphone can do. From crystal-clear displays and powerful cameras to impressive battery life and seamless performance, each iPhone is crafted to enhance your everyday experiences.', N'Main Entrance, Block A', N'123-456-7890', N'info@electroworld.com', N'Mon-Fri: 10 AM - 9 PM')
INSERT [dbo].[Shops] ([ShopID], [ShopName], [CategoryID], [FloorID], [ImageURL], [CreatedAt], [UpdatedAt], [Description], [Location], [Phone], [Email], [StoreHours]) VALUES (4, N'Samsung ', 2, 3, N'samsung card.jpg', CAST(N'2024-09-28T20:12:32.720' AS DateTime), CAST(N'2024-09-28T20:12:32.720' AS DateTime), N'Step into the world of innovation and style at our Samsung shop, your ultimate destination for cutting-edge technology and premium electronics. From smartphones to home appliances, we offer an extensive range of Samsung products designed to enhance your everyday life and keep you connected.  Explore our collection of the latest Samsung smartphones, featuring stunning displays, powerful processors, and advanced camera systems that capture your best moments in vivid detail. Whether you''re looking for the flagship Galaxy series or a reliable budget option, our knowledgeable team is here to help you find the perfect device tailored to your needs.', N'Main Entrance, Block A', N'123-456-7890', N'info@electroworld.com', N'Mon-Fri: 10 AM - 9 PM')
INSERT [dbo].[Shops] ([ShopID], [ShopName], [CategoryID], [FloorID], [ImageURL], [CreatedAt], [UpdatedAt], [Description], [Location], [Phone], [Email], [StoreHours]) VALUES (5, N'Maria B', 3, 3, N'maria b card.jpg', CAST(N'2024-09-28T20:49:10.343' AS DateTime), CAST(N'2024-09-28T20:49:10.343' AS DateTime), N'Step into the exquisite world of Maria B, where tradition meets contemporary fashion. Our shop is a celebration of elegance, sophistication, and cultural heritage, offering a stunning collection of women''s clothing that embodies timeless beauty and style.  Discover our diverse range of apparel, from luxurious ready-to-wear outfits to intricately designed formal wear, all crafted with the finest fabrics and attention to detail. Whether you’re looking for stunning ethnic wear, chic western outfits, or vibrant unstitched fabrics, Maria B has something special for every occasion.', N'Main Entrance, Block A', N'123-456-7890', N'info@electroworld.com', N'Mon-Fri: 10 AM - 9 PM')
INSERT [dbo].[Shops] ([ShopID], [ShopName], [CategoryID], [FloorID], [ImageURL], [CreatedAt], [UpdatedAt], [Description], [Location], [Phone], [Email], [StoreHours]) VALUES (6, N'Gul Ahmed', 3, 2, N'Gul Ahmed card.jpg', CAST(N'2024-09-28T20:50:47.280' AS DateTime), CAST(N'2024-09-28T20:50:47.280' AS DateTime), N'Step into the world of elegance and tradition at Gul Ahmed, your premier destination for high-quality textiles and fashion. Renowned for our rich heritage and innovative designs, we offer an extensive collection of fabrics, ready-to-wear clothing, and home textiles that embody sophistication and style.  Explore our diverse range of products, featuring luxurious lawn, vibrant cottons, and intricate silk fabrics that are perfect for every occasion. Whether you’re seeking timeless ethnic wear or contemporary designs, Gul Ahmed has something to suit every taste and preference.', N'Main Entrance, Block A', N'123-456-7890', N'info@electroworld.com', N'Mon-Fri: 10 AM - 9 PM')
INSERT [dbo].[Shops] ([ShopID], [ShopName], [CategoryID], [FloorID], [ImageURL], [CreatedAt], [UpdatedAt], [Description], [Location], [Phone], [Email], [StoreHours]) VALUES (7, N'Havenly Decor', 4, 2, N'Havenly Decor card.jpg', CAST(N'2024-09-28T22:43:19.760' AS DateTime), CAST(N'2024-09-28T22:43:19.760' AS DateTime), N'Transform your living space into a haven of style and comfort with our exquisite collection of home decor. Our shop is dedicated to helping you create a beautiful and inviting atmosphere that reflects your unique personality and taste. Whether you''re looking for modern elegance, rustic charm, or timeless classics, we have something to suit every home.  Explore our wide range of products, including stunning wall art, elegant furniture, cozy textiles, and eye-catching decorative accessories. Each piece is carefully curated to inspire creativity and enhance the aesthetic of your home. From statement pieces that command attention to subtle accents that add warmth, our selection caters to every design preference.', N'Main Entrance, Block A', N'123-456-7890', N'info@electroworld.com', N'Mon-Fri: 10 AM - 9 PM')
SET IDENTITY_INSERT [dbo].[Shops] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [Username], [Email], [Password], [FirstName], [LastName], [Userimg]) VALUES (1, N'fatima', N'mail@gmail.com', N'1234', N'fatimagg', N'hbnmjghm', N'download-removebg-preview (12).png')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
/****** Object:  Index [UQ__SeatBook__50846BD330EFE4BF]    Script Date: 11/17/2024 8:14:55 PM ******/
ALTER TABLE [dbo].[SeatBookings] ADD UNIQUE NONCLUSTERED 
(
	[BookingId] ASC,
	[SeatId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__SeatBook__50846BD3DA2AEF5F]    Script Date: 11/17/2024 8:14:55 PM ******/
ALTER TABLE [dbo].[SeatBookings] ADD UNIQUE NONCLUSTERED 
(
	[BookingId] ASC,
	[SeatId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__A9D1053481C2FF79]    Script Date: 11/17/2024 8:14:55 PM ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__A9D1053491AB506C]    Script Date: 11/17/2024 8:14:55 PM ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Admins] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Admins] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [dbo].[Categories] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Categories] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [dbo].[Dishes] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Dishes] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [dbo].[Feedback] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Floors] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Floors] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [dbo].[FoodCourtImages] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[FoodCourtShops] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[FoodCourtShops] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [dbo].[Gallery] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[MovieShowtimes] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[MovieShowtimes] ADD  DEFAULT (getdate()) FOR [UpdatedDate]
GO
ALTER TABLE [dbo].[Roles] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Seats] ADD  DEFAULT ((0.00)) FOR [Price]
GO
ALTER TABLE [dbo].[Seats] ADD  DEFAULT ((0)) FOR [IsBooked]
GO
ALTER TABLE [dbo].[ShopImages] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Shops] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Shops] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [dbo].[Admins]  WITH CHECK ADD FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([RoleID])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD FOREIGN KEY([MovieId])
REFERENCES [dbo].[Movies] ([MovieId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD FOREIGN KEY([ShowtimeId])
REFERENCES [dbo].[MovieShowtimes] ([ShowtimeId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Dishes]  WITH CHECK ADD FOREIGN KEY([FoodCourtShopID])
REFERENCES [dbo].[FoodCourtShops] ([FoodCourtShopID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FoodCourtImages]  WITH CHECK ADD FOREIGN KEY([FoodCourtShopID])
REFERENCES [dbo].[FoodCourtShops] ([FoodCourtShopID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FoodCourtShops]  WITH CHECK ADD FOREIGN KEY([FloorID])
REFERENCES [dbo].[Floors] ([FloorID])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[FoodCourtShops]  WITH CHECK ADD  CONSTRAINT [FK_FoodCourtShops_FoodCategory] FOREIGN KEY([FoodCategoryID])
REFERENCES [dbo].[FoodCategory] ([FoodCategoryID])
GO
ALTER TABLE [dbo].[FoodCourtShops] CHECK CONSTRAINT [FK_FoodCourtShops_FoodCategory]
GO
ALTER TABLE [dbo].[MovieShowtimes]  WITH CHECK ADD FOREIGN KEY([MovieId])
REFERENCES [dbo].[Movies] ([MovieId])
GO
ALTER TABLE [dbo].[MovieShowtimes]  WITH CHECK ADD FOREIGN KEY([MovieId])
REFERENCES [dbo].[Movies] ([MovieId])
GO
ALTER TABLE [dbo].[SeatBookings]  WITH CHECK ADD FOREIGN KEY([BookingId])
REFERENCES [dbo].[Bookings] ([BookingId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SeatBookings]  WITH CHECK ADD FOREIGN KEY([SeatId])
REFERENCES [dbo].[Seats] ([SeatID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Seats]  WITH CHECK ADD FOREIGN KEY([ShowTimeID])
REFERENCES [dbo].[MovieShowtimes] ([ShowtimeId])
GO
ALTER TABLE [dbo].[Seats]  WITH CHECK ADD FOREIGN KEY([ShowTimeID])
REFERENCES [dbo].[MovieShowtimes] ([ShowtimeId])
GO
ALTER TABLE [dbo].[ShopImages]  WITH CHECK ADD FOREIGN KEY([ShopID])
REFERENCES [dbo].[Shops] ([ShopID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Shops]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Shops]  WITH CHECK ADD FOREIGN KEY([FloorID])
REFERENCES [dbo].[Floors] ([FloorID])
ON DELETE SET NULL
GO
USE [master]
GO
ALTER DATABASE [ABCD_Mall] SET  READ_WRITE 
GO

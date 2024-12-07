USE [master]
GO
/****** Object:  Database [bus_server_prod]    Script Date: 12/7/2024 10:29:42 PM ******/
CREATE DATABASE [bus_server_prod]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'bus_server_prod', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\bus_server_prod.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'bus_server_prod_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\bus_server_prod_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [bus_server_prod] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [bus_server_prod].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [bus_server_prod] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [bus_server_prod] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [bus_server_prod] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [bus_server_prod] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [bus_server_prod] SET ARITHABORT OFF 
GO
ALTER DATABASE [bus_server_prod] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [bus_server_prod] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [bus_server_prod] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [bus_server_prod] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [bus_server_prod] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [bus_server_prod] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [bus_server_prod] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [bus_server_prod] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [bus_server_prod] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [bus_server_prod] SET  ENABLE_BROKER 
GO
ALTER DATABASE [bus_server_prod] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [bus_server_prod] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [bus_server_prod] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [bus_server_prod] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [bus_server_prod] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [bus_server_prod] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [bus_server_prod] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [bus_server_prod] SET RECOVERY FULL 
GO
ALTER DATABASE [bus_server_prod] SET  MULTI_USER 
GO
ALTER DATABASE [bus_server_prod] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [bus_server_prod] SET DB_CHAINING OFF 
GO
ALTER DATABASE [bus_server_prod] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [bus_server_prod] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [bus_server_prod] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [bus_server_prod] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'bus_server_prod', N'ON'
GO
ALTER DATABASE [bus_server_prod] SET QUERY_STORE = ON
GO
ALTER DATABASE [bus_server_prod] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [bus_server_prod]
GO
/****** Object:  Table [dbo].[Buses]    Script Date: 12/7/2024 10:29:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Buses](
	[LicensePlate] [varchar](20) NOT NULL,
	[NumberOfSeat] [int] NOT NULL,
	[NumberOfSeatLeft] [int] NOT NULL,
	[DriverId] [int] NULL,
	[BusStatusId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[LicensePlate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BusStatus]    Script Date: 12/7/2024 10:29:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BusStatus](
	[BusStatusId] [int] NOT NULL,
	[BusStatusName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BusStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ticket]    Script Date: 12/7/2024 10:29:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ticket](
	[TicketId] [int] NOT NULL,
	[UserId] [int] NULL,
	[NumberOfTicket] [int] NULL,
	[TypeOfTicket] [int] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK__Ticket__712CC607B2F28ED6] PRIMARY KEY CLUSTERED 
(
	[TicketId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TicketType]    Script Date: 12/7/2024 10:29:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TicketType](
	[TicketTypeId] [int] NOT NULL,
	[TicketTypeName] [varchar](100) NULL,
	[StandardTicketPrice] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[TicketTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Trips]    Script Date: 12/7/2024 10:29:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trips](
	[TripId] [int] NOT NULL,
	[TripName] [nvarchar](100) NOT NULL,
	[DepartLocation] [nvarchar](100) NOT NULL,
	[ArriveLocation] [nvarchar](100) NOT NULL,
	[DepartTime] [smalldatetime] NOT NULL,
	[TripStatusId] [int] NOT NULL,
	[BusLicensePlate] [varchar](20) NOT NULL,
	[TripPrice] [decimal](19, 0) NULL,
 CONSTRAINT [PK__Trips__51DC713E94512816] PRIMARY KEY CLUSTERED 
(
	[TripId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TripStatus]    Script Date: 12/7/2024 10:29:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TripStatus](
	[TripStatusId] [int] NOT NULL,
	[TripStatusName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TripStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRoles]    Script Date: 12/7/2024 10:29:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoles](
	[UserRoleId] [int] NOT NULL,
	[UserRoleName] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserRoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 12/7/2024 10:29:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[UserPwd] [varchar](50) NOT NULL,
	[UserFullName] [nvarchar](100) NULL,
	[UserEmail] [varchar](50) NULL,
	[UserRoleId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Buses] ([LicensePlate], [NumberOfSeat], [NumberOfSeatLeft], [DriverId], [BusStatusId]) VALUES (N'ABC-123', 30, 10, 121, 1)
INSERT [dbo].[Buses] ([LicensePlate], [NumberOfSeat], [NumberOfSeatLeft], [DriverId], [BusStatusId]) VALUES (N'ABD-234', 30, 15, 130, 1)
INSERT [dbo].[Buses] ([LicensePlate], [NumberOfSeat], [NumberOfSeatLeft], [DriverId], [BusStatusId]) VALUES (N'ACD-145', 30, 0, 150, 0)
INSERT [dbo].[Buses] ([LicensePlate], [NumberOfSeat], [NumberOfSeatLeft], [DriverId], [BusStatusId]) VALUES (N'BCD-134', 30, 30, 145, 1)
INSERT [dbo].[Buses] ([LicensePlate], [NumberOfSeat], [NumberOfSeatLeft], [DriverId], [BusStatusId]) VALUES (N'BCE-456', 30, 20, 135, 1)
GO
INSERT [dbo].[BusStatus] ([BusStatusId], [BusStatusName]) VALUES (0, N'NotAvailable')
INSERT [dbo].[BusStatus] ([BusStatusId], [BusStatusName]) VALUES (1, N'Available')
GO
INSERT [dbo].[Trips] ([TripId], [TripName], [DepartLocation], [ArriveLocation], [DepartTime], [TripStatusId], [BusLicensePlate], [TripPrice]) VALUES (1, N'Hà Nội - TP.HCM', N'Hà Nội', N'TP.HCM', CAST(N'2024-12-18T17:00:00' AS SmallDateTime), 0, N'ABC-123', CAST(500000 AS Decimal(19, 0)))
INSERT [dbo].[Trips] ([TripId], [TripName], [DepartLocation], [ArriveLocation], [DepartTime], [TripStatusId], [BusLicensePlate], [TripPrice]) VALUES (2, N'Hà Nội - TP.HCM', N'Hà Nội', N'TP.HCM', CAST(N'2024-12-20T19:00:00' AS SmallDateTime), 1, N'ACD-145', CAST(500000 AS Decimal(19, 0)))
INSERT [dbo].[Trips] ([TripId], [TripName], [DepartLocation], [ArriveLocation], [DepartTime], [TripStatusId], [BusLicensePlate], [TripPrice]) VALUES (3, N'TP.HCM - Hà Nội', N'TP.HCM', N'Hà Nội', CAST(N'2024-12-24T20:00:00' AS SmallDateTime), 1, N'BCD-134', CAST(500000 AS Decimal(19, 0)))
INSERT [dbo].[Trips] ([TripId], [TripName], [DepartLocation], [ArriveLocation], [DepartTime], [TripStatusId], [BusLicensePlate], [TripPrice]) VALUES (4, N'TP.HCM - Cần Thơ', N'TP.HCM', N'Cần Thơ', CAST(N'2024-12-19T18:00:00' AS SmallDateTime), 1, N'ABD-234', CAST(150000 AS Decimal(19, 0)))
INSERT [dbo].[Trips] ([TripId], [TripName], [DepartLocation], [ArriveLocation], [DepartTime], [TripStatusId], [BusLicensePlate], [TripPrice]) VALUES (5, N'Cần Thơ - TP.HCM', N'Cần Thơ', N'TP.HCM', CAST(N'2024-12-20T22:00:00' AS SmallDateTime), 1, N'ABD-234', CAST(150000 AS Decimal(19, 0)))
INSERT [dbo].[Trips] ([TripId], [TripName], [DepartLocation], [ArriveLocation], [DepartTime], [TripStatusId], [BusLicensePlate], [TripPrice]) VALUES (6, N'Đà Nẵng - Hà Nội', N'Đà Nẵng', N'Hà Nội', CAST(N'2024-12-22T19:00:00' AS SmallDateTime), 1, N'BCE-456', CAST(300000 AS Decimal(19, 0)))
INSERT [dbo].[Trips] ([TripId], [TripName], [DepartLocation], [ArriveLocation], [DepartTime], [TripStatusId], [BusLicensePlate], [TripPrice]) VALUES (7, N'Hà Nội - Đà Nẵng', N'Hà Nội', N'Đà Nẵng', CAST(N'2024-12-24T20:00:00' AS SmallDateTime), 1, N'BCE-456', CAST(300000 AS Decimal(19, 0)))
INSERT [dbo].[Trips] ([TripId], [TripName], [DepartLocation], [ArriveLocation], [DepartTime], [TripStatusId], [BusLicensePlate], [TripPrice]) VALUES (8, N'Đà Nẵng - Huế', N'Đà Nẵng', N'Huế', CAST(N'2024-12-26T17:00:00' AS SmallDateTime), 1, N'BCE-456', CAST(150000 AS Decimal(19, 0)))
INSERT [dbo].[Trips] ([TripId], [TripName], [DepartLocation], [ArriveLocation], [DepartTime], [TripStatusId], [BusLicensePlate], [TripPrice]) VALUES (9, N'Huế - Đà Nẵng', N'Huế', N'Đà Nẵng', CAST(N'2024-12-27T21:00:00' AS SmallDateTime), 1, N'BCE-456', CAST(150000 AS Decimal(19, 0)))
INSERT [dbo].[Trips] ([TripId], [TripName], [DepartLocation], [ArriveLocation], [DepartTime], [TripStatusId], [BusLicensePlate], [TripPrice]) VALUES (10, N'Hà Nội - TP.HCM', N'Hà Nội', N'TP.HCM', CAST(N'2024-12-18T19:00:00' AS SmallDateTime), 1, N'BCD-134', CAST(500000 AS Decimal(19, 0)))
GO
INSERT [dbo].[TripStatus] ([TripStatusId], [TripStatusName]) VALUES (0, N'NotAvailable')
INSERT [dbo].[TripStatus] ([TripStatusId], [TripStatusName]) VALUES (1, N'Available')
GO
INSERT [dbo].[UserRoles] ([UserRoleId], [UserRoleName]) VALUES (1, N'Customer')
INSERT [dbo].[UserRoles] ([UserRoleId], [UserRoleName]) VALUES (2, N'VipCustomer')
INSERT [dbo].[UserRoles] ([UserRoleId], [UserRoleName]) VALUES (3, N'Driver')
INSERT [dbo].[UserRoles] ([UserRoleId], [UserRoleName]) VALUES (4, N'Admin')
GO
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (1, N'CustomerUsr1', N'CustomerPwd1', N'CustomerName1', N'CustomerGmail1@gmail.com', 1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (2, N'CustomerUsr2', N'CustomerPwd2', N'CustomerName2', N'CustomerGmail2@gmail.com', 1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (3, N'CustomerUsr3', N'CustomerPwd3', N'CustomerName3', N'CustomerGmail3@gmail.com', 1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (4, N'CustomerUsr4', N'CustomerPwd4', N'CustomerName4', N'CustomerGmail4@gmail.com', 1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (5, N'CustomerUsr5', N'CustomerPwd5', N'CustomerName5', N'CustomerGmail5@gmail.com', 1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (6, N'CustomerUsr6', N'CustomerPwd6', N'CustomerName6', N'CustomerGmail6@gmail.com', 1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (7, N'CustomerUsr7', N'CustomerPwd7', N'CustomerName7', N'CustomerGmail7@gmail.com', 1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (8, N'CustomerUsr8', N'CustomerPwd8', N'CustomerName8', N'CustomerGmail8@gmail.com', 1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (9, N'CustomerUsr9', N'CustomerPwd9', N'CustomerName9', N'CustomerGmail9@gmail.com', 1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (10, N'CustomerUsr10', N'CustomerPwd10', N'CustomerName10', N'CustomerGmail10@gmail.com', 1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (11, N'CustomerUsr11', N'CustomerPwd11', N'CustomerName11', N'CustomerGmail11@gmail.com', 1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (12, N'CustomerUsr12', N'CustomerPwd12', N'CustomerName12', N'CustomerGmail12@gmail.com', 1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (13, N'CustomerUsr13', N'CustomerPwd13', N'CustomerName13', N'CustomerGmail13@gmail.com', 1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (14, N'CustomerUsr14', N'CustomerPwd14', N'CustomerName14', N'CustomerGmail14@gmail.com', 1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (15, N'CustomerUsr15', N'CustomerPwd15', N'CustomerName15', N'CustomerGmail15@gmail.com', 1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (16, N'CustomerUsr16', N'CustomerPwd16', N'CustomerName16', N'CustomerGmail16@gmail.com', 1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (17, N'CustomerUsr17', N'CustomerPwd17', N'CustomerName17', N'CustomerGmail17@gmail.com', 1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (18, N'CustomerUsr18', N'CustomerPwd18', N'CustomerName18', N'CustomerGmail18@gmail.com', 1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (19, N'CustomerUsr19', N'CustomerPwd19', N'CustomerName19', N'CustomerGmail19@gmail.com', 1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (20, N'CustomerUsr20', N'CustomerPwd20', N'CustomerName20', N'CustomerGmail20@gmail.com', 1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (21, N'CustomerUsr21', N'CustomerPwd21', N'CustomerName21', N'CustomerGmail21@gmail.com', 1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (22, N'CustomerUsr22', N'CustomerPwd22', N'CustomerName22', N'CustomerGmail22@gmail.com', 1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (23, N'CustomerUsr23', N'CustomerPwd23', N'CustomerName23', N'CustomerGmail23@gmail.com', 1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (24, N'CustomerUsr24', N'CustomerPwd24', N'CustomerName24', N'CustomerGmail24@gmail.com', 1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (25, N'CustomerUsr25', N'CustomerPwd25', N'CustomerName25', N'CustomerGmail25@gmail.com', 1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (26, N'CustomerUsr26', N'CustomerPwd26', N'CustomerName26', N'CustomerGmail26@gmail.com', 1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (27, N'CustomerUsr27', N'CustomerPwd27', N'CustomerName27', N'CustomerGmail27@gmail.com', 1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (28, N'CustomerUsr28', N'CustomerPwd28', N'CustomerName28', N'CustomerGmail28@gmail.com', 1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (29, N'CustomerUsr29', N'CustomerPwd29', N'CustomerName29', N'CustomerGmail29@gmail.com', 1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (30, N'CustomerUsr30', N'CustomerPwd30', N'CustomerName30', N'CustomerGmail30@gmail.com', 1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (31, N'CustomerUsr31', N'CustomerPwd31', N'CustomerName31', N'CustomerGmail31@gmail.com', 1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (32, N'CustomerUsr32', N'CustomerPwd32', N'CustomerName32', N'CustomerGmail32@gmail.com', 1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (33, N'CustomerUsr33', N'CustomerPwd33', N'CustomerName33', N'CustomerGmail33@gmail.com', 1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (34, N'CustomerUsr34', N'CustomerPwd34', N'CustomerName34', N'CustomerGmail34@gmail.com', 1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (35, N'CustomerUsr35', N'CustomerPwd35', N'CustomerName35', N'CustomerGmail35@gmail.com', 1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (36, N'CustomerUsr36', N'CustomerPwd36', N'CustomerName36', N'CustomerGmail36@gmail.com', 1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (37, N'CustomerUsr37', N'CustomerPwd37', N'CustomerName37', N'CustomerGmail37@gmail.com', 1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (38, N'CustomerUsr38', N'CustomerPwd38', N'CustomerName38', N'CustomerGmail38@gmail.com', 1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (39, N'CustomerUsr39', N'CustomerPwd39', N'CustomerName39', N'CustomerGmail39@gmail.com', 1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (40, N'CustomerUsr40', N'CustomerPwd40', N'CustomerName40', N'CustomerGmail40@gmail.com', 1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (41, N'CustomerUsr41', N'CustomerPwd41', N'CustomerName41', N'CustomerGmail41@gmail.com', 1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (42, N'CustomerUsr42', N'CustomerPwd42', N'CustomerName42', N'CustomerGmail42@gmail.com', 1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (43, N'CustomerUsr43', N'CustomerPwd43', N'CustomerName43', N'CustomerGmail43@gmail.com', 1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (44, N'CustomerUsr44', N'CustomerPwd44', N'CustomerName44', N'CustomerGmail44@gmail.com', 1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (45, N'CustomerUsr45', N'CustomerPwd45', N'CustomerName45', N'CustomerGmail45@gmail.com', 1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (46, N'CustomerUsr46', N'CustomerPwd46', N'CustomerName46', N'CustomerGmail46@gmail.com', 1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (47, N'CustomerUsr47', N'CustomerPwd47', N'CustomerName47', N'CustomerGmail47@gmail.com', 1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (48, N'CustomerUsr48', N'CustomerPwd48', N'CustomerName48', N'CustomerGmail48@gmail.com', 1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (49, N'CustomerUsr49', N'CustomerPwd49', N'CustomerName49', N'CustomerGmail49@gmail.com', 1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (50, N'CustomerUsr50', N'CustomerPwd50', N'CustomerName50', N'CustomerGmail50@gmail.com', 1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (51, N'CustomerUsr51', N'CustomerPwd51', N'CustomerName51', N'CustomerGmail51@gmail.com', 1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (52, N'CustomerUsr52', N'CustomerPwd52', N'CustomerName52', N'CustomerGmail52@gmail.com', 1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (53, N'CustomerUsr53', N'CustomerPwd53', N'CustomerName53', N'CustomerGmail53@gmail.com', 1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (54, N'CustomerUsr54', N'CustomerPwd54', N'CustomerName54', N'CustomerGmail54@gmail.com', 1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (55, N'CustomerUsr55', N'CustomerPwd55', N'CustomerName55', N'CustomerGmail55@gmail.com', 1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (56, N'CustomerUsr56', N'CustomerPwd56', N'CustomerName56', N'CustomerGmail56@gmail.com', 1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (57, N'CustomerUsr57', N'CustomerPwd57', N'CustomerName57', N'CustomerGmail57@gmail.com', 1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (58, N'CustomerUsr58', N'CustomerPwd58', N'CustomerName58', N'CustomerGmail58@gmail.com', 1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (59, N'CustomerUsr59', N'CustomerPwd59', N'CustomerName59', N'CustomerGmail59@gmail.com', 1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (60, N'CustomerUsr60', N'CustomerPwd60', N'CustomerName60', N'CustomerGmail60@gmail.com', 1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (61, N'CustomerUsr61', N'CustomerPwd61', N'CustomerName61', N'CustomerGmail61@gmail.com', 1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (62, N'CustomerUsr62', N'CustomerPwd62', N'CustomerName62', N'CustomerGmail62@gmail.com', 1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (63, N'CustomerUsr63', N'CustomerPwd63', N'CustomerName63', N'CustomerGmail63@gmail.com', 1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (64, N'CustomerUsr64', N'CustomerPwd64', N'CustomerName64', N'CustomerGmail64@gmail.com', 1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (65, N'CustomerUsr65', N'CustomerPwd65', N'CustomerName65', N'CustomerGmail65@gmail.com', 1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (66, N'CustomerUsr66', N'CustomerPwd66', N'CustomerName66', N'CustomerGmail66@gmail.com', 1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (67, N'CustomerUsr67', N'CustomerPwd67', N'CustomerName67', N'CustomerGmail67@gmail.com', 1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (68, N'CustomerUsr68', N'CustomerPwd68', N'CustomerName68', N'CustomerGmail68@gmail.com', 1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (69, N'CustomerUsr69', N'CustomerPwd69', N'CustomerName69', N'CustomerGmail69@gmail.com', 1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (70, N'CustomerUsr70', N'CustomerPwd70', N'CustomerName70', N'CustomerGmail70@gmail.com', 1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (71, N'CustomerUsr71', N'CustomerPwd71', N'CustomerName71', N'CustomerGmail71@gmail.com', 1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (72, N'CustomerUsr72', N'CustomerPwd72', N'CustomerName72', N'CustomerGmail72@gmail.com', 1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (73, N'CustomerUsr73', N'CustomerPwd73', N'CustomerName73', N'CustomerGmail73@gmail.com', 1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (74, N'CustomerUsr74', N'CustomerPwd74', N'CustomerName74', N'CustomerGmail74@gmail.com', 1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (75, N'CustomerUsr75', N'CustomerPwd75', N'CustomerName75', N'CustomerGmail75@gmail.com', 1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (76, N'CustomerUsr76', N'CustomerPwd76', N'CustomerName76', N'CustomerGmail76@gmail.com', 1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (77, N'CustomerUsr77', N'CustomerPwd77', N'CustomerName77', N'CustomerGmail77@gmail.com', 1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (78, N'CustomerUsr78', N'CustomerPwd78', N'CustomerName78', N'CustomerGmail78@gmail.com', 1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (79, N'CustomerUsr79', N'CustomerPwd79', N'CustomerName79', N'CustomerGmail79@gmail.com', 1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (80, N'CustomerUsr80', N'CustomerPwd80', N'CustomerName80', N'CustomerGmail80@gmail.com', 1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (81, N'CustomerUsr81', N'CustomerPwd81', N'CustomerName81', N'CustomerGmail81@gmail.com', 1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (82, N'CustomerUsr82', N'CustomerPwd82', N'CustomerName82', N'CustomerGmail82@gmail.com', 1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (83, N'CustomerUsr83', N'CustomerPwd83', N'CustomerName83', N'CustomerGmail83@gmail.com', 1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (84, N'CustomerUsr84', N'CustomerPwd84', N'CustomerName84', N'CustomerGmail84@gmail.com', 1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (85, N'CustomerUsr85', N'CustomerPwd85', N'CustomerName85', N'CustomerGmail85@gmail.com', 1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (86, N'CustomerUsr86', N'CustomerPwd86', N'CustomerName86', N'CustomerGmail86@gmail.com', 1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (87, N'CustomerUsr87', N'CustomerPwd87', N'CustomerName87', N'CustomerGmail87@gmail.com', 1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (88, N'CustomerUsr88', N'CustomerPwd88', N'CustomerName88', N'CustomerGmail88@gmail.com', 1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (89, N'CustomerUsr89', N'CustomerPwd89', N'CustomerName89', N'CustomerGmail89@gmail.com', 1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (90, N'CustomerUsr90', N'CustomerPwd90', N'CustomerName90', N'CustomerGmail90@gmail.com', 1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (91, N'CustomerUsr91', N'CustomerPwd91', N'CustomerName91', N'CustomerGmail91@gmail.com', 1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (92, N'CustomerUsr92', N'CustomerPwd92', N'CustomerName92', N'CustomerGmail92@gmail.com', 1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (93, N'CustomerUsr93', N'CustomerPwd93', N'CustomerName93', N'CustomerGmail93@gmail.com', 1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (94, N'CustomerUsr94', N'CustomerPwd94', N'CustomerName94', N'CustomerGmail94@gmail.com', 1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (95, N'CustomerUsr95', N'CustomerPwd95', N'CustomerName95', N'CustomerGmail95@gmail.com', 1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (96, N'CustomerUsr96', N'CustomerPwd96', N'CustomerName96', N'CustomerGmail96@gmail.com', 1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (97, N'CustomerUsr97', N'CustomerPwd97', N'CustomerName97', N'CustomerGmail97@gmail.com', 1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (98, N'CustomerUsr98', N'CustomerPwd98', N'CustomerName98', N'CustomerGmail98@gmail.com', 1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (99, N'CustomerUsr99', N'CustomerPwd99', N'CustomerName99', N'CustomerGmail99@gmail.com', 1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (100, N'CustomerUsr100', N'CustomerPwd100', N'CustomerName100', N'CustomerGmail100@gmail.com', 1)
GO
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (101, N'VipUsr101', N'VipPwd101', N'VipName101', N'VipGmail101@gmail.com', 2)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (102, N'VipUsr102', N'VipPwd102', N'VipName102', N'VipGmail102@gmail.com', 2)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (103, N'VipUsr103', N'VipPwd103', N'VipName103', N'VipGmail103@gmail.com', 2)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (104, N'VipUsr104', N'VipPwd104', N'VipName104', N'VipGmail104@gmail.com', 2)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (105, N'VipUsr105', N'VipPwd105', N'VipName105', N'VipGmail105@gmail.com', 2)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (106, N'VipUsr106', N'VipPwd106', N'VipName106', N'VipGmail106@gmail.com', 2)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (107, N'VipUsr107', N'VipPwd107', N'VipName107', N'VipGmail107@gmail.com', 2)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (108, N'VipUsr108', N'VipPwd108', N'VipName108', N'VipGmail108@gmail.com', 2)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (109, N'VipUsr109', N'VipPwd109', N'VipName109', N'VipGmail109@gmail.com', 2)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (110, N'VipUsr110', N'VipPwd110', N'VipName110', N'VipGmail110@gmail.com', 2)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (121, N'DriverUsr121', N'DriverPwd121', N'DriverName121', N'DriverGmail121@gmail.com', 3)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (122, N'DriverUsr122', N'DriverPwd122', N'DriverName122', N'DriverGmail122@gmail.com', 3)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (123, N'DriverUsr123', N'DriverPwd123', N'DriverName123', N'DriverGmail123@gmail.com', 3)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (124, N'DriverUsr124', N'DriverPwd124', N'DriverName124', N'DriverGmail124@gmail.com', 3)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (125, N'DriverUsr125', N'DriverPwd125', N'DriverName125', N'DriverGmail125@gmail.com', 3)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (126, N'DriverUsr126', N'DriverPwd126', N'DriverName126', N'DriverGmail126@gmail.com', 3)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (127, N'DriverUsr127', N'DriverPwd127', N'DriverName127', N'DriverGmail127@gmail.com', 3)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (128, N'DriverUsr128', N'DriverPwd128', N'DriverName128', N'DriverGmail128@gmail.com', 3)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (129, N'DriverUsr129', N'DriverPwd129', N'DriverName129', N'DriverGmail129@gmail.com', 3)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (130, N'DriverUsr130', N'DriverPwd130', N'DriverName130', N'DriverGmail130@gmail.com', 3)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (131, N'DriverUsr131', N'DriverPwd131', N'DriverName131', N'DriverGmail131@gmail.com', 3)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (132, N'DriverUsr132', N'DriverPwd132', N'DriverName132', N'DriverGmail132@gmail.com', 3)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (133, N'DriverUsr133', N'DriverPwd133', N'DriverName133', N'DriverGmail133@gmail.com', 3)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (134, N'DriverUsr134', N'DriverPwd134', N'DriverName134', N'DriverGmail134@gmail.com', 3)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (135, N'DriverUsr135', N'DriverPwd135', N'DriverName135', N'DriverGmail135@gmail.com', 3)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (136, N'DriverUsr136', N'DriverPwd136', N'DriverName136', N'DriverGmail136@gmail.com', 3)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (137, N'DriverUsr137', N'DriverPwd137', N'DriverName137', N'DriverGmail137@gmail.com', 3)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (138, N'DriverUsr138', N'DriverPwd138', N'DriverName138', N'DriverGmail138@gmail.com', 3)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (139, N'DriverUsr139', N'DriverPwd139', N'DriverName139', N'DriverGmail139@gmail.com', 3)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (140, N'DriverUsr140', N'DriverPwd140', N'DriverName140', N'DriverGmail140@gmail.com', 3)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (141, N'DriverUsr141', N'DriverPwd141', N'DriverName141', N'DriverGmail141@gmail.com', 3)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (142, N'DriverUsr142', N'DriverPwd142', N'DriverName142', N'DriverGmail142@gmail.com', 3)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (143, N'DriverUsr143', N'DriverPwd143', N'DriverName143', N'DriverGmail143@gmail.com', 3)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (144, N'DriverUsr144', N'DriverPwd144', N'DriverName144', N'DriverGmail144@gmail.com', 3)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (145, N'DriverUsr145', N'DriverPwd145', N'DriverName145', N'DriverGmail145@gmail.com', 3)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (146, N'DriverUsr146', N'DriverPwd146', N'DriverName146', N'DriverGmail146@gmail.com', 3)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (147, N'DriverUsr147', N'DriverPwd147', N'DriverName147', N'DriverGmail147@gmail.com', 3)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (148, N'DriverUsr148', N'DriverPwd148', N'DriverName148', N'DriverGmail148@gmail.com', 3)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (149, N'DriverUsr149', N'DriverPwd149', N'DriverName149', N'DriverGmail149@gmail.com', 3)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (150, N'DriverUsr150', N'DriverPwd150', N'DriverName150', N'DriverGmail150@gmail.com', 3)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPwd], [UserFullName], [UserEmail], [UserRoleId]) VALUES (99999, N'AdminUsr', N'AdminPwd', N'King of server', N'AdminGmail@gmail.com', 4)
GO
ALTER TABLE [dbo].[Buses] ADD  DEFAULT ((30)) FOR [NumberOfSeat]
GO
ALTER TABLE [dbo].[Buses] ADD  DEFAULT ((1)) FOR [BusStatusId]
GO
ALTER TABLE [dbo].[Trips] ADD  CONSTRAINT [DF__Trips__TripStatu__4AB81AF0]  DEFAULT ((1)) FOR [TripStatusId]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ((1)) FOR [UserRoleId]
GO
ALTER TABLE [dbo].[Buses]  WITH CHECK ADD  CONSTRAINT [FK_BusStatusId] FOREIGN KEY([BusStatusId])
REFERENCES [dbo].[BusStatus] ([BusStatusId])
GO
ALTER TABLE [dbo].[Buses] CHECK CONSTRAINT [FK_BusStatusId]
GO
ALTER TABLE [dbo].[Buses]  WITH CHECK ADD  CONSTRAINT [FK_DriverId] FOREIGN KEY([DriverId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Buses] CHECK CONSTRAINT [FK_DriverId]
GO
ALTER TABLE [dbo].[Trips]  WITH CHECK ADD  CONSTRAINT [FK_BusLicensePlate] FOREIGN KEY([BusLicensePlate])
REFERENCES [dbo].[Buses] ([LicensePlate])
GO
ALTER TABLE [dbo].[Trips] CHECK CONSTRAINT [FK_BusLicensePlate]
GO
ALTER TABLE [dbo].[Trips]  WITH CHECK ADD  CONSTRAINT [FK_TripStatus] FOREIGN KEY([TripStatusId])
REFERENCES [dbo].[TripStatus] ([TripStatusId])
GO
ALTER TABLE [dbo].[Trips] CHECK CONSTRAINT [FK_TripStatus]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_UserRoleId] FOREIGN KEY([UserRoleId])
REFERENCES [dbo].[UserRoles] ([UserRoleId])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_UserRoleId]
GO
ALTER TABLE [dbo].[Buses]  WITH CHECK ADD CHECK  (([NumberOfSeat]>(0)))
GO
ALTER TABLE [dbo].[Buses]  WITH CHECK ADD  CONSTRAINT [CK_NumberOfSeatLeft] CHECK  (([NumberOfSeatLeft]>=(0) AND [NumberOfSeatLeft]<=[NumberOfSeat]))
GO
ALTER TABLE [dbo].[Buses] CHECK CONSTRAINT [CK_NumberOfSeatLeft]
GO
ALTER TABLE [dbo].[Trips]  WITH CHECK ADD  CONSTRAINT [CK__Trips__DepartTim__49C3F6B7] CHECK  (([DepartTime]>getdate()))
GO
ALTER TABLE [dbo].[Trips] CHECK CONSTRAINT [CK__Trips__DepartTim__49C3F6B7]
GO
ALTER TABLE [dbo].[Trips]  WITH CHECK ADD  CONSTRAINT [CK_ArriveLocation] CHECK  (([DepartLocation]<>[ArriveLocation]))
GO
ALTER TABLE [dbo].[Trips] CHECK CONSTRAINT [CK_ArriveLocation]
GO
/****** Object:  StoredProcedure [dbo].[GetTrip]    Script Date: 12/7/2024 10:29:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetTrip](@depart NVARCHAR(50), @arrive NVARCHAR(50), @departdate SMALLDATETIME) AS 
		SELECT TripId, TripName, DepartLocation, ArriveLocation, DepartTime,TripStatusId,BusLicensePlate,TripPrice FROM 
			(
				SELECT * FROM Trips WHERE DepartLocation = @depart AND ArriveLocation = @arrive AND DepartTime = @departdate
					AND TripStatusId=1
			)
        AS AllTrips
		INNER JOIN Buses ON AllTrips.BusLicensePlate = Buses.LicensePlate
GO
/****** Object:  StoredProcedure [dbo].[GetTripR]    Script Date: 12/7/2024 10:29:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetTripR](@depart NVARCHAR(50), @arrive NVARCHAR(50), @departdate SMALLDATETIME, @returndate SMALLDATETIME) AS 
	SELECT TripId, TripName, DepartLocation, ArriveLocation, DepartTime,TripStatusId,BusLicensePlate,TripPrice FROM 
	(
		SELECT * FROM Trips WHERE DepartLocation = @depart AND ArriveLocation = @arrive AND DepartTime = @departdate AND TripStatusId = 1
		UNION
		SELECT * FROM Trips WHERE DepartLocation = @arrive AND ArriveLocation = @depart AND DepartTime = @returndate AND TripStatusId = 1
	) AS AllTrips
    INNER JOIN Buses ON AllTrips.BusLicensePlate = Buses.LicensePlate
GO
/****** Object:  StoredProcedure [dbo].[GetUserInfo]    Script Date: 12/7/2024 10:29:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetUserInfo](@usr NVARCHAR(50), @pwd NVARCHAR(50))
AS SELECT * FROM Users WHERE UserName = @usr AND UserPwd = @pwd
GO
USE [master]
GO
ALTER DATABASE [bus_server_prod] SET  READ_WRITE 
GO

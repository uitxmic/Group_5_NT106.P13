USE [master]
GO
/****** Object:  Database [bus_server_prod]    Script Date: 12/6/2024 7:36:57 PM ******/
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
/****** Object:  Table [dbo].[Buses]    Script Date: 12/6/2024 7:36:58 PM ******/
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
/****** Object:  Table [dbo].[BusStatus]    Script Date: 12/6/2024 7:36:58 PM ******/
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
/****** Object:  Table [dbo].[Ticket]    Script Date: 12/6/2024 7:36:58 PM ******/
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
/****** Object:  Table [dbo].[TicketType]    Script Date: 12/6/2024 7:36:58 PM ******/
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
/****** Object:  Table [dbo].[Trips]    Script Date: 12/6/2024 7:36:58 PM ******/
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
 CONSTRAINT [PK__Trips__51DC713E94512816] PRIMARY KEY CLUSTERED 
(
	[TripId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TripStatus]    Script Date: 12/6/2024 7:36:58 PM ******/
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
/****** Object:  Table [dbo].[UserRoles]    Script Date: 12/6/2024 7:36:58 PM ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 12/6/2024 7:36:58 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetTrip]    Script Date: 12/6/2024 7:36:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetTrip](@depart NVARCHAR(50), @arrive NVARCHAR(50), @departdate SMALLDATETIME) AS 
		SELECT TripId, TripName, DepartLocation, ArriveLocation, DepartTime,TripStatusId,BusLicensePlate FROM 
			(
				SELECT * FROM Trips WHERE DepartLocation = @depart AND ArriveLocation = @arrive AND DepartTime = @departdate
			)
        AS AllTrips
		INNER JOIN Buses ON AllTrips.BusLicensePlate = Buses.LicensePlate
GO
/****** Object:  StoredProcedure [dbo].[GetTripR]    Script Date: 12/6/2024 7:36:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetTripR](@depart NVARCHAR(50), @arrive NVARCHAR(50), @departdate SMALLDATETIME, @returndate SMALLDATETIME) AS 
	SELECT TripId, TripName, DepartLocation, ArriveLocation, DepartTime,TripStatusId,BusLicensePlate FROM 
	(
		SELECT * FROM Trips WHERE DepartLocation = @depart AND ArriveLocation = @arrive AND DepartTime = @departdate 
		UNION
		SELECT * FROM Trips WHERE DepartLocation = @arrive AND ArriveLocation = @depart AND DepartTime = @returndate
	) AS AllTrips
    INNER JOIN Buses ON AllTrips.BusLicensePlate = Buses.LicensePlate
GO
/****** Object:  StoredProcedure [dbo].[GetUserInfo]    Script Date: 12/6/2024 7:36:58 PM ******/
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

-- Table: User

CREATE DATABASE Bus_server_prod
GO
USE Bus_server_prod
GO

CREATE TABLE [User] (
    UserId INT PRIMARY KEY IDENTITY(1,1),
    UserName NVARCHAR(100) NOT NULL,
	[Password] VARCHAR(65) NOT NULL,
    UserFullName NVARCHAR(200) NOT NULL,
    Mail NVARCHAR(255) NOT NULL UNIQUE,
    UserRoleId INT NOT NULL,
    FOREIGN KEY (UserRoleId) REFERENCES UserRole(UserRoleId)
);

-- Table: UserRole
CREATE TABLE UserRole (
    UserRoleId INT PRIMARY KEY IDENTITY(1,1),
    UserRoleName NVARCHAR(100) NOT NULL UNIQUE
);

-- Table: Ticket
CREATE TABLE Ticket (
    TicketId INT PRIMARY KEY IDENTITY(1,1),
    NumOfSeat INT NOT NULL,
    TripId INT NOT NULL,
    UserId INT NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    TicketDetailId INT NULL,
    FOREIGN KEY (TripId) REFERENCES Trip(TripId),
    FOREIGN KEY (UserId) REFERENCES [User](UserId)
);

-- Table: TicketDetail
CREATE TABLE TicketDetail (
    TicketDetailId INT PRIMARY KEY IDENTITY(1,1),
    TicketId INT NOT NULL,
    SeatId INT NOT NULL,
    FOREIGN KEY (TicketId) REFERENCES Ticket(TicketId)
);

CREATE TABLE TripStatus (
    TripStatusId INT PRIMARY KEY IDENTITY(1,1),
    TripStatusName NVARCHAR(50) NOT NULL
);

-- Table: Trip
CREATE TABLE Trip (
    TripId INT PRIMARY KEY IDENTITY(1,1),
    Plate NVARCHAR(50) NOT NULL,
    DepartLocation NVARCHAR(255) NOT NULL,
    ArriveLocation NVARCHAR(255) NOT NULL,
    DepartTime DATETIME NOT NULL,
	TripStatusId INT,
    FOREIGN KEY (Plate) REFERENCES Bus(LicensePlate),
	FOREIGN KEY (TripStatusId) REFERENCES TripStatus(TripStatusId)
);

-- Table: Bus
CREATE TABLE Bus (
    BusId INT PRIMARY KEY IDENTITY(1,1),
    LicensePlate NVARCHAR(50) NOT NULL UNIQUE,
    SeatNum INT NOT NULL CHECK (SeatNum > 0),
	BusStatusId INT,
	FOREIGN KEY (BusStatusId) REFERENCES BusStatus(BusStatusId)
);

-- Table: Seat
CREATE TABLE Seat (
    LicensePlate NVARCHAR(50) NOT NULL,
    SeatId INT NOT NULL,
    SeatName NVARCHAR(50) NOT NULL,
    IsBook BIT NOT NULL DEFAULT 0,
    PRIMARY KEY (LicensePlate, SeatId),
    FOREIGN KEY (LicensePlate) REFERENCES Bus(LicensePlate)
);

CREATE TABLE BusStatus (
    BusStatusId INT PRIMARY KEY IDENTITY(1,1),
    BusStatusName NVARCHAR(50) NOT NULL
);


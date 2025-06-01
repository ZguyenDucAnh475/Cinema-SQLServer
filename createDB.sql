--Create DB
--create database AssignmentDB_Cinema_01
--use AssignmentDB_Cinema_01

-- Cinema Table
create table Cinemas (
    CinemaID int primary key,
    [Name] varchar(100) not null,
    [Location] varchar(200) not null,
    PhoneNumber varchar(10)
);

-- Customer Table
create table Customers (
    CustomerID int primary key,
    [Name] varchar(100) not null,
    [Address] varchar(200) not null,
    PhoneNumber varchar(10)
);

-- Room Table
create table Rooms (
    RoomID int primary key,
    RoomType varchar(100) not null,
    CinemaID int not null,
    foreign key (CinemaID) references Cinemas(CinemaID)
);

-- Seat Table
create table Seats (
    SeatID int primary key,
    SeatType varchar(100) not null,
    SeatNumber int not null,
    RoomID int not null,
    foreign key (RoomID) references Rooms(RoomID)
);

-- Film Table
create table Films (
    FilmID int primary key,
    [Name] varchar(200) not null,
    [Money] money not null
);


-- Schedule Table
create table Schedules (
    ScheduleID int primary key,
    [Date] datetime not null,
    [Time] varchar(100) not null,
    CinemaID int not null,
    RoomID int not null,
    FilmID int not null,
    foreign key (CinemaID) references Cinemas(CinemaID),
    foreign key (RoomID) references Rooms(RoomID),
    foreign key (FilmID) references Films(FilmID)
);

-- Ticket Table
create table Tickets (
    TicketID int primary key,
    [Date] datetime not null,
    CinemaID int not null,
    FilmID int not null,
    SeatID int not null,
    CustomerID int not null,
    RoomID int not null,
    foreign key (CinemaID) references Cinemas(CinemaID),
    foreign key (FilmID) references Films(FilmID),
    foreign key (SeatID) references Seats(SeatID),
    foreign key (CustomerID) references Customers(CustomerID),
    foreign key (RoomID) references Rooms(RoomID)
);

-- Invoice Table
create table Invoices (
    InvoiceID int primary key,
    [Date] datetime not null,
    TicketID int not null,
    CustomerID int not null,
    foreign key (TicketID) references Tickets(TicketID),
    foreign key (CustomerID) references Customers(CustomerID)
);


-- Employee Table
create Table Employees (
    EmployeeID int primary key,
    [Name] varchar(100) not null,
    Gender nvarchar(1) not null,
    Phone varchar(10),
    [Address] varchar(200),
    CinemaID int not null,
    foreign key (CinemaID) references Cinemas(CinemaID)
);

-- Manager Table
create table Managers (
    ManagerID int primary key,
    [Name] varchar(100) not null,
	Gender nvarchar(1) not null,
	-- FK
    CinemaID int not null,
	-- FK code
    foreign key (CinemaID) references Cinemas(CinemaID)
);


-- END
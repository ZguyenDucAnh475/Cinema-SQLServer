--use AssignmentDB_Cinema_01

INSERT INTO Cinemas (CinemaID, [Name], [Location], PhoneNumber) 
VALUES 
(1, 'Galaxy Cinema', 'District 1, Ho Chi Minh City', '0901234567'),
(2, 'CGV Cinema', 'District 2, Ho Chi Minh City', '0912345678'),
(3, 'Lotte Cinema', 'District 3, Ho Chi Minh City', '0923456789');


-- Insert into Rooms
INSERT INTO Rooms (RoomID, RoomType, CinemaID) 
VALUES 
(4, 'Standard', 1), 
(5, 'VIP', 2), 
(6, 'IMAX', 3), 
(7, 'Standard', 1), 
(8, 'VIP', 2), 
(9, 'IMAX', 3), 
(10, 'Standard', 1), 
(11, 'VIP', 2), 
(12, 'IMAX', 3);


INSERT INTO Films (FilmID, [Name], [Money]) 
VALUES 
(4, 'Avatar: The Way of Water', 120000),
(5, 'The Batman', 150000),
(6, 'Spider-Man: No Way Home', 140000),
(7, 'Doctor Strange 2', 130000),
(8, 'Black Panther: Wakanda Forever', 160000),
(9, 'Top Gun: Maverick', 170000),
(10, 'Minions: The Rise of Gru', 100000),
(11, 'Thor: Love and Thunder', 125000),
(12, 'Jurassic World: Dominion', 155000);



-- Insert into Schedules
INSERT INTO Schedules (ScheduleID, [Date], [Time], CinemaID, RoomID, FilmID) 
VALUES 
(4, '2024-12-18', '16:00', 1, 4, 4),
(5, '2024-12-18', '18:00', 2, 5, 5),
(6, '2024-12-19', '20:00', 3, 6, 6),
(7, '2024-12-19', '19:30', 1, 7, 7),
(8, '2024-12-20', '17:00', 2, 8, 8),
(9, '2024-12-20', '18:00', 3, 9, 9),
(10, '2024-12-21', '21:00', 1, 10, 10),
(11, '2024-12-21', '18:30', 2, 11, 11),
(12, '2024-12-22', '15:00', 3, 12, 12);


-- Insert into Seats
INSERT INTO Seats (SeatID, SeatType, SeatNumber, RoomID) 
VALUES 
(4, 'Regular', 1, 4), 
(5, 'Regular', 2, 5), 
(6, 'VIP', 1, 6), 
(7, 'VIP', 2, 7), 
(8, 'IMAX', 1, 8), 
(9, 'IMAX', 2, 9), 
(10, 'Standard', 1, 10), 
(11, 'Standard', 2, 11), 
(12, 'Deluxe', 1, 12);


-- Insert into Tickets
INSERT INTO Tickets (TicketID, [Date], CinemaID, FilmID, SeatID, CustomerID, RoomID) 
VALUES 
(4, '2024-12-18', 1, 4, 4, 4, 4),
(5, '2024-12-18', 2, 5, 5, 5, 5),
(6, '2024-12-19', 3, 6, 6, 6, 6),
(7, '2024-12-19', 1, 7, 7, 7, 7),
(8, '2024-12-20', 2, 8, 8, 8, 8),
(9, '2024-12-20', 3, 9, 9, 9, 9),
(10, '2024-12-21', 1, 10, 10, 10, 10),
(11, '2024-12-21', 2, 11, 11, 11, 11),
(12, '2024-12-22', 3, 12, 12, 12, 12);

-- Insert into Employees
INSERT INTO Employees (EmployeeID, [Name], Gender, Phone, [Address], CinemaID) 
VALUES 
(4, 'Nguyen Thi P', 'F', '0912345678', 'District 4, Ho Chi Minh City', 1),
(5, 'Tran Van Q', 'M', '0923456789', 'District 5, Ho Chi Minh City', 2),
(6, 'Pham Thi R', 'F', '0931234567', 'District 6, Ho Chi Minh City', 3),
(7, 'Le Van S', 'M', '0945678901', 'District 1, Ho Chi Minh City', 1),
(8, 'Tran Thi T', 'F', '0956789012', 'District 2, Ho Chi Minh City', 2),
(9, 'Nguyen Van U', 'M', '0967890123', 'District 3, Ho Chi Minh City', 3),
(10, 'Pham Thi V', 'F', '0978901234', 'District 4, Ho Chi Minh City', 1),
(11, 'Le Van W', 'M', '0989012345', 'District 5, Ho Chi Minh City', 2),
(12, 'Tran Thi X', 'F', '0990123456', 'District 6, Ho Chi Minh City', 3);

-- Insert into Managers
INSERT INTO Managers (ManagerID, [Name], Gender, CinemaID) 
VALUES 
(4, 'Nguyen Van Y', 'M', 1),
(5, 'Tran Thi Z', 'F', 2),
(6, 'Pham Van AA', 'M', 3),
(7, 'Le Thi BB', 'F', 1),
(8, 'Nguyen Van CC', 'M', 2),
(9, 'Pham Thi DD', 'F', 3),
(10, 'Tran Van EE', 'M', 1),
(11, 'Le Thi FF', 'F', 2),
(12, 'Nguyen Thi GG', 'F', 3);

-- Insert into Customers (ít nhất 10 khách hàng, có thể trùng địa chỉ hoặc số điện thoại)
INSERT INTO Customers (CustomerID, [Name], [Address], PhoneNumber) 
VALUES 
(4, 'Pham Thi G', 'District 4, Ho Chi Minh City', '0901234567'),
(5, 'Le Van H', 'District 5, Ho Chi Minh City', '0901234567'), -- Trùng số điện thoại
(6, 'Tran Van I', 'District 1, Ho Chi Minh City', '0912345678'),
(7, 'Nguyen Van J', 'District 2, Ho Chi Minh City', '0923456789'),
(8, 'Pham Thi K', 'District 6, Ho Chi Minh City', '0931234567'),
(9, 'Le Van L', 'District 1, Ho Chi Minh City', '0941234567'),
(10, 'Nguyen Thi M', 'District 2, Ho Chi Minh City', '0951234567'),
(11, 'Tran Van N', 'District 3, Ho Chi Minh City', '0961234567'),
(12, 'Pham Thi O', 'District 4, Ho Chi Minh City', '0971234567');

-- Insert into Invoices
INSERT INTO Invoices (InvoiceID, [Date], TicketID, CustomerID) 
VALUES 
(1, '2024-12-18', 4, 4),
(2, '2024-12-18', 5, 5),
(3, '2024-12-19', 6, 6),
(4, '2024-12-19', 7, 7),
(5, '2024-12-20', 8, 8),
(6, '2024-12-20', 9, 9),
(7, '2024-12-21', 10, 10),
(8, '2024-12-21', 11, 11),
(9, '2024-12-22', 12, 12);

-- END
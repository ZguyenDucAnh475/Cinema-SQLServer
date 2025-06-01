-- Trigger Tự động thêm vé mới
CREATE TRIGGER AfterInsertTicket
ON Tickets
AFTER INSERT
AS
BEGIN
    PRINT 'New ticket has been added!';
END;


-- Thêm một vé mới để kiểm tra trigger
INSERT INTO Tickets (TicketID, [Date], CinemaID, FilmID, SeatID, CustomerID, RoomID) 
VALUES (20, '2030-12-20 18:00:00', 3, 4, 4, 4, 4);

-- test
-- select * from dbo.Tickets

-- Gửi cảnh báo khi ghế VIP được đặt (áp dụng cho các phòng chiếu cao cấp).
CREATE TRIGGER AlertVIPSeatBooking
ON Tickets
AFTER INSERT
AS
BEGIN
    IF EXISTS (
        SELECT 1 
        FROM Inserted 
        INNER JOIN Seats ON Inserted.SeatID = Seats.SeatID
        WHERE Seats.SeatType = 'VIP'
    )
    BEGIN
        PRINT 'Warning: A VIP seat has been booked!';
    END;
END;

-- select * from Seats
-- Đặt một vé với ghế VIP để kiểm tra trigger
INSERT INTO Tickets (TicketID, [Date], CinemaID, FilmID, SeatID, CustomerID, RoomID) 
VALUES (13, '2024-12-30 18:00:00', 1, 4, 6, 4, 6);

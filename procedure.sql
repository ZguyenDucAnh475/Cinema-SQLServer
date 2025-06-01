--use AssignmentDB_Cinema_01

CREATE PROCEDURE GetCustomerTickets
    @CustomerID INT
AS
BEGIN
    SELECT Tickets.TicketID, Films.Name AS FilmName, Tickets.Date
    FROM Tickets
    INNER JOIN Films ON Tickets.FilmID = Films.FilmID
    WHERE Tickets.CustomerID = @CustomerID;
END;

-- select * from Customers

-- xem danh sách vé của khách hàng có CustomerID = ..
EXEC GetCustomerTickets @CustomerID = 11;


-- 
CREATE PROCEDURE GetFilmCustomers
    @FilmID INT
AS
BEGIN
    SELECT Customers.CustomerID, Customers.[Name], Customers.PhoneNumber, Tickets.Date
    FROM Customers
    INNER JOIN Tickets ON Customers.CustomerID = Tickets.CustomerID
    WHERE Tickets.FilmID = @FilmID;
END;

-- Lấy danh sách khách hàng đã đặt vé cho phim có FilmID = 4
EXEC GetFilmCustomers @FilmID = 4;

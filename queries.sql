--use AssignmentDB_Cinema_01
-- INNER JOIN
-- Q1: Xem thông tin vé của khách hàng
SELECT 
	cinema.Name AS N'Rạp',
	cinema.Location AS N'Địa điểm',
	film.Name as N'Tên Phim',
	schedule.Time AS N'Giờ chiếu',
	seat.SeatNumber AS N'Ghế',
	seat.SeatType AS N'Loại ghế'
	
FROM Tickets ticket
INNER JOIN Cinemas cinema ON cinema.CinemaID = ticket.CinemaID
INNER JOIN Customers customer ON customer.CustomerID = ticket.CustomerID
INNER JOIN Rooms room ON room.RoomID = ticket.RoomID
INNER JOIN Seats seat ON seat.SeatID = ticket.SeatID
INNER JOIN Films film ON ticket.FilmID = film.FilmID
JOIN Schedules schedule ON film.FilmID = schedule.FilmID
ORDER BY seat.SeatType ASC, schedule.Time ASC

-- Q2: Lấy nhân viên và quản lý của các rạp
SELECT 
    cinema.Name AS N'Tên rạp',
    cinema.Location AS N'Địa điểm rạp',
    employee.Name AS N'Tên nhân viên',
    employee.Address AS N'Địa chỉ',
    CASE 
        WHEN employee.Gender = 'F' THEN N'Nữ'
        WHEN employee.Gender = 'M' THEN N'Nam'
        ELSE N'Không xác định'
    END AS N'Giới tính nhân viên',
    manager.Name AS N'Tên quản lý',
    CASE 
        WHEN manager.Gender = 'F' THEN N'Nữ'
        WHEN manager.Gender = 'M' THEN N'Nam'
        ELSE N'Không xác định'
    END AS N'Giới tính quản lý'
FROM Cinemas cinema
INNER JOIN Employees employee ON employee.CinemaID = cinema.CinemaID
INNER JOIN Managers manager ON manager.CinemaID = cinema.CinemaID
ORDER BY cinema.Name ASC

-- OUTER JOIN
-- Q1: Lấy danh sách khách hàng và thông tin vé, bao gồm cả khách hàng chưa đặt vé
SELECT 
    customer.CustomerID AS N'Mã khách hàng',
    customer.Name AS N'Tên khách hàng',
    customer.PhoneNumber AS N'Số điện thoại',
    ticket.TicketID AS N'Mã vé',
    ticket.Date AS N'Ngày đặt vé',
    ticket.FilmID AS N'Mã phim'
FROM Customers customer
LEFT OUTER JOIN Tickets ticket ON customer.CustomerID = ticket.CustomerID
ORDER BY customer.CustomerID;


-- Q2: Lấy danh sách phòng chiếu và ghế ngồi
SELECT 
    room.RoomID AS N'Mã phòng',
    room.RoomType AS N'Loại phòng',
    seat.SeatID AS N'Mã ghế',
    seat.SeatType AS N'Loại ghế'
FROM Rooms room
LEFT OUTER JOIN Seats seat ON room.RoomID = seat.RoomID
ORDER BY room.RoomID;


-- Q3: Lấy thông tin phim và lịch chiếu
SELECT 
    film.FilmID AS N'Mã phim',
    film.Name AS N'Tên phim',
    film.Money AS N'Giá vé',
    schedule.ScheduleID AS N'Mã lịch chiếu',
    schedule.Date AS N'Ngày chiếu',
    schedule.Time AS N'Giờ chiếu'
FROM Films film
LEFT OUTER JOIN Schedules schedule ON film.FilmID = schedule.FilmID
ORDER BY film.FilmID;


-- Query using group by and aggregate functions
-- Q1: Thống kê số lượng vé đã bán cho từng rạp
SELECT 
    cinema.Name AS N'Tên rạp',
    COUNT(ticket.TicketID) AS N'Số lượng vé đã bán'
FROM Cinemas cinema
LEFT JOIN Tickets ticket ON cinema.CinemaID = ticket.CinemaID
GROUP BY cinema.Name
ORDER BY COUNT(ticket.TicketID) DESC;

-- Q2: Doanh thu từng phim
SELECT 
	cinema.Name AS N'Tên rạp',
    film.Name AS N'Tên phim',
    SUM(film.Money) AS N'Doanh thu (VND)'
FROM Tickets ticket
INNER JOIN Films film ON ticket.FilmID = film.FilmID
INNER JOIN Cinemas cinema ON cinema.CinemaID = ticket.CinemaID
GROUP BY cinema.Name, film.Name
ORDER BY SUM(film.Money) DESC;

-- Q3: Thống kê số nhân viên theo giới tính tại từng rạp
SELECT 
    cinema.Name AS N'Tên rạp',
    COUNT(CASE WHEN employee.Gender = 'M' THEN 1 END) AS N'Số nhân viên nam',
    COUNT(CASE WHEN employee.Gender = 'F' THEN 1 END) AS N'Số nhân viên nữ'
FROM Cinemas cinema
LEFT JOIN Employees employee ON cinema.CinemaID = employee.CinemaID
GROUP BY cinema.Name
ORDER BY cinema.Name;

-- Using subquery in WHERE.
-- Q1: lấy tất cả các vé có giá trị FilmID từ các phim có Money lớn hơn 130000
SELECT t.TicketID, f1.Name, f1.Money
FROM Tickets t
JOIN Films f1 ON f1.FilmID = t.FilmID
WHERE t.FilmID IN (
    SELECT f.FilmID
    FROM Films f
    WHERE f.Money > 130000
);

-- Q2: Kiểm tra khách hàng có vé cho phim cụ thể
SELECT c.CustomerID, c.Name
FROM Customers c
WHERE c.CustomerID IN (
    SELECT t.CustomerID
    FROM Tickets t
    WHERE t.FilmID = 4
);

-- Using subquery in FROM.
-- Q1: tính tổng giá vé của từng khách hàng (từ bảng Tickets và Films), và lọc những khách hàng có tổng giá vé lớn hơn 250000
SELECT temp.CustomerID, temp.TotalTicketPrice
FROM (
    SELECT t.CustomerID, SUM(f.Money) AS TotalTicketPrice
    FROM Tickets t
    JOIN Films f ON t.FilmID = f.FilmID
    GROUP BY t.CustomerID
) temp
WHERE temp.TotalTicketPrice > 250000;

-- Q2: Tính số lượng vé bán được cho mỗi phim
SELECT temp.FilmID, temp.TotalTickets
FROM (
    SELECT t.FilmID, COUNT(t.TicketID) AS TotalTickets
    FROM Tickets t
    GROUP BY t.FilmID
) temp
WHERE temp.TotalTickets >= 1;

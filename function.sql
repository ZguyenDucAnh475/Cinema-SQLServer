--use AssignmentDB_Cinema_01

CREATE FUNCTION GetTotalRevenue (@FilmID INT)
RETURNS MONEY
AS
BEGIN
    DECLARE @TotalRevenue MONEY;
    SELECT @TotalRevenue = SUM(Films.Money)
    FROM Films
    WHERE FilmID = @FilmID;
    RETURN @TotalRevenue;
END;

-- tính tổng doanh thu của phim có FilmID = ...
--SELECT dbo.GetTotalRevenue(4) AS TotalRevenue;
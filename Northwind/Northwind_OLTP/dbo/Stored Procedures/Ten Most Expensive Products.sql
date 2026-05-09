
-- Procedimiento de los 10 productos más caros
CREATE   PROCEDURE [dbo].[Ten Most Expensive Products] AS 
BEGIN
    SELECT TOP 10 ProductName AS TenMostExpensiveProducts, UnitPrice 
    FROM Products 
    ORDER BY UnitPrice DESC;
END;

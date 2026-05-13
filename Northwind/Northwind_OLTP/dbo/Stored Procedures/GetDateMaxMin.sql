
-- 3. Rango de Fechas (Para DimDate)
CREATE PROCEDURE [dbo].[GetDateMaxMin] AS 
BEGIN 
    SELECT MIN(OrderDate) as MinDate, MAX(OrderDate) as MaxDate FROM Orders;
END

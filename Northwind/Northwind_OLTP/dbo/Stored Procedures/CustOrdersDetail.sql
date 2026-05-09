
-- Procedimiento de Detalles de Órdenes
CREATE   PROCEDURE [dbo].[CustOrdersDetail] @OrderID int AS 
SELECT P.ProductName, 
    UnitPrice=ROUND(Od.UnitPrice, 2), 
    Od.Quantity, 
    Discount=CONVERT(int, Od.Discount * 100), 
    ExtendedPrice=ROUND(CONVERT(money, Od.Quantity * (1 - Od.Discount) * Od.UnitPrice), 2) 
FROM Products P 
INNER JOIN OrderDetails Od ON P.ProductID = Od.ProductID
WHERE Od.OrderID = @OrderID;

USE [Northwind_OLTP];
GO

-- Procedimiento de Detalles de Órdenes
CREATE OR ALTER PROCEDURE [dbo].[CustOrdersDetail] @OrderID int AS 
SELECT P.ProductName, 
    UnitPrice=ROUND(Od.UnitPrice, 2), 
    Od.Quantity, 
    Discount=CONVERT(int, Od.Discount * 100), 
    ExtendedPrice=ROUND(CONVERT(money, Od.Quantity * (1 - Od.Discount) * Od.UnitPrice), 2) 
FROM Products P 
INNER JOIN OrderDetails Od ON P.ProductID = Od.ProductID
WHERE Od.OrderID = @OrderID;
GO

-- Procedimiento de Cambios en Clientes (Usa rowversion para el ETL que pidió el docente)
CREATE OR ALTER PROCEDURE [dbo].[GetCustomerChangesByRowVersion] ( @startRow BIGINT ,@endRow BIGINT ) AS 
BEGIN 
    SELECT [CustomerID], [CompanyName], [City], [Country], [rowversion]
    FROM [dbo].[Customers]
    WHERE ([rowversion] > CONVERT(ROWVERSION,@startRow) AND [rowversion] <= CONVERT(ROWVERSION,@endRow))
END;
GO

-- Procedimiento de Cambios en Productos
CREATE OR ALTER PROCEDURE [dbo].[GetProductChangesByRowVersion] ( @startRow BIGINT ,@endRow BIGINT ) AS 
BEGIN 
    SELECT p.[ProductID], p.[ProductName], c.[CategoryName], p.[UnitPrice], p.[rowversion]
    FROM [dbo].[Products] p 
    INNER JOIN [dbo].[Categories] c ON p.CategoryID=c.CategoryID 
    WHERE (p.[rowversion] > CONVERT(ROWVERSION,@startRow) AND p.[rowversion] <= CONVERT(ROWVERSION,@endRow))
END;
GO

-- Procedimiento de los 10 productos más caros
CREATE OR ALTER PROCEDURE [dbo].[Ten Most Expensive Products] AS 
BEGIN
    SELECT TOP 10 ProductName AS TenMostExpensiveProducts, UnitPrice 
    FROM Products 
    ORDER BY UnitPrice DESC;
END;
GO
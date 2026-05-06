USE [Northwind_DW];
GO

-- 1. POBLAR DIMENSIÓN PRODUCTO
-- Extraemos de OLTP uniendo Productos y Categorías (Desnormalización para el DW)
INSERT INTO Dim_Product (ProductID, ProductName, CategoryName)
SELECT p.ProductID, p.ProductName, c.CategoryName
FROM Northwind_OLTP.dbo.Products p
INNER JOIN Northwind_OLTP.dbo.Categories c ON p.CategoryID = c.CategoryID;

-- 2. POBLAR DIMENSIÓN TIEMPO
-- Generamos claves de tiempo a partir de las fechas únicas de las órdenes
INSERT INTO Dim_Time (TimeKey, Date, Year, Quarter, Month)
SELECT DISTINCT 
    CONVERT(INT, CONVERT(VARCHAR(8), OrderDate, 112)) as TimeKey,
    OrderDate,
    YEAR(OrderDate),
    DATEPART(QUARTER, OrderDate),
    MONTH(OrderDate)
FROM Northwind_OLTP.dbo.Orders;

-- 3. POBLAR TABLA DE HECHOS (FACT_SALES)
-- Aquí unimos las tablas de OLTP con las dimensiones ya cargadas en el DW
INSERT INTO Fact_Sales (ProductKey, TimeKey, Quantity, TotalAmount)
SELECT 
    dp.ProductKey,
    dt.TimeKey,
    od.Quantity,
    -- Calculamos el monto total siguiendo la fórmula de tus fuentes: (Precio * Cantidad * (1 - Descuento))
    CAST((od.UnitPrice * od.Quantity * (1 - od.Discount)) AS MONEY) as TotalAmount
FROM Northwind_OLTP.dbo.OrderDetails od
INNER JOIN Northwind_OLTP.dbo.Orders o ON od.OrderID = o.OrderID
INNER JOIN Dim_Product dp ON od.ProductID = dp.ProductID
INNER JOIN Dim_Time dt ON o.OrderDate = dt.Date;

-- VERIFICACIÓN
SELECT 'Productos en DW' as Tabla, COUNT(*) as Registros FROM Dim_Product
UNION ALL
SELECT 'Tiempos en DW', COUNT(*) FROM Dim_Time
UNION ALL
SELECT 'Ventas (Hechos) en DW', COUNT(*) FROM Fact_Sales;
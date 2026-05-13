
-- Ahora sí, actualizamos el procedimiento de extracción
CREATE   PROCEDURE [dbo].[GetOrdersChangesByRowVersion] ( @startRow BIGINT, @endRow BIGINT ) AS 
BEGIN 
    SELECT 
        o.[OrderID], o.[CustomerID], o.[EmployeeID], 
        o.[OrderDate], o.[RequiredDate], o.[ShippedDate], 
        o.[ShipVia], od.[ProductID], od.[UnitPrice], 
        od.[Quantity], od.[Discount], 
        CAST(o.[rowversion] AS BIGINT) AS [rowversion] 
    FROM [dbo].[Orders] o 
    INNER JOIN [dbo].[Order Details] od ON o.OrderID = od.OrderID 
    WHERE (o.[rowversion] > CONVERT(ROWVERSION,@startRow) AND o.[rowversion] <= CONVERT(ROWVERSION,@endRow)) 
END

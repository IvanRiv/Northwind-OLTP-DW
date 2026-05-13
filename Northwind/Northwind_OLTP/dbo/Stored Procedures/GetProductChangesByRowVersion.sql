
CREATE   PROCEDURE [dbo].[GetProductChangesByRowVersion] ( @startRow BIGINT, @endRow BIGINT ) AS 
BEGIN 
    SELECT p.[ProductID], 
           p.[ProductName], 
           s.[CompanyName] AS [SupplierName], -- Agregamos el alias para que coincida con el Merge
           c.[CategoryName], 
           p.[QuantityPerUnit], 
           p.[UnitPrice], 
           p.[UnitsInStock], 
           p.[UnitsOnOrder], 
           p.[ReorderLevel], 
           p.[Discontinued],
           CAST(p.[rowversion] AS BIGINT) AS [rowversion] -- Ahora sí aparecerá en el ETL
    FROM [dbo].[Products] p 
    INNER JOIN [dbo].[Categories] c ON p.CategoryID=c.CategoryID 
    INNER JOIN [dbo].[Suppliers] s ON p.SupplierID=s.SupplierID 
    WHERE (p.[rowversion] > CONVERT(ROWVERSION,@startRow) AND p.[rowversion] <= CONVERT(ROWVERSION,@endRow));
END;

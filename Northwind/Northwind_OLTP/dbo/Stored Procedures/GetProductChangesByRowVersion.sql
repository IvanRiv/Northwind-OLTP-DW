
-- Procedimiento de Cambios en Productos
CREATE   PROCEDURE [dbo].[GetProductChangesByRowVersion] ( @startRow BIGINT ,@endRow BIGINT ) AS 
BEGIN 
    SELECT p.[ProductID], p.[ProductName], c.[CategoryName], p.[UnitPrice], p.[rowversion]
    FROM [dbo].[Products] p 
    INNER JOIN [dbo].[Categories] c ON p.CategoryID=c.CategoryID 
    WHERE (p.[rowversion] > CONVERT(ROWVERSION,@startRow) AND p.[rowversion] <= CONVERT(ROWVERSION,@endRow))
END;

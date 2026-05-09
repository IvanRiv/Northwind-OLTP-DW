
-- Procedimiento de Cambios en Clientes (Usa rowversion para el ETL que pidió el docente)
CREATE   PROCEDURE [dbo].[GetCustomerChangesByRowVersion] ( @startRow BIGINT ,@endRow BIGINT ) AS 
BEGIN 
    SELECT [CustomerID], [CompanyName], [City], [Country], [rowversion]
    FROM [dbo].[Customers]
    WHERE ([rowversion] > CONVERT(ROWVERSION,@startRow) AND [rowversion] <= CONVERT(ROWVERSION,@endRow))
END;


-- 1. Extracción de Transportistas (Shippers)
CREATE PROCEDURE [dbo].[GetShipperChangesByRowVersion] ( @startRow BIGINT, @endRow BIGINT ) AS 
BEGIN 
    SELECT [ShipperID], [CompanyName], [Phone], CAST([rowversion] AS BIGINT) AS [rowversion]
    FROM [dbo].[Shippers]
    WHERE ([rowversion] > CONVERT(ROWVERSION,@startRow) AND [rowversion] <= CONVERT(ROWVERSION,@endRow))
END

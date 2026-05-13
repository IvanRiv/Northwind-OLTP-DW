
-- 2. Clientes [1]
CREATE PROCEDURE [dbo].[GetCustomerChangesByRowVersion] ( @startRow BIGINT, @endRow BIGINT ) AS 
BEGIN 
    SELECT c.[CustomerID], c.[CompanyName], c.[ContactName], c.[ContactTitle], c.[Address], 
           c.[City], c.[Region], c.[PostalCode], c.[Country], c.[Phone], c.[Fax], 
           CAST(c.[rowversion] AS BIGINT) AS [rowversion], g.[CustomerDesc] 
    FROM [dbo].[Customers] c 
    LEFT JOIN [dbo].[CustomerCustomerDemo] d ON c.CustomerID=d.CustomerID 
    LEFT JOIN [dbo].[CustomerDemographics] g ON d.CustomerTypeID=g.CustomerTypeID 
    WHERE (c.[rowversion] > CONVERT(ROWVERSION,@startRow) AND c.[rowversion] <= CONVERT(ROWVERSION,@endRow))
END

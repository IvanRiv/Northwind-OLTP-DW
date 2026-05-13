
-- Agregar rowversion a extracción de Empleados
CREATE   PROCEDURE [dbo].[GetEmployeeChangesByRowVersion] (@startRow BIGINT, @endRow BIGINT) AS BEGIN 
    SELECT e.[EmployeeID], e.[LastName], e.[FirstName], e.[Title], e.[TitleOfCourtesy], e.[BirthDate], e.[HireDate], e.[Address], e.[City], e.[Region], e.[PostalCode], e.[Country], e.[HomePhone], e.[Extension], e.[Photo], e.[Notes], e.[ReportsTo], e.[PhotoPath], t.[TerritoryDescription], r.[RegionDescription],
    CAST(e.[rowversion] AS BIGINT) AS [rowversion] -- Indispensable para el ETL
    FROM [dbo].[Employees] e 
    LEFT JOIN [dbo].[EmployeeTerritories] et ON e.EmployeeID=et.EmployeeID 
    LEFT JOIN [dbo].[Territories] t ON et.TerritoryID=t.TerritoryID 
    LEFT JOIN [dbo].[Region] r ON t.RegionID=r.RegionID 
    WHERE (e.[rowversion] > CONVERT(ROWVERSION,@startRow) AND e.[rowversion] <= CONVERT(ROWVERSION,@endRow));
END;


CREATE   PROCEDURE [dbo].[DW_MergeDimEmployee] AS 
BEGIN 
    SET NOCOUNT ON;
    MERGE [dbo].[DimEmployee] AS Target 
    USING [dbo].[Staging_Employee] AS Source ON Target.[EmployeeID] = Source.[EmployeeID] 
    WHEN MATCHED THEN 
        UPDATE SET 
            Target.[LastName] = Source.[LastName], 
            Target.[FirstName] = Source.[FirstName], 
            Target.[Title] = Source.[Title],
            Target.[TitleOfCourtesy] = Source.[TitleOfCourtesy],
            Target.[BirthDate] = Source.[BirthDate],
            Target.[Address] = Source.[Address],
            Target.[City] = Source.[City],
            Target.[Region] = Source.[Region],
            Target.[PostalCode] = Source.[PostalCode],
            Target.[Country] = Source.[Country],
            Target.[HomePhone] = Source.[HomePhone],
            Target.[Extension] = Source.[Extension],
            Target.[RegionDescription] = Source.[RegionDescription],
            Target.[TerritoryDescription] = Source.[TerritoryDescription]
    WHEN NOT MATCHED THEN 
        INSERT ([EmployeeID], [LastName], [FirstName], [Title], [TitleOfCourtesy], [BirthDate], [Address], [City], [Region], [PostalCode], [Country], [HomePhone], [Extension], [RegionDescription], [TerritoryDescription]) 
        VALUES (Source.[EmployeeID], Source.[LastName], Source.[FirstName], Source.[Title], Source.[TitleOfCourtesy], Source.[BirthDate], Source.[Address], Source.[City], Source.[Region], Source.[PostalCode], Source.[Country], Source.[HomePhone], Source.[Extension], Source.[RegionDescription], Source.[TerritoryDescription]); 
END

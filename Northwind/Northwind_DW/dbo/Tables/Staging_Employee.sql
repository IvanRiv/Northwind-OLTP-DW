CREATE TABLE [dbo].[Staging_Employee] (
    [EmployeeID]           INT            NULL,
    [LastName]             NVARCHAR (20)  NULL,
    [FirstName]            NVARCHAR (10)  NULL,
    [Title]                NVARCHAR (30)  NULL,
    [HireDate]             DATETIME       NULL,
    [City]                 NVARCHAR (15)  NULL,
    [RegionDescription]    NCHAR (50)     NULL,
    [Country]              NVARCHAR (15)  NULL,
    [TitleOfCourtesy]      NVARCHAR (25)  NULL,
    [BirthDate]            DATETIME       NULL,
    [Address]              NVARCHAR (60)  NULL,
    [PostalCode]           NVARCHAR (10)  NULL,
    [HomePhone]            NVARCHAR (24)  NULL,
    [Extension]            NVARCHAR (4)   NULL,
    [Photo]                IMAGE          NULL,
    [Notes]                NTEXT          NULL,
    [ReportsTo]            INT            NULL,
    [PhotoPath]            NVARCHAR (255) NULL,
    [TerritoryDescription] NCHAR (50)     NULL,
    [Region]               NVARCHAR (15)  NULL
);


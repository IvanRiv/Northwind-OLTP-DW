CREATE TABLE [dbo].[Customers] (
    [CustomerID]  NCHAR (5)     NOT NULL,
    [CompanyName] NVARCHAR (40) NOT NULL,
    [City]        NVARCHAR (15) NULL,
    [Country]     NVARCHAR (15) NULL,
    [rowversion]  ROWVERSION    NOT NULL,
    PRIMARY KEY CLUSTERED ([CustomerID] ASC)
);


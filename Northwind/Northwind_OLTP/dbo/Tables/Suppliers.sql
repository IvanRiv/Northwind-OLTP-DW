CREATE TABLE [dbo].[Suppliers] (
    [SupplierID]  INT           IDENTITY (1, 1) NOT NULL,
    [CompanyName] NVARCHAR (40) NOT NULL,
    [ContactName] NVARCHAR (30) NULL,
    [rowversion]  ROWVERSION    NOT NULL,
    PRIMARY KEY CLUSTERED ([SupplierID] ASC)
);


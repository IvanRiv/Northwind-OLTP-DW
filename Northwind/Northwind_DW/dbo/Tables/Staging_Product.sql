CREATE TABLE [dbo].[Staging_Product] (
    [ProductID]       INT           NULL,
    [ProductName]     NVARCHAR (40) NULL,
    [SupplierName]    NVARCHAR (40) NULL,
    [CategoryName]    NVARCHAR (15) NULL,
    [QuantityPerUnit] NVARCHAR (20) NULL,
    [UnitPrice]       MONEY         NULL,
    [Discontinued]    BIT           NULL,
    [UnitsInStock]    SMALLINT      NULL,
    [UnitsOnOrder]    SMALLINT      NULL,
    [ReorderLevel]    SMALLINT      NULL
);


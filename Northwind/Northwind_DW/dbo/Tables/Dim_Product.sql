CREATE TABLE [dbo].[Dim_Product] (
    [ProductKey]   INT           IDENTITY (1, 1) NOT NULL,
    [ProductID]    INT           NULL,
    [ProductName]  NVARCHAR (40) NULL,
    [CategoryName] NVARCHAR (15) NULL,
    PRIMARY KEY CLUSTERED ([ProductKey] ASC)
);


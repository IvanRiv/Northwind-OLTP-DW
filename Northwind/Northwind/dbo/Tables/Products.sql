CREATE TABLE [dbo].[Products] (
    [ProductID]    INT           IDENTITY (1, 1) NOT NULL,
    [ProductName]  NVARCHAR (40) NOT NULL,
    [CategoryID]   INT           NULL,
    [UnitPrice]    MONEY         DEFAULT ((0)) NULL,
    [UnitsInStock] SMALLINT      DEFAULT ((0)) NULL,
    [Discontinued] BIT           DEFAULT ((0)) NOT NULL,
    PRIMARY KEY CLUSTERED ([ProductID] ASC),
    FOREIGN KEY ([CategoryID]) REFERENCES [dbo].[Categories] ([CategoryID])
);


CREATE TABLE [dbo].[OrderDetails] (
    [OrderID]   INT      NOT NULL,
    [ProductID] INT      NOT NULL,
    [UnitPrice] MONEY    NOT NULL,
    [Quantity]  SMALLINT NOT NULL,
    [Discount]  REAL     NOT NULL,
    PRIMARY KEY CLUSTERED ([OrderID] ASC, [ProductID] ASC),
    FOREIGN KEY ([OrderID]) REFERENCES [dbo].[Orders] ([OrderID]),
    FOREIGN KEY ([ProductID]) REFERENCES [dbo].[Products] ([ProductID])
);


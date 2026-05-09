CREATE TABLE [dbo].[Fact_Sales] (
    [SalesKey]    INT   IDENTITY (1, 1) NOT NULL,
    [ProductKey]  INT   NULL,
    [TimeKey]     INT   NULL,
    [Quantity]    INT   NULL,
    [TotalAmount] MONEY NULL,
    PRIMARY KEY CLUSTERED ([SalesKey] ASC),
    FOREIGN KEY ([ProductKey]) REFERENCES [dbo].[Dim_Product] ([ProductKey]),
    FOREIGN KEY ([TimeKey]) REFERENCES [dbo].[Dim_Time] ([TimeKey])
);


CREATE TABLE [dbo].[FactOrders] (
    [OrderID]         INT      NOT NULL,
    [ProductID]       INT      NOT NULL,
    [OrderDateKey]    INT      NOT NULL,
    [RequiredDateKey] INT      NOT NULL,
    [ShippedDateKey]  INT      NULL,
    [CustomerSK]      INT      NOT NULL,
    [ProductSK]       INT      NOT NULL,
    [EmployeeSK]      INT      NOT NULL,
    [ShipperSK]       INT      NOT NULL,
    [UnitPrice]       MONEY    NOT NULL,
    [Quantity]        SMALLINT NOT NULL,
    [Discount]        REAL     NOT NULL,
    [OrderDate]       DATETIME NULL,
    [RequiredDate]    DATETIME NULL,
    [ShippedDate]     DATETIME NULL,
    CONSTRAINT [PK_FactOrders] PRIMARY KEY CLUSTERED ([OrderID] ASC, [ProductID] ASC),
    CONSTRAINT [FK_FactOrders_DimCustomer] FOREIGN KEY ([CustomerSK]) REFERENCES [dbo].[DimCustomer] ([CustomerSK]),
    CONSTRAINT [FK_FactOrders_DimDate] FOREIGN KEY ([OrderDateKey]) REFERENCES [dbo].[DimDate] ([DateKey]),
    CONSTRAINT [FK_FactOrders_DimEmployee] FOREIGN KEY ([EmployeeSK]) REFERENCES [dbo].[DimEmployee] ([EmployeeSK]),
    CONSTRAINT [FK_FactOrders_DimProduct] FOREIGN KEY ([ProductSK]) REFERENCES [dbo].[DimProduct] ([ProductSK]),
    CONSTRAINT [FK_FactOrders_DimShipper] FOREIGN KEY ([ShipperSK]) REFERENCES [dbo].[DimShipper] ([ShipperSK])
);


CREATE TABLE [dbo].[Staging_FactOrders] (
    [OrderID]         INT       NULL,
    [ProductID]       INT       NULL,
    [CustomerID]      NCHAR (5) NULL,
    [EmployeeID]      INT       NULL,
    [ShipperID]       INT       NULL,
    [OrderDate]       DATETIME  NULL,
    [Quantity]        SMALLINT  NULL,
    [UnitPrice]       MONEY     NULL,
    [Discount]        REAL      NULL,
    [CustomerSK]      INT       NULL,
    [EmployeeSK]      INT       NULL,
    [ProductSK]       INT       NULL,
    [ShipperSK]       INT       NULL,
    [OrderDateKey]    INT       NULL,
    [RequiredDateKey] INT       NULL,
    [ShippedDateKey]  INT       NULL,
    [RequiredDate]    DATETIME  NULL,
    [ShippedDate]     DATETIME  NULL
);


CREATE TABLE [dbo].[Orders] (
    [OrderID]      INT        IDENTITY (1, 1) NOT NULL,
    [CustomerID]   NCHAR (5)  NULL,
    [EmployeeID]   INT        NULL,
    [OrderDate]    DATETIME   NULL,
    [ShipVia]      INT        NULL,
    [rowversion]   ROWVERSION NOT NULL,
    [RequiredDate] DATETIME   NULL,
    [ShippedDate]  DATETIME   NULL,
    PRIMARY KEY CLUSTERED ([OrderID] ASC),
    FOREIGN KEY ([CustomerID]) REFERENCES [dbo].[Customers] ([CustomerID]),
    FOREIGN KEY ([EmployeeID]) REFERENCES [dbo].[Employees] ([EmployeeID]),
    FOREIGN KEY ([ShipVia]) REFERENCES [dbo].[Shippers] ([ShipperID])
);


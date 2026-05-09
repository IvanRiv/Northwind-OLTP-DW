CREATE TABLE [dbo].[Orders] (
    [OrderID]     INT           IDENTITY (1, 1) NOT NULL,
    [CustomerID]  NCHAR (5)     NULL,
    [OrderDate]   DATETIME      NULL,
    [ShippedDate] DATETIME      NULL,
    [ShipCountry] NVARCHAR (15) NULL,
    [RowVer]      ROWVERSION    NOT NULL,
    PRIMARY KEY CLUSTERED ([OrderID] ASC),
    FOREIGN KEY ([CustomerID]) REFERENCES [dbo].[Customers] ([CustomerID])
);


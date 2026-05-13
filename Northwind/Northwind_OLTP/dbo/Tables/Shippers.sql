CREATE TABLE [dbo].[Shippers] (
    [ShipperID]   INT           IDENTITY (1, 1) NOT NULL,
    [CompanyName] NVARCHAR (40) NOT NULL,
    [Phone]       NVARCHAR (24) NULL,
    [rowversion]  ROWVERSION    NOT NULL,
    PRIMARY KEY CLUSTERED ([ShipperID] ASC)
);


CREATE TABLE [dbo].[Territories] (
    [TerritoryID]          NVARCHAR (20) NOT NULL,
    [TerritoryDescription] NCHAR (50)    NOT NULL,
    [RegionID]             INT           NOT NULL,
    [rowversion]           ROWVERSION    NOT NULL,
    PRIMARY KEY CLUSTERED ([TerritoryID] ASC),
    FOREIGN KEY ([RegionID]) REFERENCES [dbo].[Region] ([RegionID])
);


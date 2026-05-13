CREATE TABLE [dbo].[Region] (
    [RegionID]          INT        NOT NULL,
    [RegionDescription] NCHAR (50) NOT NULL,
    [rowversion]        ROWVERSION NOT NULL,
    PRIMARY KEY CLUSTERED ([RegionID] ASC)
);


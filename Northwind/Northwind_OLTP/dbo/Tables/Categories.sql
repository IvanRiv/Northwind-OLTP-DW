CREATE TABLE [dbo].[Categories] (
    [CategoryID]   INT           IDENTITY (1, 1) NOT NULL,
    [CategoryName] NVARCHAR (15) NOT NULL,
    [Description]  NTEXT         NULL,
    [rowversion]   ROWVERSION    NOT NULL,
    PRIMARY KEY CLUSTERED ([CategoryID] ASC)
);


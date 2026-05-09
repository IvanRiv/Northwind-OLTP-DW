CREATE TABLE [dbo].[Dim_Time] (
    [TimeKey] INT      NOT NULL,
    [Date]    DATETIME NULL,
    [Year]    INT      NULL,
    [Quarter] INT      NULL,
    [Month]   INT      NULL,
    PRIMARY KEY CLUSTERED ([TimeKey] ASC)
);


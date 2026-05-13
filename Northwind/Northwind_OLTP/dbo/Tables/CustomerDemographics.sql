CREATE TABLE [dbo].[CustomerDemographics] (
    [CustomerTypeID] NCHAR (10) NOT NULL,
    [CustomerDesc]   NTEXT      NULL,
    [rowversion]     ROWVERSION NOT NULL,
    PRIMARY KEY CLUSTERED ([CustomerTypeID] ASC)
);


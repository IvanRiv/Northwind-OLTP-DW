CREATE TABLE [dbo].[LastPackageRowVersion] (
    [Id]             INT           IDENTITY (1, 1) NOT NULL,
    [TableName]      NVARCHAR (50) NOT NULL,
    [LastRowVersion] BIGINT        NOT NULL,
    CONSTRAINT [PK_LastPackageRowVersion] PRIMARY KEY CLUSTERED ([Id] ASC)
);


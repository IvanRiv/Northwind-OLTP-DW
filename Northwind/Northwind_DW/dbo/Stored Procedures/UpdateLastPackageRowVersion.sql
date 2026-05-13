
CREATE PROCEDURE [dbo].[UpdateLastPackageRowVersion] (@tableName NVARCHAR(50), @lastRowVersion BIGINT) AS 
BEGIN 
    IF EXISTS (SELECT 1 FROM [dbo].[LastPackageRowVersion] WHERE TableName = @tableName)
        UPDATE [dbo].[LastPackageRowVersion] SET LastRowVersion = @lastRowVersion WHERE TableName = @tableName;
    ELSE
        INSERT INTO [dbo].[LastPackageRowVersion] (TableName, LastRowVersion) VALUES (@tableName, @lastRowVersion);
END

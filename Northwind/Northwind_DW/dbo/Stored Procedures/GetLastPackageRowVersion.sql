
-- Control de Versiones [4]
CREATE PROCEDURE [dbo].[GetLastPackageRowVersion] (@tableName NVARCHAR(50)) AS 
BEGIN 
    SELECT LastRowVersion FROM [dbo].[LastPackageRowVersion] WHERE TableName = @tableName; 
END

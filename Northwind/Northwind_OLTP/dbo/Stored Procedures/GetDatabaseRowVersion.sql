
-- Este procedimiento DEBE devolver un valor. Si está vacío, el ETL falla.
CREATE   PROCEDURE [dbo].[GetDatabaseRowVersion] AS 
BEGIN 
    SET NOCOUNT ON; 
    SELECT MIN_ACTIVE_ROWVERSION() - 1; 
END 


CREATE PROCEDURE [dbo].[FillDimDate]
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @StartDate DATE = '1996-01-01'; -- Fecha de inicio de Northwind
    DECLARE @EndDate DATE = '1998-12-31';   -- Fecha de fin de Northwind
    
    WHILE @StartDate <= @EndDate
    BEGIN
        INSERT INTO [dbo].[DimDate] ([DateKey], [FullDate], [Year], [Quarter], [Month], [MonthName], [Day])
        SELECT 
            CONVERT(INT, FORMAT(@StartDate, 'yyyyMMdd')),
            @StartDate,
            YEAR(@StartDate),
            DATEPART(QUARTER, @StartDate),
            MONTH(@StartDate),
            DATENAME(MONTH, @StartDate),
            DAY(@StartDate)
        WHERE NOT EXISTS (SELECT 1 FROM [dbo].[DimDate] WHERE [FullDate] = @StartDate);
        
        SET @StartDate = DATEADD(DAY, 1, @StartDate);
    END
END

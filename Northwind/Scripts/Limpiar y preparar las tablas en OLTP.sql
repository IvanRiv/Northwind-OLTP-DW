USE [Northwind_OLTP];
GO

-- 1. Preparar tabla Customers
DECLARE @oldNameCust NVARCHAR(128) = (SELECT name FROM sys.columns WHERE object_id = OBJECT_ID('Customers') AND system_type_id = 189);
IF @oldNameCust IS NOT NULL
BEGIN
    IF @oldNameCust <> 'rowversion'
    BEGIN
        DECLARE @renameCust NVARCHAR(256) = 'Customers.' + @oldNameCust;
        EXEC sp_rename @renameCust, 'rowversion', 'COLUMN';
    END
END
ELSE 
BEGIN
    ALTER TABLE Customers ADD [rowversion] rowversion;
END
GO

-- 2. Preparar tabla Products
DECLARE @oldNameProd NVARCHAR(128) = (SELECT name FROM sys.columns WHERE object_id = OBJECT_ID('Products') AND system_type_id = 189);
IF @oldNameProd IS NOT NULL
BEGIN
    IF @oldNameProd <> 'rowversion'
    BEGIN
        DECLARE @renameProd NVARCHAR(256) = 'Products.' + @oldNameProd;
        EXEC sp_rename @renameProd, 'rowversion', 'COLUMN';
    END
END
ELSE 
BEGIN
    ALTER TABLE Products ADD [rowversion] rowversion;
END
GO

-- 3. Preparar tabla OrderDetails
DECLARE @oldNameOD NVARCHAR(128) = (SELECT name FROM sys.columns WHERE object_id = OBJECT_ID('OrderDetails') AND system_type_id = 189);
IF @oldNameOD IS NOT NULL
BEGIN
    IF @oldNameOD <> 'rowversion'
    BEGIN
        DECLARE @renameOD NVARCHAR(256) = 'OrderDetails.' + @oldNameOD;
        EXEC sp_rename @renameOD, 'rowversion', 'COLUMN';
    END
END
ELSE 
BEGIN
    ALTER TABLE OrderDetails ADD [rowversion] rowversion;
END
GO
USE [Northwind_DW];
GO

-- 1. LIMPIEZA TOTAL
TRUNCATE TABLE [dbo].[FactOrders];
DELETE FROM [dbo].[DimProduct];
DELETE FROM [dbo].[DimCustomer];
DELETE FROM [dbo].[DimEmployee];
DELETE FROM [dbo].[DimShipper];
DELETE FROM [dbo].[DimDate];

-- Reiniciar contadores
DBCC CHECKIDENT ('[dbo].[DimProduct]', RESEED, 0);
DBCC CHECKIDENT ('[dbo].[DimCustomer]', RESEED, 0);
DBCC CHECKIDENT ('[dbo].[DimEmployee]', RESEED, 0);
DBCC CHECKIDENT ('[dbo].[DimShipper]', RESEED, 0);

-- Limpiar Staging y Versiones
TRUNCATE TABLE [dbo].[Staging_FactOrders];
TRUNCATE TABLE [dbo].[Staging_Customer];
TRUNCATE TABLE [dbo].[Staging_Employee];
TRUNCATE TABLE [dbo].[Staging_Product];
TRUNCATE TABLE [dbo].[Staging_Shipper];
TRUNCATE TABLE [dbo].[LastPackageRowVersion];

USE [Northwind_DW];
GO

-- Insertamos el punto de partida (0) para cada flujo del ETL
INSERT INTO [dbo].[LastPackageRowVersion] (TableName, LastRowVersion)
VALUES 
('Customers', 0),
('Employees', 0),
('Products', 0),
('Shippers', 0),
('Orders', 0);

PRINT 'Tabla de control inicializada';
GO
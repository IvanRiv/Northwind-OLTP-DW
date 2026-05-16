USE Northwind_OLTP;
GO

-- 1. LIMPIEZA TOTAL (Para evitar duplicados y errores de FK)
DELETE FROM [dbo].[Order Details];
DELETE FROM [dbo].[Orders];
DELETE FROM [dbo].[Products];
DELETE FROM [dbo].[Employees];
DELETE FROM [dbo].[Customers];
DELETE FROM [dbo].[Shippers];
DELETE FROM [dbo].[Suppliers];
DELETE FROM [dbo].[Categories];
DELETE FROM [dbo].[Region];
DELETE FROM [dbo].[EmployeeTerritories];
DELETE FROM [dbo].[Territories];
GO

-- 2. POBLAR TABLAS MAESTRAS (Usando IDENTITY_INSERT para mantener IDs originales)
SET IDENTITY_INSERT [dbo].[Categories] ON;
INSERT INTO [dbo].[Categories] ([CategoryID], [CategoryName], [Description])
SELECT [CategoryID], [CategoryName], [Description] FROM Northwind.[dbo].[Categories];
SET IDENTITY_INSERT [dbo].[Categories] OFF;

SET IDENTITY_INSERT [dbo].[Suppliers] ON;
INSERT INTO [dbo].[Suppliers] ([SupplierID], [CompanyName], [ContactName])
SELECT [SupplierID], [CompanyName], [ContactName] FROM Northwind.[dbo].[Suppliers];
SET IDENTITY_INSERT [dbo].[Suppliers] OFF;

SET IDENTITY_INSERT [dbo].[Shippers] ON;
INSERT INTO [dbo].[Shippers] ([ShipperID], [CompanyName], [Phone])
SELECT [ShipperID], [CompanyName], [Phone] FROM Northwind.[dbo].[Shippers];
SET IDENTITY_INSERT [dbo].[Shippers] OFF;

-- 3. POBLAR CLIENTES Y EMPLEADOS
INSERT INTO [dbo].[Customers] ([CustomerID], [CompanyName], [ContactName], [ContactTitle], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax])
SELECT [CustomerID], [CompanyName], [ContactName], [ContactTitle], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax] FROM Northwind.[dbo].[Customers];

SET IDENTITY_INSERT [dbo].[Employees] ON;
INSERT INTO [dbo].[Employees] ([EmployeeID], [LastName], [FirstName], [Title], [TitleOfCourtesy], [BirthDate], [HireDate], [Address], [City], [Region], [PostalCode], [Country], [HomePhone], [Extension], [Notes], [ReportsTo], [PhotoPath])
SELECT [EmployeeID], [LastName], [FirstName], [Title], [TitleOfCourtesy], [BirthDate], [HireDate], [Address], [City], [Region], [PostalCode], [Country], [HomePhone], [Extension], [Notes], [ReportsTo], [PhotoPath] FROM Northwind.[dbo].[Employees];
SET IDENTITY_INSERT [dbo].[Employees] OFF;

-- 4. POBLAR PRODUCTOS
SET IDENTITY_INSERT [dbo].[Products] ON;
INSERT INTO [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued])
SELECT [ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued] FROM Northwind.[dbo].[Products];
SET IDENTITY_INSERT [dbo].[Products] OFF;

-- 5. POBLAR ÓRDENES
SET IDENTITY_INSERT [dbo].[Orders] ON;
INSERT INTO [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia])
SELECT [OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia] FROM Northwind.[dbo].[Orders];
SET IDENTITY_INSERT [dbo].[Orders] OFF;

-- 6. POBLAR DETALLES DE ORDEN (Sintaxis corregida con corchetes obligatorios)
INSERT INTO [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount])
SELECT [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount] 
FROM NorthWind.[dbo].[OrderDetails]; 
GO

-- 7. Poblar REGION
INSERT INTO [dbo].[Region] ([RegionID], [RegionDescription])
SELECT [RegionID], [RegionDescription] FROM Northwind.[dbo].[Region];

-- 8. Poblar TERRITORIES
INSERT INTO [dbo].[Territories] ([TerritoryID], [TerritoryDescription], [RegionID])
SELECT [TerritoryID], [TerritoryDescription], [RegionID] FROM Northwind.[dbo].[Territories];

-- 9. Poblar EMPLOYEETERRITORIES
INSERT INTO [dbo].[EmployeeTerritories] ([EmployeeID], [TerritoryID])
SELECT [EmployeeID], [TerritoryID] FROM Northwind.[dbo].[EmployeeTerritories];
GO
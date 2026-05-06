USE [Northwind_DW];
GO

-- Dimensión Tiempo
CREATE TABLE Dim_Time (
    TimeKey INT PRIMARY KEY,
    Date DATETIME,
    Year INT,
    Quarter INT,
    Month INT
);

-- Dimensión Producto (Desnormalizada para el DW [8])
CREATE TABLE Dim_Product (
    ProductKey INT PRIMARY KEY IDENTITY(1,1),
    ProductID INT,
    ProductName NVARCHAR(40),
    CategoryName NVARCHAR(15)
);

-- Tabla de Hechos (Ventas)
-- Incluye métricas como ExtendedPrice mencionada en tus fuentes [5, 9]
CREATE TABLE Fact_Sales (
    SalesKey INT PRIMARY KEY IDENTITY(1,1),
    ProductKey INT FOREIGN KEY REFERENCES Dim_Product(ProductKey),
    TimeKey INT FOREIGN KEY REFERENCES Dim_Time(TimeKey),
    Quantity INT,
    TotalAmount MONEY -- Calculado como (UnitPrice * Quantity * (1-Discount)) [5]
);
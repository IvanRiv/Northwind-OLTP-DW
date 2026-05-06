USE [Northwind_OLTP];
GO

-- 1. Tabla Categorías
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY IDENTITY(1,1),
    CategoryName NVARCHAR(15) NOT NULL,
    Description NVARCHAR(MAX)
);

-- 2. Tabla Productos (Relacionada con Categorías [2, 3])
CREATE TABLE Products (
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    ProductName NVARCHAR(40) NOT NULL,
    CategoryID INT FOREIGN KEY REFERENCES Categories(CategoryID),
    UnitPrice MONEY DEFAULT 0,
    UnitsInStock SMALLINT DEFAULT 0,
    Discontinued BIT NOT NULL DEFAULT 0
);

-- 3. Tabla Clientes [1, 4]
CREATE TABLE Customers (
    CustomerID NCHAR(5) PRIMARY KEY,
    CompanyName NVARCHAR(40) NOT NULL,
    City NVARCHAR(15),
    Country NVARCHAR(15)
);

-- 4. Tabla Órdenes [2, 4]
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID NCHAR(5) FOREIGN KEY REFERENCES Customers(CustomerID),
    OrderDate DATETIME,
    ShippedDate DATETIME,
    ShipCountry NVARCHAR(15)
);

-- 5. Detalles de Órdenes [3, 5]
CREATE TABLE OrderDetails (
    OrderID INT FOREIGN KEY REFERENCES Orders(OrderID),
    ProductID INT FOREIGN KEY REFERENCES Products(ProductID),
    UnitPrice MONEY NOT NULL,
    Quantity SMALLINT NOT NULL,
    Discount REAL NOT NULL,
    PRIMARY KEY (OrderID, ProductID)
);
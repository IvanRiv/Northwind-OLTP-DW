USE [Northwind_OLTP];
GO

-- 1. CARGA DE CATEGORÍAS (20 registros)
INSERT INTO Categories (CategoryName, Description) VALUES 
('Beverages', 'Soft drinks, coffees, teas, beers, and ales'),
('Condiments', 'Sweet and savory sauces, relishes, spreads, and seasonings'),
('Confections', 'Desserts, candies, and sweet breads'),
('Dairy Products', 'Cheeses'),
('Grains/Cereals', 'Breads, crackers, pasta, and cereal'),
('Meat/Poultry', 'Prepared meats'),
('Produce', 'Dried fruit and bean curd'),
('Seafood', 'Seaweed and fish'),
('Snacks', 'Chips, crackers, and nuts'),
('Frozen Foods', 'Ready-to-eat frozen meals'),
('Bakery', 'Fresh breads and pastries'),
('Beverages Int', 'Imported spirits and wines'),
('Organic', 'Certified organic produce'),
('Deli', 'Salami, ham, and premium cold cuts'),
('Baking Goods', 'Flour, sugar, and baking mixes'),
('Pet Food', 'Nutrition for dogs and cats'),
('Household', 'Cleaning supplies and paper goods'),
('Personal Care', 'Soaps and shampoos'),
('Baby Products', 'Diapers and baby food'),
('Canned Goods', 'Preserved vegetables and soups');

-- 2. CARGA DE CLIENTES (20 registros)
INSERT INTO Customers (CustomerID, CompanyName, City, Country) VALUES 
('ALFKI', 'Alfreds Futterkiste', 'Berlin', 'Germany'),
('ANATR', 'Ana Trujillo Emparedados', 'México D.F.', 'Mexico'),
('ANTON', 'Antonio Moreno Taquería', 'México D.F.', 'Mexico'),
('AROUT', 'Around the Horn', 'London', 'UK'),
('BERGS', 'Berglunds snabbköp', 'Luleå', 'Sweden'),
('BLAUS', 'Blauer See Delikatessen', 'Mannheim', 'Germany'),
('BLONP', 'Blondesddsl père et fils', 'Strasbourg', 'France'),
('BOLID', 'Bólido Comidas preparadas', 'Madrid', 'Spain'),
('BONAP', 'Bon app', 'Marseille', 'France'),
('BOTTM', 'Bottom-Dollar Markets', 'Tsawwassen', 'Canada'),
('BSBEV', 'B''s Beverages', 'London', 'UK'),
('CACTU', 'Cactus Comidas para llevar', 'Buenos Aires', 'Argentina'),
('CENTC', 'Centro comercial Moctezuma', 'México D.F.', 'Mexico'),
('CHOPS', 'Chop-suey Chinese', 'Bern', 'Switzerland'),
('COMMI', 'Comércio Mineiro', 'Sao Paulo', 'Brazil'),
('CONSH', 'Consolidated Holdings', 'London', 'UK'),
('DRACD', 'Drachenblut Delikatessen', 'Aachen', 'Germany'),
('DUMON', 'Du monde entier', 'Nantes', 'France'),
('EASTC', 'Eastern Connection', 'London', 'UK'),
('ERNSH', 'Ernst Handel', 'Graz', 'Austria');

-- 3. CARGA DE PRODUCTOS (20 registros relacionados con categorías)
INSERT INTO Products (ProductName, CategoryID, UnitPrice, UnitsInStock, Discontinued) VALUES 
('Chai', 1, 18.00, 39, 0),
('Chang', 1, 19.00, 17, 0),
('Aniseed Syrup', 2, 10.00, 13, 0),
('Chef Anton Cajun Seasoning', 2, 22.00, 53, 0),
('Chef Anton Gumbo Mix', 2, 21.35, 0, 1),
('Grandma Boysenberry Spread', 2, 25.00, 120, 0),
('Uncle Bob Organic Pears', 7, 30.00, 15, 0),
('Northwoods Cranberry Sauce', 2, 40.00, 6, 0),
('Mishi Kobe Niku', 6, 97.00, 29, 1),
('Ikura', 8, 31.00, 31, 0),
('Queso Cabrales', 4, 21.00, 22, 0),
('Queso Manchego La Pastora', 4, 38.00, 86, 0),
('Konbu', 8, 6.00, 24, 0),
('Tofu', 7, 23.25, 35, 0),
('Genen Shouyu', 2, 15.50, 39, 0),
('Pavlova', 3, 17.45, 29, 0),
('Alice Mutton', 6, 39.00, 0, 1),
('Carnarvon Tigers', 8, 62.50, 42, 0),
('Teatime Chocolate Biscuits', 3, 9.20, 25, 0),
('Sir Rodneys Marmalade', 3, 81.00, 40, 0);

-- 4. CARGA DE ÓRDENES (20 registros relacionados con clientes)
INSERT INTO Orders (CustomerID, OrderDate, ShippedDate, ShipCountry) VALUES 
('ALFKI', '2026-01-01', '2026-01-03', 'Germany'),
('ANATR', '2026-01-05', '2026-01-07', 'Mexico'),
('ANTON', '2026-01-10', '2026-01-12', 'Mexico'),
('AROUT', '2026-01-15', '2026-01-17', 'UK'),
('BERGS', '2026-01-20', '2026-01-22', 'Sweden'),
('BLAUS', '2026-01-25', '2026-01-27', 'Germany'),
('BLONP', '2026-02-01', '2026-02-03', 'France'),
('BOLID', '2026-02-05', '2026-02-07', 'Spain'),
('BONAP', '2026-02-10', '2026-02-12', 'France'),
('BOTTM', '2026-02-15', '2026-02-17', 'Canada'),
('BSBEV', '2026-02-20', '2026-02-22', 'UK'),
('CACTU', '2026-02-25', '2026-02-27', 'Argentina'),
('CENTC', '2026-03-01', '2026-03-03', 'Mexico'),
('CHOPS', '2026-03-05', '2026-03-07', 'Switzerland'),
('COMMI', '2026-03-10', '2026-03-12', 'Brazil'),
('CONSH', '2026-03-15', '2026-03-17', 'UK'),
('DRACD', '2026-03-20', '2026-03-22', 'Germany'),
('DUMON', '2026-03-25', '2026-03-27', 'France'),
('EASTC', '2026-04-01', '2026-04-03', 'UK'),
('ERNSH', '2026-04-05', '2026-04-07', 'Austria');

-- 5. DETALLES DE LAS ÓRDENES (Mínimo 20 líneas de detalle)
INSERT INTO OrderDetails (OrderID, ProductID, UnitPrice, Quantity, Discount) VALUES 
(1, 1, 18.00, 10, 0), (1, 2, 19.00, 5, 0.1),
(2, 3, 10.00, 20, 0), (2, 4, 22.00, 2, 0),
(3, 5, 21.35, 1, 0), (3, 6, 25.00, 10, 0.05),
(4, 7, 30.00, 5, 0), (5, 8, 40.00, 2, 0),
(6, 9, 97.00, 1, 0), (7, 10, 31.00, 15, 0.15),
(8, 11, 21.00, 10, 0), (9, 12, 38.00, 4, 0),
(10, 13, 6.00, 100, 0.2), (11, 14, 23.25, 2, 0),
(12, 15, 15.50, 6, 0), (13, 16, 17.45, 12, 0.1),
(14, 17, 39.00, 3, 0), (15, 18, 62.50, 1, 0),
(16, 19, 9.20, 20, 0), (17, 20, 81.00, 5, 0);
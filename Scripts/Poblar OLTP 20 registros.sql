USE [Northwind_OLTP];
GO

-- 1. INSERTAR 20 TRANSPORTISTAS (SHIPPERS)
-- Columnas: CompanyName, Phone [5]
INSERT INTO [dbo].[Shippers] ([CompanyName], [Phone])
VALUES 
('Envios Rápidos S.A.', '(501) 555-1001'), ('Transportes del Sur', '(501) 555-1002'),
('Logística Global', '(501) 555-1003'), ('Carga Segura', '(501) 555-1004'),
('Distribuidora Ágil', '(501) 555-1005'), ('Express Nacional', '(501) 555-1006'),
('Fletes Modernos', '(501) 555-1007'), ('Paquetería Estrella', '(501) 555-1008'),
('Rutas de Iberoamérica', '(501) 555-1009'), ('Transporte Continental', '(501) 555-1010'),
('Mensajería del Norte', '(501) 555-1011'), ('Cargas del Pacífico', '(501) 555-1012'),
('Logística Integrada', '(501) 555-1013'), ('Envíos Express Bol', '(501) 555-1014'),
('Transporte Transfronterizo', '(501) 555-1015'), ('Carga y Descarga S.R.L.', '(501) 555-1016'),
('Flota Comercial', '(501) 555-1017'), ('Servicio Postal Gourmet', '(501) 555-1018'),
('Logística 24/7', '(501) 555-1019'), ('Transportes Unidos', '(501) 555-1020');

-- 2. INSERTAR 20 EMPLEADOS
-- Columnas principales: LastName, FirstName, Title, BirthDate, HireDate, Address, City, Country [3]
INSERT INTO [dbo].[Employees] ([LastName], [FirstName], [Title], [BirthDate], [HireDate], [Address], [City], [Region], [PostalCode], [Country], [HomePhone])
VALUES 
('Mendoza', 'Sara', 'Ventas', '1985-03-12', '2010-05-01', 'Av. Busch 450', 'La Paz', 'LP', '0000', 'Bolivia', '2244661'),
('Vargas', 'Ricardo', 'Coordinador', '1988-07-22', '2012-10-10', 'Calle Murillo 12', 'Madrid', 'MD', '28001', 'Spain', '9155512'),
('García', 'Elena', 'Representante', '1990-01-15', '2015-03-01', 'Serrano 100', 'Madrid', 'MD', '28006', 'Spain', '9155533'),
('Paz', 'Lucho', 'Gerente', '1975-11-30', '1998-06-15', 'Av. Larco 88', 'Lima', 'LIM', '15046', 'Peru', '0144551'),
('Soria', 'Ana', 'Asistente', '1992-05-20', '2018-01-20', 'Florida 10', 'Buenos Aires', 'BA', '1005', 'Argentina', '1144551'),
('Ramos', 'Pedro', 'Ventas', '1980-08-10', '2005-09-12', 'Reforma 50', 'México DF', 'DF', '06000', 'Mexico', '5511221'),
('López', 'Marta', 'Logística', '1987-12-05', '2013-04-18', 'Paseo de Gracia', 'Barcelona', 'CT', '08007', 'Spain', '9355522'),
('Silva', 'Roberto', 'Ventas', '1983-06-25', '2009-11-30', 'Av. Atlántica', 'Rio', 'RJ', '22010', 'Brazil', '2198811'),
('Castillo', 'Julia', 'Admin', '1995-02-14', '2020-07-01', 'Arequipa 300', 'Lima', 'LIM', '15047', 'Peru', '0144559'),
('Díaz', 'Carlos', 'Ventas', '1982-04-03', '2008-02-15', 'Santa Fe 1200', 'Rosario', 'SF', '2000', 'Argentina', '3415551'),
('Torres', 'Sofía', 'Representante', '1991-09-18', '2016-12-01', 'Apoquindo 4000', 'Santiago', 'RM', '7550000', 'Chile', '2255511'),
('Ruiz', 'Hugo', 'Supervisor', '1978-10-22', '2002-05-14', 'Chapultepec 20', 'Guadalajara', 'JC', '44100', 'Mexico', '3311221'),
('Ortega', 'Lucía', 'Ventas', '1989-11-11', '2014-08-05', 'Calle Mayor 5', 'Valencia', 'VC', '46001', 'Spain', '9635511'),
('Morales', 'Javier', 'Analista', '1986-01-30', '2011-03-25', 'Paseo Colón', 'San José', 'SJ', '10101', 'Costa Rica', '2255112'),
('Pinto', 'Fernanda', 'Ventas', '1993-07-07', '2019-06-10', 'Alameda 50', 'Santiago', 'RM', '8320000', 'Chile', '2266611'),
('Rojas', 'Gabriel', 'Distribución', '1981-12-25', '2006-01-15', 'Calle Real 100', 'Quito', 'PI', '170150', 'Ecuador', '0225551'),
('Vega', 'Isabel', 'Ventas', '1984-05-15', '2010-09-01', 'Carrera 7', 'Bogotá', 'DC', '110111', 'Colombia', '1445511'),
('Suarez', 'Daniel', 'Representante', '1990-08-30', '2017-02-14', 'Av. 18 de Julio', 'Montevideo', 'MO', '11000', 'Uruguay', '2400112'),
('Brito', 'Alicia', 'Ventas', '1994-03-15', '2021-01-10', 'Calle 50', 'Panamá', 'PA', '0801', 'Panama', '2631122'),
('Campos', 'Luis', 'Soporte', '1979-02-28', '2004-11-20', 'Malecon 2000', 'Guayaquil', 'GU', '090101', 'Ecuador', '0425551');

-- 3. INSERTAR 20 PRODUCTOS
-- Columnas: ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, Discontinued [4]
-- Usamos SupplierID 1 y CategoryID 1 para asegurar consistencia
INSERT INTO [dbo].[Products] ([ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued])
VALUES 
('Aceite de Oliva Extra', 1, 2, 'Botella 1L', 25.50, 100, 0, 10, 0),
('Café Tostado Premium', 1, 1, 'Bolsa 500g', 18.00, 50, 0, 5, 0),
('Mermelada de Fresa Nat.', 1, 3, 'Frasco 250g', 12.25, 80, 0, 20, 0),
('Vino Tinto Reserva', 1, 1, 'Botella 750ml', 45.00, 30, 0, 5, 0),
('Queso Manchego Curado', 1, 4, 'Pieza 1kg', 22.00, 40, 0, 10, 0),
('Arroz Integral Orgánico', 1, 5, 'Bolsa 1kg', 8.50, 200, 0, 50, 0),
('Chocolate Amargo 70%', 1, 3, 'Barra 100g', 5.50, 150, 0, 30, 0),
('Pasta de Trigo Duro', 1, 5, 'Caja 500g', 3.75, 120, 0, 40, 0),
('Aceitunas Rellenas', 1, 2, 'Lata 200g', 4.25, 90, 0, 20, 0),
('Té Verde en Hebras', 1, 1, 'Caja 100g', 10.00, 60, 0, 15, 0),
('Salsa de Tomate Casera', 1, 2, 'Frasco 400g', 6.80, 70, 0, 15, 0),
('Harina de Avena', 1, 5, 'Bolsa 1kg', 7.20, 110, 0, 25, 0),
('Galletas de Avena', 1, 3, 'Paquete 200g', 4.50, 130, 0, 35, 0),
('Vinagre Balsámico', 1, 2, 'Botella 250ml', 14.00, 45, 0, 10, 0),
('Sal de Mar Fina', 1, 2, 'Bote 500g', 2.90, 300, 0, 100, 0),
('Miel de Abeja Pura', 1, 3, 'Frasco 500g', 16.50, 55, 0, 15, 0),
('Lentejas Seleccionadas', 1, 5, 'Bolsa 1kg', 5.30, 140, 0, 40, 0),
('Jugo de Naranja Nat.', 1, 1, 'Envase 1L', 9.00, 85, 0, 20, 0),
('Garbanzos Secos', 1, 5, 'Bolsa 1kg', 4.80, 160, 0, 50, 0),
('Pimentón de la Vera', 1, 2, 'Lata 75g', 11.20, 40, 0, 10, 0);

-- 4. ÓRDENES Y DETALLES (Rango 1996-1998)
-- Generamos 20 órdenes vinculando los datos anteriores
DECLARE @o INT = 1;
DECLARE @Fecha DATE = '1997-02-01';
WHILE @o <= 20
BEGIN
    INSERT INTO [dbo].[Orders] ([CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia])
    VALUES (
        (SELECT TOP 1 CustomerID FROM Customers), 
        (SELECT TOP 1 EmployeeID FROM Employees WHERE LastName = 'Mendoza'), 
        @Fecha, DATEADD(DAY, 15, @Fecha), DATEADD(DAY, 5, @Fecha), 
        (SELECT TOP 1 ShipperID FROM Shippers ORDER BY NEWID())
    );
    
    INSERT INTO [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount])
    VALUES (
        SCOPE_IDENTITY(), 
        (SELECT TOP 1 ProductID FROM Products WHERE ProductName LIKE '%Aceite%'), 
        25.50, 5, 0
    );
    SET @Fecha = DATEADD(DAY, 10, @Fecha);
    SET @o = @o + 1;
END
GO
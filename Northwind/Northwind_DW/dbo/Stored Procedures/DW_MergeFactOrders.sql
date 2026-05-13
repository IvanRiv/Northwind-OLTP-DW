
CREATE   PROCEDURE [dbo].[DW_MergeFactOrders] AS 
BEGIN 
    SET NOCOUNT ON; 
    MERGE [dbo].[FactOrders] AS Target 
    USING [dbo].[Staging_FactOrders] AS Source 
    ON Target.[OrderID] = Source.[OrderID] AND Target.[ProductID] = Source.[ProductID]
    
    WHEN MATCHED THEN 
        UPDATE SET 
            Target.[UnitPrice] = Source.[UnitPrice], 
            Target.[Quantity] = Source.[Quantity], 
            Target.[Discount] = Source.[Discount],
            Target.[OrderDateKey] = Source.[OrderDateKey],
            Target.[RequiredDateKey] = Source.[RequiredDateKey],
            Target.[ShippedDateKey] = Source.[ShippedDateKey],
            -- ESTAS LÍNEAS SON LAS QUE FALTABAN:
            Target.[OrderDate] = Source.[OrderDate],
            Target.[RequiredDate] = Source.[RequiredDate],
            Target.[ShippedDate] = Source.[ShippedDate]
            
    WHEN NOT MATCHED THEN 
        INSERT ([OrderID], [ProductID], [CustomerSK], [EmployeeSK], [ProductSK], [ShipperSK], 
                [OrderDateKey], [RequiredDateKey], [ShippedDateKey], [UnitPrice], [Quantity], [Discount],
                -- COLUMNAS DE DESTINO:
                [OrderDate], [RequiredDate], [ShippedDate]) 
        VALUES (Source.[OrderID], Source.[ProductID], Source.[CustomerSK], Source.[EmployeeSK], 
                Source.[ProductSK], Source.[ShipperSK], Source.[OrderDateKey], 
                Source.[RequiredDateKey], Source.[ShippedDateKey], Source.[UnitPrice], 
                Source.[Quantity], Source.[Discount],
                -- VALORES DEL STAGING:
                Source.[OrderDate], Source.[RequiredDate], Source.[ShippedDate]); 
END 


CREATE   PROCEDURE [dbo].[DW_MergeDimProduct] AS 
BEGIN 
    SET NOCOUNT ON;
    MERGE [dbo].[DimProduct] AS Target 
    USING [dbo].[Staging_Product] AS Source ON Target.[ProductID] = Source.[ProductID] 
    WHEN MATCHED THEN 
        UPDATE SET 
            Target.[ProductName] = Source.[ProductName], 
            Target.[CategoryName] = Source.[CategoryName], 
            Target.[CompanyName] = Source.[SupplierName], -- Mapeo de proveedor
            Target.[UnitPrice] = Source.[UnitPrice],
            Target.[QuantityPerUnit] = Source.[QuantityPerUnit],
            Target.[UnitsInStock] = Source.[UnitsInStock],
            Target.[Discontinued] = Source.[Discontinued]
    WHEN NOT MATCHED THEN 
        INSERT ([ProductID], [ProductName], [CategoryName], [CompanyName], [UnitPrice], [QuantityPerUnit], [UnitsInStock], [Discontinued]) 
        VALUES (Source.[ProductID], Source.[ProductName], Source.[CategoryName], Source.[SupplierName], Source.[UnitPrice], Source.[QuantityPerUnit], Source.[UnitsInStock], Source.[Discontinued]); 
END

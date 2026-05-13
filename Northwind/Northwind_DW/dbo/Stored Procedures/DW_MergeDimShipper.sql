
CREATE   PROCEDURE [dbo].[DW_MergeDimShipper] AS 
BEGIN 
    SET NOCOUNT ON;
    MERGE [dbo].[DimShipper] AS Target 
    USING [dbo].[Staging_Shipper] AS Source ON Target.[ShipperID] = Source.[ShipperID] 
    WHEN MATCHED THEN 
        UPDATE SET 
            Target.[CompanyName] = Source.[CompanyName], 
            Target.[Phone] = Source.[Phone] 
    WHEN NOT MATCHED THEN 
        INSERT ([ShipperID], [CompanyName], [Phone]) 
        VALUES (Source.[ShipperID], Source.[CompanyName], Source.[Phone]); 
END

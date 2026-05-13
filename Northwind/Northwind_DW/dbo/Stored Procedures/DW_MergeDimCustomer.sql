
CREATE   PROCEDURE [dbo].[DW_MergeDimCustomer] AS 
BEGIN 
    SET NOCOUNT ON;
    MERGE [dbo].[DimCustomer] AS Target 
    USING [dbo].[Staging_Customer] AS Source ON Target.[CustomerID] = Source.[CustomerID] 
    WHEN MATCHED THEN 
        UPDATE SET 
            Target.[CompanyName] = Source.[CompanyName], 
            Target.[ContactName] = Source.[ContactName], 
            Target.[ContactTitle] = Source.[ContactTitle],
            Target.[Address] = Source.[Address],
            Target.[City] = Source.[City],
            Target.[Region] = Source.[Region],
            Target.[PostalCode] = Source.[PostalCode],
            Target.[Country] = Source.[Country],
            Target.[Phone] = Source.[Phone],
            Target.[Fax] = Source.[Fax]
    WHEN NOT MATCHED THEN 
        INSERT ([CustomerID], [CompanyName], [ContactName], [ContactTitle], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax]) 
        VALUES (Source.[CustomerID], Source.[CompanyName], Source.[ContactName], Source.[ContactTitle], Source.[Address], Source.[City], Source.[Region], Source.[PostalCode], Source.[Country], Source.[Phone], Source.[Fax]); 
END

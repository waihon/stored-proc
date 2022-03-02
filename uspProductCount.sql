ALTER PROCEDURE uspProductCount
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @product_count AS INT;

    SET @product_count = (
        SELECT
            COUNT(*)
        FROM
            production.products
    );

    PRINT 'The number of products is ' + CAST(@product_count AS VARCHAR(MAX));
END;

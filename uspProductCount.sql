CREATE PROCEDURE uspProductCount
AS
BEGIN
    DECLARE @product_count AS INT;

    SET @product_count = (
        SELECT
            COUNT(*)
        FROM
            production.products
    );

    PRINT 'The number of products is ' + CAST(@product_count AS VARCHAR(MAX));
END;

CREATE PROCEDURE uspProductCursor
AS
BEGIN
    DECLARE
        @product_name VARCHAR(MAX),
        @list_price DECIMAL;

    DECLARE product_cursor CURSOR
    FOR SELECT
            product_name,
            list_price
        FROM
            production.products;

    OPEN product_cursor;

    FETCH NEXT FROM product_cursor INTO
        @product_name,
        @list_price;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        PRINT @product_name + CAST(@list_price AS VARCHAR);
        FETCH NEXT FROM product_cursor INTO
            @product_name,
            @list_price;
    END;

    CLOSE product_cursor;

    DEALLOCATE product_cursor;
END;

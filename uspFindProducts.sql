/***
    EXECUTE uspFindProducts
        @min_list_price = 900,
        @max_list_price = 1000,
        @name = 'Trek';
*/
ALTER PRECEDURE uspFindProducts(
    @min_list_price AS DECIMAL,
    @max_list_price AS DECIMAL,
    @name AS VARCHAR(MAX)
)
AS
BEGIN
    SELECT
        product_name,
        list_price
    FROM
        production.products

    WHERE
        list_price >= @min_list_price AND
        list_price <= @max_list_price AND
        product_name LIKE '%' + @name + '%'
    ORDER BY
        list_price;
END;

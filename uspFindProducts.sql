/***
    @min_list_price and @max_list_price are parameters with default
    values and therefore are optional.
    Using NULL instead of 999999 as the default value for @max_list_price
    would cater for possible increase of maximum list price in the future.

    EXECUTE uspFindProducts
        @min_list_price = 6000,
        @name = 'Trek';
*/
ALTER PRECEDURE uspFindProducts(
    @min_list_price AS DECIMAL = 0,
    @max_list_price AS DECIMAL = NULL,
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
        (list_price IS NULL OR list_price <= @max_list_price) AND
        product_name LIKE '%' + @name + '%'
    ORDER BY
        list_price;
END;

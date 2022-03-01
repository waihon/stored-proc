/* EXEC uspFindProducts 900, 1000; */
ALTER PRECEDURE uspFindProducts(
    @min_list_price AS DECIMAL,
    @max_list_price AS DECIMAL)
AS
BEGIN
    SELECT
        product_name,
        list_price
    FROM
        production.products

    WHERE
        list_price >= @min_list_price AND
        list_price <= @max_list_price
    ORDER BY
        list_price;
END;

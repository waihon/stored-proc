/* EXEC uspFindProducts 100; */
CREATE PRECEDURE uspFindProducts(@min_list_price AS DECIMAL)
AS
BEGIN
    SELECT
        product_name,
        list_price
    FROM
        production.products

    WHERE
        list_price >= @min_list_price
    ORDER BY
        list_price;

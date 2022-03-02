CREATE PROCEDURE uspSelectIntoVars
AS
BEGIN
    DECLARE
        @product_name AS VAR_CHAR(MAX),
        @list_price AS DECIMAL(10, 2);

    SELECT
        @product_name = product_name,
        @list_price = list_price
    FROM
        production.products
    WHERE
        product_id = 100;

    SELECT
        @product_name AS product_name,
        @list_price AS list_price;
END;

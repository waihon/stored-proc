CREATE PROCEDURE uspProductList
AS
BEGIN
    SELECT 
        product_name,
        list_price
    FROM
        production.products
    ORDER BY
        product_name;
END;

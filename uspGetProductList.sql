/***
    EXEC uspGetProductList 2018
*/
CREATE PROCEDURE uspGetProductList(
    @model_year AS SMALLINT
)
AS
BEGIN
    DECLARE @product_list AS VARCHAR(MAX);

    SET @product_list = '';

    SELECT
        @product_lsit = @product_list + product_name + CHAR(10)
    FROM
        production.products
    WHERE
        model_year = @model_year
    ORDER BY
        product_name;

    PRINT @product_list;
END;

/***
    DECLARE @count INT;
    EXEC uspFindProductByModel
        @model_year = 2018,
        @product_count = @count OUTPUT;

    DECLARE @count INT;
    EXEC uspFindProductByModel 2018, @count OUTPUT;

    SELECT @count AS 'Number of products found';
*/
CREATE PROCEDURE uspFindProductByModel(
    @model_year SMALLINT,
    @product_count INT OUTPUT
) AS
BEGIN
    SELECT
        product_name,
        list_price
    FROM
        production.products
    WHERE
        model_year = @model_year;

    SELECT @product_count = @@ROWCOUNT;
END;

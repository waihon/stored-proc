ALTER PROCEDURE uspSalesByOrderYear(
    @order_year INT
)
AS
BEGIN
    DECLARE @sales INT;

    SELECT
        @sales = SUM(list_price * quantity)
    FROM
        sales.order_items i
        INNER JOIN sales.orders o ON o.order_id = i.order_id
    WHERE
        YEAR(order_date) = @order_year;

    SELECT @sales;

    IF @sales > 1000000
    BEGIN
        PRINT 'Great! The sales amount in ' + @order_year + ' is greater than 1,000,000';
    END
    ELSE
    BEGIN
        PRINT 'Sales amount in ' + @order_year + ' did not reach 1,000,000';
    END;
END;

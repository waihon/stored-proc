CREATE PROCEDURE uspBreakWhileLoop
AS
BEGIN
    DECLARE @counter INT = 0;

    WHILE @counter <= 5
    BEGIN
        SET @counter = @counter + 1;
        IF @counter = 4
            BREAK;
        PRINT @counter;
    END;
END;

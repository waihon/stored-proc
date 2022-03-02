CREATE PROCEDURE uspWhileLoop
AS
BEGIN
    DECLARE @counter INT = 1;

    WHILE @counter <= 5
    BEGIN
        PRINT @counter;
        SET @counter = @counter + 1;
    END;
END;

CREATE PROCEDURE uspContinueWhileLoop
AS
BEGIN
    DECLARE @counter INT = 0;

    WHILE @counter < 5
    BEGIN
        SET @counter = @counter + 1;
        IF @counter = 3
            CONTINUE;
        print @counter;
    END
END;

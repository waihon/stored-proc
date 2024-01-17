CREATE PROCEDURE uspNestedIfElse
AS
BEGIN
    DECLARE @x INT = 10,
            @y INT = 20;

    IF (@x > 10)
    BEGIN
        IF (@x < @y)
            PRINT 'x > 10 and x < y';
        ELSE
            PRINT 'x > 10 and x >= y';
    END
    ELSE
    BEGIN
        IF (@x < @y)
            PRINT 'x <= 10 and x < y';
        ELSE
            PRINT 'x <= 10 and x >= y';
    END;
END;

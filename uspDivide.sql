/***
    DECLARE @r DECIMAL;
    EXEC uspDivide 10, 2, @r OUTPUT;
    PRINT @r;

    DECLARE @r2 DECIMAL;
    EXEC uspDivide 10, 0, @r2 OUTPUT;
    PRINT @r;
*/
CREATE PROCEDURE uspDivide(
    @a DECIMAL,
    @b DECIMAL,
    @c DECIMAL OUTPUT
)
AS
BEGIN
    BEGIN TRY
        SET @c = @a / @b;
    END TRY
    BEGIN CATCH
        SELECT
            ERROR_NUMBER() AS ErrorNumber,
            ERROR_SEVERITY() AS ErrorSeverity,
            ERROR_STATE() AS ErrorState,
            ERROR_PROCEDURE() AS ErrorProcedure,
            ERROR_LINE() AS ErrorLine,
            ERROR_MESSAGE() AS ErrorMessage;
    END CATCH
END;
GO

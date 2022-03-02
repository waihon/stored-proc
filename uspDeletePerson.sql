CREATE PROCEDURE uspDeletePerson(
    @person_id INT
)
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTIONS;
        -- Delete the person
        DELETE FROM sales.persons
        WHERE person_id = @person_id;
        -- If DELETE succeeds, commit the transaction
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        -- Report exception
        EXEC uspReportError;

        -- Test if the transaction is uncommittable.
        IF (XACT_STATE()) = -1
        BEGIN
            PRINT N'The transaction is in an uncommittable state. ' +
                   'Rolling back transaction.'
            ROLLBACK TRANSACTION;
        END

        -- Test if the transaction is committable.
        IF (XACT_STATE()) = 1
        BEGIN
            PRINT N'The transaction is committable. ' +
                   'Committing transaction.'
            COMMIT TRANSACTION;
        END
    END CATCH
END;
GO

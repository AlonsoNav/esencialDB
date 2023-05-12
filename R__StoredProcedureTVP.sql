USE [esencialDB]
CREATE TYPE [dbo].[ContactoTableType] AS TABLE(
    [contactoValueId] [bigint] NOT NULL,
    [usuarioId] [bigint] NOT NULL
)
GO
CREATE PROCEDURE [dbo].[SP_InsertarContactos]
	@TablaContactos dbo.ContactoTableType READONLY
AS 
BEGIN
	SET NOCOUNT ON -- no retorne metadatos
	
	DECLARE @ErrorNumber INT, @ErrorSeverity INT, @ErrorState INT, @CustomError INT
	DECLARE @Message VARCHAR(200)
	DECLARE @InicieTransaccion BIT
	
	SET @InicieTransaccion = 0
	IF @@TRANCOUNT=0 BEGIN
		SET @InicieTransaccion = 1
		SET TRANSACTION ISOLATION LEVEL READ COMMITTED
		BEGIN TRANSACTION		
	END
	
	BEGIN TRY
		SET @CustomError = 2001
		
		INSERT INTO DBO.contactosXUsuario(contactoValueId, usuarioId)
		SELECT contactoValueId, usuarioId
        FROM @TablaContactos;
		
		IF @InicieTransaccion=1 BEGIN
			COMMIT
		END
	END TRY
	BEGIN CATCH
		SET @ErrorNumber = ERROR_NUMBER()
		SET @ErrorSeverity = ERROR_SEVERITY()
		SET @ErrorState = ERROR_STATE()
		SET @Message = ERROR_MESSAGE()
		
		IF @InicieTransaccion=1 BEGIN
			ROLLBACK
		END
		RAISERROR('%s - Error Number: %i', 
			@ErrorSeverity, @ErrorState, @Message, @CustomError)
	END CATCH	
END

DECLARE @contactosTabla ContactoTableType
INSERT INTO @contactosTabla VALUES (10, 1), (280, 1)

EXEC dbo.SP_InsertarContactos @contactosTabla

select * from contactosXUsuario

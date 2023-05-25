USE [esencialDB]
GO
/* Aquí leeremos un dato mal de la compra de recipientes dado un fallo de transacción.
-- El propósito es demostrar el Dirty Read que puede provocar.
-- Esto se soluciona con el Isolation Level de Read Committed.*/
CREATE PROCEDURE [dbo].[SP_EntregarRecipienteARecolector3](
	@rec INT,
	@cantRec BIGINT,
	@planta INT,
	@recolectora BIGINT
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @ErrorNumber INT, @ErrorSeverity INT, @ErrorState INT, @CustomError INT
	DECLARE @Message VARCHAR(200)
	DECLARE @InicieTransaccion BIT
	DECLARE @cantDisponible BIGINT
	DECLARE @dir BIGINT
	SELECT @dir = direccion FROM plantas WHERE plantaId = @planta
	DECLARE @cantUso BIGINT
	
	SET @InicieTransaccion = 0
	IF @@TRANCOUNT=0 BEGIN
		SET @InicieTransaccion = 1
		SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
		BEGIN TRANSACTION
	END

	BEGIN TRY
		SET @CustomError = 2001
		SELECT @cantDisponible = cantDisponible, @cantUso = cantEnUso FROM tiposRecipiente WHERE tipoRecId = @rec;
		IF @cantDisponible < @cantRec BEGIN
			RAISERROR ('No hay recipientes suficientes', 16, 1); 
		END
		UPDATE tiposRecipiente SET cantDisponible = @cantDisponible - @cantRec, cantEnUso = @cantUso + @cantRec WHERE tipoRecId = @rec
		INSERT INTO movimientosRecipiente(tipoRecId, cantidadRec, checksum, movementTypeId, plantaId, direccionId)
		VALUES (@rec, -1*@cantRec, checksum(@cantRec+@rec), 3, @planta, @dir)
		INSERT INTO movimientosRecipiente(tipoRecId, cantidadRec, checksum, movementTypeId, recolectoraId, direccionId)
		VALUES (@rec, @cantRec, checksum(@cantRec+@rec), 3, @planta, @dir)

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
USE [esencialDB]
GO
/* Esencial va a comprar recipientes.
-- El problema ocurre si al hacer el update se está tramitando una entrega de recipientes a recolectores.
-- Suponiendo que la transacción es erronea y provoca un update, ocurre que el dato leído por el SP de entrega a recolectores lea un dato falso.
-- Por lo tanto, se ve comprometida la integridad de los datos de conteo de los recipientes disponibles.
*/
CREATE PROCEDURE [dbo].[SP_ComprarRecipientes](
	@rec INT,
	@cantRec BIGINT,
	@planta INT
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
	
	SET @InicieTransaccion = 0
	IF @@TRANCOUNT=0 BEGIN
		SET @InicieTransaccion = 1
		SET TRANSACTION ISOLATION LEVEL READ COMMITTED
		BEGIN TRANSACTION
	END

	BEGIN TRY
		SET @CustomError = 2001
		SELECT @cantDisponible = cantDisponible FROM tiposRecipiente WHERE tipoRecId = @rec;
		UPDATE tiposRecipiente SET cantDisponible = @cantDisponible + @cantRec WHERE tipoRecId = @rec
		WAITFOR DELAY '00:00:10';
		INSERT INTO movimientosRecipiente(tipoRecId, cantidadRec, checksum, movementTypeId, plantaId, direccionId)
		VALUES (@rec, -1*@cantRec, checksum(@cantRec+@rec), 4, @planta, @dir)
		INSERT INTO transacciones(transactionType, monedaId, exchangeId, cambio, monto, chekcsum) 
		VALUES (1, 1, 1, 1, 1, checksum(8)) -- Aquí ocurrirá un error de transacción que provocará un rollback.

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
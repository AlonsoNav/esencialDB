USE [esencialDB]
GO
/* El lost update podría llegar a suceder si se está entregando el mismo tipo de recipiente al mismo tiempo a diversos recolectores.
-- Al actualizar la tabla de tipos de recipientes para colocar ahora la nueva cantidad de recipientes disponibles (limpios y sin daños),
-- puede ocurrir que se pierda cierta rango de recipientes que se actualizaron, pero luego borraron tras una nueva actualización.
-- La solución es realizar el select de la cantidad que se actualizará, antes de la transacción.
-- Niveles más altos de isolación solo causan deadlocks.*/
CREATE PROCEDURE [dbo].[SP_EntregarRecipienteARecolector2](
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
		SET TRANSACTION ISOLATION LEVEL READ COMMITTED
		BEGIN TRANSACTION
	END

	BEGIN TRY
		SET @CustomError = 2001
		SELECT @cantDisponible = cantDisponible, @cantUso = cantEnUso FROM tiposRecipiente WHERE tipoRecId = @rec;
		IF @cantDisponible < @cantRec BEGIN
			RAISERROR ('No hay recipientes suficientes', 16, 1); 
		END
		WAITFOR DELAY '00:00:10';
		UPDATE tiposRecipiente SET cantDisponible = @cantDisponible - @cantRec, cantEnUso = @cantUso + @cantRec WHERE tipoRecId = @rec
		--UPDATE tiposRecipiente SET cantDisponible = cantDisponible - @cantRec, cantEnUso = cantEnUso + @cantRec WHERE tipoRecId = @rec
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
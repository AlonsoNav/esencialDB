USE [esencialDB]
GO
/* Al entregar recipientes a un recolector y revisar los que se tienen en esa planta específica puede ocurrir un problema de phantom al hacer la suma de los logs del recipiente.
-- En el momento que hace la suma, puede ocurrir que haya un inserción, por lo tanto, el valor de la suma estaría erróneo.
-- La solución es chequear hasta el final y en caso de que haya valores negativos tirar el rollback.
*/
CREATE PROCEDURE [dbo].[SP_EntregarRecipienteARecolector4](
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
	DECLARE @cantUso BIGINT, @cantPlanta BIGINT
	
	SET @InicieTransaccion = 0
	IF @@TRANCOUNT=0 BEGIN
		SET @InicieTransaccion = 1
		SET TRANSACTION ISOLATION LEVEL READ COMMITTED
		BEGIN TRANSACTION
	END

	BEGIN TRY
		SET @CustomError = 2001
		SELECT @cantPlanta = SUM(cantidadRec) FROM movimientosRecipiente WHERE plantaId = @planta AND tipoRecId = @rec
		IF  @cantPlanta < @cantRec BEGIN
			RAISERROR ('No hay recipientes suficientes', 16, 1); 
		END
		WAITFOR DELAY '00:00:10'
		UPDATE tiposRecipiente SET cantDisponible = cantDisponible - @cantRec, cantEnUso = cantEnUso + @cantRec WHERE tipoRecId = @rec
		INSERT INTO movimientosRecipiente(tipoRecId, cantidadRec, checksum, movementTypeId, plantaId, direccionId)
		VALUES (@rec, -1*@cantRec, checksum(@cantRec+@rec), 3, @planta, @dir)
		INSERT INTO movimientosRecipiente(tipoRecId, cantidadRec, checksum, movementTypeId, recolectoraId, direccionId)
		VALUES (@rec, @cantRec, checksum(@cantRec+@rec), 3, @planta, @dir)
		
		/*SELECT @cantPlanta = SUM(cantidadRec) FROM movimientosRecipiente WHERE plantaId = @planta AND tipoRecId = @rec
		IF  @cantPlanta < 0 BEGIN
			RAISERROR ('No hay recipientes suficientes', 16, 1); 
		END*/

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
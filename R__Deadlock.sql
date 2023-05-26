USE [esencialDB]
GO
CREATE TYPE [dbo].[RecTVP] AS TABLE(
    [recId] [int] NOT NULL
)
GO
/*Este SP recibe un TVP de todos los recipientes a los que se les va a realizar un mantenimiento.
-- El deadlock puede ocurrir cuando recibo n recipientes que puedan volverse circulares bloqueando tablas que luego necesitará el otro procedure.
-- Suponga el TVP como un carrito que no va ordenado.
*/
CREATE PROCEDURE [dbo].[SP_MantenimientoRecipientesRango](
	@recs dbo.RecTVP READONLY,
	@planta INT
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @ErrorNumber INT, @ErrorSeverity INT, @ErrorState INT, @CustomError INT
	DECLARE @Message VARCHAR(200)
	DECLARE @InicieTransaccion BIT
	DECLARE @cantM BIGINT, @cant BIGINT, @dir BIGINT
	SELECT @dir = direccion FROM plantas WHERE plantaId = @planta
	
	SET @InicieTransaccion = 0
	IF @@TRANCOUNT=0 BEGIN
		SET @InicieTransaccion = 1
		SET TRANSACTION ISOLATION LEVEL READ COMMITTED
		BEGIN TRANSACTION
	END

	BEGIN TRY
		DECLARE @rec INT;
		DECLARE recs_cursor CURSOR FOR SELECT recId FROM @recs -- ORDER BY recId ASC  -- Este Order By evita que la transacción se vuelva circular y ocurra un deadlock.

		OPEN recs_cursor

		FETCH NEXT FROM recs_cursor INTO @rec

		WHILE @@FETCH_STATUS = 0
		BEGIN
			SET @cantM = NULL
			SET @cant = NULL
			SELECT @cantM = cantEnMante, @cant = cantDisponible FROM tiposRecipiente WHERE tipoRecId = @rec
			IF @cantM IS NULL OR @cant IS NULL
			BEGIN 
				RAISERROR ('Los valores no son un rango permitido.', 16, 1); 
			END
			UPDATE tiposRecipiente SET cantDisponible = @cantM + @cant, cantEnMante = 0 WHERE tipoRecId = @rec
			WAITFOR DELAY '00:00:05'
			INSERT INTO movimientosRecipiente(tipoRecId, cantidadRec, checksum, movementTypeId, plantaId, direccionId)
			VALUES (@rec, @cantM, checksum(@cantM+@rec), 5, @planta, @dir)

			FETCH NEXT FROM recs_cursor INTO @rec;
		END;

		CLOSE recs_cursor;
		DEALLOCATE recs_cursor;

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
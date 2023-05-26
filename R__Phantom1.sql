USE [esencialDB]
GO
/* Al producir productos se pueden hacer varias inserciones que conlleven la pérdida del último valor de índice de la tabla.
-- Esto ocurre por inserciones phantom.
-- La solución está en bloquear esa tabla al hacer la inserciones y mantener una isolation Serializable.
*/
CREATE PROCEDURE [dbo].[SP_ProducirProductos1](
	@prod INT,
	@cant BIGINT,
	@ins BIGINT
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @ErrorNumber INT, @ErrorSeverity INT, @ErrorState INT, @CustomError INT
	DECLARE @Message VARCHAR(200)
	DECLARE @InicieTransaccion BIT
	DECLARE @cantActual INT, @prodActual BIGINT
	
	SET @InicieTransaccion = 0
	IF @@TRANCOUNT=0 BEGIN
		SET @InicieTransaccion = 1
		--SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
		SET TRANSACTION ISOLATION LEVEL READ COMMITTED
		BEGIN TRANSACTION
	END

	BEGIN TRY
		SET @CustomError = 2001
		--SELECT TOP 1 @prodActual = produccionId FROM logProducciones ORDER BY produccionId DESC
		INSERT logProducciones(productoId, cantidad, inspectorId, checksum)
		VALUES(@prod, @cant, @ins, checksum(@prod+@cant))
		WAITFOR DELAY '00:00:10'
		--SET @prodActual = IDENT_CURRENT('logProducciones')
		SELECT TOP 1 @prodActual = produccionId FROM logProducciones ORDER BY produccionId DESC
		PRINT @prodActual

		DECLARE mateXProd_cursor CURSOR FOR SELECT materialId, cantidad FROM materialesXProducto WHERE productoId = @prod
		OPEN mateXProd_cursor;

		DECLARE @mat INT, @cantMat INT

		FETCH NEXT FROM mateXProd_cursor INTO @mat, @cantMat
		WHILE @@FETCH_STATUS = 0
		BEGIN
			SELECT @cantActual = CAST(SUM(cantidad) as INT) FROM inventarioMateriales WHERE materialId = @mat
			IF @cantActual < @cantMat*@cant BEGIN
				RAISERROR ('No hay materiales suficientes', 16, 1); 
			END
			INSERT inventarioMateriales(materialId, cantidad, inspectorId, checksum, produccionId)
			VALUES (@mat, -1*@cantMat*@cant, @ins, checksum(@mat+@ins), @prodActual)
    
			FETCH NEXT FROM mateXProd_cursor INTO @mat, @cantMat
		END;

		CLOSE mateXProd_cursor;
		DEALLOCATE mateXProd_cursor;

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
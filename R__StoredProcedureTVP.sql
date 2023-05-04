USE [esencialDB]
CREATE TYPE [dbo].[ProductoTableType] AS TABLE(
    [productoId] [int] NOT NULL,
    [cantidad] [bigint] NOT NULL
)
GO
CREATE PROCEDURE [dbo].[SP_InsertarVentas]
	@TablaProductos dbo.ProductoTableType READONLY
AS 
BEGIN
	SET NOCOUNT ON -- no retorne metadatos
	
	DECLARE @ErrorNumber INT, @ErrorSeverity INT, @ErrorState INT, @CustomError INT
	DECLARE @Message VARCHAR(200)
	DECLARE @InicieTransaccion BIT
	DECLARE @ventaId INT -- variable para almacenar el ID de la venta
	
	INSERT INTO dbo.logVentas (checksum) VALUES (checksum('vano'))
	SET @ventaId = IDENT_CURRENT('logVentas') -- obtener el valor del ID generado
	
	SET @InicieTransaccion = 0
	IF @@TRANCOUNT=0 BEGIN
		SET @InicieTransaccion = 1
		SET TRANSACTION ISOLATION LEVEL READ COMMITTED
		BEGIN TRANSACTION		
	END
	
	BEGIN TRY
		SET @CustomError = 2001
		
		INSERT INTO DBO.productosXventa(productoId, cantidad, ventaId)
		SELECT productoId, cantidad, @ventaId
        FROM @TablaProductos;
		
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

DECLARE @productosTabla ProductoTableType
INSERT INTO @productosTabla VALUES (1000000, 89), (98, 98)

EXEC dbo.SP_InsertarVentas @productosTabla

DROP TYPE [dbo].[ProductoTableType]

SELECT * FROM productosXventa
SELECT * FROM logVentas


CREATE TYPE [dbo].[MovimientoTableType] AS TABLE(
    [tipoRecId] [int] NOT NULL,
    [cantidadRec] [bigint] NOT NULL,
	[desechoId] [int] NULL,
	[cantidadDes] [bigint] NULL,
	[checksum] [varbinary](150) NOT NULL DEFAULT checksum(8),
	[movementTypeId][smallint] NOT NULL,
	[productorId][int] NULL,
	[recolectoraId][bigint] NULL,
	[direccionId][bigint] NOT NULL DEFAULT 1
)
GO
CREATE PROCEDURE [dbo].[SP_MoverRecipiente]
	@movimientos dbo.MovimientoTableType READONLY
AS 
BEGIN
	SET NOCOUNT ON 
	
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
		
		INSERT INTO movimientosRecipiente(tipoRecId, cantidadRec, desechoId, cantidadDes, checksum, movementTypeId, productorId,recolectoraId, direccionId)
		SELECT * FROM @movimientos;
		
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

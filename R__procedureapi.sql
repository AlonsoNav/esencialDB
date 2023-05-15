USE [esencialDB]
GO
CREATE PROCEDURE [dbo].[SP_apitest]
	@movement SMALLINT
AS 
BEGIN
	SELECT RE.nombre as recolector, R.description as recipiente, M.cantidadRec as cantidad FROM movimientosRecipiente M
	INNER JOIN tiposRecipiente R ON R.tipoRecId = M.tipoRecId
	INNER JOIN recolectoras RE ON RE.recolectoraId = M.recolectoraId
	WHERE M.movementTypeId = @movement
	ORDER BY M.recolectoraId ASC;
END

exec dbo.SP_apitest 1

drop procedure SP_apitest
CREATE PROCEDURE [dbo].[SP_GetRecipientesForProOrRec]
	@entidad INT,
	@opc INT
AS 
BEGIN
	IF @opc = 1
	BEGIN
		SELECT M.tipoRecId, R.capacidad, R.description, SUM(M.cantidadRec) AS cantidad FROM movimientosRecipiente M
		INNER JOIN tiposRecipiente R ON R.tipoRecId = M.tipoRecId
		WHERE M.recolectoraId=@entidad
		GROUP BY M.tipoRecId, R.capacidad, R.description;
	END
	ELSE
	BEGIN
		SELECT M.tipoRecId, R.capacidad, R.description, SUM(M.cantidadRec) AS cantidad FROM movimientosRecipiente M
		INNER JOIN tiposRecipiente R ON R.tipoRecId = M.tipoRecId
		WHERE M.productorId=@entidad
		GROUP BY M.tipoRecId, R.capacidad, R.description;
	END
END
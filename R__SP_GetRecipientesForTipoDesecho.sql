CREATE PROCEDURE [dbo].[SP_GetRecipientesForTipoDesecho]
	@tipoDesecho INT
AS 
BEGIN
	SELECT dXR.tipoRecId, R.description, R.capacidad FROM desechosXRecipiente dXR
	INNER JOIN tiposRecipiente R ON R.tipoRecId = dXR.tipoRecId
	WHERE dXR.tipoDesechoId = @tipoDesecho;	
END
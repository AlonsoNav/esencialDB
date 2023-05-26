CREATE PROCEDURE [dbo].[SP_GetRecipientesForTipoDesecho]
	@tipoDesecho INT,
	@tipoRec INT
AS 
BEGIN
	SELECT dXR.tipoRecId FROM desechosXRecipiente dXR
	WHERE dXR.tipoDesechoId = @tipoDesecho and dXR.tipoRecId = @tipoRec;	
END
CREATE PROCEDURE [dbo].[SP_GetDesechoForContrato]
	@contratoId BIGINT
AS 
BEGIN
	SELECT D.desechoId, D.tipoDesechoId, D.nombre FROM desechoXContrato dXC
	INNER JOIN desechos D ON D.desechoId = dXC.desechoId
	WHERE dXC.contratoId = @contratoId;	
END
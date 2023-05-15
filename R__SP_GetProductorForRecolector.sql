CREATE PROCEDURE [dbo].[SP_GetProductorForRecolector]
	@recolectorId BIGINT
AS 
BEGIN
	SELECT C.contratoId, C.productorId, P.descripcion FROM contratos C
	INNER JOIN productores P ON P.productorId = C.productorId
	WHERE C.recolectorId = @recolectorId AND contratoStatusId = 1	
END

CREATE PROCEDURE [dbo].[SP_ValidateRecForDes]
	@rec INT,
	@des INT
AS 
BEGIN
	SELECT dXR.tipoDesechoId FROM desechosXRecipiente dXR
	WHERE dXR.tipoDesechoId = @des AND dXR.tipoRecId = @rec;
END
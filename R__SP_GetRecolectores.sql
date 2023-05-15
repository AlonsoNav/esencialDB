CREATE PROCEDURE [dbo].[SP_GetRecolectores]
AS 
BEGIN
	SELECT recolectoraId, nombre FROM recolectoras;
END
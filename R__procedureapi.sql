USE [esencialDB]
GO
CREATE PROCEDURE [dbo].[SP_apitest]
AS 
BEGIN
	SELECT 
		P.descripcion AS DescripcionProducto,
		M.nombre AS NombreMaterial,
		IM.cantidad AS Cantidad
	FROM dbo.productos P
		INNER JOIN dbo.logProducciones LP ON LP.productoId = P.productoId
		INNER JOIN dbo.inventarioMateriales IM on IM.produccionId = LP.produccionId
		INNER JOIN dbo.materiales M on M.materialId = IM.materialId
	WHERE 
		LP.produccionId < 100
	ORDER BY LP.produccionId;
END

exec dbo.SP_apitest

drop procedure SP_apitest

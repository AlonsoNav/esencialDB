USE [esencialDB]
GO
CREATE PROCEDURE [dbo].[SP_apitest]
AS 
BEGIN
SELECT 
	INS.nombre AS IdInspector
FROM dbo.inventarioMateriales IM
	INNER JOIN dbo.inspectores INS on INS.inspectorId = IM.inspectorId	 
	INNER JOIN dbo.logProducciones P on P.produccionId = IM.produccionId	 
WHERE 
	INS.inspectorId = P.inspectorId;
END

exec dbo.SP_apitest

drop procedure SP_apitest


SELECT 
	INS.nombre AS IdInspector
FROM dbo.inventarioMateriales IM
	INNER JOIN dbo.inspectores INS on INS.inspectorId = IM.inspectorId	 
	INNER JOIN dbo.logProducciones P on P.produccionId = IM.produccionId	 
WHERE 
	INS.inspectorId = P.inspectorId;

SELECT 
	inspectores.nombre 
FROM [inventarioMateriales] 
	JOIN inspectores ON inspectores.[inspectorId] = [inventarioMateriales].[inspectorId] 
	JOIN [logProducciones] ON inspectores.[inspectorId] = [logProducciones].[inspectorId] 
WHERE
inspectores.[inspectorId] = [logProducciones].[inspectorId];
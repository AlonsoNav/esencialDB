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


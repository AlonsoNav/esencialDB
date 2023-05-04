SET STATISTICS TIME ON
GO
SELECT 
	-- Agregate Functions
	SUM(P.cantidad) AS SumaCantidad,
	STDEV(INS.inspectorId) AS InspectorCount
FROM dbo.inventarioMateriales IM
	LEFT JOIN dbo.inspectores INS on INS.inspectorId = IM.inspectorId	 -- Left Join
	INNER JOIN dbo.logProducciones P on P.produccionId = IM.produccionId	 
	INNER JOIN dbo.materiales M on M.materialId= IM.materialId		     
WHERE 
	IM.inventarioID < 10000 AND
	INS.inspectorId > 1000 AND											 -- Where Primary Field
	uniMedida = 'kg'													 -- Igualdad
GROUP BY P.cantidad													     -- Group By
HAVING SUM(P.cantidad) > 5
EXCEPT																     -- EXCEPT 

SELECT 
	-- Agregate Functions
	SUM(P.cantidad) AS SumaCantidad,
	STDEV(INS.inspectorId) AS InspectorCount
FROM dbo.inventarioMateriales IM
	LEFT JOIN dbo.inspectores INS on INS.inspectorId = IM.inspectorId	 -- Left Join
	INNER JOIN dbo.logProducciones P on P.produccionId = IM.produccionId	   
WHERE 
	IM.inventarioID < 10000 AND
	P.cantidad > 100 AND												 -- Where Non Primary Field
	INS.nombre != 'NombreIns:1'											 -- Desigualdad
GROUP BY P.cantidad													     -- Group By
HAVING SUM(P.cantidad) > 5											 
ORDER BY SUM(P.cantidad) DESC										     -- Sort
FOR JSON PATH															 -- For JSON


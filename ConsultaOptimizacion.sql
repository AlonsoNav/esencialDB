GO
SELECT 
	-- Agregate Functions
	COUNT(INS.nombre) AS Inspector,
	SUM(P.cantidad) AS SumaCantidad,
	MAX(M.materialId) AS ConteoMateriales,
	COUNT(M.uniMedida) AS UnidadMedida,
	STDEV(INS.inspectorId) AS InspectorCount
FROM dbo.inventarioMateriales IM
	LEFT JOIN dbo.inspectores INS on INS.inspectorId = IM.inspectorId	 -- Left Join
	INNER JOIN dbo.logProducciones P on P.produccionId = IM.produccionId	 
	INNER JOIN dbo.materiales M on M.materialId= IM.materialId		     
	INNER JOIN dbo.tratamientos T on T.tratamientoId = IM.inspectorId
WHERE 
	INS.inspectorId > 100 AND											 -- Where Primary Field
	P.cantidad > 50	AND													 -- Where Non Primary Field
	uniMedida = 'kg'											         -- Igualdad
GROUP BY P.cantidad													     -- Group By
HAVING COUNT(M.materialId) > 5											 
ORDER BY COUNT(INS.nombre) DESC										     -- Sort
FOR JSON PATH															 -- For Json
GO
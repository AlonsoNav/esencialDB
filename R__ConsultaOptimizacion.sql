USE[esencialDB]
GO
SELECT 
	SUM(P.cantidad) AS SumaCantidad,
	STDEV(INS.inspectorId) AS InspectorCount
FROM dbo.inventarioMateriales IM
	LEFT JOIN dbo.inspectores INS on INS.inspectorId = IM.inspectorId	 
	INNER JOIN dbo.logProducciones P on P.produccionId = IM.produccionId	 
	INNER JOIN dbo.materiales M on M.materialId= IM.materialId		     
WHERE 
	INS.inspectorId > 1000 AND											 
	uniMedida = 'kg'													 
GROUP BY P.cantidad													     
HAVING SUM(P.cantidad) > 5
EXCEPT																    

SELECT 
	-- Agregate Functions
	SUM(P.cantidad) AS SumaCantidad,
	STDEV(INS.inspectorId) AS InspectorCount
FROM dbo.inventarioMateriales IM
	LEFT JOIN dbo.inspectores INS on INS.inspectorId = IM.inspectorId	 
	INNER JOIN dbo.logProducciones P on P.produccionId = IM.produccionId	   
WHERE 
	P.cantidad > 100 AND												 
	INS.nombre != 'NombreIns:1'											 
GROUP BY P.cantidad													    
HAVING SUM(P.cantidad) > 5											 
ORDER BY SUM(P.cantidad) DESC										    
FOR JSON PATH

GO


ALTER TABLE inventarioMateriales
ADD inventarioID BIGINT IDENTITY(1,1) NOT NULL PRIMARY KEY;

-- Índice no agrupado en la tabla inventarioMateriales para la columna inspectorId
CREATE NONCLUSTERED INDEX IX_inventarioMateriales_inspectorId ON dbo.inventarioMateriales (inspectorId);

-- Índice no agrupado en la tabla inventarioMateriales para la columna produccionId
CREATE NONCLUSTERED INDEX IX_inventarioMateriales_produccionId ON dbo.inventarioMateriales (produccionId);
GO

SELECT 
	-- Agregate Functions
	SUM(P.cantidad) AS SumaCantidad,
	STDEV(INS.inspectorId) AS InspectorCount
FROM dbo.inventarioMateriales IM
	LEFT JOIN dbo.inspectores INS on INS.inspectorId = IM.inspectorId	 -- Left Join	 
	LEFT JOIN dbo.materiales M on M.materialId= IM.materialId	
	INNER JOIN dbo.logProducciones P on P.produccionId = IM.produccionId
WHERE 
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
	P.cantidad > 100 AND												 -- Where Non Primary Field
	INS.nombre != 'NombreIns:1'											 -- Desigualdad
GROUP BY P.cantidad													     -- Group By
HAVING SUM(P.cantidad) > 5											 
ORDER BY SUM(P.cantidad) DESC										     -- Sort
FOR JSON PATH
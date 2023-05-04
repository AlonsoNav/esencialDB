USE[esencialDB]
GO
SELECT 
	-- Agregate Functions
	SUM(P.cantidad) AS SumaCantidad,
	STDEV(INS.inspectorId) AS InspectorCount
FROM dbo.inventarioMateriales IM
	LEFT JOIN dbo.inspectores INS on INS.inspectorId = IM.inspectorId	 -- Left Join
	INNER JOIN dbo.logProducciones P on P.produccionId = IM.produccionId	 
	LEFT JOIN dbo.materiales M on M.materialId= IM.materialId		     
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

ALTER TABLE inventarioMateriales
ADD inventarioID BIGINT IDENTITY(1,1) NOT NULL PRIMARY KEY;

ALTER TABLE dbo.inventarioMateriales DROP CONSTRAINT PK__inventar__237474651C46A5B2; 
ALTER TABLE dbo.InventarioMateriales DROP COLUMN InventarioID

CREATE CLUSTERED INDEX ix_produccionId ON dbo.inventarioMateriales (produccionId)

-- Índice no agrupado en la tabla inventarioMateriales para la columna inspectorId
CREATE NONCLUSTERED INDEX IX_inventarioMateriales_inspectorId ON dbo.inventarioMateriales (inspectorId);

-- Índice no agrupado en la tabla inventarioMateriales para la columna produccionId
CREATE NONCLUSTERED INDEX IX_inventarioMateriales_produccionId ON dbo.inventarioMateriales (produccionId);

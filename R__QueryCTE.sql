USE [esencialDB]
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
WITH CTE1 AS ( -- Agregar suma y desviación estándar genérica para optimizar con uso de CTE.
    SELECT 
        P.cantidad,
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
),
CTE2 AS (
    SELECT 
        P.cantidad,
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
),
SELECT SumaCantidad, InspectorCount 
FROM CTE1 
EXCEPT 
SELECT SumaCantidad, InspectorCount 
FROM CTE2
ORDER BY SumaCantidad DESC
FOR JSON PATH
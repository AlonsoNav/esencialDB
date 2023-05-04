USE [esencialDB]
GO
SET STATISTICS TIME ON
GO

WITH cte1 AS (
    SELECT 
        IM.produccionId,
        P.cantidad,
        INS.inspectorId,
        M.uniMedida
    FROM dbo.inventarioMateriales IM
    LEFT JOIN dbo.inspectores INS ON INS.inspectorId = IM.inspectorId
    LEFT JOIN dbo.materiales M ON M.materialId = IM.materialId
    INNER JOIN dbo.logProducciones P ON P.produccionId = IM.produccionId
    WHERE 
        INS.inspectorId > 1000 AND
        M.uniMedida = 'kg'
),
cte2 AS (
    SELECT 
        IM.produccionId,
        P.cantidad,
        INS.inspectorId
    FROM dbo.inventarioMateriales IM
    LEFT JOIN dbo.inspectores INS ON INS.inspectorId = IM.inspectorId
    INNER JOIN dbo.logProducciones P ON P.produccionId = IM.produccionId
    WHERE 
        P.cantidad > 100 AND
        INS.nombre != 'NombreIns:1'
)
SELECT 
    -- Agregate Functions
    SUM(cte1.cantidad) AS SumaCantidad,
    STDEV(cte1.inspectorId) AS InspectorCount
FROM cte1
WHERE cte1.produccionId NOT IN (SELECT produccionId FROM cte2)
GROUP BY cte1.cantidad
HAVING SUM(cte1.cantidad) > 5
ORDER BY SUM(cte1.cantidad) DESC
FOR JSON PATH
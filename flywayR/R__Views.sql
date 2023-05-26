-- View Dinamica
IF OBJECT_ID('dbo.DynamicView','view') IS NOT NULL
	DROP VIEW dbo.DynamicView;
GO
CREATE VIEW dbo.DynamicView AS
SELECT INS.nombre,count_big(*) AS conteo 
FROM dbo.inventarioMateriales IM 
	INNER JOIN dbo.inspectores INS on INS.inspectorId = IM.inspectorId
	INNER JOIN dbo.logProducciones P on P.produccionId = IM.produccionId
	INNER JOIN dbo.materiales M on M.materialId= IM.materialId
	INNER JOIN dbo.tratamientos T on T.tratamientoId = IM.inspectorId
GROUP BY INS.nombre
GO

-- View Indexada
IF OBJECT_ID('dbo.IndexView','view') IS NOT NULL
	DROP VIEW dbo.IndexView;
GO
CREATE VIEW dbo.IndexView WITH SCHEMABINDING AS
SELECT INS.nombre,count_big(*) AS conteo 
FROM dbo.inventarioMateriales IM 
	INNER JOIN dbo.inspectores INS on INS.inspectorId = IM.inspectorId
	INNER JOIN dbo.logProducciones P on P.produccionId = IM.produccionId
	INNER JOIN dbo.materiales M on M.materialId= IM.materialId
	INNER JOIN dbo.tratamientos T on T.tratamientoId = IM.inspectorId
GROUP BY INS.nombre
GO

GO
CREATE UNIQUE CLUSTERED INDEX IDX_indexView ON IndexView(nombre) ;
GO

select * from DynamicView ;
select * from IndexView WITH (NOEXPAND);

--DROP VIEW DynamicView;
--DROP VIEW IndexView;

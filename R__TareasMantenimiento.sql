-- a)
-- Lista de Stored Procedures
GO
select O.name, M.definition, O.type_desc, O.type
from sys.sql_modules M
inner join sys.objects O on M.object_id = O.object_id
where O.type in ('P');

GO
EXEC sp_helptext N'dbo.llenado'; --Verifica que el SP está encriptado

-- b)
-- View de las tablas relacionadas a la lógica de negocios de la DB
IF OBJECT_ID('dbo.ViewLogicaNegocios','view') IS NOT NULL
	DROP VIEW dbo.ViewLogicaNegocios;
GO
CREATE VIEW dbo.ViewLogicaNegocios 
WITH SCHEMABINDING 
AS 
SELECT 
	P.pagoId,
	P.posttime AS FechaPago,
	T.transaccionId,
	T.posttime AS FechaTransaccion,
	C.contratoId,
	C.productorId,
	C.fechaInicio,
	C.fechaFin,
	MR.movimientoId,
	MR.posttime as FechaMovimiento,
	MR.recolectoraId,
	PXP.productoId,
	PXP.paisId as PaisProducto,
	PXP.precio,
	TXP.tratamientoId,
	TXP.precioXUni,
	TXP.paisId as PaisTratamiento,
	TXP.posttime as FechaPrecioTratamiento,
	TXP.enabled
FROM dbo.pagos P
	INNER JOIN dbo.transacciones T on T.transaccionId = P.transaccionId
	INNER JOIN dbo.contratos C on C.contratoId = T.transaccionId
	INNER JOIN dbo.movimientosRecipiente MR on MR.movimientoId = C.contratoId
	INNER JOIN dbo.preciosProXPais PXP on PXP.productoId = pagoId
	INNER JOIN dbo.preciosTratamientoXPais TXP on TXP.paisId = PXP.paisId 
GO

-- c)
-- Command
DECLARE @spName NVARCHAR(255);
DECLARE spCursor CURSOR FOR
SELECT [name] FROM sys.objects WHERE type = 'P';
OPEN spCursor;
FETCH NEXT FROM spCursor INTO @spName;
WHILE @@FETCH_STATUS = 0
BEGIN
EXEC sp_recompile @spName;
FETCH NEXT FROM spCursor INTO @spName;
END;
CLOSE spCursor;
DEALLOCATE spCursor;

-- d)
-- Llenado de la bitacora del sistema
select * from eventLogs;

GO
create procedure fillEventLog 
as begin
    DECLARE @contador int;
    DECLARE @contador2 int;
     SELECT @contador = MAX(eventLogId)FROM eventLogs;
     set @contador = @contador+1;
     if @contador is null
     begin
        set @contador = 1;
     end
     set @contador2 = @contador+20;
    WHILE (@contador <= @contador2)
    BEGIN
        insert into eventLogs(accesedFrom, checksum, description, value1, value2, reference1, reference2, levelId, sourceId, eventTypeId)
        values ('Laptop', 0x0102030405, 'test', 0, 0, 1, 1, 1, 1, 1 );

    SET @contador = @contador + 1;
    end

end; 

exec fillEventLog;

delete from eventLogs;

SELECT * FROM eventLogs;

drop procedure fillEventLog;

--Insertar into EventTypes, Source, Levels, objectTypes USE [esencialDB]
insert into dbo.eventType(name) values 
('Information'),
('Warning'),
('Error'),
('Success Audit');

insert into dbo.sources(name) values 
('sqlServer');

insert into dbo.levels(description) values 
('Information'),
('Warning'),
('Error'),
('Critical');

insert into dbo.objectTypes(name) values 
('registro');


select * from levels;

-- Link de los servidores
EXEC sp_addlinkedserver
	@server = 'LinkedServer',
	@srvproduct = '',
	@provider = 'SQLNCLI',
	@datasrc = 'DESKTOP-B1OP0U8\MSSQLSERVER01'	

-- Stored Procedure para el Job2
GO
CREATE PROCEDURE TransferirRegistros
AS
BEGIN
    SET NOCOUNT ON;

    -- Transferir registros a la bitácora gemela en el linked server
    INSERT INTO [LinkedServer].[esencialDB].[dbo].[eventLogsGemela]
    SELECT *
    FROM [esencialDB].[dbo].[eventLogs];

    -- Eliminar registros pasados de la bitácora del sistema
	DELETE FROM [esencialDB].[dbo].[eventLogs];
END;

EXEC TransferirRegistros;

drop procedure TransferirRegistros;

select * from dbo.eventLogs;
exec fillEventLog;

select * from [LinkedServer].[esencialDB].[dbo].[eventLogsGemela];
delete from [LinkedServer].[esencialDB].[dbo].[eventLogsGemela];
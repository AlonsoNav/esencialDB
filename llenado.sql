USE [esencialDB]
GO
CREATE PROCEDURE llenado
AS
BEGIN
    DECLARE @nombre varchar(50);
    DECLARE @apellido varchar(50);
    DECLARE @contador INT = 1;
    
	WHILE @contador <= 10000
    BEGIN
        SET @nombre = 'NombreIns:' + CAST(@contador AS varchar(5));
		SET @apellido = 'ApellidoIns:' + CAST(@contador AS varchar(5));;

        INSERT INTO inspectores (nombre, apellido)
        VALUES (@nombre, @apellido);

        SET @contador = @contador + 1;
    END
	SELECT * from inspectores;


	DECLARE @uniMedida varchar(10) = 'kg';
	INSERT INTO tiposDesecho (descripcion, uniMedida)
	VALUES('agua', @uniMedida), ('aire', @uniMedida), ('tierra', @uniMedida), ('fuego', @uniMedida);

	SELECT * from tiposDesecho;

	SET @contador = 1;
	DECLARE @tipoDesecho smallint;
	DECLARE @salubridad decimal(5,2);

	WHILE @contador <= 10000
    BEGIN
		SET @tipoDesecho = RAND() * 3 + 1;
		SET @salubridad = RAND() * 100;
        SET @nombre = 'NombreDes:' + CAST(@contador AS varchar(5));

        INSERT INTO desechos(tipoDesechoId, salubridad, nombre)
        VALUES (@tipoDesecho, @salubridad, @nombre);

        SET @contador = @contador + 1;
    END
	SELECT * from desechos;

	SET @contador = 1;

	WHILE @contador <= 10000
    BEGIN
        SET @nombre = 'Tratamiento:' + CAST(@contador AS varchar(5));;

        INSERT INTO tratamientos(descripcion)
        VALUES (@nombre);

        SET @contador = @contador + 1;
    END
	SELECT * from tratamientos;

	DECLARE @desechoId INT;
	DECLARE @cantidad DECIMAL(18,2);
	DECLARE @tratamientoId INT;
	DECLARE @costoTotal DECIMAL(16,2);
	DECLARE @inspectorId bigint;
	DECLARE @checksum VARBINARY(150);

	SET @contador = 1;

	WHILE @contador <= 100000
    BEGIN
        SET @desechoId = RAND()*9999 + 1;
		SET @cantidad = RAND()*999 + 1;
		SET @tratamientoId= RAND()*9999 + 1;
		SET @costoTotal = RAND()*999 + 1;
		SET @inspectorId = RAND()*9999 + 1;
		SET @checksum = CHECKSUM(@costoTotal, @cantidad);

        INSERT INTO logTratamientos(desechoId, cantidad, tratamientoId, costoTotal, inspectorId, checksum)
        VALUES (@desechoId, @cantidad, @tratamientoId, @costoTotal, @inspectorId, @checksum);

        SET @contador = @contador + 1;
    END

	SET @contador = 1;

	WHILE @contador <= 10000
    BEGIN
        SET @nombre = 'Material:'+ CAST(@contador AS varchar(5));

        INSERT INTO materiales(nombre, uniMedida)
        VALUES (@nombre, @uniMedida);

        SET @contador = @contador + 1;
    END

	SET @contador = 1;
	WHILE @contador <= 10000
    BEGIN
        SET @nombre = 'Producto:' + CAST(@contador AS varchar(5));;

        INSERT INTO productos(descripcion)
        VALUES (@nombre);

        SET @contador = @contador + 1;
    END

	DECLARE @productoId INT;

	SET @contador = 1;
	WHILE @contador <= 10000
    BEGIN
		SET @productoId = RAND()*9999 + 1;
        SET @cantidad = RAND()*999 + 1;
		SET @inspectorId = RAND()*9999 + 1;
		SET @checksum = CHECKSUM(@cantidad);

        INSERT INTO logProducciones(productoId, cantidad, inspectorId, checksum)
        VALUES (@productoId, @cantidad, @inspectorId, @checksum);

        SET @contador = @contador + 1;
    END


	DECLARE @ltId bigint;
	DECLARE @materialId int;
	DECLARE @produccionId int;

	SET @contador = 1;
	WHILE @contador <= 100000
    BEGIN
        SET @ltId = RAND()*99999 + 1;
		SET @materialId = RAND()*9999 + 1;
		SET @cantidad = RAND()*999 + 1;
		SET @inspectorId = RAND()*9999 + 1;
		SET @checksum = CHECKSUM(@ltId, @cantidad);
		SET @produccionId = RAND()*9999 + 1;

        INSERT INTO inventarioMateriales(logTratamiuentoId, materialId, cantidad, inspectorId, checksum,produccionId)
        VALUES (@ltId, @materialId, @cantidad, @inspectorId, @checksum,@produccionId);

        SET @contador = @contador + 1;
    END

END
GO

EXEC llenado 

DROP PROCEDURE llenado


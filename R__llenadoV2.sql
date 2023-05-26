USE[esencialDB]
GO
CREATE PROCEDURE llenado2
AS
BEGIN
	INSERT INTO paises(nombre) VALUES ('COSTA RICA');
	INSERT INTO estados(paisId, nombre) VALUES (1, 'CARTAGO');
	INSERT INTO ciudades(estadoId, nombre) VALUES (1, 'PARAISO');
	INSERT INTO codigosPostales(ciudadId, codigoPostal, distrito) VALUES (1, 20305, 'LLANOS');
	INSERT INTO direcciones (codigoPostalId, direccionFisica, geoLocation) VALUES (1, 'dir Fisica', geography::STGeomFromText('POINT(-122.3493 47.6518)', 4326));
	INSERT INTO regiones(nombre) VALUES ('REGION GEN');
	INSERT INTO tratamientos(descripcion) VALUES ('TRATAMIENTO');
	INSERT INTO contratosStatus(descriptionj) VALUES ('ACTIVE');
	INSERT INTO marcasRecipiente(nombre) VALUES ('MARCA');
	INSERT INTO modelosRecipiente(descripcion, marcaId) VALUES ('MODELO', 1);
	INSERT INTO movementType(descripcion) VALUES('Entrega a recolectora con recipiente lleno'),('Entrega a productor con recipiente vacío');

    DECLARE @nombre varchar(50);
    DECLARE @cuentaBanco varchar(30);
    DECLARE @contador INT = 1;
	DECLARE @contador2 INT;

	SET @contador = 1;
	WHILE @contador <= 300
    BEGIN
		SET @nombre = 'Recipiente:' + CAST(@contador AS varchar(5));
		INSERT tiposRecipiente(description, modeloId, cantDisponible, cantDesechada, cantEnMante, cantEnUso, capacidad, pesoBase) 
		VALUES(@nombre, 1, 0, 0, 0, 0, RAND() * 8999 + 1000, RAND() * 9 + 1);
		INSERT desechosXRecipiente(tipoRecId, tipoDesechoId) VALUES(@contador, RAND()*2+1);

        SET @contador = @contador + 1;
    END

	SET @contador = 1;
	WHILE @contador <= 1000
    BEGIN
        SET @nombre = 'Recolectora:' + CAST(@contador AS varchar(5));
		SET @cuentaBanco = 'CuentaBanco:' + CAST(@contador AS varchar(5));

		INSERT INTO recolectoras(nombre, regionId, direccionId, cuentaBanco) VALUES (@nombre, 1, 1, @cuentaBanco);

		SET @contador2 = 1;

		WHILE @contador2 <= RAND()*29+1
		BEGIN
			INSERT INTO movimientosRecipiente(tipoRecId, cantidadRec, checksum, movementTypeId, recolectoraId, direccionId)
			VALUES(RAND()*299+1, RAND()*9000+1000, CHECKSUM(8), 1, @contador, 1);
			SET @contador2 = @contador2 + 1;
		END

        SET @contador = @contador + 1;
    END

	DECLARE @contaminacionActual DECIMAL(5,2);
	SET @contador = 1;

	WHILE @contador <= 10000
    BEGIN
        SET @nombre = 'Productor:' + CAST(@contador AS varchar(5));
		SET @cuentaBanco = 'CuentaBanco:' + CAST(@contador AS varchar(5));
		SET @contaminacionActual = RAND() * 99 + 1;

		INSERT INTO productores(categoria, descripcion, direccionId, contaminacionActual, balance, cuentaBanco) 
		VALUES (1, @nombre, 1, @contaminacionActual, 0, @cuentaBanco);

		SET @contador2 = 1;

		WHILE @contador2 <= RAND()*29+1
		BEGIN
			INSERT INTO movimientosRecipiente(tipoRecId, cantidadRec, checksum, movementTypeId, productorId, direccionId)
			VALUES(RAND()*299+1, RAND()*9000+1000, CHECKSUM(8), 2, @contador, 1);
			SET @contador2 = @contador2 + 1;
		END

        SET @contador = @contador + 1;
    END

	DECLARE @fechaInicio DATETIME; 
	DECLARE @contador3 INT;
	SET @fechaInicio = DATEADD(day, -1, GETDATE());
	SET @contador = 1;
	WHILE @contador <= 1000
    BEGIN
		SET @contador2 = 1;
		WHILE @contador2 <= RAND()*10
		BEGIN
			SET @contaminacionActual = RAND()*99+1
			INSERT INTO contratos(fechaInicio, checkSum, tipoRecurrencia, contratoStatusId, productorId, porcProductor, porcRecolector, recolectorId) 
			VALUES (@fechaInicio, CHECKSUM(8), 0, 1, RAND()*9999 +1, @contaminacionActual, RAND()*(100-@contaminacionActual)+1, @contador);
			SET @contador3 = 1;
			
			WHILE @contador3 <= RAND()*100
			BEGIN
				INSERT INTO desechoXContrato(contratoId, desechoId, tratamientoId) VALUES (IDENT_CURRENT('contratos'), RAND()*9999+1, 1);
				SET @contador3 = @contador3+1;
			END

			SET @contador2 = @contador2+1;
		END
        SET @contador = @contador + 1;
    END

END


GO
EXEC llenado2

DROP PROCEDURE llenado2


GO
create procedure fillEventLog 
as begin
    DECLARE @contador int;
    DECLARE @contador2 int;
     SELECT @contador = MAX(EventLogId)FROM EventLog;
     set @contador = @contador+1;
     if @contador is null
     begin
        set @contador = 1;
     end
     set @contador2 = @contador+20;
    WHILE (@contador <= @contador2)
    BEGIN
        insert into EventLog(EventLogId, posttime, computer, username, checksum, descripcion, value1, value2, referenceId1, referenceId2, levelId, sourceId, evenTypeId, objectTypeId)
        values (@contador,'2023-4-20' , 'Laptop', SUSER_SNAME(), 100, 'registro de bitacora/pruebas', 0, 0, 0, 0, 1, 1, 1,1 );

    SET @contador = @contador + 1;
    end

end; 
exec fillEventLog;
--delete from EventLog;
SELECT * FROM eventLogs;

--Insertar into EventTypes, Source, Levels, objectTypes
insert into eventType(EventTypeId, name) values 
(1, 'Information'),
(2, 'Warning'),
(3, 'Error'),
(4, 'Success Audit');

insert into dbo.sources(sourceId, name) values 
(1, 'sqlServer');

insert into dbo.levels(levelId, description) values 
(1, 'Information'),
(2, 'Warning'),
(3, 'Error'),
(4, 'Critical');

insert into dbo.objectTypes(objectTypeId, name) values 
(1, 'registro');

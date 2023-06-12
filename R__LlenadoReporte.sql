USE[esencialDB]
GO
CREATE PROCEDURE llenadoReporte
AS
BEGIN
	INSERT INTO paises(nombre) VALUES ('COSTA RICA'), ('NICARAGUA'), ('PANAMA'), ('MEXICO'), ('ESPAÑA');
	INSERT INTO estados(paisId, nombre) VALUES (1, 'CARTAGO'), (2, 'MANAGUA'), (3, 'PANAMA'), (4, 'SINALOA'), (5, 'VALENCIA');
	INSERT INTO ciudades(estadoId, nombre) VALUES (1, 'PARAISO'), (2,'M2'), (3, 'P3'), (4, 'S4'), (5, 'V5');
	INSERT INTO codigosPostales(ciudadId, codigoPostal, distrito) VALUES (1, 20305, 'LLANOS'), (2, 20305, 'M22'), (3, 20305, 'P33'), (4, 20305, 'S44'), (5, 20305, 'V55');
	INSERT INTO direcciones (codigoPostalId, direccionFisica, geoLocation) VALUES (1, 'dir Fisica', geography::STGeomFromText('POINT(-122.3493 47.6518)', 4326)),
	(2, 'dir Fisica', geography::STGeomFromText('POINT(-122.3493 47.6518)', 4326)),
	(3, 'dir Fisica', geography::STGeomFromText('POINT(-122.3493 47.6518)', 4326)),
	(4, 'dir Fisica', geography::STGeomFromText('POINT(-122.3493 47.6518)', 4326)),
	(5, 'dir Fisica', geography::STGeomFromText('POINT(-122.3493 47.6518)', 4326));
	INSERT INTO regiones(nombre) VALUES ('CENTROAMERICA'), ('LOS OTROS');
	INSERT INTO paisesXregion(paisId, regionId) VALUES (1,1), (2,1), (3,1), (4,2), (5,2);
	INSERT INTO movementType(descripcion) VALUES('Tratamiento a desecho');
    DECLARE @uniMedida varchar(10) = 'kg';
	INSERT INTO tiposDesecho (descripcion, uniMedida)
	VALUES('agua', @uniMedida), ('aire', @uniMedida), ('tierra', @uniMedida), ('fuego', @uniMedida);
	INSERT INTO industrias(name) values('Alimenticia'),
	('Distribucion Digital'),
	('Farmaceutica'),
	('Siderurgica'),
	('Metalurgica'),
	('Quimica'),
	('PetroQuimica'),
	('Textil'),
	('Automotriz'),
	('Inmobiliaria');

	DECLARE @contador INT = 1;
	DECLARE @contador2 INT = 1;
	DECLARE @nombre varchar(50);

	WHILE @contador <= 100
	BEGIN
		SET @nombre = 'Material:' + CAST(@contador AS varchar(5));
		INSERT INTO materiales(nombre, uniMedida)
		VALUES (@nombre, @uniMedida);

		WHILE @contador2 <= 5 
		BEGIN
		INSERT INTO preciosProXPais(paisId, precio, checksum, materialId)
		VALUES (@contador2, RAND()* 6+7, checksum(8), @contador);
		SET @contador2 = @contador2 + 1;
		END
		SET @contador = @contador + 1;
	END

	SET @contador = 1;
	WHILE @contador <= 100
    BEGIN
		SET @nombre = 'Tratamiento:' + CAST(@contador AS varchar(5));
        INSERT INTO tratamientos(descripcion)
        VALUES (@nombre);
		SET @contador2 = 1;

		WHILE @contador2 <= 5 
		BEGIN
		INSERT INTO preciosTratamientoXPais(paisId, precioXUni, checksum, tratamientoId)
		VALUES (@contador2, RAND()* 6 + 1, checksum(8), @contador);
		SET @contador2 = @contador2 + 1;
		END

        SET @contador = @contador + 1;
    END

	SET @contador = 1;
	DECLARE @tipoDesecho smallint;
	DECLARE @salubridad decimal(5,2);

	WHILE @contador <= 1000
    BEGIN
		SET @tipoDesecho = RAND() * 3 + 1;
		SET @salubridad = RAND() * 100;
        SET @nombre = 'Desecho:' + CAST(@contador AS varchar(5));

        INSERT INTO desechos(tipoDesechoId, salubridad, nombre)
        VALUES (@tipoDesecho, @salubridad, @nombre);
		INSERT INTO desechosXtratamiento (tratamientoId, desechoId)
		VALUES (RAND()*99 + 1, @contador);

        SET @contador = @contador + 1;
    END

	DECLARE @cuentaBanco varchar(30);
	SET @contador = 1;
	WHILE @contador <= 1000
    BEGIN
        SET @nombre = 'Recolectora:' + CAST(@contador AS varchar(5));
		SET @cuentaBanco = 'CuentaBanco:' + CAST(@contador AS varchar(5));

		INSERT INTO recolectoras(nombre, regionId, direccionId, cuentaBanco) 
		VALUES (@nombre, 1, RAND()*4+1, @cuentaBanco);
        SET @contador = @contador + 1;
    END

	SET @contador = 1;
	WHILE @contador <= 10000
    BEGIN
        SET @nombre = 'Productor:' + CAST(@contador AS varchar(5));
		SET @cuentaBanco = 'CuentaBanco:' + CAST(@contador AS varchar(5));

		INSERT INTO productores(industriaId, descripcion, direccionId, contaminacionActual, balance, cuentaBanco) 
		VALUES (RAND()*9+1, @nombre, RAND()*4+1, RAND() * 99 + 1, 0, @cuentaBanco);

        SET @contador = @contador + 1;
    END

	SET @contador = 1;
	WHILE @contador <= 10000
    BEGIN
		INSERT INTO plantas(direccion) 
		VALUES (RAND()*4+1);

        SET @contador = @contador + 1;
    END

	SET @contador = 1
    DECLARE @EndDate DATE = GETDATE() -- Fecha actual
    DECLARE @StartDate DATE = DATEADD(DAY, -1000, @EndDate) -- Fecha 1000 días atrás
	DECLARE @desId INT, @proId INT, @traId INT, @dirId BIGINT, @cant BIGINT, @cantAux BIGINT, @matId INT, @monto DECIMAL(18,2), @precio DECIMAL(18,2);

    WHILE @StartDate <= @EndDate
    BEGIN
		SET @desId = RAND()*999 + 1;
		SET @proId = rand()*9999 + 1;
		SET @cant = RAND()*1000+1000;
		SET @matId = RAND()*99+1;
		SELECT @traId = tratamientoId FROM desechosXtratamiento WHERE desechoId = @desId;
		SELECT @dirId = direccionId FROM productores WHERE productorId = @proId;
		
		SELECT @precio = PPXP.precio FROM productores P
		INNER JOIN direcciones DIR ON DIR.direccionId = P.direccionId
		INNER JOIN codigosPostales CP ON CP.codigoPostalId = Dir.codigoPostalId
		INNER JOIN ciudades C ON C.ciudadId = CP.ciudadId
		INNER JOIN estados E ON E.estadoId = C.estadoId
		INNER JOIN preciosProXPais PPXP ON PPXP.paisId = E.paisId
		WHERE P.productorId = @proId;

		INSERT INTO movimientosRecipiente(fecha, desechoId, cantidadDes, checksum, movementTypeId, plantaId, productorId, recolectoraId, tratamientoId, direccionId)
		VALUES (@StartDate, @desId, @cant, checksum(8), 1, rand()*9999 + 1, @proId, rand()*999 + 1, @traId, @dirId);
		SET @cant = @cant - @cant / 10
		INSERT INTO inventarioMateriales(movimientoId, materialId, cantidad, checksum) 
		VALUES (@contador, @matId, @cant, checksum(8));

		WHILE @cant > 100
		BEGIN
			SET @cantAux = RAND () * 50 +50;
			INSERT INTO logVentas(inventarioID, materialId, cantidad, monto, checksum)
			VALUES(@contador, @matId, @cantAux, @cantAux * @precio, checksum(8));
			SET @cant = @cant - @cantAux;
		END
		INSERT INTO logVentas(inventarioID, materialId, cantidad, monto, checksum)
		VALUES(@contador, @matId, @cant, @cant * @precio, checksum(8));
		

		SET @contador = @contador + 1;
        SET @StartDate = DATEADD(DAY, 1, @StartDate)
    END

END


GO
EXEC llenadoReporte

-- DROP PROCEDURE llenadoReporte

/* 
Consultas sobre ciudades con sus desechos
y respectivos recolectores
*/

-- Llenado de Movimientos de Recipientes Actualizado drop procedure FillMovimientosRecipientes

USE esencialDB
GO
CREATE PROCEDURE FillMovimientosRecipientes
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
	INSERT INTO movementType(descripcion) VALUES('Entrega a recolectora con recipiente lleno'),('Entrega a productor con recipiente vacío'), ('Entrega de recipientes Planta->Recolector'), ('Nuevos recipientes'), ('Mantenimiento recipientes');
	INSERT INTO plantas(direccion) VALUES(1)
	INSERT INTO estados(paisId, nombre) VALUES 
	(1, 'SAN JOSE'),
	(1, 'ALAJUELA'),
	(1, 'HEREDIA'),
	(1, 'PUNTARENAS'),
	(1, 'GUANACASTE'),
	(1, 'LIMON');

	INSERT INTO ciudades(estadoId, nombre) VALUES 
	(1, 'EL TEJAR'),
	(1, 'TARAS'),
	(1, 'ORIENTAL'),
	(2, 'ESCAZU'),
	(2, 'SAN PEDRO'),
	(2, 'CURRIDABAT'),
	(2, 'SANTA ANA'),
	(3, 'SAN RAMON'),
	(3, 'CD QUESADA'),
	(3, 'LA FORTUNA'),
	(3, 'ATENAS'),
	(4, 'BELEN'),
	(4, 'SAN ISIDRO'),
	(4, 'SAN RAFAEL'),
	(4, 'SANTO DOMINGO'),
	(5, 'EL ROBLE'),
	(5, 'PUNTARENAS'),
	(5, 'QUEPOS'),
	(5, 'GOLFITO'),
	(5, 'CALDERA'),
	(5, 'ESPARZA'),
	(6, 'SANTA CRUZ'),
	(6, 'TAMARINDO'),
	(6, 'ABANGARES'),
	(7, 'PUERTO VIEJO'),
	(7, 'LIMON'),
	(7, 'SIQUIRRES'),
	(7, 'BRIBRI'),
	(7, 'GUAPILES');

	INSERT INTO codigosPostales(ciudadId, codigoPostal, distrito) VALUES 
	(2, 30801, 'TEJAR'),
	(3, 30104, 'SAN NICOLAS'),
	(4, 30101, 'ORIENTAL'),
	(5, 10201, 'ESCAZU'),
	(6, 11501, 'ROOSEVELT'),
	(7, 11801, 'EL HOGAR'),
	(8, 10903, 'POZOS SUR'),
	(9, 20201, 'BELEN'),
	(10, 21001, 'EL JARDIN'),
	(11, 21007, 'FORTUNA'),
	(12, 20501, 'ATENAS'),
	(13, 40703, 'BELEN'),
	(14, 40601, 'SAN ISIDRO'),
	(15, 40501, 'TERRAZA'),
	(16, 40301, 'LOS ANGELES'),
	(17, 60015, 'EL ROBLE'),
	(18, 60016, 'PUNTARENAS'),
	(19, 60017, 'QUEPOS'),
	(20, 60018, 'GOLFITO'),
	(21, 60019, 'CALDERA'),
	(22, 60020, 'ESPARZA'),
	(23, 50001, 'SANTA CRUZ'),
	(24, 50002, 'TAMARINDO'),
	(25, 50003, 'ABANGARES'),
	(26, 70001, 'PUERTO VIEJO'),
	(27, 70002, 'LIMON'),
	(28, 70003, 'SIQUIRRES'),
	(29, 70004, 'BRIBRI'),
	(30, 70005, 'GUAPILES');

	INSERT INTO direcciones (codigoPostalId, direccionFisica, geoLocation) VALUES 
	(2, 'dir Fisica', geography::STGeomFromText('POINT(-122.3493 47.6518)', 4326)),
	(3, 'dir Fisica', geography::STGeomFromText('POINT(-122.3493 47.6518)', 4326)),
	(4, 'dir Fisica', geography::STGeomFromText('POINT(-122.3493 47.6518)', 4326)),
	(5, 'dir Fisica', geography::STGeomFromText('POINT(-122.3493 47.6518)', 4326)),
	(6, 'dir Fisica', geography::STGeomFromText('POINT(-122.3493 47.6518)', 4326)),
	(7, 'dir Fisica', geography::STGeomFromText('POINT(-122.3493 47.6518)', 4326)),
	(8, 'dir Fisica', geography::STGeomFromText('POINT(-122.3493 47.6518)', 4326)),
	(9, 'dir Fisica', geography::STGeomFromText('POINT(-122.3493 47.6518)', 4326)),
	(10, 'dir Fisica', geography::STGeomFromText('POINT(-122.3493 47.6518)', 4326)),
	(11, 'dir Fisica', geography::STGeomFromText('POINT(-122.3493 47.6518)', 4326)),
	(12, 'dir Fisica', geography::STGeomFromText('POINT(-122.3493 47.6518)', 4326)),
	(13, 'dir Fisica', geography::STGeomFromText('POINT(-122.3493 47.6518)', 4326)),
	(14, 'dir Fisica', geography::STGeomFromText('POINT(-122.3493 47.6518)', 4326)),
	(15, 'dir Fisica', geography::STGeomFromText('POINT(-122.3493 47.6518)', 4326)),
	(16, 'dir Fisica', geography::STGeomFromText('POINT(-122.3493 47.6518)', 4326)),
	(17, 'dir Fisica', geography::STGeomFromText('POINT(-122.3493 47.6518)', 4326)),
	(18, 'dir Fisica', geography::STGeomFromText('POINT(-122.3493 47.6518)', 4326)),
	(19, 'dir Fisica', geography::STGeomFromText('POINT(-122.3493 47.6518)', 4326)),
	(20, 'dir Fisica', geography::STGeomFromText('POINT(-122.3493 47.6518)', 4326)),
	(21, 'dir Fisica', geography::STGeomFromText('POINT(-122.3493 47.6518)', 4326)),
	(22, 'dir Fisica', geography::STGeomFromText('POINT(-122.3493 47.6518)', 4326)),
	(23, 'dir Fisica', geography::STGeomFromText('POINT(-122.3493 47.6518)', 4326)),
	(24, 'dir Fisica', geography::STGeomFromText('POINT(-122.3493 47.6518)', 4326)),
	(25, 'dir Fisica', geography::STGeomFromText('POINT(-122.3493 47.6518)', 4326)),
	(26, 'dir Fisica', geography::STGeomFromText('POINT(-122.3493 47.6518)', 4326)),
	(27, 'dir Fisica', geography::STGeomFromText('POINT(-122.3493 47.6518)', 4326)),
	(28, 'dir Fisica', geography::STGeomFromText('POINT(-122.3493 47.6518)', 4326)),
	(29, 'dir Fisica', geography::STGeomFromText('POINT(-122.3493 47.6518)', 4326)),
	(30, 'dir Fisica', geography::STGeomFromText('POINT(-122.3493 47.6518)', 4326));
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
	DECLARE @uniMedida varchar(10) = 'kg';
	INSERT INTO tiposDesecho (descripcion, uniMedida)
	VALUES('agua', @uniMedida), ('aire', @uniMedida), ('tierra', @uniMedida), ('fuego', @uniMedida);

	-- Movement Type select * from movementType
	INSERT INTO movementType(descripcion)
	VALUES('Entrega de recipientes Recolector->Planta')

	DECLARE @contador INT = 1;

	-- Fill Plantas
	SET @contador = 1;
	WHILE @contador <= 30
	BEGIN
		INSERT INTO plantas(direccion) VALUES (@contador)
		SET @contador = @contador + 1
	END
	----------------------------
    DECLARE @nombre varchar(50);
    DECLARE @cuentaBanco varchar(30);
	---------------------------
	SET @contador = 1;
	DECLARE @tipoDesecho smallint;
	DECLARE @salubridad decimal(5,2);

	WHILE @contador <= 10000
    BEGIN
		SET @tipoDesecho = RAND() * 3 + 1;
		SET @salubridad = RAND() * 100;
        SET @nombre = 'Desecho:' + CAST(@contador AS varchar(5));

        INSERT INTO desechos(tipoDesechoId, salubridad, nombre)
        VALUES (@tipoDesecho, @salubridad, @nombre);

        SET @contador = @contador + 1;
    END
	-----------
	SET @contador = 1;
	WHILE @contador <= 300
    BEGIN
		SET @nombre = 'Recipiente:' + CAST(@contador AS varchar(5));
		INSERT tiposRecipiente(description, modeloId, cantDisponible, cantDesechada, cantEnMante, cantEnUso, capacidad, pesoBase) 
		VALUES(@nombre, 1, 1000, 0, 500, 0, RAND() * 8999 + 1000, RAND() * 9 + 1);
		INSERT desechosXRecipiente(tipoRecId, tipoDesechoId) VALUES(@contador, RAND()*2+1);

        SET @contador = @contador + 1;
    END

	DECLARE @contaminacionActual DECIMAL(5,2);

	SET @contador = 1;
	WHILE @contador <= 5000
    BEGIN

		SET @nombre = 'Recolectora:' + CAST(@contador AS varchar(5));
		SET @cuentaBanco = 'CuentaBanco:' + CAST(@contador AS varchar(5));

		INSERT INTO recolectoras(nombre, regionId, direccionId, cuentaBanco) 
		VALUES (@nombre, 1, RAND()*29+1, @cuentaBanco);

        SET @nombre = 'Productor:' + CAST(@contador AS varchar(5));
		SET @contaminacionActual = RAND() * 99 + 1;

		INSERT INTO productores(industriaId, descripcion, direccionId, contaminacionActual, balance, cuentaBanco) 
		VALUES (1, @nombre, RAND()*29+1, @contaminacionActual, 0, @cuentaBanco);

        SET @contador = @contador + 1;
    END

	SET @contador = 1;
	WHILE @contador <= 10000
	BEGIN
		INSERT INTO movimientosRecipiente(tipoRecId, cantidadRec, checksum, movementTypeId, 
		productorId, direccionId,plantaId,recolectoraId,desechoId,cantidadDes)
		VALUES(RAND()*299+1, RAND()*9000+1000, CHECKSUM(8), 1, RAND()*4999+1, RAND()*29+1,RAND()*29+1,RAND()*4999+1,
		RAND()*9999+1,RAND()*9999+1);
	SET @contador = @contador + 1;
	END
END
GO
EXEC FillMovimientosRecipientes

-- Consultas
SELECT * FROM movimientosRecipiente
SELECT * FROM tiposRecipiente
SELECT * FROM desechos
SELECT * FROM ciudades

-- Por Ciudad
SELECT C.nombre AS CiudadProductora, plantaId AS CentroRecoleccion, SUM(cantidadDes) AS VolumenAcumulado
FROM movimientosRecipiente MR
	INNER JOIN productores P ON MR.productorId = P.productorId
	INNER JOIN direcciones D ON P.direccionId = D.direccionId
	INNER JOIN codigosPostales CP ON D.codigoPostalId = CP.codigoPostalId
	INNER JOIN ciudades C ON CP.ciudadId = C.ciudadId
GROUP BY c.nombre, plantaId
ORDER BY c.nombre

-- Por Empresa Productora
SELECT P.productorId AS EmpresaProductora, plantaId AS CentroRecoleccion, SUM(cantidadDes) AS VolumenAcumulado
FROM movimientosRecipiente MR
	INNER JOIN productores P ON MR.productorId = P.productorId
GROUP BY P.productorId, plantaId
ORDER BY  P.productorId

-- Por Empresa Recolectora
SELECT plantaId AS EmpresaRecolectora, C.nombre AS CiudadProductora, SUM(cantidadDes) AS VolumenAcumulado
FROM movimientosRecipiente MR
	INNER JOIN productores P ON MR.productorId = P.productorId
	INNER JOIN direcciones D ON P.direccionId = D.direccionId
	INNER JOIN codigosPostales CP ON D.codigoPostalId = CP.codigoPostalId
	INNER JOIN ciudades C ON CP.ciudadId = C.ciudadId
GROUP BY c.nombre, plantaId
ORDER BY plantaId
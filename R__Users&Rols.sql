-- A
USE esencialDB;
CREATE LOGIN userA WITH PASSWORD = '1234';
CREATE USER userA FOR LOGIN userA;
EXEC sp_addrolemember 'db_datareader', 'userA';
EXEC sp_addrolemember 'db_datawriter', 'userA';
-- DENY SELECT, INSERT, UPDATE, DELETE ON SCHEMA::dbo TO public;	Esto le quitaría el acceso a todos los roles públicos.
DENY SELECT, INSERT, UPDATE, DELETE ON SCHEMA::dbo TO userA;
GRANT EXECUTE TO userA; -- Aunque puede darse acceso a SP particulares
-- Pruebas
SELECT recolectoraId, nombre FROM recolectoras;
EXEC SP_GetRecolectores

-- B
USE esencialDB;
CREATE LOGIN userB1 WITH PASSWORD = '1234';
CREATE USER userB1 FOR LOGIN userB1;
CREATE LOGIN userB2 WITH PASSWORD = '1234';
CREATE USER userB2 FOR LOGIN userB2;
EXEC sp_addrolemember 'db_datareader', 'userB1';
EXEC sp_addrolemember 'db_datareader', 'userB2';
EXEC sp_addrolemember 'db_datawriter', 'userB1';
EXEC sp_addrolemember 'db_datawriter', 'userB2';
DENY SELECT ON recolectoras(regionId, direccionId, cuentaBanco) TO userB1; -- Se puede negar la actualización también
DENY SELECT ON tiposRecipiente(cantDisponible, cantDesechada, cantEnMante, cantEnUso) TO userB2;
-- Pruebas
SELECT * FROM recolectoras
SELECT * FROM tiposRecipiente
SELECT recolectoraId, nombre FROM recolectoras
SELECT tipoRecId, description FROM tiposRecipiente

-- C
USE esencialDB
CREATE LOGIN userC1 WITH PASSWORD = '1234';
CREATE USER userC1 FOR LOGIN userC1;
CREATE LOGIN userC2 WITH PASSWORD = '1234';
CREATE USER userC2 FOR LOGIN userC2;
EXEC sp_addrolemember 'db_datareader', 'userC1';
EXEC sp_addrolemember 'db_datareader', 'userC2';
EXEC sp_addrolemember 'db_datawriter', 'userC1';
EXEC sp_addrolemember 'db_datawriter', 'userC2';
CREATE ROLE db_finanzas
DENY SELECT, INSERT, UPDATE, DELETE ON contactosXAsociaciones TO db_finanzas;
DENY SELECT, INSERT, UPDATE, DELETE ON contactosXGobierno TO db_finanzas;
DENY SELECT, INSERT, UPDATE, DELETE ON contactosXInspector TO db_finanzas;
DENY SELECT, INSERT, UPDATE, DELETE ON contactosXMarca TO db_finanzas;
DENY SELECT, INSERT, UPDATE, DELETE ON contactosXPlanta TO db_finanzas;
DENY SELECT, INSERT, UPDATE, DELETE ON contactosXProductor TO db_finanzas;
DENY SELECT, INSERT, UPDATE, DELETE ON contactosXrecolectora TO db_finanzas;
DENY SELECT, INSERT, UPDATE, DELETE ON contactosXSubproductores TO db_finanzas;
DENY SELECT, INSERT, UPDATE, DELETE ON contactosXUsuario TO db_finanzas;
DENY SELECT ON productores(direccionId, contaminacionActual) TO db_finanzas;
EXEC sp_addrolemember 'db_finanzas', 'userC1';
EXEC sp_addrolemember 'db_finanzas', 'userC2';

SELECT * FROM productores;
SELECT cuentaBanco FROM productores;
SELECT * FROM contactosXAsociaciones;

--D
USE esencialDB
CREATE LOGIN userD1 WITH PASSWORD = '1234';
CREATE USER userD1 FOR LOGIN userD1;
CREATE LOGIN userD2 WITH PASSWORD = '1234';
CREATE USER userD2 FOR LOGIN userD2;
EXEC sp_addrolemember 'db_datawriter', 'userD1';
EXEC sp_addrolemember 'db_datareader', 'userD1';
EXEC sp_addrolemember 'db_datawriter', 'userD2';
EXEC sp_addrolemember 'db_datareader', 'userD2';
CREATE ROLE db_no_finanzas
GRANT SELECT ON contactosXAsociaciones TO db_no_finanzas;
ALTER ROLE db_finanzas ADD MEMBER db_no_finanzas;
EXEC sp_addrolemember 'db_finanzas', 'userD1';
EXEC sp_addrolemember 'db_no_finanzas', 'userD2';
SELECT * from contactosXAsociaciones;
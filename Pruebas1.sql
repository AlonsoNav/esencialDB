-- Pruebas#1
-- Dirty Read
-- USE [esencialDB] 
-- SELECT * FROM tiposRecipiente
-- DROP PROCEDURE SP_EntregarRecipienteARecolector3
-- EXEC SP_ComprarRecipientes 1, 200, 1

-- Last Update
-- SELECT * FROM tiposRecipiente
-- EXEC SP_EntregarRecipienteARecolector2 3, 200, 1, 1
-- DROP PROCEDURE SP_EntregarRecipienteARecolector2

-- Phantom Read
-- SELECT SUM(cantidadRec) FROM movimientosRecipiente WHERE plantaId = 1 AND tipoRecId = 5
-- EXEC SP_EntregarRecipienteARecolector4 5, 900, 1, 1
-- DROP PROCEDURE SP_EntregarRecipienteARecolector4

-- Deadlock
/* DECLARE @recs1 RecTVP
   INSERT INTO @recs1 VALUES(8),(11)
   EXEC SP_MantenimientoRecipientesRango @recs1, 1
*/
-- DROP PROCEDURE SP_MantenimientoRecipientesRango
-- DROP TYPE RecTVP
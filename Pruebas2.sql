-- Pruebas #2
-- Dirty Read
-- USE [esencialDB]
-- SELECT * FROM tiposRecipiente
-- EXEC SP_EntregarRecipienteARecolector3 1, 100, 1, 1

-- Last Update
-- SELECT * FROM tiposRecipiente
-- EXEC SP_EntregarRecipienteARecolector1 3, 400, 1, 1
-- DROP PROCEDURE SP_EntregarRecipienteARecolector1

-- Phantom Read
-- SELECT SUM(cantidadRec) FROM movimientosRecipiente WHERE plantaId = 1 AND tipoRecId = 5
-- EXEC SP_EntregarRecipienteARecolector5 5, 900, 1, 1
-- DROP PROCEDURE SP_EntregarRecipienteARecolector5

-- Deadlock
/* DECLARE @recs2 RecTVP
   INSERT INTO @recs2 VALUES(11),(8)
   EXEC SP_MantenimientoRecipientesRango @recs2, 1
*/
-- DROP PROCEDURE SP_MantenimientoRecipientesRango
-- DROP TYPE RecTVP
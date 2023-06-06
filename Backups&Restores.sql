-- BackUps Y Restore

-- Modelo de Recuperación
USE master
ALTER DATABASE esencialDB
SET RECOVERY full -- Se utiliza el modelo completo por que permite backup de log de transacciones
-- Además este modelo deja guardadas todas las transacciones que se realizan en el log de transacciones

-------------------------------- BACKUPS ----------------------------------------
-- Full Backup
BACKUP DATABASE esencialDB
TO DISK = 'C:\Users\Dominic\OneDrive - Estudiantes ITCR\Escritorio\backups.bak' --Ruta de Guardado
WITH NAME = 'BACKUP COMPLETO'
, DESCRIPTION = 'BACKUP COMPLETO DE LA DATABASE'

-- Log Transaction Backup (Incremental)
BACKUP LOG esencialDB
TO DISK = 'C:\Users\Dominic\OneDrive - Estudiantes ITCR\Escritorio\backups.bak' --Ruta de Guardado
WITH NAME = 'BACKUP INCREMENTAL'
, DESCRIPTION = 'LOG TRANSACTION BACKUP DE LA DATABASE'

-- Verifica el contenido del archivo de backups
RESTORE HEADERONLY FROM DISK = 'C:\Users\Dominic\OneDrive - Estudiantes ITCR\Escritorio\backups.bak'
---
--------------------------------- RESTORES -------------------------------------
---
DROP DATABASE esencialDB
--

--Restore Full Backup
RESTORE	DATABASE esencialDB
FROM DISK ='C:\Users\Dominic\OneDrive - Estudiantes ITCR\Escritorio\backups.bak'
WITH FILE = 1, NORECOVERY


--Restore Log Transaction Backup
RESTORE	LOG esencialDB
FROM DISK ='C:\Users\Dominic\OneDrive - Estudiantes ITCR\Escritorio\backups.bak'
WITH FILE = 2, RECOVERY

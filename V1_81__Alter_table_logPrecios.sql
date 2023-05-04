ALTER TABLE [dbo].[logPrecios] ADD  CONSTRAINT [DF_logPreciosTratamiento_accesedFrom]  DEFAULT ('root') FOR [accesedFrom]
GO
ALTER TABLE [dbo].[logVentas] ADD  CONSTRAINT [DF_logVentas_accesedFrom]  DEFAULT ('root') FOR [accesedFrom]
GO
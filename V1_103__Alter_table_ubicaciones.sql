ALTER TABLE [dbo].[ubicaciones] ADD  CONSTRAINT [DF_ubicaciones_accesedFrom]  DEFAULT ('root') FOR [accesedFrom]
GO
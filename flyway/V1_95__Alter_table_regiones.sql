ALTER TABLE [dbo].[regiones] ADD  CONSTRAINT [DF_regiones_enabled]  DEFAULT ((1)) FOR [enabled]
GO
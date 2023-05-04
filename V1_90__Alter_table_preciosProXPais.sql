ALTER TABLE [dbo].[preciosProXPais] ADD  CONSTRAINT [DF_preciosProXPais_accesedFrom]  DEFAULT ('root') FOR [accesedFrom]
GO
ALTER TABLE [dbo].[preciosProXPais]  WITH CHECK ADD  CONSTRAINT [FK_preciosProXPais_productos] FOREIGN KEY([productoId])
REFERENCES [dbo].[productos] ([productoId])
GO
ALTER TABLE [dbo].[preciosProXPais] CHECK CONSTRAINT [FK_preciosProXPais_productos]
GO
ALTER TABLE [dbo].[codigosPostales]  WITH CHECK ADD  CONSTRAINT [FK_codigosPostales_ciudades] FOREIGN KEY([codigoPostalId])
REFERENCES [dbo].[ciudades] ([ciudadId])
GO
ALTER TABLE [dbo].[codigosPostales] CHECK CONSTRAINT [FK_codigosPostales_ciudades]
GO
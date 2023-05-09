ALTER TABLE [dbo].[direcciones]  WITH CHECK ADD  CONSTRAINT [FK_direcciones_codigosPostales] FOREIGN KEY([codigoPostalId])
REFERENCES [dbo].[codigosPostales] ([codigoPostalId])
GO
ALTER TABLE [dbo].[direcciones] CHECK CONSTRAINT [FK_direcciones_codigosPostales]
GO
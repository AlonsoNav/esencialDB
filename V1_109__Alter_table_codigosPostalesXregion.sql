ALTER TABLE [dbo].[codigosPostalesXregion]  WITH CHECK ADD  CONSTRAINT [FK_codigosPostalesXregion_codigosPostales] FOREIGN KEY([codigoPostalId])
REFERENCES [dbo].[codigosPostales] ([codigoPostalId])
GO
ALTER TABLE [dbo].[codigosPostalesXregion] CHECK CONSTRAINT [FK_codigosPostalesXregion_codigosPostales]
GO
ALTER TABLE [dbo].[codigosPostalesXregion]  WITH CHECK ADD  CONSTRAINT [FK_codigosPostalesXregion_regiones1] FOREIGN KEY([regionId])
REFERENCES [dbo].[regiones] ([regionId])
GO
ALTER TABLE [dbo].[codigosPostalesXregion] CHECK CONSTRAINT [FK_codigosPostalesXregion_regiones1]
GO
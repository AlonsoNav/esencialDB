ALTER TABLE [dbo].[idiomasXRegion]  WITH CHECK ADD  CONSTRAINT [FK_idiomasXpais_idiomas] FOREIGN KEY([idiomaId])
REFERENCES [dbo].[idiomas] ([idiomaId])
GO
ALTER TABLE [dbo].[idiomasXRegion] CHECK CONSTRAINT [FK_idiomasXpais_idiomas]
GO
ALTER TABLE [dbo].[idiomasXRegion]  WITH CHECK ADD  CONSTRAINT [FK_idiomasXRegion_regiones] FOREIGN KEY([regionId])
REFERENCES [dbo].[regiones] ([regionId])
GO
ALTER TABLE [dbo].[idiomasXRegion] CHECK CONSTRAINT [FK_idiomasXRegion_regiones]
GO
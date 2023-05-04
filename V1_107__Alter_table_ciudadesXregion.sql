ALTER TABLE [dbo].[ciudadesXregion]  WITH CHECK ADD  CONSTRAINT [FK_ciudadesXregion_ciudades] FOREIGN KEY([ciudadId])
REFERENCES [dbo].[ciudades] ([ciudadId])
GO
ALTER TABLE [dbo].[ciudadesXregion] CHECK CONSTRAINT [FK_ciudadesXregion_ciudades]
GO
ALTER TABLE [dbo].[ciudadesXregion]  WITH CHECK ADD  CONSTRAINT [FK_ciudadesXregion_regiones1] FOREIGN KEY([regionId])
REFERENCES [dbo].[regiones] ([regionId])
GO
ALTER TABLE [dbo].[ciudadesXregion] CHECK CONSTRAINT [FK_ciudadesXregion_regiones1]
GO
ALTER TABLE [dbo].[paisesXregion]  WITH CHECK ADD  CONSTRAINT [FK_paisesXregion_paises] FOREIGN KEY([paisId])
REFERENCES [dbo].[paises] ([paisId])
GO
ALTER TABLE [dbo].[paisesXregion] CHECK CONSTRAINT [FK_paisesXregion_paises]
GO
ALTER TABLE [dbo].[paisesXregion]  WITH CHECK ADD  CONSTRAINT [FK_paisesXregion_regiones1] FOREIGN KEY([regionId])
REFERENCES [dbo].[regiones] ([regionId])
GO
ALTER TABLE [dbo].[paisesXregion] CHECK CONSTRAINT [FK_paisesXregion_regiones1]
GO
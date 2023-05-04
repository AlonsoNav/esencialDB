ALTER TABLE [dbo].[estadosXregion]  WITH CHECK ADD  CONSTRAINT [FK_estadosXregion_estados] FOREIGN KEY([estadoId])
REFERENCES [dbo].[estados] ([estadoId])
GO
ALTER TABLE [dbo].[estadosXregion] CHECK CONSTRAINT [FK_estadosXregion_estados]
GO
ALTER TABLE [dbo].[estadosXregion]  WITH CHECK ADD  CONSTRAINT [FK_estadosXregion_regiones1] FOREIGN KEY([regionId])
REFERENCES [dbo].[regiones] ([regionId])
GO
ALTER TABLE [dbo].[estadosXregion] CHECK CONSTRAINT [FK_estadosXregion_regiones1]
GO
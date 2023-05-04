ALTER TABLE [dbo].[gobiernos]  WITH CHECK ADD  CONSTRAINT [FK_gobiernos_regiones] FOREIGN KEY([regionId])
REFERENCES [dbo].[regiones] ([regionId])
GO
ALTER TABLE [dbo].[gobiernos] CHECK CONSTRAINT [FK_gobiernos_regiones]
GO
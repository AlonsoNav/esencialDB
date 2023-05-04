ALTER TABLE [dbo].[sponsors]  WITH CHECK ADD  CONSTRAINT [FK_sponsors_contratos] FOREIGN KEY([contratoId])
REFERENCES [dbo].[contratos] ([contratoId])
GO
ALTER TABLE [dbo].[sponsors] CHECK CONSTRAINT [FK_sponsors_contratos]
GO
ALTER TABLE [dbo].[sponsors]  WITH CHECK ADD  CONSTRAINT [FK_sponsors_productores] FOREIGN KEY([productorId])
REFERENCES [dbo].[productores] ([productorId])
GO
ALTER TABLE [dbo].[sponsors] CHECK CONSTRAINT [FK_sponsors_productores]
GO
ALTER TABLE [dbo].[sponsors]  WITH CHECK ADD  CONSTRAINT [FK_sponsors_regiones] FOREIGN KEY([regionId])
REFERENCES [dbo].[regiones] ([regionId])
GO
ALTER TABLE [dbo].[sponsors] CHECK CONSTRAINT [FK_sponsors_regiones]
GO
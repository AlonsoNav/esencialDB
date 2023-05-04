ALTER TABLE [dbo].[recolectoras] ADD  CONSTRAINT [DF_empresasRecolectoras_estado_1]  DEFAULT ((1)) FOR [enabled]
GO
ALTER TABLE [dbo].[recolectoras]  WITH CHECK ADD  CONSTRAINT [FK_recolectoras_direcciones] FOREIGN KEY([direccionId])
REFERENCES [dbo].[direcciones] ([direccionId])
GO
ALTER TABLE [dbo].[recolectoras] CHECK CONSTRAINT [FK_recolectoras_direcciones]
GO
ALTER TABLE [dbo].[recolectoras]  WITH CHECK ADD  CONSTRAINT [FK_recolectoras_regiones] FOREIGN KEY([regionId])
REFERENCES [dbo].[regiones] ([regionId])
GO
ALTER TABLE [dbo].[recolectoras] CHECK CONSTRAINT [FK_recolectoras_regiones]
GO
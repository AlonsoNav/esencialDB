ALTER TABLE [dbo].[inventarioMateriales] ADD  CONSTRAINT [DF_inventarioMateriales_accesedFrom]  DEFAULT ('root') FOR [accesedFrom]
GO
ALTER TABLE [dbo].[inventarioMateriales]  WITH CHECK ADD  CONSTRAINT [FK_inventarioMateriales_inspectores] FOREIGN KEY([inspectorId])
REFERENCES [dbo].[inspectores] ([inspectorId])
GO
ALTER TABLE [dbo].[inventarioMateriales] CHECK CONSTRAINT [FK_inventarioMateriales_inspectores]
GO
ALTER TABLE [dbo].[inventarioMateriales]  WITH CHECK ADD  CONSTRAINT [FK_inventarioMateriales_materiales] FOREIGN KEY([materialId])
REFERENCES [dbo].[materiales] ([materialId])
GO
ALTER TABLE [dbo].[inventarioMateriales] CHECK CONSTRAINT [FK_inventarioMateriales_materiales]
GO
ALTER TABLE [dbo].[logProducciones] ADD  CONSTRAINT [DF_logProducciones_accesedFrom]  DEFAULT ('root') FOR [accesedFrom]
GO
ALTER TABLE [dbo].[logProducciones]  WITH CHECK ADD  CONSTRAINT [FK_logProducciones_inspectores] FOREIGN KEY([inspectorId])
REFERENCES [dbo].[inspectores] ([inspectorId])
GO
ALTER TABLE [dbo].[logProducciones] CHECK CONSTRAINT [FK_logProducciones_inspectores]
GO
ALTER TABLE [dbo].[logProducciones]  WITH CHECK ADD  CONSTRAINT [FK_logProducciones_productos] FOREIGN KEY([productoId])
REFERENCES [dbo].[productos] ([productoId])
GO
ALTER TABLE [dbo].[logProducciones] CHECK CONSTRAINT [FK_logProducciones_productos]
GO
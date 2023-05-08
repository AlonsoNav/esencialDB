ALTER TABLE [dbo].[materialesXProducto]  WITH CHECK ADD  CONSTRAINT [FK_materialesXProducto_materiales] FOREIGN KEY([materialId])
REFERENCES [dbo].[materiales] ([materialId])
GO
ALTER TABLE [dbo].[materialesXProducto] CHECK CONSTRAINT [FK_materialesXProducto_materiales]
GO
ALTER TABLE [dbo].[materialesXProducto]  WITH CHECK ADD  CONSTRAINT [FK_materialesXProducto_productos] FOREIGN KEY([productoId])
REFERENCES [dbo].[productos] ([productoId])
GO
ALTER TABLE [dbo].[materialesXProducto] CHECK CONSTRAINT [FK_materialesXProducto_productos]
GO
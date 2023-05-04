ALTER TABLE [dbo].[productosXventa]  WITH CHECK ADD  CONSTRAINT [FK_productosXventa_logVentas] FOREIGN KEY([ventaId])
REFERENCES [dbo].[logVentas] ([ventaId])
GO
ALTER TABLE [dbo].[productosXventa] CHECK CONSTRAINT [FK_productosXventa_logVentas]
GO
ALTER TABLE [dbo].[productosXventa]  WITH CHECK ADD  CONSTRAINT [FK_productosXventa_productos] FOREIGN KEY([productoId])
REFERENCES [dbo].[productos] ([productoId])
GO
ALTER TABLE [dbo].[productosXventa] CHECK CONSTRAINT [FK_productosXventa_productos]
GO
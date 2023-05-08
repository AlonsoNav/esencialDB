ALTER TABLE [dbo].[asociaciones]  WITH CHECK ADD  CONSTRAINT [FK_asociaciones_direcciones] FOREIGN KEY([direccionId])
REFERENCES [dbo].[direcciones] ([direccionId])
GO
ALTER TABLE [dbo].[asociaciones] CHECK CONSTRAINT [FK_asociaciones_direcciones]
GO
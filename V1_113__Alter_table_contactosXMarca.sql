ALTER TABLE [dbo].[contactosXMarca]  WITH CHECK ADD  CONSTRAINT [FK_contactosXMarca_contactoValue] FOREIGN KEY([contactoValueId])
REFERENCES [dbo].[contactoValue] ([contactoValueId])
GO
ALTER TABLE [dbo].[contactosXMarca] CHECK CONSTRAINT [FK_contactosXMarca_contactoValue]
GO
ALTER TABLE [dbo].[contactosXMarca]  WITH CHECK ADD  CONSTRAINT [FK_contactosXMarca_marcasRecipiente] FOREIGN KEY([marcaId])
REFERENCES [dbo].[marcasRecipiente] ([marcaId])
GO
ALTER TABLE [dbo].[contactosXMarca] CHECK CONSTRAINT [FK_contactosXMarca_marcasRecipiente]
GO
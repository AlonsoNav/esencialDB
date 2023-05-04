ALTER TABLE [dbo].[contactosXSubproductores]  WITH CHECK ADD  CONSTRAINT [FK_contactosXSubproductores_contactoValue] FOREIGN KEY([contactoValueId])
REFERENCES [dbo].[contactoValue] ([contactoValueId])
GO
ALTER TABLE [dbo].[contactosXSubproductores] CHECK CONSTRAINT [FK_contactosXSubproductores_contactoValue]
GO
ALTER TABLE [dbo].[contactosXSubproductores]  WITH CHECK ADD  CONSTRAINT [FK_contactosXSubproductores_subproductores] FOREIGN KEY([subproductorId])
REFERENCES [dbo].[subproductores] ([subproductorId])
GO
ALTER TABLE [dbo].[contactosXSubproductores] CHECK CONSTRAINT [FK_contactosXSubproductores_subproductores]
GO
ALTER TABLE [dbo].[contactosXProductor]  WITH CHECK ADD  CONSTRAINT [FK_contactosXProductor_contactoValue] FOREIGN KEY([contactoValueId])
REFERENCES [dbo].[contactoValue] ([contactoValueId])
GO
ALTER TABLE [dbo].[contactosXProductor] CHECK CONSTRAINT [FK_contactosXProductor_contactoValue]
GO
ALTER TABLE [dbo].[contactosXProductor]  WITH CHECK ADD  CONSTRAINT [FK_contactosXProductor_productores] FOREIGN KEY([productorId])
REFERENCES [dbo].[productores] ([productorId])
GO
ALTER TABLE [dbo].[contactosXProductor] CHECK CONSTRAINT [FK_contactosXProductor_productores]
GO
ALTER TABLE [dbo].[contactosXPlanta]  WITH CHECK ADD  CONSTRAINT [FK_contactosXPlanta_contactoValue] FOREIGN KEY([contactoValueId])
REFERENCES [dbo].[contactoValue] ([contactoValueId])
GO
ALTER TABLE [dbo].[contactosXPlanta] CHECK CONSTRAINT [FK_contactosXPlanta_contactoValue]
GO
ALTER TABLE [dbo].[contactosXPlanta]  WITH CHECK ADD  CONSTRAINT [FK_contactosXPlanta_plantas] FOREIGN KEY([plantaId])
REFERENCES [dbo].[plantas] ([plantaId])
GO
ALTER TABLE [dbo].[contactosXPlanta] CHECK CONSTRAINT [FK_contactosXPlanta_plantas]
GO
ALTER TABLE [dbo].[contactosXrecolectora]  WITH CHECK ADD  CONSTRAINT [FK_contactosXrecolectora_contactoValue] FOREIGN KEY([contactoValueId])
REFERENCES [dbo].[contactoValue] ([contactoValueId])
GO
ALTER TABLE [dbo].[contactosXrecolectora] CHECK CONSTRAINT [FK_contactosXrecolectora_contactoValue]
GO
ALTER TABLE [dbo].[contactosXrecolectora]  WITH CHECK ADD  CONSTRAINT [FK_contactosXrecolectora_recolectoras] FOREIGN KEY([recolectoraId])
REFERENCES [dbo].[recolectoras] ([recolectoraId])
GO
ALTER TABLE [dbo].[contactosXrecolectora] CHECK CONSTRAINT [FK_contactosXrecolectora_recolectoras]
GO
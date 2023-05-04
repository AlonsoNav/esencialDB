ALTER TABLE [dbo].[desechosXRecipiente]  WITH CHECK ADD  CONSTRAINT [FK_desechosXRecipiente_tiposDesecho] FOREIGN KEY([tipoDesechoId])
REFERENCES [dbo].[tiposDesecho] ([tipoDesechoId])
GO
ALTER TABLE [dbo].[desechosXRecipiente] CHECK CONSTRAINT [FK_desechosXRecipiente_tiposDesecho]
GO
ALTER TABLE [dbo].[desechosXRecipiente]  WITH CHECK ADD  CONSTRAINT [FK_desechosXRecipiente_tiposRecipiente] FOREIGN KEY([tipoRecId])
REFERENCES [dbo].[tiposRecipiente] ([tipoRecId])
GO
ALTER TABLE [dbo].[desechosXRecipiente] CHECK CONSTRAINT [FK_desechosXRecipiente_tiposRecipiente]
GO
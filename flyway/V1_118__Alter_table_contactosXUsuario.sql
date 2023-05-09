ALTER TABLE [dbo].[contactosXUsuario]  WITH CHECK ADD  CONSTRAINT [FK_contactosXUsuario_contactoValue] FOREIGN KEY([contactoValueId])
REFERENCES [dbo].[contactoValue] ([contactoValueId])
GO
ALTER TABLE [dbo].[contactosXUsuario] CHECK CONSTRAINT [FK_contactosXUsuario_contactoValue]
GO
ALTER TABLE [dbo].[contactosXUsuario]  WITH CHECK ADD  CONSTRAINT [FK_contactosXUsuario_usuarios] FOREIGN KEY([usuarioId])
REFERENCES [dbo].[usuarios] ([usuarioId])
GO
ALTER TABLE [dbo].[contactosXUsuario] CHECK CONSTRAINT [FK_contactosXUsuario_usuarios]
GO
ALTER TABLE [dbo].[usuarios] ADD  CONSTRAINT [DF_usuarios_deleted]  DEFAULT ((0)) FOR [deleted]
GO
ALTER TABLE [dbo].[usuarios]  WITH CHECK ADD  CONSTRAINT [FK_usuarios_direcciones] FOREIGN KEY([direccionId])
REFERENCES [dbo].[direcciones] ([direccionId])
GO
ALTER TABLE [dbo].[usuarios] CHECK CONSTRAINT [FK_usuarios_direcciones]
GO
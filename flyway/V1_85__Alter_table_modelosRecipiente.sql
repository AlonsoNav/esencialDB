ALTER TABLE [dbo].[modelosRecipiente] ADD  CONSTRAINT [DF_modelosRecipiente_enabled]  DEFAULT ((1)) FOR [enabled]
GO
ALTER TABLE [dbo].[modelosRecipiente]  WITH CHECK ADD  CONSTRAINT [FK_modelosRecipiente_marcasRecipiente] FOREIGN KEY([marcaId])
REFERENCES [dbo].[marcasRecipiente] ([marcaId])
GO
ALTER TABLE [dbo].[modelosRecipiente] CHECK CONSTRAINT [FK_modelosRecipiente_marcasRecipiente]
GO
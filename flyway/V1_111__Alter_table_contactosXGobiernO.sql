ALTER TABLE [dbo].[contactosXGobierno]  WITH CHECK ADD  CONSTRAINT [FK_contactosXGobierno_contactoValue] FOREIGN KEY([contactoValueId])
REFERENCES [dbo].[contactoValue] ([contactoValueId])
GO
ALTER TABLE [dbo].[contactosXGobierno] CHECK CONSTRAINT [FK_contactosXGobierno_contactoValue]
GO
ALTER TABLE [dbo].[contactosXGobierno]  WITH CHECK ADD  CONSTRAINT [FK_contactosXGobierno_gobiernos] FOREIGN KEY([gobiernoId])
REFERENCES [dbo].[gobiernos] ([gobiernoId])
GO
ALTER TABLE [dbo].[contactosXGobierno] CHECK CONSTRAINT [FK_contactosXGobierno_gobiernos]
GO
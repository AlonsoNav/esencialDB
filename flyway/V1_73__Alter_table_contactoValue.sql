ALTER TABLE [dbo].[contactoValue] ADD  CONSTRAINT [DF_contactoValue_enabled]  DEFAULT ((1)) FOR [enabled]
GO
ALTER TABLE [dbo].[contactoValue]  WITH CHECK ADD  CONSTRAINT [FK_contactoValue_contactoType] FOREIGN KEY([contactoTypeId])
REFERENCES [dbo].[contactoType] ([contactoTypeId])
GO
ALTER TABLE [dbo].[contactoValue] CHECK CONSTRAINT [FK_contactoValue_contactoType]
GO
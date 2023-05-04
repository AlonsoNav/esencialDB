ALTER TABLE [dbo].[contactosXAsociaciones]  WITH CHECK ADD  CONSTRAINT [FK_contactosXAsociaciones_asociaciones] FOREIGN KEY([asociacionId])
REFERENCES [dbo].[asociaciones] ([asociacionId])
GO
ALTER TABLE [dbo].[contactosXAsociaciones] CHECK CONSTRAINT [FK_contactosXAsociaciones_asociaciones]
GO
ALTER TABLE [dbo].[contactosXAsociaciones]  WITH CHECK ADD  CONSTRAINT [FK_contactosXAsociaciones_contactoValue] FOREIGN KEY([contactoValueId])
REFERENCES [dbo].[contactoValue] ([contactoValueId])
GO
ALTER TABLE [dbo].[contactosXAsociaciones] CHECK CONSTRAINT [FK_contactosXAsociaciones_contactoValue]
GO
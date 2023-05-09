ALTER TABLE [dbo].[contactosXInspector]  WITH CHECK ADD  CONSTRAINT [FK_contactosXInspector_contactoValue] FOREIGN KEY([contactoValueId])
REFERENCES [dbo].[contactoValue] ([contactoValueId])
GO
ALTER TABLE [dbo].[contactosXInspector] CHECK CONSTRAINT [FK_contactosXInspector_contactoValue]
GO
ALTER TABLE [dbo].[contactosXInspector]  WITH CHECK ADD  CONSTRAINT [FK_contactosXInspector_inspectores] FOREIGN KEY([inspectorId])
REFERENCES [dbo].[inspectores] ([inspectorId])
GO
ALTER TABLE [dbo].[contactosXInspector] CHECK CONSTRAINT [FK_contactosXInspector_inspectores]
GO
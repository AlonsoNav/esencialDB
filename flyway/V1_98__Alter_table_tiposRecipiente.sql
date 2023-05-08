ALTER TABLE [dbo].[tiposRecipiente] ADD  CONSTRAINT [DF_tiposRecipiente_cantDisponible]  DEFAULT ((0)) FOR [cantDisponible]
GO
ALTER TABLE [dbo].[tiposRecipiente] ADD  CONSTRAINT [DF_tiposRecipiente_cantDesechada]  DEFAULT ((0)) FOR [cantDesechada]
GO
ALTER TABLE [dbo].[tiposRecipiente] ADD  CONSTRAINT [DF_tiposRecipiente_cantEnMante]  DEFAULT ((0)) FOR [cantEnMante]
GO
ALTER TABLE [dbo].[tiposRecipiente] ADD  CONSTRAINT [DF_tiposRecipiente_cantEnUso]  DEFAULT ((0)) FOR [cantEnUso]
GO
ALTER TABLE [dbo].[tiposRecipiente]  WITH CHECK ADD  CONSTRAINT [FK_tiposRecipiente_modelosRecipiente] FOREIGN KEY([modeloId])
REFERENCES [dbo].[modelosRecipiente] ([modeloId])
GO
ALTER TABLE [dbo].[tiposRecipiente] CHECK CONSTRAINT [FK_tiposRecipiente_modelosRecipiente]
GO
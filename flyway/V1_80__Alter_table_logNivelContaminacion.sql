ALTER TABLE [dbo].[logNivelContaminacion] ADD  CONSTRAINT [DF_logContaminantes_accesedFrom]  DEFAULT ('root') FOR [accesedFrom]
GO
ALTER TABLE [dbo].[logNivelContaminacion]  WITH CHECK ADD  CONSTRAINT [FK_logContaminantes_productores] FOREIGN KEY([productorId])
REFERENCES [dbo].[productores] ([productorId])
GO
ALTER TABLE [dbo].[logNivelContaminacion] CHECK CONSTRAINT [FK_logContaminantes_productores]
GO
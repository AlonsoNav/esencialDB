ALTER TABLE [dbo].[historialesXrecipiente]  WITH CHECK ADD  CONSTRAINT [FK_historialesXrecipiente_ubicaciones] FOREIGN KEY([ubicacionId])
REFERENCES [dbo].[ubicaciones] ([ubicacionId])
GO
ALTER TABLE [dbo].[historialesXrecipiente] CHECK CONSTRAINT [FK_historialesXrecipiente_ubicaciones]
GO
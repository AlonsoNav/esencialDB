ALTER TABLE [dbo].[estados]  WITH CHECK ADD  CONSTRAINT [FK_estados_paises1] FOREIGN KEY([paisId])
REFERENCES [dbo].[paises] ([paisId])
GO
ALTER TABLE [dbo].[estados] CHECK CONSTRAINT [FK_estados_paises1]
GO
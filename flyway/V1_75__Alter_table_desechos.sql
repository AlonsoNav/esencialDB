ALTER TABLE [dbo].[desechos] ADD  CONSTRAINT [DF_desechos_deleted]  DEFAULT ((0)) FOR [deleted]
GO
ALTER TABLE [dbo].[desechos]  WITH CHECK ADD  CONSTRAINT [FK_desechos_tiposDesecho] FOREIGN KEY([tipoDesechoId])
REFERENCES [dbo].[tiposDesecho] ([tipoDesechoId])
GO
ALTER TABLE [dbo].[desechos] CHECK CONSTRAINT [FK_desechos_tiposDesecho]
GO
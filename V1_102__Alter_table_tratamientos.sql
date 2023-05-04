ALTER TABLE [dbo].[tratamientos] ADD  CONSTRAINT [DF_tratamientos_estado]  DEFAULT ((0)) FOR [deleted]
GO
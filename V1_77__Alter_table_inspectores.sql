ALTER TABLE [dbo].[inspectores] ADD  CONSTRAINT [DF_inspectores_deleted]  DEFAULT ((0)) FOR [deleted]
GO
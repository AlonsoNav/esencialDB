ALTER TABLE [dbo].[tiposDesecho] ADD  CONSTRAINT [DF_tiposDesecho_deleted]  DEFAULT ((0)) FOR [deleted]
GO
ALTER TABLE [dbo].[productos] ADD  CONSTRAINT [DF_productos_enabled]  DEFAULT ((1)) FOR [enabled]
GO
ALTER TABLE [dbo].[marcasRecipiente] ADD  CONSTRAINT [DF_marcasRecipiente_enabled]  DEFAULT ((1)) FOR [enabled]
GO
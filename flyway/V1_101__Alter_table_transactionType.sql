ALTER TABLE [dbo].[transactionType] ADD  CONSTRAINT [DF_transactionType_enabled]  DEFAULT ((1)) FOR [enabled]
GO
ALTER TABLE [dbo].[contratosStatus] ADD  CONSTRAINT [DF_contratosStatus_enabled]  DEFAULT ((1)) FOR [enabled]
GO
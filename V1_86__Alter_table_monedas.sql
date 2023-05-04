ALTER TABLE [dbo].[monedas] ADD  CONSTRAINT [DF_monedas_default]  DEFAULT ((0)) FOR [base]
GO
ALTER TABLE [dbo].[monedas] ADD  CONSTRAINT [DF_monedas_deleted]  DEFAULT ((0)) FOR [deleted]
GO
ALTER TABLE [dbo].[inspectores] ADD  CONSTRAINT [DF_inspectores_deleted]  DEFAULT ((0)) FOR [deleted]
GO
ALTER TABLE [dbo].[inspectores] ADD password VARCHAR(16) NOT NULL DEFAULT '1234'
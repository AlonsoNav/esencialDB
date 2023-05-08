ALTER TABLE [dbo].[productores] ADD  CONSTRAINT [DF_productores_balance]  DEFAULT ((0)) FOR [balance]
GO
ALTER TABLE [dbo].[productores]  WITH CHECK ADD  CONSTRAINT [FK_productores_direcciones] FOREIGN KEY([direccionId])
REFERENCES [dbo].[direcciones] ([direccionId])
GO
ALTER TABLE [dbo].[productores] CHECK CONSTRAINT [FK_productores_direcciones]
GO
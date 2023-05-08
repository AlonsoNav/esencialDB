ALTER TABLE [dbo].[subproductores] ADD  CONSTRAINT [DF_productorXlocalidades_estado]  DEFAULT ((1)) FOR [deleted]
GO
ALTER TABLE [dbo].[subproductores]  WITH CHECK ADD  CONSTRAINT [FK_productorXlocalidades_direcciones] FOREIGN KEY([direccionId])
REFERENCES [dbo].[direcciones] ([direccionId])
GO
ALTER TABLE [dbo].[subproductores] CHECK CONSTRAINT [FK_productorXlocalidades_direcciones]
GO
ALTER TABLE [dbo].[subproductores]  WITH CHECK ADD  CONSTRAINT [FK_productorXlocalidades_productores] FOREIGN KEY([productorId])
REFERENCES [dbo].[productores] ([productorId])
GO
ALTER TABLE [dbo].[subproductores] CHECK CONSTRAINT [FK_productorXlocalidades_productores]
GO
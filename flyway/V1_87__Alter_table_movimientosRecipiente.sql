ALTER TABLE [dbo].[movimientosRecipiente] ADD  CONSTRAINT [DF_movimientosRecipiente_accesedFrom]  DEFAULT ('root') FOR [accesedFrom]
GO
ALTER TABLE [dbo].[movimientosRecipiente]  WITH CHECK ADD  CONSTRAINT [FK_movimientosRecipiente_desechos] FOREIGN KEY([desechoId])
REFERENCES [dbo].[desechos] ([desechoId])
GO
ALTER TABLE [dbo].[movimientosRecipiente] CHECK CONSTRAINT [FK_movimientosRecipiente_desechos]
GO
ALTER TABLE [dbo].[movimientosRecipiente]  WITH CHECK ADD  CONSTRAINT [FK_movimientosRecipiente_direcciones] FOREIGN KEY([direccionId])
REFERENCES [dbo].[direcciones] ([direccionId])
GO
ALTER TABLE [dbo].[movimientosRecipiente] CHECK CONSTRAINT [FK_movimientosRecipiente_direcciones]
GO
ALTER TABLE [dbo].[movimientosRecipiente]  WITH CHECK ADD  CONSTRAINT [FK_movimientosRecipiente_movementType] FOREIGN KEY([movementTypeId])
REFERENCES [dbo].[movementType] ([movementTypeId])
GO
ALTER TABLE [dbo].[movimientosRecipiente] CHECK CONSTRAINT [FK_movimientosRecipiente_movementType]
GO
ALTER TABLE [dbo].[movimientosRecipiente]  WITH CHECK ADD  CONSTRAINT [FK_movimientosRecipiente_plantas] FOREIGN KEY([plantaId])
REFERENCES [dbo].[plantas] ([plantaId])
GO
ALTER TABLE [dbo].[movimientosRecipiente] CHECK CONSTRAINT [FK_movimientosRecipiente_plantas]
GO
ALTER TABLE [dbo].[movimientosRecipiente]  WITH CHECK ADD  CONSTRAINT [FK_movimientosRecipiente_productores] FOREIGN KEY([productorId])
REFERENCES [dbo].[productores] ([productorId])
GO
ALTER TABLE [dbo].[movimientosRecipiente] CHECK CONSTRAINT [FK_movimientosRecipiente_productores]
GO
ALTER TABLE [dbo].[movimientosRecipiente]  WITH CHECK ADD  CONSTRAINT [FK_movimientosRecipiente_subproductores] FOREIGN KEY([subProductorId])
REFERENCES [dbo].[subproductores] ([subproductorId])
GO
ALTER TABLE [dbo].[movimientosRecipiente] CHECK CONSTRAINT [FK_movimientosRecipiente_subproductores]
GO
ALTER TABLE [dbo].[movimientosRecipiente]  WITH CHECK ADD  CONSTRAINT [FK_movimientosRecipiente_tiposRecipiente] FOREIGN KEY([tipoRecId])
REFERENCES [dbo].[tiposRecipiente] ([tipoRecId])
GO
ALTER TABLE [dbo].[movimientosRecipiente] CHECK CONSTRAINT [FK_movimientosRecipiente_tiposRecipiente]
GO
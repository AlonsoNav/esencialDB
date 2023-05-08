ALTER TABLE [dbo].[desechoXContrato]  WITH CHECK ADD  CONSTRAINT [FK_desechoXContrato_contratos] FOREIGN KEY([contratoId])
REFERENCES [dbo].[contratos] ([contratoId])
GO
ALTER TABLE [dbo].[desechoXContrato] CHECK CONSTRAINT [FK_desechoXContrato_contratos]
GO
ALTER TABLE [dbo].[desechoXContrato]  WITH CHECK ADD  CONSTRAINT [FK_desechoXContrato_desechos] FOREIGN KEY([desechoId])
REFERENCES [dbo].[desechos] ([desechoId])
GO
ALTER TABLE [dbo].[desechoXContrato] CHECK CONSTRAINT [FK_desechoXContrato_desechos]
GO
ALTER TABLE [dbo].[desechoXContrato]  WITH CHECK ADD  CONSTRAINT [FK_desechoXContrato_tratamientos] FOREIGN KEY([tratamientoId])
REFERENCES [dbo].[tratamientos] ([tratamientoId])
GO
ALTER TABLE [dbo].[desechoXContrato] CHECK CONSTRAINT [FK_desechoXContrato_tratamientos]
GO
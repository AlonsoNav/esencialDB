ALTER TABLE [dbo].[desechosXtratamiento]  WITH CHECK ADD  CONSTRAINT [FK_desechosXtratamiento_desechos] FOREIGN KEY([desechoId])
REFERENCES [dbo].[desechos] ([desechoId])
GO
ALTER TABLE [dbo].[desechosXtratamiento] CHECK CONSTRAINT [FK_desechosXtratamiento_desechos]
GO
ALTER TABLE [dbo].[desechosXtratamiento]  WITH CHECK ADD  CONSTRAINT [FK_desechosXtratamiento_tratamientos] FOREIGN KEY([tratamientoId])
REFERENCES [dbo].[tratamientos] ([tratamientoId])
GO
ALTER TABLE [dbo].[desechosXtratamiento] CHECK CONSTRAINT [FK_desechosXtratamiento_tratamientos]
GO
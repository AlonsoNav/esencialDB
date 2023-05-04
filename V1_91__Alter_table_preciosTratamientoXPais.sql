ALTER TABLE [dbo].[preciosTratamientoXPais] ADD  CONSTRAINT [DF_preciosTratamientoXPais_accesedFrom]  DEFAULT ('root') FOR [accesedFrom]
GO
ALTER TABLE [dbo].[preciosTratamientoXPais] ADD  CONSTRAINT [DF_preciosTratamientoXPais_enabled]  DEFAULT ((1)) FOR [enabled]
GO
ALTER TABLE [dbo].[preciosTratamientoXPais]  WITH CHECK ADD  CONSTRAINT [FK_preciosTratamientoXPais_paises] FOREIGN KEY([paisId])
REFERENCES [dbo].[paises] ([paisId])
GO
ALTER TABLE [dbo].[preciosTratamientoXPais] CHECK CONSTRAINT [FK_preciosTratamientoXPais_paises]
GO
ALTER TABLE [dbo].[preciosTratamientoXPais]  WITH CHECK ADD  CONSTRAINT [FK_preciosTratamientoXPais_tratamientos] FOREIGN KEY([tratamientoId])
REFERENCES [dbo].[tratamientos] ([tratamientoId])
GO
ALTER TABLE [dbo].[preciosTratamientoXPais] CHECK CONSTRAINT [FK_preciosTratamientoXPais_tratamientos]
GO
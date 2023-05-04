ALTER TABLE [dbo].[plantas] ADD  CONSTRAINT [DF_puntosRecoleccion_estado]  DEFAULT ((1)) FOR [enabled]
GO
ALTER TABLE [dbo].[plantas]  WITH CHECK ADD  CONSTRAINT [FK_puntosEntrega_direcciones] FOREIGN KEY([direccion])
REFERENCES [dbo].[direcciones] ([direccionId])
GO
ALTER TABLE [dbo].[plantas] CHECK CONSTRAINT [FK_puntosEntrega_direcciones]
GO
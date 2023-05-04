ALTER TABLE [dbo].[traducciones] ADD  CONSTRAINT [DF_traducciones_estado]  DEFAULT ((1)) FOR [enabled]
GO
ALTER TABLE [dbo].[traducciones]  WITH CHECK ADD  CONSTRAINT [FK_traducciones_idiomas1] FOREIGN KEY([idiomaTraducido])
REFERENCES [dbo].[idiomas] ([idiomaId])
GO
ALTER TABLE [dbo].[traducciones] CHECK CONSTRAINT [FK_traducciones_idiomas1]
GO
ALTER TABLE [dbo].[traducciones]  WITH CHECK ADD  CONSTRAINT [FK_traducciones_objectTypes] FOREIGN KEY([objectTypeId])
REFERENCES [dbo].[objectTypes] ([objectTypeId])
GO
ALTER TABLE [dbo].[traducciones] CHECK CONSTRAINT [FK_traducciones_objectTypes]
GO
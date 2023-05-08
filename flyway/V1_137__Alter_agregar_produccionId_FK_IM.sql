USE[esencialDB]
GO
ALTER TABLE [dbo].[inventarioMateriales]
ADD produccionId BIGINT NOT NULL;
GO
ALTER TABLE [dbo].[inventarioMateriales]  WITH CHECK ADD  CONSTRAINT [FK_inventarioMateriales_logProducciones] FOREIGN KEY([produccionId])
REFERENCES [dbo].[logProducciones] ([produccionId])
GO
ALTER TABLE [dbo].[inventarioMateriales] CHECK CONSTRAINT [FK_inventarioMateriales_logProducciones]
GO
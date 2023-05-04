ALTER TABLE [dbo].[contratos]  WITH CHECK ADD  CONSTRAINT [FK_contratos_asociaciones] FOREIGN KEY([asociacionId])
REFERENCES [dbo].[asociaciones] ([asociacionId])
GO
ALTER TABLE [dbo].[contratos] CHECK CONSTRAINT [FK_contratos_asociaciones]
GO
ALTER TABLE [dbo].[contratos]  WITH CHECK ADD  CONSTRAINT [FK_contratos_contratosStatus] FOREIGN KEY([contratoStatusId])
REFERENCES [dbo].[contratosStatus] ([contratoStatusId])
GO
ALTER TABLE [dbo].[contratos] CHECK CONSTRAINT [FK_contratos_contratosStatus]
GO
ALTER TABLE [dbo].[contratos]  WITH CHECK ADD  CONSTRAINT [FK_contratos_gobiernos] FOREIGN KEY([gobiernoId])
REFERENCES [dbo].[gobiernos] ([gobiernoId])
GO
ALTER TABLE [dbo].[contratos] CHECK CONSTRAINT [FK_contratos_gobiernos]
GO
ALTER TABLE [dbo].[contratos]  WITH CHECK ADD  CONSTRAINT [FK_contratos_productores] FOREIGN KEY([productorId])
REFERENCES [dbo].[productores] ([productorId])
GO
ALTER TABLE [dbo].[contratos] CHECK CONSTRAINT [FK_contratos_productores]
GO
ALTER TABLE [dbo].[contratos]  WITH CHECK ADD  CONSTRAINT [FK_contratos_recolectoras] FOREIGN KEY([recolectorId])
REFERENCES [dbo].[recolectoras] ([recolectoraId])
GO
ALTER TABLE [dbo].[contratos] CHECK CONSTRAINT [FK_contratos_recolectoras]
GO
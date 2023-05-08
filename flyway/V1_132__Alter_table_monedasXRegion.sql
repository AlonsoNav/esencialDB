ALTER TABLE [dbo].[monedasXRegion]  WITH CHECK ADD  CONSTRAINT [FK_monedasXRegion_monedas] FOREIGN KEY([monedaId])
REFERENCES [dbo].[monedas] ([monedaId])
GO
ALTER TABLE [dbo].[monedasXRegion] CHECK CONSTRAINT [FK_monedasXRegion_monedas]
GO
ALTER TABLE [dbo].[monedasXRegion]  WITH CHECK ADD  CONSTRAINT [FK_monedasXRegion_regiones] FOREIGN KEY([regionId])
REFERENCES [dbo].[regiones] ([regionId])
GO
ALTER TABLE [dbo].[monedasXRegion] CHECK CONSTRAINT [FK_monedasXRegion_regiones]
GO
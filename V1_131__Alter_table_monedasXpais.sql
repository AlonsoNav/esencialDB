ALTER TABLE [dbo].[monedasXpais]  WITH CHECK ADD  CONSTRAINT [FK_monedasXpais_monedas] FOREIGN KEY([monedaId])
REFERENCES [dbo].[monedas] ([monedaId])
GO
ALTER TABLE [dbo].[monedasXpais] CHECK CONSTRAINT [FK_monedasXpais_monedas]
GO
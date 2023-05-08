ALTER TABLE [dbo].[transacciones] ADD  CONSTRAINT [DF_transacciones_accessedFrom]  DEFAULT ('root') FOR [accessedFrom]
GO
ALTER TABLE [dbo].[transacciones]  WITH CHECK ADD  CONSTRAINT [FK_transacciones_contratos] FOREIGN KEY([contratoId])
REFERENCES [dbo].[contratos] ([contratoId])
GO
ALTER TABLE [dbo].[transacciones] CHECK CONSTRAINT [FK_transacciones_contratos]
GO
ALTER TABLE [dbo].[transacciones]  WITH CHECK ADD  CONSTRAINT [FK_transacciones_logExchanges] FOREIGN KEY([exchangeId])
REFERENCES [dbo].[logExchanges] ([exchangeId])
GO
ALTER TABLE [dbo].[transacciones] CHECK CONSTRAINT [FK_transacciones_logExchanges]
GO
ALTER TABLE [dbo].[transacciones]  WITH CHECK ADD  CONSTRAINT [FK_transacciones_logVentas] FOREIGN KEY([ventaId])
REFERENCES [dbo].[logVentas] ([ventaId])
GO
ALTER TABLE [dbo].[transacciones] CHECK CONSTRAINT [FK_transacciones_logVentas]
GO
ALTER TABLE [dbo].[transacciones]  WITH CHECK ADD  CONSTRAINT [FK_transacciones_monedas] FOREIGN KEY([monedaId])
REFERENCES [dbo].[monedas] ([monedaId])
GO
ALTER TABLE [dbo].[transacciones] CHECK CONSTRAINT [FK_transacciones_monedas]
GO
ALTER TABLE [dbo].[transacciones]  WITH CHECK ADD  CONSTRAINT [FK_transacciones_transactionType] FOREIGN KEY([transactionType])
REFERENCES [dbo].[transactionType] ([transactionTypeId])
GO
ALTER TABLE [dbo].[transacciones] CHECK CONSTRAINT [FK_transacciones_transactionType]
GO
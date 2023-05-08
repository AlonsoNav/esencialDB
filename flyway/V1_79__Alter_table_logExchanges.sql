ALTER TABLE [dbo].[logExchanges] ADD  CONSTRAINT [DF_logExchanges_base]  DEFAULT ((0)) FOR [base]
GO
ALTER TABLE [dbo].[logExchanges] ADD  CONSTRAINT [DF_logConversiones_accesedFrom]  DEFAULT ('root') FOR [accesedFrom]
GO
ALTER TABLE [dbo].[logExchanges]  WITH CHECK ADD  CONSTRAINT [FK_logConversiones_monedas] FOREIGN KEY([moneda1])
REFERENCES [dbo].[monedas] ([monedaId])
GO
ALTER TABLE [dbo].[logExchanges] CHECK CONSTRAINT [FK_logConversiones_monedas]
GO
ALTER TABLE [dbo].[logExchanges]  WITH CHECK ADD  CONSTRAINT [FK_logConversiones_monedas1] FOREIGN KEY([moneda2])
REFERENCES [dbo].[monedas] ([monedaId])
GO
ALTER TABLE [dbo].[logExchanges] CHECK CONSTRAINT [FK_logConversiones_monedas1]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0:por día, 1:por semana, 2:por mes, 3: trimestre, 4: bimestre, 5: semestre, 6:cuatrimestre, 7: anual' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'contratos', @level2type=N'COLUMN',@level2name=N'tipoRecurrencia'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'x dia' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'contratos', @level2type=N'COLUMN',@level2name=N'gobiernoId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'moneda1 a moneda2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'logExchanges', @level2type=N'COLUMN',@level2name=N'cambio'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'paises', @level2type=N'COLUMN',@level2name=N'paisId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Formato ISO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'paises', @level2type=N'COLUMN',@level2name=N'nombre'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0: Detallista 1:Cadenas 2:Industria' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'productores', @level2type=N'COLUMN',@level2name=N'categoria'
GO
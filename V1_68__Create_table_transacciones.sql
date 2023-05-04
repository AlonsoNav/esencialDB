SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[transacciones](
	[transaccionId] [bigint] IDENTITY(1,1) NOT NULL,
	[transactionType] [smallint] NOT NULL,
	[monedaId] [smallint] NOT NULL,
	[exchangeId] [bigint] NOT NULL,
	[cambio] [decimal](18, 4) NOT NULL,
	[monto] [decimal](18, 2) NOT NULL,
	[posttime] [timestamp] NOT NULL,
	[chekcsum] [varbinary](150) NOT NULL,
	[accessedFrom] [varchar](50) NOT NULL,
	[ventaId] [bigint] NULL,
	[contratoId] [bigint] NULL,
 CONSTRAINT [PK_transacciones] PRIMARY KEY CLUSTERED
(
	[transaccionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
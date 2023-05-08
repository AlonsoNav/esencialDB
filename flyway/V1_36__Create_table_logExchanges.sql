SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[logExchanges](
	[exchangeId] [bigint] IDENTITY(1,1) NOT NULL,
	[moneda1] [smallint] NOT NULL,
	[moneda2] [smallint] NOT NULL,
	[base] [bit] NOT NULL,
	[cambio] [decimal](18, 4) NOT NULL,
	[fechaInicio] [datetime] NOT NULL,
	[fechaFin] [datetime] NULL,
	[posttime] [timestamp] NOT NULL,
	[accesedFrom] [varchar](50) NOT NULL,
	[checkSum] [varbinary](150) NOT NULL,
 CONSTRAINT [PK_logExchanges] PRIMARY KEY CLUSTERED 
(
	[exchangeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
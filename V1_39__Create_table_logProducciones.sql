SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[logProducciones](
	[produccionId] [bigint] IDENTITY(1,1) NOT NULL,
	[productoId] [int] NOT NULL,
	[cantidad] [bigint] NOT NULL,
	[inspectorId] [bigint] NOT NULL,
	[accesedFrom] [varchar](50) NOT NULL,
	[checksum] [varbinary](150) NOT NULL,
	[posttime] [timestamp] NOT NULL,
 CONSTRAINT [PK_logProducciones] PRIMARY KEY CLUSTERED 
(
	[produccionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
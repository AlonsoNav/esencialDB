SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tiposRecipiente](
	[tipoRecId] [int] IDENTITY(1,1) NOT NULL,
	[description] [varchar](50) NOT NULL,
	[modeloId] [int] NULL,
	[cantDisponible] [bigint] NOT NULL,
	[cantDesechada] [bigint] NOT NULL,
	[cantEnMante] [bigint] NOT NULL,
	[cantEnUso] [bigint] NOT NULL,
	[capacidad] [decimal](18, 2) NOT NULL,
	[pesoBase] [decimal](9, 2) NOT NULL,
 CONSTRAINT [PK_tiposRecipiente] PRIMARY KEY CLUSTERED
(
	[tipoRecId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
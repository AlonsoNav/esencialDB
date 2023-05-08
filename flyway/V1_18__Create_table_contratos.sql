GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contratos](
	[contratoId] [bigint] IDENTITY(1,1) NOT NULL,
	[fechaInicio] [datetime] NOT NULL,
	[fechaFin] [datetime] NULL,
	[posttime] [timestamp] NOT NULL,
	[accesedFrom] [varchar](20) NOT NULL,
	[checkSum] [varbinary](150) NOT NULL,
	[tipoRecurrencia] [tinyint] NOT NULL,
	[contratoStatusId] [tinyint] NOT NULL,
	[porcProductor] [decimal](5, 2) NULL,
	[productorId] [int] NULL,
	[porcRecolector] [decimal](5, 2) NULL,
	[recolectorId] [bigint] NULL,
	[porcAsociacion] [decimal](5, 2) NULL,
	[asociacionId] [bigint] NULL,
	[porcGobierno] [decimal](5, 2) NULL,
	[gobiernoId] [int] NULL,
 CONSTRAINT [PK_logContratos] PRIMARY KEY CLUSTERED 
(
	[contratoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
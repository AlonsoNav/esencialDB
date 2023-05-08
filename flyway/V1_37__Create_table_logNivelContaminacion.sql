SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[logNivelContaminacion](
	[contaminanteId] [bigint] IDENTITY(1,1) NOT NULL,
	[productorId] [int] NOT NULL,
	[porcentaje] [decimal](8, 2) NOT NULL,
	[posttime] [timestamp] NOT NULL,
	[accesedFrom] [varchar](20) NOT NULL,
	[checkSum] [varbinary](150) NOT NULL,
 CONSTRAINT [PK_logContaminantes] PRIMARY KEY CLUSTERED 
(
	[contaminanteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
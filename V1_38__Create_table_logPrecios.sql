SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[logPrecios](
	[precioTratamientoId] [bigint] IDENTITY(1,1) NOT NULL,
	[tratamientoId] [smallint] NOT NULL,
	[precio] [decimal](18, 2) NOT NULL,
	[fechaInicio] [datetime] NOT NULL,
	[fechaFin] [datetime] NULL,
	[posttime] [timestamp] NOT NULL,
	[accesedFrom] [varchar](20) NOT NULL,
	[checkSum] [varbinary](150) NOT NULL,
 CONSTRAINT [PK_logPreciosTratamiento] PRIMARY KEY CLUSTERED 
(
	[precioTratamientoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
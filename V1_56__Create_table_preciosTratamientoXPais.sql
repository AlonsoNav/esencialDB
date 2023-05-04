SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[preciosTratamientoXPais](
	[paisId] [smallint] NOT NULL,
	[precioXUni] [decimal](18, 2) NOT NULL,
	[unidadBase] [varchar](10) NOT NULL,
	[posttime] [timestamp] NOT NULL,
	[accesedFrom] [varchar](50) NOT NULL,
	[checksum] [varbinary](150) NOT NULL,
	[enabled] [bit] NOT NULL,
	[tratamientoId] [int] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[preciosProXPais](
	[productoId] [int] NOT NULL,
	[paisId] [smallint] NOT NULL,
	[precio] [decimal](18, 2) NOT NULL,
	[posttime] [timestamp] NOT NULL,
	[checksum] [varbinary](150) NOT NULL,
	[accesedFrom] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[inventarioMateriales](
	[materialId] [int] NOT NULL,
	[cantidad] [decimal](18, 2) NOT NULL,
	[inspectorId] [bigint] NOT NULL,
	[posttime] [timestamp] NOT NULL,
	[accesedFrom] [varchar](50) NOT NULL,
	[checksum] [varbinary](150) NOT NULL
) ON [PRIMARY]
GO
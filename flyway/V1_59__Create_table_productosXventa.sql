SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[productosXventa](
	[productoId] [int] NOT NULL,
	[cantidad] [bigint] NOT NULL,
	[ventaId] [bigint] NOT NULL
) ON [PRIMARY]
GO
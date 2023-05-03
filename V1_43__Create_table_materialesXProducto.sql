SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[materialesXProducto](
	[materialId] [int] NOT NULL,
	[productoId] [int] NOT NULL,
	[cantidad] [int] NOT NULL
) ON [PRIMARY]
GO
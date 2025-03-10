SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[plantas](
	[plantaId] [int] IDENTITY(1,1) NOT NULL,
	[enabled] [bit] NOT NULL,
	[direccion] [bigint] NOT NULL,
 CONSTRAINT [PK_puntosRecoleccion] PRIMARY KEY CLUSTERED 
(
	[plantaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
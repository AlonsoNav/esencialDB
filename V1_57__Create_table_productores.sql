SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[productores](
	[productorId] [int] IDENTITY(1,1) NOT NULL,
	[categoria] [tinyint] NOT NULL,
	[descripcion] [varchar](50) NOT NULL,
	[direccionId] [bigint] NULL,
	[contaminacionActual] [decimal](5, 2) NOT NULL,
	[balance] [decimal](18, 2) NOT NULL,
	[cuentaBanco] [varchar](30) NOT NULL,
 CONSTRAINT [PK_productores] PRIMARY KEY CLUSTERED 
(
	[productorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
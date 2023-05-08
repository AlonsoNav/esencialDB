SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[recolectoras](
	[recolectoraId] [bigint] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[regionId] [int] NOT NULL,
	[direccionId] [bigint] NOT NULL,
	[enabled] [bit] NOT NULL,
	[cuentaBanco] [varchar](30) NOT NULL,
 CONSTRAINT [PK_recolectores] PRIMARY KEY CLUSTERED 
(
	[recolectoraId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
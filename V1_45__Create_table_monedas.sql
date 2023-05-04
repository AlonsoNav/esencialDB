SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[monedas](
	[monedaId] [smallint] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](20) NOT NULL,
	[simbolo] [varchar](1) NOT NULL,
	[acronimo] [varchar](3) NOT NULL,
	[base] [bit] NOT NULL,
	[deleted] [bit] NOT NULL,
	[cambioActual] [decimal](18, 4) NOT NULL,
 CONSTRAINT [PK_monedas] PRIMARY KEY CLUSTERED 
(
	[monedaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[direcciones](
	[direccionId] [bigint] NOT NULL,
	[codigoPostalId] [bigint] NOT NULL,
	[direccionFisica] [varchar](100) NOT NULL,
	[geoLocation] [geography] NOT NULL,
 CONSTRAINT [PK_direcciones] PRIMARY KEY CLUSTERED 
(
	[direccionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
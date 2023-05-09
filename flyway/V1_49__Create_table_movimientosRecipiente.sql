SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[movimientosRecipiente](
	[movimientoId] [bigint] IDENTITY(1,1) NOT NULL,
	[tipoRecId] [int] NOT NULL,
	[cantidadRec] [bigint] NOT NULL,
	[desechoId] [int] NULL,
	[cantidadDes] [bigint] NULL,
	[posttime] [timestamp] NOT NULL,
	[accesedFrom] [varchar](50) NOT NULL,
	[checksum] [varbinary](150) NOT NULL,
	[movementTypeId] [smallint] NOT NULL,
	[plantaId] [int] NULL,
	[productorId] [int] NULL,
	[subProductorId] [bigint] NULL,
	[direccionId] [bigint] NOT NULL,
 CONSTRAINT [PK_movimientosRecipiente] PRIMARY KEY CLUSTERED 
(
	[movimientoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
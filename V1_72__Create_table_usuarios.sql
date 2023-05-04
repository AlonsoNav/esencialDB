SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuarios](
	[usuarioId] [bigint] IDENTITY(1,1) NOT NULL,
	[apellido] [varchar](50) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[nickname] [varchar](50) NOT NULL,
	[checksum] [varbinary](150) NULL,
	[fechaRegistro] [datetime] NOT NULL,
	[deleted] [bit] NOT NULL,
	[profilePicture] [varchar](150) NOT NULL,
	[password] [varchar](16) NOT NULL,
	[direccionId] [bigint] NOT NULL,
 CONSTRAINT [PK_usuarios] PRIMARY KEY CLUSTERED
(
	[usuarioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[traducciones](
	[traduccionId] [bigint] IDENTITY(1,1) NOT NULL,
	[textTraducido] [varchar](150) NOT NULL,
	[idiomaTraducido] [smallint] NOT NULL,
	[objectTypeId] [bigint] NOT NULL,
	[referenceId] [bigint] NOT NULL,
	[enabled] [bit] NOT NULL,
 CONSTRAINT [PK_traducciones] PRIMARY KEY CLUSTERED
(
	[traduccionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
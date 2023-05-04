SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[desechoXContrato](
	[contratoId] [bigint] NOT NULL,
	[desechoId] [int] NOT NULL,
	[tratamientoId] [int] NOT NULL
) ON [PRIMARY]
GO
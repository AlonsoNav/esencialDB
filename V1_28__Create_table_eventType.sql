SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[eventType](
	[eventTypeId] [smallint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](45) NOT NULL,
 CONSTRAINT [PK_eventType] PRIMARY KEY CLUSTERED 
(
	[eventTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
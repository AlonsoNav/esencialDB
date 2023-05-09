SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[eventLogs](
	[eventLogId] [bigint] IDENTITY(1,1) NOT NULL,
	[levelId] [tinyint] NOT NULL,
	[eventTypeId] [smallint] NOT NULL,
	[sourceId] [tinyint] NOT NULL,
	[reference1] [bigint] NOT NULL,
	[reference2] [bigint] NULL,
	[value1] [varchar](60) NOT NULL,
	[value2] [varchar](60) NULL,
	[posttime] [timestamp] NOT NULL,
	[accesedFrom] [varchar](50) NOT NULL,
	[checkSum] [varbinary](150) NOT NULL,
	[description] [varchar](100) NOT NULL,
 CONSTRAINT [PK_eventLogs] PRIMARY KEY CLUSTERED 
(
	[eventLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
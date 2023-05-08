ALTER TABLE [dbo].[eventLogs]  WITH CHECK ADD  CONSTRAINT [FK_eventLogs_eventType] FOREIGN KEY([eventTypeId])
REFERENCES [dbo].[eventType] ([eventTypeId])
GO
ALTER TABLE [dbo].[eventLogs] CHECK CONSTRAINT [FK_eventLogs_eventType]
GO
ALTER TABLE [dbo].[eventLogs]  WITH CHECK ADD  CONSTRAINT [FK_eventLogs_levels] FOREIGN KEY([levelId])
REFERENCES [dbo].[levels] ([levelId])
GO
ALTER TABLE [dbo].[eventLogs] CHECK CONSTRAINT [FK_eventLogs_levels]
GO
ALTER TABLE [dbo].[eventLogs]  WITH CHECK ADD  CONSTRAINT [FK_eventLogs_objectTypes] FOREIGN KEY([reference1])
REFERENCES [dbo].[objectTypes] ([objectTypeId])
GO
ALTER TABLE [dbo].[eventLogs] CHECK CONSTRAINT [FK_eventLogs_objectTypes]
GO
ALTER TABLE [dbo].[eventLogs]  WITH CHECK ADD  CONSTRAINT [FK_eventLogs_objectTypes1] FOREIGN KEY([reference2])
REFERENCES [dbo].[objectTypes] ([objectTypeId])
GO
ALTER TABLE [dbo].[eventLogs] CHECK CONSTRAINT [FK_eventLogs_objectTypes1]
GO
ALTER TABLE [dbo].[eventLogs]  WITH CHECK ADD  CONSTRAINT [FK_eventLogs_sources] FOREIGN KEY([sourceId])
REFERENCES [dbo].[sources] ([sourceId])
GO
ALTER TABLE [dbo].[eventLogs] CHECK CONSTRAINT [FK_eventLogs_sources]
GO
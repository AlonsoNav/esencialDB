ALTER TABLE [dbo].[idiomas] ADD  CONSTRAINT [DF_idiomas_base]  DEFAULT ((0)) FOR [base]
GO
ALTER TABLE [dbo].[idiomas] ADD  CONSTRAINT [DF_idiomas_enabled]  DEFAULT ((1)) FOR [enabled]
GO
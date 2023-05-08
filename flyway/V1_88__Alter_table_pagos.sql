ALTER TABLE [dbo].[pagos] ADD  CONSTRAINT [DF_pagos_accesdFrom]  DEFAULT ('root') FOR [accesdFrom]
GO
ALTER TABLE [dbo].[pagos]  WITH CHECK ADD  CONSTRAINT [FK_pagos_transacciones] FOREIGN KEY([transaccionId])
REFERENCES [dbo].[transacciones] ([transaccionId])
GO
ALTER TABLE [dbo].[pagos] CHECK CONSTRAINT [FK_pagos_transacciones]
GO
ALTER TABLE CostGoods_HSSECostManage ADD States char(1) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'◊¥Ã¨' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostManage', @level2type=N'COLUMN',@level2name=N'States'
GO

ALTER TABLE CostGoods_HSSECostManage ADD AuditManId NVARCHAR(50) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'…Û∫À»ÀID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostManage', @level2type=N'COLUMN',@level2name=N'AuditManId'
GO

ALTER TABLE [dbo].[CostGoods_HSSECostManage]  WITH CHECK ADD  CONSTRAINT [FK_CostGoods_HSSECostManage_Sys_User1] FOREIGN KEY([AuditManId])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[CostGoods_HSSECostManage] CHECK CONSTRAINT [FK_CostGoods_HSSECostManage_Sys_User1]
GO

ALTER TABLE License_FlowOperate ADD MenuId NVARCHAR(50) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'对应菜单ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_FlowOperate', @level2type=N'COLUMN',@level2name=N'MenuId'
GO

ALTER TABLE License_FireWork ADD NextManId NVARCHAR(50) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'下步办理人ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_FireWork', @level2type=N'COLUMN',@level2name=N'NextManId'
GO
ALTER TABLE [dbo].[License_FireWork]  WITH CHECK ADD  CONSTRAINT [FK_License_FireWork_Sys_User4] FOREIGN KEY([NextManId])
REFERENCES [dbo].[Sys_User] ([UserId])
GO
ALTER TABLE [dbo].[License_FireWork] CHECK CONSTRAINT [FK_License_FireWork_Sys_User4]
GO

ALTER TABLE License_FireWork ALTER COLUMN States VARCHAR(2) NULL
GO


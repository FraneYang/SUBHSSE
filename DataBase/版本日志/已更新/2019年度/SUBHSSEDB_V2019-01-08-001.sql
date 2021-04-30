ALTER TABLE Sys_Log ADD MenuId nvarchar(50) null
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作菜单ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Log', @level2type=N'COLUMN',@level2name=N'MenuId'
GO

ALTER TABLE Sys_Log ADD OperationName nvarchar(50) null
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Log', @level2type=N'COLUMN',@level2name=N'OperationName'
GO

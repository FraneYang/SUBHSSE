-- 添加项目坐标值
ALTER TABLE Base_Project ADD MapCoordinates NVARCHAR(50) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'坐标' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_Project', @level2type=N'COLUMN',@level2name=N'MapCoordinates'
GO


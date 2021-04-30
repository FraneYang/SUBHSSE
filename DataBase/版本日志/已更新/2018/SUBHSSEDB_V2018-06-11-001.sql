ALTER TABLE Manager_SafeReport DROP COLUMN SupSubUnitReportId
GO
ALTER TABLE Manager_SafeReport ADD SupSafeReportId nvarchar(50) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'…œº∂id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafeReport', @level2type=N'COLUMN',@level2name=N'SupSafeReportId'
GO
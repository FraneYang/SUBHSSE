ALTER TABLE Supervise_SubUnitCheckRectify ADD CheckEndDate DATETIME NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supervise_SubUnitCheckRectify', @level2type=N'COLUMN',@level2name=N'CheckEndDate'
GO

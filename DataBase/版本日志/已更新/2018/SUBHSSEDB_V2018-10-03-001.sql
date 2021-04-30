ALTER TABLE SafetyData_SafetyDataPlan ADD IsManual BIT NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否手动添加' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyData_SafetyDataPlan', @level2type=N'COLUMN',@level2name=N'IsManual'
GO

ALTER TABLE SafetyDataE_SafetyDataEPlan ADD IsManual BIT NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否手动添加' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyDataE_SafetyDataEPlan', @level2type=N'COLUMN',@level2name=N'IsManual'
GO
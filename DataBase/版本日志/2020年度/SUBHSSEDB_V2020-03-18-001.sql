UPDATE License_LicenseManager SET WorkStates='3'
GO

ALTER TABLE License_FireWork ADD FireWatchManName NVARCHAR(50) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'监火人姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_FireWork', @level2type=N'COLUMN',@level2name=N'FireWatchManName'
GO
ALTER TABLE License_LimitedSpace ADD FireWatchManName NVARCHAR(50) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'监火人姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_LimitedSpace', @level2type=N'COLUMN',@level2name=N'FireWatchManName'
GO
--作业票 原ID
ALTER TABLE License_FireWork ADD OldLicenseId NVARCHAR(50) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'原许可证ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_FireWork', @level2type=N'COLUMN',@level2name=N'OldLicenseId'
GO
ALTER TABLE License_HeightWork ADD OldLicenseId NVARCHAR(50) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'原许可证ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_HeightWork', @level2type=N'COLUMN',@level2name=N'OldLicenseId'
GO
ALTER TABLE License_LimitedSpace ADD OldLicenseId NVARCHAR(50) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'原许可证ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_LimitedSpace', @level2type=N'COLUMN',@level2name=N'OldLicenseId'
GO
ALTER TABLE License_RadialWork ADD OldLicenseId NVARCHAR(50) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'原许可证ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_RadialWork', @level2type=N'COLUMN',@level2name=N'OldLicenseId'
GO
ALTER TABLE License_OpenCircuit ADD OldLicenseId NVARCHAR(50) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'原许可证ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_OpenCircuit', @level2type=N'COLUMN',@level2name=N'OldLicenseId'
GO
ALTER TABLE License_BreakGround ADD OldLicenseId NVARCHAR(50) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'原许可证ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_BreakGround', @level2type=N'COLUMN',@level2name=N'OldLicenseId'
GO
ALTER TABLE License_NightWork ADD OldLicenseId NVARCHAR(50) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'原许可证ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_NightWork', @level2type=N'COLUMN',@level2name=N'OldLicenseId'
GO
ALTER TABLE License_LiftingWork ADD OldLicenseId NVARCHAR(50) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'原许可证ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_LiftingWork', @level2type=N'COLUMN',@level2name=N'OldLicenseId'
GO

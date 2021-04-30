ALTER TABLE QualityAudit_SubUnitQuality ADD HSELicense2 NVARCHAR(50) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HSE体系认证证书2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_SubUnitQuality', @level2type=N'COLUMN',@level2name=N'HSELicense2'
GO

ALTER TABLE QualityAudit_SubUnitQuality ADD H_EnableDate2 DATETIME NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HSE体系认证证书2有效期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_SubUnitQuality', @level2type=N'COLUMN',@level2name=N'H_EnableDate2'
GO

ALTER TABLE QualityAudit_SubUnitQuality ADD H_ScanUrl2 NVARCHAR(500) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HSE体系认证证书2扫描件' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_SubUnitQuality', @level2type=N'COLUMN',@level2name=N'H_ScanUrl2'
GO


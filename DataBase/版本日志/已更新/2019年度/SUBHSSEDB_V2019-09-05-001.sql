CREATE VIEW [dbo].[View_QualityAudit_SubUnitQuality] 
 AS 
/*项目施工分包资质视图*/
SELECT Unit.UnitId,
	Unit.UnitCode,
	Unit.UnitName,
	Unit.UnitTypeId,
	Unit.Telephone,
	Unit.EMail,
	ProjectUnit.ProjectId,
	SubUnitQuality.SubUnitQualityId, 
	SubUnitQuality.SubUnitQualityName, 
	SubUnitQuality.BusinessLicense, 
	SubUnitQuality.BL_EnableDate, 
	SubUnitQuality.BL_ScanUrl, 
	SubUnitQuality.Certificate, 
	SubUnitQuality.C_EnableDate, 
	SubUnitQuality.C_ScanUrl, 
	SubUnitQuality.QualityLicense, 
	SubUnitQuality.QL_EnableDate, 
	SubUnitQuality.QL_ScanUrl, 
	SubUnitQuality.HSELicense, 
	SubUnitQuality.H_EnableDate, 
	SubUnitQuality.H_ScanUrl,
	SubUnitQuality.SecurityLicense, 
	SubUnitQuality.SL_EnableDate,
	SubUnitQuality.SL_ScanUrl  
 FROM Base_Unit AS Unit 
 LEFT JOIN Base_UnitType AS UnitType ON UnitType.UnitTypeId = Unit.UnitTypeId
 LEFT JOIN Project_ProjectUnit AS ProjectUnit ON ProjectUnit.UnitId = Unit.UnitId
 LEFT JOIN QualityAudit_SubUnitQuality AS SubUnitQuality ON SubUnitQuality.UnitId = Unit.UnitId 
 WHERE ProjectUnit.UnitType='2'

GO



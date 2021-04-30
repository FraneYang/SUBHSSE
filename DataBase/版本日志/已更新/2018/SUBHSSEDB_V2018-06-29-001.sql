CREATE PROCEDURE [dbo].[SpFileSearch]     
	@Name nvarchar(2000)           
AS  
/*数据检索*/          
BEGIN
/***********项目关联******************/
  --安全组织机构
SELECT 
	SafetyOrganizationId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	, CONVERT(varchar(100), a.SortIndex) AS DataCode
	,Names AS Contents
	,('~/SecuritySystem/SafetyOrganizationEdit.aspx?SafetyOrganizationId={0}') AS Url
FROM SecuritySystem_SafetyOrganization AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='1EDD072E-473A-4CDB-A2D3-E401C146B2B2'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN Base_Project AS Project ON a.ProjectId =Project.ProjectId
WHERE  Names LIKE '%'+@Name+'%'
OR '安全组织机构' LIKE '%'+@Name+'%'

UNION  --安全体系
SELECT 
	SafetySystemId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	,Project.ProjectCode AS DataCode
	,Project.ProjectName AS Contents
	,('~/SecuritySystem/SafetySystem.aspx?ProjectId='+ Project.ProjectId) AS Url
FROM SecuritySystem_SafetySystem AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='21C779D6-269B-4CB7-AFFB-F59958AC0EF0'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN Base_Project AS Project ON a.ProjectId =Project.ProjectId
WHERE  Project.ProjectName LIKE '%'+@Name+'%'
OR '安全体系' LIKE '%'+@Name+'%'

UNION  --安全制度
SELECT 
	SafetyInstitutionId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	,CONVERT(varchar(100), EffectiveDate, 23) AS DataCode
	,Title AS Contents
	,('~/SecuritySystem/SafetyInstitutionView.aspx?SafetyInstitutionId={0}') AS Url
FROM SecuritySystem_SafetyInstitution AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='9D04CD8B-575C-4854-B8B0-F90CEEB75815'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN Base_Project AS Project ON a.ProjectId =Project.ProjectId
WHERE  Title LIKE '%'+@Name+'%'
OR '安全制度' LIKE '%'+@Name+'%'

UNION  --安全管理组织机构
SELECT 
	SafetyManageOrganizationId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	,Project.ProjectCode AS DataCode
	,Project.ProjectName AS Contents
	,('~/SecuritySystem/SafetyManageOrganization.aspx?ProjectId='+ Project.ProjectId) AS Url
FROM SecuritySystem_SafetyManageOrganization AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='C8AC9BBB-6E6E-4871-BADC-7963EB1CCAA8'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN Base_Project AS Project ON a.ProjectId =Project.ProjectId
WHERE  Project.ProjectName LIKE '%'+@Name+'%'
OR '安全管理组织机构' LIKE '%'+@Name+'%'

UNION  --安全实施计划
SELECT 
	ActionPlanListId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	,ActionPlanListCode AS DataCode
	,ActionPlanListName AS Contents
	,('~/ActionPlan/ActionPlanListView.aspx?ActionPlanListId={0}') AS Url
FROM ActionPlan_ActionPlanList AS List
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='CBC47C8B-141C-446B-90D9-CE8F5AE66CE4'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN Base_Project AS Project ON List.ProjectId =Project.ProjectId
WHERE  ActionPlanListName LIKE '%'+@Name+'%' OR ActionPlanListContents LIKE '%'+@Name+'%' 
OR '安全实施计划' LIKE '%'+@Name+'%'

UNION  --安全管理规定
SELECT 
	ManagerRuleId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	,ManageRuleCode AS DataCode
	,ManageRuleName AS Contents
	,('~/ActionPlan/ManagerRuleView.aspx?ManagerRuleId={0}') AS Url
FROM ActionPlan_ManagerRule AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='775EFCF4-DE5C-46E9-8EA3-B16270E2F6A6'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN Base_Project AS Project ON a.ProjectId =Project.ProjectId
WHERE  ManageRuleName LIKE '%'+@Name+'%' OR a.Remark LIKE '%'+@Name+'%'
   OR '安全管理规定' LIKE '%'+@Name+'%'

UNION  --人员信息
SELECT 
	PersonId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	,CardNo AS DataCode
	,PersonName AS Contents
	,('~/SitePerson/PersonListEdit.aspx?PersonId={0}') AS Url
FROM SitePerson_Person AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='AD6FC259-CF40-41C7-BA3F-15AC50C1DD20'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN Base_Project AS Project ON a.ProjectId =Project.ProjectId
WHERE  PersonName LIKE '%'+@Name+'%' OR a.CardNo LIKE '%'+@Name+'%'
 OR '人员信息' LIKE '%'+@Name+'%'

UNION  --培训记录
SELECT 
	TrainingId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	,TrainingCode AS DataCode
	,TrainTitle AS Contents
	,('~/EduTrain/TrainRecordView.aspx?TrainingId={0}') AS Url
FROM EduTrain_TrainRecord AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='1182E353-FAB9-4DB1-A1EC-F41A00892128'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN Base_Project AS Project ON a.ProjectId =Project.ProjectId
WHERE  TrainTitle LIKE '%'+@Name+'%' OR a.TrainContent LIKE '%'+@Name+'%'
 OR '培训记录' LIKE '%'+@Name+'%'

UNION  --施工分包资质
SELECT 
	SubUnitQualityId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,'' AS ProjectName
	,Unit.UnitCode AS DataCode
	,Unit.UnitName AS Contents
	,('~/QualityAudit/SubUnitQualityEdit.aspx?UnitId='+Unit.UnitId) AS Url
FROM QualityAudit_SubUnitQuality AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='DFDFEDA3-FECB-40DA-9216-C67B48002A8A'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN Base_Unit AS Unit ON a.UnitId =Unit.UnitId
WHERE  Unit.UnitName LIKE '%'+@Name+'%'
 OR '施工分包资质' LIKE '%'+@Name+'%'

UNION  --采购供货厂家管理
SELECT 
	InUnitId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	,InUnitCode AS DataCode
	,ManufacturerName AS Contents
	,('~/QualityAudit/InUnitEdit.aspx?InUnitId={0}') AS Url
FROM QualityAudit_InUnit AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='03BAA34B-87D2-4479-9E69-10DD4A62A2A8'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN Base_Project AS Project ON a.ProjectId =Project.ProjectId
WHERE  ManufacturerName LIKE '%'+@Name+'%'
 OR '采购供货厂家管理' LIKE '%'+@Name+'%'

UNION  --特岗人员资质
SELECT 
	PersonQualityId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	,a.CertificateNo AS DataCode
	, Person.PersonName +':'+  ISNULL(a.CertificateName,'') AS Contents
	,('~/QualityAudit/PersonQualityEdit.aspx?PersonId='+Person.PersonId) AS Url
FROM QualityAudit_PersonQuality AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='EBEA762D-1F46-47C5-9EAD-759E13D9B41C'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN SitePerson_Person AS Person ON a.PersonId =Person.PersonId
LEFT JOIN Base_Project AS Project ON Person.ProjectId =Project.ProjectId
WHERE  Person.PersonName LIKE '%'+@Name+'%' OR a.CertificateName LIKE '%'+@Name+'%'
 OR a.SendUnit LIKE '%'+@Name+'%' OR a.CertificateNo LIKE '%'+@Name+'%'
 OR '特岗人员资质' LIKE '%'+@Name+'%'

 UNION  --特殊机具设备资质
SELECT 
	EquipmentQualityId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	,EquipmentQualityCode AS DataCode
	,(ISNULL(SpecialEquipment.SpecialEquipmentName,'')+':'+ISNULL(EquipmentQualityName,'')) AS Contents
	,('~/QualityAudit/EquipmentQualityEdit.aspx?EquipmentQualityId={0}') AS Url
FROM QualityAudit_EquipmentQuality AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='2DEDD752-8BAF-43CD-933D-932AF9AF2F58'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN Base_Project AS Project ON a.ProjectId =Project.ProjectId
LEFT JOIN Base_SpecialEquipment AS SpecialEquipment ON a.SpecialEquipmentId =SpecialEquipment.SpecialEquipmentId
WHERE EquipmentQualityName LIKE '%'+@Name+'%' OR SpecialEquipment.SpecialEquipmentName LIKE '%'+@Name+'%'
OR '特殊机具设备资质' LIKE '%'+@Name+'%'

UNION  --一般机具设备资质
SELECT 
	GeneralEquipmentQualityId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	,GeneralEquipmentQualityCode AS DataCode
	,SpecialEquipment.SpecialEquipmentName AS Contents
	,('~/QualityAudit/GeneralEquipmentQualityEdit.aspx?GeneralEquipmentQualityId={0}') AS Url
FROM QualityAudit_GeneralEquipmentQuality AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='BFD62699-47F0-49FA-AD39-FAEE8A6C3313'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN Base_Project AS Project ON a.ProjectId =Project.ProjectId
LEFT JOIN Base_SpecialEquipment AS SpecialEquipment ON a.SpecialEquipmentId =SpecialEquipment.SpecialEquipmentId
WHERE SpecialEquipment.SpecialEquipmentName LIKE '%'+@Name+'%'
OR '一般机具设备资质' LIKE '%'+@Name+'%'

UNION  --项目安全协议清单
SELECT 
	ProjectRecordId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	,ProjectRecordCode AS DataCode
	,ProjectRecordName AS Contents
	,('~/QualityAudit/ProjectRecordEdit.aspx?ProjectRecordId={0}') AS Url
FROM QualityAudit_ProjectRecord AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='874B4232-E0AD-41CD-8C66-8A7FF2D79358'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN Base_Project AS Project ON a.ProjectId =Project.ProjectId
WHERE ProjectRecordName LIKE '%'+@Name+'%'
OR '项目安全协议清单' LIKE '%'+@Name+'%'

UNION  --安全人员资质
SELECT 
	SafePersonQualityId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	,a.CertificateNo AS DataCode
	, Person.PersonName +':'+ ISNULL(a.CertificateName,'') AS Contents
	,('~/QualityAudit/SafePersonQualityEdit.aspx?PersonId='+Person.PersonId) AS Url
FROM QualityAudit_SafePersonQuality AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='750F5074-45B9-470E-AE1E-6204957421E6'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN SitePerson_Person AS Person ON a.PersonId =Person.PersonId
LEFT JOIN Base_Project AS Project ON Person.ProjectId =Project.ProjectId
WHERE  Person.PersonName LIKE '%'+@Name+'%' OR a.CertificateName LIKE '%'+@Name+'%'
 OR a.SendUnit LIKE '%'+@Name+'%' OR a.CertificateNo LIKE '%'+@Name+'%'
 OR '安全人员资质' LIKE '%'+@Name+'%'

 UNION  --管理人员资质
SELECT 
	ManagePersonQualityId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	,a.CertificateNo AS DataCode
	, Person.PersonName +':'+  ISNULL(a.CertificateName,'') AS Contents
	,('~/QualityAudit/ManagePersonQualityEdit.aspx?PersonId='+Person.PersonId) AS Url
FROM QualityAudit_ManagePersonQuality AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='07435F23-F87D-4F52-B32C-A3DA95B10DA2'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN SitePerson_Person AS Person ON a.PersonId =Person.PersonId
LEFT JOIN Base_Project AS Project ON Person.ProjectId =Project.ProjectId
WHERE  Person.PersonName LIKE '%'+@Name+'%' OR a.CertificateName LIKE '%'+@Name+'%'
 OR a.SendUnit LIKE '%'+@Name+'%' OR a.CertificateNo LIKE '%'+@Name+'%'
 OR '管理人员资质' LIKE '%'+@Name+'%'
 
 UNION  --现场作业许可证
SELECT 
	LicenseManagerId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	,LicenseManagerCode AS DataCode
	,LicenseType.LicenseTypeName AS Contents
	,('~/License/LicenseManagerView.aspx?LicenseManagerId={0}') AS Url
FROM License_LicenseManager AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='0E9B7084-D021-4CA3-B9D2-9CBAA27A571B'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN Base_Project AS Project ON a.ProjectId =Project.ProjectId
LEFT JOIN Base_LicenseType AS LicenseType ON a.LicenseTypeId =LicenseType.LicenseTypeId
WHERE LicenseType.LicenseTypeName LIKE '%'+@Name+'%' OR LicenseManageContents LIKE '%'+@Name+'%'
 OR '现场作业许可证' LIKE '%'+@Name+'%'

UNION  --新开项目作业许可证
SELECT 
	SecurityLicenseId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	,SecurityLicenseCode AS DataCode
	,SecurityLicenseName AS Contents
	,('~/License/SecurityLicenseEdit.aspx?SecurityLicenseId={0}') AS Url
FROM License_SecurityLicense AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='915F5AB2-CDCA-4025-A462-AC873D8FB037'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN Base_Project AS Project ON a.ProjectId =Project.ProjectId
WHERE SecurityLicenseName LIKE '%'+@Name+'%' OR NewProjectName LIKE '%'+@Name+'%'
 OR NewProjectPart LIKE '%'+@Name+'%' OR '新开项目作业许可证' LIKE '%'+@Name+'%'

UNION  --施工机具、安全设施检查验收
SELECT 
	EquipmentSafetyListId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	,EquipmentSafetyListCode AS DataCode
	,EquipmentSafetyListName AS Contents
	,('~/License/EquipmentSafetyListView.aspx?EquipmentSafetyListId={0}') AS Url
FROM License_EquipmentSafetyList AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='9703D711-85DA-4A0B-B08B-70F791418696'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN Base_Project AS Project ON a.ProjectId =Project.ProjectId
WHERE EquipmentSafetyListName LIKE '%'+@Name+'%' OR '施工机具安全设施检查验收' LIKE '%'+@Name+'%'

UNION  --安全技术交底
SELECT 
	HSETechnicalId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	,HSETechnicalCode AS DataCode
	,WorkContents AS Contents
	,('~/License/HSETechnicalView.aspx?HSETechnicalId={0}') AS Url
FROM License_HSETechnical AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='49485F7E-8E71-4EED-87B4-BF6CC180C69C'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN Base_Project AS Project ON a.ProjectId =Project.ProjectId
WHERE WorkContents LIKE '%'+@Name+'%' OR '安全技术交底' LIKE '%'+@Name+'%'

UNION  --环境因素识别与评价
SELECT 
	EnvironmentalRiskListId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	,RiskCode AS DataCode
	,RiskCode AS Contents
	,('~/Hazard/EnvironmentalRiskListView.aspx?EnvironmentalRiskListId={0}') AS Url
FROM Hazard_EnvironmentalRiskList AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='762F0BF9-471B-4115-B35E-03A26C573877'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN Base_Project AS Project ON a.ProjectId =Project.ProjectId
WHERE RiskCode LIKE '%'+@Name+'%' OR Contents LIKE '%'+@Name+'%' OR '环境因素识别与评价' LIKE '%'+@Name+'%'

UNION  --职业健康安全危险源辨识与评价
SELECT 
	HazardListId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	,HazardListCode AS DataCode
	,HazardListCode AS Contents
	,('~/Hazard/HazardListView.aspx?HazardListId={0}') AS Url
FROM Hazard_HazardList AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='94C36333-C22A-499F-B9DB-53EEF77922AE'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN Base_Project AS Project ON a.ProjectId =Project.ProjectId
WHERE HazardListCode LIKE '%'+@Name+'%' OR Contents LIKE '%'+@Name+'%' OR '职业健康安全危险源辨识与评价' LIKE '%'+@Name+'%'

UNION  --其他危险源辨识文件
SELECT 
	OtherHazardId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	,OtherHazardCode AS DataCode
	,OtherHazardName AS Contents
	,('~/Hazard/OtherHazardView.aspx?OtherHazardId={0}') AS Url
FROM Hazard_OtherHazard AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='E22F555A-D41C-4F5F-9734-39B578957732'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN Base_Project AS Project ON a.ProjectId =Project.ProjectId
WHERE OtherHazardName LIKE '%'+@Name+'%'  OR '其他危险源辨识文件' LIKE '%'+@Name+'%'

UNION  --方案模板
SELECT 
	SolutionTemplateId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	,SolutionTemplateCode AS DataCode
	,SolutionTemplateName AS Contents
	,('~/Solution/SolutionTemplateView.aspx?SolutionTemplateId={0}') AS Url
FROM Solution_SolutionTemplate AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='D5F6DFAA-4051-4E0E-818B-2A45F985C5A4'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN Base_Project AS Project ON a.ProjectId =Project.ProjectId
WHERE SolutionTemplateName LIKE '%'+@Name+'%'  OR '方案模板' LIKE '%'+@Name+'%'

UNION  --施工方案/审查
SELECT 
	ConstructSolutionId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	,ConstructSolutionCode AS DataCode
	,ConstructSolutionName AS Contents
	,('~/Solution/ConstructSolutionView.aspx?ConstructSolutionId={0}') AS Url
FROM Solution_ConstructSolution AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='9B42977B-FA0B-48EF-8616-D53FC14E5127'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN Base_Project AS Project ON a.ProjectId =Project.ProjectId
LEFT JOIN Sys_Const AS Consts ON Consts.ConstValue = a.SolutinType and  Consts.GroupId='CNProfessional'
WHERE ConstructSolutionName LIKE '%'+@Name+'%' OR Consts.ConstText LIKE '%'+@Name+'%' OR '施工方案/审查' LIKE '%'+@Name+'%'

UNION  --危大工程施工方案清单
SELECT 
	HazardId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	,HazardCode AS DataCode
	,HazardCode AS Contents
	,('~/Solution/LargerHazardView.aspx?HazardId={0}') AS Url
FROM Solution_LargerHazard AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='5B3D3F7B-9B50-4927-B131-11D13D4D1C19'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN Base_Project AS Project ON a.ProjectId =Project.ProjectId
LEFT JOIN Sys_Const AS Consts ON Consts.ConstValue = a.HazardType and Consts.GroupId='LargerHazardType'
WHERE HazardCode LIKE '%'+@Name+'%' OR Consts.ConstText LIKE '%'+@Name+'%' OR Address LIKE '%'+@Name+'%' 
OR a.Remark LIKE '%'+@Name+'%' OR Descriptions LIKE '%'+@Name+'%'
OR '危大工程施工方案清单' LIKE '%'+@Name+'%'

UNION  --专家论证清单
SELECT 
	HazardId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	,HazardCode AS DataCode
	,HazardCode AS Contents
	,('~/Solution/LargerHazardView.aspx?HazardId={0}') AS Url
FROM Solution_LargerHazard AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='27DE7248-C4FF-4288-BBAC-11CB8741AD67'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN Base_Project AS Project ON a.ProjectId =Project.ProjectId
LEFT JOIN Sys_Const AS Consts ON Consts.ConstValue = a.HazardType and Consts.GroupId='LargerHazardType'
WHERE IsArgument=1 AND (HazardCode LIKE '%'+@Name+'%' OR Consts.ConstText LIKE '%'+@Name+'%' OR Address LIKE '%'+@Name+'%' 
OR a.Remark LIKE '%'+@Name+'%' OR Descriptions LIKE '%'+@Name+'%'
OR '专家论证清单' LIKE '%'+@Name+'%')

UNION  --日常巡检
SELECT 
	CheckDayId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	,CheckDayCode AS DataCode
	,CheckDayCode AS Contents
	,('~/Check/CheckDayView.aspx?CheckDayId={0}') AS Url
FROM Check_CheckDay AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='9F6FB863-4001-49BD-A748-66009891D13C'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN Base_Project AS Project ON a.ProjectId =Project.ProjectId
WHERE CheckDayCode LIKE '%'+@Name+'%' OR DaySummary LIKE '%'+@Name+'%' OR '日常巡检' LIKE '%'+@Name+'%'

UNION  --专项检查
SELECT 
	CheckSpecialId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	,CheckSpecialCode AS DataCode
	,CheckSpecialCode AS Contents
	,('~/Check/CheckSpecialView.aspx?CheckSpecialId={0}') AS Url
FROM Check_CheckSpecial AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='1B08048F-93ED-4E84-AE65-DB7917EA2DFB'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN Base_Project AS Project ON a.ProjectId =Project.ProjectId
WHERE CheckSpecialCode LIKE '%'+@Name+'%' OR DaySummary LIKE '%'+@Name+'%' OR '专项检查' LIKE '%'+@Name+'%'

UNION  --综合检查
SELECT 
	CheckColligationId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	,CheckColligationCode AS DataCode
	,CheckColligationCode AS Contents
	,('~/Check/CheckColligationView.aspx?CheckColligationId={0}') AS Url
FROM Check_CheckColligation AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='C198EBA8-9E23-4654-92E1-09C61105C522'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN Base_Project AS Project ON a.ProjectId =Project.ProjectId
WHERE CheckColligationCode LIKE '%'+@Name+'%' OR DaySummary LIKE '%'+@Name+'%' OR '综合检查' LIKE '%'+@Name+'%'

UNION  --开工前检查
SELECT 
	CheckWorkId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	,CheckWorkCode AS DataCode
	,CheckWorkCode AS Contents
	,('~/Check/CheckWorkView.aspx?CheckWorkId={0}') AS Url
FROM Check_CheckWork AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='9212291A-FBC5-4F6D-A5F6-60BFF4E30F6F'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN Base_Project AS Project ON a.ProjectId =Project.ProjectId
WHERE CheckWorkCode LIKE '%'+@Name+'%' OR Area LIKE '%'+@Name+'%' OR '开工前检查' LIKE '%'+@Name+'%'

UNION  --季节性/节假日检查
SELECT 
	CheckHolidayId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	,CheckHolidayCode AS DataCode
	,CheckHolidayCode AS Contents
	,('~/Check/CheckHolidayView.aspx?CheckHolidayId={0}') AS Url
FROM Check_CheckHoliday AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='9212291A-FBC5-4F6D-A5F6-60BFF4E30F6F'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN Base_Project AS Project ON a.ProjectId =Project.ProjectId
WHERE CheckHolidayCode LIKE '%'+@Name+'%' OR Area LIKE '%'+@Name+'%' OR '季节性/节假日检查' LIKE '%'+@Name+'%'

UNION  --隐患整改通知单
SELECT 
	RectifyNoticesId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	,RectifyNoticesCode AS DataCode
	,WrongContent AS Contents
	,('~/Check/RectifyNoticeView.aspx?RectifyNoticeId={0}') AS Url
FROM Check_RectifyNotices AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='0038D764-D628-46F0-94FF-D0A22C3C45A3'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN Base_Project AS Project ON a.ProjectId =Project.ProjectId
WHERE RectifyNoticesCode LIKE '%'+@Name+'%' OR WrongContent LIKE '%'+@Name+'%' OR '隐患整改通知单' LIKE '%'+@Name+'%'

UNION  --企业监督检查整改
SELECT 
	SuperviseCheckRectifyId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	,SuperviseCheckRectifyCode AS DataCode
	,SuperviseCheckRectifyCode AS Contents
	,('~/Hazard/ProjectSuperviseCheckRectifyEdit.aspx?SuperviseCheckRectifyId={0}') AS Url
FROM Supervise_SuperviseCheckRectify AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='29F27641-06ED-435A-9F9B-FCE6366801BE'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN Base_Project AS Project ON a.ProjectId =Project.ProjectId
WHERE SuperviseCheckRectifyCode LIKE '%'+@Name+'%' OR '企业监督检查整改' LIKE '%'+@Name+'%'

UNION  --隐患巡检（手机端）
SELECT 
	RegistrationId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	,ProblemTypes AS DataCode
	,ProblemDescription AS Contents
	,('~/Check/RegistrationView.aspx?RegistrationId={0}') AS Url
FROM View_Inspection_Registration AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='B6BE5FE0-CB84-47FF-A6C3-5AD9E1CCE079'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN Base_Project AS Project ON a.ProjectId =Project.ProjectId
WHERE ProblemTypes LIKE '%'+@Name+'%' OR ProblemDescription LIKE '%'+@Name+'%' 
OR '隐患巡检（手机端）' LIKE '%'+@Name+'%'

UNION  --工程暂停令
SELECT 
	PauseNoticeId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	,PauseNoticeCode AS DataCode
	,WrongContent AS Contents
	,('~/Check/PauseNoticeView.aspx?PauseNoticeId={0}') AS Url
FROM Check_PauseNotice AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='C81DB7ED-165E-4C69-86B0-A3AAE37059FE'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN Base_Project AS Project ON a.ProjectId =Project.ProjectId
WHERE WrongContent LIKE '%'+@Name+'%' OR PauseNoticeCode LIKE '%'+@Name+'%' 
OR '工程暂停令' LIKE '%'+@Name+'%'

UNION  --监理整改通知单
SELECT 
	SupervisionNoticeId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	,SupervisionNoticeCode AS DataCode
	,WrongContent AS Contents
	,('~/Check/SupervisionNoticeView.aspx?SupervisionNoticeId={0}') AS Url
FROM Check_SupervisionNotice AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='F910062E-98B0-486F-A8BD-D5B0035F808F'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN Base_Project AS Project ON a.ProjectId =Project.ProjectId
WHERE WrongContent LIKE '%'+@Name+'%' OR SupervisionNoticeCode LIKE '%'+@Name+'%' 
OR '监理整改通知单' LIKE '%'+@Name+'%'

UNION  --联系单
SELECT 
	ContactListId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	,Code AS DataCode
	,ReceivingUnitNames AS Contents
	,('~/Check/ContactListView.aspx?ContactListId={0}') AS Url
FROM Check_ContactList AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='F057C207-4549-48AE-B838-A1920E5709D8'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN Base_Project AS Project ON a.ProjectId =Project.ProjectId
WHERE ReceivingUnitNames LIKE '%'+@Name+'%' OR a.Remark LIKE '%'+@Name+'%' 
OR '联系单' LIKE '%'+@Name+'%'

UNION  --应急预案管理清单
SELECT 
	EmergencyListId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	,EmergencyCode AS DataCode
	,EmergencyName AS Contents
	,('~/Emergency/EmergencyListView.aspx?EmergencyListId={0}') AS Url
FROM Emergency_EmergencyList AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='ABD84F93-A84E-448C-8A67-AB0FE4E8D10C'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN Base_Project AS Project ON a.ProjectId =Project.ProjectId
WHERE EmergencyName LIKE '%'+@Name+'%' OR EmergencyCode LIKE '%'+@Name+'%' 
OR '应急预案管理清单' LIKE '%'+@Name+'%'

UNION  --应急演练开展情况
SELECT 
	DrillRecordListId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	,DrillRecordCode AS DataCode
	,DrillRecordName AS Contents
	,('~/Emergency/DrillRecordListView.aspx?DrillRecordListId={0}') AS Url
FROM Emergency_DrillRecordList AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='CF5516F7-0735-44EF-9A6D-46FABF8EBC6E'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN Base_Project AS Project ON a.ProjectId =Project.ProjectId
WHERE DrillRecordName LIKE '%'+@Name+'%' OR DrillRecordCode LIKE '%'+@Name+'%' 
OR '应急演练开展情况' LIKE '%'+@Name+'%'

UNION  --应急物资管理
SELECT 
	FileId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	,FileCode AS DataCode
	,FileName AS Contents
	,('~/Emergency/EmergencySupplyView.aspx?FileId={0}') AS Url
FROM Emergency_EmergencySupply AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='CF5516F7-0735-44EF-9A6D-46FABF8EBC6E'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN Base_Project AS Project ON a.ProjectId =Project.ProjectId
WHERE FileName LIKE '%'+@Name+'%' OR FileContent LIKE '%'+@Name+'%' 
OR '应急物资管理' LIKE '%'+@Name+'%'

UNION  --应急队伍与培训
SELECT 
	FileId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	,FileCode AS DataCode
	,FileName AS Contents
	,('~/Emergency/EmergencyTeamAndTrainView.aspx?FileId={0}') AS Url
FROM Emergency_EmergencyTeamAndTrain AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='6FDF9DAE-2161-4F67-931F-85DEAFC3842A'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN Base_Project AS Project ON a.ProjectId =Project.ProjectId
WHERE FileName LIKE '%'+@Name+'%' OR FileContent LIKE '%'+@Name+'%' 
OR '应急队伍与培训' LIKE '%'+@Name+'%'

UNION  --应急响应记录/评价
SELECT 
	FileId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	,FileCode AS DataCode
	,FileName AS Contents
	,('~/Emergency/EmergencyResponseRecordView.aspx?FileId={0}') AS Url
FROM Emergency_EmergencyResponseRecord AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='6FDF9DAE-2161-4F67-931F-85DEAFC3842A'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN Base_Project AS Project ON a.ProjectId =Project.ProjectId
WHERE FileName LIKE '%'+@Name+'%' OR FileContent LIKE '%'+@Name+'%' 
OR '应急响应记录/评价' LIKE '%'+@Name+'%'

UNION  --奖励通知单
SELECT 
	IncentiveNoticeId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	,IncentiveNoticeCode AS DataCode
	,BasicItem AS Contents
	,('~/Check/IncentiveNoticeView.aspx?IncentiveNoticeId={0}') AS Url
FROM Check_IncentiveNotice AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='96F21A83-6871-4CC4-8901-1B99C376395C'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN Sys_Const AS RewardType ON RewardType.GroupId='RewardType' AND RewardType.ConstValue=a.RewardType
LEFT JOIN Base_Project AS Project ON a.ProjectId =Project.ProjectId
WHERE IncentiveNoticeCode LIKE '%'+@Name+'%' OR RewardType.ConstText LIKE '%'+@Name+'%' 
OR BasicItem LIKE '%'+@Name+'%' OR '奖励通知单' LIKE '%'+@Name+'%'

UNION  --处罚通知单
SELECT 
	PunishNoticeId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	,PunishNoticeCode AS DataCode
	,IncentiveReason AS Contents
	,('~/Check/PunishNoticeView.aspx?PunishNoticeId={0}') AS Url
FROM Check_PunishNotice AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='755F1C1D-2178-47D8-9F82-A501B53A2436'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN Base_Project AS Project ON a.ProjectId =Project.ProjectId
WHERE PunishNoticeCode LIKE '%'+@Name+'%' OR IncentiveReason LIKE '%'+@Name+'%' 
OR BasicItem LIKE '%'+@Name+'%' OR '处罚通知单' LIKE '%'+@Name+'%'

UNION  --违规人员记录
SELECT 
	ViolationPersonId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	,ViolationPersonCode AS DataCode
	,(Person.PersonName+':'+ISNULL(Const1.ConstText,'')+ISNULL(Const2.ConstText,'')) AS Contents
	,('~/Check/ViolationPersonView.aspx?ViolationPersonId={0}') AS Url
FROM Check_ViolationPerson AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='06958288-96F4-4291-909A-FFC2FC76814D'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN Base_Project AS Project ON a.ProjectId =Project.ProjectId
LEFT JOIN SitePerson_Person AS Person ON Person.PersonId = a.PersonId
LEFT JOIN Sys_Const AS Const1 ON Const1.GroupId='ViolationType' AND Const1.ConstValue=a.violationtype
LEFT JOIN Sys_Const AS Const2 ON Const2.GroupId='ViolationType' AND Const2.ConstValue=a.violationtype
WHERE ViolationPersonCode LIKE '%'+@Name+'%' OR Const1.ConstText LIKE '%'+@Name+'%' OR Const2.ConstText LIKE '%'+@Name+'%'
OR Person.PersonName LIKE '%'+@Name+'%' OR ViolationDef LIKE '%'+@Name+'%' OR '违规人员记录' LIKE '%'+@Name+'%'

UNION  --获奖证书或奖杯
SELECT 
	HSECertificateId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	,HSECertificateCode AS DataCode
	,HSECertificateName AS Contents
	,('~/Check/HSECertificateView.aspx?HSECertificateId={0}') AS Url
FROM Check_HSECertificate AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='9A034CAD-C7D5-4DE4-9FF5-828D35FFEE28'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN Base_Project AS Project ON a.ProjectId =Project.ProjectId
WHERE HSECertificateCode LIKE '%'+@Name+'%' OR HSECertificateName LIKE '%'+@Name+'%' 
 OR '获奖证书或奖杯' LIKE '%'+@Name+'%'

 UNION  --安全周例会
SELECT 
	WeekMeetingId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	,WeekMeetingCode AS DataCode
	,WeekMeetingName AS Contents
	,('~/Meeting/WeekMeetingView.aspx?WeekMeetingId={0}') AS Url
FROM Meeting_WeekMeeting AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='5236B1D9-8B57-495E-8644-231DF5D066CE'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN Base_Project AS Project ON a.ProjectId =Project.ProjectId
WHERE WeekMeetingCode LIKE '%'+@Name+'%' OR WeekMeetingName LIKE '%'+@Name+'%' 
 OR WeekMeetingContents LIKE '%'+@Name+'%'
 OR '安全周例会' LIKE '%'+@Name+'%'

 UNION  --安全月例会
SELECT 
	MonthMeetingId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	,MonthMeetingCode AS DataCode
	,MonthMeetingName AS Contents
	,('~/Meeting/MonthMeetingView.aspx?MonthMeetingId={0}') AS Url
FROM Meeting_MonthMeeting AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='D5DD5EBD-A5F2-4A43-BA4C-E9A242B43684'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN Base_Project AS Project ON a.ProjectId =Project.ProjectId
WHERE MonthMeetingCode LIKE '%'+@Name+'%' OR MonthMeetingName LIKE '%'+@Name+'%' 
 OR MonthMeetingContents LIKE '%'+@Name+'%'
 OR '安全月例会' LIKE '%'+@Name+'%'

 UNION  --安全专题会议
SELECT 
	SpecialMeetingId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	,SpecialMeetingCode AS DataCode
	,SpecialMeetingName AS Contents
	,('~/Meeting/SpecialMeetingView.aspx?SpecialMeetingId={0}') AS Url
FROM Meeting_SpecialMeeting AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='BB6CEC48-283B-46AD-BEDD-F964D261698F'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN Base_Project AS Project ON a.ProjectId =Project.ProjectId
WHERE SpecialMeetingCode LIKE '%'+@Name+'%' OR SpecialMeetingName LIKE '%'+@Name+'%' 
 OR SpecialMeetingContents LIKE '%'+@Name+'%'
 OR '安全专题会议' LIKE '%'+@Name+'%'

 UNION  --其他会议记录
SELECT 
	AttendMeetingId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	,AttendMeetingCode AS DataCode
	,AttendMeetingName AS Contents
	,('~/Meeting/AttendMeetingView.aspx?AttendMeetingId={0}') AS Url
FROM Meeting_AttendMeeting AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='B2DA78EF-EECA-4AF4-9FAC-ECCFF1D6E459'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN Base_Project AS Project ON a.ProjectId =Project.ProjectId
WHERE AttendMeetingCode LIKE '%'+@Name+'%' OR AttendMeetingName LIKE '%'+@Name+'%' 
 OR AttendMeetingContents LIKE '%'+@Name+'%'
 OR '其他会议记录' LIKE '%'+@Name+'%'

 UNION  --班前会
SELECT 
	ClassMeetingId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	,ClassMeetingCode AS DataCode
	,ClassMeetingName AS Contents
	,('~/Meeting/ClassMeetingView.aspx?ClassMeetingId={0}') AS Url
FROM Meeting_ClassMeeting AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='F8ADCDBC-AAAD-4884-9935-2B63562E4779'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN Base_Project AS Project ON a.ProjectId =Project.ProjectId
WHERE ClassMeetingCode LIKE '%'+@Name+'%' OR ClassMeetingName LIKE '%'+@Name+'%' 
 OR ClassMeetingContents LIKE '%'+@Name+'%'
 OR '班前会' LIKE '%'+@Name+'%'

 UNION  --主题安全活动
SELECT 
	ThemeActivitiesId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	,CONVERT(varchar(100), CompileDate, 23) AS DataCode
	,Title AS Contents
	,('~/SafetyActivities/ThemeActivitiesView.aspx?ThemeActivitiesId={0}') AS Url
FROM SafetyActivities_ThemeActivities AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='96CC0F1F-405B-4EE7-87CF-4CAE1FCC9435'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN Base_Project AS Project ON a.ProjectId =Project.ProjectId
WHERE  Title LIKE '%'+@Name+'%' 
 OR SeeFile LIKE '%'+@Name+'%'
 OR '主题安全活动' LIKE '%'+@Name+'%'

 UNION  --月度安全评比
SELECT 
	MonthlyRatingId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	,CONVERT(varchar(100), CompileDate, 23) AS DataCode
	,Title AS Contents
	,('~/SafetyActivities/MonthlyRatingView.aspx?MonthlyRatingId={0}') AS Url
FROM SafetyActivities_MonthlyRating AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='293FD782-7B39-4F0F-A826-CA790A70CCC7'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN Base_Project AS Project ON a.ProjectId =Project.ProjectId
WHERE  Title LIKE '%'+@Name+'%' 
 OR SeeFile LIKE '%'+@Name+'%'
 OR '月度安全评比' LIKE '%'+@Name+'%'
 
 UNION  --全国安全月
SELECT 
	SafetyMonthId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	,CONVERT(varchar(100), CompileDate, 23) AS DataCode
	,Title AS Contents
	,('~/SafetyActivities/SafetyMonthView.aspx?SafetyMonthId={0}') AS Url
FROM SafetyActivities_SafetyMonth AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='71DA0222-1509-4154-AB39-8E88769C043C'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN Base_Project AS Project ON a.ProjectId =Project.ProjectId
WHERE  Title LIKE '%'+@Name+'%' 
 OR SeeFile LIKE '%'+@Name+'%'
 OR '全国安全月' LIKE '%'+@Name+'%'

 UNION  --119消防
SELECT 
	FireActivitiesId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	,CONVERT(varchar(100), CompileDate, 23) AS DataCode
	,Title AS Contents
	,('~/SafetyActivities/FireActivitiesView.aspx?FireActivitiesId={0}') AS Url
FROM SafetyActivities_FireActivities AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='58F5A99C-8104-459F-8934-54C30EE972AA'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN Base_Project AS Project ON a.ProjectId =Project.ProjectId
WHERE  Title LIKE '%'+@Name+'%' 
 OR SeeFile LIKE '%'+@Name+'%'
 OR '119消防' LIKE '%'+@Name+'%'

 UNION  --其他
SELECT 
	OtherActivitiesId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	,CONVERT(varchar(100), CompileDate, 23) AS DataCode
	,Title AS Contents
	,('~/SafetyActivities/OtherActivitiesView.aspx?OtherActivitiesId={0}') AS Url
FROM SafetyActivities_OtherActivities AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='446D702B-F0C1-4D12-A862-0B8317D95928'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN Base_Project AS Project ON a.ProjectId =Project.ProjectId
WHERE  Title LIKE '%'+@Name+'%' 
 OR SeeFile LIKE '%'+@Name+'%'
 OR '其他' LIKE '%'+@Name+'%'

 UNION  --特种设备机具入场报批
SELECT 
	EquipmentInId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	,EquipmentInCode AS DataCode
	,ContentDef AS Contents
	,('~/InApproveManager/EquipmentInView.aspx?EquipmentInId={0}') AS Url
FROM InApproveManager_EquipmentIn AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='3E167389-4775-4AC3-9D31-2E570682EDA1'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN Base_Project AS Project ON a.ProjectId =Project.ProjectId
WHERE  SubProjectName LIKE '%'+@Name+'%' OR CarNumber LIKE '%'+@Name+'%'
 OR EquipmentInCode LIKE '%'+@Name+'%' OR ContentDef LIKE '%'+@Name+'%'
 OR '特种设备机具入场报批' LIKE '%'+@Name+'%'

 UNION  --特种设备机具出场报批
SELECT 
	EquipmentOutId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	,EquipmentOutCode AS DataCode
	,DriverNum AS Contents
	,('~/InApproveManager/EquipmentOutView.aspx?EquipmentOutId={0}') AS Url
FROM InApproveManager_EquipmentOut AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='3E167389-4775-4AC3-9D31-2E570682EDA1'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN Base_Project AS Project ON a.ProjectId =Project.ProjectId
WHERE  DriverNum LIKE '%'+@Name+'%' OR DriverName LIKE '%'+@Name+'%' OR CarNum LIKE '%'+@Name+'%'
 OR EquipmentOutCode LIKE '%'+@Name+'%' OR CarModel LIKE '%'+@Name+'%'
 OR '特种设备机具出场报批' LIKE '%'+@Name+'%'

 UNION  --一般设备机具入场报批
SELECT 
	GeneralEquipmentInId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	,GeneralEquipmentInCode AS DataCode
	,ContentDef AS Contents
	,('~/InApproveManager/GeneralEquipmentInView.aspx?GeneralEquipmentInId={0}') AS Url
FROM InApproveManager_GeneralEquipmentIn AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='06EA1483-7397-46DD-818D-56911EA7B679'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN Base_Project AS Project ON a.ProjectId =Project.ProjectId
WHERE  ContentDef LIKE '%'+@Name+'%' OR CarNumber LIKE '%'+@Name+'%' OR SubProjectName LIKE '%'+@Name+'%'
 OR GeneralEquipmentInCode LIKE '%'+@Name+'%' 
 OR '一般设备机具入场报批' LIKE '%'+@Name+'%'

 UNION  --一般设备机具出场报批
SELECT 
	GeneralEquipmentOutId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	,GeneralEquipmentOutCode AS DataCode
	,DriverNum AS Contents
	,('~/InApproveManager/GeneralEquipmentOutView.aspx?GeneralEquipmentOutId={0}') AS Url
FROM InApproveManager_GeneralEquipmentOut AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='56F241A9-0AA3-4EDB-8C5C-999C487C06DA'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN Base_Project AS Project ON a.ProjectId =Project.ProjectId
WHERE  DriverNum LIKE '%'+@Name+'%' OR CarNum LIKE '%'+@Name+'%' OR CarModel LIKE '%'+@Name+'%'
 OR GeneralEquipmentOutCode LIKE '%'+@Name+'%' OR DriverName LIKE '%'+@Name+'%' 
 OR '一般设备机具出场报批' LIKE '%'+@Name+'%'

UNION  --普通货物入场报批
SELECT 
	GoodsInId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	,GoodsInCode AS DataCode
	,DriverNameAndNum AS Contents
	,('~/InApproveManager/GoodsInView.aspx?GoodsInId={0}') AS Url
FROM InApproveManager_GoodsIn AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='32CA471B-86FD-420F-8DAA-FF16B5BEBBB4'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN Base_Project AS Project ON a.ProjectId =Project.ProjectId
WHERE  DriverNameAndNum LIKE '%'+@Name+'%' OR CarNum LIKE '%'+@Name+'%' OR GoodsInResult LIKE '%'+@Name+'%'
 OR GoodsInNote LIKE '%'+@Name+'%' 
 OR '普通货物入场报批' LIKE '%'+@Name+'%'

 UNION  --普通货物出场报批
SELECT 
	GoodsOutId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	,GoodsOutCode AS DataCode
	,GoodsOutNote AS Contents
	,('~/InApproveManager/GoodsOutView.aspx?GoodsOutId={0}') AS Url
FROM InApproveManager_GoodsOut AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='ADD37E84-923C-4AFA-BE37-670B40ABF0F7'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN Base_Project AS Project ON a.ProjectId =Project.ProjectId
WHERE  GoodsOutNote LIKE '%'+@Name+'%' OR CarNum LIKE '%'+@Name+'%' OR CarModel LIKE '%'+@Name+'%'
 OR GoodsOutCode LIKE '%'+@Name+'%' OR StartPlace LIKE '%'+@Name+'%' OR EndPlace LIKE '%'+@Name+'%' 
 OR '普通货物出场报批' LIKE '%'+@Name+'%'

 UNION  --气瓶入场报批
SELECT 
	GasCylinderInId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	,GasCylinderInCode AS DataCode
	,DriverMan AS Contents
	,('~/InApproveManager/GasCylinderInView.aspx?GasCylinderInId={0}') AS Url
FROM InApproveManager_GasCylinderIn AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='33327576-D346-45C9-9C97-805EB0C92EF2'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN Base_Project AS Project ON a.ProjectId =Project.ProjectId
WHERE  DriverMan LIKE '%'+@Name+'%' OR DriverNum LIKE '%'+@Name+'%' OR CarNum LIKE '%'+@Name+'%'
 OR LeadCarMan LIKE '%'+@Name+'%' 
 OR '气瓶入场报批' LIKE '%'+@Name+'%'

 UNION  --气瓶出场报批
SELECT 
	GasCylinderOutId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	,GasCylinderOutCode AS DataCode
	,DriverName AS Contents
	,('~/InApproveManager/GasCylinderOutView.aspx?GasCylinderOutId={0}') AS Url
FROM InApproveManager_GasCylinderOut AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='CB107947-AE48-466B-87F5-58BCA72FE1AC'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN Base_Project AS Project ON a.ProjectId =Project.ProjectId
WHERE  DriverName LIKE '%'+@Name+'%' OR DriverNum LIKE '%'+@Name+'%' OR CarNum LIKE '%'+@Name+'%'
 OR LeaderName LIKE '%'+@Name+'%' 
 OR '气瓶出场报批' LIKE '%'+@Name+'%'

 UNION  --特种车辆入场审批
SELECT 
	CarInId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	,CarNum AS DataCode
	,DriverName AS Contents
	,('~/InApproveManager/CarInView.aspx?CarInId={0}') AS Url
FROM InApproveManager_CarIn AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='3D12E3FD-5AC3-485A-A39F-08689234450A'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN Base_Project AS Project ON a.ProjectId =Project.ProjectId
WHERE  DriverName LIKE '%'+@Name+'%' OR CarNum LIKE '%'+@Name+'%' OR CarType LIKE '%'+@Name+'%'
 OR '特种车辆入场审批' LIKE '%'+@Name+'%'

 UNION  --普通车辆入场审批
SELECT 
	GeneralCarInId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	,CarNum AS DataCode
	,DriverName AS Contents
	,('~/InApproveManager/GeneralCarInView.aspx?GeneralCarInId={0}') AS Url
FROM InApproveManager_GeneralCarIn AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='7087F8BB-DC8C-4A77-8E16-232E0B8481D2'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN Base_Project AS Project ON a.ProjectId =Project.ProjectId
WHERE  DriverName LIKE '%'+@Name+'%' OR CarNum LIKE '%'+@Name+'%' OR CarType LIKE '%'+@Name+'%'
OR Descriptions LIKE '%'+@Name+'%'
 OR '普通车辆入场审批' LIKE '%'+@Name+'%'

 UNION  --特种设备审批
SELECT 
	EquipmentQualityInId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	,CarNum AS DataCode
	,DriverName AS Contents
	,('~/InApproveManager/EquipmentQualityInView.aspx?EquipmentQualityInId={0}') AS Url
FROM InApproveManager_EquipmentQualityIn AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='42E7E869-67EA-446E-A910-BE7BF95EDC00'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN Base_Project AS Project ON a.ProjectId =Project.ProjectId
WHERE  DriverName LIKE '%'+@Name+'%' OR CarNum LIKE '%'+@Name+'%' OR CarType LIKE '%'+@Name+'%'
OR DutyMan LIKE '%'+@Name+'%'
 OR '特种设备审批' LIKE '%'+@Name+'%'

 UNION  --安全费用计划
SELECT 
	ExpenseId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	,ExpenseCode AS DataCode
	,CONVERT(varchar(7),Months,120) AS Contents
	,('~/CostGoods/ExpenseView.aspx?ExpenseId={0}') AS Url
FROM CostGoods_Expense AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='EEE7CBBE-2EFB-4D64-96A6-A932E20FF9DB'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN Base_Project AS Project ON a.ProjectId =Project.ProjectId
WHERE  ExpenseCode LIKE '%'+@Name+'%' OR CONVERT(varchar(7),Months,120) LIKE '%'+@Name+'%' 
 OR '安全费用计划' LIKE '%'+@Name+'%'

 UNION  --安全费用支出
SELECT 
	CostSmallDetailId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	,CostSmallDetailCode AS DataCode
	,CONVERT(varchar(7),Months,120) AS Contents
	,('~/CostGoods/CostSmallDetailView.aspx?CostSmallDetailId={0}') AS Url
FROM CostGoods_CostSmallDetail AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='0C311396-C859-40B0-9D72-6A8B20733002'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN Base_Project AS Project ON a.ProjectId =Project.ProjectId
WHERE  CostSmallDetailCode LIKE '%'+@Name+'%' OR CONVERT(varchar(7),Months,120) LIKE '%'+@Name+'%' 
 OR '安全费用支出' LIKE '%'+@Name+'%'

 UNION  --HSE措施费使用计划
SELECT 
	MeasuresPlanId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	,MeasuresPlanCode AS DataCode
	,FileContents AS Contents
	,('~/CostGoods/MeasuresPlanEdit.aspx?MeasuresPlanId={0}') AS Url
FROM CostGoods_MeasuresPlan AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='6FBF4B7D-21D2-4013-9465-12AC093109D4'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN Base_Project AS Project ON a.ProjectId =Project.ProjectId
WHERE  MeasuresPlanCode LIKE '%'+@Name+'%' OR FileContents LIKE '%'+@Name+'%' 
 OR 'HSE措施费使用计划' LIKE '%'+@Name+'%' OR '安全措施费使用计划' LIKE '%'+@Name+'%'

 UNION  --HSE费用投入登记
SELECT 
	PayRegistrationId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	,CONVERT(varchar(100), PayDate, 23) AS DataCode
	,CONVERT(varchar(100), PayDate, 23) AS Contents
	,('~/CostGoods/PayRegistrationEdit.aspx?PayRegistrationId={0}') AS Url
FROM CostGoods_PayRegistration AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='9EFF1A0F-87AA-43E7-83B0-79EEAAC8848E'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN Base_Project AS Project ON a.ProjectId =Project.ProjectId
WHERE  CONVERT(varchar(100), PayDate, 23) LIKE '%'+@Name+'%'
 OR 'HSE费用投入登记' LIKE '%'+@Name+'%' OR '安全费用投入登记' LIKE '%'+@Name+'%'

 UNION  --分包HSSE费用管理
SELECT 
	CostManageId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	,CostManageCode AS DataCode
	,CostManageName AS Contents
	,('~/CostGoods/CostManageView.aspx?CostManageId={0}') AS Url
FROM CostGoods_CostManage AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='FF68C697-B058-4687-A98F-71C591650E02'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN Base_Project AS Project ON a.ProjectId =Project.ProjectId
WHERE  CostManageCode LIKE '%'+@Name+'%' OR CostManageName LIKE '%'+@Name+'%'
 OR '分包HSSE费用管理' LIKE '%'+@Name+'%' OR '分包安全费用管理' LIKE '%'+@Name+'%'

 UNION  --HSSE物资管理
SELECT 
	GoodsManageId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	,GoodsCode AS DataCode
	,GoodsName AS Contents
	,('~/CostGoods/GoodsManageView.aspx?GoodsManageId={0}') AS Url
FROM CostGoods_GoodsManage AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='3DC61C8A-7C54-49E0-96C4-DED9CC6BFD0B'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN Base_Project AS Project ON a.ProjectId =Project.ProjectId
WHERE  GoodsCode LIKE '%'+@Name+'%' OR GoodsName LIKE '%'+@Name+'%'
 OR 'HSSE物资管理' LIKE '%'+@Name+'%' OR '安全物资管理' LIKE '%'+@Name+'%'

 UNION  --物资入库管理
SELECT 
	GoodsInId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	,GoodsInCode AS DataCode
	,GoodsDef.GoodsDefName AS Contents
	,('~/CostGoods/GoodsInView.aspx?GoodsInId={0}') AS Url
FROM CostGoods_GoodsIn AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='3DC61C8A-7C54-49E0-96C4-DED9CC6BFD0B'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN Base_Project AS Project ON a.ProjectId =Project.ProjectId
LEFT JOIN Base_GoodsDef AS GoodsDef ON a.GoodsDefId =GoodsDef.GoodsDefId
WHERE  GoodsInCode LIKE '%'+@Name+'%' OR GoodsDef.GoodsDefName LIKE '%'+@Name+'%'
 OR '物资入库管理' LIKE '%'+@Name+'%'

 UNION  --物资出库管理
SELECT 
	GoodsOutId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	,GoodsOutCode AS DataCode
	,GoodsDef.GoodsDefName AS Contents
	,('~/CostGoods/GoodsOutView.aspx?GoodsOutId={0}') AS Url
FROM CostGoods_GoodsOut AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='881D6FE5-C281-4DA8-80CD-D7C6624796FC'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN Base_Project AS Project ON a.ProjectId =Project.ProjectId
LEFT JOIN Base_GoodsDef AS GoodsDef ON a.GoodsDefId =GoodsDef.GoodsDefId
WHERE  GoodsOutCode LIKE '%'+@Name+'%' OR GoodsDef.GoodsDefName LIKE '%'+@Name+'%'
 OR '物资出库管理' LIKE '%'+@Name+'%'

 UNION  --行政管理检查记录
SELECT 
	ManageCheckId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	,ManageCheckCode AS DataCode
	,CheckTypeSet.CheckTypeContent AS Contents
	,('~/Administrative/ManageCheckView.aspx?ManageCheckId={0}') AS Url
FROM Administrative_ManageCheck AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='A25EB19A-F06E-4AAF-A589-E2B8F7FA7857'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN Base_Project AS Project ON a.ProjectId =Project.ProjectId
LEFT JOIN Administrative_CheckTypeSet AS CheckTypeSet ON a.CheckTypeCode =CheckTypeSet.CheckTypeCode
WHERE  ManageCheckCode LIKE '%'+@Name+'%' OR CheckTypeSet.CheckTypeContent LIKE '%'+@Name+'%'
 OR '行政管理检查记录' LIKE '%'+@Name+'%'

 UNION  --现场车辆管理
SELECT 
	CarManagerId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	,CarManagerCode AS DataCode
	,CarName AS Contents
	,('~/Administrative/CarManagerView.aspx?CarManagerId={0}') AS Url
FROM Administrative_CarManager AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='CF82805A-84BE-400A-B939-83F7612D76F5'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN Base_Project AS Project ON a.ProjectId =Project.ProjectId
WHERE  CarManagerCode LIKE '%'+@Name+'%' OR CarName LIKE '%'+@Name+'%' OR CarModel LIKE '%'+@Name+'%'
 OR '现场车辆管理' LIKE '%'+@Name+'%'

 UNION  --现场驾驶员管理
SELECT 
	DriverManagerId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	,DriverManagerCode AS DataCode
	,DriverName AS Contents
	,('~/Administrative/DriverManagerView.aspx?DriverManagerId={0}') AS Url
FROM Administrative_DriverManager AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='754C23CA-F1BC-4F44-9D34-B185099EDCA0'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN Base_Project AS Project ON a.ProjectId =Project.ProjectId
WHERE  DriverManagerCode LIKE '%'+@Name+'%' OR DriverName LIKE '%'+@Name+'%' OR DriverCarModel LIKE '%'+@Name+'%'
 OR '现场驾驶员管理' LIKE '%'+@Name+'%'

 UNION  --危害检测
SELECT 
	FileId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	,FileCode AS DataCode
	,FileName AS Contents
	,('~/OccupationHealth/HazardDetectionView.aspx?HazardDetectionId={0}') AS Url
FROM OccupationHealth_HazardDetection AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='DD5E76FC-C45E-4F4F-8889-A2F4703F93DD'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN Base_Project AS Project ON a.ProjectId =Project.ProjectId
WHERE  FileCode LIKE '%'+@Name+'%' OR FileName LIKE '%'+@Name+'%' OR FileContent LIKE '%'+@Name+'%'
 OR '危害检测' LIKE '%'+@Name+'%'

 UNION  --体检管理
SELECT 
	FileId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	,FileCode AS DataCode
	,FileName AS Contents
	,('~/OccupationHealth/PhysicalExaminationView.aspx?PhysicalExaminationId={0}') AS Url
FROM OccupationHealth_PhysicalExamination AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='9EACCED2-B646-489C-84AD-1C22066F00AE'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN Base_Project AS Project ON a.ProjectId =Project.ProjectId
WHERE  FileCode LIKE '%'+@Name+'%' OR FileName LIKE '%'+@Name+'%' OR FileContent LIKE '%'+@Name+'%'
 OR '体检管理' LIKE '%'+@Name+'%'

 UNION  --职业病事故
SELECT 
	FileId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	,FileCode AS DataCode
	,FileName AS Contents
	,('~/OccupationHealth/OccupationalDiseaseAccidentView.aspx?OccupationalDiseaseAccidentId={0}') AS Url
FROM OccupationHealth_OccupationalDiseaseAccident AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='775B77C0-E28D-4746-BCFE-F3E927D515A8'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN Base_Project AS Project ON a.ProjectId =Project.ProjectId
WHERE  FileCode LIKE '%'+@Name+'%' OR FileName LIKE '%'+@Name+'%' OR FileContent LIKE '%'+@Name+'%'
 OR '职业病事故' LIKE '%'+@Name+'%'

 UNION  --环境监测数据
SELECT 
	FileId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	,FileCode AS DataCode
	,FileName AS Contents
	,('~/Environmental/EnvironmentalMonitoringView.aspx?EnvironmentalMonitoringId={0}') AS Url
FROM Environmental_EnvironmentalMonitoring AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='342B5DEA-ECE1-46A4-BAA6-F0DB5276C769'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN Base_Project AS Project ON a.ProjectId =Project.ProjectId
WHERE  FileCode LIKE '%'+@Name+'%' OR FileName LIKE '%'+@Name+'%' OR FileContent LIKE '%'+@Name+'%'
 OR '环境监测数据' LIKE '%'+@Name+'%'

 UNION  --突发环境事件
SELECT 
	FileId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	,FileCode AS DataCode
	,FileName AS Contents
	,('~/Environmental/UnexpectedEnvironmentalView.aspx?UnexpectedEnvironmentalId={0}') AS Url
FROM Environmental_UnexpectedEnvironmental AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='74F23370-56D8-426E-822D-5E367F620546'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN Base_Project AS Project ON a.ProjectId =Project.ProjectId
WHERE  FileCode LIKE '%'+@Name+'%' OR FileName LIKE '%'+@Name+'%' OR FileContent LIKE '%'+@Name+'%'
 OR '突发环境事件' LIKE '%'+@Name+'%'

 UNION  --环境事件应急预案
SELECT 
	FileId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	,FileCode AS DataCode
	,FileName AS Contents
	,('~/Environmental/EnvironmentalEmergencyPlanView.aspx?EnvironmentalEmergencyPlanId={0}') AS Url
FROM Environmental_EnvironmentalEmergencyPlan AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='3EF6E488-21D2-47BB-AA33-4FB0E9FED606'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN Base_Project AS Project ON a.ProjectId =Project.ProjectId
WHERE  FileCode LIKE '%'+@Name+'%' OR FileName LIKE '%'+@Name+'%' OR FileContent LIKE '%'+@Name+'%'
 OR '环境事件应急预案' LIKE '%'+@Name+'%'

 UNION  --环评报告
SELECT 
	FileId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	,FileCode AS DataCode
	,FileName AS Contents
	,('~/Environmental/EIAReportView.aspx?EIAReportId={0}') AS Url
FROM Environmental_EIAReport AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='97DCAFD1-DDA5-48B4-8E2D-E82702BA899B'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN Base_Project AS Project ON a.ProjectId =Project.ProjectId
WHERE  FileCode LIKE '%'+@Name+'%' OR FileName LIKE '%'+@Name+'%' OR FileContent LIKE '%'+@Name+'%'
 OR '环评报告' LIKE '%'+@Name+'%'

 UNION  --HSSE事故(对人员)记录
SELECT 
	AccidentPersonRecordId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	,CONVERT(varchar(100), AccidentDate, 23) AS DataCode
	,Person.PersonName AS Contents
	,('~/Accident/AccidentPersonRecordView.aspx?AccidentPersonRecordId={0}') AS Url
FROM Accident_AccidentPersonRecord AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='FB5C66FF-3BFB-490F-A14F-0DD5B5A4D110'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN Base_Project AS Project ON a.ProjectId =Project.ProjectId
LEFT JOIN SitePerson_Person AS Person ON a.PersonId =Person.PersonId
WHERE  Person.PersonName LIKE '%'+@Name+'%' OR CONVERT(varchar(100), AccidentDate, 23) LIKE '%'+@Name+'%' OR InjuryResult LIKE '%'+@Name+'%'
 OR 'HSSE事故(对人员)记录' LIKE '%'+@Name+'%' OR '安全事故(对人员)记录' LIKE '%'+@Name+'%'

 UNION  --HSSE事故(含未遂)处理
SELECT 
	AccidentHandleId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	,AccidentHandleCode AS DataCode
	,AccidentHandleName AS Contents
	,('~/Accident/AccidentHandleView.aspx?AccidentHandleId={0}') AS Url
FROM Accident_AccidentHandle AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='9A9D6805-6C98-46E4-943E-130C4A3EB9A2'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN Base_Project AS Project ON a.ProjectId =Project.ProjectId
WHERE  AccidentHandleCode LIKE '%'+@Name+'%' OR AccidentHandleName LIKE '%'+@Name+'%' OR AccidentDef LIKE '%'+@Name+'%'
 OR 'HSSE事故(含未遂)处理' LIKE '%'+@Name+'%' OR '安全事故(含未遂)处理' LIKE '%'+@Name+'%'

UNION  --事故报告登记
SELECT 
	AccidentReportId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	,AccidentReportCode AS DataCode
	,Abstract AS Contents
	,('~/Accident/AccidentReportView.aspx?AccidentReportId={0}') AS Url
FROM Accident_AccidentReport AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='27C681E5-135A-414F-9FC2-D86D27805E6A'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN Base_Project AS Project ON a.ProjectId =Project.ProjectId
WHERE  AccidentReportCode LIKE '%'+@Name+'%' OR Abstract LIKE '%'+@Name+'%' OR FileContent LIKE '%'+@Name+'%'
 OR '事故报告登记' LIKE '%'+@Name+'%'

 UNION  --事故调查处理报告
SELECT 
	AccidentReportOtherId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	,AccidentReportOtherCode AS DataCode
	,Abstract AS Contents
	,('~/Accident/AccidentReportOtherView.aspx?AccidentReportOtherId={0}') AS Url
FROM Accident_AccidentReportOther AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='B0A341A2-954A-4E24-BFC3-53D7F50628EE'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN Base_Project AS Project ON a.ProjectId =Project.ProjectId
WHERE  AccidentReportOtherCode LIKE '%'+@Name+'%' OR Abstract LIKE '%'+@Name+'%' OR FileContent LIKE '%'+@Name+'%'
 OR '事故调查处理报告' LIKE '%'+@Name+'%'

 UNION  --分包方绩效评价
SELECT 
	PerfomanceRecordId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	,PerfomanceRecordCode AS DataCode
	,Unit.UnitName AS Contents
	,('~/Perfomance/PerfomanceRecordView.aspx?PerfomanceRecordId={0}') AS Url
FROM Perfomance_PerfomanceRecord AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='B0A341A2-954A-4E24-BFC3-53D7F50628EE'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN Base_Project AS Project ON a.ProjectId =Project.ProjectId
LEFT JOIN Base_Unit AS Unit ON a.UnitId =Unit.UnitId
WHERE  PerfomanceRecordCode LIKE '%'+@Name+'%' OR Unit.UnitName LIKE '%'+@Name+'%' OR EvaluationDef LIKE '%'+@Name+'%'
 OR '分包方绩效评价' LIKE '%'+@Name+'%'

 UNION  --个人绩效评价
SELECT 
	PersonPerfomanceId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	,PersonPerfomanceCode AS DataCode
	,Person.PersonName AS Contents
	,('~/Perfomance/PersonPerfomanceView.aspx?PersonPerfomanceId={0}') AS Url
FROM Perfomance_PersonPerfomance AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='1320A6D8-713B-43D4-BB00-CDA3DE6D24CB'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN Base_Project AS Project ON a.ProjectId =Project.ProjectId
LEFT JOIN SitePerson_Person AS Person ON a.PersonId =Person.PersonId
WHERE  PersonPerfomanceCode LIKE '%'+@Name+'%' OR Person.PersonName LIKE '%'+@Name+'%' OR EvaluationDef LIKE '%'+@Name+'%'
 OR '个人绩效评价' LIKE '%'+@Name+'%'

 UNION  --HSSE宣传活动
SELECT 
	PromotionalActivitiesId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	,Code AS DataCode
	,Title AS Contents
	,('~/InformationProject/PromotionalActivitiesView.aspx?PromotionalActivitiesId={0}') AS Url
FROM InformationProject_PromotionalActivities AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='16092FE7-938B-4713-8084-4FBFA030F386'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN Base_Project AS Project ON a.ProjectId =Project.ProjectId
WHERE Code LIKE '%'+@Name+'%' OR Title LIKE '%'+@Name+'%' OR MainContent LIKE '%'+@Name+'%'
 OR 'HSSE宣传活动' LIKE '%'+@Name+'%' OR '安全宣传活动' LIKE '%'+@Name+'%'

 UNION  --项目图片
SELECT 
	PictureId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	,CONVERT(varchar(100), UploadDate, 23) AS DataCode
	,Title AS Contents
	,('~/InformationProject/PictureView.aspx?PictureId={0}') AS Url
FROM InformationProject_Picture AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='B58179BE-FE6E-4E91-84FC-D211E4692354'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN Base_Project AS Project ON a.ProjectId =Project.ProjectId
WHERE  Title LIKE '%'+@Name+'%' OR ContentDef LIKE '%'+@Name+'%'
 OR '项目图片' LIKE '%'+@Name+'%'

 UNION  --一般来文管理
SELECT 
	ReceiveFileManagerId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	,ReceiveFileCode AS DataCode
	,ReceiveFileName AS Contents
	,('~/InformationProject/ReceiveFileManagerView.aspx?ReceiveFileManagerId={0}') AS Url
FROM InformationProject_ReceiveFileManager AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='4F5C00F3-DA7D-4B2D-B1EF-310DFFCA77DD'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN Base_Project AS Project ON a.ProjectId =Project.ProjectId
WHERE  ReceiveFileCode LIKE '%'+@Name+'%' OR ReceiveFileName LIKE '%'+@Name+'%' OR MainContent LIKE '%'+@Name+'%'
 OR '一般来文管理' LIKE '%'+@Name+'%'

 UNION  --业主管理文档
SELECT 
	FileId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	,FileCode AS DataCode
	,FileName AS Contents
	,('~/FinalFileManage/OwnerFinalFileView.aspx?FileId={0}') AS Url
FROM FinalFileManage_OwnerFinalFile AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='C5354813-7B1E-4155-8EE8-D349BF2F18F4'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN Base_Project AS Project ON a.ProjectId =Project.ProjectId
WHERE  FileCode LIKE '%'+@Name+'%' OR FileName LIKE '%'+@Name+'%' OR KeyWords LIKE '%'+@Name+'%'
 OR '业主管理文档' LIKE '%'+@Name+'%'

 UNION  --监理管理文档
SELECT 
	FileId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	,FileCode AS DataCode
	,FileName AS Contents
	,('~/FinalFileManage/FinalFileListView.aspx?FileId={0}') AS Url
FROM FinalFileManage_FinalFileList AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='719DA0D3-FA59-4A03-B6E0-6663A211956F'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN Base_Project AS Project ON a.ProjectId =Project.ProjectId
WHERE  FileCode LIKE '%'+@Name+'%' OR FileName LIKE '%'+@Name+'%' OR KeyWords LIKE '%'+@Name+'%'
 OR '监理管理文档' LIKE '%'+@Name+'%'

 UNION  --其他管理文档
SELECT 
	FileId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	,FileCode AS DataCode
	,FileName AS Contents
	,('~/FinalFileManage/OtherDocumentListView.aspx?FileId={0}') AS Url
FROM FinalFileManage_OtherDocumentList AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='B1C694BB-EF35-49B6-AEE4-0C5CA6803208'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN Base_Project AS Project ON a.ProjectId =Project.ProjectId
WHERE  FileCode LIKE '%'+@Name+'%' OR FileName LIKE '%'+@Name+'%' OR KeyWords LIKE '%'+@Name+'%'
 OR '其他管理文档' LIKE '%'+@Name+'%'

 UNION  --已定稿文件
SELECT 
	FileId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	,FileCode AS DataCode
	,FileName AS Contents
	,('~/FinalFileManage/HSEFinalFileListView.aspx?FileId={0}') AS Url
FROM FinalFileManage_HSEFinalFileList AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='24D6B764-7B91-46EB-9D80-A6073FC5720D'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN Base_Project AS Project ON a.ProjectId =Project.ProjectId
WHERE  FileCode LIKE '%'+@Name+'%' OR FileName LIKE '%'+@Name+'%' OR KeyWords LIKE '%'+@Name+'%'
 OR '已定稿文件' LIKE '%'+@Name+'%'

  UNION  --管理周报
SELECT 
	ManagerWeekId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	,ManagerWeekCode AS DataCode
	,ManagerWeekName AS Contents
	,('~/Manager/ManagerWeekView.aspx?ManagerWeekId={0}') AS Url
FROM Manager_ManagerWeek AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='AE118E9C-C309-43B7-A198-8CA90A8D98EB'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN Base_Project AS Project ON a.ProjectId =Project.ProjectId
WHERE  ManagerWeekCode LIKE '%'+@Name+'%' OR ManagerWeekName LIKE '%'+@Name+'%' OR FileContent LIKE '%'+@Name+'%'
 OR '管理周报' LIKE '%'+@Name+'%'

  UNION  --管理月报
SELECT 
	MonthReportId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	,MonthReportCode AS DataCode
	,CONVERT(varchar(7),Months,120) AS Contents
	,('~/Manager/MonthReportView.aspx?monthReportId={0}') AS Url
FROM Manager_MonthReport AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='5D006DDC-3AED-4E5A-8597-3C972D96F983'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN Base_Project AS Project ON a.ProjectId =Project.ProjectId
WHERE  MonthReportCode LIKE '%'+@Name+'%' OR CONVERT(varchar(7),Months,120) LIKE '%'+@Name+'%' 
 OR '管理月报' LIKE '%'+@Name+'%'

  UNION  --安全管理月报
SELECT 
	MonthReportId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	,MonthReportCode AS DataCode
	,CONVERT(varchar(7),Months,120) AS Contents
	,('~/Manager/MonthReportBView.aspx?monthReportId={0}') AS Url
FROM Manager_MonthReportB AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='363EB208-7BB1-4A55-85F3-2501B2F10B45'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN Base_Project AS Project ON a.ProjectId =Project.ProjectId
WHERE  MonthReportCode LIKE '%'+@Name+'%' OR CONVERT(varchar(7),Months,120) LIKE '%'+@Name+'%' 
 OR '安全管理月报' LIKE '%'+@Name+'%'

  UNION  --HSE管理月报
SELECT 
	MonthReportId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	,MonthReportCode AS DataCode
	,CONVERT(varchar(7),Months,120) AS Contents
	,('~/Manager/MonthReportCView.aspx?monthReportId={0}') AS Url
FROM Manager_MonthReportC AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='68A52EEA-2661-4CB0-9382-A36AA5DCC480'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN Base_Project AS Project ON a.ProjectId =Project.ProjectId
WHERE  MonthReportCode LIKE '%'+@Name+'%' OR CONVERT(varchar(7),Months,120) LIKE '%'+@Name+'%' 
 OR 'HSE管理月报' LIKE '%'+@Name+'%' OR '安全管理月报' LIKE '%'+@Name+'%'

 UNION  --安全生产月报
SELECT 
	MonthReportId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	,MonthReportCode AS DataCode
	,CONVERT(varchar(7),Months,120) AS Contents
	,('~/Manager/MonthReportDView.aspx?monthReportId={0}') AS Url
FROM Manager_MonthReportD AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='E18AF205-9C5B-40F8-B77B-B30C31B10BB5'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN Base_Project AS Project ON a.ProjectId =Project.ProjectId
WHERE  MonthReportCode LIKE '%'+@Name+'%' OR CONVERT(varchar(7),Months,120) LIKE '%'+@Name+'%' 
 OR '安全生产月报' LIKE '%'+@Name+'%'

  UNION  --管理季报
SELECT 
	ManagerQuarterlyId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	,ManagerQuarterlyCode AS DataCode
	,ManagerQuarterlyName AS Contents
	,('~/Manager/ManagerQuarterlyView.aspx?ManagerQuarterlyId={0}') AS Url
FROM Manager_ManagerQuarterly AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='28668BD9-3E14-438F-8BEE-24BAF6031B63'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN Base_Project AS Project ON a.ProjectId =Project.ProjectId
WHERE  ManagerQuarterlyCode LIKE '%'+@Name+'%' OR ManagerQuarterlyName LIKE '%'+@Name+'%' OR FileContent LIKE '%'+@Name+'%' 
 OR '管理季报' LIKE '%'+@Name+'%'

  UNION  --HSSE完工报告
SELECT 
	CompletionReportId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	,CompletionReportCode AS DataCode
	,CompletionReportName AS Contents
	,('~/Manager/CompletionReportView.aspx?CompletionReportId={0}') AS Url
FROM Manager_CompletionReport AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='88AE0EF8-D29E-409F-A154-CCA3999B00AE'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN Base_Project AS Project ON a.ProjectId =Project.ProjectId
WHERE  CompletionReportCode LIKE '%'+@Name+'%' OR CompletionReportName LIKE '%'+@Name+'%' OR FileContent LIKE '%'+@Name+'%' 
 OR 'HSSE完工报告' LIKE '%'+@Name+'%' OR '安全完工报告' LIKE '%'+@Name+'%'

 UNION  --管理工作总结
SELECT 
	ManagerTotalId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	,ManagerTotalCode AS DataCode
	,ManagerTotalName AS Contents
	,('~/Manager/ManagerTotalView.aspx?ManagerTotalId={0}') AS Url
FROM Manager_ManagerTotal AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='3ADE41A3-4B0E-4D36-ABFF-ABB94519A943'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN Base_Project AS Project ON a.ProjectId =Project.ProjectId
WHERE  ManagerTotalCode LIKE '%'+@Name+'%' OR ManagerTotalName LIKE '%'+@Name+'%' OR FileContent LIKE '%'+@Name+'%' 
 OR '管理工作总结' LIKE '%'+@Name+'%'

 UNION  --现场HSSE工作顾客评价
SELECT 
	ManagerPerformanceId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	,ManagerPerformanceCode AS DataCode
	,ManagerPerformanceName AS Contents
	,('~/Manager/ManagerPerformanceView.aspx?ManagerPerformanceId={0}') AS Url
FROM Manager_ManagerPerformance AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='A9190CE2-EA31-421F-B733-8824B8A64EE2'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN Base_Project AS Project ON a.ProjectId =Project.ProjectId
WHERE  ManagerPerformanceCode LIKE '%'+@Name+'%' OR ManagerPerformanceName LIKE '%'+@Name+'%' OR FileContent LIKE '%'+@Name+'%' 
 OR '现场HSSE工作顾客评价' LIKE '%'+@Name+'%'

 UNION  --工程现场环境与职业健康月报
SELECT 
	HealthId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	,HealthCode AS DataCode
	,HealthName AS Contents
	,('~/Manager/HealthView.aspx?HealthId={0}') AS Url
FROM Manager_Health AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='BD19F5D9-24EA-483D-B734-25B65A5ECDB1'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN Base_Project AS Project ON a.ProjectId =Project.ProjectId
WHERE  HealthCode LIKE '%'+@Name+'%' OR HealthName LIKE '%'+@Name+'%' OR FileContent LIKE '%'+@Name+'%' 
 OR '工程现场环境与职业健康月报' LIKE '%'+@Name+'%'

  UNION  --分包商HSSE周报
SELECT 
	SubManagerWeekId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	,SubManagerWeekCode AS DataCode
	,SubManagerWeekName AS Contents
	,('~/Manager/SubManagerWeekView.aspx?SubManagerWeekId={0}') AS Url
FROM Manager_SubManagerWeek AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='04A15594-9DCA-46A3-9224-4DEAA0BC556E'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN Base_Project AS Project ON a.ProjectId =Project.ProjectId
WHERE  SubManagerWeekCode LIKE '%'+@Name+'%' OR SubManagerWeekName LIKE '%'+@Name+'%' OR FileContent LIKE '%'+@Name+'%' 
 OR '分包商HSSE周报' LIKE '%'+@Name+'%' OR '分包商安全周报' LIKE '%'+@Name+'%'

 UNION  --分包商HSSE月报
SELECT 
	SubManagerMonthId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,Project.ProjectName
	,SubManagerMonthCode AS DataCode
	,SubManagerMonthName AS Contents
	,('~/Manager/SubManagerMonthView.aspx?SubManagerMonthId={0}') AS Url
FROM Manager_SubManagerMonth AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='71519DDC-9FF1-4C05-9B31-F249B3ED0106'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='3' 
LEFT JOIN Base_Project AS Project ON a.ProjectId =Project.ProjectId
WHERE  SubManagerMonthCode LIKE '%'+@Name+'%' OR SubManagerMonthName LIKE '%'+@Name+'%' OR FileContent LIKE '%'+@Name+'%' 
 OR '分包商HSSE月报' LIKE '%'+@Name+'%' OR '分包商安全月报' LIKE '%'+@Name+'%'


 /***********公共资源关联******************/
UNION --法律法规
SELECT 
	LawRegulationId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,'公共资源' AS ProjectName
	,LawRegulationCode AS DataCode
	,LawRegulationName AS Contents
	,('~/Law/LawRegulationListEdit.aspx?LawRegulationId={0}') AS Url
FROM Law_LawRegulationList
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='F4B02718-0616-4623-ABCE-885698DDBEB1'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='4' 
WHERE  LawRegulationName LIKE '%'+@Name+'%'
OR '法律法规' LIKE '%'+@Name+'%'

UNION  --安全标准规范
SELECT 
	StandardId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,'公共资源' AS ProjectName
	,StandardNo AS DataCode
	,StandardName AS Contents
	,('~/Law/HSSEStandardListSave.aspx?StandardId={0}') AS Url
FROM Law_HSSEStandardsList 
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='EFDSFVDE-RTHN-7UMG-4THA-5TGED48F8IOL'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='4' 
WHERE  StandardName LIKE '%'+@Name+'%' 
OR '安全标准规范' LIKE '%'+@Name+'%'

 UNION  --政府部门安全规章制度
SELECT 
	RulesRegulationsId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,'公共资源' AS ProjectName
	,RulesRegulationsCode AS DataCode
	,RulesRegulationsName AS Contents
	,('~/Law/RulesRegulationsEdit.aspx?RulesRegulationsId={0}') AS Url
FROM Law_RulesRegulations AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='DF1413F3-4CE5-40B3-A574-E01CE64FEA25'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='4'
WHERE  RulesRegulationsCode LIKE '%'+@Name+'%' OR RulesRegulationsName LIKE '%'+@Name+'%' 
OR ApplicableScope LIKE '%'+@Name+'%' OR Remark LIKE '%'+@Name+'%'
 OR '政府部门安全规章制度' LIKE '%'+@Name+'%'

  UNION  --安全管理规定
SELECT 
	ManageRuleId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,'公共资源' AS ProjectName
	,ManageRuleCode AS DataCode
	,ManageRuleName AS Contents
	,('~/Law/ManageRuleEdit.aspx?ManageRuleId={0}') AS Url
FROM Law_ManageRule AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='56960940-81A8-43D1-9565-C306EC7AFD12'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='4'
LEFT JOIN Base_ManageRuleType AS ManageRuleType ON ManageRuleType.ManageRuleTypeId=a.ManageRuleTypeId
WHERE  ManageRuleCode LIKE '%'+@Name+'%' OR ManageRuleName LIKE '%'+@Name+'%' 
OR ManageRuleType.ManageRuleTypeName LIKE '%'+@Name+'%' OR a.Remark LIKE '%'+@Name+'%'
OR '安全管理规定' LIKE '%'+@Name+'%'

 UNION  --安全主体责任
SELECT 
	HSSEMainDutyId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,'公共资源' AS ProjectName
	,a.SortIndex AS DataCode
	,Duties AS Contents
	,('~/HSSESystem/HSSEMainDutyEdit.aspx?HSSEMainDutyId={0}') AS Url
FROM HSSESystem_HSSEMainDuty AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='3ACE25CE-C5CE-4CEC-AD27-0D5CF1DF2F01'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='4'
WHERE   Duties LIKE '%'+@Name+'%'  OR Remark LIKE '%'+@Name+'%'
 OR '安全主体责任' LIKE '%'+@Name+'%'

  UNION  --培训教材库
SELECT 
	TrainingItemId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,'公共资源' AS ProjectName
	,TrainingItemCode AS DataCode
	,TrainingItemName AS Contents
	,('~/EduTrain/TrainingItemSave.aspx?TrainingItemId={0}') AS Url
FROM Training_TrainingItem AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='9D99A981-7380-4085-84FA-8C3B1AFA6202'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='4'
LEFT JOIN Training_Training AS Training ON Training.TrainingId=a.TrainingId
WHERE   TrainingItemName LIKE '%'+@Name+'%' OR Training.TrainingName LIKE '%'+@Name+'%'
 OR '培训教材库' LIKE '%'+@Name+'%'

  UNION  --安全试题库
SELECT 
	TrainTestItemId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,'公共资源' AS ProjectName
	,TrainTestItemCode AS DataCode
	,TraiinTestItemName AS Contents
	,('~/EduTrain/TrainTestItemEdit.aspx?TrainTestItemId={0}') AS Url
FROM Training_TrainTestDBItem AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='F58EE8ED-9EB5-47C7-9D7F-D751EFEA44CA'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='4'
LEFT JOIN Training_TrainTestDB AS TrainTestDB ON TrainTestDB.TrainTestId=a.TrainTestId
WHERE   TraiinTestItemName LIKE '%'+@Name+'%' OR TrainTestDB.TrainTestName LIKE '%'+@Name+'%'
 OR '安全试题库' LIKE '%'+@Name+'%'

  UNION  --事故案例库
SELECT 
	AccidentCaseItemId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,'公共资源' AS ProjectName
	,CONVERT(varchar(100), CompileDate, 23) AS DataCode
	,AccidentName AS Contents
	,('~/EduTrain/AccidentCaseItemSave.aspx?AccidentCaseId={0}') AS Url
FROM EduTrain_AccidentCaseItem AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='D86917DB-D00A-4E18-9793-C290B5BBA84C'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='4'
LEFT JOIN EduTrain_AccidentCase AS AccidentCase ON AccidentCase.AccidentCaseId=a.AccidentCaseId
WHERE   AccidentName LIKE '%'+@Name+'%' OR AccidentCase.AccidentCaseName LIKE '%'+@Name+'%'
OR CONVERT(varchar(100), CompileDate, 23) LIKE '%'+@Name+'%' OR Activities LIKE '%'+@Name+'%'
OR AccidentProfiles LIKE '%'+@Name+'%'OR AccidentReview LIKE '%'+@Name+'%'
OR '事故案例库' LIKE '%'+@Name+'%'

  UNION  --应知应会库
SELECT 
	KnowledgeItemId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,'公共资源' AS ProjectName
	,KnowledgeItemCode AS DataCode
	,KnowledgeItemName AS Contents
	,('~/EduTrain/KnowledgeDBItemEdit.aspx?KnowledgeId={0}') AS Url
FROM Training_KnowledgeItem AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='AB7A3D78-2D89-4488-97E3-8F8616BDDE30'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='4'
LEFT JOIN Training_Knowledge AS Knowledge ON Knowledge.KnowledgeId=a.KnowledgeId
WHERE   KnowledgeItemName LIKE '%'+@Name+'%' OR Knowledge.KnowledgeName LIKE '%'+@Name+'%'
 OR '应知应会库' LIKE '%'+@Name+'%'

  UNION  --危险源清单
SELECT 
	HazardId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,'公共资源' AS ProjectName
	,HazardCode AS DataCode
	,HazardItems AS Contents
	,('~/Technique/HazardListEdit.aspx?HazardId={0}') AS Url
FROM Technique_HazardList AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='66A76F90-96A7-4C1F-B8D9-125DDEACEF52'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='4'
LEFT JOIN Technique_HazardListType AS HazardListType ON HazardListType.HazardListTypeId=a.HazardListTypeId
WHERE  (IsCompany=0 OR  IsCompany IS NULL ) AND (HazardItems LIKE '%'+@Name+'%' OR HazardListType.HazardListTypeName LIKE '%'+@Name+'%'
 OR '危险源清单' LIKE '%'+@Name+'%')

  UNION  --公司危险源清单
SELECT 
	HazardId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,'公共资源' AS ProjectName
	,HazardCode AS DataCode
	,HazardItems AS Contents
	,('~/Technique/HazardListEdit.aspx?HazardId={0}') AS Url
FROM Technique_HazardList AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='C0018E8C-C88B-4E25-BCFC-F0BF3CACC63A'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='4'
LEFT JOIN Technique_HazardListType AS HazardListType ON HazardListType.HazardListTypeId=a.HazardListTypeId
WHERE  IsCompany=1 AND (HazardItems LIKE '%'+@Name+'%' OR HazardListType.HazardListTypeName LIKE '%'+@Name+'%'
 OR '公司危险源清单' LIKE '%'+@Name+'%')
 
  UNION  --环境因素危险源
SELECT 
	EnvironmentalId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,'公共资源' AS ProjectName
	,EType AS DataCode
	,EnvironmentalFactors AS Contents
	,('~/Technique/EnvironmentalEdit.aspx?EnvironmentalId={0}') AS Url
FROM Technique_Environmental AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='773B59F9-61F9-4F5E-9D68-A1BF9322AFFA'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='4'
WHERE ( IsCompany=0 OR IsCompany IS NULL) AND (ActivePoint LIKE '%'+@Name+'%' OR EnvironmentalFactors LIKE '%'+@Name+'%'
 OR '环境因素危险源' LIKE '%'+@Name+'%')

  UNION  --公司环境因素危险源
SELECT 
	EnvironmentalId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,'公共资源' AS ProjectName
	,EType AS DataCode
	,EnvironmentalFactors AS Contents
	,('~/Technique/EnvironmentalEdit.aspx?EnvironmentalId={0}') AS Url
FROM Technique_Environmental AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='DC2AA8C2-82A8-4F7A-832D-9889C65AA228'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='4'
WHERE IsCompany=1 AND (ActivePoint LIKE '%'+@Name+'%' OR EnvironmentalFactors LIKE '%'+@Name+'%'
 OR '公司环境因素危险源' LIKE '%'+@Name+'%')

  UNION  --安全隐患
SELECT 
	RectifyItemId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,'公共资源' AS ProjectName
	,CONVERT(varchar(100), CompileDate, 23) AS DataCode
	,HazardSourcePoint AS Contents
	,('~/Technique/RectifyItemEdit.aspx?RectifyItemId={0}') AS Url
FROM Technique_RectifyItem AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='88CDDC68-54DE-4E24-9524-A33B80EC0E12'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='4'
LEFT JOIN Technique_Rectify AS Rectify ON Rectify.RectifyId=a.RectifyId
WHERE HazardSourcePoint LIKE '%'+@Name+'%' OR Rectify.RectifyName LIKE '%'+@Name+'%'
 OR RiskAnalysis LIKE '%'+@Name+'%' OR RiskPrevention LIKE '%'+@Name+'%' OR RiskPrevention LIKE '%'+@Name+'%'
 OR '安全隐患' LIKE '%'+@Name+'%'

   UNION  --项目安全检查项
SELECT 
	CheckItemDetailId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,'公共资源' AS ProjectName
	,CONVERT(varchar(100), a.SortIndex) AS DataCode
	,CheckContent AS Contents
	,('~/Technique/CheckItemDetailEdit.aspx?checkItemDetailId={0}') AS Url
FROM Technique_CheckItemDetail AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='4D92095C-8222-49D2-AF96-CD1972D4F4F8'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='4'
LEFT JOIN Technique_CheckItemSet AS CheckItemSet ON CheckItemSet.CheckItemSetId=a.CheckItemSetId
WHERE CheckItemName LIKE '%'+@Name+'%' OR CheckContent LIKE '%'+@Name+'%'
 OR '项目安全检查项' LIKE '%'+@Name+'%'

   UNION  --HAZOP管理
SELECT 
	HAZOPId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,'公共资源' AS ProjectName
	,CONVERT(varchar(100), HAZOPDate, 23) AS DataCode
	,HAZOPTitle AS Contents
	,('~/Technique/HAZOPEdit.aspx?HAZOPId={0}') AS Url
FROM Technique_HAZOP AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='41C22E63-36B7-4C44-89EC-F765BFBB7C55'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='4'
WHERE HAZOPTitle LIKE '%'+@Name+'%' OR Abstract LIKE '%'+@Name+'%'
 OR 'HAZOP管理' LIKE '%'+@Name+'%'

   UNION  --安全评价
SELECT 
	AppraiseId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,'公共资源' AS ProjectName
	,AppraiseCode AS DataCode
	,AppraiseTitle AS Contents
	,('~/Technique/AppraiseEdit.aspx?AppraiseId={0}') AS Url
FROM Technique_Appraise AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='0ADD01FB-8088-4595-BB40-6A73F332A229'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='4'
WHERE AppraiseTitle LIKE '%'+@Name+'%' OR Abstract LIKE '%'+@Name+'%'
 OR '安全评价' LIKE '%'+@Name+'%'

   UNION  --安全专家
SELECT 
	ExpertId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,'公共资源' AS ProjectName
	,ExpertCode AS DataCode
	,ExpertName AS Contents
	,('~/Technique/ExpertSave.aspx?ExpertId={0}') AS Url
FROM Technique_Expert AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='05495F29-B583-43D9-89D3-3384D6783A3F'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='4'
LEFT JOIN Base_ExpertType AS ExpertType ON ExpertType.ExpertTypeId=a.ExpertTypeId
WHERE ExpertName LIKE '%'+@Name+'%' OR ExpertType.ExpertTypeName LIKE '%'+@Name+'%'
 OR '安全专家' LIKE '%'+@Name+'%'

   UNION  --应急预案
SELECT 
	EmergencyId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,'公共资源' AS ProjectName
	,EmergencyCode AS DataCode
	,EmergencyName AS Contents
	,('~/Technique/EmergencyEdit.aspx?EmergencyId={0}') AS Url
FROM Technique_Emergency AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='575C5154-A135-4737-8682-A129EA717660'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='4'
WHERE EmergencyName LIKE '%'+@Name+'%' OR Summary LIKE '%'+@Name+'%'
 OR '应急预案' LIKE '%'+@Name+'%'

   UNION  --施工方案
SELECT 
	SpecialSchemeId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,'公共资源' AS ProjectName
	,SpecialSchemeCode AS DataCode
	,SpecialSchemeName AS Contents
	,('~/Technique/SpecialSchemeEdit.aspx?SpecialSchemeId={0}') AS Url
FROM Technique_SpecialScheme AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='3E2F2FFD-ED2E-4914-8370-D97A68398814'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='4'
WHERE SpecialSchemeName LIKE '%'+@Name+'%' OR Summary LIKE '%'+@Name+'%'
 OR '施工方案' LIKE '%'+@Name+'%'

   UNION  --现场施工方案模板
SELECT 
	TempleteId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,'公共资源' AS ProjectName
	,TempleteCode AS DataCode
	,TempleteName AS Contents
	,('~/Technique/ProjectSolutionTempleteEdit.aspx?TempleteId={0}') AS Url
FROM Technique_ProjectSolutionTemplete AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='5FE00FAB-8191-4AA9-B8B2-BFDC91200B24'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='4'
WHERE TempleteName LIKE '%'+@Name+'%'
 OR '现场施工方案模板' LIKE '%'+@Name+'%'

   UNION  --标牌管理
SELECT 
	SignManageId AS NewID
	,Const.ConstText AS MenuTypeName
	,Menu.MenuName AS PageName 
	,'公共资源' AS ProjectName
	,SignCode AS DataCode
	,SignName AS Contents
	,('~/Resources/SignManageEdit.aspx?SignManageId={0}') AS Url
FROM Resources_SignManage AS a
LEFT JOIN Sys_Menu AS Menu ON Menu.MenuId='022CA9C1-70F0-4C07-996C-0736D32B442A'
LEFT JOIN Sys_Const AS Const ON Const.GroupId='MenuType' AND Const.ConstValue='4'
LEFT JOIN Sys_Const AS Const1 ON Const1.GroupId='SignType' AND Const1.ConstValue=a.SignType
WHERE SignName LIKE '%'+@Name+'%' OR Const1.ConstText LIKE '%'+@Name+'%'
 OR '标牌管理' LIKE '%'+@Name+'%'
 END
GO



DELETE FROM Sys_FlowOperate WHERE MenuId='C85CCDFC-E721-4B9D-B73F-F83C7578EE9B' 
AND DataId NOT IN (SELECT LawRegulationIdentifyId FROM Law_LawRegulationIdentify)
GO

DELETE FROM Sys_FlowOperate WHERE MenuId='28B0235F-3DB5-4C15-A7E3-6F5DF52C8FDC' 
AND DataId NOT IN (SELECT ConstructionStandardIdentifyId FROM InformationProject_ConstructionStandardIdentify)
GO

DELETE FROM Sys_FlowOperate WHERE MenuId='FD1F5E74-4843-4F6B-B893-8A16D26443D9' 
AND DataId NOT IN (SELECT MonthPlanId FROM SiteConstruction_MonthPlan)
GO

ALTER VIEW [dbo].[View_NewDynamic] 
AS
SELECT PersonQuality.PersonId AS Id
	,'特岗人员资质' AS Type, ( '[' + ISNULL(Person.CardNo,'') +']'+ Person.PersonName +'已过期，项目：'+ Project.ProjectName) AS Name
	,PersonQuality.LimitDate AS Date
	,'~/QualityAudit/PersonQualityEdit.aspx?PersonId={0}' AS Url
	,Project.ProjectId 
FROM QualityAudit_PersonQuality AS PersonQuality
	LEFT JOIN SitePerson_Person AS Person ON Person.PersonId = PersonQuality.PersonId
	LEFT JOIN Base_Project AS Project ON Person.ProjectId =Project.ProjectId
	LEFT JOIN Base_WorkPost AS WorkPost ON Person.WorkPostId =WorkPost.WorkPostId
WHERE PersonQuality.LimitDate<=GETDATE() and (Project.ProjectState is null or Project.ProjectState='1')
AND (GETDATE()< Person.OutTime OR Person.OutTime IS NULL) AND WorkPost.PostType= '2'

UNION
SELECT PersonQuality.PersonId AS Id
	,'特岗人员资质' AS Type, ( '[' + ISNULL(Person.CardNo,'') +']'+ Person.PersonName +'还有'+CAST(DATEDIFF(DAY,PersonQuality.LimitDate,GETDATE())AS NVARCHAR(5))+'天过期，项目：'+ Project.ProjectName) AS Name
	,PersonQuality.LimitDate AS Date
	,'~/QualityAudit/PersonQualityEdit.aspx?PersonId={0}' AS Url
	,Project.ProjectId 
FROM QualityAudit_PersonQuality AS PersonQuality
	LEFT JOIN SitePerson_Person AS Person ON Person.PersonId = PersonQuality.PersonId
	LEFT JOIN Base_Project AS Project ON Person.ProjectId =Project.ProjectId
	LEFT JOIN Base_WorkPost AS WorkPost ON Person.WorkPostId =WorkPost.WorkPostId
WHERE PersonQuality.LimitDate>GETDATE() and PersonQuality.LimitDate<= dateadd(month,1, GETDATE())  and (Project.ProjectState is null or Project.ProjectState='1')
AND (GETDATE()< Person.OutTime OR Person.OutTime IS NULL) AND WorkPost.PostType= '2'

UNION

SELECT EquipmentQuality.EquipmentQualityId
	,'特种设备资质', EquipmentQuality.EquipmentQualityName+'已过期，项目：'+ Project.ProjectName
	,EquipmentQuality.LimitDate
	,'~/QualityAudit/EquipmentQualityEdit.aspx?EquipmentQualityId={0}' AS Url 
	,Project.ProjectId
FROM QualityAudit_EquipmentQuality AS EquipmentQuality 
	LEFT JOIN Base_SpecialEquipment AS SpecialEquipment ON SpecialEquipment.SpecialEquipmentId = EquipmentQuality.SpecialEquipmentId
	LEFT JOIN Base_Project AS Project ON EquipmentQuality.ProjectId =Project.ProjectId
WHERE EquipmentQuality.LimitDate< GETDATE() and (Project.ProjectState is null or Project.ProjectState='1')
	AND (GETDATE()< EquipmentQuality.OutDate OR EquipmentQuality.OutDate IS NULL)

UNION
SELECT EquipmentQuality.EquipmentQualityId
	,'特种设备资质', EquipmentQuality.EquipmentQualityName+'还有'+CAST(DATEDIFF(DAY,GETDATE(),EquipmentQuality.LimitDate) AS NVARCHAR(5))+'天过期，项目：'+ Project.ProjectName
	,EquipmentQuality.LimitDate
	,'~/QualityAudit/EquipmentQualityEdit.aspx?EquipmentQualityId={0}' AS Url 
	,Project.ProjectId
FROM QualityAudit_EquipmentQuality AS EquipmentQuality 
	LEFT JOIN Base_SpecialEquipment AS SpecialEquipment ON SpecialEquipment.SpecialEquipmentId = EquipmentQuality.SpecialEquipmentId
	LEFT JOIN Base_Project AS Project ON EquipmentQuality.ProjectId =Project.ProjectId
WHERE EquipmentQuality.LimitDate >  GETDATE() and EquipmentQuality.LimitDate < dateadd(month,1, GETDATE()) and (Project.ProjectState is null or Project.ProjectState='1')
	AND (GETDATE()< EquipmentQuality.OutDate OR EquipmentQuality.OutDate IS NULL)

UNION
SELECT CarManager.CarManagerId
	,'现场车辆管理', CarName+'年检已过期，项目：'+ Project.ProjectName
	,CarManager.LastYearCheckDate
	,'~/Administrative/CarManagerView.aspx?CarManagerId={0}' AS Url 
	,Project.ProjectId
FROM Administrative_CarManager AS CarManager 
	LEFT JOIN Base_Project AS Project ON CarManager.ProjectId =Project.ProjectId
WHERE CarManager.LastYearCheckDate<=GETDATE() and (Project.ProjectState is null or Project.ProjectState='1')

UNION
SELECT CarManager.CarManagerId
	,'现场车辆管理', CarName+'保险已过期，项目：'+ Project.ProjectName
	,CarManager.InsuranceDate
	,'~/Administrative/CarManagerView.aspx?CarManagerId={0}' AS Url 
	,Project.ProjectId
FROM Administrative_CarManager AS CarManager 
	LEFT JOIN Base_Project AS Project ON CarManager.ProjectId =Project.ProjectId
WHERE CarManager.InsuranceDate<=GETDATE() and (Project.ProjectState is null or Project.ProjectState='1')

UNION
SELECT DriverManager.DriverManagerId
	,'驾驶员管理', DriverName+'年检已过期，项目：'+ Project.ProjectName
	,DriverManager.CheckDate
	,'~/Administrative/DriverManagerView.aspx?DriverManagerId={0}' AS Url 
	,Project.ProjectId
FROM Administrative_DriverManager AS DriverManager 
	LEFT JOIN Base_Project AS Project ON DriverManager.ProjectId =Project.ProjectId
WHERE DriverManager.CheckDate<=GETDATE() and (Project.ProjectState is null or Project.ProjectState='1')

UNION
SELECT LicenseManager.LicenseManagerId
	,'作业许可证', LicenseManagerCode+'已过期，项目：'+ Project.ProjectName
	,LicenseManager.EndDate
	,'~/License/LicenseManagerView.aspx?LicenseManagerId={0}' AS Url 
	,Project.ProjectId
FROM License_LicenseManager AS LicenseManager 
	LEFT JOIN Base_Project AS Project ON LicenseManager.ProjectId =Project.ProjectId
WHERE LicenseManager.EndDate<=GETDATE() AND  DATEADD(DAY,1,LicenseManager.EndDate)>=GETDATE() and (Project.ProjectState is null or Project.ProjectState='1')

UNION
SELECT PunishNotice.PunishNoticeId
	,'处罚通知单', PunishNoticeCode+'未响应，项目：'+ Project.ProjectName
	,PunishNotice.PunishNoticeDate
	,'~/Check/PunishNoticeEdit.aspx?PunishNoticeId={0}' AS Url 
	,Project.ProjectId
FROM Check_PunishNotice AS PunishNotice 
	LEFT JOIN Base_Project AS Project ON PunishNotice.ProjectId =Project.ProjectId
	LEFT JOIN AttachFile AS AttachFile ON PunishNotice.PunishNoticeId =AttachFile.ToKeyId
WHERE AttachFile.ToKeyId IS NULL AND PunishNotice.States='2' and (Project.ProjectState is null or Project.ProjectState='1')

UNION
SELECT item.HazardListId
	,'危险源辩识评价', hList.HazardCode+'未响应，项目：'+ Project.ProjectName
	,hl.CompileDate
	,'~/Hazard/Response.aspx?HazardListId={0}' AS Url 
	,Project.ProjectId
FROM Hazard_HazardSelectedItem AS item 
	left join dbo.Hazard_HazardList hl on item.HazardListId=hl.HazardListId
	left join dbo.Technique_HazardList hList on item.HazardId=hList.HazardId
	LEFT JOIN Base_Project AS Project ON hl.ProjectId =Project.ProjectId
WHERE item.IsResponse = 0 AND dateadd(wk,item.PromptTime,hl.CompileDate)<=GETDATE() and (Project.ProjectState is null or Project.ProjectState='1')

GO

ALTER TABLE Check_CheckSpecialDetail ALTER COLUMN Unqualified NVARCHAR(3000) NULL
GO
ALTER TABLE Check_CheckSpecialDetail ALTER COLUMN Suggestions NVARCHAR(3000) NULL
GO
ALTER TABLE Check_CheckSpecialDetail ALTER COLUMN HandleStep NVARCHAR(3000) NULL
GO
ALTER TABLE Check_CheckSpecialDetail ALTER COLUMN CheckContent NVARCHAR(3000) NULL
GO
ALTER TABLE Check_CheckSpecialDetail ALTER COLUMN CheckItem NVARCHAR(3000) NULL
GO
ALTER TABLE Check_CheckSpecialDetail ALTER COLUMN WorkArea NVARCHAR(3000) NULL
GO

ALTER TABLE Check_CheckColligationDetail ALTER COLUMN Unqualified NVARCHAR(3000) NULL
GO
ALTER TABLE Check_CheckColligationDetail ALTER COLUMN Suggestions NVARCHAR(3000) NULL
GO
ALTER TABLE Check_CheckColligationDetail ALTER COLUMN HandleStep NVARCHAR(3000) NULL
GO
ALTER TABLE Check_CheckColligationDetail ALTER COLUMN CheckContent NVARCHAR(3000) NULL
GO
ALTER TABLE Check_CheckColligationDetail ALTER COLUMN CheckItem NVARCHAR(3000) NULL
GO
ALTER TABLE Check_CheckColligationDetail ALTER COLUMN WorkArea NVARCHAR(3000) NULL
GO

ALTER TABLE Check_CheckDayDetail ALTER COLUMN Unqualified NVARCHAR(3000) NULL
GO
ALTER TABLE Check_CheckDayDetail ALTER COLUMN Suggestions NVARCHAR(3000) NULL
GO
ALTER TABLE Check_CheckDayDetail ALTER COLUMN HandleStep NVARCHAR(3000) NULL
GO
ALTER TABLE Check_CheckDayDetail ALTER COLUMN CheckContent NVARCHAR(3000) NULL
GO
ALTER TABLE Check_CheckDayDetail ALTER COLUMN CheckItem NVARCHAR(3000) NULL
GO
ALTER TABLE Check_CheckDayDetail ALTER COLUMN WorkArea NVARCHAR(3000) NULL
GO

ALTER TABLE Check_CheckHolidayDetail ALTER COLUMN CheckItem NVARCHAR(3000) NULL
GO
ALTER TABLE Check_CheckHolidayDetail ALTER COLUMN WorkArea NVARCHAR(3000) NULL
GO

ALTER TABLE Check_CheckWorkDetail ALTER COLUMN CheckItem NVARCHAR(3000) NULL
GO
ALTER TABLE Check_CheckWorkDetail ALTER COLUMN WorkArea NVARCHAR(3000) NULL
GO
ALTER TABLE SafetyDataE_SafetyDataE DROP COLUMN MenuId
GO

ALTER TABLE SafetyDataE_SafetyDataE DROP COLUMN CheckType
GO
ALTER TABLE SafetyDataE_SafetyDataE DROP COLUMN CheckTypeValue1
GO
ALTER TABLE SafetyDataE_SafetyDataE DROP COLUMN CheckTypeValue2
GO

ALTER TABLE SafetyDataE_SafetyDataEPlan DROP COLUMN RealStartDate
GO
ALTER TABLE SafetyDataE_SafetyDataEPlan DROP COLUMN RealEndDate
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

UNION
SELECT item.EnvironmentalRiskListId
	,'重要环境危险因素:', item.EnvironmentalFactors+'提示，项目：'+ Project.ProjectName
	,hl.CompileDate
	,'~/Hazard/EnvironmentalRiskListView.aspx?EnvironmentalRiskListId={0}' AS Url 
	,Project.ProjectId
FROM Hazard_EnvironmentalRiskItem AS item 
	left join dbo.Hazard_EnvironmentalRiskList hl on item.EnvironmentalRiskListId=hl.EnvironmentalRiskListId
	LEFT JOIN Base_Project AS Project ON hl.ProjectId =Project.ProjectId
WHERE item.IsImportant = 1 AND DATEADD(DAY,7,hl.IdentificationDate) > GETDATE()
and (Project.ProjectState is null or Project.ProjectState='1') and hl.States='2'

UNION
SELECT Project.ProjectId
	,'项目安全资料','【'+CAST(COUNT(*) AS nvarchar(50))+'】条超期未报。项目：'+ Project.ProjectName
	,GETDATE()
	,'' AS Url 
	,Project.ProjectId
FROM SafetyData_SafetyDataPlan AS SafetyDataPlan 
	LEFT JOIN Base_Project AS Project ON SafetyDataPlan.ProjectId =Project.ProjectId
WHERE SafetyDataPlan.SubmitDate IS NULL  AND Project.ProjectType !='5' AND 
SafetyDataPlan.RealEndDate<=GETDATE() and (Project.ProjectState is null or Project.ProjectState='1')
GROUP BY Project.ProjectId,Project.ProjectName
UNION
SELECT Project.ProjectId
	,'E项目安全资料','【'+CAST(COUNT(*) AS nvarchar(50))+'】条超期未报。项目：'+ Project.ProjectName
	,GETDATE()
	,'' AS Url 
	,Project.ProjectId
FROM SafetyDataE_SafetyDataEPlan AS SafetyDataEPlan 
	LEFT JOIN Base_Project AS Project ON SafetyDataEPlan.ProjectId =Project.ProjectId
WHERE SafetyDataEPlan.SubmitDate IS NULL AND Project.ProjectType='5' AND
SafetyDataEPlan.CheckDate<=GETDATE() and (Project.ProjectState is null or Project.ProjectState='1')
GROUP BY Project.ProjectId,Project.ProjectName

GO

ALTER VIEW [dbo].[View_SafetyDataE_SafetyDataEPlan] 
AS 
/*E项目安全计划表视图*/
SELECT SafetyDataEPlan.SafetyDataEPlanId
      ,SafetyDataEPlan.ProjectId
	  ,Project.ProjectName
      ,SafetyDataEPlan.SafetyDataEId
	  ,SafetyDataE.Title
	  ,SafetyDataE.Code
	  ,convert(varchar(7),SafetyDataEPlan.CheckDate,120) AS CheckMonth 
      ,SafetyDataEPlan.CheckDate     
      ,SafetyDataEPlan.Score
      ,SafetyDataEPlan.Remark
FROM SafetyDataE_SafetyDataEPlan AS SafetyDataEPlan
LEFT JOIN SafetyDataE_SafetyDataE AS SafetyDataE ON SafetyDataEPlan.SafetyDataEId =SafetyDataE.SafetyDataEId
LEFT JOIN Base_Project AS Project ON SafetyDataEPlan.ProjectId =Project.ProjectId

GO

ALTER TABLE SafetyDataE_SafetyDataEPlan ADD States CHAR(1) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态（0-待提交；1-已提交待审核；2-已完成）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyDataE_SafetyDataEPlan', @level2type=N'COLUMN',@level2name=N'States'
GO

INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('288C6A04-456F-4364-B4FE-82C14B8B3CC9','海外工程项目月度HSSE统计表','Manager/ManagerMonthE.aspx','PageHeaderFooter',28,'03235B30-960D-4FCF-99F7-97773A2EE108','Menu_Project',1,0)
	GO
	--海外工程项目月度HSSE统计表
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('981E7E84-6785-434D-BA81-E2F0CF869EA3','288C6A04-456F-4364-B4FE-82C14B8B3CC9','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('F51A6B1B-2E38-4990-8A81-4F77CB8F1C65','288C6A04-456F-4364-B4FE-82C14B8B3CC9','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('83D57F01-C847-48F7-82DF-53557DA27B28','288C6A04-456F-4364-B4FE-82C14B8B3CC9','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('A6AA0F3A-2740-4143-9312-1BD39674AD56','288C6A04-456F-4364-B4FE-82C14B8B3CC9','保存',4)  
	GO


INSERT INTO Sys_MenuCommon (MenuId,MenuName,Url,Icon,SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)  
VALUES('49CD6BDA-5C82-49D1-B1D1-3F2F4082C725','海外工程项目月度HSSE统计表','ManagementReport/MonthReportE.aspx','BorderDraw',18,'70E51ABF-81C8-49CB-89AC-CF0542A201D6','Menu_Server',1,0)
GO

CREATE TABLE [dbo].[Manager_MonthReportE](
	[MonthReportId] [nvarchar](50) NOT NULL,
	[MonthReportCode] [nvarchar](50) NULL,
	[ProjectId] [nvarchar](50) NULL,
	[Months] [datetime] NULL,
	[MonthReportDate] [datetime] NULL,
	[ReportMan] [nvarchar](50) NULL,
	[CountryCities] [nvarchar](50) NULL,
	[StartEndDate] [nvarchar](50) NULL,
	[ContractType] [nvarchar](50) NULL,
	[ContractAmount] [decimal](18, 2) NULL,
	[ThisMajorWork] [nvarchar](1000) NULL,
	[NextMajorWork] [nvarchar](1000) NULL,
	[ThisIncome] [decimal](18, 2) NULL,
	[YearIncome] [decimal](18, 2) NULL,
	[TotalIncome] [decimal](18, 2) NULL,
	[ThisImageProgress] [nvarchar](50) NULL,
	[YearImageProgress] [nvarchar](50) NULL,
	[TotalImageProgress] [nvarchar](50) NULL,
	[ThisPersonNum] [int] NULL,
	[YearPersonNum] [int] NULL,
	[TotalPersonNum] [int] NULL,
	[ThisForeignPersonNum] [int] NULL,
	[YearForeignPersonNum] [int] NULL,
	[TotalForeignPersonNum] [int] NULL,
	[ThisTrainPersonNum] [int] NULL,
	[YearTrainPersonNum] [int] NULL,
	[TotalTrainPersonNum] [int] NULL,
	[ThisCheckNum] [int] NULL,
	[YearCheckNum] [int] NULL,
	[TotalCheckNum] [int] NULL,
	[ThisViolationNum] [int] NULL,
	[YearViolationNum] [int] NULL,
	[TotalViolationNum] [int] NULL,
	[ThisInvestment] [decimal](18, 2) NULL,
	[YearInvestment] [decimal](18, 2) NULL,
	[TotalInvestment] [decimal](18, 2) NULL,
	[ThisReward] [decimal](18, 2) NULL,
	[YearReward] [decimal](18, 2) NULL,
	[TotalReward] [decimal](18, 2) NULL,
	[ThisPunish] [decimal](18, 2) NULL,
	[YearPunish] [decimal](18, 2) NULL,
	[TotalPunish] [decimal](18, 2) NULL,
	[ThisEmergencyDrillNum] [int] NULL,
	[YearEmergencyDrillNum] [int] NULL,
	[TotalEmergencyDrillNum] [int] NULL,
	[ThisHSEManhours] [int] NULL,
	[YearHSEManhours] [int] NULL,
	[TotalHSEManhours] [int] NULL,
	[ThisRecordEvent] [int] NULL,
	[YearRecordEvent] [int] NULL,
	[TotalRecordEvent] [int] NULL,
	[ThisNoRecordEvent] [int] NULL,
	[YearNoRecordEvent] [int] NULL,
	[TotalNoRecordEvent] [int] NULL,
	[ProjectManagerName] [nvarchar](50) NULL,
	[ProjectManagerPhone] [nvarchar](50) NULL,
	[HSEManagerName] [nvarchar](50) NULL,
	[HSEManagerPhone] [nvarchar](50) NULL,
 CONSTRAINT [PK_Manager_MonthReportE] PRIMARY KEY CLUSTERED 
(
	[MonthReportId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportE', @level2type=N'COLUMN',@level2name=N'MonthReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'月报编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportE', @level2type=N'COLUMN',@level2name=N'MonthReportCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportE', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'月份' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportE', @level2type=N'COLUMN',@level2name=N'Months'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报告日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportE', @level2type=N'COLUMN',@level2name=N'MonthReportDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报告人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportE', @level2type=N'COLUMN',@level2name=N'ReportMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'所在国别/城市' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportE', @level2type=N'COLUMN',@level2name=N'CountryCities'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'开－竣工日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportE', @level2type=N'COLUMN',@level2name=N'StartEndDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'合同类别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportE', @level2type=N'COLUMN',@level2name=N'ContractType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'合同额' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportE', @level2type=N'COLUMN',@level2name=N'ContractAmount'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'本月主要工作' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportE', @level2type=N'COLUMN',@level2name=N'ThisMajorWork'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'下月主要工作' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportE', @level2type=N'COLUMN',@level2name=N'NextMajorWork'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'本月收入' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportE', @level2type=N'COLUMN',@level2name=N'ThisIncome'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'本年累计收入' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportE', @level2type=N'COLUMN',@level2name=N'YearIncome'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自开工累计收入' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportE', @level2type=N'COLUMN',@level2name=N'TotalIncome'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'本月形象进度' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportE', @level2type=N'COLUMN',@level2name=N'ThisImageProgress'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'本年形象进度' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportE', @level2type=N'COLUMN',@level2name=N'YearImageProgress'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自开工累计形象进度' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportE', @level2type=N'COLUMN',@level2name=N'TotalImageProgress'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'本月现场员工总数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportE', @level2type=N'COLUMN',@level2name=N'ThisPersonNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'本年累计员工总数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportE', @level2type=N'COLUMN',@level2name=N'YearPersonNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自开工累计员工总数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportE', @level2type=N'COLUMN',@level2name=N'TotalPersonNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'本月外籍员工人数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportE', @level2type=N'COLUMN',@level2name=N'ThisForeignPersonNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'本年外籍员工人数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportE', @level2type=N'COLUMN',@level2name=N'YearForeignPersonNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自开工累计外籍员工人数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportE', @level2type=N'COLUMN',@level2name=N'TotalForeignPersonNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'本月HSSE教育培训（人/次）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportE', @level2type=N'COLUMN',@level2name=N'ThisTrainPersonNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'本年累计HSSE教育培训（人/次）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportE', @level2type=N'COLUMN',@level2name=N'YearTrainPersonNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自开工累计HSSE教育培训（人/次）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportE', @level2type=N'COLUMN',@level2name=N'TotalTrainPersonNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'本月HSSE检查（次）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportE', @level2type=N'COLUMN',@level2name=N'ThisCheckNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'本年累计HSSE检查（次）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportE', @level2type=N'COLUMN',@level2name=N'YearCheckNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自开工累计HSSE检查（次）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportE', @level2type=N'COLUMN',@level2name=N'TotalCheckNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'本月HSSE隐患排查治理（项）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportE', @level2type=N'COLUMN',@level2name=N'ThisViolationNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'本年累计HSSE隐患排查治理（项）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportE', @level2type=N'COLUMN',@level2name=N'YearViolationNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自开工累计HSSE隐患排查治理（项）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportE', @level2type=N'COLUMN',@level2name=N'TotalViolationNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'本月HSSE投入' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportE', @level2type=N'COLUMN',@level2name=N'ThisInvestment'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'本年累计HSSE投入' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportE', @level2type=N'COLUMN',@level2name=N'YearInvestment'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自开工累计HSSE投入' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportE', @level2type=N'COLUMN',@level2name=N'TotalInvestment'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'本月HSSE奖励' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportE', @level2type=N'COLUMN',@level2name=N'ThisReward'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'本年累计HSSE奖励' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportE', @level2type=N'COLUMN',@level2name=N'YearReward'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自开工累计HSSE奖励' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportE', @level2type=N'COLUMN',@level2name=N'TotalReward'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'本月HSSE处罚' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportE', @level2type=N'COLUMN',@level2name=N'ThisPunish'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'本年累计HSSE处罚' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportE', @level2type=N'COLUMN',@level2name=N'YearPunish'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自开工累计HSSE处罚' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportE', @level2type=N'COLUMN',@level2name=N'TotalPunish'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'本月HSSE应急演练（次）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportE', @level2type=N'COLUMN',@level2name=N'ThisEmergencyDrillNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'本年累计HSSE应急演练（次）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportE', @level2type=N'COLUMN',@level2name=N'YearEmergencyDrillNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自开工累计HSSE应急演练（次）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportE', @level2type=N'COLUMN',@level2name=N'TotalEmergencyDrillNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'本月HSE工时' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportE', @level2type=N'COLUMN',@level2name=N'ThisHSEManhours'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'本年累计HSE工时' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportE', @level2type=N'COLUMN',@level2name=N'YearHSEManhours'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自开工累计HSE工时' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportE', @level2type=N'COLUMN',@level2name=N'TotalHSEManhours'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'本月可记录HSE事件' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportE', @level2type=N'COLUMN',@level2name=N'ThisRecordEvent'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'本年累计可记录HSE事件' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportE', @level2type=N'COLUMN',@level2name=N'YearRecordEvent'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自开工累计可记录HSE事件' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportE', @level2type=N'COLUMN',@level2name=N'TotalRecordEvent'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'本月不可记录HSE事件' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportE', @level2type=N'COLUMN',@level2name=N'ThisNoRecordEvent'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'本年累计不可记录HSE事件' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportE', @level2type=N'COLUMN',@level2name=N'YearNoRecordEvent'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自开工累计不可记录HSE事件' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportE', @level2type=N'COLUMN',@level2name=N'TotalNoRecordEvent'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目经理姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportE', @level2type=N'COLUMN',@level2name=N'ProjectManagerName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目经理电话' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportE', @level2type=N'COLUMN',@level2name=N'ProjectManagerPhone'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HSE总监/经理姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportE', @level2type=N'COLUMN',@level2name=N'HSEManagerName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HSE总监/经理电话' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportE', @level2type=N'COLUMN',@level2name=N'HSEManagerPhone'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'海外工程项目月度HSSE统计表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportE'
GO

ALTER TABLE [dbo].[Manager_MonthReportE]  WITH CHECK ADD  CONSTRAINT [FK_Manager_MonthReportE_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[Manager_MonthReportE] CHECK CONSTRAINT [FK_Manager_MonthReportE_Base_Project]
GO

ALTER TABLE [dbo].[Manager_MonthReportE]  WITH CHECK ADD  CONSTRAINT [FK_Manager_MonthReportE_Sys_User] FOREIGN KEY([ReportMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[Manager_MonthReportE] CHECK CONSTRAINT [FK_Manager_MonthReportE_Sys_User]
GO



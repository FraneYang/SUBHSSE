CREATE VIEW [dbo].[View_CheckAnalysis]
AS
/*检查项分析视图*/
SELECT ProjectId,CheckItemType,CheckItem,CheckTime,UnitId,CheckArea
FROM Check_CheckDayDetail AS CheckDayDetail
	LEFT JOIN Check_CheckDay AS CheckDay ON CheckDayDetail.CheckDayId =CheckDayDetail.CheckDayId
	WHERE CheckDay.States = '2'
UNION ALL
SELECT ProjectId,CheckItemType,CheckItem,CheckTime,UnitId,CheckArea
FROM Check_CheckColligationDetail AS CheckColligationDetail
	LEFT JOIN Check_CheckColligation AS CheckColligation ON CheckColligationDetail.CheckColligationId =CheckColligationDetail.CheckColligationId
	WHERE CheckColligation.States = '2'
UNION ALL
SELECT ProjectId,CheckItemType,CheckItem,CheckTime,UnitId,CheckArea
FROM Check_CheckSpecialDetail AS CheckSpecialDetail
	LEFT JOIN Check_CheckSpecial AS CheckSpecial ON CheckSpecialDetail.CheckSpecialId =CheckSpecialDetail.CheckSpecialId
	WHERE CheckSpecial.States = '2'
UNION ALL
SELECT CheckHoliday.ProjectId,ProjectCheckItemSet.CheckType,CheckItem,CheckTime,NULL,NULL  --待优化
FROM Check_CheckHolidayDetail AS CheckHolidayDetail
	LEFT JOIN Check_CheckHoliday AS CheckHoliday ON CheckHolidayDetail.CheckHolidayId =CheckHolidayDetail.CheckHolidayId
	LEFT JOIN Check_ProjectCheckItemDetail AS ProjectCheckItemDetail ON CheckHolidayDetail.CheckItem =ProjectCheckItemDetail.CheckItemDetailId
		LEFT JOIN Check_ProjectCheckItemSet AS ProjectCheckItemSet ON ProjectCheckItemDetail.CheckItemSetId =ProjectCheckItemSet.CheckItemSetId
	WHERE CheckHoliday.States = '2'
UNION ALL
SELECT CheckWork.ProjectId,ProjectCheckItemSet.CheckType,CheckItem,CheckTime,NULL,NULL --待优化
FROM Check_CheckWorkDetail AS CheckWorkDetail
	LEFT JOIN Check_CheckWork AS CheckWork ON CheckWorkDetail.CheckWorkId =CheckWorkDetail.CheckWorkId
	LEFT JOIN Check_ProjectCheckItemDetail AS ProjectCheckItemDetail ON CheckWorkDetail.CheckItem =ProjectCheckItemDetail.CheckItemDetailId
		LEFT JOIN Check_ProjectCheckItemSet AS ProjectCheckItemSet ON ProjectCheckItemDetail.CheckItemSetId =ProjectCheckItemSet.CheckItemSetId
	WHERE CheckWork.States = '2'

GO


ALTER TABLE SitePerson_Person ALTER COLUMN CardNo NVARCHAR(50) NULL
GO
ALTER TABLE SitePerson_Person ALTER COLUMN IdentityCard NVARCHAR(50) NULL
GO
ALTER TABLE SitePerson_Person ALTER COLUMN Address NVARCHAR(500) NULL
GO
ALTER TABLE SitePerson_Person ALTER COLUMN Telephone NVARCHAR(50) NULL
GO
ALTER TABLE SitePerson_Person ALTER COLUMN CertificateCode NVARCHAR(50) NULL
GO
ALTER TABLE SitePerson_Person ALTER COLUMN CertificateCode NVARCHAR(50) NULL
GO
ALTER TABLE SitePerson_Person ALTER COLUMN PhotoUrl NVARCHAR(2000) NULL
GO
ALTER TABLE SitePerson_Person ALTER COLUMN PersonName NVARCHAR(50) NULL
GO

ALTER VIEW [dbo].[View_NewDynamic] 
AS
/*最新动态视图*/
SELECT LawRegulationId AS Id,'法律法规' AS [Type], LawRegulationName AS Name,EffectiveDate AS [Date],'~/Law/LawRegulationListEdit.aspx?LawRegulationId={0}' AS Url  
FROM dbo.Law_LawRegulationList 
WHERE IsPass=1 and DATEADD(MONTH,1,CompileDate)>=GETDATE()

UNION
SELECT StandardId,'标准规范', StandardName,CompileDate,'~/Law/HSSEStandardListSave.aspx?StandardId={0}' AS Url 
FROM dbo.Law_HSSEStandardsList 
WHERE IsPass=1 and DATEADD(MONTH,1,CompileDate)>=GETDATE()

UNION
SELECT RulesRegulationsId,'规章制度', RulesRegulationsName,CustomDate,'~/Law/RulesRegulationsEdit.aspx?RulesRegulationsId={0}' AS Url 
FROM dbo.Law_RulesRegulations 
WHERE IsPass=1 and DATEADD(MONTH,1,CompileDate)>=GETDATE()

UNION
SELECT ManageRuleId,'管理规定', ManageRuleName,CompileDate,'~/Law/ManageRuleEdit.aspx?ManageRuleId={0}' AS Url 
FROM dbo.Law_ManageRule 
WHERE IsPass=1 and DATEADD(MONTH,1,CompileDate)>=GETDATE()

UNION
SELECT TrainingItemId,'培训教材', TrainingItemName,CompileDate,'~/EduTrain/TrainingItemSave.aspx?TrainingItemId={0}' AS Url 
FROM dbo.Training_TrainingItem 
WHERE IsPass=1 and DATEADD(MONTH,1,CompileDate)>=GETDATE()

UNION
SELECT TrainTestItemId,'安全试题', TraiinTestItemName,CompileDate,'~/EduTrain/TrainTestItemEdit.aspx?TrainTestItemId={0}' AS Url 
FROM dbo.Training_TrainTestDBItem 
WHERE IsPass=1 and DATEADD(MONTH,1,CompileDate)>=GETDATE()

UNION
SELECT AccidentCaseItemId,'事故案例', AccidentName,CompileDate,'~/EduTrain/AccidentCaseItemSave.aspx?AccidentCaseItemId={0}' AS Url 
FROM dbo.EduTrain_AccidentCaseItem 
WHERE IsPass=1 and DATEADD(MONTH,1,CompileDate)>=GETDATE()

UNION
SELECT KnowledgeItemId,'应知应会', KnowledgeItemName,CompileDate,'~/EduTrain/KnowledgeDBItemEdit.aspx?KnowledgeItemId={0}' AS Url 
FROM dbo.Training_KnowledgeItem 
WHERE IsPass=1 and DATEADD(MONTH,1,CompileDate)>=GETDATE()

UNION
SELECT HazardId,'危险源', HazardItems,CompileDate,'~/Technique/HazardListEdit.aspx?HazardId={0}' AS Url 
FROM dbo.Technique_HazardList 
WHERE IsPass=1 and DATEADD(MONTH,1,CompileDate)>=GETDATE()

UNION
SELECT RectifyItemId,'安全隐患', HazardSourcePoint,CompileDate,'~/Technique/RectifyItemEdit.aspx?RectifyItemId={0}' AS Url 
FROM dbo.Technique_RectifyItem 
WHERE IsPass=1 and DATEADD(MONTH,1,CompileDate)>=GETDATE()

UNION
SELECT HAZOPId,'HAZOP', HAZOPTitle,CompileDate,'~/Technique/HAZOPEdit.aspx?HAZOPId={0}' AS Url 
FROM dbo.Technique_HAZOP 
WHERE IsPass=1 and DATEADD(MONTH,1,CompileDate)>=GETDATE()

UNION
SELECT ExpertId,'安全专家', ExpertName,CompileDate,'~/Technique/ExpertSave.aspx?ExpertId={0}' AS Url 
FROM dbo.Technique_Expert 
WHERE IsPass=1 and DATEADD(MONTH,1,CompileDate)>=GETDATE()

UNION
SELECT EmergencyId,'应急预案', EmergencyName,CompileDate,'~/Technique/EmergencyEdit.aspx?EmergencyId={0}' AS Url 
FROM dbo.Technique_Emergency 
WHERE IsPass=1 and DATEADD(MONTH,1,CompileDate)>=GETDATE()

UNION
SELECT SpecialSchemeId,'专项方案', SpecialSchemeName,CompileDate,'~/Technique/SpecialSchemeEdit.aspx?SpecialSchemeId={0}' AS Url 
FROM dbo.Technique_SpecialScheme 
WHERE IsPass=1 and DATEADD(MONTH,1,CompileDate)>=GETDATE()

UNION
SELECT SpecialSchemeId,'专项方案', SpecialSchemeName,CompileDate,'~/Technique/SpecialSchemeEdit.aspx?SpecialSchemeId={0}' AS Url 
FROM dbo.Technique_SpecialScheme 
WHERE IsPass=1 and DATEADD(MONTH,1,CompileDate)>=GETDATE()

UNION
SELECT PersonQuality.PersonQualityId,'特岗人员资质',  '[' + Person.CardNo +']'+ Person.PersonName +'已过期，项目：'+ Project.ProjectName,PersonQuality.LimitDate,'~/QualityAudit/PersonQualityEdit.aspx?PersonQualityId={0}' AS Url 
FROM QualityAudit_PersonQuality AS PersonQuality
LEFT JOIN SitePerson_Person AS Person ON Person.PersonId = PersonQuality.PersonId
LEFT JOIN Base_Project AS Project ON PersonQuality.ProjectId =Project.ProjectId
WHERE PersonQuality.LimitDate<=GETDATE() 
AND (GETDATE()< Person.OutTime OR Person.OutTime IS NULL)

UNION
SELECT EquipmentQuality.EquipmentQualityId,'特种设备资质', EquipmentQuality.EquipmentQualityName+'已过期，项目：'+ Project.ProjectName,EquipmentQuality.LimitDate,'~/QualityAudit/EquipmentQualityEdit.aspx?EquipmentQualityId={0}' AS Url 
FROM QualityAudit_EquipmentQuality AS EquipmentQuality 
LEFT JOIN Base_SpecialEquipment AS SpecialEquipment ON SpecialEquipment.SpecialEquipmentId = EquipmentQuality.SpecialEquipmentId
LEFT JOIN Base_Project AS Project ON EquipmentQuality.ProjectId =Project.ProjectId
WHERE EquipmentQuality.LimitDate<=GETDATE() 
AND (GETDATE()< EquipmentQuality.OutDate OR EquipmentQuality.OutDate IS NULL)
GO


INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('D1D8A032-2803-496E-B4F2-7A8637F74520','6','管理月报冻结日期',1,'MonthReportFreezeDay')  
GO

CREATE TABLE [dbo].[Manager_ManagerQuarterly](
	[ManagerQuarterlyId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NOT NULL,
	[ManagerQuarterlyCode] [nvarchar](50) NULL,
	[ManagerQuarterlyName] [nvarchar](50) NULL,
	[FileContent] [nvarchar](max) NULL,
	[CompileMan] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
	[States] [char](1) NULL,
 CONSTRAINT [PK_Manager_ManagerQuarterly] PRIMARY KEY CLUSTERED 
(
	[ManagerQuarterlyId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_ManagerQuarterly', @level2type=N'COLUMN',@level2name=N'ManagerQuarterlyId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_ManagerQuarterly', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'季报编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_ManagerQuarterly', @level2type=N'COLUMN',@level2name=N'ManagerQuarterlyCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'季报名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_ManagerQuarterly', @level2type=N'COLUMN',@level2name=N'ManagerQuarterlyName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'季报内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_ManagerQuarterly', @level2type=N'COLUMN',@level2name=N'FileContent'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_ManagerQuarterly', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_ManagerQuarterly', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_ManagerQuarterly', @level2type=N'COLUMN',@level2name=N'States'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'管理季报' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_ManagerQuarterly'
GO

ALTER TABLE [dbo].[Manager_ManagerQuarterly]  WITH CHECK ADD  CONSTRAINT [FK_Manager_ManagerQuarterly_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[Manager_ManagerQuarterly] CHECK CONSTRAINT [FK_Manager_ManagerQuarterly_Base_Project]
GO

ALTER TABLE [dbo].[Manager_ManagerQuarterly]  WITH CHECK ADD  CONSTRAINT [FK_Manager_ManagerQuarterly_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[Manager_ManagerQuarterly] CHECK CONSTRAINT [FK_Manager_ManagerQuarterly_Sys_User]
GO

CREATE TABLE [dbo].[Manager_CompletionReport](
	[CompletionReportId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NOT NULL,
	[CompletionReportCode] [nvarchar](50) NULL,
	[CompletionReportName] [nvarchar](50) NULL,
	[FileContent] [nvarchar](max) NULL,
	[CompileMan] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
	[States] [char](1) NULL,
 CONSTRAINT [PK_Manager_CompletionReport] PRIMARY KEY CLUSTERED 
(
	[CompletionReportId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_CompletionReport', @level2type=N'COLUMN',@level2name=N'CompletionReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_CompletionReport', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'完工报告编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_CompletionReport', @level2type=N'COLUMN',@level2name=N'CompletionReportCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'完工报告名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_CompletionReport', @level2type=N'COLUMN',@level2name=N'CompletionReportName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'完工报告内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_CompletionReport', @level2type=N'COLUMN',@level2name=N'FileContent'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_CompletionReport', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_CompletionReport', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_CompletionReport', @level2type=N'COLUMN',@level2name=N'States'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'完工报告' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_CompletionReport'
GO

ALTER TABLE [dbo].[Manager_CompletionReport]  WITH CHECK ADD  CONSTRAINT [FK_Manager_CompletionReport_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[Manager_CompletionReport] CHECK CONSTRAINT [FK_Manager_CompletionReport_Base_Project]
GO

ALTER TABLE [dbo].[Manager_CompletionReport]  WITH CHECK ADD  CONSTRAINT [FK_Manager_CompletionReport_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[Manager_CompletionReport] CHECK CONSTRAINT [FK_Manager_CompletionReport_Sys_User]
GO

CREATE TABLE [dbo].[Manager_ManagerTotal](
	[ManagerTotalId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NOT NULL,
	[ManagerTotalCode] [nvarchar](50) NULL,
	[ManagerTotalName] [nvarchar](50) NULL,
	[FileContent] [nvarchar](max) NULL,
	[CompileMan] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
	[States] [char](1) NULL,
 CONSTRAINT [PK_Manager_ManagerTotal] PRIMARY KEY CLUSTERED 
(
	[ManagerTotalId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_ManagerTotal', @level2type=N'COLUMN',@level2name=N'ManagerTotalId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_ManagerTotal', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'工作总结编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_ManagerTotal', @level2type=N'COLUMN',@level2name=N'ManagerTotalCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'工作总结名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_ManagerTotal', @level2type=N'COLUMN',@level2name=N'ManagerTotalName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'工作总结内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_ManagerTotal', @level2type=N'COLUMN',@level2name=N'FileContent'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_ManagerTotal', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_ManagerTotal', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_ManagerTotal', @level2type=N'COLUMN',@level2name=N'States'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'管理工作总结' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_ManagerTotal'
GO

ALTER TABLE [dbo].[Manager_ManagerTotal]  WITH CHECK ADD  CONSTRAINT [FK_Manager_ManagerTotal_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[Manager_ManagerTotal] CHECK CONSTRAINT [FK_Manager_ManagerTotal_Base_Project]
GO

ALTER TABLE [dbo].[Manager_ManagerTotal]  WITH CHECK ADD  CONSTRAINT [FK_Manager_ManagerTotal_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[Manager_ManagerTotal] CHECK CONSTRAINT [FK_Manager_ManagerTotal_Sys_User]
GO

CREATE TABLE [dbo].[Manager_ManagerPerformance](
	[ManagerPerformanceId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NOT NULL,
	[ManagerPerformanceCode] [nvarchar](50) NULL,
	[ManagerPerformanceName] [nvarchar](50) NULL,
	[FileContent] [nvarchar](max) NULL,
	[CompileMan] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
	[States] [char](1) NULL,
 CONSTRAINT [PK_Manager_ManagerPerformance] PRIMARY KEY CLUSTERED 
(
	[ManagerPerformanceId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_ManagerPerformance', @level2type=N'COLUMN',@level2name=N'ManagerPerformanceId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_ManagerPerformance', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'顾客评价编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_ManagerPerformance', @level2type=N'COLUMN',@level2name=N'ManagerPerformanceCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'顾客评价名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_ManagerPerformance', @level2type=N'COLUMN',@level2name=N'ManagerPerformanceName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'顾客评价内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_ManagerPerformance', @level2type=N'COLUMN',@level2name=N'FileContent'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_ManagerPerformance', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_ManagerPerformance', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_ManagerPerformance', @level2type=N'COLUMN',@level2name=N'States'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'现场HSSE工作顾客评价' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_ManagerPerformance'
GO

ALTER TABLE [dbo].[Manager_ManagerPerformance]  WITH CHECK ADD  CONSTRAINT [FK_Manager_ManagerPerformance_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[Manager_ManagerPerformance] CHECK CONSTRAINT [FK_Manager_ManagerPerformance_Base_Project]
GO

ALTER TABLE [dbo].[Manager_ManagerPerformance]  WITH CHECK ADD  CONSTRAINT [FK_Manager_ManagerPerformance_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[Manager_ManagerPerformance] CHECK CONSTRAINT [FK_Manager_ManagerPerformance_Sys_User]
GO

CREATE TABLE [dbo].[Manager_Health](
	[HealthId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NOT NULL,
	[HealthCode] [nvarchar](50) NULL,
	[HealthName] [nvarchar](50) NULL,
	[FileContent] [nvarchar](max) NULL,
	[CompileMan] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
	[States] [char](1) NULL,
 CONSTRAINT [PK_Manager_Health] PRIMARY KEY CLUSTERED 
(
	[HealthId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Health', @level2type=N'COLUMN',@level2name=N'HealthId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Health', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'工程现场环境与职业健康月报编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Health', @level2type=N'COLUMN',@level2name=N'HealthCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'工程现场环境与职业健康月报名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Health', @level2type=N'COLUMN',@level2name=N'HealthName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'周报内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Health', @level2type=N'COLUMN',@level2name=N'FileContent'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Health', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Health', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Health', @level2type=N'COLUMN',@level2name=N'States'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'工程现场环境与职业健康月报' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Health'
GO

ALTER TABLE [dbo].[Manager_Health]  WITH CHECK ADD  CONSTRAINT [FK_Manager_Health_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[Manager_Health] CHECK CONSTRAINT [FK_Manager_Health_Base_Project]
GO

ALTER TABLE [dbo].[Manager_Health]  WITH CHECK ADD  CONSTRAINT [FK_Manager_Health_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[Manager_Health] CHECK CONSTRAINT [FK_Manager_Health_Sys_User]
GO

CREATE TABLE [dbo].[Manager_SubManagerWeek](
	[SubManagerWeekId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NOT NULL,
	[SubManagerWeekCode] [nvarchar](50) NULL,
	[SubManagerWeekName] [nvarchar](50) NULL,
	[FileContent] [nvarchar](max) NULL,
	[CompileMan] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
	[States] [char](1) NULL,
 CONSTRAINT [PK_Manager_SubManagerWeek] PRIMARY KEY CLUSTERED 
(
	[SubManagerWeekId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SubManagerWeek', @level2type=N'COLUMN',@level2name=N'SubManagerWeekId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SubManagerWeek', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'周报编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SubManagerWeek', @level2type=N'COLUMN',@level2name=N'SubManagerWeekCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'周报名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SubManagerWeek', @level2type=N'COLUMN',@level2name=N'SubManagerWeekName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'周报内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SubManagerWeek', @level2type=N'COLUMN',@level2name=N'FileContent'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SubManagerWeek', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SubManagerWeek', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SubManagerWeek', @level2type=N'COLUMN',@level2name=N'States'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分包商周报' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SubManagerWeek'
GO

ALTER TABLE [dbo].[Manager_SubManagerWeek]  WITH CHECK ADD  CONSTRAINT [FK_Manager_SubManagerWeek_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[Manager_SubManagerWeek] CHECK CONSTRAINT [FK_Manager_SubManagerWeek_Base_Project]
GO

ALTER TABLE [dbo].[Manager_SubManagerWeek]  WITH CHECK ADD  CONSTRAINT [FK_Manager_SubManagerWeek_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[Manager_SubManagerWeek] CHECK CONSTRAINT [FK_Manager_SubManagerWeek_Sys_User]
GO

CREATE TABLE [dbo].[Manager_SubManagerMonth](
	[SubManagerMonthId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NOT NULL,
	[SubManagerMonthCode] [nvarchar](50) NULL,
	[SubManagerMonthName] [nvarchar](50) NULL,
	[FileContent] [nvarchar](max) NULL,
	[CompileMan] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
	[States] [char](1) NULL,
 CONSTRAINT [PK_Manager_SubManagerMonth] PRIMARY KEY CLUSTERED 
(
	[SubManagerMonthId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SubManagerMonth', @level2type=N'COLUMN',@level2name=N'SubManagerMonthId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SubManagerMonth', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分包商HSSE月报编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SubManagerMonth', @level2type=N'COLUMN',@level2name=N'SubManagerMonthCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分包商HSSE月报名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SubManagerMonth', @level2type=N'COLUMN',@level2name=N'SubManagerMonthName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分包商HSSE月报内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SubManagerMonth', @level2type=N'COLUMN',@level2name=N'FileContent'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SubManagerMonth', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SubManagerMonth', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SubManagerMonth', @level2type=N'COLUMN',@level2name=N'States'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分包商HSSE月报' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SubManagerMonth'
GO

ALTER TABLE [dbo].[Manager_SubManagerMonth]  WITH CHECK ADD  CONSTRAINT [FK_Manager_SubManagerMonth_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[Manager_SubManagerMonth] CHECK CONSTRAINT [FK_Manager_SubManagerMonth_Base_Project]
GO

ALTER TABLE [dbo].[Manager_SubManagerMonth]  WITH CHECK ADD  CONSTRAINT [FK_Manager_SubManagerMonth_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[Manager_SubManagerMonth] CHECK CONSTRAINT [FK_Manager_SubManagerMonth_Sys_User]
GO

CREATE TABLE [dbo].[Manager_MonthReport](
	[MonthReportId] [nvarchar](50) NOT NULL,
	[MonthReportCode] [nvarchar](30) NULL,
	[ProjectId] [nvarchar](50) NULL,
	[ReportMonths] [datetime] NULL,
	[Months] [datetime] NULL,
	[MonthReportDate] [datetime] NULL,
	[ReportMan] [nvarchar](50) NULL,
	[FileAttachUrl] [nvarchar](1000) NULL,
	[AttachUrl] [nvarchar](150) NULL,
	[Flag] [char](1) NULL,
	[MonthReportStartDate] [datetime] NULL,
	[ThisMonthKeyPoints] [nvarchar](3000) NULL,
	[ThisMonthSafetyActivity] [nvarchar](3000) NULL,
	[NextMonthWorkFocus] [nvarchar](3000) NULL,
	[AllProjectData] [nvarchar](3000) NULL,
	[AllManhoursData] [nvarchar](200) NULL,
	[EquipmentQualityData] [nvarchar](3000) NULL,
	[ThisMonthSafetyCost] [decimal](18, 2) NULL,
	[TotalSafetyCost] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Manager_MonthReport] PRIMARY KEY CLUSTERED 
(
	[MonthReportId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReport', @level2type=N'COLUMN',@level2name=N'MonthReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'月报告编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReport', @level2type=N'COLUMN',@level2name=N'MonthReportCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReport', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'月报月份' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReport', @level2type=N'COLUMN',@level2name=N'ReportMonths'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'月份' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReport', @level2type=N'COLUMN',@level2name=N'Months'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'月报告日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReport', @level2type=N'COLUMN',@level2name=N'MonthReportDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报告人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReport', @level2type=N'COLUMN',@level2name=N'ReportMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'月报开始时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReport', @level2type=N'COLUMN',@level2name=N'MonthReportStartDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'本月监控重点及措施' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReport', @level2type=N'COLUMN',@level2name=N'ThisMonthKeyPoints'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'本月主要安全活动' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReport', @level2type=N'COLUMN',@level2name=N'ThisMonthSafetyActivity'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'下月工作重点' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReport', @level2type=N'COLUMN',@level2name=N'NextMonthWorkFocus'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目总体数据统计' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReport', @level2type=N'COLUMN',@level2name=N'AllProjectData'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'安全人工时' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReport', @level2type=N'COLUMN',@level2name=N'AllManhoursData'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'周报设备数据' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReport', @level2type=N'COLUMN',@level2name=N'EquipmentQualityData'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'本月安全费用情况' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReport', @level2type=N'COLUMN',@level2name=N'ThisMonthSafetyCost'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'月报告主表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReport'
GO

ALTER TABLE [dbo].[Manager_MonthReport]  WITH CHECK ADD  CONSTRAINT [FK_Manager_MonthReport_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[Manager_MonthReport] CHECK CONSTRAINT [FK_Manager_MonthReport_Base_Project]
GO

ALTER TABLE [dbo].[Manager_MonthReport]  WITH CHECK ADD  CONSTRAINT [FK_Manager_MonthReport_Sys_User] FOREIGN KEY([ReportMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[Manager_MonthReport] CHECK CONSTRAINT [FK_Manager_MonthReport_Sys_User]
GO

CREATE TABLE [dbo].[Manager_AccidentSort](
	[AccidentSortId] [nvarchar](50) NOT NULL,
	[MonthReportId] [nvarchar](50) NULL,
	[AccidentTypeId] [nvarchar](50) NULL,
	[AccidentNumber01] [int] NULL,
	[AccidentNumber02] [int] NULL,
 CONSTRAINT [PK_Manager_AccidentSort] PRIMARY KEY CLUSTERED 
(
	[AccidentSortId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_AccidentSort', @level2type=N'COLUMN',@level2name=N'AccidentSortId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'月报告' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_AccidentSort', @level2type=N'COLUMN',@level2name=N'MonthReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'本月死亡事故' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_AccidentSort', @level2type=N'COLUMN',@level2name=N'AccidentNumber01'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'本月重伤事故' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_AccidentSort', @level2type=N'COLUMN',@level2name=N'AccidentNumber02'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'月报告事故分类表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_AccidentSort'
GO

ALTER TABLE [dbo].[Manager_AccidentSort]  WITH CHECK ADD  CONSTRAINT [FK_Manager_AccidentSort_Base_AccidentType] FOREIGN KEY([AccidentTypeId])
REFERENCES [dbo].[Base_AccidentType] ([AccidentTypeId])
GO

ALTER TABLE [dbo].[Manager_AccidentSort] CHECK CONSTRAINT [FK_Manager_AccidentSort_Base_AccidentType]
GO

ALTER TABLE [dbo].[Manager_AccidentSort]  WITH CHECK ADD  CONSTRAINT [FK_Manager_AccidentSort_Manager_MonthReport] FOREIGN KEY([MonthReportId])
REFERENCES [dbo].[Manager_MonthReport] ([MonthReportId])
GO

ALTER TABLE [dbo].[Manager_AccidentSort] CHECK CONSTRAINT [FK_Manager_AccidentSort_Manager_MonthReport]
GO

CREATE TABLE [dbo].[Manager_CheckSort](
	[CheckSortId] [nvarchar](50) NOT NULL,
	[MonthReportId] [nvarchar](50) NULL,
	[CheckNumber01] [int] NULL,
	[CheckNumber02] [int] NULL,
	[CheckNumber03] [int] NULL,
	[CheckNumber04] [int] NULL,
	[CheckNumber11] [int] NULL,
	[CheckNumber12] [int] NULL,
	[CheckNumber13] [int] NULL,
	[CheckNumber14] [int] NULL,
	[CheckNumber21] [int] NULL,
	[CheckNumber22] [int] NULL,
	[CheckNumber23] [int] NULL,
	[CheckNumber24] [int] NULL,
	[CheckNumber31] [int] NULL,
	[CheckNumber32] [int] NULL,
	[CheckNumber33] [int] NULL,
	[CheckNumber34] [int] NULL,
 CONSTRAINT [PK_Manager_CheckSort] PRIMARY KEY CLUSTERED 
(
	[CheckSortId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_CheckSort', @level2type=N'COLUMN',@level2name=N'CheckSortId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'月报告' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_CheckSort', @level2type=N'COLUMN',@level2name=N'MonthReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'本月日检查' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_CheckSort', @level2type=N'COLUMN',@level2name=N'CheckNumber01'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'累计日检查' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_CheckSort', @level2type=N'COLUMN',@level2name=N'CheckNumber02'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'本月日检查违章' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_CheckSort', @level2type=N'COLUMN',@level2name=N'CheckNumber03'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'累计日检查违章' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_CheckSort', @level2type=N'COLUMN',@level2name=N'CheckNumber04'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'本月专项检查' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_CheckSort', @level2type=N'COLUMN',@level2name=N'CheckNumber11'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'累计专项检查' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_CheckSort', @level2type=N'COLUMN',@level2name=N'CheckNumber12'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'本月专项检查违章' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_CheckSort', @level2type=N'COLUMN',@level2name=N'CheckNumber13'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'累计专项检查违章' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_CheckSort', @level2type=N'COLUMN',@level2name=N'CheckNumber14'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'本月综合大检查' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_CheckSort', @level2type=N'COLUMN',@level2name=N'CheckNumber21'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'累计综合大检查' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_CheckSort', @level2type=N'COLUMN',@level2name=N'CheckNumber22'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'本月综合大检查违章' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_CheckSort', @level2type=N'COLUMN',@level2name=N'CheckNumber23'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'累计综合大检查违章' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_CheckSort', @level2type=N'COLUMN',@level2name=N'CheckNumber24'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'本月其他检查' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_CheckSort', @level2type=N'COLUMN',@level2name=N'CheckNumber31'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'累计其他检查' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_CheckSort', @level2type=N'COLUMN',@level2name=N'CheckNumber32'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'本月其他检查违章' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_CheckSort', @level2type=N'COLUMN',@level2name=N'CheckNumber33'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'累计其他检查违章' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_CheckSort', @level2type=N'COLUMN',@level2name=N'CheckNumber34'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'月报告HSE检查情况表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_CheckSort'
GO

ALTER TABLE [dbo].[Manager_CheckSort]  WITH CHECK ADD  CONSTRAINT [FK_Manager_CheckSort_Manager_MonthReport] FOREIGN KEY([MonthReportId])
REFERENCES [dbo].[Manager_MonthReport] ([MonthReportId])
GO

ALTER TABLE [dbo].[Manager_CheckSort] CHECK CONSTRAINT [FK_Manager_CheckSort_Manager_MonthReport]
GO

CREATE TABLE [dbo].[Manager_HseCost](
	[HseCostId] [nvarchar](50) NOT NULL,
	[MonthReportId] [nvarchar](50) NULL,
	[HseNumber01] [int] NULL,
	[HseNumber02] [int] NULL,
	[HseNumber03] [int] NULL,
	[HseNumber04] [int] NULL,
	[HseNumber05] [int] NULL,
	[HseNumber06] [int] NULL,
	[HseNumber07] [int] NULL,
	[HseNumber08] [int] NULL,
	[HseNumber09] [int] NULL,
	[HseNumber00] [int] NULL,
	[HseNumber10] [decimal](18, 2) NULL,
	[HseNumber11] [decimal](18, 2) NULL,
	[SpecialNumber] [int] NULL,
 CONSTRAINT [PK_Manager_HseCost] PRIMARY KEY CLUSTERED 
(
	[HseCostId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HseCost', @level2type=N'COLUMN',@level2name=N'HseCostId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'月报告' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HseCost', @level2type=N'COLUMN',@level2name=N'MonthReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'月报告HSE技术措施费用表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HseCost'
GO

ALTER TABLE [dbo].[Manager_HseCost]  WITH CHECK ADD  CONSTRAINT [FK_Manager_HseCost_Manager_MonthReport] FOREIGN KEY([MonthReportId])
REFERENCES [dbo].[Manager_MonthReport] ([MonthReportId])
GO

ALTER TABLE [dbo].[Manager_HseCost] CHECK CONSTRAINT [FK_Manager_HseCost_Manager_MonthReport]
GO

CREATE TABLE [dbo].[Manager_IncentiveSort](
	[IncentiveSortId] [nvarchar](50) NOT NULL,
	[MonthReportId] [nvarchar](50) NULL,
	[IncentiveNumber01] [decimal](18, 2) NULL,
	[IncentiveNumber02] [decimal](18, 2) NULL,
	[IncentiveNumber03] [decimal](18, 2) NULL,
	[IncentiveNumber04] [int] NULL,
	[IncentiveNumber05] [int] NULL,
	[IncentiveNumber06] [decimal](18, 2) NULL,
	[IncentiveNumber07] [decimal](18, 2) NULL,
	[IncentiveNumber11] [decimal](18, 2) NULL,
	[IncentiveNumber12] [decimal](18, 2) NULL,
	[IncentiveNumber13] [decimal](18, 2) NULL,
	[IncentiveNumber14] [int] NULL,
	[IncentiveNumber15] [int] NULL,
	[IncentiveNumber16] [decimal](18, 2) NULL,
	[IncentiveNumber17] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Manager_IncentiveSort] PRIMARY KEY CLUSTERED 
(
	[IncentiveSortId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_IncentiveSort', @level2type=N'COLUMN',@level2name=N'IncentiveSortId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'月报告' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_IncentiveSort', @level2type=N'COLUMN',@level2name=N'MonthReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'本月安全个人奖（金额）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_IncentiveSort', @level2type=N'COLUMN',@level2name=N'IncentiveNumber01'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'本月施工单位奖（金额)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_IncentiveSort', @level2type=N'COLUMN',@level2name=N'IncentiveNumber02'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'本月其它' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_IncentiveSort', @level2type=N'COLUMN',@level2name=N'IncentiveNumber03'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'本月通报批评（人/次）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_IncentiveSort', @level2type=N'COLUMN',@level2name=N'IncentiveNumber04'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'本月开除（人/次）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_IncentiveSort', @level2type=N'COLUMN',@level2name=N'IncentiveNumber05'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'本月罚款（金 额）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_IncentiveSort', @level2type=N'COLUMN',@level2name=N'IncentiveNumber06'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'本月其它处罚' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_IncentiveSort', @level2type=N'COLUMN',@level2name=N'IncentiveNumber07'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'累计安全个人奖（金额）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_IncentiveSort', @level2type=N'COLUMN',@level2name=N'IncentiveNumber11'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'累计施工单位奖（金额)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_IncentiveSort', @level2type=N'COLUMN',@level2name=N'IncentiveNumber12'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'累计其它' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_IncentiveSort', @level2type=N'COLUMN',@level2name=N'IncentiveNumber13'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'累计通报批评（人/次）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_IncentiveSort', @level2type=N'COLUMN',@level2name=N'IncentiveNumber14'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'累计开除（人/次）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_IncentiveSort', @level2type=N'COLUMN',@level2name=N'IncentiveNumber15'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'累计罚款（金 额）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_IncentiveSort', @level2type=N'COLUMN',@level2name=N'IncentiveNumber16'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'累计其它处罚' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_IncentiveSort', @level2type=N'COLUMN',@level2name=N'IncentiveNumber17'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'月报告HSE奖惩情况表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_IncentiveSort'
GO

ALTER TABLE [dbo].[Manager_IncentiveSort]  WITH CHECK ADD  CONSTRAINT [FK_Manager_IncentiveSort_Manager_MonthReport] FOREIGN KEY([MonthReportId])
REFERENCES [dbo].[Manager_MonthReport] ([MonthReportId])
GO

ALTER TABLE [dbo].[Manager_IncentiveSort] CHECK CONSTRAINT [FK_Manager_IncentiveSort_Manager_MonthReport]
GO

CREATE TABLE [dbo].[Manager_MeetingSort](
	[MeetingSortId] [nvarchar](50) NOT NULL,
	[MonthReportId] [nvarchar](50) NULL,
	[MeetingNumber01] [int] NULL,
	[MeetingNumber02] [int] NULL,
	[MeetingNumber03] [int] NULL,
	[MeetingNumber04] [int] NULL,
	[MeetingNumber11] [int] NULL,
	[MeetingNumber12] [int] NULL,
	[MeetingNumber13] [int] NULL,
	[MeetingNumber14] [int] NULL,
 CONSTRAINT [PK_Manager_MeetingSort] PRIMARY KEY CLUSTERED 
(
	[MeetingSortId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'本月安全周会次数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MeetingSort', @level2type=N'COLUMN',@level2name=N'MeetingNumber01'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'本月安全月会次数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MeetingSort', @level2type=N'COLUMN',@level2name=N'MeetingNumber02'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'本月专项安全会次数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MeetingSort', @level2type=N'COLUMN',@level2name=N'MeetingNumber03'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'本月其他会议次数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MeetingSort', @level2type=N'COLUMN',@level2name=N'MeetingNumber04'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'累计安全周会次数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MeetingSort', @level2type=N'COLUMN',@level2name=N'MeetingNumber11'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'累计安全月会次数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MeetingSort', @level2type=N'COLUMN',@level2name=N'MeetingNumber12'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'累计专项安全会次数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MeetingSort', @level2type=N'COLUMN',@level2name=N'MeetingNumber13'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'累计其他会议次数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MeetingSort', @level2type=N'COLUMN',@level2name=N'MeetingNumber14'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'月报告HSE会议情况表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MeetingSort'
GO

ALTER TABLE [dbo].[Manager_MeetingSort]  WITH CHECK ADD  CONSTRAINT [FK_Manager_MeetingSort_Manager_MonthReport] FOREIGN KEY([MonthReportId])
REFERENCES [dbo].[Manager_MonthReport] ([MonthReportId])
GO

ALTER TABLE [dbo].[Manager_MeetingSort] CHECK CONSTRAINT [FK_Manager_MeetingSort_Manager_MonthReport]
GO

CREATE TABLE [dbo].[Manager_TrainSort](
	[TrainSortId] [nvarchar](50) NOT NULL,
	[MonthReportId] [nvarchar](50) NULL,
	[TrainTypeId] [nvarchar](50) NULL,
	[TrainNumber11] [int] NULL,
	[TrainNumber12] [int] NULL,
	[TrainNumber13] [int] NULL,
	[TrainNumber14] [int] NULL,
 CONSTRAINT [PK_Manager_TrainSort] PRIMARY KEY CLUSTERED 
(
	[TrainSortId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_TrainSort', @level2type=N'COLUMN',@level2name=N'TrainSortId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'月报告' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_TrainSort', @level2type=N'COLUMN',@level2name=N'MonthReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'培训类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_TrainSort', @level2type=N'COLUMN',@level2name=N'TrainTypeId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'本月入场培训次数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_TrainSort', @level2type=N'COLUMN',@level2name=N'TrainNumber11'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'累计入场次数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_TrainSort', @level2type=N'COLUMN',@level2name=N'TrainNumber12'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'本月入场培训人数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_TrainSort', @level2type=N'COLUMN',@level2name=N'TrainNumber13'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'累计入场人数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_TrainSort', @level2type=N'COLUMN',@level2name=N'TrainNumber14'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'月报告HSE培训情况表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_TrainSort'
GO

ALTER TABLE [dbo].[Manager_TrainSort]  WITH CHECK ADD  CONSTRAINT [FK_Manager_TrainSort_Base_TrainType] FOREIGN KEY([TrainTypeId])
REFERENCES [dbo].[Base_TrainType] ([TrainTypeId])
GO

ALTER TABLE [dbo].[Manager_TrainSort] CHECK CONSTRAINT [FK_Manager_TrainSort_Base_TrainType]
GO

ALTER TABLE [dbo].[Manager_TrainSort]  WITH CHECK ADD  CONSTRAINT [FK_Manager_TrainSort_Manager_MonthReport] FOREIGN KEY([MonthReportId])
REFERENCES [dbo].[Manager_MonthReport] ([MonthReportId])
GO

ALTER TABLE [dbo].[Manager_TrainSort] CHECK CONSTRAINT [FK_Manager_TrainSort_Manager_MonthReport]
GO
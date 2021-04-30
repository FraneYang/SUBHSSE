
INSERT INTO dbo.Sys_Menu(MenuId, MenuName, Url, SortIndex, SuperMenu)
VALUES('3D1CFA31-96A9-496E-9A94-318670C9D658','子公司安全上报','Supervise/SubUnitReport.aspx',40,'A24B7926-EF69-456E-8A24-936D30384680')
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('7075349F-B55F-457E-8EA3-0CBAD0863DB0','3D1CFA31-96A9-496E-9A94-318670C9D658','增加',1)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('12C61C54-D3B3-4B07-AAA9-8B9FAA176E75','3D1CFA31-96A9-496E-9A94-318670C9D658','修改',2)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('CD5B2ADD-36C0-43AC-AB31-4BE79EC4E957','3D1CFA31-96A9-496E-9A94-318670C9D658','删除',3)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('457BE203-8D81-4421-BDFE-75CE47E4DF67','3D1CFA31-96A9-496E-9A94-318670C9D658','保存',4)
GO


CREATE TABLE [dbo].[Supervise_SubUnitReport](
	[SubUnitReportId] [nvarchar](50) NOT NULL,
	[SubUnitReportCode] [nvarchar](50) NULL,
	[SubUnitReportName] [nvarchar](300) NULL,
	[SupSubUnitReportId] [nvarchar](50) NULL,
	[IsEndLever] [bit] NULL,
 CONSTRAINT [PK_Supervise_SubUnitReport] PRIMARY KEY CLUSTERED 
(
	[SubUnitReportId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'子公司上报主表Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supervise_SubUnitReport', @level2type=N'COLUMN',@level2name=N'SubUnitReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supervise_SubUnitReport', @level2type=N'COLUMN',@level2name=N'SubUnitReportCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'上报名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supervise_SubUnitReport', @level2type=N'COLUMN',@level2name=N'SubUnitReportName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'父节点' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supervise_SubUnitReport', @level2type=N'COLUMN',@level2name=N'SupSubUnitReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否末级' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supervise_SubUnitReport', @level2type=N'COLUMN',@level2name=N'IsEndLever'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'子公司安全上报主表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supervise_SubUnitReport'
GO


CREATE TABLE [dbo].[Supervise_SubUnitReportItem](
	[SubUnitReportItemId] [nvarchar](50) NOT NULL,
	[SubUnitReportId] [nvarchar](50) NULL,
	[UnitId] [nvarchar](50) NULL,
	[PlanReortDate] [datetime] NULL,
	[ReportTitle] [nvarchar](500) NULL,
	[ReportContent] [nvarchar](100) NULL,
	[AttachUrl] [nvarchar](2000) NULL,
	[ReportDate] [datetime] NULL,
	[State] [char](1) NULL,
	[UpState] [char](1) NULL,
 CONSTRAINT [PK_Supervise_SubUnitReportItem] PRIMARY KEY CLUSTERED 
(
	[SubUnitReportItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[Supervise_SubUnitReportItem]  WITH CHECK ADD  CONSTRAINT [FK_Supervise_SubUnitReportItem_Base_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[Supervise_SubUnitReportItem] CHECK CONSTRAINT [FK_Supervise_SubUnitReportItem_Base_Unit]
GO

ALTER TABLE [dbo].[Supervise_SubUnitReportItem]  WITH CHECK ADD  CONSTRAINT [FK_Supervise_SubUnitReportItem_Supervise_SubUnitReport] FOREIGN KEY([SubUnitReportId])
REFERENCES [dbo].[Supervise_SubUnitReport] ([SubUnitReportId])
GO

ALTER TABLE [dbo].[Supervise_SubUnitReportItem] CHECK CONSTRAINT [FK_Supervise_SubUnitReportItem_Supervise_SubUnitReport]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'上报明细id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supervise_SubUnitReportItem', @level2type=N'COLUMN',@level2name=N'SubUnitReportItemId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'上报主表主键id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supervise_SubUnitReportItem', @level2type=N'COLUMN',@level2name=N'SubUnitReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'上报单位' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supervise_SubUnitReportItem', @level2type=N'COLUMN',@level2name=N'UnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'要求上报时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supervise_SubUnitReportItem', @level2type=N'COLUMN',@level2name=N'PlanReortDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supervise_SubUnitReportItem', @level2type=N'COLUMN',@level2name=N'ReportTitle'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'明细名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supervise_SubUnitReportItem', @level2type=N'COLUMN',@level2name=N'ReportContent'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'附件' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supervise_SubUnitReportItem', @level2type=N'COLUMN',@level2name=N'AttachUrl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'上报时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supervise_SubUnitReportItem', @level2type=N'COLUMN',@level2name=N'ReportDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'上报状态（0-未催报；1-已催报；2-已上报）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supervise_SubUnitReportItem', @level2type=N'COLUMN',@level2name=N'State'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'子公司安全上报明细表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supervise_SubUnitReportItem'
GO



ALTER VIEW [dbo].[View_ToDoMatter]  AS 
select LawRegulationId as Id,'法律法规' as [Type], LawRegulationName as Name,EffectiveDate as [Date],'~/Law/LawRegulationListAudit.aspx' as Url,'' as UserId  from dbo.Law_LawRegulationList 
where IsPass is null
union
select StandardId,'标准规范', StandardName,CompileDate,'~/Law/HSSEStandardListAudit.aspx','' from dbo.Law_HSSEStandardsList 
where IsPass is null
union
select RulesRegulationsId,'规章制度', RulesRegulationsName,CustomDate,'~/Law/RulesRegulationsAudit.aspx','' from dbo.Law_RulesRegulations 
where IsPass is null
union
select ManageRuleId,'管理规定', ManageRuleName,CompileDate,'~/Law/ManageRuleAudit.aspx','' from dbo.Law_ManageRule 
where IsPass is null
union
select TrainingItemId,'培训教材', TrainingItemName,CompileDate,'~/EduTrain/TrainDBAudit.aspx','' from dbo.Training_TrainingItem 
where IsPass is null
union
select TrainTestItemId,'安全试题', TraiinTestItemName,CompileDate,'~/EduTrain/TrainTestDBAudit.aspx','' from dbo.Training_TrainTestDBItem 
where IsPass is null
union
select AccidentCaseItemId,'事故案例', AccidentName,CompileDate,'~/EduTrain/AccidentCaseAudit.aspx','' from dbo.EduTrain_AccidentCaseItem 
where IsPass is null
union
select KnowledgeItemId,'应知应会', KnowledgeItemName,CompileDate,'~/EduTrain/KnowledgeDBAudit.aspx','' from dbo.Training_KnowledgeItem 
where IsPass is null
union
select HazardId,'危险源', HazardItems,CompileDate,'~/Technique/HazardListAudit.aspx','' from dbo.Technique_HazardList 
where IsPass is null
union
select RectifyItemId,'安全隐患', HazardSourcePoint,CompileDate,'~/Technique/RectifyAudit.aspx','' from dbo.Technique_RectifyItem 
where IsPass is null
union
select HAZOPId,'HAZOP', HAZOPTitle,CompileDate,'~/Technique/HAZOPAudit.aspx','' from dbo.Technique_HAZOP 
where IsPass is null
union
select ExpertId,'安全专家', ExpertName,CompileDate,'~/Technique/ExpertAudit.aspx','' from dbo.Technique_Expert 
where IsPass is null
union
select EmergencyId,'应急预案', EmergencyName,CompileDate,'~/Technique/EmergencyAudit.aspx','' from dbo.Technique_Emergency 
where IsPass is null
union
select SpecialSchemeId,'专项方案', SpecialSchemeName,CompileDate,'~/Technique/SpecialSchemeAudit.aspx','' from dbo.Technique_SpecialScheme 
where IsPass is null
union
select UrgeReportId
,'催报信息'
,(CASE WHEN UrgeReport.ReprotType ='1' THEN (Const0008.ConstText+Const0009.ConstText) +'百万工时安全统计月报'
WHEN UrgeReport.ReprotType ='2' THEN  (Const0008.ConstText+Const0009.ConstText) + '职工伤亡事故原因分析报'
WHEN UrgeReport.ReprotType ='3' THEN (Const0008.ConstText+Const0011.ConstText)+'安全生产数据季报'
WHEN UrgeReport.ReprotType ='4' THEN (Const0008.ConstText+Const0011.ConstText)+'应急演练开展情况季报'
WHEN UrgeReport.ReprotType ='5' THEN (Const0008.ConstText+Const0010.ConstText)+ '应急演练工作计划半年报' END) AS Name 
,UrgeDate
,(CASE WHEN UrgeReport.ReprotType ='1' THEN '~/Information/MillionsMonthlyReportSave.aspx'
WHEN UrgeReport.ReprotType ='2' THEN '~/Information/AccidentCauseReportSave.aspx'
WHEN UrgeReport.ReprotType ='3' THEN '~/Information/SafetyQuarterlyReportEdit.aspx'
WHEN UrgeReport.ReprotType ='4' THEN '~/Information/DrillConductedQuarterlyReportAdd.aspx'
WHEN UrgeReport.ReprotType ='5' THEN '~/Information/DrillPlanHalfYearReportAdd.aspx' END) AS url,''
FROM dbo.Information_UrgeReport AS UrgeReport
LEFT JOIN Sys_Const AS Const0008 ON UrgeReport.YearId =Const0008.ConstValue AND Const0008.GroupId='0008'
LEFT JOIN Sys_Const AS Const0009 ON UrgeReport.MonthId =Const0009.ConstValue AND Const0009.GroupId='0009'
LEFT JOIN Sys_Const AS Const0010 ON UrgeReport.HalfYearId =Const0010.ConstValue AND Const0010.GroupId='0010'
LEFT JOIN Sys_Const AS Const0011 ON UrgeReport.QuarterId =Const0011.ConstValue AND Const0011.GroupId='0011'
where (UrgeReport.IsComplete is null or UrgeReport.IsComplete =0) AND (UrgeReport.IsCancel is null or UrgeReport.IsCancel =0)
union
select MillionsMonthlyReportId,'月报', '百万工时安全统计月报表'+(ISNULL(Group_0008.ConstText,'-') + ISNULL(Group_0009.ConstText,'-'))+(case HandleState when '2' then '待审核' when '3' then '待审批' when '4' then '待上报' end),FillingDate,'~/Information/MillionsMonthlyReportSave.aspx?MillionsMonthlyReportId='+MillionsMonthlyReportId,HandleMan from dbo.Information_MillionsMonthlyReport Report
LEFT JOIN Sys_Const  AS Group_0008 ON Group_0008.GroupId='0008' AND Group_0008.ConstValue =Report.[Year]
LEFT JOIN Sys_Const  AS Group_0009 ON Group_0009.GroupId='0009' AND Group_0009.ConstValue =Report.[Month]
where (HandleState='2' or HandleState='3' or HandleState='4') and UpState <> '3'
union
select AccidentCauseReportId,'月报', '职工伤亡事故原因分析报表'+(ISNULL(Group_0008.ConstText,'-') + ISNULL(Group_0009.ConstText,'-'))+(case HandleState when '2' then '待审核' when '3' then '待审批' when '4' then '待上报' end),FillingDate,'~/Information/AccidentCauseReportSave.aspx?AccidentCauseReportId='+AccidentCauseReportId,HandleMan from dbo.Information_AccidentCauseReport Report
LEFT JOIN Sys_Const  AS Group_0008 ON Group_0008.GroupId='0008' AND Group_0008.ConstValue =Report.[Year]
LEFT JOIN Sys_Const  AS Group_0009 ON Group_0009.GroupId='0009' AND Group_0009.ConstValue =Report.[Month]
where (HandleState='2' or HandleState='3' or HandleState='4') and UpState <> '3'
union
select SafetyQuarterlyReportId,'季报', '安全生产数据季报'+(ISNULL(Group_0008.ConstText,'-') + ISNULL(Group_0011.ConstText,'-'))+(case HandleState when '2' then '待审核' when '3' then '待审批' when '4' then '待上报' end),FillingDate,'~/Information/SafetyQuarterlyReportEdit.aspx?SafetyQuarterlyReportId='+SafetyQuarterlyReportId,HandleMan from dbo.Information_SafetyQuarterlyReport Report
LEFT JOIN Sys_Const  AS Group_0008 ON Group_0008.GroupId='0008' AND Group_0008.ConstValue =Report.YearId
LEFT JOIN Sys_Const  AS Group_0011 ON Group_0011.GroupId='0011' AND Group_0011.ConstValue =Report.Quarters
where (HandleState='2' or HandleState='3' or HandleState='4') and UpState <> '3'
union
select DrillConductedQuarterlyReportId,'季报', '应急演练开展情况季报表'+(ISNULL(Group_0008.ConstText,'-') + ISNULL(Group_0011.ConstText,'-'))+(case HandleState when '2' then '待审核' when '3' then '待审批' when '4' then '待上报' end),ReportDate,'~/Information/DrillConductedQuarterlyReportAdd.aspx?DrillConductedQuarterlyReportId='+DrillConductedQuarterlyReportId,HandleMan from dbo.Information_DrillConductedQuarterlyReport Report
LEFT JOIN Sys_Const  AS Group_0008 ON Group_0008.GroupId='0008' AND Group_0008.ConstValue =Report.YearId
LEFT JOIN Sys_Const  AS Group_0011 ON Group_0011.GroupId='0011' AND Group_0011.ConstValue =Report.[Quarter]
where (HandleState='2' or HandleState='3' or HandleState='4') and UpState <> '3'
union
select DrillPlanHalfYearReportId,'半年报', '应急演练工作计划半年报表'+(ISNULL(Group_0008.ConstText,'-') + ISNULL(Group_0010.ConstText,'-'))+(case HandleState when '2' then '待审核' when '3' then '待审批' when '4' then '待上报' end),CompileDate,'~/Information/DrillPlanHalfYearReportAdd.aspx?DrillPlanHalfYearReportId='+DrillPlanHalfYearReportId,HandleMan from dbo.Information_DrillPlanHalfYearReport Report
LEFT JOIN Sys_Const  AS Group_0008 ON Group_0008.GroupId='0008' AND Group_0008.ConstValue =Report.YearId
LEFT JOIN Sys_Const  AS Group_0010 ON Group_0010.GroupId='0010' AND Group_0010.ConstValue =Report.HalfYearId
where (HandleState='2' or HandleState='3' or HandleState='4') and UpState <> '3'
UNION
SELECT ReportItem.SubUnitReportItemId
,'子公司安全上报'
,(Unit.UnitName+'：'+Report.SubUnitReportName+'，未上报要求上报时间'+ CONVERT(varchar(100), ReportItem.PlanReortDate, 23)) AS SubUnitReportName
,ReportItem.PlanReortDate
,'~/Supervise/SubUnitReport.aspx' AS Url ,''
FROM dbo.Supervise_SubUnitReportItem AS ReportItem
LEFT JOIN dbo.Supervise_SubUnitReport AS Report ON ReportItem.SubUnitReportId =Report.SubUnitReportId
LEFT JOIN dbo.Base_Unit AS Unit ON ReportItem.UnitId =Unit.UnitId
WHERE (UpState <> '3' OR UpState IS NULL) 





GO






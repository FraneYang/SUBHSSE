ALTER VIEW [dbo].[View_ToDoMatter]
AS
/*待办事项视图*/ 
SELECT LawRegulationId AS Id,'法律法规' AS [Type], LawRegulationName AS Name,EffectiveDate AS [Date],'~/Law/LawRegulationListAudit.aspx' AS Url,'' AS UserId 
FROM dbo.Law_LawRegulationList 
WHERE IsPass is null
UNION
SELECT StandardId,'标准规范', StandardName,CompileDate,'~/Law/HSSEStandardListAudit.aspx','' 
FROM dbo.Law_HSSEStandardsList 
WHERE IsPass is null
UNION
SELECT RulesRegulationsId,'规章制度', RulesRegulationsName,CustomDate,'~/Law/RulesRegulationsAudit.aspx','' FROM dbo.Law_RulesRegulations 
WHERE IsPass is null
UNION
SELECT ManageRuleId,'管理规定', ManageRuleName,CompileDate,'~/Law/ManageRuleAudit.aspx','' 
FROM dbo.Law_ManageRule 
WHERE IsPass is null
UNION
SELECT TrainingItemId,'培训教材', TrainingItemName,CompileDate,'~/EduTrain/TrainDBAudit.aspx','' 
FROM dbo.Training_TrainingItem 
WHERE IsPass is null
UNION
SELECT TrainTestItemId,'安全试题', TraiinTestItemName,CompileDate,'~/EduTrain/TrainTestDBAudit.aspx','' 
FROM dbo.Training_TrainTestDBItem 
WHERE IsPass is null
UNION
SELECT AccidentCaseItemId,'事故案例', AccidentName,CompileDate,'~/EduTrain/AccidentCaseAudit.aspx','' 
FROM dbo.EduTrain_AccidentCaseItem 
WHERE IsPass is null
UNION
SELECT KnowledgeItemId,'应知应会', KnowledgeItemName,CompileDate,'~/EduTrain/KnowledgeDBAudit.aspx','' 
FROM dbo.Training_KnowledgeItem 
WHERE IsPass is null
UNION
SELECT HazardId,'危险源', HazardItems,CompileDate,'~/Technique/HazardListAudit.aspx','' 
FROM dbo.Technique_HazardList 
WHERE IsPass is null
UNION
SELECT RectifyItemId,'安全隐患', HazardSourcePoint,CompileDate,'~/Technique/RectifyAudit.aspx','' 
FROM dbo.Technique_RectifyItem 
WHERE IsPass is null
UNION
SELECT HAZOPId,'HAZOP', HAZOPTitle,CompileDate,'~/Technique/HAZOPAudit.aspx','' 
FROM dbo.Technique_HAZOP 
WHERE IsPass is null
UNION
SELECT ExpertId,'安全专家', ExpertName,CompileDate,'~/Technique/ExpertAudit.aspx','' 
FROM dbo.Technique_Expert 
WHERE IsPass is null
UNION
SELECT EmergencyId,'应急预案', EmergencyName,CompileDate,'~/Technique/EmergencyAudit.aspx','' 
FROM dbo.Technique_Emergency 
WHERE IsPass is null
UNION
SELECT SpecialSchemeId,'专项方案', SpecialSchemeName,CompileDate,'~/Technique/SpecialSchemeAudit.aspx','' 
FROM dbo.Technique_SpecialScheme 
WHERE IsPass is null
UNION
SELECT UrgeReportId
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
WHERE (UrgeReport.IsComplete is null or UrgeReport.IsComplete =0) AND (UrgeReport.IsCancel is null or UrgeReport.IsCancel =0)
UNION
SELECT MillionsMonthlyReportId,'月报', '百万工时安全统计月报表'+(ISNULL(Group_0008.ConstText,'-') + ISNULL(Group_0009.ConstText,'-'))+(case HandleState when '2' then '待处理' when '3' then '待处理' when '4' then '待上报' end),FillingDate,'~/Information/MillionsMonthlyReportSave.aspx?MillionsMonthlyReportId='+MillionsMonthlyReportId,HandleMan FROM dbo.Information_MillionsMonthlyReport Report
LEFT JOIN Sys_Const  AS Group_0008 ON Group_0008.GroupId='0008' AND Group_0008.ConstValue =Report.[Year]
LEFT JOIN Sys_Const  AS Group_0009 ON Group_0009.GroupId='0009' AND Group_0009.ConstValue =Report.[Month]
WHERE (HandleState='2' or HandleState='3' or HandleState='4') and UpState <> '3'
UNION
SELECT AccidentCauseReportId,'月报', '职工伤亡事故原因分析报表'+(ISNULL(Group_0008.ConstText,'-') + ISNULL(Group_0009.ConstText,'-'))+(case HandleState when '2' then '待处理' when '3' then '待处理' when '4' then '待上报' end),FillingDate,'~/Information/AccidentCauseReportSave.aspx?AccidentCauseReportId='+AccidentCauseReportId,HandleMan FROM dbo.Information_AccidentCauseReport Report
LEFT JOIN Sys_Const  AS Group_0008 ON Group_0008.GroupId='0008' AND Group_0008.ConstValue =Report.[Year]
LEFT JOIN Sys_Const  AS Group_0009 ON Group_0009.GroupId='0009' AND Group_0009.ConstValue =Report.[Month]
WHERE (HandleState='2' or HandleState='3' or HandleState='4') and UpState <> '3'
UNION
SELECT SafetyQuarterlyReportId,'季报', '安全生产数据季报'+(ISNULL(Group_0008.ConstText,'-') + ISNULL(Group_0011.ConstText,'-'))+(case HandleState when '2' then '待处理' when '3' then '待处理' when '4' then '待上报' end),FillingDate,'~/Information/SafetyQuarterlyReportEdit.aspx?SafetyQuarterlyReportId='+SafetyQuarterlyReportId,HandleMan FROM dbo.Information_SafetyQuarterlyReport Report
LEFT JOIN Sys_Const  AS Group_0008 ON Group_0008.GroupId='0008' AND Group_0008.ConstValue =Report.YearId
LEFT JOIN Sys_Const  AS Group_0011 ON Group_0011.GroupId='0011' AND Group_0011.ConstValue =Report.Quarters
WHERE (HandleState='2' or HandleState='3' or HandleState='4') and UpState <> '3'
UNION
SELECT DrillConductedQuarterlyReportId,'季报', '应急演练开展情况季报表'+(ISNULL(Group_0008.ConstText,'-') + ISNULL(Group_0011.ConstText,'-'))+(case HandleState when '2' then '待处理' when '3' then '待处理' when '4' then '待上报' end),ReportDate,'~/Information/DrillConductedQuarterlyReportAdd.aspx?DrillConductedQuarterlyReportId='+DrillConductedQuarterlyReportId,HandleMan FROM dbo.Information_DrillConductedQuarterlyReport Report
LEFT JOIN Sys_Const  AS Group_0008 ON Group_0008.GroupId='0008' AND Group_0008.ConstValue =Report.YearId
LEFT JOIN Sys_Const  AS Group_0011 ON Group_0011.GroupId='0011' AND Group_0011.ConstValue =Report.[Quarter]
WHERE (HandleState='2' or HandleState='3' or HandleState='4') and UpState <> '3'
UNION
SELECT DrillPlanHalfYearReportId,'半年报', '应急演练工作计划半年报表'+(ISNULL(Group_0008.ConstText,'-') + ISNULL(Group_0010.ConstText,'-'))+(case HandleState when '2' then '待处理' when '3' then '待处理' when '4' then '待上报' end),CompileDate,'~/Information/DrillPlanHalfYearReportAdd.aspx?DrillPlanHalfYearReportId='+DrillPlanHalfYearReportId,HandleMan FROM dbo.Information_DrillPlanHalfYearReport Report
LEFT JOIN Sys_Const  AS Group_0008 ON Group_0008.GroupId='0008' AND Group_0008.ConstValue =Report.YearId
LEFT JOIN Sys_Const  AS Group_0010 ON Group_0010.GroupId='0010' AND Group_0010.ConstValue =Report.HalfYearId
WHERE (HandleState='2' or HandleState='3' or HandleState='4') and UpState <> '3'

UNION
SELECT ReportItem.SubUnitReportItemId
,'企业安全上报'
,(ISNULL(Unit.UnitName,'')+'：'+ISNULL(Report.SubUnitReportName,'')+'，未上报要求上报时间'+ CONVERT(varchar(100), ISNULL(ReportItem.PlanReortDate,''), 23)) AS SubUnitReportName
,ReportItem.PlanReortDate
,'~/Supervise/SubUnitReport.aspx' AS Url ,''
FROM dbo.Supervise_SubUnitReportItem AS ReportItem
LEFT JOIN dbo.Supervise_SubUnitReport AS Report ON ReportItem.SubUnitReportId =Report.SubUnitReportId
LEFT JOIN dbo.Base_Unit AS Unit ON ReportItem.UnitId =Unit.UnitId
WHERE ReportItem.PlanReortDate IS NOT NULL AND (UpState <> '3' OR UpState IS NULL) 

GO

alter table dbo.OccupationHealth_HazardDetection add ProjectId nvarchar(50) null
alter table dbo.OccupationHealth_HazardDetection add States char(1) null
alter table dbo.OccupationHealth_OccupationalDiseaseAccident add ProjectId nvarchar(50) null
alter table dbo.OccupationHealth_OccupationalDiseaseAccident add States char(1) null
alter table dbo.OccupationHealth_PhysicalExamination add ProjectId nvarchar(50) null
alter table dbo.OccupationHealth_PhysicalExamination add States char(1) null
alter table dbo.Environmental_EIAReport add ProjectId nvarchar(50) null
alter table dbo.Environmental_EIAReport add States char(1) null
alter table dbo.Environmental_EnvironmentalEmergencyPlan add ProjectId nvarchar(50) null
alter table dbo.Environmental_EnvironmentalEmergencyPlan add States char(1) null
alter table dbo.Environmental_EnvironmentalMonitoring add ProjectId nvarchar(50) null
alter table dbo.Environmental_EnvironmentalMonitoring add States char(1) null
alter table dbo.Environmental_UnexpectedEnvironmental add ProjectId nvarchar(50) null
alter table dbo.Environmental_UnexpectedEnvironmental add States char(1) null
GO



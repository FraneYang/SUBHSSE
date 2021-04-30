ALTER VIEW [dbo].[View_ToDoMatter]
AS
/*����������ͼ*/ 
SELECT LawRegulationId AS Id,'���ɷ���' AS [Type], LawRegulationName AS Name,EffectiveDate AS [Date],'~/Law/LawRegulationListAudit.aspx' AS Url,'' AS UserId 
FROM dbo.Law_LawRegulationList 
WHERE IsPass is null
UNION
SELECT StandardId,'��׼�淶', StandardName,CompileDate,'~/Law/HSSEStandardListAudit.aspx','' 
FROM dbo.Law_HSSEStandardsList 
WHERE IsPass is null
UNION
SELECT RulesRegulationsId,'�����ƶ�', RulesRegulationsName,CustomDate,'~/Law/RulesRegulationsAudit.aspx','' FROM dbo.Law_RulesRegulations 
WHERE IsPass is null
UNION
SELECT ManageRuleId,'����涨', ManageRuleName,CompileDate,'~/Law/ManageRuleAudit.aspx','' 
FROM dbo.Law_ManageRule 
WHERE IsPass is null
UNION
SELECT TrainingItemId,'��ѵ�̲�', TrainingItemName,CompileDate,'~/EduTrain/TrainDBAudit.aspx','' 
FROM dbo.Training_TrainingItem 
WHERE IsPass is null
UNION
SELECT TrainTestItemId,'��ȫ����', TraiinTestItemName,CompileDate,'~/EduTrain/TrainTestDBAudit.aspx','' 
FROM dbo.Training_TrainTestDBItem 
WHERE IsPass is null
UNION
SELECT AccidentCaseItemId,'�¹ʰ���', AccidentName,CompileDate,'~/EduTrain/AccidentCaseAudit.aspx','' 
FROM dbo.EduTrain_AccidentCaseItem 
WHERE IsPass is null
UNION
SELECT KnowledgeItemId,'Ӧ֪Ӧ��', KnowledgeItemName,CompileDate,'~/EduTrain/KnowledgeDBAudit.aspx','' 
FROM dbo.Training_KnowledgeItem 
WHERE IsPass is null
UNION
SELECT HazardId,'Σ��Դ', HazardItems,CompileDate,'~/Technique/HazardListAudit.aspx','' 
FROM dbo.Technique_HazardList 
WHERE IsPass is null
UNION
SELECT RectifyItemId,'��ȫ����', HazardSourcePoint,CompileDate,'~/Technique/RectifyAudit.aspx','' 
FROM dbo.Technique_RectifyItem 
WHERE IsPass is null
UNION
SELECT HAZOPId,'HAZOP', HAZOPTitle,CompileDate,'~/Technique/HAZOPAudit.aspx','' 
FROM dbo.Technique_HAZOP 
WHERE IsPass is null
UNION
SELECT ExpertId,'��ȫר��', ExpertName,CompileDate,'~/Technique/ExpertAudit.aspx','' 
FROM dbo.Technique_Expert 
WHERE IsPass is null
UNION
SELECT EmergencyId,'Ӧ��Ԥ��', EmergencyName,CompileDate,'~/Technique/EmergencyAudit.aspx','' 
FROM dbo.Technique_Emergency 
WHERE IsPass is null
UNION
SELECT SpecialSchemeId,'ר���', SpecialSchemeName,CompileDate,'~/Technique/SpecialSchemeAudit.aspx','' 
FROM dbo.Technique_SpecialScheme 
WHERE IsPass is null
UNION
SELECT UrgeReportId
,'�߱���Ϣ'
,(CASE WHEN UrgeReport.ReprotType ='1' THEN (Const0008.ConstText+Const0009.ConstText) +'����ʱ��ȫͳ���±�'
WHEN UrgeReport.ReprotType ='2' THEN  (Const0008.ConstText+Const0009.ConstText) + 'ְ�������¹�ԭ�������'
WHEN UrgeReport.ReprotType ='3' THEN (Const0008.ConstText+Const0011.ConstText)+'��ȫ�������ݼ���'
WHEN UrgeReport.ReprotType ='4' THEN (Const0008.ConstText+Const0011.ConstText)+'Ӧ��������չ�������'
WHEN UrgeReport.ReprotType ='5' THEN (Const0008.ConstText+Const0010.ConstText)+ 'Ӧ�����������ƻ����걨' END) AS Name 
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
SELECT MillionsMonthlyReportId,'�±�', '����ʱ��ȫͳ���±���'+(ISNULL(Group_0008.ConstText,'-') + ISNULL(Group_0009.ConstText,'-'))+(case HandleState when '2' then '������' when '3' then '������' when '4' then '���ϱ�' end),FillingDate,'~/Information/MillionsMonthlyReportSave.aspx?MillionsMonthlyReportId='+MillionsMonthlyReportId,HandleMan FROM dbo.Information_MillionsMonthlyReport Report
LEFT JOIN Sys_Const  AS Group_0008 ON Group_0008.GroupId='0008' AND Group_0008.ConstValue =Report.[Year]
LEFT JOIN Sys_Const  AS Group_0009 ON Group_0009.GroupId='0009' AND Group_0009.ConstValue =Report.[Month]
WHERE (HandleState='2' or HandleState='3' or HandleState='4') and UpState <> '3'
UNION
SELECT AccidentCauseReportId,'�±�', 'ְ�������¹�ԭ���������'+(ISNULL(Group_0008.ConstText,'-') + ISNULL(Group_0009.ConstText,'-'))+(case HandleState when '2' then '������' when '3' then '������' when '4' then '���ϱ�' end),FillingDate,'~/Information/AccidentCauseReportSave.aspx?AccidentCauseReportId='+AccidentCauseReportId,HandleMan FROM dbo.Information_AccidentCauseReport Report
LEFT JOIN Sys_Const  AS Group_0008 ON Group_0008.GroupId='0008' AND Group_0008.ConstValue =Report.[Year]
LEFT JOIN Sys_Const  AS Group_0009 ON Group_0009.GroupId='0009' AND Group_0009.ConstValue =Report.[Month]
WHERE (HandleState='2' or HandleState='3' or HandleState='4') and UpState <> '3'
UNION
SELECT SafetyQuarterlyReportId,'����', '��ȫ�������ݼ���'+(ISNULL(Group_0008.ConstText,'-') + ISNULL(Group_0011.ConstText,'-'))+(case HandleState when '2' then '������' when '3' then '������' when '4' then '���ϱ�' end),FillingDate,'~/Information/SafetyQuarterlyReportEdit.aspx?SafetyQuarterlyReportId='+SafetyQuarterlyReportId,HandleMan FROM dbo.Information_SafetyQuarterlyReport Report
LEFT JOIN Sys_Const  AS Group_0008 ON Group_0008.GroupId='0008' AND Group_0008.ConstValue =Report.YearId
LEFT JOIN Sys_Const  AS Group_0011 ON Group_0011.GroupId='0011' AND Group_0011.ConstValue =Report.Quarters
WHERE (HandleState='2' or HandleState='3' or HandleState='4') and UpState <> '3'
UNION
SELECT DrillConductedQuarterlyReportId,'����', 'Ӧ��������չ���������'+(ISNULL(Group_0008.ConstText,'-') + ISNULL(Group_0011.ConstText,'-'))+(case HandleState when '2' then '������' when '3' then '������' when '4' then '���ϱ�' end),ReportDate,'~/Information/DrillConductedQuarterlyReportAdd.aspx?DrillConductedQuarterlyReportId='+DrillConductedQuarterlyReportId,HandleMan FROM dbo.Information_DrillConductedQuarterlyReport Report
LEFT JOIN Sys_Const  AS Group_0008 ON Group_0008.GroupId='0008' AND Group_0008.ConstValue =Report.YearId
LEFT JOIN Sys_Const  AS Group_0011 ON Group_0011.GroupId='0011' AND Group_0011.ConstValue =Report.[Quarter]
WHERE (HandleState='2' or HandleState='3' or HandleState='4') and UpState <> '3'
UNION
SELECT DrillPlanHalfYearReportId,'���걨', 'Ӧ�����������ƻ����걨��'+(ISNULL(Group_0008.ConstText,'-') + ISNULL(Group_0010.ConstText,'-'))+(case HandleState when '2' then '������' when '3' then '������' when '4' then '���ϱ�' end),CompileDate,'~/Information/DrillPlanHalfYearReportAdd.aspx?DrillPlanHalfYearReportId='+DrillPlanHalfYearReportId,HandleMan FROM dbo.Information_DrillPlanHalfYearReport Report
LEFT JOIN Sys_Const  AS Group_0008 ON Group_0008.GroupId='0008' AND Group_0008.ConstValue =Report.YearId
LEFT JOIN Sys_Const  AS Group_0010 ON Group_0010.GroupId='0010' AND Group_0010.ConstValue =Report.HalfYearId
WHERE (HandleState='2' or HandleState='3' or HandleState='4') and UpState <> '3'

UNION
SELECT ReportItem.SubUnitReportItemId
,'��ҵ��ȫ�ϱ�'
,(ISNULL(Unit.UnitName,'')+'��'+ISNULL(Report.SubUnitReportName,'')+'��δ�ϱ�Ҫ���ϱ�ʱ��'+ CONVERT(varchar(100), ISNULL(ReportItem.PlanReortDate,''), 23)) AS SubUnitReportName
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



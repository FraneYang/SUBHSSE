ALTER TABLE [dbo].[Law_HSSEStandardsList] ADD IsSelected24 BIT NULL
ALTER TABLE [dbo].[Law_HSSEStandardsList] ADD IsSelected25 BIT NULL

GO





---��׼�淶�б�
ALTER VIEW [dbo].[View_HSSEStandardsList]
AS
/*��Ա�б���ͼ*/
select
	hsl.StandardId
	,hsl.StandardGrade
	,hsl.StandardNo
	,hsl.StandardName
	,hsl.TypeId
	,hslt.TypeCode
	,hslt.TypeName
	,hsl.AttachUrl
	,hsl.IsSelected1
	,hsl.IsSelected2
	,hsl.IsSelected3
	,hsl.IsSelected4
	,hsl.IsSelected5
	,hsl.IsSelected6
	,hsl.IsSelected7
	,hsl.IsSelected8
	,hsl.IsSelected9
	,hsl.IsSelected10
	,hsl.IsSelected11
	,hsl.IsSelected12
	,hsl.IsSelected13
	,hsl.IsSelected14
	,hsl.IsSelected15
	,hsl.IsSelected16
	,hsl.IsSelected17
	,hsl.IsSelected18
	,hsl.IsSelected19
	,hsl.IsSelected20
	,hsl.IsSelected21
	,hsl.IsSelected22
	,hsl.IsSelected23
	,hsl.IsSelected24
	,hsl.IsSelected25
	,hsl.IsSelected90
	,hsl.CompileMan
	,hsl.CompileDate
	,hsl.IsPass
	,hsl.UnitId
	,hsl.UpState
	,hsl.IsBuild
	,Substring(hsl.AttachUrl,charindex('~',hsl.AttachUrl)+1,LEN(hsl.AttachUrl)) as  AttachUrlName
	,(CASE WHEN hsl.UpState='1' THEN '����λ' WHEN hsl.UpState='2' THEN '���ϱ�' when hsl.UpState='3' then '���ϱ�' when hsl.UpState='4' then '�ϱ�ʧ��' end) as UpStates
	,(CASE WHEN IsBuild = 1 THEN '����' ELSE '' END ) AS IsBuildName
	,ConstUpState.ConstText AS UpStateName
from Law_HSSEStandardsList as hsl
LEFT JOIN Base_HSSEStandardListType AS hslt ON hslt.TypeId = hsl.TypeId
LEFT JOIN Sys_Const AS ConstUpState ON hsl.UpState=ConstUpState.ConstValue and ConstUpState.GroupId='UpState'



go



CREATE TABLE [dbo].[ProjectData_FlowOperate](
	[FlowOperateId] [nvarchar](50) NOT NULL,
	[MenuId] [nvarchar](50) NULL,
	[DataId] [nvarchar](50) NULL,
	[SortIndex] [int] NULL,
	[OperaterId] [nvarchar](50) NULL,
	[OperaterTime] [datetime] NULL,
	[State] [char](1) NULL,
	[Opinion] [nvarchar](1000) NULL,
	[IsClosed] [bit] NULL,
 CONSTRAINT [PK_ProjectData_FlowOperate] PRIMARY KEY CLUSTERED 
(
	[FlowOperateId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���̲���id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectData_FlowOperate', @level2type=N'COLUMN',@level2name=N'FlowOperateId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�˵�id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectData_FlowOperate', @level2type=N'COLUMN',@level2name=N'MenuId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���ݼ�¼id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectData_FlowOperate', @level2type=N'COLUMN',@level2name=N'DataId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectData_FlowOperate', @level2type=N'COLUMN',@level2name=N'OperaterId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectData_FlowOperate', @level2type=N'COLUMN',@level2name=N'OperaterTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1-��һ����2-�����ɣ�3-�����롣' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectData_FlowOperate', @level2type=N'COLUMN',@level2name=N'State'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectData_FlowOperate', @level2type=N'COLUMN',@level2name=N'Opinion'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����Ƿ�ر�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectData_FlowOperate', @level2type=N'COLUMN',@level2name=N'IsClosed'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��Ŀ����������˲�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectData_FlowOperate'
GO

ALTER TABLE [dbo].[ProjectData_FlowOperate]  WITH CHECK ADD  CONSTRAINT [FK_ProjectData_FlowOperate_Sys_Menu] FOREIGN KEY([MenuId])
REFERENCES [dbo].[Sys_Menu] ([MenuId])
GO

ALTER TABLE [dbo].[ProjectData_FlowOperate] CHECK CONSTRAINT [FK_ProjectData_FlowOperate_Sys_Menu]
GO

ALTER TABLE [dbo].[ProjectData_FlowOperate]  WITH CHECK ADD  CONSTRAINT [FK_ProjectData_FlowOperate_Sys_User] FOREIGN KEY([OperaterId])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[ProjectData_FlowOperate] CHECK CONSTRAINT [FK_ProjectData_FlowOperate_Sys_User]
GO

















CREATE VIEW [dbo].[View_ProjectData_FlowOperate]  AS 
/*��Ŀ����������ͼ*/
SELECT 
	flowOperate.FlowOperateId
	,flowOperate.MenuId
	,flowOperate.DataId
	,flowOperate.SortIndex
	,flowOperate.OperaterId
	,flowOperate.OperaterTime
	,flowOperate.State
	,flowOperate.Opinion
	,flowOperate.IsClosed
	,Menu.MenuName	
	,Users.UserName AS OperaterName	
	,Unit.UnitId
	,Unit.UnitName
	,(CASE WHEN flowOperate.State ='2' and flowOperate.IsClosed=1 THEN '�ϱ�'
	    WHEN flowOperate.State ='2' and flowOperate.IsClosed=0 THEN '����'
	    WHEN flowOperate.State ='1' and flowOperate.IsClosed=1 THEN '���'
		ELSE '����' END) AS StateName
FROM dbo.ProjectData_FlowOperate AS flowOperate
LEFT JOIN dbo.Sys_Menu AS Menu ON Menu.MenuId =flowOperate.MenuId
LEFT JOIN dbo.Sys_User AS Users ON Users.UserId =flowOperate.OperaterId
LEFT JOIN dbo.Base_Unit AS Unit ON Unit.UnitId =Users.UnitId



GO
ALTER VIEW [dbo].[View_ToDoMatter]  AS 
select LawRegulationId as Id,'���ɷ���' as [Type], LawRegulationName as Name,EffectiveDate as [Date],'~/Law/LawRegulationListAudit.aspx' as Url,'' as UserId  from dbo.Law_LawRegulationList 
where IsPass is null
union
select StandardId,'��׼�淶', StandardName,CompileDate,'~/Law/HSSEStandardListAudit.aspx','' from dbo.Law_HSSEStandardsList 
where IsPass is null
union
select RulesRegulationsId,'�����ƶ�', RulesRegulationsName,CustomDate,'~/Law/RulesRegulationsAudit.aspx','' from dbo.Law_RulesRegulations 
where IsPass is null
union
select ManageRuleId,'����涨', ManageRuleName,CompileDate,'~/Law/ManageRuleAudit.aspx','' from dbo.Law_ManageRule 
where IsPass is null
union
select TrainingItemId,'��ѵ�̲�', TrainingItemName,CompileDate,'~/EduTrain/TrainDBAudit.aspx','' from dbo.Training_TrainingItem 
where IsPass is null
union
select TrainTestItemId,'��ȫ����', TraiinTestItemName,CompileDate,'~/EduTrain/TrainTestDBAudit.aspx','' from dbo.Training_TrainTestDBItem 
where IsPass is null
union
select AccidentCaseItemId,'�¹ʰ���', AccidentName,CompileDate,'~/EduTrain/AccidentCaseAudit.aspx','' from dbo.EduTrain_AccidentCaseItem 
where IsPass is null
union
select KnowledgeItemId,'Ӧ֪Ӧ��', KnowledgeItemName,CompileDate,'~/EduTrain/KnowledgeDBAudit.aspx','' from dbo.Training_KnowledgeItem 
where IsPass is null
union
select HazardId,'Σ��Դ', HazardItems,CompileDate,'~/Technique/HazardListAudit.aspx','' from dbo.Technique_HazardList 
where IsPass is null
union
select RectifyItemId,'��ȫ����', HazardSourcePoint,CompileDate,'~/Technique/RectifyAudit.aspx','' from dbo.Technique_RectifyItem 
where IsPass is null
union
select HAZOPId,'HAZOP', HAZOPTitle,CompileDate,'~/Technique/HAZOPAudit.aspx','' from dbo.Technique_HAZOP 
where IsPass is null
union
select ExpertId,'��ȫר��', ExpertName,CompileDate,'~/Technique/ExpertAudit.aspx','' from dbo.Technique_Expert 
where IsPass is null
union
select EmergencyId,'Ӧ��Ԥ��', EmergencyName,CompileDate,'~/Technique/EmergencyAudit.aspx','' from dbo.Technique_Emergency 
where IsPass is null
union
select SpecialSchemeId,'ר���', SpecialSchemeName,CompileDate,'~/Technique/SpecialSchemeAudit.aspx','' from dbo.Technique_SpecialScheme 
where IsPass is null
union
select UrgeReportId
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
where (UrgeReport.IsComplete is null or UrgeReport.IsComplete =0) AND (UrgeReport.IsCancel is null or UrgeReport.IsCancel =0)
union
select MillionsMonthlyReportId,'�±�', '����ʱ��ȫͳ���±���'+(ISNULL(Group_0008.ConstText,'-') + ISNULL(Group_0009.ConstText,'-'))+(case HandleState when '2' then '������' when '3' then '������' when '4' then '���ϱ�' end),FillingDate,'~/Information/MillionsMonthlyReportSave.aspx?MillionsMonthlyReportId='+MillionsMonthlyReportId,HandleMan from dbo.Information_MillionsMonthlyReport Report
LEFT JOIN Sys_Const  AS Group_0008 ON Group_0008.GroupId='0008' AND Group_0008.ConstValue =Report.[Year]
LEFT JOIN Sys_Const  AS Group_0009 ON Group_0009.GroupId='0009' AND Group_0009.ConstValue =Report.[Month]
where (HandleState='2' or HandleState='3' or HandleState='4') and UpState <> '3'
union
select AccidentCauseReportId,'�±�', 'ְ�������¹�ԭ���������'+(ISNULL(Group_0008.ConstText,'-') + ISNULL(Group_0009.ConstText,'-'))+(case HandleState when '2' then '������' when '3' then '������' when '4' then '���ϱ�' end),FillingDate,'~/Information/AccidentCauseReportSave.aspx?AccidentCauseReportId='+AccidentCauseReportId,HandleMan from dbo.Information_AccidentCauseReport Report
LEFT JOIN Sys_Const  AS Group_0008 ON Group_0008.GroupId='0008' AND Group_0008.ConstValue =Report.[Year]
LEFT JOIN Sys_Const  AS Group_0009 ON Group_0009.GroupId='0009' AND Group_0009.ConstValue =Report.[Month]
where (HandleState='2' or HandleState='3' or HandleState='4') and UpState <> '3'
union
select SafetyQuarterlyReportId,'����', '��ȫ�������ݼ���'+(ISNULL(Group_0008.ConstText,'-') + ISNULL(Group_0011.ConstText,'-'))+(case HandleState when '2' then '������' when '3' then '������' when '4' then '���ϱ�' end),FillingDate,'~/Information/SafetyQuarterlyReportEdit.aspx?SafetyQuarterlyReportId='+SafetyQuarterlyReportId,HandleMan from dbo.Information_SafetyQuarterlyReport Report
LEFT JOIN Sys_Const  AS Group_0008 ON Group_0008.GroupId='0008' AND Group_0008.ConstValue =Report.YearId
LEFT JOIN Sys_Const  AS Group_0011 ON Group_0011.GroupId='0011' AND Group_0011.ConstValue =Report.Quarters
where (HandleState='2' or HandleState='3' or HandleState='4') and UpState <> '3'
union
select DrillConductedQuarterlyReportId,'����', 'Ӧ��������չ���������'+(ISNULL(Group_0008.ConstText,'-') + ISNULL(Group_0011.ConstText,'-'))+(case HandleState when '2' then '������' when '3' then '������' when '4' then '���ϱ�' end),ReportDate,'~/Information/DrillConductedQuarterlyReportAdd.aspx?DrillConductedQuarterlyReportId='+DrillConductedQuarterlyReportId,HandleMan from dbo.Information_DrillConductedQuarterlyReport Report
LEFT JOIN Sys_Const  AS Group_0008 ON Group_0008.GroupId='0008' AND Group_0008.ConstValue =Report.YearId
LEFT JOIN Sys_Const  AS Group_0011 ON Group_0011.GroupId='0011' AND Group_0011.ConstValue =Report.[Quarter]
where (HandleState='2' or HandleState='3' or HandleState='4') and UpState <> '3'
union
select DrillPlanHalfYearReportId,'���걨', 'Ӧ�����������ƻ����걨��'+(ISNULL(Group_0008.ConstText,'-') + ISNULL(Group_0010.ConstText,'-'))+(case HandleState when '2' then '������' when '3' then '������' when '4' then '���ϱ�' end),CompileDate,'~/Information/DrillPlanHalfYearReportAdd.aspx?DrillPlanHalfYearReportId='+DrillPlanHalfYearReportId,HandleMan from dbo.Information_DrillPlanHalfYearReport Report
LEFT JOIN Sys_Const  AS Group_0008 ON Group_0008.GroupId='0008' AND Group_0008.ConstValue =Report.YearId
LEFT JOIN Sys_Const  AS Group_0010 ON Group_0010.GroupId='0010' AND Group_0010.ConstValue =Report.HalfYearId
where (HandleState='2' or HandleState='3' or HandleState='4') and UpState <> '3'

UNION
SELECT ReportItem.SubUnitReportItemId
,'�ӹ�˾��ȫ�ϱ�'
,(Unit.UnitName+'��'+Report.SubUnitReportName+'��δ�ϱ�Ҫ���ϱ�ʱ��'+ CONVERT(varchar(100), ReportItem.PlanReortDate, 23)) AS SubUnitReportName
,ReportItem.PlanReortDate
,'~/Supervise/SubUnitReport.aspx' AS Url ,''
FROM dbo.Supervise_SubUnitReportItem AS ReportItem
LEFT JOIN dbo.Supervise_SubUnitReport AS Report ON ReportItem.SubUnitReportId =Report.SubUnitReportId
LEFT JOIN dbo.Base_Unit AS Unit ON ReportItem.UnitId =Unit.UnitId
WHERE (UpState <> '3' OR UpState IS NULL) 






GO



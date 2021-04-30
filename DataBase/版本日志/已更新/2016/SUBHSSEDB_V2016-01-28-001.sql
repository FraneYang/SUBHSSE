
INSERT INTO dbo.Sys_Menu(MenuId, MenuName, Url, SortIndex, SuperMenu)
VALUES('3D1CFA31-96A9-496E-9A94-318670C9D658','�ӹ�˾��ȫ�ϱ�','Supervise/SubUnitReport.aspx',40,'A24B7926-EF69-456E-8A24-936D30384680')
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('7075349F-B55F-457E-8EA3-0CBAD0863DB0','3D1CFA31-96A9-496E-9A94-318670C9D658','����',1)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('12C61C54-D3B3-4B07-AAA9-8B9FAA176E75','3D1CFA31-96A9-496E-9A94-318670C9D658','�޸�',2)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('CD5B2ADD-36C0-43AC-AB31-4BE79EC4E957','3D1CFA31-96A9-496E-9A94-318670C9D658','ɾ��',3)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('457BE203-8D81-4421-BDFE-75CE47E4DF67','3D1CFA31-96A9-496E-9A94-318670C9D658','����',4)
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

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ӹ�˾�ϱ�����Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supervise_SubUnitReport', @level2type=N'COLUMN',@level2name=N'SubUnitReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supervise_SubUnitReport', @level2type=N'COLUMN',@level2name=N'SubUnitReportCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ϱ�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supervise_SubUnitReport', @level2type=N'COLUMN',@level2name=N'SubUnitReportName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���ڵ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supervise_SubUnitReport', @level2type=N'COLUMN',@level2name=N'SupSubUnitReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�Ƿ�ĩ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supervise_SubUnitReport', @level2type=N'COLUMN',@level2name=N'IsEndLever'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ӹ�˾��ȫ�ϱ�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supervise_SubUnitReport'
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

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ϱ���ϸid' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supervise_SubUnitReportItem', @level2type=N'COLUMN',@level2name=N'SubUnitReportItemId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ϱ���������id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supervise_SubUnitReportItem', @level2type=N'COLUMN',@level2name=N'SubUnitReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ϱ���λ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supervise_SubUnitReportItem', @level2type=N'COLUMN',@level2name=N'UnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ҫ���ϱ�ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supervise_SubUnitReportItem', @level2type=N'COLUMN',@level2name=N'PlanReortDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supervise_SubUnitReportItem', @level2type=N'COLUMN',@level2name=N'ReportTitle'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ϸ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supervise_SubUnitReportItem', @level2type=N'COLUMN',@level2name=N'ReportContent'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supervise_SubUnitReportItem', @level2type=N'COLUMN',@level2name=N'AttachUrl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ϱ�ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supervise_SubUnitReportItem', @level2type=N'COLUMN',@level2name=N'ReportDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ϱ�״̬��0-δ�߱���1-�Ѵ߱���2-���ϱ���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supervise_SubUnitReportItem', @level2type=N'COLUMN',@level2name=N'State'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ӹ�˾��ȫ�ϱ���ϸ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supervise_SubUnitReportItem'
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
select MillionsMonthlyReportId,'�±�', '����ʱ��ȫͳ���±���'+(ISNULL(Group_0008.ConstText,'-') + ISNULL(Group_0009.ConstText,'-'))+(case HandleState when '2' then '�����' when '3' then '������' when '4' then '���ϱ�' end),FillingDate,'~/Information/MillionsMonthlyReportSave.aspx?MillionsMonthlyReportId='+MillionsMonthlyReportId,HandleMan from dbo.Information_MillionsMonthlyReport Report
LEFT JOIN Sys_Const  AS Group_0008 ON Group_0008.GroupId='0008' AND Group_0008.ConstValue =Report.[Year]
LEFT JOIN Sys_Const  AS Group_0009 ON Group_0009.GroupId='0009' AND Group_0009.ConstValue =Report.[Month]
where (HandleState='2' or HandleState='3' or HandleState='4') and UpState <> '3'
union
select AccidentCauseReportId,'�±�', 'ְ�������¹�ԭ���������'+(ISNULL(Group_0008.ConstText,'-') + ISNULL(Group_0009.ConstText,'-'))+(case HandleState when '2' then '�����' when '3' then '������' when '4' then '���ϱ�' end),FillingDate,'~/Information/AccidentCauseReportSave.aspx?AccidentCauseReportId='+AccidentCauseReportId,HandleMan from dbo.Information_AccidentCauseReport Report
LEFT JOIN Sys_Const  AS Group_0008 ON Group_0008.GroupId='0008' AND Group_0008.ConstValue =Report.[Year]
LEFT JOIN Sys_Const  AS Group_0009 ON Group_0009.GroupId='0009' AND Group_0009.ConstValue =Report.[Month]
where (HandleState='2' or HandleState='3' or HandleState='4') and UpState <> '3'
union
select SafetyQuarterlyReportId,'����', '��ȫ�������ݼ���'+(ISNULL(Group_0008.ConstText,'-') + ISNULL(Group_0011.ConstText,'-'))+(case HandleState when '2' then '�����' when '3' then '������' when '4' then '���ϱ�' end),FillingDate,'~/Information/SafetyQuarterlyReportEdit.aspx?SafetyQuarterlyReportId='+SafetyQuarterlyReportId,HandleMan from dbo.Information_SafetyQuarterlyReport Report
LEFT JOIN Sys_Const  AS Group_0008 ON Group_0008.GroupId='0008' AND Group_0008.ConstValue =Report.YearId
LEFT JOIN Sys_Const  AS Group_0011 ON Group_0011.GroupId='0011' AND Group_0011.ConstValue =Report.Quarters
where (HandleState='2' or HandleState='3' or HandleState='4') and UpState <> '3'
union
select DrillConductedQuarterlyReportId,'����', 'Ӧ��������չ���������'+(ISNULL(Group_0008.ConstText,'-') + ISNULL(Group_0011.ConstText,'-'))+(case HandleState when '2' then '�����' when '3' then '������' when '4' then '���ϱ�' end),ReportDate,'~/Information/DrillConductedQuarterlyReportAdd.aspx?DrillConductedQuarterlyReportId='+DrillConductedQuarterlyReportId,HandleMan from dbo.Information_DrillConductedQuarterlyReport Report
LEFT JOIN Sys_Const  AS Group_0008 ON Group_0008.GroupId='0008' AND Group_0008.ConstValue =Report.YearId
LEFT JOIN Sys_Const  AS Group_0011 ON Group_0011.GroupId='0011' AND Group_0011.ConstValue =Report.[Quarter]
where (HandleState='2' or HandleState='3' or HandleState='4') and UpState <> '3'
union
select DrillPlanHalfYearReportId,'���걨', 'Ӧ�����������ƻ����걨��'+(ISNULL(Group_0008.ConstText,'-') + ISNULL(Group_0010.ConstText,'-'))+(case HandleState when '2' then '�����' when '3' then '������' when '4' then '���ϱ�' end),CompileDate,'~/Information/DrillPlanHalfYearReportAdd.aspx?DrillPlanHalfYearReportId='+DrillPlanHalfYearReportId,HandleMan from dbo.Information_DrillPlanHalfYearReport Report
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






UPDATE Sys_MenuProjectA SET MenuName='安全管理月报' WHERE MenuId='363EB208-7BB1-4A55-85F3-2501B2F10B45'
GO
UPDATE Sys_MenuProjectA SET MenuName='HSE管理月报' WHERE MenuId='68A52EEA-2661-4CB0-9382-A36AA5DCC480'
GO
UPDATE Sys_MenuProjectB SET MenuName='安全管理月报' WHERE MenuId='363EB208-7BB1-4A55-85F3-2501B2F10B45'
GO
UPDATE Sys_MenuProjectB SET MenuName='HSE管理月报' WHERE MenuId='68A52EEA-2661-4CB0-9382-A36AA5DCC480'
GO
UPDATE Sys_MenuProjectA SET MenuName='HSE日志暨管理数据收集' WHERE MenuId='3E077A36-EC12-4FC7-B685-1F439291C9B8'
GO
UPDATE Sys_MenuProjectA SET MenuName='HSE经理暨HSE工程师细则' WHERE MenuId='E763BC17-EC0D-4AB3-A388-EC7F734B56F2'
GO
UPDATE Sys_MenuProjectB SET MenuName='HSE日志暨管理数据收集' WHERE MenuId='3E077A36-EC12-4FC7-B685-1F439291C9B8'
GO
UPDATE Sys_MenuProjectB SET MenuName='HSE经理暨HSE工程师细则' WHERE MenuId='E763BC17-EC0D-4AB3-A388-EC7F734B56F2'
GO
UPDATE Sys_MenuProjectA SET MenuName='HSE措施费使用计划' WHERE MenuId='6FBF4B7D-21D2-4013-9465-12AC093109D4'
GO
UPDATE Sys_MenuProjectA SET MenuName='HSE费用投入登记' WHERE MenuId='9EFF1A0F-87AA-43E7-83B0-79EEAAC8848E'
GO
UPDATE Sys_MenuProjectB SET MenuName='HSE措施费使用计划' WHERE MenuId='6FBF4B7D-21D2-4013-9465-12AC093109D4'
GO
UPDATE Sys_MenuProjectB SET MenuName='HSE费用投入登记' WHERE MenuId='9EFF1A0F-87AA-43E7-83B0-79EEAAC8848E'
GO
UPDATE Sys_MenuProjectA SET MenuName='职业健康安全危险源辨识与评价' WHERE MenuId='EDC50857-7762-4498-83C6-5BDE85036BAB'
GO
UPDATE Sys_MenuProjectB SET MenuName='职业健康安全危险源辨识与评价' WHERE MenuId='EDC50857-7762-4498-83C6-5BDE85036BAB'
GO

UPDATE Sys_MenuProjectA SET MenuName='HSSE物资管理' WHERE MenuId='3DC61C8A-7C54-49E0-96C4-DED9CC6BFD0B'
GO
UPDATE Sys_MenuProjectB SET MenuName='HSSE物资管理' WHERE MenuId='3DC61C8A-7C54-49E0-96C4-DED9CC6BFD0B'
GO

UPDATE Sys_MenuProjectA SET MenuName='分包HSSE费用管理' WHERE MenuId='FF68C697-B058-4687-A98F-71C591650E02'
GO
UPDATE Sys_MenuProjectB SET MenuName='分包HSSE费用管理' WHERE MenuId='FF68C697-B058-4687-A98F-71C591650E02'
GO

UPDATE Sys_MenuProjectA SET Icon='ApplicationViewTile' WHERE MenuId='20ECB69E-28C4-4FAC-941A-15F446AEB634'
GO
UPDATE Sys_MenuProjectB SET Icon='ApplicationViewTile' WHERE MenuId='20ECB69E-28C4-4FAC-941A-15F446AEB634'
GO

INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('19C1370F-92C0-4E31-87B4-8BADA74113E4','合同HSE费用及支付台账','CostGoods/CostLedger.aspx','PageHeaderFooter',40,'20ECB69E-28C4-4FAC-941A-15F446AEB634','Menu_Project',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('3292A2AD-F002-403C-9FD3-00574BFA0D6F','19C1370F-92C0-4E31-87B4-8BADA74113E4','增加',1)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('8171CF23-8E5A-481B-88F5-B5638146F411','19C1370F-92C0-4E31-87B4-8BADA74113E4','修改',2)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('5A7ACC88-E6BC-418F-A335-EAD217AF630E','19C1370F-92C0-4E31-87B4-8BADA74113E4','删除',3)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('38685C5B-1DD8-417E-B427-B57DE23D30D9','19C1370F-92C0-4E31-87B4-8BADA74113E4','保存',4) 
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('4CA88CAF-593E-4641-A0CA-60F936B65993','19C1370F-92C0-4E31-87B4-8BADA74113E4','提交',5)   
GO

INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('19C1370F-92C0-4E31-87B4-8BADA74113E4','合同HSE费用及支付台账','CostGoods/CostLedger.aspx','PageHeaderFooter',40,'20ECB69E-28C4-4FAC-941A-15F446AEB634','Menu_Project',1,0)
GO

INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('C8AC9BBB-6E6E-4871-BADC-7963EB1CCAA8','安全管理组织机构','SecuritySystem/SafetyManageOrganization.aspx','PageHeaderFooter',40,'7CCA86F7-E43F-438F-AAB6-CA2661FBB362','Menu_Project',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('303A2B5A-1319-4213-A433-E822E6FF22C4','C8AC9BBB-6E6E-4871-BADC-7963EB1CCAA8','增加',1)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('82818179-C2DA-4B0C-B9B7-1A246EEB79A8','C8AC9BBB-6E6E-4871-BADC-7963EB1CCAA8','修改',2)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('F202E880-CA99-4545-A145-10F037C47C5C','C8AC9BBB-6E6E-4871-BADC-7963EB1CCAA8','删除',3)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('F0474BD9-2E14-4277-92F2-3043ADC0D71C','C8AC9BBB-6E6E-4871-BADC-7963EB1CCAA8','保存',4)  
GO

INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('C8AC9BBB-6E6E-4871-BADC-7963EB1CCAA8','安全管理组织机构','SecuritySystem/SafetyManageOrganization.aspx','PageHeaderFooter',40,'7CCA86F7-E43F-438F-AAB6-CA2661FBB362','Menu_Project',1,0)
GO

CREATE TABLE [dbo].[SecuritySystem_SafetyManageOrganization](
	[SafetyManageOrganizationId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[Remark] [nvarchar](1000) NULL,
	[AttachUrl] [nvarchar](2000) NULL,
	[SeeFile] [nvarchar](max) NULL,
 CONSTRAINT [PK_SecuritySystem_SafetyManageOrganization] PRIMARY KEY CLUSTERED 
(
	[SafetyManageOrganizationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [dbo].[SecuritySystem_SafetyManageOrganization]  WITH CHECK ADD  CONSTRAINT [FK_SecuritySystem_SafetyManageOrganization_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[SecuritySystem_SafetyManageOrganization] CHECK CONSTRAINT [FK_SecuritySystem_SafetyManageOrganization_Base_Project]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SecuritySystem_SafetyManageOrganization', @level2type=N'COLUMN',@level2name=N'SafetyManageOrganizationId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SecuritySystem_SafetyManageOrganization', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SecuritySystem_SafetyManageOrganization', @level2type=N'COLUMN',@level2name=N'Remark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'附件' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SecuritySystem_SafetyManageOrganization', @level2type=N'COLUMN',@level2name=N'AttachUrl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件查看' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SecuritySystem_SafetyManageOrganization', @level2type=N'COLUMN',@level2name=N'SeeFile'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'安全管理组织机构表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SecuritySystem_SafetyManageOrganization'
GO


INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('94C36333-C22A-499F-B9DB-53EEF77922AE','项目现场重大HSE因素控制措施一览表','Hazard/MajorHazardList.aspx','PageHeaderFooter',25,'9A3212F8-2392-4F21-A8C7-FF5EE3B191F1','Menu_Project',1,0)
GO

INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('257C220C-A821-4710-864A-63BA146109B2','项目现场重大HSE因素控制措施一览表','Hazard/MajorHazardList.aspx','PageHeaderFooter',25,'9A3212F8-2392-4F21-A8C7-FF5EE3B191F1','Menu_Project',1,0)
GO


ALTER TABLE Administrative_CarManager ADD InsuranceDate DATETIME NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'保险有效期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Administrative_CarManager', @level2type=N'COLUMN',@level2name=N'InsuranceDate'
GO

INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('754C23CA-F1BC-4F44-9D34-B185099EDCA0','现场驾驶员管理','Administrative/DriverManager.aspx','PageHeaderFooter',40,'D58B9DEC-A09B-45B0-BD54-18592119BB49','Menu_Project',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('DCEA3B66-5828-4073-851E-FD45F39952AF','754C23CA-F1BC-4F44-9D34-B185099EDCA0','增加',1)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('8A6AAAB7-7A14-49D5-BD94-F014AD0F90DB','754C23CA-F1BC-4F44-9D34-B185099EDCA0','修改',2)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('5D30DE59-0D5E-4829-A2D7-2DF952460134','754C23CA-F1BC-4F44-9D34-B185099EDCA0','删除',3)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('A1E399A7-7E19-4E7E-B38C-789F01C2B817','754C23CA-F1BC-4F44-9D34-B185099EDCA0','保存',4)  
GO

INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('754C23CA-F1BC-4F44-9D34-B185099EDCA0','现场驾驶员管理','Administrative/DriverManager.aspx','PageHeaderFooter',40,'D58B9DEC-A09B-45B0-BD54-18592119BB49','Menu_Project',1,0)
GO

CREATE TABLE [dbo].[Administrative_DriverManager](
	[DriverManagerId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NOT NULL,
	[DriverManagerCode] [nvarchar](50) NOT NULL,
	[DriverName] [nvarchar](50) NULL,
	[DriverCarModel] [nvarchar](100) NULL,
	[DriverCode] [nvarchar](50) NULL,
	[DrivingDate] [datetime] NULL,
	[CheckDate] [datetime] NULL,
	[Remark] [nvarchar](500) NULL,
	[CompileMan] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
	[States] [char](1) NULL,
 CONSTRAINT [PK_Administrative_DriverManager] PRIMARY KEY CLUSTERED 
(
	[DriverManagerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[Administrative_DriverManager]  WITH CHECK ADD  CONSTRAINT [FK_Administrative_DriverManager_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[Administrative_DriverManager] CHECK CONSTRAINT [FK_Administrative_DriverManager_Base_Project]
GO

ALTER TABLE [dbo].[Administrative_DriverManager]  WITH CHECK ADD  CONSTRAINT [FK_Administrative_DriverManager_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[Administrative_DriverManager] CHECK CONSTRAINT [FK_Administrative_DriverManager_Sys_User]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Administrative_DriverManager', @level2type=N'COLUMN',@level2name=N'DriverManagerId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Administrative_DriverManager', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'车辆管理编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Administrative_DriverManager', @level2type=N'COLUMN',@level2name=N'DriverManagerCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Administrative_DriverManager', @level2type=N'COLUMN',@level2name=N'DriverName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'准驾车型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Administrative_DriverManager', @level2type=N'COLUMN',@level2name=N'DriverCarModel'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'驾驶证号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Administrative_DriverManager', @level2type=N'COLUMN',@level2name=N'DriverCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发证日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Administrative_DriverManager', @level2type=N'COLUMN',@level2name=N'DrivingDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'年检有效期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Administrative_DriverManager', @level2type=N'COLUMN',@level2name=N'CheckDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Administrative_DriverManager', @level2type=N'COLUMN',@level2name=N'Remark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Administrative_DriverManager', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Administrative_DriverManager', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Administrative_DriverManager', @level2type=N'COLUMN',@level2name=N'States'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'现场驾驶员管理' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Administrative_DriverManager'
GO


INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('C13F1CE7-DAEF-4604-A13F-192621D28DF5','奖励统计','Check/IncentiveNoticeStatistics.aspx','PageHeaderFooter',15,'012DF857-AD6B-49AA-87A8-030CD5F66D4C','Menu_Project',1,0)
GO

INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('C13F1CE7-DAEF-4604-A13F-192621D28DF5','奖励统计','Check/IncentiveNoticeStatistics.aspx','PageHeaderFooter',15,'012DF857-AD6B-49AA-87A8-030CD5F66D4C','Menu_Project',1,0)
GO

--特岗人员 删除多余字段
ALTER TABLE [dbo].[QualityAudit_PersonQuality] DROP CONSTRAINT [FK_QualityAudit_PersonQuality_Base_Project]
GO
ALTER TABLE QualityAudit_PersonQuality DROP COLUMN ProjectId 
GO
ALTER TABLE QualityAudit_PersonQuality DROP COLUMN PersonQualityCode 
GO
ALTER TABLE [dbo].[QualityAudit_PersonQuality] DROP CONSTRAINT [FK_QualityAudit_PersonQuality_Base_Unit]
GO
ALTER TABLE QualityAudit_PersonQuality DROP COLUMN UnitId 
GO
ALTER TABLE [dbo].[QualityAudit_PersonQuality] DROP CONSTRAINT [FK_QualityAudit_PersonQuality_Base_WorkPost]
GO
ALTER TABLE QualityAudit_PersonQuality DROP COLUMN WorkPostId 
GO

--管理人员 删除多余字段
ALTER TABLE [dbo].[QualityAudit_ManagePersonQuality] DROP CONSTRAINT [FK_QualityAudit_ManagePersonQuality_Base_Project]
GO
ALTER TABLE QualityAudit_ManagePersonQuality DROP COLUMN ProjectId 
GO
ALTER TABLE QualityAudit_ManagePersonQuality DROP COLUMN ManagePersonQualityCode 
GO
ALTER TABLE [dbo].[QualityAudit_ManagePersonQuality] DROP CONSTRAINT [FK_QualityAudit_ManagePersonQuality_Base_Unit]
GO
ALTER TABLE QualityAudit_ManagePersonQuality DROP COLUMN UnitId 
GO
ALTER TABLE [dbo].[QualityAudit_ManagePersonQuality] DROP CONSTRAINT [FK_QualityAudit_ManagePersonQuality_Base_WorkPost]
GO
ALTER TABLE QualityAudit_ManagePersonQuality DROP COLUMN WorkPostId 
GO

--安全人员 删除多余字段
ALTER TABLE [dbo].[QualityAudit_SafePersonQuality] DROP CONSTRAINT [FK_QualityAudit_SafePersonQuality_Base_Project]
GO
ALTER TABLE QualityAudit_SafePersonQuality DROP COLUMN ProjectId 
GO
ALTER TABLE QualityAudit_SafePersonQuality DROP COLUMN SafePersonQualityCode 
GO
ALTER TABLE [dbo].[QualityAudit_SafePersonQuality] DROP CONSTRAINT [FK_QualityAudit_SafePersonQuality_Base_Unit]
GO
ALTER TABLE QualityAudit_SafePersonQuality DROP COLUMN UnitId 
GO
ALTER TABLE [dbo].[QualityAudit_SafePersonQuality] DROP CONSTRAINT [FK_QualityAudit_SafePersonQuality_Base_WorkPost]
GO
ALTER TABLE QualityAudit_SafePersonQuality DROP COLUMN WorkPostId 
GO
--删除人员表特岗证书字段
ALTER TABLE [dbo].[SitePerson_Person] DROP CONSTRAINT [FK_SitePerson_Person_Base_Certificate]
GO
ALTER TABLE SitePerson_Person DROP COLUMN CertificateId
GO
ALTER TABLE SitePerson_Person DROP COLUMN CertificateCode
GO
ALTER TABLE SitePerson_Person DROP COLUMN CertificateLimitTime
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
SELECT PersonQuality.PersonQualityId,'特岗人员资质',  '[' + Person.CardNo +']'+ Person.PersonName +'已过期，项目：'+ Project.ProjectName,PersonQuality.LimitDate,'~/QualityAudit/PersonQualityEdit.aspx?PersonId={0}' AS Url 
FROM QualityAudit_PersonQuality AS PersonQuality
LEFT JOIN SitePerson_Person AS Person ON Person.PersonId = PersonQuality.PersonId
LEFT JOIN Base_Project AS Project ON Person.ProjectId =Project.ProjectId
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

ALTER VIEW [dbo].[View_SitePerson_Person]
AS
SELECT Person.PersonId,
	Person.CardNo,
	Person.PersonName,
	(Case Person.Sex WHEN '1' THEN '男' WHEN '2' THEN '女' ELSE '' END) AS Sex, 
	Person.IdentityCard, 
	Person.Address, 
	Person.ProjectId, 
	Person.UnitId, 
	Person.TeamGroupId, 
	Person.WorkAreaId, 
	Person.WorkPostId, 	
	Person.InTime, 
	Person.OutTime, 
	Person.OutResult, 
	Person.Telephone, 
	Person.PositionId, 
	Person.PostTitleId, 
	Person.PhotoUrl, 
	(CASE Person.IsUsed WHEN 'TRUE' THEN '是' ELSE '否' END) AS IsUsed, 
	(CASE Person.IsCardUsed WHEN 'TRUE' THEN '是' ELSE '否' END) AS IsCardUsed, 
	Person.PersonIndex,
	Project.ProjectCode,
	Project.ProjectName,
	Unit.UnitCode,
	Unit.UnitName,
	TeamGroup.TeamGroupName,
	WorkArea.WorkAreaCode,
	WorkArea.WorkAreaName,
	Post.WorkPostName,
	Position.PositionName,
	Title.PostTitleName,
	Person.SendCardNo,
	Depart.DepartName
FROM SitePerson_Person AS Person
LEFT JOIN Base_Project AS Project ON Project.ProjectId=Person.ProjectId
LEFT JOIN Base_Unit AS Unit ON Unit.UnitId = Person.UnitId
LEFT JOIN ProjectData_TeamGroup AS TeamGroup ON TeamGroup.TeamGroupId=Person.TeamGroupId
LEFT JOIN ProjectData_WorkArea AS WorkArea ON WorkArea.WorkAreaId = Person.WorkAreaId
LEFT JOIN Base_WorkPost AS Post ON Post.WorkPostId = Person.WorkPostId
LEFT JOIN Base_Position AS Position ON Position.PositionId = Person.PositionId
Left JOIN Base_PostTitle AS Title ON Title.PostTitleId = Person.PostTitleId
Left JOIN Base_Depart AS Depart ON Depart.DepartId = Person.DepartId
GO

alter table dbo.Law_LawRegulationList alter column LawRegulationCode nvarchar(300) null
GO
alter table dbo.Law_LawRegulationList alter column LawRegulationName nvarchar(500) null
GO


ALTER PROCEDURE [dbo].[SpCheckDayStatistic]     
@ProjectId nvarchar(50),
@StartTime nvarchar(15)=null,        
@EndTime nvarchar(15)=null,
@States char(1)=null         
AS      
BEGIN    

SELECT 	CheckDayDetail.CheckDayDetailId
	,CheckDay.CheckDayId
	,CheckDay.CheckDayId+','+ISNULL(CheckDayDetail.CheckDayDetailId,'') AS NewChcekId
	,CodeRecords.Code AS CheckDayCode
	,Checks.CheckCount
	,CheckDayDetail.WorkArea
	,Unit.UnitName
	,CheckDayDetail.CompleteStatus
	,CONVERT(varchar(100), CheckDayDetail.LimitedDate, 23) as LimitedDate
	,CheckDayDetail.CompletedDate
	,CheckDay.CheckPerson
	,CONVERT(varchar(100), CheckDay.CheckTime, 23) as CheckTime
	--,CheckDay.CheckTime
	,CheckDayDetail.CheckItemType
	,CheckDayDetail.CheckItem
	,CheckDayDetail.HandleStep
	,CheckDayDetail.Unqualified
	,(CASE WHEN CheckDay.States='0' OR CheckDay.States IS NULL THEN '待['+Users.UserName+']提交' WHEN CheckDay.States='2' THEN '审核/审批完成' ELSE '待['+OperateUser.UserName+']办理' END) AS  FlowOperateName
from Check_CheckDay AS CheckDay 
LEFT JOIN Sys_CodeRecords AS CodeRecords ON CheckDay.CheckDayId=CodeRecords.DataId
LEFT JOIN Check_CheckDayDetail  AS CheckDayDetail on CheckDayDetail.CheckDayId = CheckDay.CheckDayId    
--LEFT JOIN ProjectData_WorkArea AS WorkArea on WorkArea.WorkAreaId=CheckDayDetail.CheckArea        
LEFT JOIN Base_Unit AS Unit on Unit.UnitId=CheckDayDetail.UnitId        
LEFT JOIN (SELECT COUNT(*)  AS CheckCount, CheckDayId 
			FROM Check_CheckDayDetail GROUP BY CheckDayId) AS Checks ON Checks.CheckDayId = CheckDay.CheckDayId 
LEFT JOIN Sys_FlowOperate AS FlowOperate ON CheckDay.CheckDayId=FlowOperate.DataId AND FlowOperate.IsClosed <> 1
LEFT JOIN Sys_User AS OperateUser ON FlowOperate.OperaterId=OperateUser.UserId
LEFT JOIN Sys_User AS Users ON CheckDay.CompileMan=Users.UserId
WHERE  (@StartTime is null or CheckDay.CheckTime>=@StartTime) 
		and (@EndTime is null or CheckDay.CheckTime <=@EndTime ) 
		and CheckDay.ProjectId=@ProjectId
		and (@States is null or CheckDay.States=@States) 

order by CheckDayCode desc
   
END
GO


ALTER PROCEDURE [dbo].[SpCheckSpecialStatistic]     
@ProjectId nvarchar(50),
@StartTime nvarchar(15)=null,        
@EndTime nvarchar(15)=null,
@States char(1)=null            
AS      
BEGIN    

SELECT 	CheckSpecialDetail.CheckSpecialDetailId
	,CheckSpecial.CheckSpecialId
	,CheckSpecial.CheckSpecialId+','+ISNULL(CheckSpecialDetail.CheckSpecialDetailId,'') AS NewChcekId
	,CodeRecords.Code AS CheckSpecialCode
	,Checks.CheckCount
	,CheckSpecialDetail.WorkArea
	,Unit.UnitName
	,CheckSpecialDetail.CompleteStatus
	,CONVERT(varchar(100), CheckSpecialDetail.LimitedDate, 23) as LimitedDate
	,CheckSpecialDetail.CompletedDate
	,CheckSpecial.CheckPerson
	,user1.UserName as CheckPersonName
	,CONVERT(varchar(100), CheckSpecial.CheckTime, 23) as CheckTime
	--,CheckSpecial.CheckTime
	,CheckSpecialDetail.CheckItemType
	,CheckSpecialDetail.CheckItem
	,CheckSpecialDetail.HandleStep
	,CheckSpecialDetail.Unqualified
	,(CASE WHEN CheckSpecial.CheckType ='0' THEN '周检' WHEN CheckSpecial.CheckType ='1' THEN '月检' ELSE '其它' END)  AS CheckTypeName
	,(CASE WHEN CheckSpecial.States='0' OR CheckSpecial.States IS NULL THEN '待['+Users.UserName+']提交' WHEN CheckSpecial.States='2' THEN '审核/审批完成' ELSE '待['+OperateUser.UserName+']办理' END) AS  FlowOperateName
from Check_CheckSpecial AS CheckSpecial 
LEFT JOIN Sys_CodeRecords AS CodeRecords ON CheckSpecial.CheckSpecialId=CodeRecords.DataId
LEFT JOIN Sys_User AS user1 ON CheckSpecial.CheckPerson=user1.UserId
LEFT JOIN Check_CheckSpecialDetail  AS CheckSpecialDetail on CheckSpecialDetail.CheckSpecialId = CheckSpecial.CheckSpecialId    
--LEFT JOIN ProjectData_WorkArea AS WorkArea on WorkArea.WorkAreaId=CheckSpecialDetail.CheckArea        
LEFT JOIN Base_Unit AS Unit on Unit.UnitId=CheckSpecialDetail.UnitId        
LEFT JOIN (SELECT COUNT(*)  AS CheckCount, CheckSpecialId 
			FROM Check_CheckSpecialDetail GROUP BY CheckSpecialId) AS Checks ON Checks.CheckSpecialId = CheckSpecial.CheckSpecialId 
LEFT JOIN Sys_FlowOperate AS FlowOperate ON CheckSpecial.CheckSpecialId=FlowOperate.DataId AND FlowOperate.IsClosed <> 1
LEFT JOIN Sys_User AS OperateUser ON FlowOperate.OperaterId=OperateUser.UserId
LEFT JOIN Sys_User AS Users ON CheckSpecial.CompileMan=Users.UserId
WHERE  (@StartTime is null or CheckSpecial.CheckTime>=@StartTime) 
		and (@EndTime is null or CheckSpecial.CheckTime <=@EndTime ) 
		and CheckSpecial.ProjectId=@ProjectId
		and (@States is null or CheckSpecial.States=@States) 

order by CheckSpecialCode desc
   
END

GO



ALTER PROCEDURE [dbo].[SpCheckColligationStatistic]     
@ProjectId nvarchar(50),
@StartTime nvarchar(15)=null,        
@EndTime nvarchar(15)=null,
@States char(1)=null          
AS      
BEGIN    

SELECT 	CheckColligationDetail.CheckColligationDetailId
	,CheckColligation.CheckColligationId
	,CheckColligation.CheckColligationId+','+ISNULL(CheckColligationDetail.CheckColligationDetailId,'') AS NewChcekId
	,CodeRecords.Code AS CheckColligationCode
	,Checks.CheckCount
	,CheckColligationDetail.WorkArea
	,Unit.UnitName
	,CheckColligationDetail.CompleteStatus
	,CONVERT(varchar(100), CheckColligationDetail.LimitedDate, 23) as LimitedDate
	,CheckColligationDetail.CompletedDate
	,CheckColligation.CheckPerson
	,user1.UserName as CheckPersonName
	,CONVERT(varchar(100), CheckColligation.CheckTime, 23) as CheckTime
	--,CheckColligation.CheckTime
	,CheckColligationDetail.CheckItemType
	,CheckColligationDetail.CheckItem
	,CheckColligationDetail.HandleStep
	,CheckColligationDetail.Unqualified
	,(CASE WHEN CheckColligation.CheckType ='0' THEN '周检' WHEN CheckColligation.CheckType ='1' THEN '月检' ELSE '其它' END)  AS CheckTypeName
	,(CASE WHEN CheckColligation.States='0' OR CheckColligation.States IS NULL THEN '待['+Users.UserName+']提交' WHEN CheckColligation.States='2' THEN '审核/审批完成' ELSE '待['+OperateUser.UserName+']办理' END) AS  FlowOperateName
from Check_CheckColligation AS CheckColligation 
LEFT JOIN Sys_CodeRecords AS CodeRecords ON CheckColligation.CheckColligationId=CodeRecords.DataId
LEFT JOIN Sys_User AS user1 ON CheckColligation.CheckPerson=user1.UserId
LEFT JOIN Check_CheckColligationDetail  AS CheckColligationDetail on CheckColligationDetail.CheckColligationId = CheckColligation.CheckColligationId    
--LEFT JOIN ProjectData_WorkArea AS WorkArea on WorkArea.WorkAreaId=CheckColligationDetail.CheckArea        
LEFT JOIN Base_Unit AS Unit on Unit.UnitId=CheckColligationDetail.UnitId        
LEFT JOIN (SELECT COUNT(*)  AS CheckCount, CheckColligationId 
			FROM Check_CheckColligationDetail GROUP BY CheckColligationId) AS Checks ON Checks.CheckColligationId = CheckColligation.CheckColligationId 
LEFT JOIN Sys_FlowOperate AS FlowOperate ON CheckColligation.CheckColligationId=FlowOperate.DataId AND FlowOperate.IsClosed <> 1
LEFT JOIN Sys_User AS OperateUser ON FlowOperate.OperaterId=OperateUser.UserId
LEFT JOIN Sys_User AS Users ON CheckColligation.CompileMan=Users.UserId
WHERE  (@StartTime is null or CheckColligation.CheckTime>=@StartTime) 
		and (@EndTime is null or CheckColligation.CheckTime <=@EndTime ) 
		and CheckColligation.ProjectId=@ProjectId
		and (@States is null or CheckColligation.States=@States) 

order by CheckColligationCode desc
   
END


GO


ALTER view [dbo].[View_SitePerson_DayReportUnitDetail]
as
/******人工时月报单位明细列表******/
SELECT dayReportUnitDetail.DayReportUnitDetailId
	,dayReportUnitDetail.DayReportDetailId
	,dayReportUnitDetail.PostId
	,dayReportUnitDetail.CheckPersonNum
	,dayReportUnitDetail.RealPersonNum
	,dayReportUnitDetail.PersonWorkTime
	,dayReportUnitDetail.Remark
	,Post.WorkPostName
	,Post.PostType
	,Post.WorkPostCode
	,case Post.IsHsse when 1 then '1'
	else '0' end as IsHsse
  FROM SitePerson_DayReportUnitDetail AS  dayReportUnitDetail  
  LEFT JOIN Base_WorkPost AS Post ON Post.WorkPostId = dayReportUnitDetail.PostId 



GO
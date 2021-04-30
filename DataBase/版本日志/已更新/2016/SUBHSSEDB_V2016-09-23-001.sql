alter table dbo.Law_ManageRule add SeeFile nvarchar(max) null
GO

CREATE TABLE [dbo].[ActionPlan_ManagerRule](
	[ManagerRuleId] [nvarchar](50) NOT NULL,
	[ManageRuleCode] [nvarchar](50) NULL,
	[OldManageRuleId] [nvarchar](50) NULL,
	[ProjectId] [nvarchar](50) NULL,
	[ManageRuleName] [nvarchar](50) NULL,
	[ManageRuleTypeId] [nvarchar](50) NULL,
	[VersionNo] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
	[CompileMan] [nvarchar](50) NULL,
	[AttachUrl] [nvarchar](2000) NULL,
	[Remark] [nvarchar](1000) NULL,
	[IsIssue] [bit] NULL,
	[IssueDate] [datetime] NULL,
	[Flag] [bit] NULL,
	[State] [char](1) NOT NULL,
	[SeeFile] [nvarchar](max) NULL,
 CONSTRAINT [PK_ActionPlan_ManagerRule] PRIMARY KEY CLUSTERED 
(
	[ManagerRuleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'管理规定编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ActionPlan_ManagerRule', @level2type=N'COLUMN',@level2name=N'ManageRuleCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'管理规定资源Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ActionPlan_ManagerRule', @level2type=N'COLUMN',@level2name=N'OldManageRuleId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ActionPlan_ManagerRule', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ActionPlan_ManagerRule', @level2type=N'COLUMN',@level2name=N'ManageRuleName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分类Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ActionPlan_ManagerRule', @level2type=N'COLUMN',@level2name=N'ManageRuleTypeId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'版本号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ActionPlan_ManagerRule', @level2type=N'COLUMN',@level2name=N'VersionNo'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ActionPlan_ManagerRule', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ActionPlan_ManagerRule', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发布(true-发布，false-未发布)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ActionPlan_ManagerRule', @level2type=N'COLUMN',@level2name=N'IsIssue'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发布日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ActionPlan_ManagerRule', @level2type=N'COLUMN',@level2name=N'IssueDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标记（0-不参加流程，1-参加流程）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ActionPlan_ManagerRule', @level2type=N'COLUMN',@level2name=N'Flag'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'办理状态（0--重新编制, 1--编制, 2--现场HSSE经理, 3--项目HSSE经理,  4--项目经理，5--审批完成）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ActionPlan_ManagerRule', @level2type=N'COLUMN',@level2name=N'State'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ActionPlan_ManagerRule', @level2type=N'COLUMN',@level2name=N'SeeFile'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'管理规定表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ActionPlan_ManagerRule'
GO

ALTER TABLE [dbo].[ActionPlan_ManagerRule]  WITH CHECK ADD  CONSTRAINT [FK_ActionPlan_ManagerRule_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[ActionPlan_ManagerRule] CHECK CONSTRAINT [FK_ActionPlan_ManagerRule_Base_Project]
GO

ALTER TABLE [dbo].[ActionPlan_ManagerRule]  WITH CHECK ADD  CONSTRAINT [FK_ActionPlan_ManagerRule_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[ActionPlan_ManagerRule] CHECK CONSTRAINT [FK_ActionPlan_ManagerRule_Sys_User]
GO

CREATE VIEW [dbo].[View_ActionPlan_ManagerRule]
AS
/*项目管理规定视图*/
SELECT
	ManagerRule.ManagerRuleId,
	ManagerRule.ManageRuleCode,
	ManagerRule.ProjectId,
	LawManagerRule.ManageRuleCode AS OldManageRuleCode,
	ManagerRule.ManageRuleName,	
	ManagerRule.ManageRuleTypeId,
	ManagerRule.VersionNo,
	ManagerRule.CompileMan,
	ManagerRule.CompileDate,
	ManagerRule.AttachUrl,
	ManagerRule.IsIssue,
	(CASE WHEN LEN(ManagerRule.Remark) > 25 THEN LEFT(ManagerRule.Remark,25)+'...' ELSE ManagerRule.Remark END) AS ShortRemark,
	ManagerRule.Remark,
	ManagerRule.State,
	ManageRuleType.ManageRuleTypeCode AS ManageRuleTypeCode,
	ManageRuleType.ManageRuleTypeName AS ManageRuleTypeName,
	Substring(ManagerRule.AttachUrl,charindex('~',ManagerRule.AttachUrl)+1,LEN(ManagerRule.AttachUrl)) AS  AttachUrlName
FROM dbo.ActionPlan_ManagerRule AS ManagerRule
LEFT JOIN dbo.Law_ManageRule AS LawManagerRule on LawManagerRule.ManageRuleId=ManagerRule.OldManageRuleId
LEFT JOIN dbo.Base_ManageRuleType AS ManageRuleType ON ManageRuleType.ManageRuleTypeId=ManagerRule.ManageRuleTypeId


GO
CREATE TABLE [dbo].[Sys_CodeTemplateRule](
	[CodeTemplateRuleId] [nvarchar](50) NOT NULL,
	[MenuId] [nvarchar](50) NULL,
	[Template] [nvarchar](max) NULL,
	[Symbol] [nvarchar](10) NULL,
	[IsProjectCode] [bit] NULL,
	[Prefix] [nvarchar](50) NULL,
	[IsUnitCode] [bit] NULL,
	[Digit] [int] NULL,
 CONSTRAINT [PK_Sys_CodeTemplateRule] PRIMARY KEY CLUSTERED 
(
	[CodeTemplateRuleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单规则id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_CodeTemplateRule', @level2type=N'COLUMN',@level2name=N'CodeTemplateRuleId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_CodeTemplateRule', @level2type=N'COLUMN',@level2name=N'MenuId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'模板内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_CodeTemplateRule', @level2type=N'COLUMN',@level2name=N'Template'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'间隔符号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_CodeTemplateRule', @level2type=N'COLUMN',@level2name=N'Symbol'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否添加项目号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_CodeTemplateRule', @level2type=N'COLUMN',@level2name=N'IsProjectCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'前缀' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_CodeTemplateRule', @level2type=N'COLUMN',@level2name=N'Prefix'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否添加单位代号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_CodeTemplateRule', @level2type=N'COLUMN',@level2name=N'IsUnitCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流水号位数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_CodeTemplateRule', @level2type=N'COLUMN',@level2name=N'Digit'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单规则（编码/模板）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_CodeTemplateRule'
GO

CREATE TABLE [dbo].[ProjectData_TeamGroup](
	[TeamGroupId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[UnitId] [nvarchar](50) NULL,
	[TeamGroupCode] [nvarchar](50) NULL,
	[TeamGroupName] [nvarchar](50) NULL,
	[Remark] [nvarchar](500) NULL,
 CONSTRAINT [PK_ProjectData_TeamGroup] PRIMARY KEY CLUSTERED 
(
	[TeamGroupId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectData_TeamGroup', @level2type=N'COLUMN',@level2name=N'TeamGroupId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectData_TeamGroup', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单位Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectData_TeamGroup', @level2type=N'COLUMN',@level2name=N'UnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'班组编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectData_TeamGroup', @level2type=N'COLUMN',@level2name=N'TeamGroupCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'班组名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectData_TeamGroup', @level2type=N'COLUMN',@level2name=N'TeamGroupName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectData_TeamGroup', @level2type=N'COLUMN',@level2name=N'Remark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'班组表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectData_TeamGroup'
GO

ALTER TABLE [dbo].[ProjectData_TeamGroup]  WITH CHECK ADD  CONSTRAINT [FK_ProjectData_TeamGroup_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[ProjectData_TeamGroup] CHECK CONSTRAINT [FK_ProjectData_TeamGroup_Base_Project]
GO

ALTER TABLE [dbo].[ProjectData_TeamGroup]  WITH CHECK ADD  CONSTRAINT [FK_ProjectData_TeamGroup_Base_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[ProjectData_TeamGroup] CHECK CONSTRAINT [FK_ProjectData_TeamGroup_Base_Unit]
GO

CREATE TABLE [dbo].[ProjectData_WorkArea](
	[WorkAreaId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[UnitId] [nvarchar](50) NULL,
	[WorkAreaCode] [nvarchar](50) NULL,
	[WorkAreaName] [nvarchar](50) NULL,
	[Remark] [nvarchar](500) NULL,
 CONSTRAINT [PK_ProjectData_WorkArea] PRIMARY KEY CLUSTERED 
(
	[WorkAreaId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectData_WorkArea', @level2type=N'COLUMN',@level2name=N'WorkAreaId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectData_WorkArea', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单位Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectData_WorkArea', @level2type=N'COLUMN',@level2name=N'UnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'区域编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectData_WorkArea', @level2type=N'COLUMN',@level2name=N'WorkAreaCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'区域名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectData_WorkArea', @level2type=N'COLUMN',@level2name=N'WorkAreaName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectData_WorkArea', @level2type=N'COLUMN',@level2name=N'Remark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'施工区域' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectData_WorkArea'
GO

ALTER TABLE [dbo].[ProjectData_WorkArea]  WITH CHECK ADD  CONSTRAINT [FK_ProjectData_WorkArea_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[ProjectData_WorkArea] CHECK CONSTRAINT [FK_ProjectData_WorkArea_Base_Project]
GO

ALTER TABLE [dbo].[ProjectData_WorkArea]  WITH CHECK ADD  CONSTRAINT [FK_ProjectData_WorkArea_Base_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[ProjectData_WorkArea] CHECK CONSTRAINT [FK_ProjectData_WorkArea_Base_Unit]
GO

CREATE TABLE [dbo].[Meeting_WeekMeeting](
	[WeekMeetingId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[WeekMeetingCode] [nvarchar](50) NULL,
	[WeekMeetingName] [nvarchar](50) NULL,
	[WeekMeetingDate] [datetime] NULL,
	[CompileMan] [nvarchar](50) NULL,
	[WeekMeetingContents] [nvarchar](max) NULL,
	[CompileDate] [datetime] NULL,
	[States] [char](1) NULL,
 CONSTRAINT [PK_Meeting_WeekMeeting] PRIMARY KEY CLUSTERED 
(
	[WeekMeetingId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Meeting_WeekMeeting', @level2type=N'COLUMN',@level2name=N'WeekMeetingId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Meeting_WeekMeeting', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'会议编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Meeting_WeekMeeting', @level2type=N'COLUMN',@level2name=N'WeekMeetingCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'会议名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Meeting_WeekMeeting', @level2type=N'COLUMN',@level2name=N'WeekMeetingName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'会议时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Meeting_WeekMeeting', @level2type=N'COLUMN',@level2name=N'WeekMeetingDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'整理人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Meeting_WeekMeeting', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'会议内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Meeting_WeekMeeting', @level2type=N'COLUMN',@level2name=N'WeekMeetingContents'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Meeting_WeekMeeting', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Meeting_WeekMeeting', @level2type=N'COLUMN',@level2name=N'States'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'周例会' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Meeting_WeekMeeting'
GO

ALTER TABLE [dbo].[Meeting_WeekMeeting]  WITH CHECK ADD  CONSTRAINT [FK_Meeting_WeekMeeting_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[Meeting_WeekMeeting] CHECK CONSTRAINT [FK_Meeting_WeekMeeting_Base_Project]
GO

ALTER TABLE [dbo].[Meeting_WeekMeeting]  WITH CHECK ADD  CONSTRAINT [FK_Meeting_WeekMeeting_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[Meeting_WeekMeeting] CHECK CONSTRAINT [FK_Meeting_WeekMeeting_Sys_User]
GO
CREATE TABLE [dbo].[Meeting_MonthMeeting](
	[MonthMeetingId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[MonthMeetingCode] [nvarchar](50) NULL,
	[MonthMeetingName] [nvarchar](50) NULL,
	[MonthMeetingDate] [datetime] NULL,
	[CompileMan] [nvarchar](50) NULL,
	[MonthMeetingContents] [nvarchar](max) NULL,
	[CompileDate] [datetime] NULL,
	[States] [char](1) NULL,
 CONSTRAINT [PK_Meeting_MonthMeeting] PRIMARY KEY CLUSTERED 
(
	[MonthMeetingId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Meeting_MonthMeeting', @level2type=N'COLUMN',@level2name=N'MonthMeetingId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Meeting_MonthMeeting', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'月例会编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Meeting_MonthMeeting', @level2type=N'COLUMN',@level2name=N'MonthMeetingCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'月例会名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Meeting_MonthMeeting', @level2type=N'COLUMN',@level2name=N'MonthMeetingName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'月例会日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Meeting_MonthMeeting', @level2type=N'COLUMN',@level2name=N'MonthMeetingDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'整理人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Meeting_MonthMeeting', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'月例会内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Meeting_MonthMeeting', @level2type=N'COLUMN',@level2name=N'MonthMeetingContents'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Meeting_MonthMeeting', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Meeting_MonthMeeting', @level2type=N'COLUMN',@level2name=N'States'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'安全月例会' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Meeting_MonthMeeting'
GO

ALTER TABLE [dbo].[Meeting_MonthMeeting]  WITH CHECK ADD  CONSTRAINT [FK_Meeting_MonthMeeting_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[Meeting_MonthMeeting] CHECK CONSTRAINT [FK_Meeting_MonthMeeting_Base_Project]
GO

ALTER TABLE [dbo].[Meeting_MonthMeeting]  WITH CHECK ADD  CONSTRAINT [FK_Meeting_MonthMeeting_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[Meeting_MonthMeeting] CHECK CONSTRAINT [FK_Meeting_MonthMeeting_Sys_User]
GO

CREATE TABLE [dbo].[Meeting_SpecialMeeting](
	[SpecialMeetingId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[SpecialMeetingCode] [nvarchar](50) NULL,
	[SpecialMeetingName] [nvarchar](50) NULL,
	[SpecialMeetingDate] [datetime] NULL,
	[CompileMan] [nvarchar](50) NULL,
	[SpecialMeetingContents] [nvarchar](max) NULL,
	[CompileDate] [datetime] NULL,
	[States] [char](1) NULL,
 CONSTRAINT [PK_Meeting_SpecialMeeting] PRIMARY KEY CLUSTERED 
(
	[SpecialMeetingId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Meeting_SpecialMeeting', @level2type=N'COLUMN',@level2name=N'SpecialMeetingId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Meeting_SpecialMeeting', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'专题例会编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Meeting_SpecialMeeting', @level2type=N'COLUMN',@level2name=N'SpecialMeetingCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'专题例会名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Meeting_SpecialMeeting', @level2type=N'COLUMN',@level2name=N'SpecialMeetingName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'会议时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Meeting_SpecialMeeting', @level2type=N'COLUMN',@level2name=N'SpecialMeetingDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'整理人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Meeting_SpecialMeeting', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'会议内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Meeting_SpecialMeeting', @level2type=N'COLUMN',@level2name=N'SpecialMeetingContents'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Meeting_SpecialMeeting', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Meeting_SpecialMeeting', @level2type=N'COLUMN',@level2name=N'States'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'安全专题会议' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Meeting_SpecialMeeting'
GO

ALTER TABLE [dbo].[Meeting_SpecialMeeting]  WITH CHECK ADD  CONSTRAINT [FK_Meeting_SpecialMeeting_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[Meeting_SpecialMeeting] CHECK CONSTRAINT [FK_Meeting_SpecialMeeting_Base_Project]
GO

ALTER TABLE [dbo].[Meeting_SpecialMeeting]  WITH CHECK ADD  CONSTRAINT [FK_Meeting_SpecialMeeting_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[Meeting_SpecialMeeting] CHECK CONSTRAINT [FK_Meeting_SpecialMeeting_Sys_User]
GO

CREATE TABLE [dbo].[Meeting_AttendMeeting](
	[AttendMeetingId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[AttendMeetingCode] [nvarchar](50) NULL,
	[AttendMeetingName] [nvarchar](50) NULL,
	[AttendMeetingDate] [datetime] NULL,
	[CompileMan] [nvarchar](50) NULL,
	[AttendMeetingContents] [nvarchar](max) NULL,
	[CompileDate] [datetime] NULL,
	[States] [char](1) NULL,
 CONSTRAINT [PK_Meeting_AttendMeeting] PRIMARY KEY CLUSTERED 
(
	[AttendMeetingId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Meeting_AttendMeeting', @level2type=N'COLUMN',@level2name=N'AttendMeetingId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Meeting_AttendMeeting', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'会议记录编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Meeting_AttendMeeting', @level2type=N'COLUMN',@level2name=N'AttendMeetingCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'会议记录名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Meeting_AttendMeeting', @level2type=N'COLUMN',@level2name=N'AttendMeetingName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'会议日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Meeting_AttendMeeting', @level2type=N'COLUMN',@level2name=N'AttendMeetingDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'整理人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Meeting_AttendMeeting', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'会议内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Meeting_AttendMeeting', @level2type=N'COLUMN',@level2name=N'AttendMeetingContents'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Meeting_AttendMeeting', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Meeting_AttendMeeting', @level2type=N'COLUMN',@level2name=N'States'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'其他会议记录' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Meeting_AttendMeeting'
GO

ALTER TABLE [dbo].[Meeting_AttendMeeting]  WITH CHECK ADD  CONSTRAINT [FK_Meeting_AttendMeeting_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[Meeting_AttendMeeting] CHECK CONSTRAINT [FK_Meeting_AttendMeeting_Base_Project]
GO

ALTER TABLE [dbo].[Meeting_AttendMeeting]  WITH CHECK ADD  CONSTRAINT [FK_Meeting_AttendMeeting_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[Meeting_AttendMeeting] CHECK CONSTRAINT [FK_Meeting_AttendMeeting_Sys_User]
GO


CREATE TABLE [dbo].[Meeting_ClassMeeting](
	[ClassMeetingId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[ClassMeetingCode] [nvarchar](50) NULL,
	[ClassMeetingName] [nvarchar](50) NULL,
	[ClassMeetingDate] [datetime] NULL,
	[ClassMeetingContents] [nvarchar](max) NULL,
	[CompileMan] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
 CONSTRAINT [PK_Meeting_ClassMeeting] PRIMARY KEY CLUSTERED 
(
	[ClassMeetingId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Meeting_ClassMeeting', @level2type=N'COLUMN',@level2name=N'ClassMeetingId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Meeting_ClassMeeting', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'班前会编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Meeting_ClassMeeting', @level2type=N'COLUMN',@level2name=N'ClassMeetingCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'班前会名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Meeting_ClassMeeting', @level2type=N'COLUMN',@level2name=N'ClassMeetingName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'班前会时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Meeting_ClassMeeting', @level2type=N'COLUMN',@level2name=N'ClassMeetingDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'班前会内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Meeting_ClassMeeting', @level2type=N'COLUMN',@level2name=N'ClassMeetingContents'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'整理人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Meeting_ClassMeeting', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Meeting_ClassMeeting', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'班前会' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Meeting_ClassMeeting'
GO

ALTER TABLE [dbo].[Meeting_ClassMeeting]  WITH CHECK ADD  CONSTRAINT [FK_Meeting_ClassMeeting_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[Meeting_ClassMeeting] CHECK CONSTRAINT [FK_Meeting_ClassMeeting_Base_Project]
GO

ALTER TABLE [dbo].[Meeting_ClassMeeting]  WITH CHECK ADD  CONSTRAINT [FK_Meeting_ClassMeeting_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[Meeting_ClassMeeting] CHECK CONSTRAINT [FK_Meeting_ClassMeeting_Sys_User]
GO

ALTER VIEW [dbo].[View_Law_ManageRule]
AS
/*资源管理规定视图*/
SELECT
	LawManagerRule.ManageRuleId,
	LawManagerRule.ManageRuleCode,
	LawManagerRule.ManageRuleName,	
	LawManagerRule.ManageRuleTypeId,
	LawManagerRule.VersionNo,
	LawManagerRule.CompileMan,
	LawManagerRule.CompileDate,
	LawManagerRule.AttachUrl,
	LawManagerRule.Remark,
	(CASE WHEN len(LawManagerRule.Remark)>20 THEN Substring(LawManagerRule.Remark,0,20)+'...'
	ELSE LawManagerRule.Remark END) AS RemarkDef,
	LawManagerRule.IsPass,
	LawManagerRule.UnitId,
	LawManagerRule.IsBuild,
	LawManagerRule.UpState,
	ManageRuleType.ManageRuleTypeCode AS ManageRuleTypeCode,
	ManageRuleType.ManageRuleTypeName AS ManageRuleTypeName,
	Substring(LawManagerRule.AttachUrl,charindex('~',LawManagerRule.AttachUrl)+1,LEN(LawManagerRule.AttachUrl)) AS  AttachUrlName,
	(CASE WHEN LawManagerRule.UpState='1' THEN '本单位' WHEN LawManagerRule.UpState='2' THEN '待上报' when LawManagerRule.UpState='3' then '已上报' when LawManagerRule.UpState='4' then '上报失败' end) AS UpStates,
	ConstUpState.ConstText AS UpStateName,
	(CASE WHEN IsBuild = 1 THEN '集团' ELSE '' END ) AS IsBuildName
FROM dbo.Law_ManageRule AS LawManagerRule
LEFT JOIN dbo.Base_ManageRuleType AS ManageRuleType ON ManageRuleType.ManageRuleTypeId=LawManagerRule.ManageRuleTypeId
LEFT JOIN Sys_Const AS ConstUpState ON LawManagerRule.UpState=ConstUpState.ConstValue and ConstUpState.GroupId='UpState'


GO
CREATE TABLE [dbo].[Sys_CodeRecords](
	[CodeRecordId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[MenuId] [nvarchar](50) NULL,
	[DataId] [nvarchar](50) NULL,
	[UnitId] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
	[SortIndex] [int] NULL,
	[RuleCodes] [nvarchar](50) NULL,
	[Digit] [int] NULL,
	[Code] [nvarchar](50) NULL,
	[OwnerRuleCodes] [nvarchar](50) NULL,
	[OwerDigit] [int] NULL,
	[OwnerCode] [nvarchar](50) NULL,
 CONSTRAINT [PK_Sys_CodeRecords] PRIMARY KEY CLUSTERED 
(
	[CodeRecordId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Sys_CodeRecords]  WITH CHECK ADD  CONSTRAINT [FK_Sys_CodeRecords_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[Sys_CodeRecords] CHECK CONSTRAINT [FK_Sys_CodeRecords_Base_Project]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编码记录表主键id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_CodeRecords', @level2type=N'COLUMN',@level2name=N'CodeRecordId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_CodeRecords', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_CodeRecords', @level2type=N'COLUMN',@level2name=N'MenuId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单据id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_CodeRecords', @level2type=N'COLUMN',@level2name=N'DataId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_CodeRecords', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排列序号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_CodeRecords', @level2type=N'COLUMN',@level2name=N'SortIndex'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'规则字符串' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_CodeRecords', @level2type=N'COLUMN',@level2name=N'RuleCodes'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流水位数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_CodeRecords', @level2type=N'COLUMN',@level2name=N'Digit'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单据编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_CodeRecords', @level2type=N'COLUMN',@level2name=N'Code'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'业主单据规则' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_CodeRecords', @level2type=N'COLUMN',@level2name=N'OwnerRuleCodes'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'业主编码流水位数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_CodeRecords', @level2type=N'COLUMN',@level2name=N'OwerDigit'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'业主单据编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_CodeRecords', @level2type=N'COLUMN',@level2name=N'OwnerCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编码记录表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_CodeRecords'
GO

CREATE TABLE [dbo].[Inspection_Registration](
	[RegistrationId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[WorkAreaId] [nvarchar](50) NULL,
	[ProblemDescription] [nvarchar](800) NULL,
	[ProblemTypes] [nvarchar](200) NULL,
	[TakeSteps] [nvarchar](500) NULL,
	[ResponsibilityUnitId] [nvarchar](50) NULL,
	[ResponsibilityManId] [nvarchar](50) NULL,
	[RectificationPeriod] [datetime] NULL,
	[CheckManId] [nvarchar](50) NULL,
	[CheckTime] [datetime] NULL,
	[ImageUrl] [nvarchar](2000) NULL,
	[RectificationImageUrl] [nvarchar](2000) NULL,
	[RectificationTime] [datetime] NULL,
	[State] [char](1) NULL,
 CONSTRAINT [PK_Inspection_Registration] PRIMARY KEY CLUSTERED 
(
	[RegistrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[Inspection_Registration]  WITH CHECK ADD  CONSTRAINT [FK_Inspection_Registration_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[Inspection_Registration] CHECK CONSTRAINT [FK_Inspection_Registration_Base_Project]
GO

ALTER TABLE [dbo].[Inspection_Registration]  WITH CHECK ADD  CONSTRAINT [FK_Inspection_Registration_Base_Unit] FOREIGN KEY([ResponsibilityUnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[Inspection_Registration] CHECK CONSTRAINT [FK_Inspection_Registration_Base_Unit]
GO

ALTER TABLE [dbo].[Inspection_Registration]  WITH CHECK ADD  CONSTRAINT [FK_Inspection_Registration_ProjectData_WorkArea] FOREIGN KEY([WorkAreaId])
REFERENCES [dbo].[ProjectData_WorkArea] ([WorkAreaId])
GO

ALTER TABLE [dbo].[Inspection_Registration] CHECK CONSTRAINT [FK_Inspection_Registration_ProjectData_WorkArea]
GO

ALTER TABLE [dbo].[Inspection_Registration]  WITH CHECK ADD  CONSTRAINT [FK_Inspection_Registration_Sys_User] FOREIGN KEY([CheckManId])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[Inspection_Registration] CHECK CONSTRAINT [FK_Inspection_Registration_Sys_User]
GO

ALTER TABLE [dbo].[Inspection_Registration]  WITH CHECK ADD  CONSTRAINT [FK_Inspection_Registration_Sys_User1] FOREIGN KEY([ResponsibilityManId])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[Inspection_Registration] CHECK CONSTRAINT [FK_Inspection_Registration_Sys_User1]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Inspection_Registration', @level2type=N'COLUMN',@level2name=N'RegistrationId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目id【Base_Project】' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Inspection_Registration', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'位置id【ProjectData_WorkArea】' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Inspection_Registration', @level2type=N'COLUMN',@level2name=N'WorkAreaId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'问题描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Inspection_Registration', @level2type=N'COLUMN',@level2name=N'ProblemDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'问题类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Inspection_Registration', @level2type=N'COLUMN',@level2name=N'ProblemTypes'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'采取措施' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Inspection_Registration', @level2type=N'COLUMN',@level2name=N'TakeSteps'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'责任单位id【Base_Unit】' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Inspection_Registration', @level2type=N'COLUMN',@level2name=N'ResponsibilityUnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'责任人id【Sys_User】' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Inspection_Registration', @level2type=N'COLUMN',@level2name=N'ResponsibilityManId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'整改期限' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Inspection_Registration', @level2type=N'COLUMN',@level2name=N'RectificationPeriod'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'检查人（取当前登录人）【Sys_User】' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Inspection_Registration', @level2type=N'COLUMN',@level2name=N'CheckManId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'检查时间（建议取到分钟）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Inspection_Registration', @level2type=N'COLUMN',@level2name=N'CheckTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图片路径' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Inspection_Registration', @level2type=N'COLUMN',@level2name=N'ImageUrl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'整改后图片路径' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Inspection_Registration', @level2type=N'COLUMN',@level2name=N'RectificationImageUrl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'整改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Inspection_Registration', @level2type=N'COLUMN',@level2name=N'RectificationTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态（未整改、已整改、已闭环）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Inspection_Registration', @level2type=N'COLUMN',@level2name=N'State'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'隐患巡检登记表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Inspection_Registration'
GO

CREATE TABLE [dbo].[ActionPlan_ActionPlanList](
	[ActionPlanListId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[ActionPlanListCode] [nvarchar](50) NULL,
	[ActionPlanListName] [nvarchar](50) NULL,
	[VersionNo] [nchar](10) NULL,
	[ProjectType] [char](1) NULL,
	[ActionPlanListContents] [nvarchar](max) NULL,
	[CompileMan] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
	[States] [char](1) NULL,
 CONSTRAINT [PK_ActionPlan_ActionPlanList] PRIMARY KEY CLUSTERED 
(
	[ActionPlanListId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ActionPlan_ActionPlanList', @level2type=N'COLUMN',@level2name=N'ActionPlanListId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ActionPlan_ActionPlanList', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'实施计划编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ActionPlan_ActionPlanList', @level2type=N'COLUMN',@level2name=N'ActionPlanListCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'实施计划名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ActionPlan_ActionPlanList', @level2type=N'COLUMN',@level2name=N'ActionPlanListName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'版本号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ActionPlan_ActionPlanList', @level2type=N'COLUMN',@level2name=N'VersionNo'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目类型（1-系统内项目，2-系统外项目，3-海外项目）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ActionPlan_ActionPlanList', @level2type=N'COLUMN',@level2name=N'ProjectType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'实施计划内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ActionPlan_ActionPlanList', @level2type=N'COLUMN',@level2name=N'ActionPlanListContents'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ActionPlan_ActionPlanList', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ActionPlan_ActionPlanList', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ActionPlan_ActionPlanList', @level2type=N'COLUMN',@level2name=N'States'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'实施计划' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ActionPlan_ActionPlanList'
GO

ALTER TABLE [dbo].[ActionPlan_ActionPlanList]  WITH CHECK ADD  CONSTRAINT [FK_ActionPlan_ActionPlanList_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[ActionPlan_ActionPlanList] CHECK CONSTRAINT [FK_ActionPlan_ActionPlanList_Base_Project]
GO

ALTER TABLE [dbo].[ActionPlan_ActionPlanList]  WITH CHECK ADD  CONSTRAINT [FK_ActionPlan_ActionPlanList_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[ActionPlan_ActionPlanList] CHECK CONSTRAINT [FK_ActionPlan_ActionPlanList_Sys_User]
GO


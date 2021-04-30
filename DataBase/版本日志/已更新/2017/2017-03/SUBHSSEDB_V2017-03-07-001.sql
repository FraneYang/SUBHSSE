CREATE TABLE [dbo].[ActionPlan_ActionPlanSummary](
	[ActionPlanSummaryId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[UnitId] [nvarchar](50) NULL,
	[Code] [nvarchar](50) NULL,
	[Name] [nvarchar](50) NULL,
	[Contents] [nvarchar](max) NULL,
	[CompileMan] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
	[States] [char](1) NULL,
 CONSTRAINT [PK_ActionPlan_ActionPlanSummary] PRIMARY KEY CLUSTERED 
(
	[ActionPlanSummaryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[ActionPlan_ActionPlanSummary]  WITH CHECK ADD  CONSTRAINT [FK_ActionPlan_ActionPlanSummary_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[ActionPlan_ActionPlanSummary] CHECK CONSTRAINT [FK_ActionPlan_ActionPlanSummary_Base_Project]
GO

ALTER TABLE [dbo].[ActionPlan_ActionPlanSummary]  WITH CHECK ADD  CONSTRAINT [FK_ActionPlan_ActionPlanSummary_Base_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[ActionPlan_ActionPlanSummary] CHECK CONSTRAINT [FK_ActionPlan_ActionPlanSummary_Base_Unit]
GO

ALTER TABLE [dbo].[ActionPlan_ActionPlanSummary]  WITH CHECK ADD  CONSTRAINT [FK_ActionPlan_ActionPlanSummary_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[ActionPlan_ActionPlanSummary] CHECK CONSTRAINT [FK_ActionPlan_ActionPlanSummary_Sys_User]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ActionPlan_ActionPlanSummary', @level2type=N'COLUMN',@level2name=N'ActionPlanSummaryId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ActionPlan_ActionPlanSummary', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单位id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ActionPlan_ActionPlanSummary', @level2type=N'COLUMN',@level2name=N'UnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ActionPlan_ActionPlanSummary', @level2type=N'COLUMN',@level2name=N'Code'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ActionPlan_ActionPlanSummary', @level2type=N'COLUMN',@level2name=N'Name'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'实施计划总结' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ActionPlan_ActionPlanSummary', @level2type=N'COLUMN',@level2name=N'Contents'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ActionPlan_ActionPlanSummary', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ActionPlan_ActionPlanSummary', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ActionPlan_ActionPlanSummary', @level2type=N'COLUMN',@level2name=N'States'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'实施计划总结' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ActionPlan_ActionPlanSummary'
GO

CREATE TABLE [dbo].[SafetyActivities_ThemeActivities](
	[ThemeActivitiesId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[Title] [nvarchar](500) NULL,
	[CompileDate] [datetime] NULL,
	[CompileMan] [nvarchar](50) NULL,
	[Remark] [nvarchar](1000) NULL,
	[SeeFile] [nvarchar](max) NULL,
	[AttachUrl] [nvarchar](2000) NULL,
 CONSTRAINT [PK_SafetyActivities_ThemeActivities] PRIMARY KEY CLUSTERED 
(
	[ThemeActivitiesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [dbo].[SafetyActivities_ThemeActivities]  WITH CHECK ADD  CONSTRAINT [FK_SafetyActivities_ThemeActivities_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[SafetyActivities_ThemeActivities] CHECK CONSTRAINT [FK_SafetyActivities_ThemeActivities_Base_Project]
GO

ALTER TABLE [dbo].[SafetyActivities_ThemeActivities]  WITH CHECK ADD  CONSTRAINT [FK_SafetyActivities_ThemeActivities_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[SafetyActivities_ThemeActivities] CHECK CONSTRAINT [FK_SafetyActivities_ThemeActivities_Sys_User]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyActivities_ThemeActivities', @level2type=N'COLUMN',@level2name=N'ThemeActivitiesId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyActivities_ThemeActivities', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyActivities_ThemeActivities', @level2type=N'COLUMN',@level2name=N'Title'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'整理人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyActivities_ThemeActivities', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyActivities_ThemeActivities', @level2type=N'COLUMN',@level2name=N'Remark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件查看' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyActivities_ThemeActivities', @level2type=N'COLUMN',@level2name=N'SeeFile'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'附件' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyActivities_ThemeActivities', @level2type=N'COLUMN',@level2name=N'AttachUrl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主题安全活动' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyActivities_ThemeActivities'
GO

CREATE TABLE [dbo].[SafetyActivities_MonthlyRating](
	[MonthlyRatingId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[Title] [nvarchar](500) NULL,
	[CompileDate] [datetime] NULL,
	[CompileMan] [nvarchar](50) NULL,
	[Remark] [nvarchar](1000) NULL,
	[SeeFile] [nvarchar](max) NULL,
	[AttachUrl] [nvarchar](2000) NULL,
 CONSTRAINT [PK_SafetyActivities_MonthlyRating] PRIMARY KEY CLUSTERED 
(
	[MonthlyRatingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [dbo].[SafetyActivities_MonthlyRating]  WITH CHECK ADD  CONSTRAINT [FK_SafetyActivities_MonthlyRating_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[SafetyActivities_MonthlyRating] CHECK CONSTRAINT [FK_SafetyActivities_MonthlyRating_Base_Project]
GO

ALTER TABLE [dbo].[SafetyActivities_MonthlyRating]  WITH CHECK ADD  CONSTRAINT [FK_SafetyActivities_MonthlyRating_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[SafetyActivities_MonthlyRating] CHECK CONSTRAINT [FK_SafetyActivities_MonthlyRating_Sys_User]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyActivities_MonthlyRating', @level2type=N'COLUMN',@level2name=N'MonthlyRatingId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyActivities_MonthlyRating', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyActivities_MonthlyRating', @level2type=N'COLUMN',@level2name=N'Title'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'整理人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyActivities_MonthlyRating', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyActivities_MonthlyRating', @level2type=N'COLUMN',@level2name=N'Remark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件查看' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyActivities_MonthlyRating', @level2type=N'COLUMN',@level2name=N'SeeFile'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'附件' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyActivities_MonthlyRating', @level2type=N'COLUMN',@level2name=N'AttachUrl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'月度安全评比' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyActivities_MonthlyRating'
GO

CREATE TABLE [dbo].[SafetyActivities_SafetyMonth](
	[SafetyMonthId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[Title] [nvarchar](500) NULL,
	[CompileDate] [datetime] NULL,
	[CompileMan] [nvarchar](50) NULL,
	[Remark] [nvarchar](1000) NULL,
	[SeeFile] [nvarchar](max) NULL,
	[AttachUrl] [nvarchar](2000) NULL,
 CONSTRAINT [PK_SafetyActivities_SafetyMonth] PRIMARY KEY CLUSTERED 
(
	[SafetyMonthId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [dbo].[SafetyActivities_SafetyMonth]  WITH CHECK ADD  CONSTRAINT [FK_SafetyActivities_SafetyMonth_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[SafetyActivities_SafetyMonth] CHECK CONSTRAINT [FK_SafetyActivities_SafetyMonth_Base_Project]
GO

ALTER TABLE [dbo].[SafetyActivities_SafetyMonth]  WITH CHECK ADD  CONSTRAINT [FK_SafetyActivities_SafetyMonth_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[SafetyActivities_SafetyMonth] CHECK CONSTRAINT [FK_SafetyActivities_SafetyMonth_Sys_User]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyActivities_SafetyMonth', @level2type=N'COLUMN',@level2name=N'SafetyMonthId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyActivities_SafetyMonth', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyActivities_SafetyMonth', @level2type=N'COLUMN',@level2name=N'Title'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'整理人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyActivities_SafetyMonth', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyActivities_SafetyMonth', @level2type=N'COLUMN',@level2name=N'Remark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件查看' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyActivities_SafetyMonth', @level2type=N'COLUMN',@level2name=N'SeeFile'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'附件' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyActivities_SafetyMonth', @level2type=N'COLUMN',@level2name=N'AttachUrl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'全国安全月' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyActivities_SafetyMonth'
GO

CREATE TABLE [dbo].[SafetyActivities_FireActivities](
	[FireActivitiesId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[Title] [nvarchar](500) NULL,
	[CompileDate] [datetime] NULL,
	[CompileMan] [nvarchar](50) NULL,
	[Remark] [nvarchar](1000) NULL,
	[SeeFile] [nvarchar](max) NULL,
	[AttachUrl] [nvarchar](2000) NULL,
 CONSTRAINT [PK_SafetyActivities_FireActivities] PRIMARY KEY CLUSTERED 
(
	[FireActivitiesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [dbo].[SafetyActivities_FireActivities]  WITH CHECK ADD  CONSTRAINT [FK_SafetyActivities_FireActivities_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[SafetyActivities_FireActivities] CHECK CONSTRAINT [FK_SafetyActivities_FireActivities_Base_Project]
GO

ALTER TABLE [dbo].[SafetyActivities_FireActivities]  WITH CHECK ADD  CONSTRAINT [FK_SafetyActivities_FireActivities_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[SafetyActivities_FireActivities] CHECK CONSTRAINT [FK_SafetyActivities_FireActivities_Sys_User]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyActivities_FireActivities', @level2type=N'COLUMN',@level2name=N'FireActivitiesId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyActivities_FireActivities', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyActivities_FireActivities', @level2type=N'COLUMN',@level2name=N'Title'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'整理人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyActivities_FireActivities', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyActivities_FireActivities', @level2type=N'COLUMN',@level2name=N'Remark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件查看' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyActivities_FireActivities', @level2type=N'COLUMN',@level2name=N'SeeFile'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'附件' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyActivities_FireActivities', @level2type=N'COLUMN',@level2name=N'AttachUrl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'119消防' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyActivities_FireActivities'
GO

CREATE TABLE [dbo].[SafetyActivities_OtherActivities](
	[OtherActivitiesId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[Title] [nvarchar](500) NULL,
	[CompileDate] [datetime] NULL,
	[CompileMan] [nvarchar](50) NULL,
	[Remark] [nvarchar](1000) NULL,
	[SeeFile] [nvarchar](max) NULL,
	[AttachUrl] [nvarchar](2000) NULL,
 CONSTRAINT [PK_SafetyActivities_OtherActivities] PRIMARY KEY CLUSTERED 
(
	[OtherActivitiesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [dbo].[SafetyActivities_OtherActivities]  WITH CHECK ADD  CONSTRAINT [FK_SafetyActivities_OtherActivities_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[SafetyActivities_OtherActivities] CHECK CONSTRAINT [FK_SafetyActivities_OtherActivities_Base_Project]
GO

ALTER TABLE [dbo].[SafetyActivities_OtherActivities]  WITH CHECK ADD  CONSTRAINT [FK_SafetyActivities_OtherActivities_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[SafetyActivities_OtherActivities] CHECK CONSTRAINT [FK_SafetyActivities_OtherActivities_Sys_User]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyActivities_OtherActivities', @level2type=N'COLUMN',@level2name=N'OtherActivitiesId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyActivities_OtherActivities', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyActivities_OtherActivities', @level2type=N'COLUMN',@level2name=N'Title'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'整理人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyActivities_OtherActivities', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyActivities_OtherActivities', @level2type=N'COLUMN',@level2name=N'Remark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件查看' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyActivities_OtherActivities', @level2type=N'COLUMN',@level2name=N'SeeFile'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'附件' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyActivities_OtherActivities', @level2type=N'COLUMN',@level2name=N'AttachUrl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'其他安全活动' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyActivities_OtherActivities'
GO

CREATE TABLE [dbo].[Check_SupervisionNotice](
	[SupervisionNoticeId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NOT NULL,
	[SupervisionNoticeCode] [nvarchar](50) NOT NULL,
	[UnitId] [nvarchar](50) NOT NULL,
	[WorkAreaId] [nvarchar](50) NULL,
	[CheckedDate] [datetime] NULL,
	[WrongContent] [nvarchar](3000) NULL,
	[SignPerson] [nvarchar](50) NULL,
	[SignDate] [datetime] NULL,
	[CompleteStatus] [nvarchar](3000) NULL,
	[DutyPerson] [nvarchar](50) NULL,
	[CompleteDate] [datetime] NULL,
	[IsRectify] [bit] NULL,
	[CheckPerson] [nvarchar](50) NULL,
	[AttachUrl] [nvarchar](2000) NULL,
 CONSTRAINT [PK_Check_SupervisionNotice] PRIMARY KEY CLUSTERED 
(
	[SupervisionNoticeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Check_SupervisionNotice]  WITH CHECK ADD  CONSTRAINT [FK_Check_SupervisionNotice_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[Check_SupervisionNotice] CHECK CONSTRAINT [FK_Check_SupervisionNotice_Base_Project]
GO

ALTER TABLE [dbo].[Check_SupervisionNotice]  WITH CHECK ADD  CONSTRAINT [FK_Check_SupervisionNotice_Base_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[Check_SupervisionNotice] CHECK CONSTRAINT [FK_Check_SupervisionNotice_Base_Unit]
GO

ALTER TABLE [dbo].[Check_SupervisionNotice]  WITH CHECK ADD  CONSTRAINT [FK_Check_SupervisionNotice_ProjectData_WorkArea] FOREIGN KEY([WorkAreaId])
REFERENCES [dbo].[ProjectData_WorkArea] ([WorkAreaId])
GO

ALTER TABLE [dbo].[Check_SupervisionNotice] CHECK CONSTRAINT [FK_Check_SupervisionNotice_ProjectData_WorkArea]
GO

ALTER TABLE [dbo].[Check_SupervisionNotice]  WITH CHECK ADD  CONSTRAINT [FK_Check_SupervisionNotice_Sys_User] FOREIGN KEY([SignPerson])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[Check_SupervisionNotice] CHECK CONSTRAINT [FK_Check_SupervisionNotice_Sys_User]
GO

ALTER TABLE [dbo].[Check_SupervisionNotice]  WITH CHECK ADD  CONSTRAINT [FK_Check_SupervisionNotice_Sys_User1] FOREIGN KEY([CheckPerson])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[Check_SupervisionNotice] CHECK CONSTRAINT [FK_Check_SupervisionNotice_Sys_User1]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_SupervisionNotice', @level2type=N'COLUMN',@level2name=N'SupervisionNoticeId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_SupervisionNotice', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_SupervisionNotice', @level2type=N'COLUMN',@level2name=N'SupervisionNoticeCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单位Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_SupervisionNotice', @level2type=N'COLUMN',@level2name=N'UnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'区域id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_SupervisionNotice', @level2type=N'COLUMN',@level2name=N'WorkAreaId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'受检时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_SupervisionNotice', @level2type=N'COLUMN',@level2name=N'CheckedDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'安全隐患内容及整改意见' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_SupervisionNotice', @level2type=N'COLUMN',@level2name=N'WrongContent'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'签发人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_SupervisionNotice', @level2type=N'COLUMN',@level2name=N'SignPerson'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_SupervisionNotice', @level2type=N'COLUMN',@level2name=N'SignDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'整改措施和完成情况' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_SupervisionNotice', @level2type=N'COLUMN',@level2name=N'CompleteStatus'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'责任人  ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_SupervisionNotice', @level2type=N'COLUMN',@level2name=N'DutyPerson'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_SupervisionNotice', @level2type=N'COLUMN',@level2name=N'CompleteDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'本单位检查是否完成整改' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_SupervisionNotice', @level2type=N'COLUMN',@level2name=N'IsRectify'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'本单位检查人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_SupervisionNotice', @level2type=N'COLUMN',@level2name=N'CheckPerson'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'附件' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_SupervisionNotice', @level2type=N'COLUMN',@level2name=N'AttachUrl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'监理隐患整改通知单' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_SupervisionNotice'
GO

INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('CDEA8829-9E6E-4CF3-AC2E-A2800D7C04B6','F910062E-98B0-486F-A8BD-D5B0035F808F','审核',5)	
GO

CREATE TABLE [dbo].[Check_ContactList](
	[ContactListId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[Code] [nvarchar](50) NULL,
	[SponsorUnitId] [nvarchar](50) NULL,
	[ReceivingUnits] [nvarchar](500) NULL,
	[ReceivingUnitNames] [nvarchar](2000) NULL,
	[CompileDate] [datetime] NULL,
	[CompileMan] [nvarchar](50) NULL,
	[Remark] [nvarchar](1000) NULL,
	[SeeFile] [nvarchar](max) NULL,
	[AttachUrl] [nvarchar](2000) NULL,
 CONSTRAINT [PK_Check_ContactList] PRIMARY KEY CLUSTERED 
(
	[ContactListId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [dbo].[Check_ContactList]  WITH CHECK ADD  CONSTRAINT [FK_Check_ContactList_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[Check_ContactList] CHECK CONSTRAINT [FK_Check_ContactList_Base_Project]
GO

ALTER TABLE [dbo].[Check_ContactList]  WITH CHECK ADD  CONSTRAINT [FK_Check_ContactList_Base_Unit] FOREIGN KEY([SponsorUnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[Check_ContactList] CHECK CONSTRAINT [FK_Check_ContactList_Base_Unit]
GO

ALTER TABLE [dbo].[Check_ContactList]  WITH CHECK ADD  CONSTRAINT [FK_Check_ContactList_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[Check_ContactList] CHECK CONSTRAINT [FK_Check_ContactList_Sys_User]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_ContactList', @level2type=N'COLUMN',@level2name=N'ContactListId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_ContactList', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_ContactList', @level2type=N'COLUMN',@level2name=N'Code'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发起单位' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_ContactList', @level2type=N'COLUMN',@level2name=N'SponsorUnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'接收单位' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_ContactList', @level2type=N'COLUMN',@level2name=N'ReceivingUnits'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'接收单位名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_ContactList', @level2type=N'COLUMN',@level2name=N'ReceivingUnitNames'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'整理人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_ContactList', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_ContactList', @level2type=N'COLUMN',@level2name=N'Remark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件查看' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_ContactList', @level2type=N'COLUMN',@level2name=N'SeeFile'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'附件' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_ContactList', @level2type=N'COLUMN',@level2name=N'AttachUrl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'联系单' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_ContactList'
GO



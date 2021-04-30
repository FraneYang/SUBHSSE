drop table dbo.ProjectSupervision_ProjectEvaluation
GO

CREATE TABLE [dbo].[ProjectSupervision_ProjectEvaluation](
	[PerfomanceRecordId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NOT NULL,
	[PerfomanceRecordCode] [nvarchar](50) NOT NULL,
	[EvaluationDate] [datetime] NULL,
	[EvaluationDef] [nvarchar](200) NULL,
	[RewardOrPunish] [char](1) NULL,
	[RPMoney] [decimal](18, 2) NULL,
	[AssessmentGroup] [nvarchar](200) NULL,
	[Behavior_1] [nvarchar](50) NULL,
	[Behavior_2] [nvarchar](50) NULL,
	[Behavior_3] [nvarchar](50) NULL,
	[Behavior_4] [nvarchar](50) NULL,
	[Behavior_5] [nvarchar](50) NULL,
	[Behavior_6] [nvarchar](50) NULL,
	[Behavior_7] [nvarchar](50) NULL,
	[Behavior_8] [nvarchar](50) NULL,
	[Behavior_9] [nvarchar](50) NULL,
	[Behavior_10] [nvarchar](50) NULL,
	[Behavior_11] [nvarchar](50) NULL,
	[Behavior_12] [nvarchar](50) NULL,
	[Behavior_13] [nvarchar](50) NULL,
	[Behavior_14] [nvarchar](50) NULL,
	[Behavior_15] [nvarchar](50) NULL,
	[Behavior_16] [nvarchar](50) NULL,
	[Behavior_17] [nvarchar](50) NULL,
	[Behavior_18] [nvarchar](50) NULL,
	[Behavior_19] [nvarchar](50) NULL,
	[Behavior_20] [nvarchar](50) NULL,
	[Score_1] [numeric](9, 1) NULL,
	[Score_2] [numeric](9, 1) NULL,
	[Score_3] [numeric](9, 1) NULL,
	[Score_4] [numeric](9, 1) NULL,
	[Score_5] [numeric](9, 1) NULL,
	[Score_6] [numeric](9, 1) NULL,
	[Score_7] [numeric](9, 1) NULL,
	[Score_8] [numeric](9, 1) NULL,
	[Score_9] [numeric](9, 1) NULL,
	[Score_10] [numeric](9, 1) NULL,
	[Score_11] [numeric](9, 1) NULL,
	[Score_12] [numeric](9, 1) NULL,
	[Score_13] [numeric](9, 1) NULL,
	[Score_14] [numeric](9, 1) NULL,
	[Score_15] [numeric](9, 1) NULL,
	[Score_16] [numeric](9, 1) NULL,
	[Score_17] [numeric](9, 1) NULL,
	[Score_18] [numeric](9, 1) NULL,
	[Score_19] [numeric](9, 1) NULL,
	[Score_20] [numeric](9, 1) NULL,
	[TotalJudging] [nvarchar](100) NULL,
	[TotalScore] [numeric](9, 1) NULL,
	[States] [char](1) NULL,
	[CompileMan] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
	[AttachUrl] [nvarchar](2000) NULL,
 CONSTRAINT [PK_ProjectSupervision_ProjectEvaluation] PRIMARY KEY CLUSTERED 
(
	[PerfomanceRecordId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation', @level2type=N'COLUMN',@level2name=N'PerfomanceRecordId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation', @level2type=N'COLUMN',@level2name=N'PerfomanceRecordCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'评价时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation', @level2type=N'COLUMN',@level2name=N'EvaluationDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'评价描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation', @level2type=N'COLUMN',@level2name=N'EvaluationDef'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'奖/罚' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation', @level2type=N'COLUMN',@level2name=N'RewardOrPunish'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'金额' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation', @level2type=N'COLUMN',@level2name=N'RPMoney'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'考评组' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation', @level2type=N'COLUMN',@level2name=N'AssessmentGroup'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'表现情况_1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation', @level2type=N'COLUMN',@level2name=N'Behavior_1'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'表现情况_2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation', @level2type=N'COLUMN',@level2name=N'Behavior_2'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'表现情况_3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation', @level2type=N'COLUMN',@level2name=N'Behavior_3'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'表现情况_4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation', @level2type=N'COLUMN',@level2name=N'Behavior_4'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'表现情况_5' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation', @level2type=N'COLUMN',@level2name=N'Behavior_5'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'表现情况_6' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation', @level2type=N'COLUMN',@level2name=N'Behavior_6'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'表现情况_7' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation', @level2type=N'COLUMN',@level2name=N'Behavior_7'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'表现情况_8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation', @level2type=N'COLUMN',@level2name=N'Behavior_8'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'表现情况_9' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation', @level2type=N'COLUMN',@level2name=N'Behavior_9'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'表现情况_10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation', @level2type=N'COLUMN',@level2name=N'Behavior_10'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'表现情况_11' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation', @level2type=N'COLUMN',@level2name=N'Behavior_11'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'表现情况_12' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation', @level2type=N'COLUMN',@level2name=N'Behavior_12'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'表现情况_13' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation', @level2type=N'COLUMN',@level2name=N'Behavior_13'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'表现情况_14' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation', @level2type=N'COLUMN',@level2name=N'Behavior_14'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'表现情况_15' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation', @level2type=N'COLUMN',@level2name=N'Behavior_15'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'表现情况_16' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation', @level2type=N'COLUMN',@level2name=N'Behavior_16'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'表现情况_17' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation', @level2type=N'COLUMN',@level2name=N'Behavior_17'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'表现情况_18' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation', @level2type=N'COLUMN',@level2name=N'Behavior_18'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'表现情况_19' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation', @level2type=N'COLUMN',@level2name=N'Behavior_19'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'表现情况_20' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation', @level2type=N'COLUMN',@level2name=N'Behavior_20'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'实得分_1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation', @level2type=N'COLUMN',@level2name=N'Score_1'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'实得分_2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation', @level2type=N'COLUMN',@level2name=N'Score_2'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'实得分_3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation', @level2type=N'COLUMN',@level2name=N'Score_3'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'实得分_4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation', @level2type=N'COLUMN',@level2name=N'Score_4'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'实得分_5' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation', @level2type=N'COLUMN',@level2name=N'Score_5'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'实得分_6' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation', @level2type=N'COLUMN',@level2name=N'Score_6'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'实得分_7' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation', @level2type=N'COLUMN',@level2name=N'Score_7'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'实得分_8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation', @level2type=N'COLUMN',@level2name=N'Score_8'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'实得分_9' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation', @level2type=N'COLUMN',@level2name=N'Score_9'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'实得分_10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation', @level2type=N'COLUMN',@level2name=N'Score_10'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'实得分_11' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation', @level2type=N'COLUMN',@level2name=N'Score_11'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'实得分_12' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation', @level2type=N'COLUMN',@level2name=N'Score_12'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'实得分_13' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation', @level2type=N'COLUMN',@level2name=N'Score_13'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'实得分_14' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation', @level2type=N'COLUMN',@level2name=N'Score_14'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'实得分_15' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation', @level2type=N'COLUMN',@level2name=N'Score_15'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'实得分_16' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation', @level2type=N'COLUMN',@level2name=N'Score_16'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'实得分_17' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation', @level2type=N'COLUMN',@level2name=N'Score_17'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'实得分_18' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation', @level2type=N'COLUMN',@level2name=N'Score_18'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'实得分_19' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation', @level2type=N'COLUMN',@level2name=N'Score_19'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'实得分_20' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation', @level2type=N'COLUMN',@level2name=N'Score_20'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'综合评语' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation', @level2type=N'COLUMN',@level2name=N'TotalJudging'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'总分数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation', @level2type=N'COLUMN',@level2name=N'TotalScore'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation', @level2type=N'COLUMN',@level2name=N'States'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'附件' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation', @level2type=N'COLUMN',@level2name=N'AttachUrl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分包方绩效评价' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation'
GO

ALTER TABLE [dbo].[ProjectSupervision_ProjectEvaluation]  WITH CHECK ADD  CONSTRAINT [FK_ProjectSupervision_ProjectEvaluation_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[ProjectSupervision_ProjectEvaluation] CHECK CONSTRAINT [FK_ProjectSupervision_ProjectEvaluation_Base_Project]
GO

ALTER TABLE [dbo].[ProjectSupervision_ProjectEvaluation]  WITH CHECK ADD  CONSTRAINT [FK_ProjectSupervision_ProjectEvaluation_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[ProjectSupervision_ProjectEvaluation] CHECK CONSTRAINT [FK_ProjectSupervision_ProjectEvaluation_Sys_User]
GO



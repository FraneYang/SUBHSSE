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

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation', @level2type=N'COLUMN',@level2name=N'PerfomanceRecordId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ĿID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation', @level2type=N'COLUMN',@level2name=N'PerfomanceRecordCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation', @level2type=N'COLUMN',@level2name=N'EvaluationDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation', @level2type=N'COLUMN',@level2name=N'EvaluationDef'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��/��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation', @level2type=N'COLUMN',@level2name=N'RewardOrPunish'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation', @level2type=N'COLUMN',@level2name=N'RPMoney'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation', @level2type=N'COLUMN',@level2name=N'AssessmentGroup'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�������_1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation', @level2type=N'COLUMN',@level2name=N'Behavior_1'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�������_2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation', @level2type=N'COLUMN',@level2name=N'Behavior_2'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�������_3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation', @level2type=N'COLUMN',@level2name=N'Behavior_3'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�������_4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation', @level2type=N'COLUMN',@level2name=N'Behavior_4'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�������_5' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation', @level2type=N'COLUMN',@level2name=N'Behavior_5'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�������_6' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation', @level2type=N'COLUMN',@level2name=N'Behavior_6'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�������_7' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation', @level2type=N'COLUMN',@level2name=N'Behavior_7'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�������_8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation', @level2type=N'COLUMN',@level2name=N'Behavior_8'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�������_9' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation', @level2type=N'COLUMN',@level2name=N'Behavior_9'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�������_10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation', @level2type=N'COLUMN',@level2name=N'Behavior_10'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�������_11' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation', @level2type=N'COLUMN',@level2name=N'Behavior_11'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�������_12' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation', @level2type=N'COLUMN',@level2name=N'Behavior_12'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�������_13' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation', @level2type=N'COLUMN',@level2name=N'Behavior_13'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�������_14' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation', @level2type=N'COLUMN',@level2name=N'Behavior_14'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�������_15' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation', @level2type=N'COLUMN',@level2name=N'Behavior_15'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�������_16' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation', @level2type=N'COLUMN',@level2name=N'Behavior_16'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�������_17' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation', @level2type=N'COLUMN',@level2name=N'Behavior_17'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�������_18' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation', @level2type=N'COLUMN',@level2name=N'Behavior_18'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�������_19' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation', @level2type=N'COLUMN',@level2name=N'Behavior_19'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�������_20' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation', @level2type=N'COLUMN',@level2name=N'Behavior_20'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ʵ�÷�_1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation', @level2type=N'COLUMN',@level2name=N'Score_1'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ʵ�÷�_2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation', @level2type=N'COLUMN',@level2name=N'Score_2'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ʵ�÷�_3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation', @level2type=N'COLUMN',@level2name=N'Score_3'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ʵ�÷�_4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation', @level2type=N'COLUMN',@level2name=N'Score_4'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ʵ�÷�_5' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation', @level2type=N'COLUMN',@level2name=N'Score_5'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ʵ�÷�_6' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation', @level2type=N'COLUMN',@level2name=N'Score_6'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ʵ�÷�_7' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation', @level2type=N'COLUMN',@level2name=N'Score_7'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ʵ�÷�_8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation', @level2type=N'COLUMN',@level2name=N'Score_8'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ʵ�÷�_9' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation', @level2type=N'COLUMN',@level2name=N'Score_9'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ʵ�÷�_10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation', @level2type=N'COLUMN',@level2name=N'Score_10'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ʵ�÷�_11' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation', @level2type=N'COLUMN',@level2name=N'Score_11'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ʵ�÷�_12' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation', @level2type=N'COLUMN',@level2name=N'Score_12'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ʵ�÷�_13' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation', @level2type=N'COLUMN',@level2name=N'Score_13'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ʵ�÷�_14' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation', @level2type=N'COLUMN',@level2name=N'Score_14'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ʵ�÷�_15' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation', @level2type=N'COLUMN',@level2name=N'Score_15'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ʵ�÷�_16' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation', @level2type=N'COLUMN',@level2name=N'Score_16'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ʵ�÷�_17' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation', @level2type=N'COLUMN',@level2name=N'Score_17'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ʵ�÷�_18' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation', @level2type=N'COLUMN',@level2name=N'Score_18'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ʵ�÷�_19' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation', @level2type=N'COLUMN',@level2name=N'Score_19'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ʵ�÷�_20' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation', @level2type=N'COLUMN',@level2name=N'Score_20'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ۺ�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation', @level2type=N'COLUMN',@level2name=N'TotalJudging'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ܷ���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation', @level2type=N'COLUMN',@level2name=N'TotalScore'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'״̬' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation', @level2type=N'COLUMN',@level2name=N'States'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation', @level2type=N'COLUMN',@level2name=N'AttachUrl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ְ�����Ч����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectSupervision_ProjectEvaluation'
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



INSERT INTO Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES ('3FA9824D-9382-4139-AF5C-0EE91A1F39CA','1','奖励',1,'RewardOrPunish')
GO
INSERT INTO Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES ('D13B379C-DCE9-403E-89B8-EBEEDD551052','3','处罚',2,'RewardOrPunish')
GO
CREATE TABLE [dbo].[Perfomance_PerfomanceRecord](
	[PerfomanceRecordId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NOT NULL,
	[PerfomanceRecordCode] [nvarchar](50) NOT NULL,
	[UnitId] [nvarchar](50) NOT NULL,
	[SubContractNum] [nvarchar](50) NULL,
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
 CONSTRAINT [PK_Perfomance_PerfomanceRecord] PRIMARY KEY CLUSTERED 
(
	[PerfomanceRecordId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Perfomance_PerfomanceRecord', @level2type=N'COLUMN',@level2name=N'PerfomanceRecordId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Perfomance_PerfomanceRecord', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Perfomance_PerfomanceRecord', @level2type=N'COLUMN',@level2name=N'PerfomanceRecordCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单位' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Perfomance_PerfomanceRecord', @level2type=N'COLUMN',@level2name=N'UnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分包商合同号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Perfomance_PerfomanceRecord', @level2type=N'COLUMN',@level2name=N'SubContractNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'评价时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Perfomance_PerfomanceRecord', @level2type=N'COLUMN',@level2name=N'EvaluationDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'评价描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Perfomance_PerfomanceRecord', @level2type=N'COLUMN',@level2name=N'EvaluationDef'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'奖/罚' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Perfomance_PerfomanceRecord', @level2type=N'COLUMN',@level2name=N'RewardOrPunish'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'金额' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Perfomance_PerfomanceRecord', @level2type=N'COLUMN',@level2name=N'RPMoney'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'考评组' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Perfomance_PerfomanceRecord', @level2type=N'COLUMN',@level2name=N'AssessmentGroup'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'表现情况_1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Perfomance_PerfomanceRecord', @level2type=N'COLUMN',@level2name=N'Behavior_1'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'表现情况_2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Perfomance_PerfomanceRecord', @level2type=N'COLUMN',@level2name=N'Behavior_2'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'表现情况_3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Perfomance_PerfomanceRecord', @level2type=N'COLUMN',@level2name=N'Behavior_3'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'表现情况_4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Perfomance_PerfomanceRecord', @level2type=N'COLUMN',@level2name=N'Behavior_4'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'表现情况_5' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Perfomance_PerfomanceRecord', @level2type=N'COLUMN',@level2name=N'Behavior_5'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'表现情况_6' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Perfomance_PerfomanceRecord', @level2type=N'COLUMN',@level2name=N'Behavior_6'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'表现情况_7' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Perfomance_PerfomanceRecord', @level2type=N'COLUMN',@level2name=N'Behavior_7'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'表现情况_8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Perfomance_PerfomanceRecord', @level2type=N'COLUMN',@level2name=N'Behavior_8'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'表现情况_9' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Perfomance_PerfomanceRecord', @level2type=N'COLUMN',@level2name=N'Behavior_9'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'表现情况_10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Perfomance_PerfomanceRecord', @level2type=N'COLUMN',@level2name=N'Behavior_10'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'表现情况_11' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Perfomance_PerfomanceRecord', @level2type=N'COLUMN',@level2name=N'Behavior_11'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'表现情况_12' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Perfomance_PerfomanceRecord', @level2type=N'COLUMN',@level2name=N'Behavior_12'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'表现情况_13' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Perfomance_PerfomanceRecord', @level2type=N'COLUMN',@level2name=N'Behavior_13'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'表现情况_14' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Perfomance_PerfomanceRecord', @level2type=N'COLUMN',@level2name=N'Behavior_14'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'表现情况_15' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Perfomance_PerfomanceRecord', @level2type=N'COLUMN',@level2name=N'Behavior_15'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'表现情况_16' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Perfomance_PerfomanceRecord', @level2type=N'COLUMN',@level2name=N'Behavior_16'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'表现情况_17' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Perfomance_PerfomanceRecord', @level2type=N'COLUMN',@level2name=N'Behavior_17'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'表现情况_18' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Perfomance_PerfomanceRecord', @level2type=N'COLUMN',@level2name=N'Behavior_18'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'表现情况_19' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Perfomance_PerfomanceRecord', @level2type=N'COLUMN',@level2name=N'Behavior_19'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'表现情况_20' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Perfomance_PerfomanceRecord', @level2type=N'COLUMN',@level2name=N'Behavior_20'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'实得分_1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Perfomance_PerfomanceRecord', @level2type=N'COLUMN',@level2name=N'Score_1'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'实得分_2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Perfomance_PerfomanceRecord', @level2type=N'COLUMN',@level2name=N'Score_2'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'实得分_3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Perfomance_PerfomanceRecord', @level2type=N'COLUMN',@level2name=N'Score_3'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'实得分_4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Perfomance_PerfomanceRecord', @level2type=N'COLUMN',@level2name=N'Score_4'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'实得分_5' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Perfomance_PerfomanceRecord', @level2type=N'COLUMN',@level2name=N'Score_5'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'实得分_6' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Perfomance_PerfomanceRecord', @level2type=N'COLUMN',@level2name=N'Score_6'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'实得分_7' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Perfomance_PerfomanceRecord', @level2type=N'COLUMN',@level2name=N'Score_7'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'实得分_8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Perfomance_PerfomanceRecord', @level2type=N'COLUMN',@level2name=N'Score_8'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'实得分_9' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Perfomance_PerfomanceRecord', @level2type=N'COLUMN',@level2name=N'Score_9'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'实得分_10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Perfomance_PerfomanceRecord', @level2type=N'COLUMN',@level2name=N'Score_10'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'实得分_11' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Perfomance_PerfomanceRecord', @level2type=N'COLUMN',@level2name=N'Score_11'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'实得分_12' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Perfomance_PerfomanceRecord', @level2type=N'COLUMN',@level2name=N'Score_12'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'实得分_13' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Perfomance_PerfomanceRecord', @level2type=N'COLUMN',@level2name=N'Score_13'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'实得分_14' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Perfomance_PerfomanceRecord', @level2type=N'COLUMN',@level2name=N'Score_14'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'实得分_15' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Perfomance_PerfomanceRecord', @level2type=N'COLUMN',@level2name=N'Score_15'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'实得分_16' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Perfomance_PerfomanceRecord', @level2type=N'COLUMN',@level2name=N'Score_16'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'实得分_17' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Perfomance_PerfomanceRecord', @level2type=N'COLUMN',@level2name=N'Score_17'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'实得分_18' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Perfomance_PerfomanceRecord', @level2type=N'COLUMN',@level2name=N'Score_18'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'实得分_19' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Perfomance_PerfomanceRecord', @level2type=N'COLUMN',@level2name=N'Score_19'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'实得分_20' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Perfomance_PerfomanceRecord', @level2type=N'COLUMN',@level2name=N'Score_20'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'综合评语' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Perfomance_PerfomanceRecord', @level2type=N'COLUMN',@level2name=N'TotalJudging'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'总分数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Perfomance_PerfomanceRecord', @level2type=N'COLUMN',@level2name=N'TotalScore'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Perfomance_PerfomanceRecord', @level2type=N'COLUMN',@level2name=N'States'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Perfomance_PerfomanceRecord', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Perfomance_PerfomanceRecord', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'附件' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Perfomance_PerfomanceRecord', @level2type=N'COLUMN',@level2name=N'AttachUrl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分包方绩效评价' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Perfomance_PerfomanceRecord'
GO

ALTER TABLE [dbo].[Perfomance_PerfomanceRecord]  WITH CHECK ADD  CONSTRAINT [FK_Perfomance_PerfomanceRecord_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[Perfomance_PerfomanceRecord] CHECK CONSTRAINT [FK_Perfomance_PerfomanceRecord_Base_Project]
GO

ALTER TABLE [dbo].[Perfomance_PerfomanceRecord]  WITH CHECK ADD  CONSTRAINT [FK_Perfomance_PerfomanceRecord_Base_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[Perfomance_PerfomanceRecord] CHECK CONSTRAINT [FK_Perfomance_PerfomanceRecord_Base_Unit]
GO

ALTER TABLE [dbo].[Perfomance_PerfomanceRecord]  WITH CHECK ADD  CONSTRAINT [FK_Perfomance_PerfomanceRecord_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[Perfomance_PerfomanceRecord] CHECK CONSTRAINT [FK_Perfomance_PerfomanceRecord_Sys_User]
GO




CREATE TABLE [dbo].[Perfomance_PersonPerfomance](
	[PersonPerfomanceId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NOT NULL,
	[PersonPerfomanceCode] [nvarchar](50) NOT NULL,
	[UnitId] [nvarchar](50) NOT NULL,
	[TeamGroupId] [nvarchar](50) NULL,
	[PersonId] [nvarchar](50) NOT NULL,
	[SubContractNum] [nvarchar](50) NULL,
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
	[TotalJudging] [nvarchar](100) NULL,
	[TotalScore] [numeric](9, 1) NULL,
	[States] [char](1) NULL,
	[CompileMan] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
	[AttachUrl] [nvarchar](2000) NULL,
 CONSTRAINT [PK_Perfomance_PersonPerfomance] PRIMARY KEY CLUSTERED 
(
	[PersonPerfomanceId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Perfomance_PersonPerfomance', @level2type=N'COLUMN',@level2name=N'PersonPerfomanceId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Perfomance_PersonPerfomance', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Perfomance_PersonPerfomance', @level2type=N'COLUMN',@level2name=N'PersonPerfomanceCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分包单位' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Perfomance_PersonPerfomance', @level2type=N'COLUMN',@level2name=N'UnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'班组ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Perfomance_PersonPerfomance', @level2type=N'COLUMN',@level2name=N'TeamGroupId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'人员姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Perfomance_PersonPerfomance', @level2type=N'COLUMN',@level2name=N'PersonId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分包合同号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Perfomance_PersonPerfomance', @level2type=N'COLUMN',@level2name=N'SubContractNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'评价时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Perfomance_PersonPerfomance', @level2type=N'COLUMN',@level2name=N'EvaluationDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'评价描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Perfomance_PersonPerfomance', @level2type=N'COLUMN',@level2name=N'EvaluationDef'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'奖/罚' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Perfomance_PersonPerfomance', @level2type=N'COLUMN',@level2name=N'RewardOrPunish'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'金额' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Perfomance_PersonPerfomance', @level2type=N'COLUMN',@level2name=N'RPMoney'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'考评组' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Perfomance_PersonPerfomance', @level2type=N'COLUMN',@level2name=N'AssessmentGroup'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'表现情况_1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Perfomance_PersonPerfomance', @level2type=N'COLUMN',@level2name=N'Behavior_1'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'表现情况_2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Perfomance_PersonPerfomance', @level2type=N'COLUMN',@level2name=N'Behavior_2'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'表现情况_3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Perfomance_PersonPerfomance', @level2type=N'COLUMN',@level2name=N'Behavior_3'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'表现情况_4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Perfomance_PersonPerfomance', @level2type=N'COLUMN',@level2name=N'Behavior_4'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'表现情况_5' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Perfomance_PersonPerfomance', @level2type=N'COLUMN',@level2name=N'Behavior_5'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'表现情况_6' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Perfomance_PersonPerfomance', @level2type=N'COLUMN',@level2name=N'Behavior_6'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'表现情况_7' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Perfomance_PersonPerfomance', @level2type=N'COLUMN',@level2name=N'Behavior_7'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'表现情况_8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Perfomance_PersonPerfomance', @level2type=N'COLUMN',@level2name=N'Behavior_8'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'表现情况_9' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Perfomance_PersonPerfomance', @level2type=N'COLUMN',@level2name=N'Behavior_9'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'表现情况_10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Perfomance_PersonPerfomance', @level2type=N'COLUMN',@level2name=N'Behavior_10'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'实得分_1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Perfomance_PersonPerfomance', @level2type=N'COLUMN',@level2name=N'Score_1'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'实得分_2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Perfomance_PersonPerfomance', @level2type=N'COLUMN',@level2name=N'Score_2'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'实得分_3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Perfomance_PersonPerfomance', @level2type=N'COLUMN',@level2name=N'Score_3'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'实得分_4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Perfomance_PersonPerfomance', @level2type=N'COLUMN',@level2name=N'Score_4'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'实得分_5' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Perfomance_PersonPerfomance', @level2type=N'COLUMN',@level2name=N'Score_5'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'实得分_6' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Perfomance_PersonPerfomance', @level2type=N'COLUMN',@level2name=N'Score_6'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'实得分_7' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Perfomance_PersonPerfomance', @level2type=N'COLUMN',@level2name=N'Score_7'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'实得分_8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Perfomance_PersonPerfomance', @level2type=N'COLUMN',@level2name=N'Score_8'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'实得分_9' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Perfomance_PersonPerfomance', @level2type=N'COLUMN',@level2name=N'Score_9'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'实得分_10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Perfomance_PersonPerfomance', @level2type=N'COLUMN',@level2name=N'Score_10'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'综合评价' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Perfomance_PersonPerfomance', @level2type=N'COLUMN',@level2name=N'TotalJudging'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'总得分' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Perfomance_PersonPerfomance', @level2type=N'COLUMN',@level2name=N'TotalScore'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Perfomance_PersonPerfomance', @level2type=N'COLUMN',@level2name=N'States'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Perfomance_PersonPerfomance', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Perfomance_PersonPerfomance', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'附件' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Perfomance_PersonPerfomance', @level2type=N'COLUMN',@level2name=N'AttachUrl'
GO

ALTER TABLE [dbo].[Perfomance_PersonPerfomance]  WITH CHECK ADD  CONSTRAINT [FK_Perfomance_PersonPerfomance_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[Perfomance_PersonPerfomance] CHECK CONSTRAINT [FK_Perfomance_PersonPerfomance_Base_Project]
GO

ALTER TABLE [dbo].[Perfomance_PersonPerfomance]  WITH CHECK ADD  CONSTRAINT [FK_Perfomance_PersonPerfomance_Base_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[Perfomance_PersonPerfomance] CHECK CONSTRAINT [FK_Perfomance_PersonPerfomance_Base_Unit]
GO

ALTER TABLE [dbo].[Perfomance_PersonPerfomance]  WITH CHECK ADD  CONSTRAINT [FK_Perfomance_PersonPerfomance_ProjectData_TeamGroup] FOREIGN KEY([TeamGroupId])
REFERENCES [dbo].[ProjectData_TeamGroup] ([TeamGroupId])
GO

ALTER TABLE [dbo].[Perfomance_PersonPerfomance] CHECK CONSTRAINT [FK_Perfomance_PersonPerfomance_ProjectData_TeamGroup]
GO

ALTER TABLE [dbo].[Perfomance_PersonPerfomance]  WITH CHECK ADD  CONSTRAINT [FK_Perfomance_PersonPerfomance_SitePerson_Person] FOREIGN KEY([PersonId])
REFERENCES [dbo].[SitePerson_Person] ([PersonId])
GO

ALTER TABLE [dbo].[Perfomance_PersonPerfomance] CHECK CONSTRAINT [FK_Perfomance_PersonPerfomance_SitePerson_Person]
GO

ALTER TABLE [dbo].[Perfomance_PersonPerfomance]  WITH CHECK ADD  CONSTRAINT [FK_Perfomance_PersonPerfomance_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[Perfomance_PersonPerfomance] CHECK CONSTRAINT [FK_Perfomance_PersonPerfomance_Sys_User]
GO

CREATE TABLE [dbo].[InformationProject_PromotionalActivities](
	[PromotionalActivitiesId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[Code] [nvarchar](50) NULL,
	[Title] [nvarchar](500) NULL,
	[ActivitiesDate] [datetime] NULL,
	[UnitIds] [nvarchar](4000) NULL,
	[UnitNames] [nvarchar](4000) NULL,
	[UserIds] [nvarchar](4000) NULL,
	[UserNames] [nvarchar](4000) NULL,
	[MainContent] [nvarchar](max) NULL,
	[AttachUrl] [nvarchar](4000) NULL,
	[CompileMan] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
	[States] [char](1) NULL,
 CONSTRAINT [PK_InformationProject_PromotionalActivities] PRIMARY KEY CLUSTERED 
(
	[PromotionalActivitiesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[InformationProject_PromotionalActivities]  WITH CHECK ADD  CONSTRAINT [FK_InformationProject_PromotionalActivities_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[InformationProject_PromotionalActivities] CHECK CONSTRAINT [FK_InformationProject_PromotionalActivities_Base_Project]
GO

ALTER TABLE [dbo].[InformationProject_PromotionalActivities]  WITH CHECK ADD  CONSTRAINT [FK_InformationProject_PromotionalActivities_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[InformationProject_PromotionalActivities] CHECK CONSTRAINT [FK_InformationProject_PromotionalActivities_Sys_User]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_PromotionalActivities', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_PromotionalActivities', @level2type=N'COLUMN',@level2name=N'Code'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'活动主题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_PromotionalActivities', @level2type=N'COLUMN',@level2name=N'Title'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'活动时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_PromotionalActivities', @level2type=N'COLUMN',@level2name=N'ActivitiesDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'参与单位' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_PromotionalActivities', @level2type=N'COLUMN',@level2name=N'UnitIds'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'参与单位名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_PromotionalActivities', @level2type=N'COLUMN',@level2name=N'UnitNames'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'参与人员' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_PromotionalActivities', @level2type=N'COLUMN',@level2name=N'UserIds'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'参与人员名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_PromotionalActivities', @level2type=N'COLUMN',@level2name=N'UserNames'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'活动描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_PromotionalActivities', @level2type=N'COLUMN',@level2name=N'MainContent'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'附件路径' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_PromotionalActivities', @level2type=N'COLUMN',@level2name=N'AttachUrl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'整理人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_PromotionalActivities', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'整理时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_PromotionalActivities', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_PromotionalActivities', @level2type=N'COLUMN',@level2name=N'States'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HSSE宣传活动' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_PromotionalActivities'
GO


INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('4725617A-C91B-43D7-80C2-C4441A233BF6','1','PPE违章',1,'ViolationName')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('70A3FB1F-DB72-499E-92DF-2F10A7C0F4DB','2','其它违章',2,'ViolationName')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('EE7C7078-3675-4358-9721-912CC7BD69DE','1','安全带',1,'ViolationType')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('5FB257CB-B797-4712-A99F-2D8C1A7C604A','2','工作服',2,'ViolationType')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('514C4CD0-51DF-4DCA-8544-F4A65572CB9B','3','劳保鞋',3,'ViolationType')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('DD8AD9C3-4662-4F0E-AD43-32D7DA5CCEB2','4','安全帽',4,'ViolationType')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('CE193F13-B66E-4E59-AABB-2485635312FF','5','护目镜',5,'ViolationType')
GO

CREATE TABLE [dbo].[Check_IncentiveNotice](
	[IncentiveNoticeId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NOT NULL,
	[IncentiveNoticeCode] [nvarchar](50) NOT NULL,
	[UnitId] [nvarchar](50) NULL,
	[IncentiveDate] [datetime] NULL,
	[PersonId] [nvarchar](50) NULL,
	[BasicItem] [nvarchar](300) NULL,
	[IncentiveMoney] [money] NULL,
	[TitleReward] [nvarchar](50) NULL,
	[MattleReward] [nvarchar](50) NULL,
	[FileContents] [nvarchar](max) NULL,
	[AttachUrl] [nvarchar](2000) NULL,
	[CompileMan] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
	[States] [char](1) NULL,
 CONSTRAINT [PK_Check_IncentiveNotice] PRIMARY KEY CLUSTERED 
(
	[IncentiveNoticeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_IncentiveNotice', @level2type=N'COLUMN',@level2name=N'IncentiveNoticeId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_IncentiveNotice', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_IncentiveNotice', @level2type=N'COLUMN',@level2name=N'IncentiveNoticeCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单位ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_IncentiveNotice', @level2type=N'COLUMN',@level2name=N'UnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'奖励时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_IncentiveNotice', @level2type=N'COLUMN',@level2name=N'IncentiveDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'奖励人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_IncentiveNotice', @level2type=N'COLUMN',@level2name=N'PersonId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'奖罚根据' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_IncentiveNotice', @level2type=N'COLUMN',@level2name=N'BasicItem'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'奖励金额 ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_IncentiveNotice', @level2type=N'COLUMN',@level2name=N'IncentiveMoney'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'奖励称号 ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_IncentiveNotice', @level2type=N'COLUMN',@level2name=N'TitleReward'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'物质奖励' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_IncentiveNotice', @level2type=N'COLUMN',@level2name=N'MattleReward'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文本' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_IncentiveNotice', @level2type=N'COLUMN',@level2name=N'FileContents'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'附件' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_IncentiveNotice', @level2type=N'COLUMN',@level2name=N'AttachUrl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_IncentiveNotice', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_IncentiveNotice', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_IncentiveNotice', @level2type=N'COLUMN',@level2name=N'States'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'奖励通知单' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_IncentiveNotice'
GO

ALTER TABLE [dbo].[Check_IncentiveNotice]  WITH CHECK ADD  CONSTRAINT [FK_Check_IncentiveNotice_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[Check_IncentiveNotice] CHECK CONSTRAINT [FK_Check_IncentiveNotice_Base_Project]
GO

ALTER TABLE [dbo].[Check_IncentiveNotice]  WITH CHECK ADD  CONSTRAINT [FK_Check_IncentiveNotice_Base_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[Check_IncentiveNotice] CHECK CONSTRAINT [FK_Check_IncentiveNotice_Base_Unit]
GO

ALTER TABLE [dbo].[Check_IncentiveNotice]  WITH CHECK ADD  CONSTRAINT [FK_Check_IncentiveNotice_SitePerson_Person] FOREIGN KEY([PersonId])
REFERENCES [dbo].[SitePerson_Person] ([PersonId])
GO

ALTER TABLE [dbo].[Check_IncentiveNotice] CHECK CONSTRAINT [FK_Check_IncentiveNotice_SitePerson_Person]
GO

ALTER TABLE [dbo].[Check_IncentiveNotice]  WITH CHECK ADD  CONSTRAINT [FK_Check_IncentiveNotice_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[Check_IncentiveNotice] CHECK CONSTRAINT [FK_Check_IncentiveNotice_Sys_User]
GO


 

CREATE TABLE [dbo].[Check_PunishNotice](
	[PunishNoticeId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NOT NULL,
	[PunishNoticeCode] [nvarchar](50) NOT NULL,
	[UnitId] [nvarchar](50) NOT NULL,
	[PunishNoticeDate] [datetime] NULL,
	[BasicItem] [nvarchar](300) NULL,
	[PunishMoney] [money] NULL,
	[FileContents] [nvarchar](max) NULL,
	[AttachUrl] [nvarchar](2000) NULL,
	[CompileMan] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
	[States] [char](1) NULL,
 CONSTRAINT [PK_Check_PunishNotice] PRIMARY KEY CLUSTERED 
(
	[PunishNoticeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_PunishNotice', @level2type=N'COLUMN',@level2name=N'PunishNoticeId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目id ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_PunishNotice', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_PunishNotice', @level2type=N'COLUMN',@level2name=N'PunishNoticeCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'受罚单位' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_PunishNotice', @level2type=N'COLUMN',@level2name=N'UnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'处罚时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_PunishNotice', @level2type=N'COLUMN',@level2name=N'PunishNoticeDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'处罚根据' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_PunishNotice', @level2type=N'COLUMN',@level2name=N'BasicItem'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'处罚金额 ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_PunishNotice', @level2type=N'COLUMN',@level2name=N'PunishMoney'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文本' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_PunishNotice', @level2type=N'COLUMN',@level2name=N'FileContents'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'附件' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_PunishNotice', @level2type=N'COLUMN',@level2name=N'AttachUrl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_PunishNotice', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_PunishNotice', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_PunishNotice', @level2type=N'COLUMN',@level2name=N'States'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'处罚通知单' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_PunishNotice'
GO

ALTER TABLE [dbo].[Check_PunishNotice]  WITH CHECK ADD  CONSTRAINT [FK_Check_PunishNotice_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[Check_PunishNotice] CHECK CONSTRAINT [FK_Check_PunishNotice_Base_Project]
GO

ALTER TABLE [dbo].[Check_PunishNotice]  WITH CHECK ADD  CONSTRAINT [FK_Check_PunishNotice_Base_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[Check_PunishNotice] CHECK CONSTRAINT [FK_Check_PunishNotice_Base_Unit]
GO

ALTER TABLE [dbo].[Check_PunishNotice]  WITH CHECK ADD  CONSTRAINT [FK_Check_PunishNotice_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[Check_PunishNotice] CHECK CONSTRAINT [FK_Check_PunishNotice_Sys_User]
GO



CREATE TABLE [dbo].[Check_ViolationPerson](
	[ViolationPersonId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NOT NULL,
	[ViolationPersonCode] [nvarchar](50) NOT NULL,
	[UnitId] [nvarchar](50) NOT NULL,
	[PersonId] [nvarchar](50) NOT NULL,
	[WorkPostId] [nvarchar](50) NULL,
	[ViolationDate] [datetime] NULL,
	[ViolationName] [char](1) NULL,
	[ViolationType] [char](1) NULL,
	[CompileMan] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
	[States] [char](1) NULL,
 CONSTRAINT [PK_Check_ViolationPerson] PRIMARY KEY CLUSTERED 
(
	[ViolationPersonId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_ViolationPerson', @level2type=N'COLUMN',@level2name=N'ViolationPersonId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_ViolationPerson', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_ViolationPerson', @level2type=N'COLUMN',@level2name=N'ViolationPersonCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'违规人员单位' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_ViolationPerson', @level2type=N'COLUMN',@level2name=N'UnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'违规人员' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_ViolationPerson', @level2type=N'COLUMN',@level2name=N'PersonId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'岗位' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_ViolationPerson', @level2type=N'COLUMN',@level2name=N'WorkPostId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'违章日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_ViolationPerson', @level2type=N'COLUMN',@level2name=N'ViolationDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'违章名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_ViolationPerson', @level2type=N'COLUMN',@level2name=N'ViolationName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'违章类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_ViolationPerson', @level2type=N'COLUMN',@level2name=N'ViolationType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_ViolationPerson', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_ViolationPerson', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_ViolationPerson', @level2type=N'COLUMN',@level2name=N'States'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'违规人员记录' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_ViolationPerson'
GO

ALTER TABLE [dbo].[Check_ViolationPerson]  WITH CHECK ADD  CONSTRAINT [FK_Check_ViolationPerson_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[Check_ViolationPerson] CHECK CONSTRAINT [FK_Check_ViolationPerson_Base_Project]
GO

ALTER TABLE [dbo].[Check_ViolationPerson]  WITH CHECK ADD  CONSTRAINT [FK_Check_ViolationPerson_Base_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[Check_ViolationPerson] CHECK CONSTRAINT [FK_Check_ViolationPerson_Base_Unit]
GO

ALTER TABLE [dbo].[Check_ViolationPerson]  WITH CHECK ADD  CONSTRAINT [FK_Check_ViolationPerson_Base_WorkPost] FOREIGN KEY([WorkPostId])
REFERENCES [dbo].[Base_WorkPost] ([WorkPostId])
GO

ALTER TABLE [dbo].[Check_ViolationPerson] CHECK CONSTRAINT [FK_Check_ViolationPerson_Base_WorkPost]
GO

ALTER TABLE [dbo].[Check_ViolationPerson]  WITH CHECK ADD  CONSTRAINT [FK_Check_ViolationPerson_SitePerson_Person] FOREIGN KEY([PersonId])
REFERENCES [dbo].[SitePerson_Person] ([PersonId])
GO

ALTER TABLE [dbo].[Check_ViolationPerson] CHECK CONSTRAINT [FK_Check_ViolationPerson_SitePerson_Person]
GO

ALTER TABLE [dbo].[Check_ViolationPerson]  WITH CHECK ADD  CONSTRAINT [FK_Check_ViolationPerson_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[Check_ViolationPerson] CHECK CONSTRAINT [FK_Check_ViolationPerson_Sys_User]
GO


CREATE TABLE [dbo].[Check_HSECertificate](
	[HSECertificateId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NOT NULL,
	[HSECertificateCode] [nvarchar](50) NOT NULL,
	[HSECertificateName] [nvarchar](50) NOT NULL,
	[AttachUrl] [nvarchar](2000) NULL,
	[CompileMan] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
	[States] [char](1) NULL,
 CONSTRAINT [PK_Check_HSECertificate] PRIMARY KEY CLUSTERED 
(
	[HSECertificateId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_HSECertificate', @level2type=N'COLUMN',@level2name=N'HSECertificateId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_HSECertificate', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HSE获奖证书或奖杯编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_HSECertificate', @level2type=N'COLUMN',@level2name=N'HSECertificateCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HSE获奖证书或奖杯名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_HSECertificate', @level2type=N'COLUMN',@level2name=N'HSECertificateName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'证书或奖杯扫描件' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_HSECertificate', @level2type=N'COLUMN',@level2name=N'AttachUrl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_HSECertificate', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_HSECertificate', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_HSECertificate', @level2type=N'COLUMN',@level2name=N'States'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'获奖证书或奖杯' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_HSECertificate'
GO

ALTER TABLE [dbo].[Check_HSECertificate]  WITH CHECK ADD  CONSTRAINT [FK_Check_HSECertificate_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[Check_HSECertificate] CHECK CONSTRAINT [FK_Check_HSECertificate_Base_Project]
GO

ALTER TABLE [dbo].[Check_HSECertificate]  WITH CHECK ADD  CONSTRAINT [FK_Check_HSECertificate_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[Check_HSECertificate] CHECK CONSTRAINT [FK_Check_HSECertificate_Sys_User]
GO

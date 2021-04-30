CREATE TABLE [dbo].[InformationProject_MillionsMonthlyReport](
	[MillionsMonthlyReportId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NOT NULL,
	[Year] [int] NULL,
	[Month] [int] NULL,
	[CompileMan] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
	[States] [char](1) NULL,
	[Affiliation] [nvarchar](50) NULL,
	[Name] [nvarchar](100) NULL,
	[PostPersonNum] [int] NULL,
	[SnapPersonNum] [int] NULL,
	[ContractorNum] [int] NULL,
	[SumPersonNum] [int] NULL,
	[TotalWorkNum] [decimal](18, 4) NULL,
	[SeriousInjuriesNum] [int] NULL,
	[SeriousInjuriesPersonNum] [int] NULL,
	[SeriousInjuriesLossHour] [int] NULL,
	[MinorAccidentNum] [int] NULL,
	[MinorAccidentPersonNum] [int] NULL,
	[MinorAccidentLossHour] [int] NULL,
	[OtherAccidentNum] [int] NULL,
	[OtherAccidentPersonNum] [int] NULL,
	[OtherAccidentLossHour] [int] NULL,
	[RestrictedWorkPersonNum] [int] NULL,
	[RestrictedWorkLossHour] [int] NULL,
	[MedicalTreatmentPersonNum] [int] NULL,
	[MedicalTreatmentLossHour] [int] NULL,
	[FireNum] [int] NULL,
	[ExplosionNum] [int] NULL,
	[TrafficNum] [int] NULL,
	[EquipmentNum] [int] NULL,
	[QualityNum] [int] NULL,
	[OtherNum] [int] NULL,
	[FirstAidDressingsNum] [int] NULL,
	[AttemptedEventNum] [int] NULL,
	[LossDayNum] [int] NULL,
 CONSTRAINT [PK_InformationProject_MillionsMonthlyReport] PRIMARY KEY CLUSTERED 
(
	[MillionsMonthlyReportId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_MillionsMonthlyReport', @level2type=N'COLUMN',@level2name=N'MillionsMonthlyReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_MillionsMonthlyReport', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'年度' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_MillionsMonthlyReport', @level2type=N'COLUMN',@level2name=N'Year'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'月份' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_MillionsMonthlyReport', @level2type=N'COLUMN',@level2name=N'Month'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'填报人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_MillionsMonthlyReport', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'填报日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_MillionsMonthlyReport', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_MillionsMonthlyReport', @level2type=N'COLUMN',@level2name=N'States'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'所属单位' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_MillionsMonthlyReport', @level2type=N'COLUMN',@level2name=N'Affiliation'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_MillionsMonthlyReport', @level2type=N'COLUMN',@level2name=N'Name'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'在岗员工' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_MillionsMonthlyReport', @level2type=N'COLUMN',@level2name=N'PostPersonNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'临时员工' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_MillionsMonthlyReport', @level2type=N'COLUMN',@level2name=N'SnapPersonNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承包商' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_MillionsMonthlyReport', @level2type=N'COLUMN',@level2name=N'ContractorNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'员工总数合计' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_MillionsMonthlyReport', @level2type=N'COLUMN',@level2name=N'SumPersonNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'总工时数（万）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_MillionsMonthlyReport', @level2type=N'COLUMN',@level2name=N'TotalWorkNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'重伤事故（起数）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_MillionsMonthlyReport', @level2type=N'COLUMN',@level2name=N'SeriousInjuriesNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'重伤事故（人数）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_MillionsMonthlyReport', @level2type=N'COLUMN',@level2name=N'SeriousInjuriesPersonNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'重伤事故（损失工时）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_MillionsMonthlyReport', @level2type=N'COLUMN',@level2name=N'SeriousInjuriesLossHour'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'轻伤事故（起数）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_MillionsMonthlyReport', @level2type=N'COLUMN',@level2name=N'MinorAccidentNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'轻伤事故（人数）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_MillionsMonthlyReport', @level2type=N'COLUMN',@level2name=N'MinorAccidentPersonNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'轻伤事故（损失工时）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_MillionsMonthlyReport', @level2type=N'COLUMN',@level2name=N'MinorAccidentLossHour'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'其它事故（起数）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_MillionsMonthlyReport', @level2type=N'COLUMN',@level2name=N'OtherAccidentNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'其它事故（人数）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_MillionsMonthlyReport', @level2type=N'COLUMN',@level2name=N'OtherAccidentPersonNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'其它事故（损失工时）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_MillionsMonthlyReport', @level2type=N'COLUMN',@level2name=N'OtherAccidentLossHour'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'工作受限（人数）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_MillionsMonthlyReport', @level2type=N'COLUMN',@level2name=N'RestrictedWorkPersonNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'工作受限（损失工时）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_MillionsMonthlyReport', @level2type=N'COLUMN',@level2name=N'RestrictedWorkLossHour'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'医疗处置（人数）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_MillionsMonthlyReport', @level2type=N'COLUMN',@level2name=N'MedicalTreatmentPersonNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'医疗处置（损失工时）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_MillionsMonthlyReport', @level2type=N'COLUMN',@level2name=N'MedicalTreatmentLossHour'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'火灾（起数）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_MillionsMonthlyReport', @level2type=N'COLUMN',@level2name=N'FireNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'爆炸（起数）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_MillionsMonthlyReport', @level2type=N'COLUMN',@level2name=N'ExplosionNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'交通（起数）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_MillionsMonthlyReport', @level2type=N'COLUMN',@level2name=N'TrafficNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'机械设备（起数）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_MillionsMonthlyReport', @level2type=N'COLUMN',@level2name=N'EquipmentNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'质量（起数）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_MillionsMonthlyReport', @level2type=N'COLUMN',@level2name=N'QualityNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'其它（起数）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_MillionsMonthlyReport', @level2type=N'COLUMN',@level2name=N'OtherNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'急救包扎（起数）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_MillionsMonthlyReport', @level2type=N'COLUMN',@level2name=N'FirstAidDressingsNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'未遂事件（起数）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_MillionsMonthlyReport', @level2type=N'COLUMN',@level2name=N'AttemptedEventNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'损失工日' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_MillionsMonthlyReport', @level2type=N'COLUMN',@level2name=N'LossDayNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'百万工时安全统计月报' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_MillionsMonthlyReport'
GO

ALTER TABLE [dbo].[InformationProject_MillionsMonthlyReport]  WITH CHECK ADD  CONSTRAINT [FK_InformationProject_MillionsMonthlyReport_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[InformationProject_MillionsMonthlyReport] CHECK CONSTRAINT [FK_InformationProject_MillionsMonthlyReport_Base_Project]
GO

ALTER TABLE [dbo].[InformationProject_MillionsMonthlyReport]  WITH CHECK ADD  CONSTRAINT [FK_InformationProject_MillionsMonthlyReport_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[InformationProject_MillionsMonthlyReport] CHECK CONSTRAINT [FK_InformationProject_MillionsMonthlyReport_Sys_User]
GO


CREATE TABLE [dbo].[InformationProject_AccidentCauseReport](
	[AccidentCauseReportId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[UnitId] [nvarchar](50) NULL,
	[AccidentCauseReportCode] [nvarchar](50) NULL,
	[Year] [int] NULL,
	[Month] [int] NULL,
	[DeathAccident] [int] NULL,
	[DeathToll] [int] NULL,
	[InjuredAccident] [int] NULL,
	[InjuredToll] [int] NULL,
	[MinorWoundAccident] [int] NULL,
	[MinorWoundToll] [int] NULL,
	[AverageTotalHours] [decimal](19, 2) NULL,
	[AverageManHours] [int] NULL,
	[TotalLossMan] [int] NULL,
	[LastMonthLossHoursTotal] [int] NULL,
	[KnockOffTotal] [int] NULL,
	[DirectLoss] [int] NULL,
	[IndirectLosses] [int] NULL,
	[TotalLoss] [int] NULL,
	[TotalLossTime] [int] NULL,
	[CompileMan] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
	[States] [nvarchar](50) NULL,
 CONSTRAINT [PK_InformationProject_AccidentCauseReport] PRIMARY KEY CLUSTERED 
(
	[AccidentCauseReportId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_AccidentCauseReport', @level2type=N'COLUMN',@level2name=N'AccidentCauseReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'填报单位' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_AccidentCauseReport', @level2type=N'COLUMN',@level2name=N'UnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_AccidentCauseReport', @level2type=N'COLUMN',@level2name=N'AccidentCauseReportCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'年份' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_AccidentCauseReport', @level2type=N'COLUMN',@level2name=N'Year'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'月份' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_AccidentCauseReport', @level2type=N'COLUMN',@level2name=N'Month'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'死亡事故' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_AccidentCauseReport', @level2type=N'COLUMN',@level2name=N'DeathAccident'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'死亡人数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_AccidentCauseReport', @level2type=N'COLUMN',@level2name=N'DeathToll'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'重伤事故' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_AccidentCauseReport', @level2type=N'COLUMN',@level2name=N'InjuredAccident'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'重伤人数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_AccidentCauseReport', @level2type=N'COLUMN',@level2name=N'InjuredToll'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'轻伤事故' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_AccidentCauseReport', @level2type=N'COLUMN',@level2name=N'MinorWoundAccident'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'轻伤人数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_AccidentCauseReport', @level2type=N'COLUMN',@level2name=N'MinorWoundToll'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'平均工时总数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_AccidentCauseReport', @level2type=N'COLUMN',@level2name=N'AverageTotalHours'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'平均工时人数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_AccidentCauseReport', @level2type=N'COLUMN',@level2name=N'AverageManHours'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'损失工时总数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_AccidentCauseReport', @level2type=N'COLUMN',@level2name=N'TotalLossMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'上月损失工时总数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_AccidentCauseReport', @level2type=N'COLUMN',@level2name=N'LastMonthLossHoursTotal'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'歇工总日数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_AccidentCauseReport', @level2type=N'COLUMN',@level2name=N'KnockOffTotal'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'直接损失' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_AccidentCauseReport', @level2type=N'COLUMN',@level2name=N'DirectLoss'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'间接损失' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_AccidentCauseReport', @level2type=N'COLUMN',@level2name=N'IndirectLosses'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'总损失' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_AccidentCauseReport', @level2type=N'COLUMN',@level2name=N'TotalLoss'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'无损失工时总数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_AccidentCauseReport', @level2type=N'COLUMN',@level2name=N'TotalLossTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'制表人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_AccidentCauseReport', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'填报日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_AccidentCauseReport', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'职工伤亡事故原因分析报表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_AccidentCauseReport'
GO

ALTER TABLE [dbo].[InformationProject_AccidentCauseReport]  WITH CHECK ADD  CONSTRAINT [FK_InformationProject_AccidentCauseReport_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[InformationProject_AccidentCauseReport] CHECK CONSTRAINT [FK_InformationProject_AccidentCauseReport_Base_Project]
GO

ALTER TABLE [dbo].[InformationProject_AccidentCauseReport]  WITH CHECK ADD  CONSTRAINT [FK_InformationProject_AccidentCauseReport_Base_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[InformationProject_AccidentCauseReport] CHECK CONSTRAINT [FK_InformationProject_AccidentCauseReport_Base_Unit]
GO

ALTER TABLE [dbo].[InformationProject_AccidentCauseReport]  WITH CHECK ADD  CONSTRAINT [FK_InformationProject_AccidentCauseReport_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[InformationProject_AccidentCauseReport] CHECK CONSTRAINT [FK_InformationProject_AccidentCauseReport_Sys_User]
GO



CREATE TABLE [dbo].[InformationProject_AccidentCauseReportItem](
	[AccidentCauseReportItemId] [nvarchar](50) NOT NULL,
	[AccidentCauseReportId] [nvarchar](50) NULL,
	[AccidentType] [nvarchar](20) NULL,
	[TotalDeath] [int] NULL,
	[TotalInjuries] [int] NULL,
	[TotalMinorInjuries] [int] NULL,
	[Death1] [int] NULL,
	[Injuries1] [int] NULL,
	[MinorInjuries1] [int] NULL,
	[Death2] [int] NULL,
	[Injuries2] [int] NULL,
	[MinorInjuries2] [int] NULL,
	[Death3] [int] NULL,
	[Injuries3] [int] NULL,
	[MinorInjuries3] [int] NULL,
	[Death4] [int] NULL,
	[Injuries4] [int] NULL,
	[MinorInjuries4] [int] NULL,
	[Death5] [int] NULL,
	[Injuries5] [int] NULL,
	[MinorInjuries5] [int] NULL,
	[Death6] [int] NULL,
	[Injuries6] [int] NULL,
	[MinorInjuries6] [int] NULL,
	[Death7] [int] NULL,
	[Injuries7] [int] NULL,
	[MinorInjuries7] [int] NULL,
	[Death8] [int] NULL,
	[Injuries8] [int] NULL,
	[MinorInjuries8] [int] NULL,
	[Death9] [int] NULL,
	[Injuries9] [int] NULL,
	[MinorInjuries9] [int] NULL,
	[Death10] [int] NULL,
	[Injuries10] [int] NULL,
	[MinorInjuries10] [int] NULL,
	[Death11] [int] NULL,
	[Injuries11] [int] NULL,
	[MinorInjuries11] [int] NULL,
 CONSTRAINT [PK_InformationProject_AccidentCauseReportItem] PRIMARY KEY CLUSTERED 
(
	[AccidentCauseReportItemId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_AccidentCauseReportItem', @level2type=N'COLUMN',@level2name=N'AccidentCauseReportItemId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主表主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_AccidentCauseReportItem', @level2type=N'COLUMN',@level2name=N'AccidentCauseReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'事故类别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_AccidentCauseReportItem', @level2type=N'COLUMN',@level2name=N'AccidentType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'合计死亡数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_AccidentCauseReportItem', @level2type=N'COLUMN',@level2name=N'TotalDeath'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'合计重伤数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_AccidentCauseReportItem', @level2type=N'COLUMN',@level2name=N'TotalInjuries'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'合计轻伤数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_AccidentCauseReportItem', @level2type=N'COLUMN',@level2name=N'TotalMinorInjuries'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'防护保险信号缺失死亡数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_AccidentCauseReportItem', @level2type=N'COLUMN',@level2name=N'Death1'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'防护保险信号缺失重伤数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_AccidentCauseReportItem', @level2type=N'COLUMN',@level2name=N'Injuries1'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'防护保险信号缺失轻伤数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_AccidentCauseReportItem', @level2type=N'COLUMN',@level2name=N'MinorInjuries1'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'设备工具缺陷死亡数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_AccidentCauseReportItem', @level2type=N'COLUMN',@level2name=N'Death2'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'设备工具缺陷重伤数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_AccidentCauseReportItem', @level2type=N'COLUMN',@level2name=N'Injuries2'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'设备工具缺陷轻伤数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_AccidentCauseReportItem', @level2type=N'COLUMN',@level2name=N'MinorInjuries2'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'个人防护缺陷死亡数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_AccidentCauseReportItem', @level2type=N'COLUMN',@level2name=N'Death3'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'个人防护缺陷重伤数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_AccidentCauseReportItem', @level2type=N'COLUMN',@level2name=N'Injuries3'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'个人防护缺陷轻伤数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_AccidentCauseReportItem', @level2type=N'COLUMN',@level2name=N'MinorInjuries3'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'光线不足死亡数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_AccidentCauseReportItem', @level2type=N'COLUMN',@level2name=N'Death4'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'光线不足重伤数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_AccidentCauseReportItem', @level2type=N'COLUMN',@level2name=N'Injuries4'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'光线不足轻伤数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_AccidentCauseReportItem', @level2type=N'COLUMN',@level2name=N'MinorInjuries4'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'劳动组织不合理死亡数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_AccidentCauseReportItem', @level2type=N'COLUMN',@level2name=N'Death5'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'劳动组织不合理重伤数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_AccidentCauseReportItem', @level2type=N'COLUMN',@level2name=N'Injuries5'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'劳动组织不合理轻伤数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_AccidentCauseReportItem', @level2type=N'COLUMN',@level2name=N'MinorInjuries5'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'现场指导错误死亡数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_AccidentCauseReportItem', @level2type=N'COLUMN',@level2name=N'Death6'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'现场指导错误重伤数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_AccidentCauseReportItem', @level2type=N'COLUMN',@level2name=N'Injuries6'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'现场指导错误轻伤数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_AccidentCauseReportItem', @level2type=N'COLUMN',@level2name=N'MinorInjuries6'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'设计有缺陷死亡数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_AccidentCauseReportItem', @level2type=N'COLUMN',@level2name=N'Death7'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'设计有缺陷重伤数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_AccidentCauseReportItem', @level2type=N'COLUMN',@level2name=N'Injuries7'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'设计有缺陷轻伤数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_AccidentCauseReportItem', @level2type=N'COLUMN',@level2name=N'MinorInjuries7'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'不懂操作死亡数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_AccidentCauseReportItem', @level2type=N'COLUMN',@level2name=N'Death8'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'不懂操作重伤数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_AccidentCauseReportItem', @level2type=N'COLUMN',@level2name=N'Injuries8'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'不懂操作轻伤数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_AccidentCauseReportItem', @level2type=N'COLUMN',@level2name=N'MinorInjuries8'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'违反操作死亡数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_AccidentCauseReportItem', @level2type=N'COLUMN',@level2name=N'Death9'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'违反操作重伤数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_AccidentCauseReportItem', @level2type=N'COLUMN',@level2name=N'Injuries9'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'违反操作轻伤数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_AccidentCauseReportItem', @level2type=N'COLUMN',@level2name=N'MinorInjuries9'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'没有安全操作死亡数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_AccidentCauseReportItem', @level2type=N'COLUMN',@level2name=N'Death10'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'没有安全操作重伤数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_AccidentCauseReportItem', @level2type=N'COLUMN',@level2name=N'Injuries10'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'没有安全操作轻伤数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_AccidentCauseReportItem', @level2type=N'COLUMN',@level2name=N'MinorInjuries10'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'其他死亡数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_AccidentCauseReportItem', @level2type=N'COLUMN',@level2name=N'Death11'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'其他重伤数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_AccidentCauseReportItem', @level2type=N'COLUMN',@level2name=N'Injuries11'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'其他轻伤数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_AccidentCauseReportItem', @level2type=N'COLUMN',@level2name=N'MinorInjuries11'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'职工伤亡事故原因分析明细表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_AccidentCauseReportItem'
GO

ALTER TABLE [dbo].[InformationProject_AccidentCauseReportItem]  WITH CHECK ADD  CONSTRAINT [FK_InformationProject_AccidentCauseReportItem_InformationProject_AccidentCauseReport] FOREIGN KEY([AccidentCauseReportId])
REFERENCES [dbo].[InformationProject_AccidentCauseReport] ([AccidentCauseReportId])
GO

ALTER TABLE [dbo].[InformationProject_AccidentCauseReportItem] CHECK CONSTRAINT [FK_InformationProject_AccidentCauseReportItem_InformationProject_AccidentCauseReport]
GO


 

CREATE TABLE [dbo].[InformationProject_SafetyQuarterlyReport](
	[SafetyQuarterlyReportId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[UnitId] [nvarchar](50) NULL,
	[YearId] [int] NULL,
	[Quarters] [int] NULL,
	[TotalInWorkHours] [int] NULL,
	[TotalInWorkHoursRemark] [nvarchar](500) NULL,
	[TotalOutWorkHours] [int] NULL,
	[TotalOutWorkHoursRemark] [nvarchar](500) NULL,
	[WorkHoursLossRate] [decimal](18, 2) NULL,
	[WorkHoursLossRateRemark] [nvarchar](500) NULL,
	[WorkHoursAccuracy] [decimal](18, 2) NULL,
	[WorkHoursAccuracyRemark] [nvarchar](500) NULL,
	[MainBusinessIncome] [money] NULL,
	[MainBusinessIncomeRemark] [nvarchar](500) NULL,
	[ConstructionRevenue] [money] NULL,
	[ConstructionRevenueRemark] [nvarchar](500) NULL,
	[UnitTimeIncome] [money] NULL,
	[UnitTimeIncomeRemark] [nvarchar](500) NULL,
	[BillionsOutputMortality] [decimal](18, 2) NULL,
	[BillionsOutputMortalityRemark] [nvarchar](500) NULL,
	[MajorFireAccident] [int] NULL,
	[MajorFireAccidentRemark] [nvarchar](500) NULL,
	[MajorEquipAccident] [int] NULL,
	[MajorEquipAccidentRemark] [nvarchar](500) NULL,
	[AccidentFrequency] [decimal](18, 2) NULL,
	[AccidentFrequencyRemark] [nvarchar](500) NULL,
	[SeriousInjuryAccident] [int] NULL,
	[SeriousInjuryAccidentRemark] [nvarchar](500) NULL,
	[FireAccident] [int] NULL,
	[FireAccidentRemark] [nvarchar](500) NULL,
	[EquipmentAccident] [int] NULL,
	[EquipmentAccidentRemark] [nvarchar](500) NULL,
	[PoisoningAndInjuries] [int] NULL,
	[PoisoningAndInjuriesRemark] [nvarchar](500) NULL,
	[ProductionSafetyInTotal] [int] NULL,
	[ProductionSafetyInTotalRemark] [nvarchar](500) NULL,
	[ProtectionInput] [money] NULL,
	[ProtectionInputRemark] [nvarchar](500) NULL,
	[LaboAndHealthIn] [money] NULL,
	[LaborAndHealthInRemark] [nvarchar](500) NULL,
	[TechnologyProgressIn] [money] NULL,
	[TechnologyProgressInRemark] [nvarchar](500) NULL,
	[EducationTrainIn] [money] NULL,
	[EducationTrainInRemark] [nvarchar](500) NULL,
	[ProjectCostRate] [decimal](18, 2) NULL,
	[ProjectCostRateRemark] [nvarchar](500) NULL,
	[ProductionInput] [money] NULL,
	[ProductionInputRemark] [nvarchar](500) NULL,
	[Revenue] [decimal](18, 2) NULL,
	[RevenueRemark] [nvarchar](500) NULL,
	[FullTimeMan] [int] NULL,
	[FullTimeManRemark] [nvarchar](500) NULL,
	[FullTimeManAttachUrl] [nvarchar](2000) NULL,
	[PMMan] [int] NULL,
	[PMManRemark] [nvarchar](500) NULL,
	[PMManAttachUrl] [nvarchar](2000) NULL,
	[CorporateDirectorEdu] [int] NULL,
	[CorporateDirectorEduRemark] [nvarchar](500) NULL,
	[ProjectLeaderEdu] [int] NULL,
	[ProjectLeaderEduRemark] [nvarchar](500) NULL,
	[FullTimeEdu] [int] NULL,
	[FullTimeEduRemark] [nvarchar](500) NULL,
	[ThreeKidsEduRate] [decimal](18, 2) NULL,
	[ThreeKidsEduRateRemark] [nvarchar](500) NULL,
	[UplinReportRate] [decimal](18, 2) NULL,
	[UplinReportRateRemark] [nvarchar](500) NULL,
	[Remarks] [nvarchar](1000) NULL,
	[KeyEquipmentTotal] [int] NULL,
	[KeyEquipmentTotalRemark] [nvarchar](500) NULL,
	[KeyEquipmentReportCount] [int] NULL,
	[KeyEquipmentReportCountRemark] [nvarchar](500) NULL,
	[ChemicalAreaProjectCount] [int] NULL,
	[ChemicalAreaProjectCountRemark] [nvarchar](500) NULL,
	[HarmfulMediumCoverCount] [int] NULL,
	[HarmfulMediumCoverCountRemark] [nvarchar](500) NULL,
	[HarmfulMediumCoverRate] [decimal](18, 2) NULL,
	[HarmfulMediumCoverRateRemark] [nvarchar](500) NULL,
	[CompileMan] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
	[States] [char](1) NULL,
 CONSTRAINT [PK_InformationProject_SafetyQuarterlyReport] PRIMARY KEY CLUSTERED 
(
	[SafetyQuarterlyReportId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_SafetyQuarterlyReport', @level2type=N'COLUMN',@level2name=N'SafetyQuarterlyReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单位id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_SafetyQuarterlyReport', @level2type=N'COLUMN',@level2name=N'UnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'年度' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_SafetyQuarterlyReport', @level2type=N'COLUMN',@level2name=N'YearId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'季度(1-第一季度，2-第二季度，3-第三季度，4-第四季度)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_SafetyQuarterlyReport', @level2type=N'COLUMN',@level2name=N'Quarters'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'总投入工时数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_SafetyQuarterlyReport', @level2type=N'COLUMN',@level2name=N'TotalInWorkHours'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'总投入工时备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_SafetyQuarterlyReport', @level2type=N'COLUMN',@level2name=N'TotalInWorkHoursRemark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'总损失工时数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_SafetyQuarterlyReport', @level2type=N'COLUMN',@level2name=N'TotalOutWorkHours'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'总损失工时数备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_SafetyQuarterlyReport', @level2type=N'COLUMN',@level2name=N'TotalOutWorkHoursRemark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'百万工时损失率' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_SafetyQuarterlyReport', @level2type=N'COLUMN',@level2name=N'WorkHoursLossRate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'百万工时损失率备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_SafetyQuarterlyReport', @level2type=N'COLUMN',@level2name=N'WorkHoursLossRateRemark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'工时统计准确率' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_SafetyQuarterlyReport', @level2type=N'COLUMN',@level2name=N'WorkHoursAccuracy'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'工时统计准确率备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_SafetyQuarterlyReport', @level2type=N'COLUMN',@level2name=N'WorkHoursAccuracyRemark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主营业务收入/亿元' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_SafetyQuarterlyReport', @level2type=N'COLUMN',@level2name=N'MainBusinessIncome'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主营业务收入/亿元备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_SafetyQuarterlyReport', @level2type=N'COLUMN',@level2name=N'MainBusinessIncomeRemark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'施工收入/亿元' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_SafetyQuarterlyReport', @level2type=N'COLUMN',@level2name=N'ConstructionRevenue'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'施工收入/亿元备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_SafetyQuarterlyReport', @level2type=N'COLUMN',@level2name=N'ConstructionRevenueRemark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单位工时收入/元' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_SafetyQuarterlyReport', @level2type=N'COLUMN',@level2name=N'UnitTimeIncome'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单位工时收入/元备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_SafetyQuarterlyReport', @level2type=N'COLUMN',@level2name=N'UnitTimeIncomeRemark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'百亿产值死亡率' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_SafetyQuarterlyReport', @level2type=N'COLUMN',@level2name=N'BillionsOutputMortality'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'百亿产值死亡率备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_SafetyQuarterlyReport', @level2type=N'COLUMN',@level2name=N'BillionsOutputMortalityRemark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'重大火灾事故报告数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_SafetyQuarterlyReport', @level2type=N'COLUMN',@level2name=N'MajorFireAccident'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'重大火灾事故报告数备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_SafetyQuarterlyReport', @level2type=N'COLUMN',@level2name=N'MajorFireAccidentRemark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'重大机械设备事故报告数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_SafetyQuarterlyReport', @level2type=N'COLUMN',@level2name=N'MajorEquipAccident'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'重大机械设备事故报告数备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_SafetyQuarterlyReport', @level2type=N'COLUMN',@level2name=N'MajorEquipAccidentRemark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'事故发生频率（占总收入之比）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_SafetyQuarterlyReport', @level2type=N'COLUMN',@level2name=N'AccidentFrequency'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'事故发生频率（占总收入之比）备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_SafetyQuarterlyReport', @level2type=N'COLUMN',@level2name=N'AccidentFrequencyRemark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'重伤以上事故报告数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_SafetyQuarterlyReport', @level2type=N'COLUMN',@level2name=N'SeriousInjuryAccident'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'重伤以上事故报告数备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_SafetyQuarterlyReport', @level2type=N'COLUMN',@level2name=N'SeriousInjuryAccidentRemark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'火灾事故统计报告数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_SafetyQuarterlyReport', @level2type=N'COLUMN',@level2name=N'FireAccident'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'火灾事故统计报告数备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_SafetyQuarterlyReport', @level2type=N'COLUMN',@level2name=N'FireAccidentRemark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'装备事故统计报告数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_SafetyQuarterlyReport', @level2type=N'COLUMN',@level2name=N'EquipmentAccident'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'装备事故统计报告数备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_SafetyQuarterlyReport', @level2type=N'COLUMN',@level2name=N'EquipmentAccidentRemark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'中毒及职业伤害报告数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_SafetyQuarterlyReport', @level2type=N'COLUMN',@level2name=N'PoisoningAndInjuries'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'中毒及职业伤害报告数备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_SafetyQuarterlyReport', @level2type=N'COLUMN',@level2name=N'PoisoningAndInjuriesRemark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'安全生产投入总额/元' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_SafetyQuarterlyReport', @level2type=N'COLUMN',@level2name=N'ProductionSafetyInTotal'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'安全生产投入总额/元备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_SafetyQuarterlyReport', @level2type=N'COLUMN',@level2name=N'ProductionSafetyInTotalRemark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'安全防护投入/元' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_SafetyQuarterlyReport', @level2type=N'COLUMN',@level2name=N'ProtectionInput'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'安全防护投入/元备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_SafetyQuarterlyReport', @level2type=N'COLUMN',@level2name=N'ProtectionInputRemark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'劳动保护及职业健康投入/元' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_SafetyQuarterlyReport', @level2type=N'COLUMN',@level2name=N'LaboAndHealthIn'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'劳动保护及职业健康投入/元备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_SafetyQuarterlyReport', @level2type=N'COLUMN',@level2name=N'LaborAndHealthInRemark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'安全技术进步投入/元' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_SafetyQuarterlyReport', @level2type=N'COLUMN',@level2name=N'TechnologyProgressIn'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'安全技术进步投入/元备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_SafetyQuarterlyReport', @level2type=N'COLUMN',@level2name=N'TechnologyProgressInRemark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'安全教育培训投入/元' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_SafetyQuarterlyReport', @level2type=N'COLUMN',@level2name=N'EducationTrainIn'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'安全教育培训投入/元备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_SafetyQuarterlyReport', @level2type=N'COLUMN',@level2name=N'EducationTrainInRemark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N' 工程造价占比(%)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_SafetyQuarterlyReport', @level2type=N'COLUMN',@level2name=N'ProjectCostRate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N' 工程造价占比(%)备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_SafetyQuarterlyReport', @level2type=N'COLUMN',@level2name=N'ProjectCostRateRemark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'百万工时安全生产投入额/万元' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_SafetyQuarterlyReport', @level2type=N'COLUMN',@level2name=N'ProductionInput'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'百万工时安全生产投入额/万元备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_SafetyQuarterlyReport', @level2type=N'COLUMN',@level2name=N'ProductionInputRemark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'安全生产投入占施工收入之比' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_SafetyQuarterlyReport', @level2type=N'COLUMN',@level2name=N'Revenue'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'安全生产投入占施工收入之比备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_SafetyQuarterlyReport', @level2type=N'COLUMN',@level2name=N'RevenueRemark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'安全专职人员总数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_SafetyQuarterlyReport', @level2type=N'COLUMN',@level2name=N'FullTimeMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'安全专职人员总数备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_SafetyQuarterlyReport', @level2type=N'COLUMN',@level2name=N'FullTimeManRemark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'安全专职人员总数名单附件' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_SafetyQuarterlyReport', @level2type=N'COLUMN',@level2name=N'FullTimeManAttachUrl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目经理人员总数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_SafetyQuarterlyReport', @level2type=N'COLUMN',@level2name=N'PMMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目经理人员总数备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_SafetyQuarterlyReport', @level2type=N'COLUMN',@level2name=N'PMManRemark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目经理人员名单附件' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_SafetyQuarterlyReport', @level2type=N'COLUMN',@level2name=N'PMManAttachUrl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'企业负责人安全生产继续教育数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_SafetyQuarterlyReport', @level2type=N'COLUMN',@level2name=N'CorporateDirectorEdu'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'企业负责人安全生产继续教育备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_SafetyQuarterlyReport', @level2type=N'COLUMN',@level2name=N'CorporateDirectorEduRemark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目负责人安全生产继续教育数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_SafetyQuarterlyReport', @level2type=N'COLUMN',@level2name=N'ProjectLeaderEdu'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目负责人安全生产继续教育备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_SafetyQuarterlyReport', @level2type=N'COLUMN',@level2name=N'ProjectLeaderEduRemark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'安全专职人员安全生产继续教育数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_SafetyQuarterlyReport', @level2type=N'COLUMN',@level2name=N'FullTimeEdu'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'安全专职人员安全生产继续教育数备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_SafetyQuarterlyReport', @level2type=N'COLUMN',@level2name=N'FullTimeEduRemark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'安全生产三类人员继续教育覆盖率' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_SafetyQuarterlyReport', @level2type=N'COLUMN',@level2name=N'ThreeKidsEduRate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'安全生产三类人员继续教育覆盖率备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_SafetyQuarterlyReport', @level2type=N'COLUMN',@level2name=N'ThreeKidsEduRateRemark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'上行报告(施工现场安全生产动态季报、专项活动总结上报、生产事故按时限上报)履行率' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_SafetyQuarterlyReport', @level2type=N'COLUMN',@level2name=N'UplinReportRate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'上行报告(施工现场安全生产动态季报、专项活动总结上报、生产事故按时限上报)履行率备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_SafetyQuarterlyReport', @level2type=N'COLUMN',@level2name=N'UplinReportRateRemark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_SafetyQuarterlyReport', @level2type=N'COLUMN',@level2name=N'Remarks'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'安全生产数据季报表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_SafetyQuarterlyReport'
GO

ALTER TABLE [dbo].[InformationProject_SafetyQuarterlyReport]  WITH CHECK ADD  CONSTRAINT [FK_InformationProject_SafetyQuarterlyReport_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[InformationProject_SafetyQuarterlyReport] CHECK CONSTRAINT [FK_InformationProject_SafetyQuarterlyReport_Base_Project]
GO

ALTER TABLE [dbo].[InformationProject_SafetyQuarterlyReport]  WITH CHECK ADD  CONSTRAINT [FK_InformationProject_SafetyQuarterlyReport_Base_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[InformationProject_SafetyQuarterlyReport] CHECK CONSTRAINT [FK_InformationProject_SafetyQuarterlyReport_Base_Unit]
GO

ALTER TABLE [dbo].[InformationProject_SafetyQuarterlyReport]  WITH CHECK ADD  CONSTRAINT [FK_InformationProject_SafetyQuarterlyReport_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[InformationProject_SafetyQuarterlyReport] CHECK CONSTRAINT [FK_InformationProject_SafetyQuarterlyReport_Sys_User]
GO

 

CREATE TABLE [dbo].[InformationProject_DrillConductedQuarterlyReport](
	[DrillConductedQuarterlyReportId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[UnitId] [nvarchar](50) NULL,
	[Quarter] [int] NULL,
	[YearId] [int] NULL,
	[CompileMan] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
	[States] [char](1) NULL,
 CONSTRAINT [PK_InformationProject_DrillConductedQuarterlyReport] PRIMARY KEY CLUSTERED 
(
	[DrillConductedQuarterlyReportId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_DrillConductedQuarterlyReport', @level2type=N'COLUMN',@level2name=N'DrillConductedQuarterlyReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'填报单位' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_DrillConductedQuarterlyReport', @level2type=N'COLUMN',@level2name=N'UnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'季度' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_DrillConductedQuarterlyReport', @level2type=N'COLUMN',@level2name=N'Quarter'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'年度' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_DrillConductedQuarterlyReport', @level2type=N'COLUMN',@level2name=N'YearId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_DrillConductedQuarterlyReport', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'应急演练开展情况季报表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_DrillConductedQuarterlyReport'
GO

ALTER TABLE [dbo].[InformationProject_DrillConductedQuarterlyReport]  WITH CHECK ADD  CONSTRAINT [FK_InformationProject_DrillConductedQuarterlyReport_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[InformationProject_DrillConductedQuarterlyReport] CHECK CONSTRAINT [FK_InformationProject_DrillConductedQuarterlyReport_Base_Project]
GO

ALTER TABLE [dbo].[InformationProject_DrillConductedQuarterlyReport]  WITH CHECK ADD  CONSTRAINT [FK_InformationProject_DrillConductedQuarterlyReport_Base_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[InformationProject_DrillConductedQuarterlyReport] CHECK CONSTRAINT [FK_InformationProject_DrillConductedQuarterlyReport_Base_Unit]
GO




CREATE TABLE [dbo].[InformationProject_DrillConductedQuarterlyReportItem](
	[DrillConductedQuarterlyReportItemId] [nvarchar](50) NOT NULL,
	[DrillConductedQuarterlyReportId] [nvarchar](50) NOT NULL,
	[IndustryType] [nvarchar](50) NULL,
	[TotalConductCount] [int] NULL,
	[TotalPeopleCount] [int] NULL,
	[TotalInvestment] [money] NULL,
	[HQConductCount] [int] NULL,
	[HQPeopleCount] [int] NULL,
	[HQInvestment] [money] NULL,
	[BasicConductCount] [int] NULL,
	[BasicPeopleCount] [int] NULL,
	[BasicInvestment] [money] NULL,
	[ComprehensivePractice] [int] NULL,
	[CPScene] [int] NULL,
	[CPDesktop] [int] NULL,
	[SpecialDrill] [int] NULL,
	[SDScene] [int] NULL,
	[SDDesktop] [int] NULL,
	[SortIndex] [int] NULL,
 CONSTRAINT [PK_InformationProject_DrillConductedQuarterlyReportItem] PRIMARY KEY CLUSTERED 
(
	[DrillConductedQuarterlyReportItemId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_DrillConductedQuarterlyReportItem', @level2type=N'COLUMN',@level2name=N'DrillConductedQuarterlyReportItemId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主表Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_DrillConductedQuarterlyReportItem', @level2type=N'COLUMN',@level2name=N'DrillConductedQuarterlyReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'行业类别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_DrillConductedQuarterlyReportItem', @level2type=N'COLUMN',@level2name=N'IndustryType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'总体情况（举办次数）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_DrillConductedQuarterlyReportItem', @level2type=N'COLUMN',@level2name=N'TotalConductCount'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'总体情况（参演人数）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_DrillConductedQuarterlyReportItem', @level2type=N'COLUMN',@level2name=N'TotalPeopleCount'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'总体情况（直接投入）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_DrillConductedQuarterlyReportItem', @level2type=N'COLUMN',@level2name=N'TotalInvestment'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'企业总部（举办次数）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_DrillConductedQuarterlyReportItem', @level2type=N'COLUMN',@level2name=N'HQConductCount'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'企业总部（参演人数）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_DrillConductedQuarterlyReportItem', @level2type=N'COLUMN',@level2name=N'HQPeopleCount'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'企业总部（直接投入）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_DrillConductedQuarterlyReportItem', @level2type=N'COLUMN',@level2name=N'HQInvestment'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'基层单位（举办次数）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_DrillConductedQuarterlyReportItem', @level2type=N'COLUMN',@level2name=N'BasicConductCount'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'基层单位（参演人数）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_DrillConductedQuarterlyReportItem', @level2type=N'COLUMN',@level2name=N'BasicPeopleCount'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'基层单位（直接投入）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_DrillConductedQuarterlyReportItem', @level2type=N'COLUMN',@level2name=N'BasicInvestment'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'综合演练' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_DrillConductedQuarterlyReportItem', @level2type=N'COLUMN',@level2name=N'ComprehensivePractice'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'其中（现场）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_DrillConductedQuarterlyReportItem', @level2type=N'COLUMN',@level2name=N'CPScene'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'其中（桌面）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_DrillConductedQuarterlyReportItem', @level2type=N'COLUMN',@level2name=N'CPDesktop'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'专项演练' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_DrillConductedQuarterlyReportItem', @level2type=N'COLUMN',@level2name=N'SpecialDrill'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'其中（现场）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_DrillConductedQuarterlyReportItem', @level2type=N'COLUMN',@level2name=N'SDScene'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'其中（桌面）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_DrillConductedQuarterlyReportItem', @level2type=N'COLUMN',@level2name=N'SDDesktop'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'应急演练开展情况季报明细表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_DrillConductedQuarterlyReportItem'
GO

ALTER TABLE [dbo].[InformationProject_DrillConductedQuarterlyReportItem]  WITH CHECK ADD  CONSTRAINT [FK_InformationProject_DrillConductedQuarterlyReportItem_InformationProject_DrillConductedQuarterlyReport] FOREIGN KEY([DrillConductedQuarterlyReportId])
REFERENCES [dbo].[InformationProject_DrillConductedQuarterlyReport] ([DrillConductedQuarterlyReportId])
GO

ALTER TABLE [dbo].[InformationProject_DrillConductedQuarterlyReportItem] CHECK CONSTRAINT [FK_InformationProject_DrillConductedQuarterlyReportItem_InformationProject_DrillConductedQuarterlyReport]
GO

 

CREATE TABLE [dbo].[InformationProject_DrillPlanHalfYearReport](
	[DrillPlanHalfYearReportId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[UnitId] [nvarchar](50) NOT NULL,
	[YearId] [int] NULL,
	[HalfYearId] [int] NULL,
	[Telephone] [nvarchar](50) NULL,
	[CompileMan] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
	[States] [char](1) NULL,
 CONSTRAINT [PK_InformationProject_DrillPlanHalfYearReport] PRIMARY KEY CLUSTERED 
(
	[DrillPlanHalfYearReportId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_DrillPlanHalfYearReport', @level2type=N'COLUMN',@level2name=N'DrillPlanHalfYearReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单位' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_DrillPlanHalfYearReport', @level2type=N'COLUMN',@level2name=N'UnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'年度' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_DrillPlanHalfYearReport', @level2type=N'COLUMN',@level2name=N'YearId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'联系电话' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_DrillPlanHalfYearReport', @level2type=N'COLUMN',@level2name=N'Telephone'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'联系人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_DrillPlanHalfYearReport', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'制表时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_DrillPlanHalfYearReport', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'应急演练工作计划半年报表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_DrillPlanHalfYearReport'
GO

ALTER TABLE [dbo].[InformationProject_DrillPlanHalfYearReport]  WITH CHECK ADD  CONSTRAINT [FK_InformationProject_DrillPlanHalfYearReport_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[InformationProject_DrillPlanHalfYearReport] CHECK CONSTRAINT [FK_InformationProject_DrillPlanHalfYearReport_Base_Project]
GO

ALTER TABLE [dbo].[InformationProject_DrillPlanHalfYearReport]  WITH CHECK ADD  CONSTRAINT [FK_InformationProject_DrillPlanHalfYearReport_Base_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[InformationProject_DrillPlanHalfYearReport] CHECK CONSTRAINT [FK_InformationProject_DrillPlanHalfYearReport_Base_Unit]
GO



CREATE TABLE [dbo].[InformationProject_DrillPlanHalfYearReportItem](
	[DrillPlanHalfYearReportItemId] [nvarchar](50) NOT NULL,
	[DrillPlanHalfYearReportId] [nvarchar](50) NOT NULL,
	[DrillPlanName] [nvarchar](200) NOT NULL,
	[OrganizationUnit] [nvarchar](100) NULL,
	[DrillPlanDate] [nvarchar](50) NULL,
	[AccidentScene] [nvarchar](1000) NULL,
	[ExerciseWay] [nvarchar](50) NULL,
	[SortIndex] [int] NULL,
 CONSTRAINT [PK_InformationProject_DrillPlanHalfYearReportItem] PRIMARY KEY CLUSTERED 
(
	[DrillPlanHalfYearReportItemId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_DrillPlanHalfYearReportItem', @level2type=N'COLUMN',@level2name=N'DrillPlanHalfYearReportItemId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主表id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_DrillPlanHalfYearReportItem', @level2type=N'COLUMN',@level2name=N'DrillPlanHalfYearReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'演练名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_DrillPlanHalfYearReportItem', @level2type=N'COLUMN',@level2name=N'DrillPlanName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'组织单位' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_DrillPlanHalfYearReportItem', @level2type=N'COLUMN',@level2name=N'OrganizationUnit'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'演练时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_DrillPlanHalfYearReportItem', @level2type=N'COLUMN',@level2name=N'DrillPlanDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主要事故情景' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_DrillPlanHalfYearReportItem', @level2type=N'COLUMN',@level2name=N'AccidentScene'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'演练方式' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_DrillPlanHalfYearReportItem', @level2type=N'COLUMN',@level2name=N'ExerciseWay'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'应急演练工作计划半年报明细表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_DrillPlanHalfYearReportItem'
GO

ALTER TABLE [dbo].[InformationProject_DrillPlanHalfYearReportItem]  WITH CHECK ADD  CONSTRAINT [FK_InformationProject_DrillPlanHalfYearReportItem_InformationProject_DrillPlanHalfYearReport] FOREIGN KEY([DrillPlanHalfYearReportId])
REFERENCES [dbo].[InformationProject_DrillPlanHalfYearReport] ([DrillPlanHalfYearReportId])
GO

ALTER TABLE [dbo].[InformationProject_DrillPlanHalfYearReportItem] CHECK CONSTRAINT [FK_InformationProject_DrillPlanHalfYearReportItem_InformationProject_DrillPlanHalfYearReport]
GO


ALTER VIEW [dbo].[View_Supervise_SuperviseCheckRectify]  AS 
SELECT 
	S.SuperviseCheckRectifyId,
	S.SuperviseCheckRectifyCode,
	S.ProjectId,
	Project.ProjectName,
	S.UnitId,
	U.UnitName,
	S.CheckDate,
	S.IsFromMainUnit,
	CASE S.HandleState WHEN '1' THEN '未签发' 
					   WHEN '2' THEN '未完成'
					   ELSE '已完成' END AS HandleState,
	S.IssueMan,
	S.IssueDate
	,ISNULL(TotalCount.TotalCount,0) AS TotalCount --总项
	,ISNULL(CompleteCount.CompleteCount,0) AS CompleteCount --完成项
	,(ISNULL(TotalCount.TotalCount,0) -ISNULL(CompleteCount.CompleteCount,0)) AS UnCompleteCount
FROM dbo.Supervise_SuperviseCheckRectify AS S
LEFT JOIN Base_Project AS Project ON S.ProjectId = Project.ProjectId
LEFT JOIN dbo.Base_Unit AS U ON U.UnitId = S.UnitId
LEFT JOIN (SELECT COUNT(*) AS TotalCount, SuperviseCheckRectifyId 
		FROM dbo.Supervise_SuperviseCheckRectifyItem GROUP BY SuperviseCheckRectifyId) AS TotalCount 
		ON S.SuperviseCheckRectifyId=TotalCount.SuperviseCheckRectifyId
LEFT JOIN (SELECT COUNT(*) AS CompleteCount, SuperviseCheckRectifyId 
		FROM dbo.Supervise_SuperviseCheckRectifyItem
		WHERE RealEndDate IS NOT NULL
		 GROUP BY SuperviseCheckRectifyId) AS CompleteCount 
		ON S.SuperviseCheckRectifyId=CompleteCount.SuperviseCheckRectifyId
GO


DELETE FROM Sys_Const WHERE ID='03BBB623-EF4B-464A-BACE-EA451AC8CC07'
GO
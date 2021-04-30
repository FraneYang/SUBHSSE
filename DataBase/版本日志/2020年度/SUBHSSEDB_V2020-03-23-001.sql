ALTER TABLE SeDin_MonthReport ADD States varchar(2) null
go
CREATE TABLE [dbo].[SeDin_MonthReport1](
	[MonthReport1Id] [nvarchar](50) NOT NULL,
	[MonthReportId] [nvarchar](50) NULL,
	[ProjectCode] [nvarchar](100) NULL,
	[ProjectName] [nvarchar](100) NULL,
	[ProjectType] [nvarchar](100) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[ProjectManager] [nvarchar](500) NULL,
	[HsseManager] [nvarchar](500) NULL,
 CONSTRAINT [PK_SeDin_MonthReport1] PRIMARY KEY CLUSTERED 
(
	[MonthReport1Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SeDin_MonthReport1]  WITH CHECK ADD  CONSTRAINT [FK_SeDin_MonthReport1_SeDin_MonthReport1] FOREIGN KEY([MonthReportId])
REFERENCES [dbo].[SeDin_MonthReport] ([MonthReportId])
GO

ALTER TABLE [dbo].[SeDin_MonthReport1] CHECK CONSTRAINT [FK_SeDin_MonthReport1_SeDin_MonthReport1]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'月报明细表1ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport1', @level2type=N'COLUMN',@level2name=N'MonthReport1Id'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'月报ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport1', @level2type=N'COLUMN',@level2name=N'MonthReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport1', @level2type=N'COLUMN',@level2name=N'ProjectCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport1', @level2type=N'COLUMN',@level2name=N'ProjectName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport1', @level2type=N'COLUMN',@level2name=N'ProjectType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'合同开始日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport1', @level2type=N'COLUMN',@level2name=N'StartDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'合同结束日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport1', @level2type=N'COLUMN',@level2name=N'EndDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目经理及联系方式' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport1', @level2type=N'COLUMN',@level2name=N'ProjectManager'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'安全经理及联系方式' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport1', @level2type=N'COLUMN',@level2name=N'HsseManager'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赛鼎月报-项目信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport1'
GO

CREATE TABLE [dbo].[SeDin_MonthReport2](
	[MonthReport2Id] [nvarchar](50) NOT NULL,
	[MonthReportId] [nvarchar](50) NULL,
	[MonthWorkTime] [decimal](18, 2) NULL,
	[YearWorkTime] [decimal](18, 2) NULL,
	[ProjectWorkTime] [decimal](18, 2) NULL,
	[TotalLostTime] [decimal](18, 2) NULL,
	[MillionLossRate] [nvarchar](50) NULL,
	[TimeAccuracyRate] [nvarchar](50) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[SafeWorkTime] [decimal](18, 2) NULL,
 CONSTRAINT [PK_SeDin_MonthReport2] PRIMARY KEY CLUSTERED 
(
	[MonthReport2Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SeDin_MonthReport2]  WITH CHECK ADD  CONSTRAINT [FK_SeDin_MonthReport2_SeDin_MonthReport2] FOREIGN KEY([MonthReportId])
REFERENCES [dbo].[SeDin_MonthReport] ([MonthReportId])
GO

ALTER TABLE [dbo].[SeDin_MonthReport2] CHECK CONSTRAINT [FK_SeDin_MonthReport2_SeDin_MonthReport2]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'当月人工时' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport2', @level2type=N'COLUMN',@level2name=N'MonthWorkTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'年度累计人工时' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport2', @level2type=N'COLUMN',@level2name=N'YearWorkTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目累计人工时' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport2', @level2type=N'COLUMN',@level2name=N'ProjectWorkTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'总损失工时' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport2', @level2type=N'COLUMN',@level2name=N'TotalLostTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'百万工时损失率' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport2', @level2type=N'COLUMN',@level2name=N'MillionLossRate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'工时统计准确率' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport2', @level2type=N'COLUMN',@level2name=N'TimeAccuracyRate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'安全生产人工时' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport2', @level2type=N'COLUMN',@level2name=N'SafeWorkTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赛鼎月报-项目安全工时统计' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport2'
GO

ALTER TABLE SeDin_MonthReport ADD AccidentsSummary  nvarchar(2000) null
go
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'事故综述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport', @level2type=N'COLUMN',@level2name=N'AccidentsSummary'
GO
CREATE TABLE [dbo].[SeDin_MonthReport3](
	[MonthReport3Id] [nvarchar](50) NOT NULL,
	[MonthReportId] [nvarchar](50) NULL,
	[BigType] [nvarchar](50) NULL,
	[AccidentType] [nvarchar](50) NULL,
	[SortIndex] [int] NULL,
	[MonthTimes] [int] NULL,
	[TotalTimes] [int] NULL,
	[MonthLossTime] [decimal](18, 2) NULL,
	[TotalLossTime] [decimal](18, 2) NULL,
	[MonthMoney] [decimal](18, 2) NULL,
	[TotalMoney] [decimal](18, 2) NULL,
	[MonthPersons] [int] NULL,
	[TotalPersons] [int] NULL,
 CONSTRAINT [PK_SeDin_MonthReport3] PRIMARY KEY CLUSTERED 
(
	[MonthReport3Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SeDin_MonthReport3]  WITH CHECK ADD  CONSTRAINT [FK_SeDin_MonthReport3_SeDin_MonthReport3] FOREIGN KEY([MonthReportId])
REFERENCES [dbo].[SeDin_MonthReport] ([MonthReportId])
GO

ALTER TABLE [dbo].[SeDin_MonthReport3] CHECK CONSTRAINT [FK_SeDin_MonthReport3_SeDin_MonthReport3]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport3', @level2type=N'COLUMN',@level2name=N'MonthReport3Id'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'月报主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport3', @level2type=N'COLUMN',@level2name=N'MonthReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport3', @level2type=N'COLUMN',@level2name=N'BigType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'事故类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport3', @level2type=N'COLUMN',@level2name=N'AccidentType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport3', @level2type=N'COLUMN',@level2name=N'SortIndex'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'本月次数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport3', @level2type=N'COLUMN',@level2name=N'MonthTimes'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'累计次数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport3', @level2type=N'COLUMN',@level2name=N'TotalTimes'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'本月损失工时' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport3', @level2type=N'COLUMN',@level2name=N'MonthLossTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'累计损失工时' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport3', @level2type=N'COLUMN',@level2name=N'TotalLossTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'本月经济损失' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport3', @level2type=N'COLUMN',@level2name=N'MonthMoney'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'累计经济损失' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport3', @level2type=N'COLUMN',@level2name=N'TotalMoney'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'本月人数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport3', @level2type=N'COLUMN',@level2name=N'MonthPersons'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'累计人数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport3', @level2type=N'COLUMN',@level2name=N'TotalPersons'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赛鼎月报-项目HSE事故、事件统计' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport3'
GO



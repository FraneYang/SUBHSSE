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

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�±���ϸ��1ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport1', @level2type=N'COLUMN',@level2name=N'MonthReport1Id'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�±�ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport1', @level2type=N'COLUMN',@level2name=N'MonthReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��Ŀ���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport1', @level2type=N'COLUMN',@level2name=N'ProjectCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��Ŀ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport1', @level2type=N'COLUMN',@level2name=N'ProjectName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��Ŀ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport1', @level2type=N'COLUMN',@level2name=N'ProjectType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ͬ��ʼ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport1', @level2type=N'COLUMN',@level2name=N'StartDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ͬ��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport1', @level2type=N'COLUMN',@level2name=N'EndDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��Ŀ������ϵ��ʽ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport1', @level2type=N'COLUMN',@level2name=N'ProjectManager'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ȫ������ϵ��ʽ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport1', @level2type=N'COLUMN',@level2name=N'HsseManager'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����±�-��Ŀ��Ϣ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport1'
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

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����˹�ʱ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport2', @level2type=N'COLUMN',@level2name=N'MonthWorkTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����ۼ��˹�ʱ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport2', @level2type=N'COLUMN',@level2name=N'YearWorkTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��Ŀ�ۼ��˹�ʱ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport2', @level2type=N'COLUMN',@level2name=N'ProjectWorkTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����ʧ��ʱ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport2', @level2type=N'COLUMN',@level2name=N'TotalLostTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����ʱ��ʧ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport2', @level2type=N'COLUMN',@level2name=N'MillionLossRate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ʱͳ��׼ȷ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport2', @level2type=N'COLUMN',@level2name=N'TimeAccuracyRate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ȫ�����˹�ʱ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport2', @level2type=N'COLUMN',@level2name=N'SafeWorkTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����±�-��Ŀ��ȫ��ʱͳ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport2'
GO

ALTER TABLE SeDin_MonthReport ADD AccidentsSummary  nvarchar(2000) null
go
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�¹�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport', @level2type=N'COLUMN',@level2name=N'AccidentsSummary'
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

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport3', @level2type=N'COLUMN',@level2name=N'MonthReport3Id'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�±�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport3', @level2type=N'COLUMN',@level2name=N'MonthReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport3', @level2type=N'COLUMN',@level2name=N'BigType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�¹�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport3', @level2type=N'COLUMN',@level2name=N'AccidentType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport3', @level2type=N'COLUMN',@level2name=N'SortIndex'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���´���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport3', @level2type=N'COLUMN',@level2name=N'MonthTimes'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ۼƴ���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport3', @level2type=N'COLUMN',@level2name=N'TotalTimes'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������ʧ��ʱ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport3', @level2type=N'COLUMN',@level2name=N'MonthLossTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ۼ���ʧ��ʱ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport3', @level2type=N'COLUMN',@level2name=N'TotalLossTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���¾�����ʧ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport3', @level2type=N'COLUMN',@level2name=N'MonthMoney'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ۼƾ�����ʧ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport3', @level2type=N'COLUMN',@level2name=N'TotalMoney'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport3', @level2type=N'COLUMN',@level2name=N'MonthPersons'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ۼ�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport3', @level2type=N'COLUMN',@level2name=N'TotalPersons'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����±�-��ĿHSE�¹ʡ��¼�ͳ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport3'
GO



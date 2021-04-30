
CREATE TABLE [dbo].[Supervise_UpCheckReport](
	[UpCheckReportId] [nvarchar](50) NOT NULL,
	[UnitId] [nvarchar](50) NULL,
	[CheckStartTime] [datetime] NULL,
	[CheckEndTime] [datetime] NULL,
	[Values1] [nvarchar](4000) NULL,
	[Values2] [nvarchar](4000) NULL,
	[Values3] [nvarchar](4000) NULL,
	[Values4] [nvarchar](4000) NULL,
	[Values5] [nvarchar](4000) NULL,
	[Values6] [nvarchar](4000) NULL,
	[Values7] [nvarchar](4000) NULL,
	[CompileDate] [datetime] NULL,
	[AuditDate] [datetime] NULL,
	[UpState] [char](1) NULL,
	[UpDateTime] [datetime] NULL,
 CONSTRAINT [PK_Supervise_UpCheckReport] PRIMARY KEY CLUSTERED 
(
	[UpCheckReportId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[Supervise_UpCheckReport]  WITH CHECK ADD  CONSTRAINT [FK_Supervise_UpCheckReport_Base_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[Supervise_UpCheckReport] CHECK CONSTRAINT [FK_Supervise_UpCheckReport_Base_Unit]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���Ŀ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supervise_UpCheckReport', @level2type=N'COLUMN',@level2name=N'Values1'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supervise_UpCheckReport', @level2type=N'COLUMN',@level2name=N'Values2'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���μ��ſ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supervise_UpCheckReport', @level2type=N'COLUMN',@level2name=N'Values3'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supervise_UpCheckReport', @level2type=N'COLUMN',@level2name=N'Values4'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supervise_UpCheckReport', @level2type=N'COLUMN',@level2name=N'Values5'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�Ľ�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supervise_UpCheckReport', @level2type=N'COLUMN',@level2name=N'Values6'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supervise_UpCheckReport', @level2type=N'COLUMN',@level2name=N'Values7'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supervise_UpCheckReport', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supervise_UpCheckReport', @level2type=N'COLUMN',@level2name=N'AuditDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ϱ�״̬' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supervise_UpCheckReport', @level2type=N'COLUMN',@level2name=N'UpState'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ϱ�ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supervise_UpCheckReport', @level2type=N'COLUMN',@level2name=N'UpDateTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ҵ�ϱ��ල��鱨��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supervise_UpCheckReport'
GO


CREATE TABLE [dbo].[Supervise_UpCheckReportItem](
	[UpCheckReportItemId] [nvarchar](50) NOT NULL,
	[UpCheckReportId] [nvarchar](50) NULL,
	[SortIndex] [nvarchar](50) NULL,
	[Name] [nvarchar](50) NULL,
	[Sex] [nvarchar](50) NULL,
	[UnitName] [nvarchar](500) NULL,
	[PostName] [nvarchar](200) NULL,
	[WorkTitle] [nvarchar](200) NULL,
	[CheckPostName] [nvarchar](200) NULL,
	[CheckDate] [datetime] NULL,
 CONSTRAINT [PK_Supervise_UpCheckReportItem] PRIMARY KEY CLUSTERED 
(
	[UpCheckReportItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Supervise_UpCheckReportItem]  WITH CHECK ADD  CONSTRAINT [FK_Supervise_UpCheckReportItem_Supervise_UpCheckReport] FOREIGN KEY([UpCheckReportId])
REFERENCES [dbo].[Supervise_UpCheckReport] ([UpCheckReportId])
GO

ALTER TABLE [dbo].[Supervise_UpCheckReportItem] CHECK CONSTRAINT [FK_Supervise_UpCheckReportItem_Supervise_UpCheckReport]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ල�������id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supervise_UpCheckReportItem', @level2type=N'COLUMN',@level2name=N'UpCheckReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supervise_UpCheckReportItem', @level2type=N'COLUMN',@level2name=N'SortIndex'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�Ա�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supervise_UpCheckReportItem', @level2type=N'COLUMN',@level2name=N'Sex'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��λ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supervise_UpCheckReportItem', @level2type=N'COLUMN',@level2name=N'UnitName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ְ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supervise_UpCheckReportItem', @level2type=N'COLUMN',@level2name=N'PostName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����С��ְ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supervise_UpCheckReportItem', @level2type=N'COLUMN',@level2name=N'CheckPostName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supervise_UpCheckReportItem', @level2type=N'COLUMN',@level2name=N'CheckDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��鹤�����Ա��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supervise_UpCheckReportItem'
GO



CREATE TABLE [dbo].[Supervise_UpCheckReportItem2](
	[UpCheckReportItem2Id] [nvarchar](50) NOT NULL,
	[UpCheckReportId] [nvarchar](50) NULL,
	[SortIndex] [nvarchar](50) NULL,
	[SubjectObject] [nvarchar](500) NULL,
	[SubjectObjectInfo] [nvarchar](2000) NULL,
	[UnitMan] [nvarchar](50) NULL,
	[UnitManTel] [nvarchar](50) NULL,
	[UnitHSSEMan] [nvarchar](50) NULL,
	[UnitHSSEManTel] [nvarchar](50) NULL,
	[CheckDate] [datetime] NULL,
	[RectifyCount] [int] NULL,
	[CompRectifyCount] [int] NULL,
	[TotalGetScore] [decimal](18, 2) NULL,
	[ResultLevel] [nvarchar](50) NULL,
 CONSTRAINT [PK_Supervise_UpCheckReportItem2] PRIMARY KEY CLUSTERED 
(
	[UpCheckReportItem2Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Supervise_UpCheckReportItem2]  WITH CHECK ADD  CONSTRAINT [FK_Supervise_UpCheckReportItem2_Supervise_UpCheckReport] FOREIGN KEY([UpCheckReportId])
REFERENCES [dbo].[Supervise_UpCheckReport] ([UpCheckReportId])
GO

ALTER TABLE [dbo].[Supervise_UpCheckReportItem2] CHECK CONSTRAINT [FK_Supervise_UpCheckReportItem2_Supervise_UpCheckReport]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ҵ�ϱ���鱨��id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supervise_UpCheckReportItem2', @level2type=N'COLUMN',@level2name=N'UpCheckReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supervise_UpCheckReportItem2', @level2type=N'COLUMN',@level2name=N'SortIndex'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ܼ쵥λ����Ŀ������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supervise_UpCheckReportItem2', @level2type=N'COLUMN',@level2name=N'SubjectObject'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ܼ쵥λ����Ŀ���ſ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supervise_UpCheckReportItem2', @level2type=N'COLUMN',@level2name=N'SubjectObjectInfo'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supervise_UpCheckReportItem2', @level2type=N'COLUMN',@level2name=N'UnitMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����˵绰' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supervise_UpCheckReportItem2', @level2type=N'COLUMN',@level2name=N'UnitManTel'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ְ��ȫ��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supervise_UpCheckReportItem2', @level2type=N'COLUMN',@level2name=N'UnitHSSEMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ְ��ȫ�������˵绰' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supervise_UpCheckReportItem2', @level2type=N'COLUMN',@level2name=N'UnitHSSEManTel'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supervise_UpCheckReportItem2', @level2type=N'COLUMN',@level2name=N'RectifyCount'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supervise_UpCheckReportItem2', @level2type=N'COLUMN',@level2name=N'CompRectifyCount'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���÷�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supervise_UpCheckReportItem2', @level2type=N'COLUMN',@level2name=N'TotalGetScore'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������ȼ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supervise_UpCheckReportItem2', @level2type=N'COLUMN',@level2name=N'ResultLevel'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ҵ�ϰలȫ�ල��鱨����ϸ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supervise_UpCheckReportItem2'
GO



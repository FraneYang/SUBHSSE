CREATE TABLE [dbo].[SitePerson_DayReport_Bak](
	[DayReportId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[CompileMan] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
	[TotalPersonWorkTime] [decimal](18, 2) NULL,
	[States] [char](1) NULL,
 CONSTRAINT [PK_SitePerson_DayReport_Bak] PRIMARY KEY CLUSTERED 
(
	[DayReportId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[SitePerson_DayReport_Bak]  WITH CHECK ADD  CONSTRAINT [FK_SitePerson_DayReport_Bak_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[SitePerson_DayReport_Bak] CHECK CONSTRAINT [FK_SitePerson_DayReport_Bak_Base_Project]
GO

ALTER TABLE [dbo].[SitePerson_DayReport_Bak]  WITH CHECK ADD  CONSTRAINT [FK_SitePerson_DayReport_Bak_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[SitePerson_DayReport_Bak] CHECK CONSTRAINT [FK_SitePerson_DayReport_Bak_Sys_User]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_DayReport_Bak', @level2type=N'COLUMN',@level2name=N'DayReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��Ŀ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_DayReport_Bak', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_DayReport_Bak', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_DayReport_Bak', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ۼ��˹�ʱ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_DayReport_Bak', @level2type=N'COLUMN',@level2name=N'TotalPersonWorkTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����ձ�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_DayReport_Bak'
GO


CREATE TABLE [dbo].[SitePerson_DayReportDetail_Bak](
	[DayReportDetailId] [nvarchar](50) NOT NULL,
	[DayReportId] [nvarchar](50) NULL,
	[UnitId] [nvarchar](50) NULL,
	[WorkTime] [decimal](18, 2) NULL,
	[CheckPersonNum] [int] NULL,
	[RealPersonNum] [decimal](18, 2) NULL,
	[PersonWorkTime] [decimal](18, 2) NULL,
	[TotalPersonWorkTime] [decimal](18, 2) NULL,
	[Remark] [nvarchar](100) NULL,
	[StaffData] [nvarchar](2000) NULL,
	[DayNum] [decimal](18, 2) NULL,
	[YearPersonWorkTime] [int] NULL,
 CONSTRAINT [PK_SitePerson_DayReportDetail_Bak] PRIMARY KEY CLUSTERED 
(
	[DayReportDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[SitePerson_DayReportDetail_Bak]  WITH CHECK ADD  CONSTRAINT [FK_SitePerson_DayReportDetail_Bak_Base_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[SitePerson_DayReportDetail_Bak] CHECK CONSTRAINT [FK_SitePerson_DayReportDetail_Bak_Base_Unit]
GO

ALTER TABLE [dbo].[SitePerson_DayReportDetail_Bak]  WITH CHECK ADD  CONSTRAINT [FK_SitePerson_DayReportDetail_Bak_SitePerson_DayReport_Bak] FOREIGN KEY([DayReportId])
REFERENCES [dbo].[SitePerson_DayReport_Bak] ([DayReportId])
GO

ALTER TABLE [dbo].[SitePerson_DayReportDetail_Bak] CHECK CONSTRAINT [FK_SitePerson_DayReportDetail_Bak_SitePerson_DayReport_Bak]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_DayReportDetail_Bak', @level2type=N'COLUMN',@level2name=N'DayReportDetailId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_DayReportDetail_Bak', @level2type=N'COLUMN',@level2name=N'DayReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��λ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_DayReportDetail_Bak', @level2type=N'COLUMN',@level2name=N'UnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_DayReportDetail_Bak', @level2type=N'COLUMN',@level2name=N'CheckPersonNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ʵ������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_DayReportDetail_Bak', @level2type=N'COLUMN',@level2name=N'RealPersonNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�˹�ʱ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_DayReportDetail_Bak', @level2type=N'COLUMN',@level2name=N'PersonWorkTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ۼ��˹�ʱ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_DayReportDetail_Bak', @level2type=N'COLUMN',@level2name=N'TotalPersonWorkTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ע' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_DayReportDetail_Bak', @level2type=N'COLUMN',@level2name=N'Remark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��Ա���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_DayReportDetail_Bak', @level2type=N'COLUMN',@level2name=N'StaffData'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_DayReportDetail_Bak', @level2type=N'COLUMN',@level2name=N'DayNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����ۼ��˹�ʱ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_DayReportDetail_Bak', @level2type=N'COLUMN',@level2name=N'YearPersonWorkTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����ձ���ϸ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_DayReportDetail_Bak'
GO
CREATE TABLE [dbo].[SitePerson_DayReportUnitDetail_Bak](
	[DayReportUnitDetailId] [nvarchar](50) NOT NULL,
	[DayReportDetailId] [nvarchar](50) NULL,
	[PostId] [nvarchar](50) NULL,
	[CheckPersonNum] [int] NULL,
	[RealPersonNum] [int] NULL,
	[PersonWorkTime] [decimal](18, 2) NULL,
	[Remark] [nvarchar](200) NULL,
 CONSTRAINT [PK_SitePerson_DayReportUnitDetail_Bak] PRIMARY KEY CLUSTERED 
(
	[DayReportUnitDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[SitePerson_DayReportUnitDetail_Bak]  WITH CHECK ADD  CONSTRAINT [FK_SitePerson_DayReportUnitDetail_Bak_Base_WorkPost] FOREIGN KEY([PostId])
REFERENCES [dbo].[Base_WorkPost] ([WorkPostId])
GO

ALTER TABLE [dbo].[SitePerson_DayReportUnitDetail_Bak] CHECK CONSTRAINT [FK_SitePerson_DayReportUnitDetail_Bak_Base_WorkPost]
GO

ALTER TABLE [dbo].[SitePerson_DayReportUnitDetail_Bak]  WITH CHECK ADD  CONSTRAINT [FK_SitePerson_DayReportUnitDetail_Bak_SitePerson_DayReportDetail_Bak] FOREIGN KEY([DayReportDetailId])
REFERENCES [dbo].[SitePerson_DayReportDetail_Bak] ([DayReportDetailId])
GO

ALTER TABLE [dbo].[SitePerson_DayReportUnitDetail_Bak] CHECK CONSTRAINT [FK_SitePerson_DayReportUnitDetail_Bak_SitePerson_DayReportDetail_Bak]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��λ��ϸ�˹�ʱid' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_DayReportUnitDetail_Bak', @level2type=N'COLUMN',@level2name=N'DayReportUnitDetailId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�˹���ϸid' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_DayReportUnitDetail_Bak', @level2type=N'COLUMN',@level2name=N'DayReportDetailId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��λid' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_DayReportUnitDetail_Bak', @level2type=N'COLUMN',@level2name=N'PostId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_DayReportUnitDetail_Bak', @level2type=N'COLUMN',@level2name=N'CheckPersonNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ʵ������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_DayReportUnitDetail_Bak', @level2type=N'COLUMN',@level2name=N'RealPersonNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�˹�ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_DayReportUnitDetail_Bak', @level2type=N'COLUMN',@level2name=N'PersonWorkTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ע' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_DayReportUnitDetail_Bak', @level2type=N'COLUMN',@level2name=N'Remark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�˹�ʱ�±���λ��ϸ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_DayReportUnitDetail_Bak'
GO


INSERT INTO SitePerson_DayReport_Bak SELECT [DayReportId],[ProjectId],[CompileMan],[CompileDate],[TotalPersonWorkTime],[States]
FROM [dbo].[SitePerson_DayReport]
WHERE DayReportId IN (select DayReportId from SitePerson_DayReport WHERE CompileDate <'2020-11-01')
GO
INSERT INTO SitePerson_DayReportDetail_Bak SELECT [DayReportDetailId],[DayReportId],[UnitId],[WorkTime],[CheckPersonNum],[RealPersonNum],[PersonWorkTime]
,[TotalPersonWorkTime],[Remark],[StaffData],[DayNum],[YearPersonWorkTime]
  FROM [dbo].[SitePerson_DayReportDetail]
  WHERE DayReportId IN (select DayReportId from SitePerson_DayReport WHERE CompileDate <'2020-11-01')
GO
INSERT INTO SitePerson_DayReportUnitDetail_Bak SELECT [DayReportUnitDetailId],[DayReportDetailId],[PostId],[CheckPersonNum],[RealPersonNum]
,[PersonWorkTime],[Remark]
  FROM [dbo].[SitePerson_DayReportUnitDetail]
  WHERE DayReportDetailId IN (SELECT DayReportDetailId FROM SitePerson_DayReportDetail
WHERE DayReportId IN (SELECT DayReportId FROM SitePerson_DayReport WHERE CompileDate <'2020-11-01'))
GO

DELETE FROM [dbo].[SitePerson_DayReportUnitDetail]
WHERE DayReportDetailId IN (SELECT DayReportDetailId FROM SitePerson_DayReportDetail
WHERE DayReportId IN (SELECT DayReportId FROM SitePerson_DayReport WHERE CompileDate <'2020-11-01'))
GO
DELETE FROM [dbo].[SitePerson_DayReportDetail]
WHERE DayReportId IN (select DayReportId from SitePerson_DayReport WHERE CompileDate <'2020-11-01')
GO
DELETE FROM [dbo].[SitePerson_DayReport]
WHERE DayReportId IN (select DayReportId from SitePerson_DayReport WHERE CompileDate <'2020-11-01')
GO
CREATE TABLE [dbo].[SeDin_MonthReport4](
	[MonthReport4Id] [nvarchar](50) NOT NULL,
	[MonthReportId] [nvarchar](50) NULL,
	[UnitName] [nvarchar](50) NULL,
	[SafeManangerNum] [int] NULL,
	[OtherManangerNum] [int] NULL,
	[SpecialWorkerNum] [int] NULL,
	[GeneralWorkerNum] [int] NULL,
	[TotalNum] [int] NULL,
 CONSTRAINT [PK_SeDin_MonthReport4] PRIMARY KEY CLUSTERED 
(
	[MonthReport4Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SeDin_MonthReport4]  WITH CHECK ADD  CONSTRAINT [FK_SeDin_MonthReport4_SeDin_MonthReport4] FOREIGN KEY([MonthReportId])
REFERENCES [dbo].[SeDin_MonthReport] ([MonthReportId])
GO

ALTER TABLE [dbo].[SeDin_MonthReport4] CHECK CONSTRAINT [FK_SeDin_MonthReport4_SeDin_MonthReport4]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport4', @level2type=N'COLUMN',@level2name=N'MonthReport4Id'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'月报主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport4', @level2type=N'COLUMN',@level2name=N'MonthReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'安全管理人员' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport4', @level2type=N'COLUMN',@level2name=N'SafeManangerNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'其他管理人员' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport4', @level2type=N'COLUMN',@level2name=N'OtherManangerNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'特种作业人员' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport4', @level2type=N'COLUMN',@level2name=N'SpecialWorkerNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'一般作业人员' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport4', @level2type=N'COLUMN',@level2name=N'GeneralWorkerNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'合计人数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport4', @level2type=N'COLUMN',@level2name=N'TotalNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赛鼎月报-项目HSE事故、事件统计' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport4'
GO


ALTER TABLE SeDin_MonthReport1 ADD ContractAmount nvarchar(50) null
GO
ALTER TABLE SeDin_MonthReport1 ADD ConstructionStage nvarchar(50) null
GO
ALTER TABLE SeDin_MonthReport1 ADD ProjectAddress nvarchar(500) null
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'合同额' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport1', @level2type=N'COLUMN',@level2name=N'ContractAmount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'所处的施工阶段' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport1', @level2type=N'COLUMN',@level2name=N'ConstructionStage'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目所在地' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport1', @level2type=N'COLUMN',@level2name=N'ProjectAddress'
GO
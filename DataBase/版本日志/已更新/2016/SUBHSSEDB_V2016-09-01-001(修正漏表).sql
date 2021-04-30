CREATE TABLE [dbo].[Supervise_SubUnitCheckRectify](
	[SubUnitCheckRectifyId] [nvarchar](50) NOT NULL,
	[SuperviseCheckReportId] [nvarchar](50) NULL,
	[UnitId] [nvarchar](50) NULL,
	[CheckRectType] [char](1) NULL,
	[Values1] [nvarchar](4000) NULL,
	[Values2] [nvarchar](4000) NULL,
	[Values3] [nvarchar](4000) NULL,
	[Values4] [nvarchar](4000) NULL,
	[Values5] [nvarchar](4000) NULL,
	[Values6] [nvarchar](4000) NULL,
	[Values7] [nvarchar](4000) NULL,
	[Values8] [nvarchar](4000) NULL,
	[AttachUrl] [nvarchar](2000) NULL,
	[UpDateTime] [datetime] NULL,
	[UpState] [char](1) NULL,
	[CheckEndDate] [datetime] NULL,
 CONSTRAINT [PK_Supervise_SubUnitCheckRectify] PRIMARY KEY CLUSTERED 
(
	[SubUnitCheckRectifyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[Supervise_SubUnitCheckRectify]  WITH CHECK ADD  CONSTRAINT [FK_Supervise_SubUnitCheckRectify_Base_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[Supervise_SubUnitCheckRectify] CHECK CONSTRAINT [FK_Supervise_SubUnitCheckRectify_Base_Unit]
GO

ALTER TABLE [dbo].[Supervise_SubUnitCheckRectify]  WITH CHECK ADD  CONSTRAINT [FK_Supervise_SubUnitCheckRectify_Supervise_SuperviseCheckReport] FOREIGN KEY([SuperviseCheckReportId])
REFERENCES [dbo].[Supervise_SuperviseCheckReport] ([SuperviseCheckReportId])
GO

ALTER TABLE [dbo].[Supervise_SubUnitCheckRectify] CHECK CONSTRAINT [FK_Supervise_SubUnitCheckRectify_Supervise_SuperviseCheckReport]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'子公司检查报告Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supervise_SubUnitCheckRectify', @level2type=N'COLUMN',@level2name=N'SubUnitCheckRectifyId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'子公司id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supervise_SubUnitCheckRectify', @level2type=N'COLUMN',@level2name=N'UnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'评价类型（1-综合评价；2-单项评价）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supervise_SubUnitCheckRectify', @level2type=N'COLUMN',@level2name=N'CheckRectType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'评价目的' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supervise_SubUnitCheckRectify', @level2type=N'COLUMN',@level2name=N'Values1'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'依据' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supervise_SubUnitCheckRectify', @level2type=N'COLUMN',@level2name=N'Values2'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'被评价单位（项目）概况' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supervise_SubUnitCheckRectify', @level2type=N'COLUMN',@level2name=N'Values3'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'符合项' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supervise_SubUnitCheckRectify', @level2type=N'COLUMN',@level2name=N'Values4'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'不符合项' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supervise_SubUnitCheckRectify', @level2type=N'COLUMN',@level2name=N'Values5'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'观察项' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supervise_SubUnitCheckRectify', @level2type=N'COLUMN',@level2name=N'Values6'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'改进建议' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supervise_SubUnitCheckRectify', @level2type=N'COLUMN',@level2name=N'Values7'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'评价结论' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supervise_SubUnitCheckRectify', @level2type=N'COLUMN',@level2name=N'Values8'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'附件' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supervise_SubUnitCheckRectify', @level2type=N'COLUMN',@level2name=N'AttachUrl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'上报日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supervise_SubUnitCheckRectify', @level2type=N'COLUMN',@level2name=N'UpDateTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'检查结束时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supervise_SubUnitCheckRectify', @level2type=N'COLUMN',@level2name=N'CheckEndDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'子公司检查评价报告' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supervise_SubUnitCheckRectify'
GO


CREATE TABLE [dbo].[Supervise_SubUnitCheckRectifyItem](
	[SubUnitCheckRectifyItemId] [nvarchar](50) NOT NULL,
	[SubUnitCheckRectifyId] [nvarchar](50) NULL,
	[Name] [nvarchar](50) NULL,
	[Sex] [nvarchar](50) NULL,
	[UnitName] [nvarchar](500) NULL,
	[PostName] [nvarchar](200) NULL,
	[WorkTitle] [nvarchar](200) NULL,
	[CheckPostName] [nvarchar](200) NULL,
	[CheckDate] [datetime] NULL,
 CONSTRAINT [PK_Supervise_SubUnitCheckRectifyItem] PRIMARY KEY CLUSTERED 
(
	[SubUnitCheckRectifyItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Supervise_SubUnitCheckRectifyItem]  WITH CHECK ADD  CONSTRAINT [FK_Supervise_SubUnitCheckRectifyItem_Supervise_SubUnitCheckRectify] FOREIGN KEY([SubUnitCheckRectifyId])
REFERENCES [dbo].[Supervise_SubUnitCheckRectify] ([SubUnitCheckRectifyId])
GO

ALTER TABLE [dbo].[Supervise_SubUnitCheckRectifyItem] CHECK CONSTRAINT [FK_Supervise_SubUnitCheckRectifyItem_Supervise_SubUnitCheckRectify]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'子公司检查报告id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supervise_SubUnitCheckRectifyItem', @level2type=N'COLUMN',@level2name=N'SubUnitCheckRectifyId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'性别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supervise_SubUnitCheckRectifyItem', @level2type=N'COLUMN',@level2name=N'Sex'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单位名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supervise_SubUnitCheckRectifyItem', @level2type=N'COLUMN',@level2name=N'UnitName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'职务' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supervise_SubUnitCheckRectifyItem', @level2type=N'COLUMN',@level2name=N'PostName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'评价小组职务' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supervise_SubUnitCheckRectifyItem', @level2type=N'COLUMN',@level2name=N'CheckPostName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'评价日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supervise_SubUnitCheckRectifyItem', @level2type=N'COLUMN',@level2name=N'CheckDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'子公司检查报告成员表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supervise_SubUnitCheckRectifyItem'
GO



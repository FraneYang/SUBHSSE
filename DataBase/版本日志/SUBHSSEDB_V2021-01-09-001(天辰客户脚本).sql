ALTER TABLE [dbo].[HSSE_Hazard_HazardRegister] DROP CONSTRAINT [FK_HSSE_Hazard_HazardRegister_Check_RectifyNotices]
GO
ALTER TABLE HSSE_Hazard_HazardRegister DROP COLUMN  RectifyNoticesId
GO

ALTER TABLE HSSE_Hazard_HazardRegister ADD ResultType VARCHAR(2) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'相关联单据类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_HazardRegister', @level2type=N'COLUMN',@level2name=N'ResultType'
GO

ALTER TABLE HSSE_Hazard_HazardRegister ADD ResultId NVARCHAR(50) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项关联单据ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_HazardRegister', @level2type=N'COLUMN',@level2name=N'ResultId'
GO

ALTER TABLE HSSE_Hazard_CheckSpecial ADD CheckItemTypeName NVARCHAR(50) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'检查类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_CheckSpecial', @level2type=N'COLUMN',@level2name=N'CheckItemTypeName'
GO
ALTER TABLE HSSE_Hazard_CheckSpecial ADD CheckItemSetName NVARCHAR(50) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'检查项' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_CheckSpecial', @level2type=N'COLUMN',@level2name=N'CheckItemSetName'
GO

ALTER TABLE InformationProject_ReceiveFileManager ADD FileType VARCHAR(2) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件类型（0-项目发文；1-单位来文）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_ReceiveFileManager', @level2type=N'COLUMN',@level2name=N'FileType'
GO
/****** Object:  Index [NonClusteredIndex-20191213-100432]    Script Date: 2019/12/13 10:05:16 ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20191213-100432] ON [dbo].[InformationProject_ReceiveFileManager]
(
	[ProjectId] ASC,
	[States] ASC,
	[FileType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

UPDATE InformationProject_ReceiveFileManager SET FileType=0 WHERE FileUnitId IS NULL
GO

UPDATE InformationProject_ReceiveFileManager SET FileType=1 WHERE FileType IS NULL
GO

/****** Object:  Index [NonClusteredIndex-20191212-144622]    Script Date: 2019/12/12 15:52:24 ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20191212-144622] ON [dbo].[HSSE_Hazard_CheckSpecial]
(
	[CheckSpecialCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

CREATE TABLE [dbo].[HSSE_Hazard_CheckSpecialItem](
	[CheckSpecialItemId] [nvarchar](50) NOT NULL,
	[CheckSpecialId] [nvarchar](50) NULL,
	[DutyUnitId] [nvarchar](50) NULL,
	[WorkAreaId] [nvarchar](50) NULL,
	[CheckContent] [nvarchar](500) NULL,
	[SortIndex] [int] NULL,
	[IsOk] [bit] NULL,
	[RectifyNoticesId] [nvarchar](50) NULL,
 CONSTRAINT [PK_HSSE_Hazard_CheckSpecialItem] PRIMARY KEY CLUSTERED 
(
	[CheckSpecialItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[HSSE_Hazard_CheckSpecialItem]  WITH CHECK ADD  CONSTRAINT [FK_HSSE_Hazard_CheckSpecialItem_Base_Unit] FOREIGN KEY([DutyUnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[HSSE_Hazard_CheckSpecialItem] CHECK CONSTRAINT [FK_HSSE_Hazard_CheckSpecialItem_Base_Unit]
GO

ALTER TABLE [dbo].[HSSE_Hazard_CheckSpecialItem]  WITH CHECK ADD  CONSTRAINT [FK_HSSE_Hazard_CheckSpecialItem_Check_RectifyNotices] FOREIGN KEY([RectifyNoticesId])
REFERENCES [dbo].[Check_RectifyNotices] ([RectifyNoticesId])
GO

ALTER TABLE [dbo].[HSSE_Hazard_CheckSpecialItem] CHECK CONSTRAINT [FK_HSSE_Hazard_CheckSpecialItem_Check_RectifyNotices]
GO

ALTER TABLE [dbo].[HSSE_Hazard_CheckSpecialItem]  WITH CHECK ADD  CONSTRAINT [FK_HSSE_Hazard_CheckSpecialItem_HSSE_Hazard_CheckSpecial] FOREIGN KEY([CheckSpecialId])
REFERENCES [dbo].[HSSE_Hazard_CheckSpecial] ([CheckSpecialId])
GO

ALTER TABLE [dbo].[HSSE_Hazard_CheckSpecialItem] CHECK CONSTRAINT [FK_HSSE_Hazard_CheckSpecialItem_HSSE_Hazard_CheckSpecial]
GO

ALTER TABLE [dbo].[HSSE_Hazard_CheckSpecialItem]  WITH CHECK ADD  CONSTRAINT [FK_HSSE_Hazard_CheckSpecialItem_ProjectData_WorkArea] FOREIGN KEY([WorkAreaId])
REFERENCES [dbo].[ProjectData_WorkArea] ([WorkAreaId])
GO

ALTER TABLE [dbo].[HSSE_Hazard_CheckSpecialItem] CHECK CONSTRAINT [FK_HSSE_Hazard_CheckSpecialItem_ProjectData_WorkArea]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_CheckSpecialItem', @level2type=N'COLUMN',@level2name=N'CheckSpecialItemId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'专项检查ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_CheckSpecialItem', @level2type=N'COLUMN',@level2name=N'CheckSpecialId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'受检单位ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_CheckSpecialItem', @level2type=N'COLUMN',@level2name=N'DutyUnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'检查区域ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_CheckSpecialItem', @level2type=N'COLUMN',@level2name=N'WorkAreaId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'检查内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_CheckSpecialItem', @level2type=N'COLUMN',@level2name=N'CheckContent'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'序号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_CheckSpecialItem', @level2type=N'COLUMN',@level2name=N'SortIndex'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否合格' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_CheckSpecialItem', @level2type=N'COLUMN',@level2name=N'IsOk'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'整改单ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_CheckSpecialItem', @level2type=N'COLUMN',@level2name=N'RectifyNoticesId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'专项检查明细表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_CheckSpecialItem'
GO

/****** Object:  Index [NonClusteredIndex-20191212-155618]    Script Date: 2019/12/12 15:56:31 ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20191212-155618] ON [dbo].[HSSE_Hazard_CheckSpecialItem]
(
	[CheckSpecialId] ASC,
	[SortIndex] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Check_RectifyNotices] DROP CONSTRAINT [FK_Check_RectifyNotices_ProjectData_WorkArea]
GO

ALTER TABLE Check_RectifyNotices ALTER COLUMN WorkAreaId NVARCHAR(500) NULL
GO

ALTER TABLE Manager_SafeReport DROP COLUMN SupSubUnitReportId
GO
ALTER TABLE Manager_SafeReport ADD SupSafeReportId nvarchar(50) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'上级id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafeReport', @level2type=N'COLUMN',@level2name=N'SupSafeReportId'
GO
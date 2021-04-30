ALTER VIEW [dbo].[View_Supervise_SubUnitReportItem]
AS
/*子公司安全上报*/
SELECT Item.SubUnitReportItemId, 
	Item.SubUnitReportId, 
	Item.UnitId, 
	Item.PlanReortDate, 
	Item.ReportTitle, 
	Item.ReportContent, 
	--Item.AttachUrl, 
	Item.ReportDate, 
	Item.State, 
	Item.UpState,
	SUBSTRING(AttachFile.AttachUrl,CHARINDEX('~',AttachFile.AttachUrl)+1,LEN(AttachFile.AttachUrl)) AS  AttachUrlName,
	U.UnitName,
	(CASE WHEN Item.UpState='1' THEN '本单位' WHEN Item.UpState='2' THEN '待上报' when Item.UpState='3' then '已上报' when Item.UpState='4' then '上报失败' end) as UpStates,
	ConstUpState.ConstText AS UpStateName,
	AttachFile.AttachFileId,
    AttachFile.ToKeyId,
    AttachFile.AttachSource,
    AttachFile.AttachUrl
FROM Supervise_SubUnitReportItem AS Item
LEFT JOIN Base_Unit AS U ON U.UnitId=Item.UnitId
LEFT JOIN AttachFile AS AttachFile ON Item.SubUnitReportItemId=AttachFile.ToKeyId
LEFT JOIN Sys_Const AS ConstUpState ON Item.UpState=ConstUpState.ConstValue and ConstUpState.GroupId='UpState'

GO

CREATE TABLE [dbo].[SiteConstruction_ConstructionDynamic](
	[ConstructionDynamicId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[UnitId] [nvarchar](50) NULL,
	[CompileMan] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
	[JobContent] [nvarchar](4000) NULL,
	[AttachUrl] [nvarchar](2000) NULL,
	[SeeFile] [nvarchar](max) NULL,
 CONSTRAINT [PK_SiteConstruction_ConstructionDynamic] PRIMARY KEY CLUSTERED 
(
	[ConstructionDynamicId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [dbo].[SiteConstruction_ConstructionDynamic]  WITH CHECK ADD  CONSTRAINT [FK_SiteConstruction_ConstructionDynamic_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[SiteConstruction_ConstructionDynamic] CHECK CONSTRAINT [FK_SiteConstruction_ConstructionDynamic_Base_Project]
GO

ALTER TABLE [dbo].[SiteConstruction_ConstructionDynamic]  WITH CHECK ADD  CONSTRAINT [FK_SiteConstruction_ConstructionDynamic_Base_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[SiteConstruction_ConstructionDynamic] CHECK CONSTRAINT [FK_SiteConstruction_ConstructionDynamic_Base_Unit]
GO

ALTER TABLE [dbo].[SiteConstruction_ConstructionDynamic]  WITH CHECK ADD  CONSTRAINT [FK_SiteConstruction_ConstructionDynamic_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[SiteConstruction_ConstructionDynamic] CHECK CONSTRAINT [FK_SiteConstruction_ConstructionDynamic_Sys_User]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SiteConstruction_ConstructionDynamic', @level2type=N'COLUMN',@level2name=N'ConstructionDynamicId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SiteConstruction_ConstructionDynamic', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'施工单位' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SiteConstruction_ConstructionDynamic', @level2type=N'COLUMN',@level2name=N'UnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'附件' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SiteConstruction_ConstructionDynamic', @level2type=N'COLUMN',@level2name=N'AttachUrl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件查看' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SiteConstruction_ConstructionDynamic', @level2type=N'COLUMN',@level2name=N'SeeFile'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'现场施工动态表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SiteConstruction_ConstructionDynamic'
GO
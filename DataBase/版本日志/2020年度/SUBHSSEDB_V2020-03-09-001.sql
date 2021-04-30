--新增项目地图菜单
INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('F266456A-991F-45A3-BCD6-CF2515D71E39','项目地图','ProjectData/ProjectMap.aspx','PageHeaderFooter',80,'E82B690B-F662-4B4E-8340-6C4B8ECA44CC','Menu_Project',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('DF9EDDB2-F76D-4CAD-8EBB-4D7D574A82F9','F266456A-991F-45A3-BCD6-CF2515D71E39','保存',1)
GO 

INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('F266456A-991F-45A3-BCD6-CF2515D71E39','项目地图','ProjectData/ProjectMap.aspx','PageHeaderFooter',80,'E82B690B-F662-4B4E-8340-6C4B8ECA44CC','Menu_Project',1,0)
GO

INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('C73EC3F3-6743-4A09-8433-E7DCC22E88C0','项目地图','ProjectData/ProjectMap.aspx','Page',40,'255E0F80-BF0B-4317-BB75-361FF7B343D9','Menu_Server',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('96B93562-0028-46E0-AEB1-F299F1D240CC','C73EC3F3-6743-4A09-8433-E7DCC22E88C0','保存',4)
GO

ALTER TABLE AttachFile ADD AttachPath NVARCHAR(50) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件夹路径' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AttachFile', @level2type=N'COLUMN',@level2name=N'AttachPath'
GO
CREATE TABLE [dbo].[InformationProject_ProjectMap](
	[ProjectMapId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[ContentDef] [nvarchar](800) NULL,
	[MapType] [nvarchar](50) NULL,
	[UploadDate] [datetime] NULL,
	[AttachUrl] [nvarchar](2000) NULL,
	[CompileMan] [nvarchar](50) NULL,
 CONSTRAINT [PK_InformationProject_ProjectMap] PRIMARY KEY CLUSTERED 
(
	[ProjectMapId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[InformationProject_ProjectMap]  WITH CHECK ADD  CONSTRAINT [FK_InformationProject_ProjectMap_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[InformationProject_ProjectMap] CHECK CONSTRAINT [FK_InformationProject_ProjectMap_Base_Project]
GO

ALTER TABLE [dbo].[InformationProject_ProjectMap]  WITH CHECK ADD  CONSTRAINT [FK_InformationProject_ProjectMap_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[InformationProject_ProjectMap] CHECK CONSTRAINT [FK_InformationProject_ProjectMap_Sys_User]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_ProjectMap', @level2type=N'COLUMN',@level2name=N'ProjectMapId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'所属项目' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_ProjectMap', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图片标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_ProjectMap', @level2type=N'COLUMN',@level2name=N'Title'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'简要内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_ProjectMap', @level2type=N'COLUMN',@level2name=N'ContentDef'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类型(1-总平面布置图，2-区域平面图，3-三维模型图)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_ProjectMap', @level2type=N'COLUMN',@level2name=N'MapType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'上传日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_ProjectMap', @level2type=N'COLUMN',@level2name=N'UploadDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'附件' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_ProjectMap', @level2type=N'COLUMN',@level2name=N'AttachUrl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_ProjectMap', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N' 项目地图表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_ProjectMap'
GO

ALTER TABLE Sys_User ALTER COLUMN UserName NVARCHAR(50) NULL
GO
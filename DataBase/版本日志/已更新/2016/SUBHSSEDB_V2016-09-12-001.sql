ALTER TABLE Sys_User ADD LoginProjectId NVARCHAR(50) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登陆项目id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_User', @level2type=N'COLUMN',@level2name=N'LoginProjectId'
GO

--菜单类型
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('C6BA3325-1EBF-463A-AB14-51DF09B8BBF8','1','个人设置菜单',1,'MenuType')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('109CB08E-774B-45D5-A29E-27A1840208B9','2','本部管理菜单',2,'MenuType')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('1E203266-C960-43D6-96DA-43076933A239','3','项目现场菜单',3,'MenuType')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('7CAD59B6-F61E-49AF-8432-EE2989D5DF23','4','公共资源菜单',4,'MenuType')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('1F6A11DB-923E-45B7-B04F-AEDE0F44681F','5','基础信息菜单',5,'MenuType')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('77424619-1DE9-44B7-A683-609D63EE11C9','6','系统设置菜单',6,'MenuType')
GO
--重建系统菜单表
/****** Object:  Table [dbo].[Sys_Menu]    Script Date: 2016/9/13 16:58:36 ******/
ALTER TABLE [dbo].[Sys_ButtonPower] DROP CONSTRAINT [FK_Sys_ButtonPower_Sys_Menu]
GO
ALTER TABLE [dbo].[Sys_ButtonToMenu] DROP CONSTRAINT [FK_ButtonToMenu_Sys_Menu]
GO
ALTER TABLE [dbo].[Sys_RolePower] DROP CONSTRAINT [FK_Sys_RolePower_Sys_Menu]
GO

ALTER TABLE [dbo].[ProjectData_FlowOperate] DROP CONSTRAINT [FK_ProjectData_FlowOperate_Sys_Menu]
GO

DROP TABLE [dbo].[Sys_Menu]
GO

DELETE FROM Sys_ButtonPower
GO
DELETE FROM Sys_ButtonToMenu
GO

CREATE TABLE [dbo].[Sys_MenuCommon](
	[MenuId] [nvarchar](50) NOT NULL,
	[MenuName] [nvarchar](50) NULL,
	[Url] [nvarchar](200) NULL,
	[Icon] [nvarchar](50) NULL,
	[SortIndex] [int] NULL,
	[SuperMenu] [nvarchar](50) NULL,
	[MenuType] [nvarchar](50) NULL,
	[IsEnd] [bit] NULL,
	[IsUnit] [bit] NULL,
 CONSTRAINT [PK_Sys_MenuCommon] PRIMARY KEY CLUSTERED 
(
	[MenuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_MenuCommon', @level2type=N'COLUMN',@level2name=N'MenuId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_MenuCommon', @level2type=N'COLUMN',@level2name=N'MenuName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'路径' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_MenuCommon', @level2type=N'COLUMN',@level2name=N'Url'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单图标' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_MenuCommon', @level2type=N'COLUMN',@level2name=N'Icon'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排列序号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_MenuCommon', @level2type=N'COLUMN',@level2name=N'SortIndex'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'上级菜单' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_MenuCommon', @level2type=N'COLUMN',@level2name=N'SuperMenu'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_MenuCommon', @level2type=N'COLUMN',@level2name=N'MenuType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否末级菜单' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_MenuCommon', @level2type=N'COLUMN',@level2name=N'IsEnd'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否单位订制' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_MenuCommon', @level2type=N'COLUMN',@level2name=N'IsUnit'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'系统菜单—类型通用（非项目）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_MenuCommon'
GO

CREATE TABLE [dbo].[Sys_MenuProjectA](
	[MenuId] [nvarchar](50) NOT NULL,
	[MenuName] [nvarchar](50) NULL,
	[Url] [nvarchar](200) NULL,
	[Icon] [nvarchar](50) NULL,
	[SortIndex] [int] NULL,
	[SuperMenu] [nvarchar](50) NULL,
	[MenuType] [nvarchar](50) NULL,
	[IsEnd] [bit] NULL,
	[IsUnit] [bit] NULL,
 CONSTRAINT [PK_Sys_MenuProjectA] PRIMARY KEY CLUSTERED 
(
	[MenuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_MenuProjectA', @level2type=N'COLUMN',@level2name=N'MenuId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_MenuProjectA', @level2type=N'COLUMN',@level2name=N'MenuName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'路径' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_MenuProjectA', @level2type=N'COLUMN',@level2name=N'Url'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单图标' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_MenuProjectA', @level2type=N'COLUMN',@level2name=N'Icon'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排列序号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_MenuProjectA', @level2type=N'COLUMN',@level2name=N'SortIndex'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'上级菜单' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_MenuProjectA', @level2type=N'COLUMN',@level2name=N'SuperMenu'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_MenuProjectA', @level2type=N'COLUMN',@level2name=N'MenuType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否末级菜单' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_MenuProjectA', @level2type=N'COLUMN',@level2name=N'IsEnd'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否单位订制' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_MenuProjectA', @level2type=N'COLUMN',@level2name=N'IsUnit'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'系统菜单—类型（项目）A模式' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_MenuProjectA'
GO

CREATE TABLE [dbo].[Sys_MenuProjectB](
	[MenuId] [nvarchar](50) NOT NULL,
	[MenuName] [nvarchar](50) NULL,
	[Url] [nvarchar](200) NULL,
	[Icon] [nvarchar](50) NULL,
	[SortIndex] [int] NULL,
	[SuperMenu] [nvarchar](50) NULL,
	[MenuType] [nvarchar](50) NULL,
	[IsEnd] [bit] NULL,
	[IsUnit] [bit] NULL,
 CONSTRAINT [PK_Sys_MenuProjectB] PRIMARY KEY CLUSTERED 
(
	[MenuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_MenuProjectB', @level2type=N'COLUMN',@level2name=N'MenuId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_MenuProjectB', @level2type=N'COLUMN',@level2name=N'MenuName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'路径' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_MenuProjectB', @level2type=N'COLUMN',@level2name=N'Url'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单图标' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_MenuProjectB', @level2type=N'COLUMN',@level2name=N'Icon'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排列序号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_MenuProjectB', @level2type=N'COLUMN',@level2name=N'SortIndex'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'上级菜单' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_MenuProjectB', @level2type=N'COLUMN',@level2name=N'SuperMenu'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_MenuProjectB', @level2type=N'COLUMN',@level2name=N'MenuType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否末级菜单' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_MenuProjectB', @level2type=N'COLUMN',@level2name=N'IsEnd'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否单位订制' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_MenuProjectB', @level2type=N'COLUMN',@level2name=N'IsUnit'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'系统菜单—类型（项目）B模式' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_MenuProjectB'
GO



CREATE TABLE [dbo].[Sys_MenuUnit](
	[MenuUnitId] [nvarchar](50) NOT NULL,
	[MenuId] [nvarchar](50) NULL,
	[UnitId] [nvarchar](50) NULL,
	[MenuName] [nvarchar](50) NULL,
	[Icon] [nvarchar](50) NULL,
	[Url] [nvarchar](200) NULL,
	[SortIndex] [int] NULL,
	[SuperMenu] [nvarchar](50) NULL,
	[MenuType] [nvarchar](50) NULL,
	[IsEnd] [bit] NULL,
	[IsUsed] [bit] NULL,
 CONSTRAINT [PK_Sys_MenuUnit] PRIMARY KEY CLUSTERED 
(
	[MenuUnitId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[Sys_MenuUnit]  WITH CHECK ADD  CONSTRAINT [FK_Sys_MenuUnit_Base_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[Sys_MenuUnit] CHECK CONSTRAINT [FK_Sys_MenuUnit_Base_Unit]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单位菜单id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_MenuUnit', @level2type=N'COLUMN',@level2name=N'MenuUnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_MenuUnit', @level2type=N'COLUMN',@level2name=N'MenuId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_MenuUnit', @level2type=N'COLUMN',@level2name=N'MenuName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单图标' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_MenuUnit', @level2type=N'COLUMN',@level2name=N'Icon'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'路径' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_MenuUnit', @level2type=N'COLUMN',@level2name=N'Url'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排列序号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_MenuUnit', @level2type=N'COLUMN',@level2name=N'SortIndex'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'上级菜单' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_MenuUnit', @level2type=N'COLUMN',@level2name=N'SuperMenu'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_MenuUnit', @level2type=N'COLUMN',@level2name=N'MenuType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否末级菜单' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_MenuUnit', @level2type=N'COLUMN',@level2name=N'IsEnd'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否启用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_MenuUnit', @level2type=N'COLUMN',@level2name=N'IsUsed'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'系统菜单—单位菜单' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_MenuUnit'
GO



CREATE TABLE [dbo].[Sys_Menu](
	[MenuUsedId] [nvarchar](50) NOT NULL,
	[MenuId] [nvarchar](50) NULL,
	[UnitId] [nvarchar](50) NULL,
	[MenuName] [nvarchar](50) NULL,
	[Icon] [nvarchar](50) NULL,
	[Url] [nvarchar](200) NULL,
	[SortIndex] [int] NULL,
	[SuperMenu] [nvarchar](50) NULL,
	[MenuType] [nvarchar](50) NULL,
	[IsEnd] [bit] NULL,
	[IsUsed] [bit] NULL,
 CONSTRAINT [PK_Sys_Menu] PRIMARY KEY CLUSTERED 
(
	[MenuUsedId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[Sys_Menu]  WITH CHECK ADD  CONSTRAINT [FK_Sys_Menu_Base_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[Sys_Menu] CHECK CONSTRAINT [FK_Sys_Menu_Base_Unit]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单位使用菜单id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Menu', @level2type=N'COLUMN',@level2name=N'MenuUsedId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Menu', @level2type=N'COLUMN',@level2name=N'MenuId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Menu', @level2type=N'COLUMN',@level2name=N'MenuName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单图标' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Menu', @level2type=N'COLUMN',@level2name=N'Icon'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'路径' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Menu', @level2type=N'COLUMN',@level2name=N'Url'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排列序号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Menu', @level2type=N'COLUMN',@level2name=N'SortIndex'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'上级菜单' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Menu', @level2type=N'COLUMN',@level2name=N'SuperMenu'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Menu', @level2type=N'COLUMN',@level2name=N'MenuType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否末级菜单' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Menu', @level2type=N'COLUMN',@level2name=N'IsEnd'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否启用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Menu', @level2type=N'COLUMN',@level2name=N'IsUsed'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'—单位系统菜单使用表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Menu'
GO
ALTER TABLE Sys_User ADD LoginProjectId NVARCHAR(50) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��½��Ŀid' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_User', @level2type=N'COLUMN',@level2name=N'LoginProjectId'
GO

--�˵�����
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('C6BA3325-1EBF-463A-AB14-51DF09B8BBF8','1','�������ò˵�',1,'MenuType')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('109CB08E-774B-45D5-A29E-27A1840208B9','2','��������˵�',2,'MenuType')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('1E203266-C960-43D6-96DA-43076933A239','3','��Ŀ�ֳ��˵�',3,'MenuType')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('7CAD59B6-F61E-49AF-8432-EE2989D5DF23','4','������Դ�˵�',4,'MenuType')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('1F6A11DB-923E-45B7-B04F-AEDE0F44681F','5','������Ϣ�˵�',5,'MenuType')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('77424619-1DE9-44B7-A683-609D63EE11C9','6','ϵͳ���ò˵�',6,'MenuType')
GO
--�ؽ�ϵͳ�˵���
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

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�˵�ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_MenuCommon', @level2type=N'COLUMN',@level2name=N'MenuId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�˵�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_MenuCommon', @level2type=N'COLUMN',@level2name=N'MenuName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'·��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_MenuCommon', @level2type=N'COLUMN',@level2name=N'Url'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�˵�ͼ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_MenuCommon', @level2type=N'COLUMN',@level2name=N'Icon'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_MenuCommon', @level2type=N'COLUMN',@level2name=N'SortIndex'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ϼ��˵�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_MenuCommon', @level2type=N'COLUMN',@level2name=N'SuperMenu'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�˵�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_MenuCommon', @level2type=N'COLUMN',@level2name=N'MenuType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�Ƿ�ĩ���˵�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_MenuCommon', @level2type=N'COLUMN',@level2name=N'IsEnd'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�Ƿ�λ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_MenuCommon', @level2type=N'COLUMN',@level2name=N'IsUnit'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ϵͳ�˵�������ͨ�ã�����Ŀ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_MenuCommon'
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

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�˵�ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_MenuProjectA', @level2type=N'COLUMN',@level2name=N'MenuId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�˵�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_MenuProjectA', @level2type=N'COLUMN',@level2name=N'MenuName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'·��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_MenuProjectA', @level2type=N'COLUMN',@level2name=N'Url'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�˵�ͼ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_MenuProjectA', @level2type=N'COLUMN',@level2name=N'Icon'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_MenuProjectA', @level2type=N'COLUMN',@level2name=N'SortIndex'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ϼ��˵�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_MenuProjectA', @level2type=N'COLUMN',@level2name=N'SuperMenu'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�˵�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_MenuProjectA', @level2type=N'COLUMN',@level2name=N'MenuType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�Ƿ�ĩ���˵�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_MenuProjectA', @level2type=N'COLUMN',@level2name=N'IsEnd'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�Ƿ�λ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_MenuProjectA', @level2type=N'COLUMN',@level2name=N'IsUnit'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ϵͳ�˵������ͣ���Ŀ��Aģʽ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_MenuProjectA'
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

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�˵�ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_MenuProjectB', @level2type=N'COLUMN',@level2name=N'MenuId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�˵�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_MenuProjectB', @level2type=N'COLUMN',@level2name=N'MenuName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'·��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_MenuProjectB', @level2type=N'COLUMN',@level2name=N'Url'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�˵�ͼ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_MenuProjectB', @level2type=N'COLUMN',@level2name=N'Icon'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_MenuProjectB', @level2type=N'COLUMN',@level2name=N'SortIndex'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ϼ��˵�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_MenuProjectB', @level2type=N'COLUMN',@level2name=N'SuperMenu'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�˵�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_MenuProjectB', @level2type=N'COLUMN',@level2name=N'MenuType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�Ƿ�ĩ���˵�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_MenuProjectB', @level2type=N'COLUMN',@level2name=N'IsEnd'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�Ƿ�λ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_MenuProjectB', @level2type=N'COLUMN',@level2name=N'IsUnit'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ϵͳ�˵������ͣ���Ŀ��Bģʽ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_MenuProjectB'
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

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��λ�˵�id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_MenuUnit', @level2type=N'COLUMN',@level2name=N'MenuUnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�˵�ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_MenuUnit', @level2type=N'COLUMN',@level2name=N'MenuId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�˵�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_MenuUnit', @level2type=N'COLUMN',@level2name=N'MenuName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�˵�ͼ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_MenuUnit', @level2type=N'COLUMN',@level2name=N'Icon'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'·��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_MenuUnit', @level2type=N'COLUMN',@level2name=N'Url'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_MenuUnit', @level2type=N'COLUMN',@level2name=N'SortIndex'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ϼ��˵�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_MenuUnit', @level2type=N'COLUMN',@level2name=N'SuperMenu'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�˵�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_MenuUnit', @level2type=N'COLUMN',@level2name=N'MenuType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�Ƿ�ĩ���˵�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_MenuUnit', @level2type=N'COLUMN',@level2name=N'IsEnd'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�Ƿ�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_MenuUnit', @level2type=N'COLUMN',@level2name=N'IsUsed'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ϵͳ�˵�����λ�˵�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_MenuUnit'
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

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��λʹ�ò˵�id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Menu', @level2type=N'COLUMN',@level2name=N'MenuUsedId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�˵�ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Menu', @level2type=N'COLUMN',@level2name=N'MenuId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�˵�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Menu', @level2type=N'COLUMN',@level2name=N'MenuName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�˵�ͼ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Menu', @level2type=N'COLUMN',@level2name=N'Icon'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'·��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Menu', @level2type=N'COLUMN',@level2name=N'Url'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Menu', @level2type=N'COLUMN',@level2name=N'SortIndex'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ϼ��˵�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Menu', @level2type=N'COLUMN',@level2name=N'SuperMenu'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�˵�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Menu', @level2type=N'COLUMN',@level2name=N'MenuType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�Ƿ�ĩ���˵�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Menu', @level2type=N'COLUMN',@level2name=N'IsEnd'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�Ƿ�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Menu', @level2type=N'COLUMN',@level2name=N'IsUsed'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����λϵͳ�˵�ʹ�ñ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Menu'
GO
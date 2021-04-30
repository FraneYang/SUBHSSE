CREATE TABLE [dbo].[Project_ProjectUnit](
	[ProjectUnitId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[UnitId] [nvarchar](50) NULL,
	[UnitType] [nvarchar](50) NULL,
	[InTime] [datetime] NULL,
	[OutTime] [datetime] NULL,
 CONSTRAINT [PK_Project_ProjectUnit] PRIMARY KEY CLUSTERED 
(
	[ProjectUnitId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Project_ProjectUnit]  WITH CHECK ADD  CONSTRAINT [FK_Project_ProjectUnit_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[Project_ProjectUnit] CHECK CONSTRAINT [FK_Project_ProjectUnit_Base_Project]
GO

ALTER TABLE [dbo].[Project_ProjectUnit]  WITH CHECK ADD  CONSTRAINT [FK_Project_ProjectUnit_Base_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[Project_ProjectUnit] CHECK CONSTRAINT [FK_Project_ProjectUnit_Base_Unit]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目单位id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Project_ProjectUnit', @level2type=N'COLUMN',@level2name=N'ProjectUnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'入场时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Project_ProjectUnit', @level2type=N'COLUMN',@level2name=N'InTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'出场时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Project_ProjectUnit', @level2type=N'COLUMN',@level2name=N'OutTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目单位表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Project_ProjectUnit'
GO

CREATE TABLE [dbo].[Project_ProjectUser](
	[ProjectUserId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[UserId] [nvarchar](50) NULL,
	[UnitId] [nvarchar](50) NULL,
	[RoleId] [nvarchar](500) NULL,
	[IsPost] [bit] NULL,
	[RoleName] [nvarchar](500) NULL,
 CONSTRAINT [PK_Project_ProjectUser] PRIMARY KEY CLUSTERED 
(
	[ProjectUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Project_ProjectUser]  WITH CHECK ADD  CONSTRAINT [FK_Project_ProjectUser_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[Project_ProjectUser] CHECK CONSTRAINT [FK_Project_ProjectUser_Base_Project]
GO

ALTER TABLE [dbo].[Project_ProjectUser]  WITH CHECK ADD  CONSTRAINT [FK_Project_ProjectUser_Base_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[Project_ProjectUser] CHECK CONSTRAINT [FK_Project_ProjectUser_Base_Unit]
GO

ALTER TABLE [dbo].[Project_ProjectUser]  WITH CHECK ADD  CONSTRAINT [FK_Project_ProjectUser_Sys_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[Project_ProjectUser] CHECK CONSTRAINT [FK_Project_ProjectUser_Sys_User]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目用户id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Project_ProjectUser', @level2type=N'COLUMN',@level2name=N'ProjectUserId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Project_ProjectUser', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Project_ProjectUser', @level2type=N'COLUMN',@level2name=N'UserId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单位id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Project_ProjectUser', @level2type=N'COLUMN',@level2name=N'UnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Project_ProjectUser', @level2type=N'COLUMN',@level2name=N'RoleId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否在岗（true-在岗；false-离岗）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Project_ProjectUser', @level2type=N'COLUMN',@level2name=N'IsPost'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Project_ProjectUser', @level2type=N'COLUMN',@level2name=N'RoleName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目用户表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Project_ProjectUser'
GO


--项目单位类型
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('D95611A1-731C-4C28-B914-856DB6300692','1','总包',1,'ProjectUnitType')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('12729AD0-9CDB-41D8-B088-12D23DB7608C','2','施工分包',2,'ProjectUnitType')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('06BD8FC6-C044-42E3-BACB-A276E1A6F062','3','监理',3,'ProjectUnitType')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('6E93D814-74CF-4447-A537-A1762B6E8401','4','业主',4,'ProjectUnitType')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('ACB6DD56-D788-4BBA-AA7E-9E3CB7573918','5','其他',5,'ProjectUnitType')
GO

/****** Object:  View [dbo].[View_Information_SafeProductionExpress]    Script Date: 2016/9/21 16:40:41 ******/
DROP VIEW [dbo].[View_Information_SafeProductionExpress]
GO

/****** Object:  View [dbo].[View_Information_SafeProductionExpressTree]    Script Date: 2016/9/21 16:40:56 ******/
DROP VIEW [dbo].[View_Information_SafeProductionExpressTree]
GO

/****** Object:  Table [dbo].[Information_SafeProductionExpress]    Script Date: 2016/9/21 16:41:20 ******/
DROP TABLE [dbo].[Information_SafeProductionExpress]
GO
/****** Object:  Table [dbo].[ProjectSupervision_OnLineSupervisionItem]    Script Date: 2016/9/21 16:49:29 ******/
DROP TABLE [dbo].[ProjectSupervision_OnLineSupervisionItem]
GO
/****** Object:  Table [dbo].[ProjectSupervision_OnLineSupervision]    Script Date: 2016/9/21 16:49:33 ******/
DROP TABLE [dbo].[ProjectSupervision_OnLineSupervision]
GO



ALTER TABLE Base_SpecialEquipment ADD IsSpecial BIT
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否特种机具' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_SpecialEquipment', @level2type=N'COLUMN',@level2name=N'IsSpecial'
GO

CREATE TABLE [dbo].[License_EquipmentSafetyList](
	[EquipmentSafetyListId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[EquipmentSafetyListCode] [nvarchar](50) NULL,
	[EquipmentSafetyListName] [nvarchar](50) NULL,
	[UnitId] [nvarchar](50) NULL,
	[EquipmentSafetyListCount] [int] NULL,
	[WorkAreaId] [nvarchar](50) NULL,
	[CompileMan] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
 CONSTRAINT [PK_License_EquipmentSafetyList] PRIMARY KEY CLUSTERED 
(
	[EquipmentSafetyListId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_EquipmentSafetyList', @level2type=N'COLUMN',@level2name=N'EquipmentSafetyListId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_EquipmentSafetyList', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_EquipmentSafetyList', @level2type=N'COLUMN',@level2name=N'EquipmentSafetyListCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'施工机具、安全设施名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_EquipmentSafetyList', @level2type=N'COLUMN',@level2name=N'EquipmentSafetyListName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'申请单位' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_EquipmentSafetyList', @level2type=N'COLUMN',@level2name=N'UnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'施工机具、安全设施数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_EquipmentSafetyList', @level2type=N'COLUMN',@level2name=N'EquipmentSafetyListCount'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'所在区域' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_EquipmentSafetyList', @level2type=N'COLUMN',@level2name=N'WorkAreaId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'申请人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_EquipmentSafetyList', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_EquipmentSafetyList', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'施工机具、安全设施检查验收' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_EquipmentSafetyList'
GO

ALTER TABLE [dbo].[License_EquipmentSafetyList]  WITH CHECK ADD  CONSTRAINT [FK_License_EquipmentSafetyList_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[License_EquipmentSafetyList] CHECK CONSTRAINT [FK_License_EquipmentSafetyList_Base_Project]
GO

ALTER TABLE [dbo].[License_EquipmentSafetyList]  WITH CHECK ADD  CONSTRAINT [FK_License_EquipmentSafetyList_Base_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[License_EquipmentSafetyList] CHECK CONSTRAINT [FK_License_EquipmentSafetyList_Base_Unit]
GO

ALTER TABLE [dbo].[License_EquipmentSafetyList]  WITH CHECK ADD  CONSTRAINT [FK_License_EquipmentSafetyList_ProjectData_WorkArea] FOREIGN KEY([WorkAreaId])
REFERENCES [dbo].[ProjectData_WorkArea] ([WorkAreaId])
GO

ALTER TABLE [dbo].[License_EquipmentSafetyList] CHECK CONSTRAINT [FK_License_EquipmentSafetyList_ProjectData_WorkArea]
GO

ALTER TABLE [dbo].[License_EquipmentSafetyList]  WITH CHECK ADD  CONSTRAINT [FK_License_EquipmentSafetyList_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[License_EquipmentSafetyList] CHECK CONSTRAINT [FK_License_EquipmentSafetyList_Sys_User]
GO

CREATE TABLE [dbo].[License_HSETechnical](
	[HSETechnicalId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[HSETechnicalCode] [nvarchar](50) NULL,
	[HSETechnicalDate] [datetime] NULL,
	[UnitId] [nvarchar](50) NULL,
	[TeamGroupId] [nvarchar](50) NULL,
	[WorkContents] [nvarchar](150) NULL,
	[Address] [nvarchar](150) NULL,
	[CompileMan] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
 CONSTRAINT [PK_License_HSETechnical] PRIMARY KEY CLUSTERED 
(
	[HSETechnicalId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_HSETechnical', @level2type=N'COLUMN',@level2name=N'HSETechnicalId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_HSETechnical', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_HSETechnical', @level2type=N'COLUMN',@level2name=N'HSETechnicalCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_HSETechnical', @level2type=N'COLUMN',@level2name=N'HSETechnicalDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单位Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_HSETechnical', @level2type=N'COLUMN',@level2name=N'UnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'班组Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_HSETechnical', @level2type=N'COLUMN',@level2name=N'TeamGroupId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作业内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_HSETechnical', @level2type=N'COLUMN',@level2name=N'WorkContents'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_HSETechnical', @level2type=N'COLUMN',@level2name=N'Address'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_HSETechnical', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_HSETechnical', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'安全技术交底' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_HSETechnical'
GO

ALTER TABLE [dbo].[License_HSETechnical]  WITH CHECK ADD  CONSTRAINT [FK_License_HSETechnical_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[License_HSETechnical] CHECK CONSTRAINT [FK_License_HSETechnical_Base_Project]
GO

ALTER TABLE [dbo].[License_HSETechnical]  WITH CHECK ADD  CONSTRAINT [FK_License_HSETechnical_Base_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[License_HSETechnical] CHECK CONSTRAINT [FK_License_HSETechnical_Base_Unit]
GO

ALTER TABLE [dbo].[License_HSETechnical]  WITH CHECK ADD  CONSTRAINT [FK_License_HSETechnical_ProjectData_TeamGroup] FOREIGN KEY([TeamGroupId])
REFERENCES [dbo].[ProjectData_TeamGroup] ([TeamGroupId])
GO

ALTER TABLE [dbo].[License_HSETechnical] CHECK CONSTRAINT [FK_License_HSETechnical_ProjectData_TeamGroup]
GO

ALTER TABLE [dbo].[License_HSETechnical]  WITH CHECK ADD  CONSTRAINT [FK_License_HSETechnical_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[License_HSETechnical] CHECK CONSTRAINT [FK_License_HSETechnical_Sys_User]
GO
CREATE TABLE [dbo].[Resources_SignManage](
	[SignManageId] [nvarchar](50) NOT NULL,
	[SignName] [nvarchar](50) NULL,
	[SignCode] [nvarchar](50) NULL,
	[SignLen] [nvarchar](50) NULL,
	[SignWide] [nvarchar](50) NULL,
	[SignHigh] [nvarchar](50) NULL,
	[SignThick] [nvarchar](50) NULL,
	[Material] [nvarchar](50) NULL,
	[SignArea] [nvarchar](200) NULL,
	[SignType] [char](1) NULL,
	[SignImage] [nvarchar](max) NULL,
	[SignUrl] [nvarchar](400) NULL,
 CONSTRAINT [PK_Resources_SignManage] PRIMARY KEY CLUSTERED 
(
	[SignManageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Resources_SignManage', @level2type=N'COLUMN',@level2name=N'SignManageId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标牌名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Resources_SignManage', @level2type=N'COLUMN',@level2name=N'SignName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标牌编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Resources_SignManage', @level2type=N'COLUMN',@level2name=N'SignCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'长度' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Resources_SignManage', @level2type=N'COLUMN',@level2name=N'SignLen'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'宽度' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Resources_SignManage', @level2type=N'COLUMN',@level2name=N'SignWide'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'高度' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Resources_SignManage', @level2type=N'COLUMN',@level2name=N'SignHigh'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'厚度' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Resources_SignManage', @level2type=N'COLUMN',@level2name=N'SignThick'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'材质' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Resources_SignManage', @level2type=N'COLUMN',@level2name=N'Material'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'使用位置' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Resources_SignManage', @level2type=N'COLUMN',@level2name=N'SignArea'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标牌类型（1:组织机构;2:操作规程;3:标识标牌;4:防护规范图集;5:文明施工形象）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Resources_SignManage', @level2type=N'COLUMN',@level2name=N'SignType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图片' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Resources_SignManage', @level2type=N'COLUMN',@level2name=N'SignImage'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'附件路径' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Resources_SignManage', @level2type=N'COLUMN',@level2name=N'SignUrl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标牌管理资源库' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Resources_SignManage'
GO

--标牌类型
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('F0A37E9B-779C-4F59-A639-C3010960CE4B','1','组织机构',1,'SignType')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('6C4A41DF-A330-4FB1-AB52-12FC93531204','2','操作规程',2,'SignType')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('C294C6C3-3F5F-406B-974E-A60A328090D6','3','标识标牌',3,'SignType')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('7D95A06F-F6ED-4AAA-AC89-1D21037FF9E2','4','防护规范图集',4,'SignType')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('4D54AD76-05D9-4014-A509-0AA37156D598','5','文明施工形象',5,'SignType')
GO

CREATE TABLE [dbo].[Resources_ResourcesData](
	[ResourcesDataId] [nvarchar](50) NOT NULL,
	[FileName] [nvarchar](500) NULL,
	[FileCode] [nvarchar](50) NULL,
	[Remark] [nvarchar](500) NULL,
	[FileContent] [nvarchar](max) NULL,
	[FileUrl] [nvarchar](400) NULL,
 CONSTRAINT [PK_Resources_ResourcesData] PRIMARY KEY CLUSTERED 
(
	[ResourcesDataId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Resources_ResourcesData', @level2type=N'COLUMN',@level2name=N'ResourcesDataId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Resources_ResourcesData', @level2type=N'COLUMN',@level2name=N'FileName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Resources_ResourcesData', @level2type=N'COLUMN',@level2name=N'FileCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'说明' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Resources_ResourcesData', @level2type=N'COLUMN',@level2name=N'Remark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Resources_ResourcesData', @level2type=N'COLUMN',@level2name=N'FileContent'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'附件路径' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Resources_ResourcesData', @level2type=N'COLUMN',@level2name=N'FileUrl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'参考资料资源库' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Resources_ResourcesData'
GO


CREATE TABLE [dbo].[Resources_ProblemAnswer](
	[ProblemAnswerId] [nvarchar](50) NOT NULL,
	[Problem] [nvarchar](500) NULL,
	[ProblemContent] [nvarchar](max) NULL,
	[Answer] [nvarchar](500) NULL,
	[AnswerContent] [nvarchar](max) NULL,
	[CompileDate] [datetime] NULL,
 CONSTRAINT [PK_Resources_ProblemAnswer] PRIMARY KEY CLUSTERED 
(
	[ProblemAnswerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Resources_ProblemAnswer', @level2type=N'COLUMN',@level2name=N'ProblemAnswerId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'问题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Resources_ProblemAnswer', @level2type=N'COLUMN',@level2name=N'Problem'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'问题内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Resources_ProblemAnswer', @level2type=N'COLUMN',@level2name=N'ProblemContent'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'答案内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Resources_ProblemAnswer', @level2type=N'COLUMN',@level2name=N'AnswerContent'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Resources_ProblemAnswer', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'问题及答案资源库' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Resources_ProblemAnswer'
GO

CREATE TABLE [dbo].[Emergency_EmergencyList](
	[EmergencyListId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[EmergencyCode] [nvarchar](50) NULL,
	[EmergencyName] [nvarchar](500) NULL,
	[UnitId] [nvarchar](50) NULL,
	[EmergencyTypeId] [nvarchar](50) NULL,
	[VersionCode] [nvarchar](50) NULL,
	[EmergencyContents] [nvarchar](max) NULL,
	[CompileMan] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
	[States] [char](1) NULL,
	[AttachUrl] [nvarchar](2000) NULL,
 CONSTRAINT [PK_Emergency_EmergencyList] PRIMARY KEY CLUSTERED 
(
	[EmergencyListId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[Emergency_EmergencyList]  WITH CHECK ADD  CONSTRAINT [FK_Emergency_EmergencyList_Base_EmergencyType] FOREIGN KEY([EmergencyTypeId])
REFERENCES [dbo].[Base_EmergencyType] ([EmergencyTypeId])
GO

ALTER TABLE [dbo].[Emergency_EmergencyList] CHECK CONSTRAINT [FK_Emergency_EmergencyList_Base_EmergencyType]
GO

ALTER TABLE [dbo].[Emergency_EmergencyList]  WITH CHECK ADD  CONSTRAINT [FK_Emergency_EmergencyList_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[Emergency_EmergencyList] CHECK CONSTRAINT [FK_Emergency_EmergencyList_Base_Project]
GO

ALTER TABLE [dbo].[Emergency_EmergencyList]  WITH CHECK ADD  CONSTRAINT [FK_Emergency_EmergencyList_Base_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[Emergency_EmergencyList] CHECK CONSTRAINT [FK_Emergency_EmergencyList_Base_Unit]
GO

ALTER TABLE [dbo].[Emergency_EmergencyList]  WITH CHECK ADD  CONSTRAINT [FK_Emergency_EmergencyList_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[Emergency_EmergencyList] CHECK CONSTRAINT [FK_Emergency_EmergencyList_Sys_User]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'应急响应id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_EmergencyList', @level2type=N'COLUMN',@level2name=N'EmergencyListId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_EmergencyList', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_EmergencyList', @level2type=N'COLUMN',@level2name=N'EmergencyCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_EmergencyList', @level2type=N'COLUMN',@level2name=N'EmergencyName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单位id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_EmergencyList', @level2type=N'COLUMN',@level2name=N'UnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'应急响应类型id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_EmergencyList', @level2type=N'COLUMN',@level2name=N'EmergencyTypeId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'版本号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_EmergencyList', @level2type=N'COLUMN',@level2name=N'VersionCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'整理人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_EmergencyList', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_EmergencyList', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_EmergencyList', @level2type=N'COLUMN',@level2name=N'States'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'附件' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_EmergencyList', @level2type=N'COLUMN',@level2name=N'AttachUrl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'应急预案管理清单表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_EmergencyList'
GO


CREATE TABLE [dbo].[Emergency_DrillRecordList](
	[DrillRecordListId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[DrillRecordCode] [nvarchar](50) NULL,
	[DrillRecordName] [nvarchar](500) NULL,
	[UnitIds] [nvarchar](4000) NULL,
	[UnitNames] [nvarchar](4000) NULL,
	[UserIds] [nvarchar](4000) NULL,
	[UserNames] [nvarchar](4000) NULL,
	[DrillRecordDate] [datetime] NULL,
	[DrillRecordContents] [nvarchar](max) NULL,
	[CompileMan] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
	[States] [char](1) NULL,
	[AttachUrl] [nvarchar](2000) NULL,
 CONSTRAINT [PK_Emergency_DrillRecordList] PRIMARY KEY CLUSTERED 
(
	[DrillRecordListId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[Emergency_DrillRecordList]  WITH CHECK ADD  CONSTRAINT [FK_Emergency_DrillRecordList_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[Emergency_DrillRecordList] CHECK CONSTRAINT [FK_Emergency_DrillRecordList_Base_Project]
GO

ALTER TABLE [dbo].[Emergency_DrillRecordList]  WITH CHECK ADD  CONSTRAINT [FK_Emergency_DrillRecordList_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[Emergency_DrillRecordList] CHECK CONSTRAINT [FK_Emergency_DrillRecordList_Sys_User]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'应急响应id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_DrillRecordList', @level2type=N'COLUMN',@level2name=N'DrillRecordListId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_DrillRecordList', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_DrillRecordList', @level2type=N'COLUMN',@level2name=N'DrillRecordCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_DrillRecordList', @level2type=N'COLUMN',@level2name=N'DrillRecordName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'参与单位id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_DrillRecordList', @level2type=N'COLUMN',@level2name=N'UnitIds'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'参与单位名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_DrillRecordList', @level2type=N'COLUMN',@level2name=N'UnitNames'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'参与人员id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_DrillRecordList', @level2type=N'COLUMN',@level2name=N'UserIds'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'参与人员名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_DrillRecordList', @level2type=N'COLUMN',@level2name=N'UserNames'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'演练时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_DrillRecordList', @level2type=N'COLUMN',@level2name=N'DrillRecordDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'整理人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_DrillRecordList', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_DrillRecordList', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_DrillRecordList', @level2type=N'COLUMN',@level2name=N'States'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'附件' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_DrillRecordList', @level2type=N'COLUMN',@level2name=N'AttachUrl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'应急演练记录表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_DrillRecordList'
GO


CREATE TABLE [dbo].[Emergency_EmergencySupply](
	[FileId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[FileCode] [nvarchar](50) NULL,
	[FileName] [nvarchar](200) NULL,
	[UnitId] [nvarchar](50) NULL,
	[FileContent] [nvarchar](max) NULL,
	[CompileMan] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
	[AttachUrl] [nvarchar](4000) NULL,
	[States] [char](1) NULL,
 CONSTRAINT [PK_Emergency_EmergencySupply] PRIMARY KEY CLUSTERED 
(
	[FileId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[Emergency_EmergencySupply]  WITH CHECK ADD  CONSTRAINT [FK_Emergency_EmergencySupply_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[Emergency_EmergencySupply] CHECK CONSTRAINT [FK_Emergency_EmergencySupply_Base_Project]
GO

ALTER TABLE [dbo].[Emergency_EmergencySupply]  WITH CHECK ADD  CONSTRAINT [FK_Emergency_EmergencySupply_Base_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[Emergency_EmergencySupply] CHECK CONSTRAINT [FK_Emergency_EmergencySupply_Base_Unit]
GO

ALTER TABLE [dbo].[Emergency_EmergencySupply]  WITH CHECK ADD  CONSTRAINT [FK_Emergency_EmergencySupply_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[Emergency_EmergencySupply] CHECK CONSTRAINT [FK_Emergency_EmergencySupply_Sys_User]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_EmergencySupply', @level2type=N'COLUMN',@level2name=N'FileId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_EmergencySupply', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_EmergencySupply', @level2type=N'COLUMN',@level2name=N'FileCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_EmergencySupply', @level2type=N'COLUMN',@level2name=N'FileName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单位id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_EmergencySupply', @level2type=N'COLUMN',@level2name=N'UnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_EmergencySupply', @level2type=N'COLUMN',@level2name=N'FileContent'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'整理人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_EmergencySupply', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'整理日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_EmergencySupply', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'附件' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_EmergencySupply', @level2type=N'COLUMN',@level2name=N'AttachUrl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_EmergencySupply', @level2type=N'COLUMN',@level2name=N'States'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'应急物资管理' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_EmergencySupply'
GO

CREATE TABLE [dbo].[Emergency_EmergencyTeamAndTrain](
	[FileId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[FileCode] [nvarchar](50) NULL,
	[FileName] [nvarchar](200) NULL,
	[UnitId] [nvarchar](50) NULL,
	[FileContent] [nvarchar](max) NULL,
	[CompileMan] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
	[AttachUrl] [nvarchar](4000) NULL,
	[States] [char](1) NULL,
 CONSTRAINT [PK_Emergency_EmergencyTeamAndTrain] PRIMARY KEY CLUSTERED 
(
	[FileId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[Emergency_EmergencyTeamAndTrain]  WITH CHECK ADD  CONSTRAINT [FK_Emergency_EmergencyTeamAndTrain_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[Emergency_EmergencyTeamAndTrain] CHECK CONSTRAINT [FK_Emergency_EmergencyTeamAndTrain_Base_Project]
GO

ALTER TABLE [dbo].[Emergency_EmergencyTeamAndTrain]  WITH CHECK ADD  CONSTRAINT [FK_Emergency_EmergencyTeamAndTrain_Base_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[Emergency_EmergencyTeamAndTrain] CHECK CONSTRAINT [FK_Emergency_EmergencyTeamAndTrain_Base_Unit]
GO

ALTER TABLE [dbo].[Emergency_EmergencyTeamAndTrain]  WITH CHECK ADD  CONSTRAINT [FK_Emergency_EmergencyTeamAndTrain_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[Emergency_EmergencyTeamAndTrain] CHECK CONSTRAINT [FK_Emergency_EmergencyTeamAndTrain_Sys_User]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_EmergencyTeamAndTrain', @level2type=N'COLUMN',@level2name=N'FileId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_EmergencyTeamAndTrain', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_EmergencyTeamAndTrain', @level2type=N'COLUMN',@level2name=N'FileCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_EmergencyTeamAndTrain', @level2type=N'COLUMN',@level2name=N'FileName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单位id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_EmergencyTeamAndTrain', @level2type=N'COLUMN',@level2name=N'UnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_EmergencyTeamAndTrain', @level2type=N'COLUMN',@level2name=N'FileContent'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'整理人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_EmergencyTeamAndTrain', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'整理日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_EmergencyTeamAndTrain', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'附件' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_EmergencyTeamAndTrain', @level2type=N'COLUMN',@level2name=N'AttachUrl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_EmergencyTeamAndTrain', @level2type=N'COLUMN',@level2name=N'States'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'应急队伍与培训' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_EmergencyTeamAndTrain'
GO


CREATE TABLE [dbo].[Emergency_EmergencyResponseRecord](
	[FileId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[FileCode] [nvarchar](50) NULL,
	[FileName] [nvarchar](200) NULL,
	[UnitId] [nvarchar](50) NULL,
	[FileContent] [nvarchar](max) NULL,
	[CompileMan] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
	[AttachUrl] [nvarchar](4000) NULL,
	[States] [char](1) NULL,
 CONSTRAINT [PK_Emergency_EmergencyResponseRecord] PRIMARY KEY CLUSTERED 
(
	[FileId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[Emergency_EmergencyResponseRecord]  WITH CHECK ADD  CONSTRAINT [FK_Emergency_EmergencyResponseRecord_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[Emergency_EmergencyResponseRecord] CHECK CONSTRAINT [FK_Emergency_EmergencyResponseRecord_Base_Project]
GO

ALTER TABLE [dbo].[Emergency_EmergencyResponseRecord]  WITH CHECK ADD  CONSTRAINT [FK_Emergency_EmergencyResponseRecord_Base_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[Emergency_EmergencyResponseRecord] CHECK CONSTRAINT [FK_Emergency_EmergencyResponseRecord_Base_Unit]
GO

ALTER TABLE [dbo].[Emergency_EmergencyResponseRecord]  WITH CHECK ADD  CONSTRAINT [FK_Emergency_EmergencyResponseRecord_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[Emergency_EmergencyResponseRecord] CHECK CONSTRAINT [FK_Emergency_EmergencyResponseRecord_Sys_User]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_EmergencyResponseRecord', @level2type=N'COLUMN',@level2name=N'FileId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_EmergencyResponseRecord', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_EmergencyResponseRecord', @level2type=N'COLUMN',@level2name=N'FileCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_EmergencyResponseRecord', @level2type=N'COLUMN',@level2name=N'FileName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单位id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_EmergencyResponseRecord', @level2type=N'COLUMN',@level2name=N'UnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_EmergencyResponseRecord', @level2type=N'COLUMN',@level2name=N'FileContent'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'整理人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_EmergencyResponseRecord', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'整理日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_EmergencyResponseRecord', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'附件' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_EmergencyResponseRecord', @level2type=N'COLUMN',@level2name=N'AttachUrl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_EmergencyResponseRecord', @level2type=N'COLUMN',@level2name=N'States'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'应急响应记录/评价' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_EmergencyResponseRecord'
GO

INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('E4A1B5BE-EFF4-42AC-A59C-CE1B2010F788','1','施工方案审查',1,'InvestigateType')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('4F8BB7DD-E94F-405D-B050-CB0B5CB74DE8','2','HSSE方案审查',2,'InvestigateType')
GO
CREATE TABLE [dbo].[Technique_ProjectSolutionTemplete](
	[TempleteId] [nvarchar](50) NOT NULL,
	[TempleteCode] [nvarchar](50) NOT NULL,
	[TempleteName] [nvarchar](50) NOT NULL,
	[TempleteType] [char](1) NULL,
	[FileContents] [nvarchar](max) NULL,
	[CompileMan] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
 CONSTRAINT [PK_Technique_ProjectSolutionTemplete] PRIMARY KEY CLUSTERED 
(
	[TempleteId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Technique_ProjectSolutionTemplete', @level2type=N'COLUMN',@level2name=N'TempleteId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Technique_ProjectSolutionTemplete', @level2type=N'COLUMN',@level2name=N'TempleteCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Technique_ProjectSolutionTemplete', @level2type=N'COLUMN',@level2name=N'TempleteName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Technique_ProjectSolutionTemplete', @level2type=N'COLUMN',@level2name=N'TempleteType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'模板' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Technique_ProjectSolutionTemplete', @level2type=N'COLUMN',@level2name=N'FileContents'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Technique_ProjectSolutionTemplete', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Technique_ProjectSolutionTemplete', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'现场施工方案模版' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Technique_ProjectSolutionTemplete'
GO

ALTER TABLE [dbo].[Technique_ProjectSolutionTemplete]  WITH CHECK ADD  CONSTRAINT [FK_Technique_ProjectSolutionTemplete_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[Technique_ProjectSolutionTemplete] CHECK CONSTRAINT [FK_Technique_ProjectSolutionTemplete_Sys_User]
GO



CREATE TABLE [dbo].[Solution_SolutionTemplate](
	[SolutionTemplateId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NOT NULL,
	[SolutionTemplateCode] [nvarchar](50) NULL,
	[SolutionTemplateName] [nvarchar](50) NULL,
	[SolutionTemplateType] [char](1) NULL,
	[FileContents] [nvarchar](max) NULL,
	[CompileMan] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
 CONSTRAINT [PK_Solution_SolutionTemplate] PRIMARY KEY CLUSTERED 
(
	[SolutionTemplateId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Solution_SolutionTemplate', @level2type=N'COLUMN',@level2name=N'SolutionTemplateId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Solution_SolutionTemplate', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'方案模板编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Solution_SolutionTemplate', @level2type=N'COLUMN',@level2name=N'SolutionTemplateCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'方案模板名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Solution_SolutionTemplate', @level2type=N'COLUMN',@level2name=N'SolutionTemplateName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'方案类别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Solution_SolutionTemplate', @level2type=N'COLUMN',@level2name=N'SolutionTemplateType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'模板' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Solution_SolutionTemplate', @level2type=N'COLUMN',@level2name=N'FileContents'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Solution_SolutionTemplate', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Solution_SolutionTemplate', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'方案模板' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Solution_SolutionTemplate'
GO

ALTER TABLE [dbo].[Solution_SolutionTemplate]  WITH CHECK ADD  CONSTRAINT [FK_Solution_SolutionTemplate_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[Solution_SolutionTemplate] CHECK CONSTRAINT [FK_Solution_SolutionTemplate_Base_Project]
GO

ALTER TABLE [dbo].[Solution_SolutionTemplate]  WITH CHECK ADD  CONSTRAINT [FK_Solution_SolutionTemplate_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[Solution_SolutionTemplate] CHECK CONSTRAINT [FK_Solution_SolutionTemplate_Sys_User]
GO


CREATE TABLE [dbo].[Solution_ConstructSolution](
	[ConstructSolutionId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NOT NULL,
	[ConstructSolutionCode] [nvarchar](50) NOT NULL,
	[ConstructSolutionName] [nvarchar](150) NULL,
	[VersionNo] [nvarchar](10) NULL,
	[UnitId] [nvarchar](50) NOT NULL,
	[InvestigateType] [char](1) NOT NULL,
	[SolutinType] [char](1) NULL,
	[FileContents] [nvarchar](max) NULL,
	[Remark] [nvarchar](500) NULL,
	[CompileMan] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
	[States] [char](1) NULL,
 CONSTRAINT [PK_Solution_ConstructSolution] PRIMARY KEY CLUSTERED 
(
	[ConstructSolutionId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Solution_ConstructSolution', @level2type=N'COLUMN',@level2name=N'ConstructSolutionId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Solution_ConstructSolution', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'方案审查编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Solution_ConstructSolution', @level2type=N'COLUMN',@level2name=N'ConstructSolutionCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Solution_ConstructSolution', @level2type=N'COLUMN',@level2name=N'ConstructSolutionName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'版本号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Solution_ConstructSolution', @level2type=N'COLUMN',@level2name=N'VersionNo'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单位id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Solution_ConstructSolution', @level2type=N'COLUMN',@level2name=N'UnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'审查类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Solution_ConstructSolution', @level2type=N'COLUMN',@level2name=N'InvestigateType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'方案类别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Solution_ConstructSolution', @level2type=N'COLUMN',@level2name=N'SolutinType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'模板' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Solution_ConstructSolution', @level2type=N'COLUMN',@level2name=N'FileContents'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Solution_ConstructSolution', @level2type=N'COLUMN',@level2name=N'Remark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Solution_ConstructSolution', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Solution_ConstructSolution', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Solution_ConstructSolution', @level2type=N'COLUMN',@level2name=N'States'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'施工方案/审查' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Solution_ConstructSolution'
GO

ALTER TABLE [dbo].[Solution_ConstructSolution]  WITH CHECK ADD  CONSTRAINT [FK_Solution_ConstructSolution_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[Solution_ConstructSolution] CHECK CONSTRAINT [FK_Solution_ConstructSolution_Base_Project]
GO

ALTER TABLE [dbo].[Solution_ConstructSolution]  WITH CHECK ADD  CONSTRAINT [FK_Solution_ConstructSolution_Base_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[Solution_ConstructSolution] CHECK CONSTRAINT [FK_Solution_ConstructSolution_Base_Unit]
GO

ALTER TABLE [dbo].[Solution_ConstructSolution]  WITH CHECK ADD  CONSTRAINT [FK_Solution_ConstructSolution_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[Solution_ConstructSolution] CHECK CONSTRAINT [FK_Solution_ConstructSolution_Sys_User]
GO


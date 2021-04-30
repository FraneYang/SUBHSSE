CREATE TABLE [dbo].[InformationProject_ReceiveFileManager](
	[ReceiveFileManagerId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[ReceiveFileCode] [nvarchar](50) NULL,
	[ReceiveFileName] [nvarchar](50) NULL,
	[Version] [nvarchar](50) NULL,
	[FileUnitId] [nvarchar](50) NULL,
	[FileCode] [nvarchar](50) NULL,
	[FilePageNum] [int] NULL,
	[GetFileDate] [datetime] NULL,
	[SendPersonId] [nvarchar](50) NULL,
	[MainContent] [nvarchar](max) NULL,
	[AttachUrl] [nvarchar](4000) NULL,
	[States] [char](1) NULL,
 CONSTRAINT [PK_InformationProject_ReceiveFileManager] PRIMARY KEY CLUSTERED 
(
	[ReceiveFileManagerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[InformationProject_ReceiveFileManager]  WITH CHECK ADD  CONSTRAINT [FK_InformationProject_ReceiveFileManager_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[InformationProject_ReceiveFileManager] CHECK CONSTRAINT [FK_InformationProject_ReceiveFileManager_Base_Project]
GO

ALTER TABLE [dbo].[InformationProject_ReceiveFileManager]  WITH CHECK ADD  CONSTRAINT [FK_InformationProject_ReceiveFileManager_Base_Unit] FOREIGN KEY([FileUnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[InformationProject_ReceiveFileManager] CHECK CONSTRAINT [FK_InformationProject_ReceiveFileManager_Base_Unit]
GO

ALTER TABLE [dbo].[InformationProject_ReceiveFileManager]  WITH CHECK ADD  CONSTRAINT [FK_InformationProject_ReceiveFileManager_Sys_User] FOREIGN KEY([SendPersonId])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[InformationProject_ReceiveFileManager] CHECK CONSTRAINT [FK_InformationProject_ReceiveFileManager_Sys_User]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_ReceiveFileManager', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'来文编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_ReceiveFileManager', @level2type=N'COLUMN',@level2name=N'ReceiveFileCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'来文名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_ReceiveFileManager', @level2type=N'COLUMN',@level2name=N'ReceiveFileName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'版本号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_ReceiveFileManager', @level2type=N'COLUMN',@level2name=N'Version'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'来文单位id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_ReceiveFileManager', @level2type=N'COLUMN',@level2name=N'FileUnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'原文编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_ReceiveFileManager', @level2type=N'COLUMN',@level2name=N'FileCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'原文页数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_ReceiveFileManager', @level2type=N'COLUMN',@level2name=N'FilePageNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'收文日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_ReceiveFileManager', @level2type=N'COLUMN',@level2name=N'GetFileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'传送人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_ReceiveFileManager', @level2type=N'COLUMN',@level2name=N'SendPersonId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'来文内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_ReceiveFileManager', @level2type=N'COLUMN',@level2name=N'MainContent'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'附件地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_ReceiveFileManager', @level2type=N'COLUMN',@level2name=N'AttachUrl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_ReceiveFileManager', @level2type=N'COLUMN',@level2name=N'States'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'一般来文管理表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_ReceiveFileManager'
GO
CREATE TABLE [dbo].[FinalFileManage_OwnerFinalFile](
	[FileId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[FileCode] [nvarchar](50) NULL,
	[FileName] [nvarchar](200) NULL,
	[KeyWords] [nvarchar](200) NULL,
	[FileContent] [nvarchar](max) NULL,
	[CompileMan] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
	[AttachUrl] [nvarchar](4000) NULL,
	[States] [char](1) NULL,
 CONSTRAINT [PK_FinalFileManage_OwnerFinalFile] PRIMARY KEY CLUSTERED 
(
	[FileId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[FinalFileManage_OwnerFinalFile]  WITH CHECK ADD  CONSTRAINT [FK_FinalFileManage_OwnerFinalFile_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[FinalFileManage_OwnerFinalFile] CHECK CONSTRAINT [FK_FinalFileManage_OwnerFinalFile_Base_Project]
GO

ALTER TABLE [dbo].[FinalFileManage_OwnerFinalFile]  WITH CHECK ADD  CONSTRAINT [FK_FinalFileManage_OwnerFinalFile_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[FinalFileManage_OwnerFinalFile] CHECK CONSTRAINT [FK_FinalFileManage_OwnerFinalFile_Sys_User]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FinalFileManage_OwnerFinalFile', @level2type=N'COLUMN',@level2name=N'FileId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FinalFileManage_OwnerFinalFile', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FinalFileManage_OwnerFinalFile', @level2type=N'COLUMN',@level2name=N'FileCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FinalFileManage_OwnerFinalFile', @level2type=N'COLUMN',@level2name=N'FileName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'关键字' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FinalFileManage_OwnerFinalFile', @level2type=N'COLUMN',@level2name=N'KeyWords'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FinalFileManage_OwnerFinalFile', @level2type=N'COLUMN',@level2name=N'FileContent'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'整理人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FinalFileManage_OwnerFinalFile', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'整理日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FinalFileManage_OwnerFinalFile', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'附件' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FinalFileManage_OwnerFinalFile', @level2type=N'COLUMN',@level2name=N'AttachUrl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FinalFileManage_OwnerFinalFile', @level2type=N'COLUMN',@level2name=N'States'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'业主管理文档表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FinalFileManage_OwnerFinalFile'
GO


CREATE TABLE [dbo].[FinalFileManage_FinalFileList](
	[FileId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[FileCode] [nvarchar](50) NULL,
	[FileName] [nvarchar](200) NULL,
	[KeyWords] [nvarchar](200) NULL,
	[FileContent] [nvarchar](max) NULL,
	[CompileMan] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
	[AttachUrl] [nvarchar](4000) NULL,
	[States] [char](1) NULL,
 CONSTRAINT [PK_FinalFileManage_FinalFileList] PRIMARY KEY CLUSTERED 
(
	[FileId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[FinalFileManage_FinalFileList]  WITH CHECK ADD  CONSTRAINT [FK_FinalFileManage_FinalFileList_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[FinalFileManage_FinalFileList] CHECK CONSTRAINT [FK_FinalFileManage_FinalFileList_Base_Project]
GO

ALTER TABLE [dbo].[FinalFileManage_FinalFileList]  WITH CHECK ADD  CONSTRAINT [FK_FinalFileManage_FinalFileList_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[FinalFileManage_FinalFileList] CHECK CONSTRAINT [FK_FinalFileManage_FinalFileList_Sys_User]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FinalFileManage_FinalFileList', @level2type=N'COLUMN',@level2name=N'FileId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FinalFileManage_FinalFileList', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FinalFileManage_FinalFileList', @level2type=N'COLUMN',@level2name=N'FileCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FinalFileManage_FinalFileList', @level2type=N'COLUMN',@level2name=N'FileName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'关键字' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FinalFileManage_FinalFileList', @level2type=N'COLUMN',@level2name=N'KeyWords'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FinalFileManage_FinalFileList', @level2type=N'COLUMN',@level2name=N'FileContent'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'整理人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FinalFileManage_FinalFileList', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'整理日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FinalFileManage_FinalFileList', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'附件' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FinalFileManage_FinalFileList', @level2type=N'COLUMN',@level2name=N'AttachUrl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FinalFileManage_FinalFileList', @level2type=N'COLUMN',@level2name=N'States'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'监理管理文档表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FinalFileManage_FinalFileList'
GO


CREATE TABLE [dbo].[FinalFileManage_OtherDocumentList](
	[FileId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[FileCode] [nvarchar](50) NULL,
	[FileName] [nvarchar](200) NULL,
	[KeyWords] [nvarchar](200) NULL,
	[FileContent] [nvarchar](max) NULL,
	[CompileMan] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
	[AttachUrl] [nvarchar](4000) NULL,
	[States] [char](1) NULL,
 CONSTRAINT [PK_FinalFileManage_OtherDocumentList] PRIMARY KEY CLUSTERED 
(
	[FileId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[FinalFileManage_OtherDocumentList]  WITH CHECK ADD  CONSTRAINT [FK_FinalFileManage_OtherDocumentList_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[FinalFileManage_OtherDocumentList] CHECK CONSTRAINT [FK_FinalFileManage_OtherDocumentList_Base_Project]
GO

ALTER TABLE [dbo].[FinalFileManage_OtherDocumentList]  WITH CHECK ADD  CONSTRAINT [FK_FinalFileManage_OtherDocumentList_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[FinalFileManage_OtherDocumentList] CHECK CONSTRAINT [FK_FinalFileManage_OtherDocumentList_Sys_User]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FinalFileManage_OtherDocumentList', @level2type=N'COLUMN',@level2name=N'FileId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FinalFileManage_OtherDocumentList', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FinalFileManage_OtherDocumentList', @level2type=N'COLUMN',@level2name=N'FileCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FinalFileManage_OtherDocumentList', @level2type=N'COLUMN',@level2name=N'FileName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'关键字' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FinalFileManage_OtherDocumentList', @level2type=N'COLUMN',@level2name=N'KeyWords'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FinalFileManage_OtherDocumentList', @level2type=N'COLUMN',@level2name=N'FileContent'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'整理人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FinalFileManage_OtherDocumentList', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'整理日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FinalFileManage_OtherDocumentList', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'附件' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FinalFileManage_OtherDocumentList', @level2type=N'COLUMN',@level2name=N'AttachUrl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FinalFileManage_OtherDocumentList', @level2type=N'COLUMN',@level2name=N'States'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'其他管理文档表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FinalFileManage_OtherDocumentList'
GO


CREATE TABLE [dbo].[FinalFileManage_HSEFinalFileList](
	[FileId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[FileCode] [nvarchar](50) NULL,
	[FileName] [nvarchar](200) NULL,
	[KeyWords] [nvarchar](200) NULL,
	[FileContent] [nvarchar](max) NULL,
	[CompileMan] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
	[AttachUrl] [nvarchar](4000) NULL,
	[States] [char](1) NULL,
 CONSTRAINT [PK_FinalFileManage_HSEFinalFileList] PRIMARY KEY CLUSTERED 
(
	[FileId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[FinalFileManage_HSEFinalFileList]  WITH CHECK ADD  CONSTRAINT [FK_FinalFileManage_HSEFinalFileList_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[FinalFileManage_HSEFinalFileList] CHECK CONSTRAINT [FK_FinalFileManage_HSEFinalFileList_Base_Project]
GO

ALTER TABLE [dbo].[FinalFileManage_HSEFinalFileList]  WITH CHECK ADD  CONSTRAINT [FK_FinalFileManage_HSEFinalFileList_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[FinalFileManage_HSEFinalFileList] CHECK CONSTRAINT [FK_FinalFileManage_HSEFinalFileList_Sys_User]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FinalFileManage_HSEFinalFileList', @level2type=N'COLUMN',@level2name=N'FileId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FinalFileManage_HSEFinalFileList', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FinalFileManage_HSEFinalFileList', @level2type=N'COLUMN',@level2name=N'FileCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FinalFileManage_HSEFinalFileList', @level2type=N'COLUMN',@level2name=N'FileName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'关键字' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FinalFileManage_HSEFinalFileList', @level2type=N'COLUMN',@level2name=N'KeyWords'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FinalFileManage_HSEFinalFileList', @level2type=N'COLUMN',@level2name=N'FileContent'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'整理人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FinalFileManage_HSEFinalFileList', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'整理日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FinalFileManage_HSEFinalFileList', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'附件' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FinalFileManage_HSEFinalFileList', @level2type=N'COLUMN',@level2name=N'AttachUrl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FinalFileManage_HSEFinalFileList', @level2type=N'COLUMN',@level2name=N'States'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'已定稿文件表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FinalFileManage_HSEFinalFileList'
GO



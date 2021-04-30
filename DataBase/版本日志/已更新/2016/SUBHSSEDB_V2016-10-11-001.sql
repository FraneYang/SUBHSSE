CREATE TABLE [dbo].[InformationProject_Notice](
	[NoticeId] [nvarchar](50) NOT NULL,
	[NoticeCode] [nvarchar](30) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[NoticeTitle] [nvarchar](200) NULL,
	[MainContent] [nvarchar](max) NULL,
	[CompileMan] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
	[IsRelease] [bit] NULL,
	[ReleaseDate] [datetime] NULL,
	[States] [char](1) NULL,
	[AccessProjectId] [nvarchar](4000) NULL,
	[AccessProjectText] [nvarchar](4000) NULL,
 CONSTRAINT [PK_InformationProject_Notice] PRIMARY KEY CLUSTERED 
(
	[NoticeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[InformationProject_Notice]  WITH CHECK ADD  CONSTRAINT [FK_InformationProject_Notice_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[InformationProject_Notice] CHECK CONSTRAINT [FK_InformationProject_Notice_Base_Project]
GO

ALTER TABLE [dbo].[InformationProject_Notice]  WITH CHECK ADD  CONSTRAINT [FK_InformationProject_Notice_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[InformationProject_Notice] CHECK CONSTRAINT [FK_InformationProject_Notice_Sys_User]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_Notice', @level2type=N'COLUMN',@level2name=N'NoticeId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'通知编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_Notice', @level2type=N'COLUMN',@level2name=N'NoticeCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_Notice', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'通知标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_Notice', @level2type=N'COLUMN',@level2name=N'NoticeTitle'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主要内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_Notice', @level2type=N'COLUMN',@level2name=N'MainContent'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'整理人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_Notice', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'整理日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_Notice', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否发布（Ture-发布，False-不发布）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_Notice', @level2type=N'COLUMN',@level2name=N'IsRelease'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发布日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_Notice', @level2type=N'COLUMN',@level2name=N'ReleaseDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'办理状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_Notice', @level2type=N'COLUMN',@level2name=N'States'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'接收项目' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_Notice', @level2type=N'COLUMN',@level2name=N'AccessProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'接收项目名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_Notice', @level2type=N'COLUMN',@level2name=N'AccessProjectText'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HSSE管理通知表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_Notice'
GO


ALTER TABLE InformationProject_Picture ADD States CHAR(1) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_Picture', @level2type=N'COLUMN',@level2name=N'States'
GO

ALTER TABLE InformationProject_Picture ADD AttachUrl NVARCHAR(200) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'附件' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_Picture', @level2type=N'COLUMN',@level2name=N'AttachUrl'
GO
ALTER TABLE InformationProject_Picture ADD CompileMan NVARCHAR(50) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_Picture', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO
ALTER TABLE [dbo].[InformationProject_Picture]  WITH CHECK ADD  CONSTRAINT [FK_InformationProject_Picture_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[InformationProject_Picture] CHECK CONSTRAINT [FK_InformationProject_Picture_Sys_User]
GO

CREATE TABLE [dbo].[Manager_ManagerTotalMonth](
	[ManagerTotalMonthId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NOT NULL,
	[Title] [nvarchar](50) NULL,
	[MonthContent] [nvarchar](max) NULL,
	[CompileDate] [datetime] NULL,
	[CompileMan] [nvarchar](50) NULL,
	[States] [char](1) NULL,
	[AttachUrl] [nvarchar](200) NULL,
 CONSTRAINT [PK_Manager_ManagerTotalMonth] PRIMARY KEY CLUSTERED 
(
	[ManagerTotalMonthId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[Manager_ManagerTotalMonth]  WITH CHECK ADD  CONSTRAINT [FK_Manager_ManagerTotalMonth_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[Manager_ManagerTotalMonth] CHECK CONSTRAINT [FK_Manager_ManagerTotalMonth_Base_Project]
GO

ALTER TABLE [dbo].[Manager_ManagerTotalMonth]  WITH CHECK ADD  CONSTRAINT [FK_Manager_ManagerTotalMonth_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[Manager_ManagerTotalMonth] CHECK CONSTRAINT [FK_Manager_ManagerTotalMonth_Sys_User]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_ManagerTotalMonth', @level2type=N'COLUMN',@level2name=N'ManagerTotalMonthId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_ManagerTotalMonth', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_ManagerTotalMonth', @level2type=N'COLUMN',@level2name=N'Title'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_ManagerTotalMonth', @level2type=N'COLUMN',@level2name=N'MonthContent'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_ManagerTotalMonth', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_ManagerTotalMonth', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_ManagerTotalMonth', @level2type=N'COLUMN',@level2name=N'States'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'附件' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_ManagerTotalMonth', @level2type=N'COLUMN',@level2name=N'AttachUrl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HSSE月总结表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_ManagerTotalMonth'
GO






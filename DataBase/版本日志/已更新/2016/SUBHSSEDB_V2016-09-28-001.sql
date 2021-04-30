ALTER TABLE Sys_CodeTemplateRule ADD IsFileCabinetA BIT NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否加入文件柜A' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_CodeTemplateRule', @level2type=N'COLUMN',@level2name=N'IsFileCabinetA'
GO
ALTER TABLE Sys_CodeTemplateRule ADD IsFileCabinetB BIT NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否加入文件柜B' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_CodeTemplateRule', @level2type=N'COLUMN',@level2name=N'IsFileCabinetB'
GO

CREATE TABLE [dbo].[Sys_MenuFlowOperate](
	[FlowOperateId] [nvarchar](50) NOT NULL,
	[MenuId] [nvarchar](50) NULL,
	[FlowStep] [int] NULL,
	[AuditFlowName] [nvarchar](50) NULL,
	[RoleId] [nvarchar](500) NULL,
	[IsFlowEnd] [bit] NULL,
 CONSTRAINT [PK_Sys_MenuFlowOperate] PRIMARY KEY CLUSTERED 
(
	[FlowOperateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_MenuFlowOperate', @level2type=N'COLUMN',@level2name=N'MenuId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流程步骤' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_MenuFlowOperate', @level2type=N'COLUMN',@level2name=N'FlowStep'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流程名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_MenuFlowOperate', @level2type=N'COLUMN',@level2name=N'AuditFlowName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'办理角色' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_MenuFlowOperate', @level2type=N'COLUMN',@level2name=N'RoleId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否结束' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_MenuFlowOperate', @level2type=N'COLUMN',@level2name=N'IsFlowEnd'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单流程设置表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_MenuFlowOperate'
GO


UPDATE Sys_Role SET IsAuditFlow =1 
GO

CREATE TABLE [dbo].[Sys_FlowOperate](
	[FlowOperateId] [nvarchar](50) NOT NULL,
	[MenuId] [nvarchar](50) NULL,
	[DataId] [nvarchar](50) NULL,
	[SortIndex] [int] NULL,
	[AuditFlowName] [nvarchar](50) NULL,
	[OperaterId] [nvarchar](50) NULL,
	[OperaterTime] [datetime] NULL,
	[Opinion] [nvarchar](1000) NULL,
	[IsClosed] [bit] NULL,
	[State] [char](1) NULL,
 CONSTRAINT [PK_Sys_FlowOperate] PRIMARY KEY CLUSTERED 
(
	[FlowOperateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[Sys_FlowOperate]  WITH CHECK ADD  CONSTRAINT [FK_Sys_FlowOperate_Sys_User] FOREIGN KEY([OperaterId])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[Sys_FlowOperate] CHECK CONSTRAINT [FK_Sys_FlowOperate_Sys_User]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流程操作id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_FlowOperate', @level2type=N'COLUMN',@level2name=N'FlowOperateId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_FlowOperate', @level2type=N'COLUMN',@level2name=N'MenuId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数据记录id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_FlowOperate', @level2type=N'COLUMN',@level2name=N'DataId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'步骤序号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_FlowOperate', @level2type=N'COLUMN',@level2name=N'SortIndex'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'步骤名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_FlowOperate', @level2type=N'COLUMN',@level2name=N'AuditFlowName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_FlowOperate', @level2type=N'COLUMN',@level2name=N'OperaterId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_FlowOperate', @level2type=N'COLUMN',@level2name=N'OperaterTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'意见' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_FlowOperate', @level2type=N'COLUMN',@level2name=N'Opinion'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流程是否关闭' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_FlowOperate', @level2type=N'COLUMN',@level2name=N'IsClosed'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单据状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_FlowOperate', @level2type=N'COLUMN',@level2name=N'State'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单据流程审核操作表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_FlowOperate'
GO



CREATE TABLE [dbo].[Check_CheckInfo_Table5Item](
	[ID] [nvarchar](50) NOT NULL,
	[SortIndex] [int] NULL,
	[WorkType] [nvarchar](50) NULL,
	[DangerPoint] [nvarchar](800) NULL,
	[RiskExists] [nvarchar](800) NULL,
	[IsProject] [bit] NULL,
	[CheckMan] [nvarchar](50) NULL,
	[SubjectUnitMan] [nvarchar](50) NULL,
 CONSTRAINT [PK_Check_CheckInfo_Table5Item] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'序号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckInfo_Table5Item', @level2type=N'COLUMN',@level2name=N'SortIndex'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作业类别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckInfo_Table5Item', @level2type=N'COLUMN',@level2name=N'WorkType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'隐患源点' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckInfo_Table5Item', @level2type=N'COLUMN',@level2name=N'DangerPoint'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'存在风险' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckInfo_Table5Item', @level2type=N'COLUMN',@level2name=N'RiskExists'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否立项' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckInfo_Table5Item', @level2type=N'COLUMN',@level2name=N'IsProject'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'检查人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckInfo_Table5Item', @level2type=N'COLUMN',@level2name=N'CheckMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'受检单位确认人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckInfo_Table5Item', @level2type=N'COLUMN',@level2name=N'SubjectUnitMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'隐患等级明细表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckInfo_Table5Item'
GO


CREATE TABLE [dbo].[Check_CheckRectify](
	[CheckRectifyId] [nvarchar](50) NOT NULL,
	[CheckRectifyCode] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](500) NULL,
	[UnitId] [nvarchar](50) NULL,
	[CheckDate] [datetime] NULL,
	[IssueMan] [nvarchar](50) NULL,
	[IssueDate] [datetime] NULL,
	[HandleState] [char](1) NULL,
 CONSTRAINT [PK_Check_CheckRectify] PRIMARY KEY CLUSTERED 
(
	[CheckRectifyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[Check_CheckRectify]  WITH CHECK ADD  CONSTRAINT [FK_Check_CheckRectify_Base_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[Check_CheckRectify] CHECK CONSTRAINT [FK_Check_CheckRectify_Base_Unit]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckRectify', @level2type=N'COLUMN',@level2name=N'CheckRectifyId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckRectify', @level2type=N'COLUMN',@level2name=N'CheckRectifyCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'检查项目' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckRectify', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'检查单位' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckRectify', @level2type=N'COLUMN',@level2name=N'UnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'受检时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckRectify', @level2type=N'COLUMN',@level2name=N'CheckDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'签发人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckRectify', @level2type=N'COLUMN',@level2name=N'IssueMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'签发时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckRectify', @level2type=N'COLUMN',@level2name=N'IssueDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'安全监督检查整改表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckRectify'
GO




CREATE TABLE [dbo].[Check_CheckRectifyItem](
	[CheckRectifyItemId] [nvarchar](50) NOT NULL,
	[CheckRectifyId] [nvarchar](50) NULL,
	[Table5ItemId] [nvarchar](50) NULL,
	[ConfirmMan] [nvarchar](50) NULL,
	[ConfirmDate] [datetime] NULL,
	[OrderEndDate] [datetime] NULL,
	[OrderEndPerson] [nvarchar](50) NULL,
	[RealEndDate] [datetime] NULL,
 CONSTRAINT [PK_Check_CheckRectifyItem] PRIMARY KEY CLUSTERED 
(
	[CheckRectifyItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Check_CheckRectifyItem]  WITH CHECK ADD  CONSTRAINT [FK_Check_CheckRectifyItem_Check_CheckInfo_Table5Item] FOREIGN KEY([Table5ItemId])
REFERENCES [dbo].[Check_CheckInfo_Table5Item] ([ID])
GO

ALTER TABLE [dbo].[Check_CheckRectifyItem] CHECK CONSTRAINT [FK_Check_CheckRectifyItem_Check_CheckInfo_Table5Item]
GO

ALTER TABLE [dbo].[Check_CheckRectifyItem]  WITH CHECK ADD  CONSTRAINT [FK_Check_CheckRectifyItem_Check_CheckRectify] FOREIGN KEY([CheckRectifyId])
REFERENCES [dbo].[Check_CheckRectify] ([CheckRectifyId])
GO

ALTER TABLE [dbo].[Check_CheckRectifyItem] CHECK CONSTRAINT [FK_Check_CheckRectifyItem_Check_CheckRectify]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckRectifyItem', @level2type=N'COLUMN',@level2name=N'CheckRectifyItemId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主表外键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckRectifyItem', @level2type=N'COLUMN',@level2name=N'CheckRectifyId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'安全隐患外键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckRectifyItem', @level2type=N'COLUMN',@level2name=N'Table5ItemId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'立项人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckRectifyItem', @level2type=N'COLUMN',@level2name=N'ConfirmMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'立项时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckRectifyItem', @level2type=N'COLUMN',@level2name=N'ConfirmDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'要求消项时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckRectifyItem', @level2type=N'COLUMN',@level2name=N'OrderEndDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'消项责任人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckRectifyItem', @level2type=N'COLUMN',@level2name=N'OrderEndPerson'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'实际消项时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckRectifyItem', @level2type=N'COLUMN',@level2name=N'RealEndDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'检查整改明细表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckRectifyItem'
GO



CREATE VIEW [dbo].[View_CheckRectifyListFromSUB]
AS
/*子公司隐患整改单集团视图*/ 
SELECT CheckRectifyItem.CheckRectifyItemId
		,CheckRectifyItem.CheckRectifyId
		,CheckRectifyItem.Table5ItemId
		,CheckRectifyItem.ConfirmMan
		,CheckRectifyItem.ConfirmDate
		,CheckRectifyItem.OrderEndDate
		,CheckRectifyItem.OrderEndPerson
		,CheckRectifyItem.RealEndDate
		,CheckRectify.CheckRectifyCode
		,CheckRectify.ProjectId
		,CheckRectify.UnitId
		,CheckRectify.CheckDate
		,CheckRectify.IssueMan
		,CheckRectify.IssueDate
		,CheckRectify.HandleState
		,Table5Item.SortIndex
		,Table5Item.WorkType
		,Table5Item.DangerPoint
		,Table5Item.RiskExists
		,Table5Item.IsProject
		,Table5Item.CheckMan
		,Table5Item.SubjectUnitMan
		,AttachFile.AttachFileId
		,AttachFile.ToKeyId
		,AttachFile.AttachSource
		,AttachFile.AttachUrl
FROM dbo.Check_CheckRectifyItem AS CheckRectifyItem
LEFT JOIN dbo.Check_CheckRectify AS CheckRectify ON CheckRectifyItem.CheckRectifyid=CheckRectify.CheckRectifyId
LEFT JOIN dbo.Check_CheckInfo_Table5Item as Table5Item on CheckRectifyItem.Table5ItemId=Table5Item.ID
LEFT JOIN dbo.AttachFile  as AttachFile on AttachFile.ToKeyId =Table5Item.ID
GO

INSERT INTO dbo.Sys_Menu(MenuId, MenuName, Url, SortIndex, SuperMenu)
VALUES('4A87774E-FEA5-479A-97A3-9BBA09E4862E','集团检查整改','Check/CheckRectify.aspx',30,'A24B7926-EF69-456E-8A24-936D30384680')
GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('9F683E31-9E50-49AE-9782-EBD0CB82DDD8','4A87774E-FEA5-479A-97A3-9BBA09E4862E','修改',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('A0FACD5D-87F5-4D52-83D4-3B641D5E58E9','4A87774E-FEA5-479A-97A3-9BBA09E4862E','保存',2)
GO



ALTER TABLE HSSESystem_HSSEOrganize ADD SeeFile NVARCHAR(4000) NULL 
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件查看' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSESystem_HSSEOrganize', @level2type=N'COLUMN',@level2name=N'SeeFile'
GO
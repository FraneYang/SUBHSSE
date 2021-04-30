INSERT INTO dbo.Sys_Menu(MenuId, MenuName, Url, SortIndex, SuperMenu)
VALUES('091D7D24-E706-465A-95FD-8EF359CB8667','集团检查报告','Check/CheckInfoReport.aspx',35,'A24B7926-EF69-456E-8A24-936D30384680')
GO
ALTER TABLE Sys_Log ALTER COLUMN OperationLog NVARCHAR(4000)
GO
CREATE TABLE [dbo].[Check_CheckInfo](
	[CheckInfoId] [nvarchar](50) NOT NULL,
	[CheckTypeName] [nvarchar](50) NOT NULL,
	[SubjectUnitId] [nvarchar](50) NOT NULL,
	[SubjectUnitAdd] [nvarchar](500) NULL,
	[SubjectUnitMan] [nvarchar](50) NULL,
	[SubjectUnitTel] [nvarchar](50) NULL,
	[CheckStartTime] [datetime]  NULL,
	[CheckEndTime] [datetime]  NULL,
	[SubjectObject] [nvarchar](500) NULL,
 CONSTRAINT [PK_Check_CheckInfo] PRIMARY KEY CLUSTERED 
(
	[CheckInfoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Check_CheckInfo]  WITH CHECK ADD  CONSTRAINT [FK_Check_CheckInfo_Base_Unit] FOREIGN KEY([SubjectUnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[Check_CheckInfo] CHECK CONSTRAINT [FK_Check_CheckInfo_Base_Unit]
GO


EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'检查方式' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckInfo', @level2type=N'COLUMN',@level2name=N'CheckTypeName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'受检单位' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckInfo', @level2type=N'COLUMN',@level2name=N'SubjectUnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'受检单位地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckInfo', @level2type=N'COLUMN',@level2name=N'SubjectUnitAdd'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'受检单位负责人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckInfo', @level2type=N'COLUMN',@level2name=N'SubjectUnitMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'受检单位电话' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckInfo', @level2type=N'COLUMN',@level2name=N'SubjectUnitTel'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'检查开始时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckInfo', @level2type=N'COLUMN',@level2name=N'CheckStartTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'检查结束时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckInfo', @level2type=N'COLUMN',@level2name=N'CheckEndTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'检查对象' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckInfo', @level2type=N'COLUMN',@level2name=N'SubjectObject'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'监督检查主表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckInfo'
GO


CREATE TABLE [dbo].[Check_CheckInfo_Table8](
	[CheckItemId] [nvarchar](50) NOT NULL,
	[CheckInfoId] [nvarchar](50) NULL,
	[Values1] [nvarchar](4000) NULL,
	[Values2] [nvarchar](4000) NULL,
	[Values3] [nvarchar](4000) NULL,
	[Values4] [nvarchar](4000) NULL,
	[Values5] [nvarchar](4000) NULL,
	[Values6] [nvarchar](4000) NULL,
	[Values7] [nvarchar](4000) NULL,
	[Values8] [nvarchar](4000) NULL,
 CONSTRAINT [PK_Check_CheckInfo_Table8] PRIMARY KEY CLUSTERED 
(
	[CheckItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Check_CheckInfo_Table8]  WITH CHECK ADD  CONSTRAINT [FK_Check_CheckInfo_Table8_Check_CheckInfo] FOREIGN KEY([CheckInfoId])
REFERENCES [dbo].[Check_CheckInfo] ([CheckInfoId])
GO

ALTER TABLE [dbo].[Check_CheckInfo_Table8] CHECK CONSTRAINT [FK_Check_CheckInfo_Table8_Check_CheckInfo]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'子公司检查报告Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckInfo_Table8', @level2type=N'COLUMN',@level2name=N'CheckItemId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'监督检查id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckInfo_Table8', @level2type=N'COLUMN',@level2name=N'CheckInfoId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'评价目的' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckInfo_Table8', @level2type=N'COLUMN',@level2name=N'Values1'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'依据' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckInfo_Table8', @level2type=N'COLUMN',@level2name=N'Values2'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'被评价单位（项目）概况' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckInfo_Table8', @level2type=N'COLUMN',@level2name=N'Values3'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'符合项' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckInfo_Table8', @level2type=N'COLUMN',@level2name=N'Values4'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'不符合项' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckInfo_Table8', @level2type=N'COLUMN',@level2name=N'Values5'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'观察项' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckInfo_Table8', @level2type=N'COLUMN',@level2name=N'Values6'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'改进建议' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckInfo_Table8', @level2type=N'COLUMN',@level2name=N'Values7'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'评价结论' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckInfo_Table8', @level2type=N'COLUMN',@level2name=N'Values8'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'检查明细表-安全监督检查报告' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckInfo_Table8'
GO


CREATE TABLE [dbo].[Check_CheckInfo_Table8Item](
	[ID] [nvarchar](50) NOT NULL,
	[CheckInfoId] [nvarchar](50) NULL,
	[Name] [nvarchar](50) NULL,
	[Sex] [nvarchar](50) NULL,
	[UnitName] [nvarchar](500) NULL,
	[PostName] [nvarchar](200) NULL,
	[WorkTitle] [nvarchar](200) NULL,
	[CheckPostName] [nvarchar](200) NULL,
	[CheckDate] [datetime] NULL,	
	[SortIndex] [nvarchar](50) NULL,
 CONSTRAINT [PK_Check_CheckInfo_Table8Item] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Check_CheckInfo_Table8Item]  WITH CHECK ADD  CONSTRAINT [FK_Check_CheckInfo_Table8Item_Check_CheckInfo] FOREIGN KEY([CheckInfoId])
REFERENCES [dbo].[Check_CheckInfo] ([CheckInfoId])
GO

ALTER TABLE [dbo].[Check_CheckInfo_Table8Item] CHECK CONSTRAINT [FK_Check_CheckInfo_Table8Item_Check_CheckInfo]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'性别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckInfo_Table8Item', @level2type=N'COLUMN',@level2name=N'Sex'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单位名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckInfo_Table8Item', @level2type=N'COLUMN',@level2name=N'UnitName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'职务' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckInfo_Table8Item', @level2type=N'COLUMN',@level2name=N'PostName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'评价小组职务' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckInfo_Table8Item', @level2type=N'COLUMN',@level2name=N'CheckPostName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'评价日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckInfo_Table8Item', @level2type=N'COLUMN',@level2name=N'CheckDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'监督检查主表id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckInfo_Table8Item', @level2type=N'COLUMN',@level2name=N'CheckInfoId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'序号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckInfo_Table8Item', @level2type=N'COLUMN',@level2name=N'SortIndex'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'检查工作组成员表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckInfo_Table8Item'
GO

ALTER TABLE Check_CheckRectifyItem ADD Verification NVARCHAR(50) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'企业安全管理部门验证人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckRectifyItem', @level2type=N'COLUMN',@level2name=N'Verification'
GO

ALTER VIEW [dbo].[View_CheckRectifyListFromSUB]
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
		,CheckRectifyItem.Verification
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
		,AttachFile2.AttachFileId AS AttachFileId2
		,AttachFile2.ToKeyId AS ToKeyId2
		,AttachFile2.AttachSource AS AttachSource2
		,AttachFile2.AttachUrl AS AttachUrl2
FROM dbo.Check_CheckRectifyItem AS CheckRectifyItem
LEFT JOIN dbo.Check_CheckRectify AS CheckRectify ON CheckRectifyItem.CheckRectifyid=CheckRectify.CheckRectifyId
LEFT JOIN dbo.Check_CheckInfo_Table5Item as Table5Item on CheckRectifyItem.Table5ItemId=Table5Item.ID
LEFT JOIN dbo.AttachFile  AS AttachFile on AttachFile.ToKeyId =Table5Item.ID
LEFT JOIN dbo.AttachFile  AS AttachFile2 on AttachFile2.ToKeyId =CheckRectifyItem.CheckRectifyItemId
GO


IF EXISTS(SELECT 1 FROM sys.views WHERE name='View_Supervise_SubUnitReportItem')
 DROP VIEW View_Supervise_SubUnitReportItem
 GO

CREATE VIEW [dbo].[View_Supervise_SubUnitReportItem]
AS
/*子公司安全上报*/
SELECT Item.SubUnitReportItemId, 
	Item.SubUnitReportId, 
	Item.UnitId, 
	Item.PlanReortDate, 
	Item.ReportTitle, 
	Item.ReportContent, 
	Item.AttachUrl, 
	Item.ReportDate, 
	Item.State, 
	Item.UpState,
	SUBSTRING(Item.AttachUrl,CHARINDEX('~',Item.AttachUrl)+1,LEN(Item.AttachUrl)) AS  AttachUrlName,
	U.UnitName,
	(CASE WHEN Item.UpState='1' THEN '本单位' WHEN Item.UpState='2' THEN '待上报' when Item.UpState='3' then '已上报' when Item.UpState='4' then '上报失败' end) as UpStates,
	ConstUpState.ConstText AS UpStateName
FROM [dbo].[Supervise_SubUnitReportItem] AS Item
LEFT JOIN Base_Unit AS U ON U.UnitId=Item.UnitId
LEFT JOIN Sys_Const AS ConstUpState ON Item.UpState=ConstUpState.ConstValue and ConstUpState.GroupId='UpState'
GO
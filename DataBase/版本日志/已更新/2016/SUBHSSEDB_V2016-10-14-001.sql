ALTER TABLE dbo.Meeting_ClassMeeting ADD States CHAR(1)
GO
ALTER TABLE dbo.Administrative_HealthManage	ADD States CHAR(1)  
GO
ALTER TABLE dbo.Administrative_HealthManage	ADD CompileMan NVARCHAR(50)	 
GO
ALTER TABLE dbo.Administrative_HealthManage	ADD CompileDate DATETIME
GO
ALTER TABLE dbo.License_EquipmentSafetyList	ADD States CHAR(1)	
GO 
ALTER TABLE dbo.License_HSETechnical	ADD States CHAR(1)
GO
ALTER TABLE [dbo].[Administrative_HealthManage]  WITH CHECK ADD  CONSTRAINT [FK_Administrative_HealthManage_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[Administrative_HealthManage] CHECK CONSTRAINT [FK_Administrative_HealthManage_Sys_User]
GO

CREATE TABLE [dbo].[Base_GoodsDef](
	[GoodsDefId] [nvarchar](50) NOT NULL,
	[GoodsDefCode] [nvarchar](50) NOT NULL,
	[GoodsDefName] [nvarchar](50) NOT NULL,
	[Remark] [nvarchar](500) NULL,
 CONSTRAINT [PK_Base_GoodsDef] PRIMARY KEY CLUSTERED 
(
	[GoodsDefId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_GoodsDef', @level2type=N'COLUMN',@level2name=N'GoodsDefId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_GoodsDef', @level2type=N'COLUMN',@level2name=N'GoodsDefCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_GoodsDef', @level2type=N'COLUMN',@level2name=N'GoodsDefName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'说明' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_GoodsDef', @level2type=N'COLUMN',@level2name=N'Remark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'物资类别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_GoodsDef'
GO





CREATE TABLE [dbo].[CostGoods_Expense](
	[ExpenseId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NOT NULL,
	[ExpenseCode] [nvarchar](50) NOT NULL,
	[UnitId] [nvarchar](50) NULL,
	[CompileMan] [nvarchar](50) NULL,
	[CreateDate] [date] NULL,
	[States] [char](1) NULL,
 CONSTRAINT [PK_CostGoods_ExpenseId] PRIMARY KEY CLUSTERED 
(
	[ExpenseId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_Expense', @level2type=N'COLUMN',@level2name=N'ExpenseId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_Expense', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_Expense', @level2type=N'COLUMN',@level2name=N'ExpenseCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单位' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_Expense', @level2type=N'COLUMN',@level2name=N'UnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_Expense', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_Expense', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'措施费用使用计划' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_Expense'
GO

ALTER TABLE [dbo].[CostGoods_Expense]  WITH CHECK ADD  CONSTRAINT [FK_CostGoods_Expense_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[CostGoods_Expense] CHECK CONSTRAINT [FK_CostGoods_Expense_Base_Project]
GO

ALTER TABLE [dbo].[CostGoods_Expense]  WITH CHECK ADD  CONSTRAINT [FK_CostGoods_ExpenseId_Base_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[CostGoods_Expense] CHECK CONSTRAINT [FK_CostGoods_ExpenseId_Base_Unit]
GO

ALTER TABLE [dbo].[CostGoods_Expense]  WITH CHECK ADD  CONSTRAINT [FK_CostGoods_ExpenseId_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[CostGoods_Expense] CHECK CONSTRAINT [FK_CostGoods_ExpenseId_Sys_User]
GO




CREATE TABLE [dbo].[CostGoods_GoodsManage](
	[GoodsManageId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[GoodsCode] [nvarchar](50) NULL,
	[GoodsName] [nvarchar](30) NOT NULL,
	[UnitId] [nvarchar](50) NULL,
	[GoodsType] [char](1) NOT NULL,
	[SizeModel] [nvarchar](30) NULL,
	[FactoryCode] [nvarchar](30) NULL,
	[CheckDate] [datetime] NULL,
	[EnableYear] [int] NOT NULL,
	[CheckPerson] [nvarchar](50) NULL,
	[InTime] [datetime] NULL,
	[States] [char](1) NULL,
	[CompileMan] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
	[Remark] [nvarchar](150) NULL,
 CONSTRAINT [PK_CostGoods_GoodsManage] PRIMARY KEY CLUSTERED 
(
	[GoodsManageId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HSSE物资管理主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_GoodsManage', @level2type=N'COLUMN',@level2name=N'GoodsManageId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'所属项目' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_GoodsManage', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'物资编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_GoodsManage', @level2type=N'COLUMN',@level2name=N'GoodsCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HSSE物资名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_GoodsManage', @level2type=N'COLUMN',@level2name=N'GoodsName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'所属单位' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_GoodsManage', @level2type=N'COLUMN',@level2name=N'UnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'物资类别（1-检测仪器，2-应急物资，3-PPE）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_GoodsManage', @level2type=N'COLUMN',@level2name=N'GoodsType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'规格型号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_GoodsManage', @level2type=N'COLUMN',@level2name=N'SizeModel'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'出厂编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_GoodsManage', @level2type=N'COLUMN',@level2name=N'FactoryCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报验日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_GoodsManage', @level2type=N'COLUMN',@level2name=N'CheckDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'有效年限' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_GoodsManage', @level2type=N'COLUMN',@level2name=N'EnableYear'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'检查/审批人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_GoodsManage', @level2type=N'COLUMN',@level2name=N'CheckPerson'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'入场时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_GoodsManage', @level2type=N'COLUMN',@level2name=N'InTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_GoodsManage', @level2type=N'COLUMN',@level2name=N'States'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_GoodsManage', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_GoodsManage', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_GoodsManage', @level2type=N'COLUMN',@level2name=N'Remark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HSSE物资管理表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_GoodsManage'
GO

ALTER TABLE [dbo].[CostGoods_GoodsManage]  WITH CHECK ADD  CONSTRAINT [FK_CostGoods_GoodsManage_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[CostGoods_GoodsManage] CHECK CONSTRAINT [FK_CostGoods_GoodsManage_Base_Project]
GO

ALTER TABLE [dbo].[CostGoods_GoodsManage]  WITH CHECK ADD  CONSTRAINT [FK_CostGoods_GoodsManage_Base_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[CostGoods_GoodsManage] CHECK CONSTRAINT [FK_CostGoods_GoodsManage_Base_Unit]
GO

ALTER TABLE [dbo].[CostGoods_GoodsManage]  WITH CHECK ADD  CONSTRAINT [FK_CostGoods_GoodsManage_Sys_User] FOREIGN KEY([CheckPerson])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[CostGoods_GoodsManage] CHECK CONSTRAINT [FK_CostGoods_GoodsManage_Sys_User]
GO

ALTER TABLE [dbo].[CostGoods_GoodsManage]  WITH CHECK ADD  CONSTRAINT [FK_CostGoods_GoodsManage_Sys_User1] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[CostGoods_GoodsManage] CHECK CONSTRAINT [FK_CostGoods_GoodsManage_Sys_User1]
GO




CREATE TABLE [dbo].[CostGoods_CostManage](
	[CostManageId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NOT NULL,
	[CostManageCode] [nvarchar](50) NOT NULL,
	[CostManageName] [nvarchar](50) NULL,
	[UnitId] [nvarchar](50) NULL,
	[ContractNum] [nvarchar](50) NULL,
	[CostManageDate] [datetime] NULL,
	[Opinion] [nvarchar](500) NULL,
	[SubHSE] [nvarchar](50) NULL,
	[SubCN] [nvarchar](50) NULL,
	[SubProject] [nvarchar](50) NULL,
	[States] [char](1) NULL,
	[CompileMan] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
 CONSTRAINT [PK_CostGoods_CostManage] PRIMARY KEY CLUSTERED 
(
	[CostManageId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_CostManage', @level2type=N'COLUMN',@level2name=N'CostManageId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_CostManage', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_CostManage', @level2type=N'COLUMN',@level2name=N'CostManageCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_CostManage', @level2type=N'COLUMN',@level2name=N'CostManageName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'合同号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_CostManage', @level2type=N'COLUMN',@level2name=N'ContractNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_CostManage', @level2type=N'COLUMN',@level2name=N'CostManageDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分包商负责人意见' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_CostManage', @level2type=N'COLUMN',@level2name=N'Opinion'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分包商HSE经理 ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_CostManage', @level2type=N'COLUMN',@level2name=N'SubHSE'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分包商施工经理' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_CostManage', @level2type=N'COLUMN',@level2name=N'SubCN'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分包商项目经理' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_CostManage', @level2type=N'COLUMN',@level2name=N'SubProject'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_CostManage', @level2type=N'COLUMN',@level2name=N'States'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_CostManage', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_CostManage', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'费用管理表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_CostManage'
GO

ALTER TABLE [dbo].[CostGoods_CostManage]  WITH CHECK ADD  CONSTRAINT [FK_CostGoods_CostManage_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[CostGoods_CostManage] CHECK CONSTRAINT [FK_CostGoods_CostManage_Base_Project]
GO

ALTER TABLE [dbo].[CostGoods_CostManage]  WITH CHECK ADD  CONSTRAINT [FK_CostGoods_CostManage_Base_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[CostGoods_CostManage] CHECK CONSTRAINT [FK_CostGoods_CostManage_Base_Unit]
GO

ALTER TABLE [dbo].[CostGoods_CostManage]  WITH CHECK ADD  CONSTRAINT [FK_CostGoods_CostManage_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[CostGoods_CostManage] CHECK CONSTRAINT [FK_CostGoods_CostManage_Sys_User]
GO




CREATE TABLE [dbo].[CostGoods_CostManageItem](
	[CostManageItemId] [nvarchar](50) NOT NULL,
	[CostManageId] [nvarchar](50) NOT NULL,
	[InvestCostProject] [nvarchar](50) NULL,
	[UseReason] [nvarchar](50) NULL,
	[Counts] [int] NULL,
	[PriceMoney] [decimal](18, 2) NULL,
	[Remark] [nvarchar](150) NULL,
 CONSTRAINT [PK_CostGoods_CostManageItem] PRIMARY KEY CLUSTERED 
(
	[CostManageItemId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_CostManageItem', @level2type=N'COLUMN',@level2name=N'CostManageItemId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'费用管理ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_CostManageItem', @level2type=N'COLUMN',@level2name=N'CostManageId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'投入费用项目' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_CostManageItem', @level2type=N'COLUMN',@level2name=N'InvestCostProject'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'费用使用原因' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_CostManageItem', @level2type=N'COLUMN',@level2name=N'UseReason'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_CostManageItem', @level2type=N'COLUMN',@level2name=N'Counts'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单价（元）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_CostManageItem', @level2type=N'COLUMN',@level2name=N'PriceMoney'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_CostManageItem', @level2type=N'COLUMN',@level2name=N'Remark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'费用管理明细表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_CostManageItem'
GO

ALTER TABLE [dbo].[CostGoods_CostManageItem]  WITH CHECK ADD  CONSTRAINT [FK_CostGoods_CostManageItem_CostGoods_CostManage] FOREIGN KEY([CostManageId])
REFERENCES [dbo].[CostGoods_CostManage] ([CostManageId])
GO

ALTER TABLE [dbo].[CostGoods_CostManageItem] CHECK CONSTRAINT [FK_CostGoods_CostManageItem_CostGoods_CostManage]
GO




CREATE TABLE [dbo].[CostGoods_CostSmallDetail](
	[CostSmallDetailId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NOT NULL,
	[CostSmallDetailCode] [nvarchar](50) NOT NULL,
	[UnitId] [nvarchar](50) NULL,
	[States] [char](1) NULL,
	[CompileMan] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
 CONSTRAINT [PK_CostGoods_CostSmallDetail] PRIMARY KEY CLUSTERED 
(
	[CostSmallDetailId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_CostSmallDetail', @level2type=N'COLUMN',@level2name=N'CostSmallDetailId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_CostSmallDetail', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_CostSmallDetail', @level2type=N'COLUMN',@level2name=N'CostSmallDetailCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单位' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_CostSmallDetail', @level2type=N'COLUMN',@level2name=N'UnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_CostSmallDetail', @level2type=N'COLUMN',@level2name=N'States'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_CostSmallDetail', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_CostSmallDetail', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'安全费用投入登记' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_CostSmallDetail'
GO

ALTER TABLE [dbo].[CostGoods_CostSmallDetail]  WITH CHECK ADD  CONSTRAINT [FK_CostGoods_CostSmallDetail_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[CostGoods_CostSmallDetail] CHECK CONSTRAINT [FK_CostGoods_CostSmallDetail_Base_Project]
GO

ALTER TABLE [dbo].[CostGoods_CostSmallDetail]  WITH CHECK ADD  CONSTRAINT [FK_CostGoods_CostSmallDetail_Base_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[CostGoods_CostSmallDetail] CHECK CONSTRAINT [FK_CostGoods_CostSmallDetail_Base_Unit]
GO

ALTER TABLE [dbo].[CostGoods_CostSmallDetail]  WITH CHECK ADD  CONSTRAINT [FK_CostGoods_CostSmallDetail_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[CostGoods_CostSmallDetail] CHECK CONSTRAINT [FK_CostGoods_CostSmallDetail_Sys_User]
GO




CREATE TABLE [dbo].[CostGoods_CostSmallDetailItem](
	[CostSmallDetailItemId] [nvarchar](50) NOT NULL,
	[CostSmallDetailId] [nvarchar](50) NOT NULL,
	[CostType] [nvarchar](50) NULL,
	[ProjectName] [nvarchar](50) NULL,
	[CostDetail] [nvarchar](200) NULL,
	[Accumulative] [decimal](18, 2) NULL,
 CONSTRAINT [PK_CostGoods_CostSmallDetailItem] PRIMARY KEY CLUSTERED 
(
	[CostSmallDetailItemId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_CostSmallDetailItem', @level2type=N'COLUMN',@level2name=N'CostSmallDetailItemId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'安全费用投入登记ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_CostSmallDetailItem', @level2type=N'COLUMN',@level2name=N'CostSmallDetailId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_CostSmallDetailItem', @level2type=N'COLUMN',@level2name=N'CostType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_CostSmallDetailItem', @level2type=N'COLUMN',@level2name=N'ProjectName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'费用明细' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_CostSmallDetailItem', @level2type=N'COLUMN',@level2name=N'CostDetail'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'当月累计' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_CostSmallDetailItem', @level2type=N'COLUMN',@level2name=N'Accumulative'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'安全费用投入登记明细表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_CostSmallDetailItem'
GO

ALTER TABLE [dbo].[CostGoods_CostSmallDetailItem]  WITH CHECK ADD  CONSTRAINT [FK_CostGoods_CostSmallDetailItem_CostGoods_CostSmallDetail] FOREIGN KEY([CostSmallDetailId])
REFERENCES [dbo].[CostGoods_CostSmallDetail] ([CostSmallDetailId])
GO

ALTER TABLE [dbo].[CostGoods_CostSmallDetailItem] CHECK CONSTRAINT [FK_CostGoods_CostSmallDetailItem_CostGoods_CostSmallDetail]
GO




CREATE TABLE [dbo].[CostGoods_GoodsIn](
	[GoodsInId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NOT NULL,
	[GoodsInCode] [nvarchar](50) NOT NULL,
	[GoodsDefId] [nvarchar](50) NULL,
	[GoodsNum] [int] NULL,
	[InPerson] [nvarchar](50) NULL,
	[InDate] [datetime] NULL,
	[States] [char](1) NULL,
	[CompileMan] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
 CONSTRAINT [PK_CostGoods_GoodsIn] PRIMARY KEY CLUSTERED 
(
	[GoodsInId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_GoodsIn', @level2type=N'COLUMN',@level2name=N'GoodsInId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_GoodsIn', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'入库单号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_GoodsIn', @level2type=N'COLUMN',@level2name=N'GoodsInCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'物资类别外键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_GoodsIn', @level2type=N'COLUMN',@level2name=N'GoodsDefId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'入库数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_GoodsIn', @level2type=N'COLUMN',@level2name=N'GoodsNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'入库人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_GoodsIn', @level2type=N'COLUMN',@level2name=N'InPerson'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'入库日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_GoodsIn', @level2type=N'COLUMN',@level2name=N'InDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_GoodsIn', @level2type=N'COLUMN',@level2name=N'States'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_GoodsIn', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_GoodsIn', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'物资入库表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_GoodsIn'
GO

ALTER TABLE [dbo].[CostGoods_GoodsIn]  WITH CHECK ADD  CONSTRAINT [FK_CostGoods_GoodsIn_Base_GoodsDef] FOREIGN KEY([GoodsDefId])
REFERENCES [dbo].[Base_GoodsDef] ([GoodsDefId])
GO

ALTER TABLE [dbo].[CostGoods_GoodsIn] CHECK CONSTRAINT [FK_CostGoods_GoodsIn_Base_GoodsDef]
GO

ALTER TABLE [dbo].[CostGoods_GoodsIn]  WITH CHECK ADD  CONSTRAINT [FK_CostGoods_GoodsIn_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[CostGoods_GoodsIn] CHECK CONSTRAINT [FK_CostGoods_GoodsIn_Base_Project]
GO

ALTER TABLE [dbo].[CostGoods_GoodsIn]  WITH CHECK ADD  CONSTRAINT [FK_CostGoods_GoodsIn_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[CostGoods_GoodsIn] CHECK CONSTRAINT [FK_CostGoods_GoodsIn_Sys_User]
GO


CREATE TABLE [dbo].[CostGoods_GoodsOut](
	[GoodsOutId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NOT NULL,
	[GoodsOutCode] [nvarchar](50) NOT NULL,
	[GoodsDefId] [nvarchar](50) NULL,
	[GoodsNum] [int] NULL,
	[OutPerson] [nvarchar](50) NULL,
	[OutDate] [datetime] NULL,
	[States] [char](1) NULL,
	[CompileMan] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
 CONSTRAINT [PK_CostGoods_GoodsOut] PRIMARY KEY CLUSTERED 
(
	[GoodsOutId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_GoodsOut', @level2type=N'COLUMN',@level2name=N'GoodsOutId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_GoodsOut', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'出库单号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_GoodsOut', @level2type=N'COLUMN',@level2name=N'GoodsOutCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'物资ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_GoodsOut', @level2type=N'COLUMN',@level2name=N'GoodsDefId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_GoodsOut', @level2type=N'COLUMN',@level2name=N'GoodsNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'领用人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_GoodsOut', @level2type=N'COLUMN',@level2name=N'OutPerson'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'领用时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_GoodsOut', @level2type=N'COLUMN',@level2name=N'OutDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_GoodsOut', @level2type=N'COLUMN',@level2name=N'States'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_GoodsOut', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_GoodsOut', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'物资出库管理' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_GoodsOut'
GO

ALTER TABLE [dbo].[CostGoods_GoodsOut]  WITH CHECK ADD  CONSTRAINT [FK_CostGoods_GoodsOut_Base_GoodsDef] FOREIGN KEY([GoodsDefId])
REFERENCES [dbo].[Base_GoodsDef] ([GoodsDefId])
GO

ALTER TABLE [dbo].[CostGoods_GoodsOut] CHECK CONSTRAINT [FK_CostGoods_GoodsOut_Base_GoodsDef]
GO

ALTER TABLE [dbo].[CostGoods_GoodsOut]  WITH CHECK ADD  CONSTRAINT [FK_CostGoods_GoodsOut_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[CostGoods_GoodsOut] CHECK CONSTRAINT [FK_CostGoods_GoodsOut_Base_Project]
GO

ALTER TABLE [dbo].[CostGoods_GoodsOut]  WITH CHECK ADD  CONSTRAINT [FK_CostGoods_GoodsOut_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[CostGoods_GoodsOut] CHECK CONSTRAINT [FK_CostGoods_GoodsOut_Sys_User]
GO

alter table dbo.Technique_HazardListType add WorkStage nvarchar(500) null
GO
--常量表:危险源对应工作阶段
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('B840CF8F-ED62-4F2D-9140-0E552015A9D6','1','地基处理、打桩',1,'WorkStage')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('145E6655-B0F5-48D9-AFA0-7BF5D13ECE85','2','基础、钢筋混凝土结构',2,'WorkStage')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('C3BFD8C6-E951-4549-8FE5-AF06AD933688','3','建筑工程',3,'WorkStage')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('415F4593-53E1-4610-9964-7D9129D87425','4','地下管道',4,'WorkStage')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('4950110D-6ACE-4144-BFE4-3988FC1E1D1C','5','钢结构',5,'WorkStage')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('8105CFF5-5986-4361-B700-406C2536D9DA','6','设备、机械、管道安装',6,'WorkStage')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('9D927E44-CB2B-48EE-B07F-8EEC8A8F58C8','7','电气仪表安装',7,'WorkStage')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('E9305293-B2BB-4E03-87EF-0B8485AA50A7','8','防腐保温防火',8,'WorkStage')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('C5737F60-9B4D-41AE-964F-8566FBF85B09','9','吹扫、试车',9,'WorkStage')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('6D93F7B7-CE7C-4DFE-86E0-FFC7ADACA20E','10','检修作业',10,'WorkStage')
GO
--常量表:环境危险源类型
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('E8784339-4589-44BC-A7B1-56B6841A978C','01','噪声类',1,'EnvironmentalType')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('0E868857-C504-4695-88F1-9A3E26E2CEE5','02','扬尘类',2,'EnvironmentalType')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('BBE8A43F-7338-47F4-8E94-5C87FBC66DCA','03','污水排放类',3,'EnvironmentalType')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('26D4409C-D81B-4EA1-B91E-8E0FD2782CE6','04','资源能源类',4,'EnvironmentalType')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('17ED987F-2236-410B-8C80-45AACE417AB1','05','固废物类',5,'EnvironmentalType')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('0C5A1360-FBA9-4972-9382-41087BF7E117','06','遗洒类',6,'EnvironmentalType')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('EC40FEC8-96BA-4BC9-8EA7-69140CD289A2','07','泄漏类',7,'EnvironmentalType')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('1226FA6E-2D8E-4545-8E79-139872B88BDA','08','光污染类',8,'EnvironmentalType')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('D08B8589-95D5-4C12-8112-EEFF99897FFA','09','有毒有害气体',9,'EnvironmentalType')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('618BBBF5-9388-44F4-9B1E-7A30DB14B7D3','10','废气类',10,'EnvironmentalType')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('BDF50C6B-E16B-48B3-96BC-C615FCAC62E3','11','异味类',11,'EnvironmentalType')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('4AEF82F9-C227-4205-8484-8F940B4C75D6','12','突发事件',12,'EnvironmentalType')
GO
--常量表:环境危险源小类型
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('F820F010-FF7E-4DBE-ABDC-80FCC28136D4','1','资源能源类',1,'EnvironmentalSmallType')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('4D15B20D-975B-44FE-B2FB-97F557A38DB8','2','排放类',2,'EnvironmentalSmallType')
GO


--INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
--VALUES('773B59F9-61F9-4F5E-9D68-A1BF9322AFFA','环境因素危险源','Technique/Environmental.aspx','Page',5,'F3B157B7-9BEE-4150-80CB-087828F1C51D','Menu_Resource',1,0)
--GO
--INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
--VALUES('C66B4ADD-FE82-4464-BAEA-7BAFA573FA92','773B59F9-61F9-4F5E-9D68-A1BF9322AFFA','增加',1)
--INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
--VALUES('F764014A-1107-4536-BD64-CBA15DF49D65','773B59F9-61F9-4F5E-9D68-A1BF9322AFFA','修改',2)
--INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
--VALUES('F6E23A33-46F4-4822-B5F6-194810259B7B','773B59F9-61F9-4F5E-9D68-A1BF9322AFFA','删除',3)
--INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
--VALUES('E5E6A150-3C2D-4CA5-AA45-BE18B8476510','773B59F9-61F9-4F5E-9D68-A1BF9322AFFA','保存',4)
--GO

CREATE PROCEDURE [dbo].[SpGetVersionNumber]
 @tableName varchar(100),/*表名*/
 @columnName varchar(100),/*列名*/
 @projectId nvarchar(50),/*列名*/
 @returnVal nvarchar(10) output
/*获取版本号*/
AS
declare 
        @sql nvarchar(500),
        @old nvarchar(10),
        @newid varchar(10),
        @maxId nvarchar(10)/*已分配的最大值*/
select @sql=N'SELECT @maxId=MAX('+@columnName+') from '+@tableName+' where ProjectId='''+@projectId+''''
EXEC sp_executesql @sql, N'@maxId nvarchar(10) OUTPUT', @maxId OUTPUT 
set @old=@maxId

IF(@old is null)
BEGIN
set @newid='V'+'1.0'
END

ELSE
BEGIN
set @newid = (select max(right(@old,LEN(@old)-1)))+1.0
set @newid = CAST(@newid as varchar(9))
set @newid = 'V'+@newid
 
END

SET @returnVal=@newid

GO

CREATE TABLE [dbo].[Technique_Environmental](
	[EnvironmentalId] [nvarchar](50) NOT NULL,
	[EType] [nvarchar](10) NULL,
	[ActivePoint] [nvarchar](500) NULL,
	[EnvironmentalFactors] [nvarchar](500) NULL,
	[AValue] [int] NULL,
	[BValue] [int] NULL,
	[CValue] [int] NULL,
	[DValue] [int] NULL,
	[EValue] [int] NULL,
	[ZValue] [int] NULL,
	[SmallType] [char](1) NULL,
	[IsImportant] [bit] NULL,
	[Code] [nvarchar](10) NULL,
 CONSTRAINT [PK_Technique_Environmental] PRIMARY KEY CLUSTERED 
(
	[EnvironmentalId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'环境危险源设置' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Technique_Environmental', @level2type=N'COLUMN',@level2name=N'EnvironmentalId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'环境类型（1-噪声类...）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Technique_Environmental', @level2type=N'COLUMN',@level2name=N'EType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'活动点' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Technique_Environmental', @level2type=N'COLUMN',@level2name=N'ActivePoint'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'环境因素' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Technique_Environmental', @level2type=N'COLUMN',@level2name=N'EnvironmentalFactors'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Technique_Environmental', @level2type=N'COLUMN',@level2name=N'AValue'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'B值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Technique_Environmental', @level2type=N'COLUMN',@level2name=N'BValue'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'C值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Technique_Environmental', @level2type=N'COLUMN',@level2name=N'CValue'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'D值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Technique_Environmental', @level2type=N'COLUMN',@level2name=N'DValue'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'E值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Technique_Environmental', @level2type=N'COLUMN',@level2name=N'EValue'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Z值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Technique_Environmental', @level2type=N'COLUMN',@level2name=N'ZValue'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类型（1-资源能源类2-排放类）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Technique_Environmental', @level2type=N'COLUMN',@level2name=N'SmallType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否重要因素' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Technique_Environmental', @level2type=N'COLUMN',@level2name=N'IsImportant'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Technique_Environmental', @level2type=N'COLUMN',@level2name=N'Code'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'环境因素危险评价设置' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Technique_Environmental'
GO

CREATE TABLE [dbo].[Hazard_EnvironmentalRiskList](
	[EnvironmentalRiskListId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[RiskCode] [nvarchar](50) NULL,
	[CompileMan] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
	[AttachUrl] [nvarchar](500) NULL,
	[States] [char](1) NULL,
 CONSTRAINT [PK_Hazard_EnvironmentalRiskList] PRIMARY KEY CLUSTERED 
(
	[EnvironmentalRiskListId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'环境危险源辨识id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_EnvironmentalRiskList', @level2type=N'COLUMN',@level2name=N'EnvironmentalRiskListId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_EnvironmentalRiskList', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_EnvironmentalRiskList', @level2type=N'COLUMN',@level2name=N'RiskCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_EnvironmentalRiskList', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_EnvironmentalRiskList', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'附件路径' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_EnvironmentalRiskList', @level2type=N'COLUMN',@level2name=N'AttachUrl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'环境危险源辨识表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_EnvironmentalRiskList'
GO

ALTER TABLE [dbo].[Hazard_EnvironmentalRiskList]  WITH CHECK ADD  CONSTRAINT [FK_Hazard_EnvironmentalRiskList_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[Hazard_EnvironmentalRiskList] CHECK CONSTRAINT [FK_Hazard_EnvironmentalRiskList_Base_Project]
GO

CREATE TABLE [dbo].[Hazard_EnvironmentalRiskItem](
	[EnvironmentalRiskItemId] [nvarchar](50) NOT NULL,
	[EnvironmentalRiskListId] [nvarchar](50) NULL,
	[EType] [nvarchar](100) NULL,
	[ActivePoint] [nvarchar](500) NULL,
	[EnvironmentalFactors] [nvarchar](500) NULL,
	[AValue] [int] NULL,
	[BValue] [int] NULL,
	[CValue] [int] NULL,
	[DValue] [int] NULL,
	[EValue] [int] NULL,
	[ZValue] [int] NULL,
	[SmallType] [nvarchar](50) NULL,
	[IsImportant] [bit] NULL,
	[Code] [nvarchar](10) NULL,
 CONSTRAINT [PK_Hazard_EnvironmentalRiskItem] PRIMARY KEY CLUSTERED 
(
	[EnvironmentalRiskItemId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'环境危险源明细id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_EnvironmentalRiskItem', @level2type=N'COLUMN',@level2name=N'EnvironmentalRiskItemId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'环境危险源辨识id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_EnvironmentalRiskItem', @level2type=N'COLUMN',@level2name=N'EnvironmentalRiskListId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'危险源类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_EnvironmentalRiskItem', @level2type=N'COLUMN',@level2name=N'EType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'活动点' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_EnvironmentalRiskItem', @level2type=N'COLUMN',@level2name=N'ActivePoint'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'环境因素' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_EnvironmentalRiskItem', @level2type=N'COLUMN',@level2name=N'EnvironmentalFactors'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_EnvironmentalRiskItem', @level2type=N'COLUMN',@level2name=N'AValue'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'B值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_EnvironmentalRiskItem', @level2type=N'COLUMN',@level2name=N'BValue'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'C值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_EnvironmentalRiskItem', @level2type=N'COLUMN',@level2name=N'CValue'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'D值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_EnvironmentalRiskItem', @level2type=N'COLUMN',@level2name=N'DValue'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'E值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_EnvironmentalRiskItem', @level2type=N'COLUMN',@level2name=N'EValue'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Z值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_EnvironmentalRiskItem', @level2type=N'COLUMN',@level2name=N'ZValue'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类型（1-资源能源类2-排放类）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_EnvironmentalRiskItem', @level2type=N'COLUMN',@level2name=N'SmallType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否重要因素' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_EnvironmentalRiskItem', @level2type=N'COLUMN',@level2name=N'IsImportant'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_EnvironmentalRiskItem', @level2type=N'COLUMN',@level2name=N'Code'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'环境危险源辨识明细表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_EnvironmentalRiskItem'
GO

CREATE TABLE [dbo].[Hazard_HazardList](
	[HazardListId] [nvarchar](50) NOT NULL,
	[HazardListCode] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[VersionNo] [nvarchar](5) NULL,
	[CompileMan] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
	[States] [char](1) NULL,
	[WorkStage] [nvarchar](50) NULL,
 CONSTRAINT [PK_Hazard_HazardList_1] PRIMARY KEY CLUSTERED 
(
	[HazardListId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'危险源辨识与评价清单编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_HazardList', @level2type=N'COLUMN',@level2name=N'HazardListCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'所属项目' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_HazardList', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'版本号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_HazardList', @level2type=N'COLUMN',@level2name=N'VersionNo'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制人（现场HSE经理）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_HazardList', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_HazardList', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态（0-重新编制，1-编制，2-现场HSE经理编制、3-施工经理校对、4-项目HSE经理审核、5-项目经理批准，6-审批完成）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_HazardList', @level2type=N'COLUMN',@level2name=N'States'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'危险源辨识与评价清单表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_HazardList'
GO

ALTER TABLE [dbo].[Hazard_HazardList]  WITH CHECK ADD  CONSTRAINT [FK_Hazard_HazardList_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[Hazard_HazardList] CHECK CONSTRAINT [FK_Hazard_HazardList_Base_Project]
GO

ALTER TABLE [dbo].[Hazard_HazardList]  WITH CHECK ADD  CONSTRAINT [FK_Hazard_HazardList_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[Hazard_HazardList] CHECK CONSTRAINT [FK_Hazard_HazardList_Sys_User]
GO

CREATE TABLE [dbo].[Hazard_HazardSelectedItem](
	[HazardId] [nvarchar](50) NOT NULL,
	[HazardListTypeId] [nvarchar](10) NOT NULL,
	[HazardListId] [nvarchar](50) NOT NULL,
	[HazardItems] [nvarchar](100) NULL,
	[DefectsType] [nvarchar](50) NULL,
	[MayLeadAccidents] [nvarchar](100) NULL,
	[HelperMethod] [nvarchar](10) NULL,
	[HazardJudge_L] [numeric](6, 1) NULL,
	[HazardJudge_E] [numeric](6, 1) NULL,
	[HazardJudge_C] [numeric](6, 1) NULL,
	[HazardJudge_D] [numeric](6, 1) NULL,
	[HazardLevel] [char](1) NULL,
	[ControlMeasures] [nvarchar](200) NULL,
	[IsResponse] [bit] NULL,
	[ResponseRecode] [nvarchar](100) NULL,
	[PromptTime] [int] NULL,
	[Remark] [nvarchar](100) NULL,
	[WorkStage] [char](2) NOT NULL,
 CONSTRAINT [PK_Hazard_HazardSelectedItem] PRIMARY KEY CLUSTERED 
(
	[HazardId] ASC,
	[HazardListId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'危险源代码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_HazardSelectedItem', @level2type=N'COLUMN',@level2name=N'HazardId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'危险源类别编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_HazardSelectedItem', @level2type=N'COLUMN',@level2name=N'HazardListTypeId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'所属清单' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_HazardSelectedItem', @level2type=N'COLUMN',@level2name=N'HazardListId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'危险因素明细' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_HazardSelectedItem', @level2type=N'COLUMN',@level2name=N'HazardItems'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'缺陷类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_HazardSelectedItem', @level2type=N'COLUMN',@level2name=N'DefectsType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'可能导致的事故' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_HazardSelectedItem', @level2type=N'COLUMN',@level2name=N'MayLeadAccidents'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'辅助方法(分为:I,Ⅱ,Ⅲ,Ⅳ,Ⅴ)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_HazardSelectedItem', @level2type=N'COLUMN',@level2name=N'HelperMethod'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作业条件危险性评价(L)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_HazardSelectedItem', @level2type=N'COLUMN',@level2name=N'HazardJudge_L'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作业条件危险性评价(E)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_HazardSelectedItem', @level2type=N'COLUMN',@level2name=N'HazardJudge_E'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作业条件危险性评价(C)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_HazardSelectedItem', @level2type=N'COLUMN',@level2name=N'HazardJudge_C'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作业条件危险性评价(D)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_HazardSelectedItem', @level2type=N'COLUMN',@level2name=N'HazardJudge_D'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'危险级别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_HazardSelectedItem', @level2type=N'COLUMN',@level2name=N'HazardLevel'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'控制措施' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_HazardSelectedItem', @level2type=N'COLUMN',@level2name=N'ControlMeasures'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否响应' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_HazardSelectedItem', @level2type=N'COLUMN',@level2name=N'IsResponse'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'响应记录' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_HazardSelectedItem', @level2type=N'COLUMN',@level2name=N'ResponseRecode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'提示时间（1-1周，2-2周，以此类推）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_HazardSelectedItem', @level2type=N'COLUMN',@level2name=N'PromptTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_HazardSelectedItem', @level2type=N'COLUMN',@level2name=N'Remark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'危害辩识与危险评价结果表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_HazardSelectedItem'
GO

CREATE TABLE [dbo].[Hazard_Registration](
	[RegistrationId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[WorkAreaId] [nvarchar](50) NULL,
	[ProblemDescription] [nvarchar](800) NULL,
	[ProblemTypes] [nvarchar](200) NULL,
	[TakeSteps] [nvarchar](500) NULL,
	[ResponsibilityUnitId] [nvarchar](50) NULL,
	[ResponsibilityManId] [nvarchar](50) NULL,
	[RectificationPeriod] [datetime] NULL,
	[CheckManId] [nvarchar](50) NULL,
	[CheckTime] [datetime] NULL,
	[ImageUrl] [nvarchar](2000) NULL,
	[RectificationImageUrl] [nvarchar](2000) NULL,
	[States] [char](1) NULL,
	[RectificationTime] [datetime] NULL,
	[State] [char](1) NULL,
	[HazardCode] [nvarchar](50) NULL,
	[DefectsType] [nvarchar](50) NULL,
	[MayLeadAccidents] [nvarchar](100) NULL,
 CONSTRAINT [PK_Hazard_Registration] PRIMARY KEY CLUSTERED 
(
	[RegistrationId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_Registration', @level2type=N'COLUMN',@level2name=N'RegistrationId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目id【Base_Project】' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_Registration', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'位置id【ProjectData_WorkArea】' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_Registration', @level2type=N'COLUMN',@level2name=N'WorkAreaId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'问题描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_Registration', @level2type=N'COLUMN',@level2name=N'ProblemDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'问题类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_Registration', @level2type=N'COLUMN',@level2name=N'ProblemTypes'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'采取措施' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_Registration', @level2type=N'COLUMN',@level2name=N'TakeSteps'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'责任单位id【Base_Unit】' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_Registration', @level2type=N'COLUMN',@level2name=N'ResponsibilityUnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'责任人id【Sys_User】' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_Registration', @level2type=N'COLUMN',@level2name=N'ResponsibilityManId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'整改期限' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_Registration', @level2type=N'COLUMN',@level2name=N'RectificationPeriod'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'检查人（取当前登录人）【Sys_User】' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_Registration', @level2type=N'COLUMN',@level2name=N'CheckManId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'检查时间（建议取到分钟）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_Registration', @level2type=N'COLUMN',@level2name=N'CheckTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图片路径' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_Registration', @level2type=N'COLUMN',@level2name=N'ImageUrl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'整改后图片路径' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_Registration', @level2type=N'COLUMN',@level2name=N'RectificationImageUrl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'整改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_Registration', @level2type=N'COLUMN',@level2name=N'RectificationTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态（1-未整改、2-已整改、3-已闭环）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_Registration', @level2type=N'COLUMN',@level2name=N'State'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'危险源编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_Registration', @level2type=N'COLUMN',@level2name=N'HazardCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'缺陷类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_Registration', @level2type=N'COLUMN',@level2name=N'DefectsType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'可能导致的事故' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_Registration', @level2type=N'COLUMN',@level2name=N'MayLeadAccidents'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'危险观察登记表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_Registration'
GO

ALTER TABLE [dbo].[Hazard_Registration]  WITH CHECK ADD  CONSTRAINT [FK_Hazard_Registration_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[Hazard_Registration] CHECK CONSTRAINT [FK_Hazard_Registration_Base_Project]
GO

ALTER TABLE [dbo].[Hazard_Registration]  WITH CHECK ADD  CONSTRAINT [FK_Hazard_Registration_Base_Unit] FOREIGN KEY([ResponsibilityUnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[Hazard_Registration] CHECK CONSTRAINT [FK_Hazard_Registration_Base_Unit]
GO

ALTER TABLE [dbo].[Hazard_Registration]  WITH CHECK ADD  CONSTRAINT [FK_Hazard_Registration_ProjectData_WorkArea] FOREIGN KEY([WorkAreaId])
REFERENCES [dbo].[ProjectData_WorkArea] ([WorkAreaId])
GO

ALTER TABLE [dbo].[Hazard_Registration] CHECK CONSTRAINT [FK_Hazard_Registration_ProjectData_WorkArea]
GO

ALTER TABLE [dbo].[Hazard_Registration]  WITH CHECK ADD  CONSTRAINT [FK_Hazard_Registration_Sys_User] FOREIGN KEY([CheckManId])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[Hazard_Registration] CHECK CONSTRAINT [FK_Hazard_Registration_Sys_User]
GO

ALTER TABLE [dbo].[Hazard_Registration]  WITH CHECK ADD  CONSTRAINT [FK_Hazard_Registration_Sys_User1] FOREIGN KEY([ResponsibilityManId])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[Hazard_Registration] CHECK CONSTRAINT [FK_Hazard_Registration_Sys_User1]
GO

--环境危险源评价明细列表
CREATE VIEW [dbo].[View_Hazard_EnvironmentalRiskItem]  AS 
/*环境危险源评价明细列表视图*/
SELECT environmentalRiskItem.EnvironmentalRiskItemId, 
environmentalRiskItem.EnvironmentalRiskListId, 
environmentalRiskItem.EType, 
environmentalRiskItem.ActivePoint,
environmentalRiskItem.EnvironmentalFactors,
environmentalRiskItem.AValue,
environmentalRiskItem.BValue,
environmentalRiskItem.CValue,
environmentalRiskItem.DValue,
environmentalRiskItem.EValue,
environmentalRiskItem.ZValue,
environmentalRiskItem.SmallType,
environmentalRiskItem.IsImportant,
environmentalRiskItem.Code,
Sys_ConstEType.ConstText AS ETypeName,
Sys_ConstESmallType.ConstText AS SmallTypeName
FROM dbo.Hazard_EnvironmentalRiskItem AS environmentalRiskItem
LEFT JOIN Sys_Const AS  Sys_ConstEType  ON environmentalRiskItem.EType=Sys_ConstEType.ConstValue and Sys_ConstEType.GroupId='EnvironmentalType'
LEFT JOIN Sys_Const AS Sys_ConstESmallType ON environmentalRiskItem.SmallType=Sys_ConstESmallType.ConstValue and Sys_ConstESmallType.GroupId='EnvironmentalSmallType'


GO
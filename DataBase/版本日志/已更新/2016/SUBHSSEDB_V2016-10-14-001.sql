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

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_GoodsDef', @level2type=N'COLUMN',@level2name=N'GoodsDefId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_GoodsDef', @level2type=N'COLUMN',@level2name=N'GoodsDefCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_GoodsDef', @level2type=N'COLUMN',@level2name=N'GoodsDefName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'˵��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_GoodsDef', @level2type=N'COLUMN',@level2name=N'Remark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_GoodsDef'
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

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_Expense', @level2type=N'COLUMN',@level2name=N'ExpenseId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��Ŀid' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_Expense', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_Expense', @level2type=N'COLUMN',@level2name=N'ExpenseCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��λ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_Expense', @level2type=N'COLUMN',@level2name=N'UnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_Expense', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_Expense', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ʩ����ʹ�üƻ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_Expense'
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

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HSSE���ʹ�������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_GoodsManage', @level2type=N'COLUMN',@level2name=N'GoodsManageId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������Ŀ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_GoodsManage', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_GoodsManage', @level2type=N'COLUMN',@level2name=N'GoodsCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HSSE��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_GoodsManage', @level2type=N'COLUMN',@level2name=N'GoodsName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������λ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_GoodsManage', @level2type=N'COLUMN',@level2name=N'UnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�������1-���������2-Ӧ�����ʣ�3-PPE��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_GoodsManage', @level2type=N'COLUMN',@level2name=N'GoodsType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����ͺ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_GoodsManage', @level2type=N'COLUMN',@level2name=N'SizeModel'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_GoodsManage', @level2type=N'COLUMN',@level2name=N'FactoryCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_GoodsManage', @level2type=N'COLUMN',@level2name=N'CheckDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��Ч����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_GoodsManage', @level2type=N'COLUMN',@level2name=N'EnableYear'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���/������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_GoodsManage', @level2type=N'COLUMN',@level2name=N'CheckPerson'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�볡ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_GoodsManage', @level2type=N'COLUMN',@level2name=N'InTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'״̬' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_GoodsManage', @level2type=N'COLUMN',@level2name=N'States'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_GoodsManage', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_GoodsManage', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ע' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_GoodsManage', @level2type=N'COLUMN',@level2name=N'Remark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HSSE���ʹ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_GoodsManage'
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

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_CostManage', @level2type=N'COLUMN',@level2name=N'CostManageId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ĿID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_CostManage', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_CostManage', @level2type=N'COLUMN',@level2name=N'CostManageCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_CostManage', @level2type=N'COLUMN',@level2name=N'CostManageName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ͬ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_CostManage', @level2type=N'COLUMN',@level2name=N'ContractNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_CostManage', @level2type=N'COLUMN',@level2name=N'CostManageDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ְ��̸��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_CostManage', @level2type=N'COLUMN',@level2name=N'Opinion'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ְ���HSE���� ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_CostManage', @level2type=N'COLUMN',@level2name=N'SubHSE'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ְ���ʩ������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_CostManage', @level2type=N'COLUMN',@level2name=N'SubCN'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ְ�����Ŀ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_CostManage', @level2type=N'COLUMN',@level2name=N'SubProject'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'״̬' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_CostManage', @level2type=N'COLUMN',@level2name=N'States'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_CostManage', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_CostManage', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���ù����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_CostManage'
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

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_CostManageItem', @level2type=N'COLUMN',@level2name=N'CostManageItemId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���ù���ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_CostManageItem', @level2type=N'COLUMN',@level2name=N'CostManageId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ͷ�������Ŀ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_CostManageItem', @level2type=N'COLUMN',@level2name=N'InvestCostProject'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����ʹ��ԭ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_CostManageItem', @level2type=N'COLUMN',@level2name=N'UseReason'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_CostManageItem', @level2type=N'COLUMN',@level2name=N'Counts'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���ۣ�Ԫ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_CostManageItem', @level2type=N'COLUMN',@level2name=N'PriceMoney'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ע' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_CostManageItem', @level2type=N'COLUMN',@level2name=N'Remark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���ù�����ϸ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_CostManageItem'
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

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_CostSmallDetail', @level2type=N'COLUMN',@level2name=N'CostSmallDetailId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ĿID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_CostSmallDetail', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_CostSmallDetail', @level2type=N'COLUMN',@level2name=N'CostSmallDetailCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��λ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_CostSmallDetail', @level2type=N'COLUMN',@level2name=N'UnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'״̬' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_CostSmallDetail', @level2type=N'COLUMN',@level2name=N'States'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_CostSmallDetail', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_CostSmallDetail', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ȫ����Ͷ��Ǽ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_CostSmallDetail'
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

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_CostSmallDetailItem', @level2type=N'COLUMN',@level2name=N'CostSmallDetailItemId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ȫ����Ͷ��Ǽ�ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_CostSmallDetailItem', @level2type=N'COLUMN',@level2name=N'CostSmallDetailId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_CostSmallDetailItem', @level2type=N'COLUMN',@level2name=N'CostType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��Ŀ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_CostSmallDetailItem', @level2type=N'COLUMN',@level2name=N'ProjectName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������ϸ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_CostSmallDetailItem', @level2type=N'COLUMN',@level2name=N'CostDetail'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����ۼ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_CostSmallDetailItem', @level2type=N'COLUMN',@level2name=N'Accumulative'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ȫ����Ͷ��Ǽ���ϸ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_CostSmallDetailItem'
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

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_GoodsIn', @level2type=N'COLUMN',@level2name=N'GoodsInId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��Ŀ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_GoodsIn', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ⵥ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_GoodsIn', @level2type=N'COLUMN',@level2name=N'GoodsInCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_GoodsIn', @level2type=N'COLUMN',@level2name=N'GoodsDefId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_GoodsIn', @level2type=N'COLUMN',@level2name=N'GoodsNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_GoodsIn', @level2type=N'COLUMN',@level2name=N'InPerson'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_GoodsIn', @level2type=N'COLUMN',@level2name=N'InDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'״̬' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_GoodsIn', @level2type=N'COLUMN',@level2name=N'States'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_GoodsIn', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_GoodsIn', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_GoodsIn'
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

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_GoodsOut', @level2type=N'COLUMN',@level2name=N'GoodsOutId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ĿID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_GoodsOut', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���ⵥ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_GoodsOut', @level2type=N'COLUMN',@level2name=N'GoodsOutCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_GoodsOut', @level2type=N'COLUMN',@level2name=N'GoodsDefId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_GoodsOut', @level2type=N'COLUMN',@level2name=N'GoodsNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_GoodsOut', @level2type=N'COLUMN',@level2name=N'OutPerson'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_GoodsOut', @level2type=N'COLUMN',@level2name=N'OutDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'״̬' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_GoodsOut', @level2type=N'COLUMN',@level2name=N'States'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_GoodsOut', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_GoodsOut', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���ʳ������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_GoodsOut'
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
--������:Σ��Դ��Ӧ�����׶�
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('B840CF8F-ED62-4F2D-9140-0E552015A9D6','1','�ػ�������׮',1,'WorkStage')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('145E6655-B0F5-48D9-AFA0-7BF5D13ECE85','2','�������ֽ�������ṹ',2,'WorkStage')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('C3BFD8C6-E951-4549-8FE5-AF06AD933688','3','��������',3,'WorkStage')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('415F4593-53E1-4610-9964-7D9129D87425','4','���¹ܵ�',4,'WorkStage')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('4950110D-6ACE-4144-BFE4-3988FC1E1D1C','5','�ֽṹ',5,'WorkStage')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('8105CFF5-5986-4361-B700-406C2536D9DA','6','�豸����е���ܵ���װ',6,'WorkStage')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('9D927E44-CB2B-48EE-B07F-8EEC8A8F58C8','7','�����Ǳ�װ',7,'WorkStage')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('E9305293-B2BB-4E03-87EF-0B8485AA50A7','8','�������·���',8,'WorkStage')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('C5737F60-9B4D-41AE-964F-8566FBF85B09','9','��ɨ���Գ�',9,'WorkStage')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('6D93F7B7-CE7C-4DFE-86E0-FFC7ADACA20E','10','������ҵ',10,'WorkStage')
GO
--������:����Σ��Դ����
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('E8784339-4589-44BC-A7B1-56B6841A978C','01','������',1,'EnvironmentalType')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('0E868857-C504-4695-88F1-9A3E26E2CEE5','02','�ﳾ��',2,'EnvironmentalType')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('BBE8A43F-7338-47F4-8E94-5C87FBC66DCA','03','��ˮ�ŷ���',3,'EnvironmentalType')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('26D4409C-D81B-4EA1-B91E-8E0FD2782CE6','04','��Դ��Դ��',4,'EnvironmentalType')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('17ED987F-2236-410B-8C80-45AACE417AB1','05','�̷�����',5,'EnvironmentalType')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('0C5A1360-FBA9-4972-9382-41087BF7E117','06','������',6,'EnvironmentalType')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('EC40FEC8-96BA-4BC9-8EA7-69140CD289A2','07','й©��',7,'EnvironmentalType')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('1226FA6E-2D8E-4545-8E79-139872B88BDA','08','����Ⱦ��',8,'EnvironmentalType')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('D08B8589-95D5-4C12-8112-EEFF99897FFA','09','�ж��к�����',9,'EnvironmentalType')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('618BBBF5-9388-44F4-9B1E-7A30DB14B7D3','10','������',10,'EnvironmentalType')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('BDF50C6B-E16B-48B3-96BC-C615FCAC62E3','11','��ζ��',11,'EnvironmentalType')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('4AEF82F9-C227-4205-8484-8F940B4C75D6','12','ͻ���¼�',12,'EnvironmentalType')
GO
--������:����Σ��ԴС����
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('F820F010-FF7E-4DBE-ABDC-80FCC28136D4','1','��Դ��Դ��',1,'EnvironmentalSmallType')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('4D15B20D-975B-44FE-B2FB-97F557A38DB8','2','�ŷ���',2,'EnvironmentalSmallType')
GO


--INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
--VALUES('773B59F9-61F9-4F5E-9D68-A1BF9322AFFA','��������Σ��Դ','Technique/Environmental.aspx','Page',5,'F3B157B7-9BEE-4150-80CB-087828F1C51D','Menu_Resource',1,0)
--GO
--INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
--VALUES('C66B4ADD-FE82-4464-BAEA-7BAFA573FA92','773B59F9-61F9-4F5E-9D68-A1BF9322AFFA','����',1)
--INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
--VALUES('F764014A-1107-4536-BD64-CBA15DF49D65','773B59F9-61F9-4F5E-9D68-A1BF9322AFFA','�޸�',2)
--INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
--VALUES('F6E23A33-46F4-4822-B5F6-194810259B7B','773B59F9-61F9-4F5E-9D68-A1BF9322AFFA','ɾ��',3)
--INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
--VALUES('E5E6A150-3C2D-4CA5-AA45-BE18B8476510','773B59F9-61F9-4F5E-9D68-A1BF9322AFFA','����',4)
--GO

CREATE PROCEDURE [dbo].[SpGetVersionNumber]
 @tableName varchar(100),/*����*/
 @columnName varchar(100),/*����*/
 @projectId nvarchar(50),/*����*/
 @returnVal nvarchar(10) output
/*��ȡ�汾��*/
AS
declare 
        @sql nvarchar(500),
        @old nvarchar(10),
        @newid varchar(10),
        @maxId nvarchar(10)/*�ѷ�������ֵ*/
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

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����Σ��Դ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Technique_Environmental', @level2type=N'COLUMN',@level2name=N'EnvironmentalId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�������ͣ�1-������...��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Technique_Environmental', @level2type=N'COLUMN',@level2name=N'EType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Technique_Environmental', @level2type=N'COLUMN',@level2name=N'ActivePoint'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Technique_Environmental', @level2type=N'COLUMN',@level2name=N'EnvironmentalFactors'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Aֵ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Technique_Environmental', @level2type=N'COLUMN',@level2name=N'AValue'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Bֵ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Technique_Environmental', @level2type=N'COLUMN',@level2name=N'BValue'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Cֵ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Technique_Environmental', @level2type=N'COLUMN',@level2name=N'CValue'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Dֵ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Technique_Environmental', @level2type=N'COLUMN',@level2name=N'DValue'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Eֵ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Technique_Environmental', @level2type=N'COLUMN',@level2name=N'EValue'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Zֵ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Technique_Environmental', @level2type=N'COLUMN',@level2name=N'ZValue'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���ͣ�1-��Դ��Դ��2-�ŷ��ࣩ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Technique_Environmental', @level2type=N'COLUMN',@level2name=N'SmallType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�Ƿ���Ҫ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Technique_Environmental', @level2type=N'COLUMN',@level2name=N'IsImportant'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Technique_Environmental', @level2type=N'COLUMN',@level2name=N'Code'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������Σ����������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Technique_Environmental'
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

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����Σ��Դ��ʶid' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_EnvironmentalRiskList', @level2type=N'COLUMN',@level2name=N'EnvironmentalRiskListId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��Ŀid' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_EnvironmentalRiskList', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_EnvironmentalRiskList', @level2type=N'COLUMN',@level2name=N'RiskCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_EnvironmentalRiskList', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_EnvironmentalRiskList', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����·��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_EnvironmentalRiskList', @level2type=N'COLUMN',@level2name=N'AttachUrl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����Σ��Դ��ʶ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_EnvironmentalRiskList'
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

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����Σ��Դ��ϸid' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_EnvironmentalRiskItem', @level2type=N'COLUMN',@level2name=N'EnvironmentalRiskItemId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����Σ��Դ��ʶid' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_EnvironmentalRiskItem', @level2type=N'COLUMN',@level2name=N'EnvironmentalRiskListId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Σ��Դ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_EnvironmentalRiskItem', @level2type=N'COLUMN',@level2name=N'EType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_EnvironmentalRiskItem', @level2type=N'COLUMN',@level2name=N'ActivePoint'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_EnvironmentalRiskItem', @level2type=N'COLUMN',@level2name=N'EnvironmentalFactors'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Aֵ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_EnvironmentalRiskItem', @level2type=N'COLUMN',@level2name=N'AValue'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Bֵ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_EnvironmentalRiskItem', @level2type=N'COLUMN',@level2name=N'BValue'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Cֵ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_EnvironmentalRiskItem', @level2type=N'COLUMN',@level2name=N'CValue'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Dֵ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_EnvironmentalRiskItem', @level2type=N'COLUMN',@level2name=N'DValue'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Eֵ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_EnvironmentalRiskItem', @level2type=N'COLUMN',@level2name=N'EValue'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Zֵ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_EnvironmentalRiskItem', @level2type=N'COLUMN',@level2name=N'ZValue'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���ͣ�1-��Դ��Դ��2-�ŷ��ࣩ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_EnvironmentalRiskItem', @level2type=N'COLUMN',@level2name=N'SmallType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�Ƿ���Ҫ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_EnvironmentalRiskItem', @level2type=N'COLUMN',@level2name=N'IsImportant'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_EnvironmentalRiskItem', @level2type=N'COLUMN',@level2name=N'Code'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����Σ��Դ��ʶ��ϸ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_EnvironmentalRiskItem'
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

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Σ��Դ��ʶ�������嵥���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_HazardList', @level2type=N'COLUMN',@level2name=N'HazardListCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������Ŀ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_HazardList', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�汾��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_HazardList', @level2type=N'COLUMN',@level2name=N'VersionNo'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����ˣ��ֳ�HSE����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_HazardList', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_HazardList', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'״̬��0-���±��ƣ�1-���ƣ�2-�ֳ�HSE������ơ�3-ʩ������У�ԡ�4-��ĿHSE������ˡ�5-��Ŀ������׼��6-������ɣ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_HazardList', @level2type=N'COLUMN',@level2name=N'States'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Σ��Դ��ʶ�������嵥��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_HazardList'
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

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Σ��Դ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_HazardSelectedItem', @level2type=N'COLUMN',@level2name=N'HazardId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Σ��Դ�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_HazardSelectedItem', @level2type=N'COLUMN',@level2name=N'HazardListTypeId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����嵥' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_HazardSelectedItem', @level2type=N'COLUMN',@level2name=N'HazardListId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Σ��������ϸ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_HazardSelectedItem', @level2type=N'COLUMN',@level2name=N'HazardItems'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ȱ������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_HazardSelectedItem', @level2type=N'COLUMN',@level2name=N'DefectsType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���ܵ��µ��¹�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_HazardSelectedItem', @level2type=N'COLUMN',@level2name=N'MayLeadAccidents'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������(��Ϊ:I,��,��,��,��)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_HazardSelectedItem', @level2type=N'COLUMN',@level2name=N'HelperMethod'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ҵ����Σ��������(L)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_HazardSelectedItem', @level2type=N'COLUMN',@level2name=N'HazardJudge_L'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ҵ����Σ��������(E)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_HazardSelectedItem', @level2type=N'COLUMN',@level2name=N'HazardJudge_E'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ҵ����Σ��������(C)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_HazardSelectedItem', @level2type=N'COLUMN',@level2name=N'HazardJudge_C'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ҵ����Σ��������(D)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_HazardSelectedItem', @level2type=N'COLUMN',@level2name=N'HazardJudge_D'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Σ�ռ���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_HazardSelectedItem', @level2type=N'COLUMN',@level2name=N'HazardLevel'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���ƴ�ʩ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_HazardSelectedItem', @level2type=N'COLUMN',@level2name=N'ControlMeasures'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�Ƿ���Ӧ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_HazardSelectedItem', @level2type=N'COLUMN',@level2name=N'IsResponse'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��Ӧ��¼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_HazardSelectedItem', @level2type=N'COLUMN',@level2name=N'ResponseRecode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ʾʱ�䣨1-1�ܣ�2-2�ܣ��Դ����ƣ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_HazardSelectedItem', @level2type=N'COLUMN',@level2name=N'PromptTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ע' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_HazardSelectedItem', @level2type=N'COLUMN',@level2name=N'Remark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Σ����ʶ��Σ�����۽����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_HazardSelectedItem'
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

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_Registration', @level2type=N'COLUMN',@level2name=N'RegistrationId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��Ŀid��Base_Project��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_Registration', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'λ��id��ProjectData_WorkArea��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_Registration', @level2type=N'COLUMN',@level2name=N'WorkAreaId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_Registration', @level2type=N'COLUMN',@level2name=N'ProblemDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_Registration', @level2type=N'COLUMN',@level2name=N'ProblemTypes'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ȡ��ʩ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_Registration', @level2type=N'COLUMN',@level2name=N'TakeSteps'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���ε�λid��Base_Unit��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_Registration', @level2type=N'COLUMN',@level2name=N'ResponsibilityUnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������id��Sys_User��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_Registration', @level2type=N'COLUMN',@level2name=N'ResponsibilityManId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_Registration', @level2type=N'COLUMN',@level2name=N'RectificationPeriod'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����ˣ�ȡ��ǰ��¼�ˣ���Sys_User��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_Registration', @level2type=N'COLUMN',@level2name=N'CheckManId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���ʱ�䣨����ȡ�����ӣ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_Registration', @level2type=N'COLUMN',@level2name=N'CheckTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ͼƬ·��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_Registration', @level2type=N'COLUMN',@level2name=N'ImageUrl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���ĺ�ͼƬ·��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_Registration', @level2type=N'COLUMN',@level2name=N'RectificationImageUrl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_Registration', @level2type=N'COLUMN',@level2name=N'RectificationTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'״̬��1-δ���ġ�2-�����ġ�3-�ѱջ���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_Registration', @level2type=N'COLUMN',@level2name=N'State'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Σ��Դ���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_Registration', @level2type=N'COLUMN',@level2name=N'HazardCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ȱ������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_Registration', @level2type=N'COLUMN',@level2name=N'DefectsType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���ܵ��µ��¹�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_Registration', @level2type=N'COLUMN',@level2name=N'MayLeadAccidents'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Σ�չ۲�ǼǱ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_Registration'
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

--����Σ��Դ������ϸ�б�
CREATE VIEW [dbo].[View_Hazard_EnvironmentalRiskItem]  AS 
/*����Σ��Դ������ϸ�б���ͼ*/
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
INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('5C74F09D-FDE3-4995-A1D6-0549A8693940','安全费用管理','CostGoods/HSSECostManage.aspx','PageHeaderFooter',60,'20ECB69E-28C4-4FAC-941A-15F446AEB634','Menu_Project',1,0)
GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('B6F8D78C-C271-4BA4-B044-9E567C748CEE','5C74F09D-FDE3-4995-A1D6-0549A8693940','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('BF875EF6-EC0C-4DCB-B7B2-5D7D40D1E195','5C74F09D-FDE3-4995-A1D6-0549A8693940','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('9340F799-A674-4C0D-969F-F04B90BA8B2D','5C74F09D-FDE3-4995-A1D6-0549A8693940','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('191F3862-3DAE-4350-B6A0-C27ADD1FB429','5C74F09D-FDE3-4995-A1D6-0549A8693940','保存',4) 
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('AFF74053-B165-4D4A-BD26-2898DBD8264D','5C74F09D-FDE3-4995-A1D6-0549A8693940','提交',5)   
	GO

INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('5C74F09D-FDE3-4995-A1D6-0549A8693940','安全费用管理','CostGoods/HSSECostManage.aspx','PageHeaderFooter',60,'20ECB69E-28C4-4FAC-941A-15F446AEB634','Menu_Project',1,0)
GO

INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('6488F005-95F2-4D49-BC95-6DF4C9B23F3D','安全分包费用','CostGoods/HSSECostUnitManage.aspx','PageHeaderFooter',50,'20ECB69E-28C4-4FAC-941A-15F446AEB634','Menu_Project',1,0)
GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('E5B144D5-6639-4731-A8BA-DC7A487121E6','6488F005-95F2-4D49-BC95-6DF4C9B23F3D','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('0AB9AF31-C9DC-4038-8904-F25FB31151DB','6488F005-95F2-4D49-BC95-6DF4C9B23F3D','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('ACB91DFF-0D6B-48DF-BE59-D3641ACE2362','6488F005-95F2-4D49-BC95-6DF4C9B23F3D','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('129B8962-3BE2-40E9-B128-903DA4C9179D','6488F005-95F2-4D49-BC95-6DF4C9B23F3D','保存',4) 
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('50D2EFBF-90A8-47A5-AFF5-C4F338B72406','6488F005-95F2-4D49-BC95-6DF4C9B23F3D','提交',5)   
	GO

INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('6488F005-95F2-4D49-BC95-6DF4C9B23F3D','安全分包费用','CostGoods/HSSECostUnitManage.aspx','PageHeaderFooter',50,'20ECB69E-28C4-4FAC-941A-15F446AEB634','Menu_Project',1,0)
GO
INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('CB9F7531-1CC6-475D-82D3-0EE8BB225C28','安全费用管理','CostGoods/ServerHSSECostManage.aspx','CalendarSelectWeek',90,'70E51ABF-81C8-49CB-89AC-CF0542A201D6','Menu_Server',1,0)
GO

CREATE TABLE [dbo].[CostGoods_HSSECostManage](
	[HSSECostManageId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[CompileManId] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
	[Month] [datetime] NULL,
	[Code] [nvarchar](50) NULL,
	[ReportDate] [datetime] NULL,
	[MainIncome] [decimal](19, 4) NULL,
	[Remark1] [nvarchar](500) NULL,
	[ConstructionIncome] [decimal](19, 4) NULL,
	[Remark2] [nvarchar](500) NULL,
	[SafetyCosts] [decimal](19, 4) NULL,
	[Remark3] [nvarchar](500) NULL,
 CONSTRAINT [PK_CostGoods_HSSECostManage] PRIMARY KEY CLUSTERED 
(
	[HSSECostManageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[CostGoods_HSSECostManage]  WITH CHECK ADD  CONSTRAINT [FK_CostGoods_HSSECostManage_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[CostGoods_HSSECostManage] CHECK CONSTRAINT [FK_CostGoods_HSSECostManage_Base_Project]
GO

ALTER TABLE [dbo].[CostGoods_HSSECostManage]  WITH CHECK ADD  CONSTRAINT [FK_CostGoods_HSSECostManage_Sys_User] FOREIGN KEY([CompileManId])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[CostGoods_HSSECostManage] CHECK CONSTRAINT [FK_CostGoods_HSSECostManage_Sys_User]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'安全费用管理ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostManage', @level2type=N'COLUMN',@level2name=N'HSSECostManageId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostManage', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制人ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostManage', @level2type=N'COLUMN',@level2name=N'CompileManId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostManage', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'月份' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostManage', @level2type=N'COLUMN',@level2name=N'Month'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostManage', @level2type=N'COLUMN',@level2name=N'Code'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'填报日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostManage', @level2type=N'COLUMN',@level2name=N'ReportDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主营收入（万元）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostManage', @level2type=N'COLUMN',@level2name=N'MainIncome'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostManage', @level2type=N'COLUMN',@level2name=N'Remark1'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'施工收入' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostManage', @level2type=N'COLUMN',@level2name=N'ConstructionIncome'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostManage', @level2type=N'COLUMN',@level2name=N'Remark2'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'投入的安全生产费用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostManage', @level2type=N'COLUMN',@level2name=N'SafetyCosts'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostManage', @level2type=N'COLUMN',@level2name=N'Remark3'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'安全费用管理表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostManage'
GO


CREATE TABLE [dbo].[CostGoods_HSSECostUnitManage](
	[HSSECostUnitManageId] [nvarchar](50) NOT NULL,
	[HSSECostManageId] [nvarchar](50) NULL,
	[UnitId] [nvarchar](50) NULL,
	[CompileManId] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
	[EngineeringCost] [decimal](19, 4) NULL,
	[Remark1] [nvarchar](50) NULL,
	[SubUnitCost] [decimal](19, 4) NULL,
	[Remark2] [nvarchar](50) NULL,
	[AuditedSubUnitCost] [decimal](19, 4) NULL,
	[Remark3] [nvarchar](50) NULL,
	[CostRatio] [decimal](19, 2) NULL,
	[Remark4] [nvarchar](50) NULL,
	[CostA1] [decimal](19, 4) NULL,
	[CostA2] [decimal](19, 4) NULL,
	[CostA3] [decimal](19, 4) NULL,
	[CostA4] [decimal](19, 4) NULL,
	[CostA5] [decimal](19, 4) NULL,
	[CostA6] [decimal](19, 4) NULL,
	[CostA7] [decimal](19, 4) NULL,
	[CostA8] [decimal](19, 4) NULL,
	[CostB1] [decimal](19, 4) NULL,
	[CostB2] [decimal](19, 4) NULL,
	[CostC1] [decimal](19, 4) NULL,
	[CostD1] [decimal](19, 4) NULL,
	[CostD2] [decimal](19, 4) NULL,
	[CostD3] [decimal](19, 4) NULL,
 CONSTRAINT [PK_CostGoods_HSSECostUnitManage] PRIMARY KEY CLUSTERED 
(
	[HSSECostUnitManageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[CostGoods_HSSECostUnitManage]  WITH CHECK ADD  CONSTRAINT [FK_CostGoods_HSSECostUnitManage_Base_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[CostGoods_HSSECostUnitManage] CHECK CONSTRAINT [FK_CostGoods_HSSECostUnitManage_Base_Unit]
GO

ALTER TABLE [dbo].[CostGoods_HSSECostUnitManage]  WITH CHECK ADD  CONSTRAINT [FK_CostGoods_HSSECostUnitManage_CostGoods_HSSECostManage] FOREIGN KEY([HSSECostManageId])
REFERENCES [dbo].[CostGoods_HSSECostManage] ([HSSECostManageId])
GO

ALTER TABLE [dbo].[CostGoods_HSSECostUnitManage] CHECK CONSTRAINT [FK_CostGoods_HSSECostUnitManage_CostGoods_HSSECostManage]
GO

ALTER TABLE [dbo].[CostGoods_HSSECostUnitManage]  WITH CHECK ADD  CONSTRAINT [FK_CostGoods_HSSECostUnitManage_Sys_User] FOREIGN KEY([CompileManId])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[CostGoods_HSSECostUnitManage] CHECK CONSTRAINT [FK_CostGoods_HSSECostUnitManage_Sys_User]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'安全费用管理ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostUnitManage', @level2type=N'COLUMN',@level2name=N'HSSECostUnitManageId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'安全管理主表ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostUnitManage', @level2type=N'COLUMN',@level2name=N'HSSECostManageId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'施工分包ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostUnitManage', @level2type=N'COLUMN',@level2name=N'UnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制人ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostUnitManage', @level2type=N'COLUMN',@level2name=N'CompileManId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostUnitManage', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'当月已支付工程款' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostUnitManage', @level2type=N'COLUMN',@level2name=N'EngineeringCost'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostUnitManage', @level2type=N'COLUMN',@level2name=N'Remark1'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'已支付分承包商安全生产费用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostUnitManage', @level2type=N'COLUMN',@level2name=N'SubUnitCost'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostUnitManage', @level2type=N'COLUMN',@level2name=N'Remark2'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'已审核分承包商安全生产费用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostUnitManage', @level2type=N'COLUMN',@level2name=N'AuditedSubUnitCost'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostUnitManage', @level2type=N'COLUMN',@level2name=N'Remark3'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承包商安全生产费用占比' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostUnitManage', @level2type=N'COLUMN',@level2name=N'CostRatio'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostUnitManage', @level2type=N'COLUMN',@level2name=N'Remark4'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'基础管理' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostUnitManage', @level2type=N'COLUMN',@level2name=N'CostA1'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'安全奖励' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostUnitManage', @level2type=N'COLUMN',@level2name=N'CostA2'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'安全技术' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostUnitManage', @level2type=N'COLUMN',@level2name=N'CostA3'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'职业健康' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostUnitManage', @level2type=N'COLUMN',@level2name=N'CostA4'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'防护措施' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostUnitManage', @level2type=N'COLUMN',@level2name=N'CostA5'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'应急管理' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostUnitManage', @level2type=N'COLUMN',@level2name=N'CostA6'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'化工试车' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostUnitManage', @level2type=N'COLUMN',@level2name=N'CostA7'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'教育培训' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostUnitManage', @level2type=N'COLUMN',@level2name=N'CostA8'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文明施工' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostUnitManage', @level2type=N'COLUMN',@level2name=N'CostB1'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'环境保护' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostUnitManage', @level2type=N'COLUMN',@level2name=N'CostB2'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'临时设施' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostUnitManage', @level2type=N'COLUMN',@level2name=N'CostC1'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'劳动保护' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostUnitManage', @level2type=N'COLUMN',@level2name=N'CostD1'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'危险作业意外伤害保险' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostUnitManage', @level2type=N'COLUMN',@level2name=N'CostD2'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'事件处理' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostUnitManage', @level2type=N'COLUMN',@level2name=N'CostD3'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'施工单位安全费用管理表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostUnitManage'
GO

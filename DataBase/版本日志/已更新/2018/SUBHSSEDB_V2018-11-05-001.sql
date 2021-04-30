INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('0051CA27-83A3-4CAD-8A0B-64C4DFE3944C','安全分包费用审核','CostGoods/HSSECostUnitManageAudit.aspx','PageHeaderFooter',51,'20ECB69E-28C4-4FAC-941A-15F446AEB634','Menu_Project',1,0)
GO	
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('6F64145E-CF76-4FD9-B10C-CB27B74206EB','0051CA27-83A3-4CAD-8A0B-64C4DFE3944C','修改',2)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('637B5344-DDE3-4492-BB33-E6BB2CCB1457','0051CA27-83A3-4CAD-8A0B-64C4DFE3944C','删除',3)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('0534D52C-6F4C-4D10-A2A5-546C54CD3847','0051CA27-83A3-4CAD-8A0B-64C4DFE3944C','保存',4) 
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('5C56F122-7542-4923-BDAD-2805ACB60513','0051CA27-83A3-4CAD-8A0B-64C4DFE3944C','提交',5)   
GO

INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('8B71C8C4-0738-4D5F-8916-57FF3197709C','安全分包费用核定','CostGoods/HSSECostUnitManageRatified.aspx','PageHeaderFooter',53,'20ECB69E-28C4-4FAC-941A-15F446AEB634','Menu_Project',1,0)
GO	
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('CAFA7B39-EAC9-4598-9D25-C323C2B81F30','8B71C8C4-0738-4D5F-8916-57FF3197709C','修改',2)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('A9638340-852D-4228-B549-84AE906DF974','8B71C8C4-0738-4D5F-8916-57FF3197709C','删除',3)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('B195229D-E533-4CDA-AD59-38FEB98C3773','8B71C8C4-0738-4D5F-8916-57FF3197709C','保存',4) 
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('7589C50B-1676-4208-866F-2624CC3D949A','8B71C8C4-0738-4D5F-8916-57FF3197709C','提交',5)   
GO


--费用明细
CREATE TABLE [dbo].[CostGoods_HSSECostUnitManageItem](
	[HSSECostUnitManageItemId] [nvarchar](50) NOT NULL,
	[HSSECostUnitManageId] [nvarchar](50) NULL,
	[Type] [nvarchar](10) NULL,
	[SortIndex] [int] NULL,
	[ReportTime] [datetime] NULL,
	[CostContent] [nvarchar](800) NULL,
	[Quantity] [decimal](18, 4) NULL,
	[Metric] [nvarchar](10) NULL,
	[Price] [decimal](18, 4) NULL,
	[TotalPrice] [decimal](18, 4) NULL,
	[AuditQuantity] [decimal](18, 4) NULL,
	[AuditPrice] [decimal](18, 4) NULL,
	[AuditTotalPrice] [decimal](18, 4) NULL,
	[IsAgree] [bit] NULL,
	[AuditExplain] [nvarchar](500) NULL,
	[RatifiedQuantity] [decimal](18, 4) NULL,
	[RatifiedPrice] [decimal](18, 4) NULL,
	[RatifiedTotalPrice] [decimal](18, 4) NULL,
	[RatifiedExplain] [nvarchar](500) NULL,
	[IsRatified] [bit] NULL,
 CONSTRAINT [PK_CostGoods_HSSECostUnitManageItem] PRIMARY KEY CLUSTERED 
(
	[HSSECostUnitManageItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[CostGoods_HSSECostUnitManageItem]  WITH CHECK ADD  CONSTRAINT [FK_CostGoods_HSSECostUnitManageItem_CostGoods_HSSECostUnitManage] FOREIGN KEY([HSSECostUnitManageId])
REFERENCES [dbo].[CostGoods_HSSECostUnitManage] ([HSSECostUnitManageId])
GO

ALTER TABLE [dbo].[CostGoods_HSSECostUnitManageItem] CHECK CONSTRAINT [FK_CostGoods_HSSECostUnitManageItem_CostGoods_HSSECostUnitManage]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'费用明细表ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostUnitManageItem', @level2type=N'COLUMN',@level2name=N'HSSECostUnitManageItemId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostUnitManageItem', @level2type=N'COLUMN',@level2name=N'Type'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'序号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostUnitManageItem', @level2type=N'COLUMN',@level2name=N'SortIndex'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'填报时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostUnitManageItem', @level2type=N'COLUMN',@level2name=N'ReportTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'费用内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostUnitManageItem', @level2type=N'COLUMN',@level2name=N'CostContent'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'工程量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostUnitManageItem', @level2type=N'COLUMN',@level2name=N'Quantity'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'计量单位' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostUnitManageItem', @level2type=N'COLUMN',@level2name=N'Metric'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单价（元）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostUnitManageItem', @level2type=N'COLUMN',@level2name=N'Price'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'总价（元）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostUnitManageItem', @level2type=N'COLUMN',@level2name=N'TotalPrice'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'审核工程量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostUnitManageItem', @level2type=N'COLUMN',@level2name=N'AuditQuantity'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'审核单价（元）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostUnitManageItem', @level2type=N'COLUMN',@level2name=N'AuditPrice'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'审核总价（元）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostUnitManageItem', @level2type=N'COLUMN',@level2name=N'AuditTotalPrice'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否同意' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostUnitManageItem', @level2type=N'COLUMN',@level2name=N'IsAgree'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'审核说明' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostUnitManageItem', @level2type=N'COLUMN',@level2name=N'AuditExplain'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'核定工程量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostUnitManageItem', @level2type=N'COLUMN',@level2name=N'RatifiedQuantity'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'核定单价（元）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostUnitManageItem', @level2type=N'COLUMN',@level2name=N'RatifiedPrice'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'核定总价（元）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostUnitManageItem', @level2type=N'COLUMN',@level2name=N'RatifiedTotalPrice'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'核定说明' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostUnitManageItem', @level2type=N'COLUMN',@level2name=N'RatifiedExplain'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否核定' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostUnitManageItem', @level2type=N'COLUMN',@level2name=N'IsRatified'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单位费用明细表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostUnitManageItem'
GO

ALTER TABLE CostGoods_HSSECostUnitManage ADD States CHAR(1) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostUnitManage', @level2type=N'COLUMN',@level2name=N'States'
GO

ALTER TABLE CostGoods_HSSECostUnitManage ADD StateType CHAR(1) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'审核类型(1-施工单位；2-安全；3-费控)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostUnitManage', @level2type=N'COLUMN',@level2name=N'StateType'
GO

ALTER TABLE CostGoods_HSSECostUnitManage ADD AuditCostA1  DECIMAL(19,4) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'审核基础管理' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostUnitManage', @level2type=N'COLUMN',@level2name=N'AuditCostA1'
GO
ALTER TABLE CostGoods_HSSECostUnitManage ADD AuditCostA2  DECIMAL(19,4) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'审核安全奖励' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostUnitManage', @level2type=N'COLUMN',@level2name=N'AuditCostA2'
GO
ALTER TABLE CostGoods_HSSECostUnitManage ADD AuditCostA3  DECIMAL(19,4) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'审核安全技术' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostUnitManage', @level2type=N'COLUMN',@level2name=N'AuditCostA3'
GO
ALTER TABLE CostGoods_HSSECostUnitManage ADD AuditCostA4  DECIMAL(19,4) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'审核职业健康' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostUnitManage', @level2type=N'COLUMN',@level2name=N'AuditCostA4'
GO
ALTER TABLE CostGoods_HSSECostUnitManage ADD AuditCostA5  DECIMAL(19,4) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'审核防护措施' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostUnitManage', @level2type=N'COLUMN',@level2name=N'AuditCostA5'
GO
ALTER TABLE CostGoods_HSSECostUnitManage ADD AuditCostA6  DECIMAL(19,4) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'审核应急管理' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostUnitManage', @level2type=N'COLUMN',@level2name=N'AuditCostA6'
GO
ALTER TABLE CostGoods_HSSECostUnitManage ADD AuditCostA7  DECIMAL(19,4) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'审核化工试车' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostUnitManage', @level2type=N'COLUMN',@level2name=N'AuditCostA7'
GO
ALTER TABLE CostGoods_HSSECostUnitManage ADD AuditCostA8  DECIMAL(19,4) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'审核教育培训' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostUnitManage', @level2type=N'COLUMN',@level2name=N'AuditCostA8'
GO
ALTER TABLE CostGoods_HSSECostUnitManage ADD RatifiedCostA1  DECIMAL(19,4) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'核定基础管理' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostUnitManage', @level2type=N'COLUMN',@level2name=N'RatifiedCostA1'
GO
ALTER TABLE CostGoods_HSSECostUnitManage ADD RatifiedCostA2  DECIMAL(19,4) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'核定安全奖励' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostUnitManage', @level2type=N'COLUMN',@level2name=N'RatifiedCostA2'
GO
ALTER TABLE CostGoods_HSSECostUnitManage ADD RatifiedCostA3  DECIMAL(19,4) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'核定安全技术' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostUnitManage', @level2type=N'COLUMN',@level2name=N'RatifiedCostA3'
GO
ALTER TABLE CostGoods_HSSECostUnitManage ADD RatifiedCostA4  DECIMAL(19,4) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'核定职业健康' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostUnitManage', @level2type=N'COLUMN',@level2name=N'RatifiedCostA4'
GO
ALTER TABLE CostGoods_HSSECostUnitManage ADD RatifiedCostA5  DECIMAL(19,4) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'核定防护措施' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostUnitManage', @level2type=N'COLUMN',@level2name=N'RatifiedCostA5'
GO
ALTER TABLE CostGoods_HSSECostUnitManage ADD RatifiedCostA6  DECIMAL(19,4) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'核定应急管理' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostUnitManage', @level2type=N'COLUMN',@level2name=N'RatifiedCostA6'
GO
ALTER TABLE CostGoods_HSSECostUnitManage ADD RatifiedCostA7  DECIMAL(19,4) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'核定化工试车' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostUnitManage', @level2type=N'COLUMN',@level2name=N'RatifiedCostA7'
GO
ALTER TABLE CostGoods_HSSECostUnitManage ADD RatifiedCostA8  DECIMAL(19,4) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'核定教育培训' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostUnitManage', @level2type=N'COLUMN',@level2name=N'RatifiedCostA8'
GO

ALTER TABLE CostGoods_HSSECostUnitManage ADD AuditManId NVARCHAR(50) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'审核工程师id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostUnitManage', @level2type=N'COLUMN',@level2name=N'AuditManId'
GO
ALTER TABLE [dbo].[CostGoods_HSSECostUnitManage]  WITH CHECK ADD  CONSTRAINT [FK_CostGoods_HSSECostUnitManage_Sys_User1] FOREIGN KEY([AuditManId])
REFERENCES [dbo].[Sys_User] ([UserId])
GO
ALTER TABLE [dbo].[CostGoods_HSSECostUnitManage] CHECK CONSTRAINT [FK_CostGoods_HSSECostUnitManage_Sys_User1]
GO

ALTER TABLE CostGoods_HSSECostUnitManage ADD RatifiedManId NVARCHAR(50) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'核定人id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostUnitManage', @level2type=N'COLUMN',@level2name=N'RatifiedManId'
GO
ALTER TABLE [dbo].[CostGoods_HSSECostUnitManage]  WITH CHECK ADD  CONSTRAINT [FK_CostGoods_HSSECostUnitManage_Sys_User2] FOREIGN KEY([RatifiedManId])
REFERENCES [dbo].[Sys_User] ([UserId])
GO
ALTER TABLE [dbo].[CostGoods_HSSECostUnitManage] CHECK CONSTRAINT [FK_CostGoods_HSSECostUnitManage_Sys_User2]
GO

INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('0051CA27-83A3-4CAD-8A0B-64C4DFE3944C','��ȫ�ְ��������','CostGoods/HSSECostUnitManageAudit.aspx','PageHeaderFooter',51,'20ECB69E-28C4-4FAC-941A-15F446AEB634','Menu_Project',1,0)
GO	
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('6F64145E-CF76-4FD9-B10C-CB27B74206EB','0051CA27-83A3-4CAD-8A0B-64C4DFE3944C','�޸�',2)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('637B5344-DDE3-4492-BB33-E6BB2CCB1457','0051CA27-83A3-4CAD-8A0B-64C4DFE3944C','ɾ��',3)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('0534D52C-6F4C-4D10-A2A5-546C54CD3847','0051CA27-83A3-4CAD-8A0B-64C4DFE3944C','����',4) 
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('5C56F122-7542-4923-BDAD-2805ACB60513','0051CA27-83A3-4CAD-8A0B-64C4DFE3944C','�ύ',5)   
GO

INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('8B71C8C4-0738-4D5F-8916-57FF3197709C','��ȫ�ְ����ú˶�','CostGoods/HSSECostUnitManageRatified.aspx','PageHeaderFooter',53,'20ECB69E-28C4-4FAC-941A-15F446AEB634','Menu_Project',1,0)
GO	
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('CAFA7B39-EAC9-4598-9D25-C323C2B81F30','8B71C8C4-0738-4D5F-8916-57FF3197709C','�޸�',2)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('A9638340-852D-4228-B549-84AE906DF974','8B71C8C4-0738-4D5F-8916-57FF3197709C','ɾ��',3)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('B195229D-E533-4CDA-AD59-38FEB98C3773','8B71C8C4-0738-4D5F-8916-57FF3197709C','����',4) 
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('7589C50B-1676-4208-866F-2624CC3D949A','8B71C8C4-0738-4D5F-8916-57FF3197709C','�ύ',5)   
GO


--������ϸ
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

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������ϸ��ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostUnitManageItem', @level2type=N'COLUMN',@level2name=N'HSSECostUnitManageItemId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostUnitManageItem', @level2type=N'COLUMN',@level2name=N'Type'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostUnitManageItem', @level2type=N'COLUMN',@level2name=N'SortIndex'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostUnitManageItem', @level2type=N'COLUMN',@level2name=N'ReportTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostUnitManageItem', @level2type=N'COLUMN',@level2name=N'CostContent'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostUnitManageItem', @level2type=N'COLUMN',@level2name=N'Quantity'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������λ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostUnitManageItem', @level2type=N'COLUMN',@level2name=N'Metric'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���ۣ�Ԫ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostUnitManageItem', @level2type=N'COLUMN',@level2name=N'Price'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ܼۣ�Ԫ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostUnitManageItem', @level2type=N'COLUMN',@level2name=N'TotalPrice'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��˹�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostUnitManageItem', @level2type=N'COLUMN',@level2name=N'AuditQuantity'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��˵��ۣ�Ԫ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostUnitManageItem', @level2type=N'COLUMN',@level2name=N'AuditPrice'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����ܼۣ�Ԫ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostUnitManageItem', @level2type=N'COLUMN',@level2name=N'AuditTotalPrice'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�Ƿ�ͬ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostUnitManageItem', @level2type=N'COLUMN',@level2name=N'IsAgree'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���˵��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostUnitManageItem', @level2type=N'COLUMN',@level2name=N'AuditExplain'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�˶�������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostUnitManageItem', @level2type=N'COLUMN',@level2name=N'RatifiedQuantity'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�˶����ۣ�Ԫ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostUnitManageItem', @level2type=N'COLUMN',@level2name=N'RatifiedPrice'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�˶��ܼۣ�Ԫ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostUnitManageItem', @level2type=N'COLUMN',@level2name=N'RatifiedTotalPrice'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�˶�˵��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostUnitManageItem', @level2type=N'COLUMN',@level2name=N'RatifiedExplain'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�Ƿ�˶�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostUnitManageItem', @level2type=N'COLUMN',@level2name=N'IsRatified'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��λ������ϸ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostUnitManageItem'
GO

ALTER TABLE CostGoods_HSSECostUnitManage ADD States CHAR(1) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'״̬' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostUnitManage', @level2type=N'COLUMN',@level2name=N'States'
GO

ALTER TABLE CostGoods_HSSECostUnitManage ADD StateType CHAR(1) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�������(1-ʩ����λ��2-��ȫ��3-�ѿ�)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostUnitManage', @level2type=N'COLUMN',@level2name=N'StateType'
GO

ALTER TABLE CostGoods_HSSECostUnitManage ADD AuditCostA1  DECIMAL(19,4) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��˻�������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostUnitManage', @level2type=N'COLUMN',@level2name=N'AuditCostA1'
GO
ALTER TABLE CostGoods_HSSECostUnitManage ADD AuditCostA2  DECIMAL(19,4) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��˰�ȫ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostUnitManage', @level2type=N'COLUMN',@level2name=N'AuditCostA2'
GO
ALTER TABLE CostGoods_HSSECostUnitManage ADD AuditCostA3  DECIMAL(19,4) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��˰�ȫ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostUnitManage', @level2type=N'COLUMN',@level2name=N'AuditCostA3'
GO
ALTER TABLE CostGoods_HSSECostUnitManage ADD AuditCostA4  DECIMAL(19,4) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���ְҵ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostUnitManage', @level2type=N'COLUMN',@level2name=N'AuditCostA4'
GO
ALTER TABLE CostGoods_HSSECostUnitManage ADD AuditCostA5  DECIMAL(19,4) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��˷�����ʩ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostUnitManage', @level2type=N'COLUMN',@level2name=N'AuditCostA5'
GO
ALTER TABLE CostGoods_HSSECostUnitManage ADD AuditCostA6  DECIMAL(19,4) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���Ӧ������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostUnitManage', @level2type=N'COLUMN',@level2name=N'AuditCostA6'
GO
ALTER TABLE CostGoods_HSSECostUnitManage ADD AuditCostA7  DECIMAL(19,4) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��˻����Գ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostUnitManage', @level2type=N'COLUMN',@level2name=N'AuditCostA7'
GO
ALTER TABLE CostGoods_HSSECostUnitManage ADD AuditCostA8  DECIMAL(19,4) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��˽�����ѵ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostUnitManage', @level2type=N'COLUMN',@level2name=N'AuditCostA8'
GO
ALTER TABLE CostGoods_HSSECostUnitManage ADD RatifiedCostA1  DECIMAL(19,4) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�˶���������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostUnitManage', @level2type=N'COLUMN',@level2name=N'RatifiedCostA1'
GO
ALTER TABLE CostGoods_HSSECostUnitManage ADD RatifiedCostA2  DECIMAL(19,4) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�˶���ȫ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostUnitManage', @level2type=N'COLUMN',@level2name=N'RatifiedCostA2'
GO
ALTER TABLE CostGoods_HSSECostUnitManage ADD RatifiedCostA3  DECIMAL(19,4) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�˶���ȫ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostUnitManage', @level2type=N'COLUMN',@level2name=N'RatifiedCostA3'
GO
ALTER TABLE CostGoods_HSSECostUnitManage ADD RatifiedCostA4  DECIMAL(19,4) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�˶�ְҵ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostUnitManage', @level2type=N'COLUMN',@level2name=N'RatifiedCostA4'
GO
ALTER TABLE CostGoods_HSSECostUnitManage ADD RatifiedCostA5  DECIMAL(19,4) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�˶�������ʩ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostUnitManage', @level2type=N'COLUMN',@level2name=N'RatifiedCostA5'
GO
ALTER TABLE CostGoods_HSSECostUnitManage ADD RatifiedCostA6  DECIMAL(19,4) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�˶�Ӧ������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostUnitManage', @level2type=N'COLUMN',@level2name=N'RatifiedCostA6'
GO
ALTER TABLE CostGoods_HSSECostUnitManage ADD RatifiedCostA7  DECIMAL(19,4) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�˶������Գ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostUnitManage', @level2type=N'COLUMN',@level2name=N'RatifiedCostA7'
GO
ALTER TABLE CostGoods_HSSECostUnitManage ADD RatifiedCostA8  DECIMAL(19,4) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�˶�������ѵ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostUnitManage', @level2type=N'COLUMN',@level2name=N'RatifiedCostA8'
GO

ALTER TABLE CostGoods_HSSECostUnitManage ADD AuditManId NVARCHAR(50) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��˹���ʦid' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostUnitManage', @level2type=N'COLUMN',@level2name=N'AuditManId'
GO
ALTER TABLE [dbo].[CostGoods_HSSECostUnitManage]  WITH CHECK ADD  CONSTRAINT [FK_CostGoods_HSSECostUnitManage_Sys_User1] FOREIGN KEY([AuditManId])
REFERENCES [dbo].[Sys_User] ([UserId])
GO
ALTER TABLE [dbo].[CostGoods_HSSECostUnitManage] CHECK CONSTRAINT [FK_CostGoods_HSSECostUnitManage_Sys_User1]
GO

ALTER TABLE CostGoods_HSSECostUnitManage ADD RatifiedManId NVARCHAR(50) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�˶���id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_HSSECostUnitManage', @level2type=N'COLUMN',@level2name=N'RatifiedManId'
GO
ALTER TABLE [dbo].[CostGoods_HSSECostUnitManage]  WITH CHECK ADD  CONSTRAINT [FK_CostGoods_HSSECostUnitManage_Sys_User2] FOREIGN KEY([RatifiedManId])
REFERENCES [dbo].[Sys_User] ([UserId])
GO
ALTER TABLE [dbo].[CostGoods_HSSECostUnitManage] CHECK CONSTRAINT [FK_CostGoods_HSSECostUnitManage_Sys_User2]
GO

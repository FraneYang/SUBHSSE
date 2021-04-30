--现场施工动态管理子菜单
INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('FD1F5E74-4843-4F6B-B893-8A16D26443D9','月度计划','SiteConstruction/MonthPlan.aspx','PageHeaderFooter',20,'2A00CDCC-129C-4875-9663-2A2718394D88','Menu_Project',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('0057EE60-5046-40C6-99A9-82807D8DA587','FD1F5E74-4843-4F6B-B893-8A16D26443D9','增加',1)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('5B4BB4D3-98A3-4EFB-A7BF-6E57B6FAEA83','FD1F5E74-4843-4F6B-B893-8A16D26443D9','修改',2)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('8534F377-C2C9-4443-AECD-B295E266DAC3','FD1F5E74-4843-4F6B-B893-8A16D26443D9','删除',3)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('CD95F8E9-9A42-43AA-891C-3BB0F5CDC436','FD1F5E74-4843-4F6B-B893-8A16D26443D9','保存',4)  
GO
INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('FD1F5E74-4843-4F6B-B893-8A16D26443D9','月度计划','SiteConstruction/MonthPlan.aspx','PageHeaderFooter',20,'2A00CDCC-129C-4875-9663-2A2718394D88','Menu_Project',1,0)
GO     

CREATE TABLE [dbo].[SiteConstruction_MonthPlan](
	[MonthPlanId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[UnitId] [nvarchar](50) NULL,
	[Months] [datetime] NULL,
	[CompileMan] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
	[JobContent] [nvarchar](4000) NULL,
	[AttachUrl] [nvarchar](2000) NULL,
	[SeeFile] [nvarchar](max) NULL,
	[States] [char](1) NULL,
 CONSTRAINT [PK_SiteConstruction_MonthPlan] PRIMARY KEY CLUSTERED 
(
	[MonthPlanId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SiteConstruction_MonthPlan', @level2type=N'COLUMN',@level2name=N'MonthPlanId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SiteConstruction_MonthPlan', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单位Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SiteConstruction_MonthPlan', @level2type=N'COLUMN',@level2name=N'UnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'月份' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SiteConstruction_MonthPlan', @level2type=N'COLUMN',@level2name=N'Months'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SiteConstruction_MonthPlan', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SiteConstruction_MonthPlan', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'工作内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SiteConstruction_MonthPlan', @level2type=N'COLUMN',@level2name=N'JobContent'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'附件路径' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SiteConstruction_MonthPlan', @level2type=N'COLUMN',@level2name=N'AttachUrl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件查看' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SiteConstruction_MonthPlan', @level2type=N'COLUMN',@level2name=N'SeeFile'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'月度计划表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SiteConstruction_MonthPlan'
GO

ALTER TABLE [dbo].[SiteConstruction_MonthPlan]  WITH CHECK ADD  CONSTRAINT [FK_SiteConstruction_MonthPlan_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[SiteConstruction_MonthPlan] CHECK CONSTRAINT [FK_SiteConstruction_MonthPlan_Base_Project]
GO

ALTER TABLE [dbo].[SiteConstruction_MonthPlan]  WITH CHECK ADD  CONSTRAINT [FK_SiteConstruction_MonthPlan_Base_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[SiteConstruction_MonthPlan] CHECK CONSTRAINT [FK_SiteConstruction_MonthPlan_Base_Unit]
GO

ALTER TABLE [dbo].[SiteConstruction_MonthPlan]  WITH CHECK ADD  CONSTRAINT [FK_SiteConstruction_MonthPlan_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[SiteConstruction_MonthPlan] CHECK CONSTRAINT [FK_SiteConstruction_MonthPlan_Sys_User]
GO


UPDATE Sys_MenuProjectA SET MenuName='日常巡检(记录)' WHERE MenuId='38FBBA77-8B35-470C-90EE-6861E6DDE03F'
GO
UPDATE Sys_MenuProjectB SET MenuName='日常巡检(记录)' WHERE MenuId='38FBBA77-8B35-470C-90EE-6861E6DDE03F'
GO
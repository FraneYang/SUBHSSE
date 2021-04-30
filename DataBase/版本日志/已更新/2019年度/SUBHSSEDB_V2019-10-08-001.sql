--新增微信小程序首页数据表
CREATE TABLE [dbo].[Wx_PageData](
	[PageDataId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[CreatDate] [datetime] NULL,
	[CreatManId] [nvarchar](50) NULL,
	[SafeHours] [int] NULL,
	[SitePersonNum] [int] NULL,
	[SpecialEquipmentNum] [int] NULL,
	[EntryTrainingNum] [int] NULL,
	[HiddenDangerNum] [int] NULL,
	[RectificationNum] [int] NULL,
	[RiskI] [int] NULL,
	[RiskII] [int] NULL,
	[RiskIII] [int] NULL,
	[RiskIV] [int] NULL,
	[RiskV] [int] NULL,
 CONSTRAINT [PK_Wx_PageData] PRIMARY KEY CLUSTERED 
(
	[PageDataId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Wx_PageData] ADD  CONSTRAINT [DF_Wx_PageData_SafeHours]  DEFAULT ((0)) FOR [SafeHours]
GO

ALTER TABLE [dbo].[Wx_PageData] ADD  CONSTRAINT [DF_Wx_PageData_SitePersonNum]  DEFAULT ((0)) FOR [SitePersonNum]
GO

ALTER TABLE [dbo].[Wx_PageData] ADD  CONSTRAINT [DF_Wx_PageData_SpecialEquipmentNum]  DEFAULT ((0)) FOR [SpecialEquipmentNum]
GO

ALTER TABLE [dbo].[Wx_PageData] ADD  CONSTRAINT [DF_Wx_PageData_EntryTrainingNum]  DEFAULT ((0)) FOR [EntryTrainingNum]
GO

ALTER TABLE [dbo].[Wx_PageData] ADD  CONSTRAINT [DF_Wx_PageData_HiddenDangerNum]  DEFAULT ((0)) FOR [HiddenDangerNum]
GO

ALTER TABLE [dbo].[Wx_PageData] ADD  CONSTRAINT [DF_Wx_PageData_RectificationNum]  DEFAULT ((0)) FOR [RectificationNum]
GO

ALTER TABLE [dbo].[Wx_PageData] ADD  CONSTRAINT [DF_Wx_PageData_RiskI]  DEFAULT ((0)) FOR [RiskI]
GO

ALTER TABLE [dbo].[Wx_PageData] ADD  CONSTRAINT [DF_Wx_PageData_RiskI1]  DEFAULT ((0)) FOR [RiskII]
GO

ALTER TABLE [dbo].[Wx_PageData] ADD  CONSTRAINT [DF_Wx_PageData_RiskI2]  DEFAULT ((0)) FOR [RiskIII]
GO

ALTER TABLE [dbo].[Wx_PageData] ADD  CONSTRAINT [DF_Wx_PageData_RiskI3]  DEFAULT ((0)) FOR [RiskIV]
GO

ALTER TABLE [dbo].[Wx_PageData] ADD  CONSTRAINT [DF_Wx_PageData_RiskI4]  DEFAULT ((0)) FOR [RiskV]
GO

ALTER TABLE [dbo].[Wx_PageData]  WITH CHECK ADD  CONSTRAINT [FK_Wx_PageData_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[Wx_PageData] CHECK CONSTRAINT [FK_Wx_PageData_Base_Project]
GO

ALTER TABLE [dbo].[Wx_PageData]  WITH CHECK ADD  CONSTRAINT [FK_Wx_PageData_Sys_User] FOREIGN KEY([CreatManId])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[Wx_PageData] CHECK CONSTRAINT [FK_Wx_PageData_Sys_User]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Wx_PageData', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Wx_PageData', @level2type=N'COLUMN',@level2name=N'CreatDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Wx_PageData', @level2type=N'COLUMN',@level2name=N'CreatManId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'安全人工时' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Wx_PageData', @level2type=N'COLUMN',@level2name=N'SafeHours'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'当日现场人数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Wx_PageData', @level2type=N'COLUMN',@level2name=N'SitePersonNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'大型及特种设备' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Wx_PageData', @level2type=N'COLUMN',@level2name=N'SpecialEquipmentNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'累计入场培训人次' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Wx_PageData', @level2type=N'COLUMN',@level2name=N'EntryTrainingNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'隐患总数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Wx_PageData', @level2type=N'COLUMN',@level2name=N'HiddenDangerNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'整改数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Wx_PageData', @level2type=N'COLUMN',@level2name=N'RectificationNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'一级风险数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Wx_PageData', @level2type=N'COLUMN',@level2name=N'RiskI'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'一级风险数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Wx_PageData', @level2type=N'COLUMN',@level2name=N'RiskII'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'一级风险数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Wx_PageData', @level2type=N'COLUMN',@level2name=N'RiskIII'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'一级风险数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Wx_PageData', @level2type=N'COLUMN',@level2name=N'RiskIV'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'一级风险数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Wx_PageData', @level2type=N'COLUMN',@level2name=N'RiskV'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'小程序首页数据表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Wx_PageData'
GO


INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('44140854-701D-4D67-AD8E-AA8DD48B6D6A','移动端首页','ProjectData/ProjectPageData.aspx','PageHeaderFooter',70,'E82B690B-F662-4B4E-8340-6C4B8ECA44CC','Menu_Project',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('C65C5FFF-4EA7-4A5C-9AFA-44B27ED7C5C5','44140854-701D-4D67-AD8E-AA8DD48B6D6A','保存',1)
GO 
INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('44140854-701D-4D67-AD8E-AA8DD48B6D6A','移动端首页','ProjectData/ProjectPageData.aspx','PageHeaderFooter',70,'E82B690B-F662-4B4E-8340-6C4B8ECA44CC','Menu_Project',1,0)
GO
--单位增加是否分公司字段
ALTER TABLE Base_Unit ADD IsBranch BIT NULL 
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否分公司' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_Unit', @level2type=N'COLUMN',@level2name=N'IsBranch'
GO

--增加安全文件上报明细（单位）表
CREATE TABLE [dbo].[Manager_SafeReportUnitItem](
	[SafeReportUnitItemId] [nvarchar](50) NOT NULL,
	[SafeReportId] [nvarchar](50) NULL,
	[UnitId] [nvarchar](50) NULL,
	[ReportContent] [nvarchar](4000) NULL,
	[ReportManId] [nvarchar](50) NULL,
	[ReportTime] [datetime] NULL,
	[UpReportTime] [datetime] NULL,
	[States] [char](1) NULL,
 CONSTRAINT [PK_Manager_SafeReportUnitItem] PRIMARY KEY CLUSTERED 
(
	[SafeReportUnitItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Manager_SafeReportUnitItem]  WITH CHECK ADD  CONSTRAINT [FK_Manager_SafeReportUnitItem_Base_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[Manager_SafeReportUnitItem] CHECK CONSTRAINT [FK_Manager_SafeReportUnitItem_Base_Unit]
GO

ALTER TABLE [dbo].[Manager_SafeReportUnitItem]  WITH CHECK ADD  CONSTRAINT [FK_Manager_SafeReportUnitItem_Manager_SafeReport] FOREIGN KEY([SafeReportId])
REFERENCES [dbo].[Manager_SafeReport] ([SafeReportId])
GO

ALTER TABLE [dbo].[Manager_SafeReportUnitItem] CHECK CONSTRAINT [FK_Manager_SafeReportUnitItem_Manager_SafeReport]
GO

ALTER TABLE [dbo].[Manager_SafeReportUnitItem]  WITH CHECK ADD  CONSTRAINT [FK_Manager_SafeReportUnitItem_Sys_User] FOREIGN KEY([ReportManId])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[Manager_SafeReportUnitItem] CHECK CONSTRAINT [FK_Manager_SafeReportUnitItem_Sys_User]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'安全文件上报明细ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafeReportUnitItem', @level2type=N'COLUMN',@level2name=N'SafeReportUnitItemId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'安全文件上报ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafeReportUnitItem', @level2type=N'COLUMN',@level2name=N'SafeReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单位id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafeReportUnitItem', @level2type=N'COLUMN',@level2name=N'UnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'上报内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafeReportUnitItem', @level2type=N'COLUMN',@level2name=N'ReportContent'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'上报人id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafeReportUnitItem', @level2type=N'COLUMN',@level2name=N'ReportManId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafeReportUnitItem', @level2type=N'COLUMN',@level2name=N'ReportTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'上报时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafeReportUnitItem', @level2type=N'COLUMN',@level2name=N'UpReportTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafeReportUnitItem', @level2type=N'COLUMN',@level2name=N'States'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'安全文件上报明细（单位）表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafeReportUnitItem'
GO

UPDATE Sys_MenuCommon SET SortIndex=70 WHERE MenuId='306A1C97-B6B1-4AE4-AFC1-6933E821C129'
GO
--增加分公司安全文件上报菜单
INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('2C673125-AAA4-4F41-A827-0F04DFE55DED','分公司安全文件上报','ManagementReport/ServerSafeUnitReport.aspx','LayoutContent',80,'70E51ABF-81C8-49CB-89AC-CF0542A201D6','Menu_Server',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('C64B9541-DD9B-4513-9C0E-6B1CE12A8504','2C673125-AAA4-4F41-A827-0F04DFE55DED','增加',1)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('02CA0F51-C700-4762-B1F4-78D56D04322B','2C673125-AAA4-4F41-A827-0F04DFE55DED','修改',2)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('D60B2120-C2EE-4422-B0AA-CF5B32E8027D','2C673125-AAA4-4F41-A827-0F04DFE55DED','删除',3)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('62D89111-C266-44A0-8C77-85890DF2FFEA','2C673125-AAA4-4F41-A827-0F04DFE55DED','保存',4)
GO

--是否固定流程
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('4DABA60A-00A9-44B0-8EC0-CFF27AC525E1','0','是否固定流程',1,'MenuFlowOperate')
GO
--增加事故快报状态
ALTER TABLE ProjectAccident_AccidentReport ADD States CHAR(1) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'处理状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectAccident_AccidentReport', @level2type=N'COLUMN',@level2name=N'States'
GO
--增加事故处理状态
ALTER TABLE ProjectAccident_AccidentStatistics ADD States CHAR(1) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'处理状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectAccident_AccidentStatistics', @level2type=N'COLUMN',@level2name=N'States'
GO
--人员增加是否本部人员字段
ALTER TABLE Sys_User ADD IsOffice BIT NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'本部人员（True-是，False-否）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_User', @level2type=N'COLUMN',@level2name=N'IsOffice'
GO

DELETE FROM Sys_User WHERE UserId='C4A62EC0-E5D3-4EBF-A5FA-E56AA89633C0'
GO
--
INSERT INTO dbo.Sys_User(UserId,Account,[Password],UserName,IsPost)
VALUES ('C4A62EC0-E5D3-4EBF-A5FA-E56AA89633C0','hfnbd',
'B59C67BF196A4758191E42F76670CEBA','JT',1)
GO
--项目安全文件上报
INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('306A1C97-B6B1-4AE4-AFC1-6933E821C129','项目安全文件','ManagementReport/ServerSafeReport.aspx','LayoutContent',30,'70E51ABF-81C8-49CB-89AC-CF0542A201D6','Menu_Server',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('D2962F87-E4A5-41B1-A611-46B1B52DBD7F','306A1C97-B6B1-4AE4-AFC1-6933E821C129','增加',1)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('C2513D2A-0F57-4EDF-9BBB-45DBD97EC155','306A1C97-B6B1-4AE4-AFC1-6933E821C129','修改',2)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('28028063-C78C-4263-AF0F-1FC3ABFB3E5D','306A1C97-B6B1-4AE4-AFC1-6933E821C129','删除',3)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('4066D25B-52C9-49DA-8F2F-93B613A2113E','306A1C97-B6B1-4AE4-AFC1-6933E821C129','保存',4)
GO

INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('BD16BE8D-0F4D-4C80-A4D7-707156B541B8','项目安全文件','Manager/ProjectSafeReport.aspx','PageHeaderFooter',150,'03235B30-960D-4FCF-99F7-97773A2EE108','Menu_Project',1,0)
GO
--项目安全文件上报
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('3E3B3D56-D59B-4F43-9B46-4001273E7985','BD16BE8D-0F4D-4C80-A4D7-707156B541B8','增加',1)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('D19A2B65-55FE-4E3A-BEB8-5C361236AB25','BD16BE8D-0F4D-4C80-A4D7-707156B541B8','修改',2)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('9945A891-BCCA-4D8A-AEF4-AB4881F84381','BD16BE8D-0F4D-4C80-A4D7-707156B541B8','删除',3)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('B14E5FEC-CEEC-4C9F-BBE8-3102DBA8591C','BD16BE8D-0F4D-4C80-A4D7-707156B541B8','保存',4) 
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('B635EB1F-03CD-4816-BC7E-D85400C7DD77','BD16BE8D-0F4D-4C80-A4D7-707156B541B8','提交',5)  
GO

INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('BD16BE8D-0F4D-4C80-A4D7-707156B541B8','项目安全文件','Manager/ProjectSafeReport.aspx','PageHeaderFooter',150,'03235B30-960D-4FCF-99F7-97773A2EE108','Menu_Project',1,0)
GO

--培训可以多次
ALTER TABLE Base_TrainType ADD IsRepeat BIT NULL 
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'多次培训' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_TrainType', @level2type=N'COLUMN',@level2name=N'IsRepeat'
GO

--增加安全文件上报表
CREATE TABLE [dbo].[Manager_SafeReport](
	[SafeReportId] [nvarchar](50) NOT NULL,
	[SafeReportCode] [nvarchar](50) NULL,
	[SafeReportName] [nvarchar](500) NULL,
	[SupSubUnitReportId] [nvarchar](50) NULL,
	[Requirement] [nvarchar](2000) NULL,
	[RequestTime] [datetime] NULL,
	[IsEndLever] [bit] NULL,
	[CompileManId] [nvarchar](50) NULL,
	[CompileTime] [datetime] NULL,
	[States] [char](1) NULL,
 CONSTRAINT [PK_Manager_SafeReport] PRIMARY KEY CLUSTERED 
(
	[SafeReportId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Manager_SafeReport]  WITH CHECK ADD  CONSTRAINT [FK_Manager_SafeReport_Sys_User] FOREIGN KEY([CompileManId])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[Manager_SafeReport] CHECK CONSTRAINT [FK_Manager_SafeReport_Sys_User]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'安全文件上报主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafeReport', @level2type=N'COLUMN',@level2name=N'SafeReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafeReport', @level2type=N'COLUMN',@level2name=N'SafeReportCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafeReport', @level2type=N'COLUMN',@level2name=N'SafeReportName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'上级id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafeReport', @level2type=N'COLUMN',@level2name=N'SupSubUnitReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'内容要求' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafeReport', @level2type=N'COLUMN',@level2name=N'Requirement'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否末级' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafeReport', @level2type=N'COLUMN',@level2name=N'IsEndLever'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafeReport', @level2type=N'COLUMN',@level2name=N'CompileManId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafeReport', @level2type=N'COLUMN',@level2name=N'CompileTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafeReport', @level2type=N'COLUMN',@level2name=N'States'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'安全文件上报表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafeReport'
GO

---增加安全文件上报明细表
CREATE TABLE [dbo].[Manager_SafeReportItem](
	[SafeReportItemId] [nvarchar](50) NOT NULL,
	[SafeReportId] [nvarchar](50) NULL,
	[ProjectId] [nvarchar](50) NULL,
	[ReportContent] [nvarchar](4000) NULL,
	[ReportManId] [nvarchar](50) NULL,
	[ReportTime] [datetime] NULL,
	[UpReportTime] [datetime] NULL,
	[States] [char](1) NULL,
 CONSTRAINT [PK_Manager_SafeReportItem] PRIMARY KEY CLUSTERED 
(
	[SafeReportItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Manager_SafeReportItem]  WITH CHECK ADD  CONSTRAINT [FK_Manager_SafeReportItem_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[Manager_SafeReportItem] CHECK CONSTRAINT [FK_Manager_SafeReportItem_Base_Project]
GO

ALTER TABLE [dbo].[Manager_SafeReportItem]  WITH CHECK ADD  CONSTRAINT [FK_Manager_SafeReportItem_Manager_SafeReport] FOREIGN KEY([SafeReportId])
REFERENCES [dbo].[Manager_SafeReport] ([SafeReportId])
GO

ALTER TABLE [dbo].[Manager_SafeReportItem] CHECK CONSTRAINT [FK_Manager_SafeReportItem_Manager_SafeReport]
GO

ALTER TABLE [dbo].[Manager_SafeReportItem]  WITH CHECK ADD  CONSTRAINT [FK_Manager_SafeReportItem_Sys_User] FOREIGN KEY([ReportManId])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[Manager_SafeReportItem] CHECK CONSTRAINT [FK_Manager_SafeReportItem_Sys_User]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'安全文件上报明细ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafeReportItem', @level2type=N'COLUMN',@level2name=N'SafeReportItemId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'安全文件上报ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafeReportItem', @level2type=N'COLUMN',@level2name=N'SafeReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafeReportItem', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'上报内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafeReportItem', @level2type=N'COLUMN',@level2name=N'ReportContent'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'上报人id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafeReportItem', @level2type=N'COLUMN',@level2name=N'ReportManId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafeReportItem', @level2type=N'COLUMN',@level2name=N'ReportTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'上报时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafeReportItem', @level2type=N'COLUMN',@level2name=N'UpReportTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafeReportItem', @level2type=N'COLUMN',@level2name=N'States'
GO

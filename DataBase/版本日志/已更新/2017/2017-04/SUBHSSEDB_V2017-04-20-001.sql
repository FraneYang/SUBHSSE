-- 安全生产月报（东华月报）
INSERT INTO Sys_MenuProjectA (MenuId,MenuName,Url,Icon,SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)  
VALUES('E18AF205-9C5B-40F8-B77B-B30C31B10BB5','安全生产月报','Manager/ManagerMonthD.aspx','PageHeaderFooter',27,'03235B30-960D-4FCF-99F7-97773A2EE108','Menu_Project',1,0)
GO
--安全生产月报（东华月报）按钮
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('A3DE3CF0-5D03-4FA7-B8A6-92ED7782BC78','E18AF205-9C5B-40F8-B77B-B30C31B10BB5','增加',1)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('1E646E62-0D92-449A-818A-F87D07ECD21B','E18AF205-9C5B-40F8-B77B-B30C31B10BB5','修改',2)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('69876C7A-8206-488F-B44A-671FA21DD795','E18AF205-9C5B-40F8-B77B-B30C31B10BB5','删除',3)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('E5B95B0A-0CE8-4145-971B-839FDCA66C5F','E18AF205-9C5B-40F8-B77B-B30C31B10BB5','保存',4)  
GO
-- 安全生产月报（东华月报）
INSERT INTO Sys_MenuProjectB (MenuId,MenuName,Url,Icon,SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)  
VALUES('E18AF205-9C5B-40F8-B77B-B30C31B10BB5','安全生产月报','Manager/ManagerMonthD.aspx','PageHeaderFooter',27,'03235B30-960D-4FCF-99F7-97773A2EE108','Menu_Project',1,0)
GO

--常量表:东华管理月报内容项
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('FF36D1CA-E87F-430C-9D9F-5ADF5629F656','MonthReportDEdit1.aspx','1 安委会会议纪要',1,'MonthReportDItem')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('967B0FD2-A834-48E0-9CD2-A645B439FEC1','MonthReportDEdit2.aspx','2 安全生产数据在线月报',2,'MonthReportDItem')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('5BEBEE49-0256-477B-A100-57F7C3581679','MonthReportDEdit3.aspx','3 月总结',3,'MonthReportDItem')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('A5EC533A-40B8-4AAE-8064-997553585A28','MonthReportDEdit4.aspx','4 环境与职业健康月报表',4,'MonthReportDItem')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('503A902F-73F8-4467-8976-470BD0EAB8CD','MonthReportDEdit5.aspx','5 安全工程师每日巡查记录表',5,'MonthReportDItem')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('8DC49F74-9F25-4EED-9B07-9AD8A1378FF1','MonthReportDEdit6.aspx','6 违规记录汇总表',6,'MonthReportDItem')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('69C20627-27C1-4EF1-9F9C-29032F98B17D','MonthReportDEdit7.aspx','7 施工单位月安全考核表',7,'MonthReportDItem')
GO

CREATE TABLE [dbo].[Manager_MonthReportD](
	[MonthReportId] [nvarchar](50) NOT NULL,
	[MonthReportCode] [nvarchar](50) NULL,
	[ProjectId] [nvarchar](50) NULL,
	[Months] [datetime] NULL,
	[MonthReportDate] [datetime] NULL,
	[ReportMan] [nvarchar](50) NULL,
 CONSTRAINT [PK_Manager_MonthReportD] PRIMARY KEY CLUSTERED 
(
	[MonthReportId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportD', @level2type=N'COLUMN',@level2name=N'MonthReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportD', @level2type=N'COLUMN',@level2name=N'MonthReportCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportD', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'月份' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportD', @level2type=N'COLUMN',@level2name=N'Months'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报告日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportD', @level2type=N'COLUMN',@level2name=N'MonthReportDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报告人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportD', @level2type=N'COLUMN',@level2name=N'ReportMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'安全生产月报' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportD'
GO

ALTER TABLE [dbo].[Manager_MonthReportD]  WITH CHECK ADD  CONSTRAINT [FK_Manager_MonthReportD_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[Manager_MonthReportD] CHECK CONSTRAINT [FK_Manager_MonthReportD_Base_Project]
GO

ALTER TABLE [dbo].[Manager_MonthReportD]  WITH CHECK ADD  CONSTRAINT [FK_Manager_MonthReportD_Sys_User] FOREIGN KEY([ReportMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[Manager_MonthReportD] CHECK CONSTRAINT [FK_Manager_MonthReportD_Sys_User]
GO

CREATE TABLE [dbo].[Manager_HSSEMeetingD](
	[HSSEMeetingId] [nvarchar](50) NOT NULL,
	[MonthReportId] [nvarchar](50) NULL,
	[MeetingContents] [nvarchar](max) NULL,
 CONSTRAINT [PK_Manager_HSSEMeetingD] PRIMARY KEY CLUSTERED 
(
	[HSSEMeetingId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HSSEMeetingD', @level2type=N'COLUMN',@level2name=N'HSSEMeetingId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'月报Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HSSEMeetingD', @level2type=N'COLUMN',@level2name=N'MonthReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'会议纪要内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HSSEMeetingD', @level2type=N'COLUMN',@level2name=N'MeetingContents'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'安委会会议纪要' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HSSEMeetingD'
GO

ALTER TABLE [dbo].[Manager_HSSEMeetingD]  WITH CHECK ADD  CONSTRAINT [FK_Manager_HSSEMeetingD_Manager_MonthReportD] FOREIGN KEY([MonthReportId])
REFERENCES [dbo].[Manager_MonthReportD] ([MonthReportId])
GO

ALTER TABLE [dbo].[Manager_HSSEMeetingD] CHECK CONSTRAINT [FK_Manager_HSSEMeetingD_Manager_MonthReportD]
GO

CREATE TABLE [dbo].[Manager_SafetyDataD](
	[SafetyDataId] [nvarchar](50) NOT NULL,
	[MonthReportId] [nvarchar](50) NULL,
	[ThisUnitPersonNum] [int] NULL,
	[ThisUnitHSEPersonNum] [int] NULL,
	[SubUnitPersonNum] [int] NULL,
	[SubUnitHSEPersonNum] [int] NULL,
	[ManHours] [int] NULL,
	[HSEManHours] [int] NULL,
	[LossHours] [int] NULL,
	[LossDay] [int] NULL,
	[DeathNum] [int] NULL,
	[SeriousInjuredNum] [int] NULL,
	[MinorInjuredNum] [int] NULL,
	[OtherNum] [int] NULL,
	[MedicalTreatmentNum] [int] NULL,
	[WorkLimitNum] [int] NULL,
	[FirstAidNum] [int] NULL,
	[AttemptedAccidentNum] [int] NULL,
	[PersonInjuredLossMoney] [decimal](18, 2) NULL,
	[FireNum] [int] NULL,
	[ExplosionNum] [int] NULL,
	[TrafficNum] [int] NULL,
	[EquipmentNum] [int] NULL,
	[SiteEnvironmentNum] [int] NULL,
	[TheftCaseNum] [int] NULL,
	[PropertyLossMoney] [decimal](18, 2) NULL,
	[MainBusinessIncome] [decimal](18, 2) NULL,
	[ConstructionIncome] [decimal](18, 2) NULL,
	[ProjectVolume] [decimal](18, 2) NULL,
	[PaidForMoney] [decimal](18, 2) NULL,
	[ApprovedChargesMoney] [decimal](18, 2) NULL,
	[HasBeenChargedMoney] [decimal](18, 2) NULL,
	[WeekMeetingNum] [int] NULL,
	[CommitteeMeetingNum] [int] NULL,
	[TrainPersonNum] [int] NULL,
	[WeekCheckNum] [int] NULL,
	[HSECheckNum] [int] NULL,
	[SpecialCheckNum] [int] NULL,
	[EquipmentHSEInspectionNum] [int] NULL,
	[LicenseNum] [int] NULL,
	[SolutionNum] [int] NULL,
	[ReleaseRectifyNum] [int] NULL,
	[CloseRectifyNum] [int] NULL,
	[ReleasePunishNum] [int] NULL,
	[PunishMoney] [decimal](18, 2) NULL,
	[EmergencyDrillNum] [int] NULL,
	[ParticipantsNum] [int] NULL,
	[DrillInput] [decimal](18, 2) NULL,
	[DrillTypes] [nvarchar](500) NULL,
 CONSTRAINT [PK_Manager_SafetyDataD] PRIMARY KEY CLUSTERED 
(
	[SafetyDataId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafetyDataD', @level2type=N'COLUMN',@level2name=N'SafetyDataId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'月报Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafetyDataD', @level2type=N'COLUMN',@level2name=N'MonthReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'本公司现场人数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafetyDataD', @level2type=N'COLUMN',@level2name=N'ThisUnitPersonNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'本公司现场HSE管理人数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafetyDataD', @level2type=N'COLUMN',@level2name=N'ThisUnitHSEPersonNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分包商现场人数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafetyDataD', @level2type=N'COLUMN',@level2name=N'SubUnitPersonNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分包商HSE管理人数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafetyDataD', @level2type=N'COLUMN',@level2name=N'SubUnitHSEPersonNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'人工时数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafetyDataD', @level2type=N'COLUMN',@level2name=N'ManHours'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'安全生产人工时数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafetyDataD', @level2type=N'COLUMN',@level2name=N'HSEManHours'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'损失工时数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafetyDataD', @level2type=N'COLUMN',@level2name=N'LossHours'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'损失工作日' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafetyDataD', @level2type=N'COLUMN',@level2name=N'LossDay'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'死亡人次' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafetyDataD', @level2type=N'COLUMN',@level2name=N'DeathNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'重伤人次' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafetyDataD', @level2type=N'COLUMN',@level2name=N'SeriousInjuredNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'轻松人次' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafetyDataD', @level2type=N'COLUMN',@level2name=N'MinorInjuredNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'其它人次' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafetyDataD', @level2type=N'COLUMN',@level2name=N'OtherNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'医疗处置工伤人次' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafetyDataD', @level2type=N'COLUMN',@level2name=N'MedicalTreatmentNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'工作受限工伤人次' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafetyDataD', @level2type=N'COLUMN',@level2name=N'WorkLimitNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'急救包扎事故人次' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafetyDataD', @level2type=N'COLUMN',@level2name=N'FirstAidNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'未遂事故起数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafetyDataD', @level2type=N'COLUMN',@level2name=N'AttemptedAccidentNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'人身伤害事故经济损失万元' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafetyDataD', @level2type=N'COLUMN',@level2name=N'PersonInjuredLossMoney'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'火灾事故起数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafetyDataD', @level2type=N'COLUMN',@level2name=N'FireNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'爆炸事故起数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafetyDataD', @level2type=N'COLUMN',@level2name=N'ExplosionNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'交通事故起数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafetyDataD', @level2type=N'COLUMN',@level2name=N'TrafficNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'机械设备事故起数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafetyDataD', @level2type=N'COLUMN',@level2name=N'EquipmentNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'现场环境事故起数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafetyDataD', @level2type=N'COLUMN',@level2name=N'SiteEnvironmentNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'现场发生设备材料盗窃案件' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafetyDataD', @level2type=N'COLUMN',@level2name=N'TheftCaseNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'财产损失' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafetyDataD', @level2type=N'COLUMN',@level2name=N'PropertyLossMoney'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主营业务收入亿元' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafetyDataD', @level2type=N'COLUMN',@level2name=N'MainBusinessIncome'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'施工收入亿元' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafetyDataD', @level2type=N'COLUMN',@level2name=N'ConstructionIncome'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'建安工程量（费）万元' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafetyDataD', @level2type=N'COLUMN',@level2name=N'ProjectVolume'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'已支付分承包商安全生产费用万元' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafetyDataD', @level2type=N'COLUMN',@level2name=N'PaidForMoney'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'已审核分承包商安全生产费用万元' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafetyDataD', @level2type=N'COLUMN',@level2name=N'ApprovedChargesMoney'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'东华项目部已投入的安全生产费用万元' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafetyDataD', @level2type=N'COLUMN',@level2name=N'HasBeenChargedMoney'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HSE每周会议次' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafetyDataD', @level2type=N'COLUMN',@level2name=N'WeekMeetingNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HSE委员会会议次' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafetyDataD', @level2type=N'COLUMN',@level2name=N'CommitteeMeetingNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'人员培训人次' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafetyDataD', @level2type=N'COLUMN',@level2name=N'TrainPersonNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目领导周安全检查次数次' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafetyDataD', @level2type=N'COLUMN',@level2name=N'WeekCheckNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'施工现场HSE联合检查次' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafetyDataD', @level2type=N'COLUMN',@level2name=N'HSECheckNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'专项安全检查次数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafetyDataD', @level2type=N'COLUMN',@level2name=N'SpecialCheckNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'设备HSE检验台/辆次' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafetyDataD', @level2type=N'COLUMN',@level2name=N'EquipmentHSEInspectionNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'安全作业许可证审批数量份' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafetyDataD', @level2type=N'COLUMN',@level2name=N'LicenseNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'审批专项施工方案数量项' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafetyDataD', @level2type=N'COLUMN',@level2name=N'SolutionNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发布HSE整改通知书份' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafetyDataD', @level2type=N'COLUMN',@level2name=N'ReleaseRectifyNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'关闭HSE整改通知书份' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafetyDataD', @level2type=N'COLUMN',@level2name=N'CloseRectifyNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发布HSE处罚书份' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafetyDataD', @level2type=N'COLUMN',@level2name=N'ReleasePunishNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'罚款金额元' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafetyDataD', @level2type=N'COLUMN',@level2name=N'PunishMoney'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'应急演练次数份次' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafetyDataD', @level2type=N'COLUMN',@level2name=N'EmergencyDrillNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'参演人次数人次' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafetyDataD', @level2type=N'COLUMN',@level2name=N'ParticipantsNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'演练直接投入万元' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafetyDataD', @level2type=N'COLUMN',@level2name=N'DrillInput'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'演练类型与方式' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafetyDataD', @level2type=N'COLUMN',@level2name=N'DrillTypes'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'安全生产数据在线月报' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafetyDataD'
GO

ALTER TABLE [dbo].[Manager_SafetyDataD]  WITH CHECK ADD  CONSTRAINT [FK_Manager_SafetyDataD_Manager_MonthReportD] FOREIGN KEY([MonthReportId])
REFERENCES [dbo].[Manager_MonthReportD] ([MonthReportId])
GO

ALTER TABLE [dbo].[Manager_SafetyDataD] CHECK CONSTRAINT [FK_Manager_SafetyDataD_Manager_MonthReportD]
GO



CREATE TABLE [dbo].[Manager_MonthSummaryD](
	[MonthSummaryId] [nvarchar](50) NOT NULL,
	[MonthReportId] [nvarchar](50) NULL,
	[FileContents] [nvarchar](max) NULL,
 CONSTRAINT [PK_Manager_MonthSummary] PRIMARY KEY CLUSTERED 
(
	[MonthSummaryId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthSummaryD', @level2type=N'COLUMN',@level2name=N'MonthSummaryId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'月报Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthSummaryD', @level2type=N'COLUMN',@level2name=N'MonthReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthSummaryD', @level2type=N'COLUMN',@level2name=N'FileContents'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'月总结' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthSummaryD'
GO

ALTER TABLE [dbo].[Manager_MonthSummaryD]  WITH CHECK ADD  CONSTRAINT [FK_Manager_MonthSummary_Manager_MonthReportD] FOREIGN KEY([MonthReportId])
REFERENCES [dbo].[Manager_MonthReportD] ([MonthReportId])
GO

ALTER TABLE [dbo].[Manager_MonthSummaryD] CHECK CONSTRAINT [FK_Manager_MonthSummary_Manager_MonthReportD]
GO



CREATE TABLE [dbo].[Manager_EnvironmentalHealthMonthlyD](
	[EnvironmentalHealthMonthlyId] [nvarchar](50) NOT NULL,
	[MonthReportId] [nvarchar](50) NULL,
	[FileContents] [nvarchar](max) NULL,
 CONSTRAINT [PK_Manager_EnvironmentalHealthMonthlyD] PRIMARY KEY CLUSTERED 
(
	[EnvironmentalHealthMonthlyId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_EnvironmentalHealthMonthlyD', @level2type=N'COLUMN',@level2name=N'EnvironmentalHealthMonthlyId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'月报Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_EnvironmentalHealthMonthlyD', @level2type=N'COLUMN',@level2name=N'MonthReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'环境与职业健康月报表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_EnvironmentalHealthMonthlyD'
GO

ALTER TABLE [dbo].[Manager_EnvironmentalHealthMonthlyD]  WITH CHECK ADD  CONSTRAINT [FK_Manager_EnvironmentalHealthMonthlyD_Manager_MonthReportD] FOREIGN KEY([MonthReportId])
REFERENCES [dbo].[Manager_MonthReportD] ([MonthReportId])
GO

ALTER TABLE [dbo].[Manager_EnvironmentalHealthMonthlyD] CHECK CONSTRAINT [FK_Manager_EnvironmentalHealthMonthlyD_Manager_MonthReportD]
GO

CREATE TABLE [dbo].[Manager_CheckDayRecordD](
	[CheckDayRecordId] [nvarchar](50) NOT NULL,
	[MonthReportId] [nvarchar](50) NULL,
	[FileContents] [nvarchar](max) NULL,
 CONSTRAINT [PK_Manager_CheckDayRecordD] PRIMARY KEY CLUSTERED 
(
	[CheckDayRecordId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_CheckDayRecordD', @level2type=N'COLUMN',@level2name=N'CheckDayRecordId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'月报主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_CheckDayRecordD', @level2type=N'COLUMN',@level2name=N'MonthReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'安全工程师每日巡查记录表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_CheckDayRecordD'
GO

ALTER TABLE [dbo].[Manager_CheckDayRecordD]  WITH CHECK ADD  CONSTRAINT [FK_Manager_CheckDayRecordD_Manager_MonthReportD] FOREIGN KEY([MonthReportId])
REFERENCES [dbo].[Manager_MonthReportD] ([MonthReportId])
GO

ALTER TABLE [dbo].[Manager_CheckDayRecordD] CHECK CONSTRAINT [FK_Manager_CheckDayRecordD_Manager_MonthReportD]
GO



CREATE TABLE [dbo].[Manager_ViolationRecordD](
	[ViolationRecordId] [nvarchar](50) NOT NULL,
	[MonthReportId] [nvarchar](50) NULL,
	[FileContents] [nvarchar](max) NULL,
 CONSTRAINT [PK_Manager_ViolationRecordD] PRIMARY KEY CLUSTERED 
(
	[ViolationRecordId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_ViolationRecordD', @level2type=N'COLUMN',@level2name=N'ViolationRecordId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'月报Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_ViolationRecordD', @level2type=N'COLUMN',@level2name=N'MonthReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'违规记录汇总表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_ViolationRecordD'
GO



CREATE TABLE [dbo].[Manager_MonthSafetyRecordD](
	[MonthSafetyRecordId] [nvarchar](50) NOT NULL,
	[MonthReportId] [nvarchar](50) NULL,
	[FileContents] [nvarchar](max) NULL,
 CONSTRAINT [PK_Manager_MonthSafetyRecordD] PRIMARY KEY CLUSTERED 
(
	[MonthSafetyRecordId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthSafetyRecordD', @level2type=N'COLUMN',@level2name=N'MonthSafetyRecordId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'月报Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthSafetyRecordD', @level2type=N'COLUMN',@level2name=N'MonthReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'施工单位月安全考核表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthSafetyRecordD'
GO

ALTER TABLE [dbo].[Manager_MonthSafetyRecordD]  WITH CHECK ADD  CONSTRAINT [FK_Manager_MonthSafetyRecordD_Manager_MonthReportD] FOREIGN KEY([MonthReportId])
REFERENCES [dbo].[Manager_MonthReportD] ([MonthReportId])
GO

ALTER TABLE [dbo].[Manager_MonthSafetyRecordD] CHECK CONSTRAINT [FK_Manager_MonthSafetyRecordD_Manager_MonthReportD]
GO

INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('38FBBA77-8B35-470C-90EE-6861E6DDE03F','日常巡检(记录)','Check/CheckDayXA.aspx','PageHeaderFooter',25,'467A0CB9-737D-4451-965E-869EBC3A4BD6','Menu_Project',1,0)
GO
--日常巡检按钮
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('5B20746A-19B6-443A-876F-36BC7781AF23','38FBBA77-8B35-470C-90EE-6861E6DDE03F','增加',1)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('6871BDF0-DF82-4DC4-A955-A4273514E937','38FBBA77-8B35-470C-90EE-6861E6DDE03F','修改',2)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('85C79C78-B586-4652-B0A1-A8944BC61F2E','38FBBA77-8B35-470C-90EE-6861E6DDE03F','删除',3)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('42BA1A15-60B1-4879-9A62-319271D4B0C3','38FBBA77-8B35-470C-90EE-6861E6DDE03F','保存',4)
GO
INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('38FBBA77-8B35-470C-90EE-6861E6DDE03F','日常巡检(记录)','Check/CheckDayXA.aspx','PageHeaderFooter',25,'467A0CB9-737D-4451-965E-869EBC3A4BD6','Menu_Project',1,0)
GO
	
	
	
CREATE TABLE [dbo].[Check_CheckDayXA](
	[CheckDayId] [nvarchar](50) NOT NULL,
	[CheckDayCode] [nvarchar](50) NULL,
	[ProjectId] [nvarchar](50) NULL,
	[NotOKNum] [int] NULL,
	[DutyUnitIds] [nvarchar](1000) NULL,
	[DutyTeamGroupIds] [nvarchar](1000) NULL,
	[WorkAreaIds] [nvarchar](1000) NULL,
	[Unqualified] [ntext] NULL,
	[CompileMan] [nvarchar](50) NULL,
	[CompileUnit] [nvarchar](50) NULL,
	[CheckDate] [datetime] NULL,
	[HandleStation] [ntext] NULL,
	[IsOK] [bit] NULL,
	[States] [char](1) NULL,
 CONSTRAINT [PK_Check_CheckDayXA] PRIMARY KEY CLUSTERED 
(
	[CheckDayId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckDayXA', @level2type=N'COLUMN',@level2name=N'CheckDayId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckDayXA', @level2type=N'COLUMN',@level2name=N'CheckDayCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckDayXA', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'不合格数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckDayXA', @level2type=N'COLUMN',@level2name=N'NotOKNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'责任单位' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckDayXA', @level2type=N'COLUMN',@level2name=N'DutyUnitIds'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'责任班组' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckDayXA', @level2type=N'COLUMN',@level2name=N'DutyTeamGroupIds'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'检查区域' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckDayXA', @level2type=N'COLUMN',@level2name=N'WorkAreaIds'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'不合格项描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckDayXA', @level2type=N'COLUMN',@level2name=N'Unqualified'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckDayXA', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制人单位' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckDayXA', @level2type=N'COLUMN',@level2name=N'CompileUnit'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'检查日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckDayXA', @level2type=N'COLUMN',@level2name=N'CheckDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'整改完成情况' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckDayXA', @level2type=N'COLUMN',@level2name=N'HandleStation'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否闭环' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckDayXA', @level2type=N'COLUMN',@level2name=N'IsOK'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'新奥日常巡检表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckDayXA'
GO

ALTER TABLE [dbo].[Check_CheckDayXA]  WITH CHECK ADD  CONSTRAINT [FK_Check_CheckDayXA_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[Check_CheckDayXA] CHECK CONSTRAINT [FK_Check_CheckDayXA_Base_Project]
GO

ALTER TABLE [dbo].[Check_CheckDayXA]  WITH CHECK ADD  CONSTRAINT [FK_Check_CheckDayXA_Base_Unit] FOREIGN KEY([CompileUnit])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[Check_CheckDayXA] CHECK CONSTRAINT [FK_Check_CheckDayXA_Base_Unit]
GO

ALTER TABLE [dbo].[Check_CheckDayXA]  WITH CHECK ADD  CONSTRAINT [FK_Check_CheckDayXA_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[Check_CheckDayXA] CHECK CONSTRAINT [FK_Check_CheckDayXA_Sys_User]
GO




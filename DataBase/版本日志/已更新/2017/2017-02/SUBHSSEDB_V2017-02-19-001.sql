--INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
--VALUES('363EB208-7BB1-4A55-85F3-2501B2F10B45','�����±�B','Manager/ManagerMonthB.aspx','PageHeaderFooter',25,'03235B30-960D-4FCF-99F7-97773A2EE108','Menu_Project',1,0)
--GO
-- �����±�C
INSERT INTO Sys_MenuProjectA (MenuId,MenuName,Url,Icon,SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)  
VALUES('68A52EEA-2661-4CB0-9382-A36AA5DCC480','�����±�C','Manager/ManagerMonthC.aspx','PageHeaderFooter',26,'03235B30-960D-4FCF-99F7-97773A2EE108','Menu_Project',1,0)
GO
INSERT INTO Sys_MenuProjectB (MenuId,MenuName,Url,Icon,SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)  
VALUES('68A52EEA-2661-4CB0-9382-A36AA5DCC480','�����±�C','Manager/ManagerMonthC.aspx','PageHeaderFooter',26,'03235B30-960D-4FCF-99F7-97773A2EE108','Menu_Project',1,0)
GO

--�����±�C��ť
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('3F7582F7-4561-4AFD-8C6F-935D357E8C8D','68A52EEA-2661-4CB0-9382-A36AA5DCC480','����',1)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('574FE513-616B-4E26-87F8-B8DD28E9726F','68A52EEA-2661-4CB0-9382-A36AA5DCC480','�޸�',2)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('62C0921F-4289-4D28-8FC0-7CD66D5F62D8','68A52EEA-2661-4CB0-9382-A36AA5DCC480','ɾ��',3)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('CC9C6111-FAC8-4D92-8C10-63132F6AF586','68A52EEA-2661-4CB0-9382-A36AA5DCC480','����',4)  
GO

alter table dbo.Meeting_WeekMeeting add MeetingHours decimal(9,1) null
alter table dbo.Meeting_WeekMeeting add MeetingHostMan nvarchar(50) null
alter table dbo.Meeting_WeekMeeting add AttentPerson nvarchar(300) null
alter table dbo.Meeting_MonthMeeting add MeetingHours decimal(9,1) null
alter table dbo.Meeting_MonthMeeting add MeetingHostMan nvarchar(50) null
alter table dbo.Meeting_MonthMeeting add AttentPerson nvarchar(300) null
alter table dbo.Meeting_SpecialMeeting add MeetingHours decimal(9,1) null
alter table dbo.Meeting_SpecialMeeting add MeetingHostMan nvarchar(50) null
alter table dbo.Meeting_SpecialMeeting add AttentPerson nvarchar(300) null
alter table dbo.Meeting_AttendMeeting add MeetingHours decimal(9,1) null
alter table dbo.Meeting_AttendMeeting add MeetingHostMan nvarchar(50) null
alter table dbo.Meeting_AttendMeeting add AttentPerson nvarchar(300) null
GO

alter table dbo.Accident_AccidentReport add WorkArea nvarchar(200) null
alter table dbo.Accident_AccidentReportOther add WorkArea nvarchar(200) null
alter table dbo.Manager_MonthReportB add TotalLargerHazardNun int null
alter table dbo.Manager_MonthReportB add TotalIsArgumentLargerHazardNun int null
GO

CREATE TABLE [dbo].[Manager_MonthReportC](
	[MonthReportId] [nvarchar](50) NOT NULL,
	[MonthReportCode] [nvarchar](30) NULL,
	[ProjectId] [nvarchar](50) NULL,
	[Months] [datetime] NULL,
	[MonthReportDate] [datetime] NULL,
	[ReportMan] [nvarchar](50) NULL,
	[HseManhours] [int] NULL,
	[TotalHseManhours] [int] NULL,
	[HseActiveReview] [nvarchar](3000) NULL,
	[HseActiveKey] [nvarchar](3000) NULL,
	[SafetyManhours] [int] NULL,
	[TotalManNum] [int] NULL,
	[ScanUrl] [nvarchar](1000) NULL,
	[PlanCost] [money] NULL,
	[RealCost] [money] NULL,
	[TotalRealCost] [money] NULL,
	[MonthReportName] [nvarchar](100) NULL,
	[FileContent] [image] NULL,
	[MonthHSEDay] [int] NULL,
	[SumHSEDay] [int] NULL,
	[MonthHSEWorkDay] [int] NULL,
	[YearHSEWorkDay] [int] NULL,
	[SumHSEWorkDay] [int] NULL,
	[HazardNum] [int] NULL,
	[YearHazardNum] [int] NULL,
	[MeetingNum] [int] NULL,
	[YearMeetingNum] [int] NULL,
	[PromotionalActiviteNum] [int] NULL,
	[YearPromotionalActiviteNum] [int] NULL,
	[ComplexEmergencyNum] [int] NULL,
	[YearComplexEmergencyNum] [int] NULL,
	[SpecialEmergencyNum] [int] NULL,
	[YearSpecialEmergencyNum] [int] NULL,
	[DrillRecordNum] [int] NULL,
	[YearDrillRecordNum] [int] NULL,
	[LicenseNum] [int] NULL,
	[YearLicenseNum] [int] NULL,
	[EquipmentNum] [int] NULL,
	[YearEquipmentNum] [int] NULL,
	[LicenseRemark] [ntext] NULL,
	[EquipmentRemark] [ntext] NULL,
	[RewardNum] [int] NULL,
	[YearRewardNum] [int] NULL,
	[RewardMoney] [int] NULL,
	[YearRewardMoney] [int] NULL,
	[PunishNum] [int] NULL,
	[YearPunishNum] [int] NULL,
	[PunishMoney] [int] NULL,
	[YearPunishMoney] [int] NULL,
	[ActionPlanNum] [int] NULL,
	[YearActionPlanNum] [int] NULL,
	[MonthSolutionNum] [int] NULL,
	[YearSolutionNum] [int] NULL,
	[AccidentDes] [ntext] NULL,
	[Question] [ntext] NULL,
	[SubcontractManHours] [int] NULL,
 CONSTRAINT [PK_Manager_MonthReportC] PRIMARY KEY CLUSTERED 
(
	[MonthReportId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportC', @level2type=N'COLUMN',@level2name=N'MonthReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�±�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportC', @level2type=N'COLUMN',@level2name=N'MonthReportCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��Ŀ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportC', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�·�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportC', @level2type=N'COLUMN',@level2name=N'Months'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�±�������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportC', @level2type=N'COLUMN',@level2name=N'MonthReportDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportC', @level2type=N'COLUMN',@level2name=N'ReportMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����Hse�˹�ʱ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportC', @level2type=N'COLUMN',@level2name=N'HseManhours'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����HSE�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportC', @level2type=N'COLUMN',@level2name=N'HseActiveReview'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����HSE��ص��ע' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportC', @level2type=N'COLUMN',@level2name=N'HseActiveKey'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�±�������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportC'
GO

ALTER TABLE [dbo].[Manager_MonthReportC]  WITH CHECK ADD  CONSTRAINT [FK_Manager_MonthReportC_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[Manager_MonthReportC] CHECK CONSTRAINT [FK_Manager_MonthReportC_Base_Project]
GO

ALTER TABLE [dbo].[Manager_MonthReportC]  WITH CHECK ADD  CONSTRAINT [FK_Manager_MonthReportC_Sys_User] FOREIGN KEY([ReportMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[Manager_MonthReportC] CHECK CONSTRAINT [FK_Manager_MonthReportC_Sys_User]
GO

CREATE TABLE [dbo].[Manager_Month_AccidentDesciptionC](
	[AccidentDesId] [nvarchar](50) NOT NULL,
	[MonthReportId] [nvarchar](50) NOT NULL,
	[Matter] [nvarchar](50) NULL,
	[MonthDataNum] [int] NULL,
	[YearDataNum] [int] NULL,
	[SortIndex] [int] NULL,
 CONSTRAINT [PK_Manager_Month_AccidentDesciptionC] PRIMARY KEY CLUSTERED 
(
	[AccidentDesId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_AccidentDesciptionC', @level2type=N'COLUMN',@level2name=N'AccidentDesId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�±�Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_AccidentDesciptionC', @level2type=N'COLUMN',@level2name=N'MonthReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_AccidentDesciptionC', @level2type=N'COLUMN',@level2name=N'Matter'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_AccidentDesciptionC', @level2type=N'COLUMN',@level2name=N'MonthDataNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����ۼ�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_AccidentDesciptionC', @level2type=N'COLUMN',@level2name=N'YearDataNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_AccidentDesciptionC', @level2type=N'COLUMN',@level2name=N'SortIndex'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�¹�������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_AccidentDesciptionC'
GO

ALTER TABLE [dbo].[Manager_Month_AccidentDesciptionC]  WITH CHECK ADD  CONSTRAINT [FK_Manager_Month_AccidentDesciptionC_Manager_MonthReport] FOREIGN KEY([MonthReportId])
REFERENCES [dbo].[Manager_MonthReportC] ([MonthReportId])
GO

ALTER TABLE [dbo].[Manager_Month_AccidentDesciptionC] CHECK CONSTRAINT [FK_Manager_Month_AccidentDesciptionC_Manager_MonthReport]
GO

CREATE TABLE [dbo].[Manager_Month_AccidentDesciptionItemC](
	[AccidentDesItemId] [nvarchar](50) NOT NULL,
	[MonthReportId] [nvarchar](50) NOT NULL,
	[Matter] [nvarchar](50) NULL,
	[Datas] [nvarchar](50) NULL,
	[SortIndex] [int] NULL,
 CONSTRAINT [PK_Manager_Month_AccidentDesciptionItemC] PRIMARY KEY CLUSTERED 
(
	[AccidentDesItemId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_AccidentDesciptionItemC', @level2type=N'COLUMN',@level2name=N'AccidentDesItemId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�±�Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_AccidentDesciptionItemC', @level2type=N'COLUMN',@level2name=N'MonthReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_AccidentDesciptionItemC', @level2type=N'COLUMN',@level2name=N'Matter'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_AccidentDesciptionItemC', @level2type=N'COLUMN',@level2name=N'Datas'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_AccidentDesciptionItemC', @level2type=N'COLUMN',@level2name=N'SortIndex'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����Ч����ͳ�Ʊ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_AccidentDesciptionItemC'
GO

ALTER TABLE [dbo].[Manager_Month_AccidentDesciptionItemC]  WITH CHECK ADD  CONSTRAINT [FK_Manager_Month_AccidentDesciptionItemC_Manager_MonthReport] FOREIGN KEY([MonthReportId])
REFERENCES [dbo].[Manager_MonthReportC] ([MonthReportId])
GO

ALTER TABLE [dbo].[Manager_Month_AccidentDesciptionItemC] CHECK CONSTRAINT [FK_Manager_Month_AccidentDesciptionItemC_Manager_MonthReport]
GO

CREATE TABLE [dbo].[Manager_AccidentSortC](
	[AccidentSortId] [nvarchar](50) NOT NULL,
	[MonthReportId] [nvarchar](50) NULL,
	[AccidentType] [nvarchar](50) NULL,
	[TypeFlag] [char](1) NULL,
	[Number] [int] NULL,
	[TotalNum] [int] NULL,
	[LoseHours] [int] NULL,
	[TotalLoseHours] [int] NULL,
	[LoseMoney] [money] NULL,
	[TotalLoseMoney] [money] NULL,
 CONSTRAINT [PK_Manager_AccidentCSort] PRIMARY KEY CLUSTERED 
(
	[AccidentSortId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_AccidentSortC', @level2type=N'COLUMN',@level2name=N'AccidentSortId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�±���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_AccidentSortC', @level2type=N'COLUMN',@level2name=N'MonthReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�¹�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_AccidentSortC', @level2type=N'COLUMN',@level2name=N'AccidentType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���ͱ�־(1-��Ӧ��ʧ��ʱ,2-��Ӧ��ʧ���)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_AccidentSortC', @level2type=N'COLUMN',@level2name=N'TypeFlag'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_AccidentSortC', @level2type=N'COLUMN',@level2name=N'Number'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ۼƷ�������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_AccidentSortC', @level2type=N'COLUMN',@level2name=N'TotalNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ʧ��ʱ(����)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_AccidentSortC', @level2type=N'COLUMN',@level2name=N'LoseHours'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ۼ���ʧ��ʱ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_AccidentSortC', @level2type=N'COLUMN',@level2name=N'TotalLoseHours'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ʧ���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_AccidentSortC', @level2type=N'COLUMN',@level2name=N'LoseMoney'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ۼ���ʧ���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_AccidentSortC', @level2type=N'COLUMN',@level2name=N'TotalLoseMoney'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�±����¹ʷ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_AccidentSortC'
GO

ALTER TABLE [dbo].[Manager_AccidentSortC]  WITH CHECK ADD  CONSTRAINT [FK_Manager_AccidentCSort_Manager_MonthReport] FOREIGN KEY([MonthReportId])
REFERENCES [dbo].[Manager_MonthReportC] ([MonthReportId])
GO

ALTER TABLE [dbo].[Manager_AccidentSortC] CHECK CONSTRAINT [FK_Manager_AccidentCSort_Manager_MonthReport]
GO

CREATE TABLE [dbo].[Manager_Month_ActivitiesC](
	[ActivitiesId] [nvarchar](50) NOT NULL,
	[MonthReportId] [nvarchar](50) NOT NULL,
	[ActivitiesTitle] [nvarchar](200) NULL,
	[ActivitiesDate] [nvarchar](20) NULL,
	[Unit] [nvarchar](150) NULL,
	[Remark] [nvarchar](200) NULL,
	[SortIndex] [int] NULL,
 CONSTRAINT [PK_Manager_Month_ActivitiesC] PRIMARY KEY CLUSTERED 
(
	[ActivitiesId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_ActivitiesC', @level2type=N'COLUMN',@level2name=N'ActivitiesId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�±�Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_ActivitiesC', @level2type=N'COLUMN',@level2name=N'MonthReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ƻ���չ�Ļ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_ActivitiesC', @level2type=N'COLUMN',@level2name=N'ActivitiesTitle'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_ActivitiesC', @level2type=N'COLUMN',@level2name=N'ActivitiesDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�μӵ�λ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_ActivitiesC', @level2type=N'COLUMN',@level2name=N'Unit'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ע' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_ActivitiesC', @level2type=N'COLUMN',@level2name=N'Remark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_ActivitiesC', @level2type=N'COLUMN',@level2name=N'SortIndex'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HSE���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_ActivitiesC'
GO

ALTER TABLE [dbo].[Manager_Month_ActivitiesC]  WITH CHECK ADD  CONSTRAINT [FK_Manager_Month_ActivitiesC_Manager_Month_ActivitiesC] FOREIGN KEY([MonthReportId])
REFERENCES [dbo].[Manager_MonthReportC] ([MonthReportId])
GO

ALTER TABLE [dbo].[Manager_Month_ActivitiesC] CHECK CONSTRAINT [FK_Manager_Month_ActivitiesC_Manager_Month_ActivitiesC]
GO

CREATE TABLE [dbo].[Manager_Month_ActivityDesC](
	[ActivityDesId] [nvarchar](50) NOT NULL,
	[MonthReportId] [nvarchar](50) NULL,
	[ActivityTheme] [nvarchar](100) NULL,
	[ActivityDate] [nvarchar](20) NULL,
	[UnitName] [nvarchar](70) NULL,
	[EffectDes] [nvarchar](200) NULL,
	[SortIndex] [int] NULL,
 CONSTRAINT [PK_Manager_Month_ActivityDesC] PRIMARY KEY CLUSTERED 
(
	[ActivityDesId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_ActivityDesC', @level2type=N'COLUMN',@level2name=N'ActivityDesId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�±�Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_ActivityDesC', @level2type=N'COLUMN',@level2name=N'MonthReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_ActivityDesC', @level2type=N'COLUMN',@level2name=N'ActivityTheme'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_ActivityDesC', @level2type=N'COLUMN',@level2name=N'ActivityDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�μӵ�λ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_ActivityDesC', @level2type=N'COLUMN',@level2name=N'UnitName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�Ч������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_ActivityDesC', @level2type=N'COLUMN',@level2name=N'EffectDes'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_ActivityDesC', @level2type=N'COLUMN',@level2name=N'SortIndex'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����˵����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_ActivityDesC'
GO

ALTER TABLE [dbo].[Manager_Month_ActivityDesC]  WITH CHECK ADD  CONSTRAINT [FK_Manager_Month_ActivityDesC_Manager_MonthReport] FOREIGN KEY([MonthReportId])
REFERENCES [dbo].[Manager_MonthReportC] ([MonthReportId])
GO

ALTER TABLE [dbo].[Manager_Month_ActivityDesC] CHECK CONSTRAINT [FK_Manager_Month_ActivityDesC_Manager_MonthReport]
GO

CREATE TABLE [dbo].[Manager_Month_CheckC](
	[CheckId] [nvarchar](50) NOT NULL,
	[MonthReportId] [nvarchar](50) NOT NULL,
	[CheckType] [nvarchar](50) NULL,
	[Inspectors] [nvarchar](50) NULL,
	[CheckDate] [nvarchar](20) NULL,
	[Remark] [nvarchar](150) NULL,
	[SortIndex] [int] NULL,
 CONSTRAINT [PK_Manager_Month_CheckC] PRIMARY KEY CLUSTERED 
(
	[CheckId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_CheckC', @level2type=N'COLUMN',@level2name=N'CheckId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�±�Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_CheckC', @level2type=N'COLUMN',@level2name=N'MonthReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���¼ƻ���չ�ļ������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_CheckC', @level2type=N'COLUMN',@level2name=N'CheckType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�μ���Ա' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_CheckC', @level2type=N'COLUMN',@level2name=N'Inspectors'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ƻ���չʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_CheckC', @level2type=N'COLUMN',@level2name=N'CheckDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ע' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_CheckC', @level2type=N'COLUMN',@level2name=N'Remark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_CheckC', @level2type=N'COLUMN',@level2name=N'SortIndex'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HSE����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_CheckC'
GO

ALTER TABLE [dbo].[Manager_Month_CheckC]  WITH CHECK ADD  CONSTRAINT [FK_Manager_Month_CheckC_Manager_MonthReport] FOREIGN KEY([MonthReportId])
REFERENCES [dbo].[Manager_MonthReportC] ([MonthReportId])
GO

ALTER TABLE [dbo].[Manager_Month_CheckC] CHECK CONSTRAINT [FK_Manager_Month_CheckC_Manager_MonthReport]
GO

CREATE TABLE [dbo].[Manager_CheckDetailSortC](
	[CheckDetailSortId] [nvarchar](50) NOT NULL,
	[MonthReportId] [nvarchar](50) NULL,
	[SortIndex] [int] NULL,
	[CheckType] [nvarchar](100) NULL,
	[CheckTime] [nvarchar](100) NULL,
	[JoinUnit] [nvarchar](200) NULL,
	[StateDef] [nvarchar](500) NULL,
 CONSTRAINT [PK_Manager_CheckDetailSortC] PRIMARY KEY CLUSTERED 
(
	[CheckDetailSortId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_CheckDetailSortC', @level2type=N'COLUMN',@level2name=N'CheckDetailSortId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_CheckDetailSortC', @level2type=N'COLUMN',@level2name=N'MonthReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_CheckDetailSortC', @level2type=N'COLUMN',@level2name=N'SortIndex'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_CheckDetailSortC', @level2type=N'COLUMN',@level2name=N'CheckType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_CheckDetailSortC', @level2type=N'COLUMN',@level2name=N'CheckTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�μӵ�λ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_CheckDetailSortC', @level2type=N'COLUMN',@level2name=N'JoinUnit'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_CheckDetailSortC', @level2type=N'COLUMN',@level2name=N'StateDef'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������ϸ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_CheckDetailSortC'
GO

ALTER TABLE [dbo].[Manager_CheckDetailSortC]  WITH CHECK ADD  CONSTRAINT [FK_Manager_CheckDetailSortC_Manager_MonthReport] FOREIGN KEY([MonthReportId])
REFERENCES [dbo].[Manager_MonthReportC] ([MonthReportId])
GO

ALTER TABLE [dbo].[Manager_CheckDetailSortC] CHECK CONSTRAINT [FK_Manager_CheckDetailSortC_Manager_MonthReport]
GO

CREATE TABLE [dbo].[Manager_CheckSortC](
	[CheckSortId] [nvarchar](50) NOT NULL,
	[MonthReportId] [nvarchar](50) NULL,
	[CheckType] [nvarchar](30) NULL,
	[CheckNumber] [int] NULL,
	[TotalCheckNum] [int] NULL,
	[ViolationNumber] [int] NULL,
	[YearCheckNum] [int] NULL,
	[YearViolationNum] [int] NULL,
	[SortIndex] [int] NULL,
 CONSTRAINT [PK_Manager_CheckSortC] PRIMARY KEY CLUSTERED 
(
	[CheckSortId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_CheckSortC', @level2type=N'COLUMN',@level2name=N'CheckSortId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�±���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_CheckSortC', @level2type=N'COLUMN',@level2name=N'MonthReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ȫ�������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_CheckSortC', @level2type=N'COLUMN',@level2name=N'CheckType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������(����)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_CheckSortC', @level2type=N'COLUMN',@level2name=N'CheckNumber'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ܼ�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_CheckSortC', @level2type=N'COLUMN',@level2name=N'TotalCheckNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Υ������(����)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_CheckSortC', @level2type=N'COLUMN',@level2name=N'ViolationNumber'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�±���HSE��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_CheckSortC'
GO

ALTER TABLE [dbo].[Manager_CheckSortC]  WITH CHECK ADD  CONSTRAINT [FK_Manager_CheckSortC_Manager_MonthReport] FOREIGN KEY([MonthReportId])
REFERENCES [dbo].[Manager_MonthReportC] ([MonthReportId])
GO

ALTER TABLE [dbo].[Manager_CheckSortC] CHECK CONSTRAINT [FK_Manager_CheckSortC_Manager_MonthReport]
GO

CREATE TABLE [dbo].[Manager_Month_CostInvestmentPlanC](
	[CostInvestmentPlanId] [nvarchar](50) NOT NULL,
	[MonthReportId] [nvarchar](50) NOT NULL,
	[InvestmentProject] [nvarchar](150) NULL,
	[MainPlanCost] [decimal](18, 1) NULL,
	[SubPlanCost] [decimal](18, 1) NULL,
	[SortIndex] [int] NULL,
 CONSTRAINT [PK_Manager_Month_CostInvestmentPlanC] PRIMARY KEY CLUSTERED 
(
	[CostInvestmentPlanId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_CostInvestmentPlanC', @level2type=N'COLUMN',@level2name=N'CostInvestmentPlanId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�±�Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_CostInvestmentPlanC', @level2type=N'COLUMN',@level2name=N'MonthReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ͷ����Ŀ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_CostInvestmentPlanC', @level2type=N'COLUMN',@level2name=N'InvestmentProject'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ƻ����ã���Ԫ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_CostInvestmentPlanC', @level2type=N'COLUMN',@level2name=N'MainPlanCost'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_CostInvestmentPlanC', @level2type=N'COLUMN',@level2name=N'SortIndex'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HSE����Ͷ��ƻ���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_CostInvestmentPlanC'
GO

ALTER TABLE [dbo].[Manager_Month_CostInvestmentPlanC]  WITH CHECK ADD  CONSTRAINT [FK_Manager_Month_CostInvestmentPlanC_Manager_MonthReport] FOREIGN KEY([MonthReportId])
REFERENCES [dbo].[Manager_MonthReportC] ([MonthReportId])
GO

ALTER TABLE [dbo].[Manager_Month_CostInvestmentPlanC] CHECK CONSTRAINT [FK_Manager_Month_CostInvestmentPlanC_Manager_MonthReport]
GO

CREATE TABLE [dbo].[Manager_DrillSortC](
	[DrillSortId] [nvarchar](50) NOT NULL,
	[MonthReportId] [nvarchar](50) NULL,
	[SortIndex] [int] NULL,
	[DrillContent] [nvarchar](500) NULL,
	[DrillDate] [nvarchar](50) NULL,
	[JointUnit] [nvarchar](100) NULL,
	[JoinPerson] [nvarchar](50) NULL,
 CONSTRAINT [PK_Manager_DrillSortC] PRIMARY KEY CLUSTERED 
(
	[DrillSortId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_DrillSortC', @level2type=N'COLUMN',@level2name=N'DrillSortId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_DrillSortC', @level2type=N'COLUMN',@level2name=N'MonthReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_DrillSortC', @level2type=N'COLUMN',@level2name=N'SortIndex'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_DrillSortC', @level2type=N'COLUMN',@level2name=N'DrillContent'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_DrillSortC', @level2type=N'COLUMN',@level2name=N'DrillDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�μӵ�λ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_DrillSortC', @level2type=N'COLUMN',@level2name=N'JointUnit'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�μ�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_DrillSortC', @level2type=N'COLUMN',@level2name=N'JoinPerson'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�±�Ӧ��������ϸ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_DrillSortC'
GO

ALTER TABLE [dbo].[Manager_DrillSortC]  WITH CHECK ADD  CONSTRAINT [FK_Manager_DrillSortC_Manager_MonthReport] FOREIGN KEY([MonthReportId])
REFERENCES [dbo].[Manager_MonthReportC] ([MonthReportId])
GO

ALTER TABLE [dbo].[Manager_DrillSortC] CHECK CONSTRAINT [FK_Manager_DrillSortC_Manager_MonthReport]
GO

CREATE TABLE [dbo].[Manager_Month_EmergencyExercisesC](
	[EmergencyExercisesId] [nvarchar](50) NOT NULL,
	[MonthReportId] [nvarchar](50) NOT NULL,
	[DrillContent] [nvarchar](200) NULL,
	[DrillDate] [nvarchar](20) NULL,
	[UnitName] [nvarchar](50) NULL,
	[ParticipantsNum] [int] NULL,
	[SortIndex] [int] NULL,
 CONSTRAINT [PK_Manager_Month_EmergencyExercisesC] PRIMARY KEY CLUSTERED 
(
	[EmergencyExercisesId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_EmergencyExercisesC', @level2type=N'COLUMN',@level2name=N'EmergencyExercisesId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�±�Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_EmergencyExercisesC', @level2type=N'COLUMN',@level2name=N'MonthReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ƻ���������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_EmergencyExercisesC', @level2type=N'COLUMN',@level2name=N'DrillContent'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ƻ�����ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_EmergencyExercisesC', @level2type=N'COLUMN',@level2name=N'DrillDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�μӵ�λ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_EmergencyExercisesC', @level2type=N'COLUMN',@level2name=N'UnitName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�μ�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_EmergencyExercisesC', @level2type=N'COLUMN',@level2name=N'ParticipantsNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_EmergencyExercisesC', @level2type=N'COLUMN',@level2name=N'SortIndex'
GO

ALTER TABLE [dbo].[Manager_Month_EmergencyExercisesC]  WITH CHECK ADD  CONSTRAINT [FK_Manager_Month_EmergencyExercisesC_Manager_MonthReport] FOREIGN KEY([MonthReportId])
REFERENCES [dbo].[Manager_MonthReportC] ([MonthReportId])
GO

ALTER TABLE [dbo].[Manager_Month_EmergencyExercisesC] CHECK CONSTRAINT [FK_Manager_Month_EmergencyExercisesC_Manager_MonthReport]
GO

CREATE TABLE [dbo].[Manager_Month_EmergencyPlanC](
	[EmergencyPlanId] [nvarchar](50) NOT NULL,
	[MonthReportId] [nvarchar](50) NOT NULL,
	[EmergencyName] [nvarchar](50) NULL,
	[CompileMan] [nvarchar](20) NULL,
	[CompileDate] [nvarchar](20) NULL,
	[Remark] [nvarchar](150) NULL,
	[SortIndex] [int] NULL,
 CONSTRAINT [PK_Manager_Month_EmergencyPlanC] PRIMARY KEY CLUSTERED 
(
	[EmergencyPlanId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_EmergencyPlanC', @level2type=N'COLUMN',@level2name=N'EmergencyPlanId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�±�Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_EmergencyPlanC', @level2type=N'COLUMN',@level2name=N'MonthReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ƻ��ޱ��Ԥ������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_EmergencyPlanC', @level2type=N'COLUMN',@level2name=N'EmergencyName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ޱ���Ա' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_EmergencyPlanC', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ƻ����ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_EmergencyPlanC', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ע' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_EmergencyPlanC', @level2type=N'COLUMN',@level2name=N'Remark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_EmergencyPlanC', @level2type=N'COLUMN',@level2name=N'SortIndex'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ӧ��Ԥ���ޱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_EmergencyPlanC'
GO

ALTER TABLE [dbo].[Manager_Month_EmergencyPlanC]  WITH CHECK ADD  CONSTRAINT [FK_Manager_Month_EmergencyPlanC_Manager_MonthReport] FOREIGN KEY([MonthReportId])
REFERENCES [dbo].[Manager_MonthReportC] ([MonthReportId])
GO

ALTER TABLE [dbo].[Manager_Month_EmergencyPlanC] CHECK CONSTRAINT [FK_Manager_Month_EmergencyPlanC_Manager_MonthReport]
GO

CREATE TABLE [dbo].[Manager_EmergencySortC](
	[EmergencySortId] [nvarchar](50) NOT NULL,
	[MonthReportId] [nvarchar](50) NULL,
	[SortIndex] [int] NULL,
	[EmergencyName] [nvarchar](100) NULL,
	[ModefyPerson] [nvarchar](50) NULL,
	[ReleaseDate] [nvarchar](50) NULL,
	[StateRef] [nvarchar](500) NULL,
 CONSTRAINT [PK_Manager_EmergencySortC] PRIMARY KEY CLUSTERED 
(
	[EmergencySortId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_EmergencySortC', @level2type=N'COLUMN',@level2name=N'EmergencySortId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_EmergencySortC', @level2type=N'COLUMN',@level2name=N'MonthReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_EmergencySortC', @level2type=N'COLUMN',@level2name=N'SortIndex'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ޱ���Ա' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_EmergencySortC', @level2type=N'COLUMN',@level2name=N'ModefyPerson'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_EmergencySortC', @level2type=N'COLUMN',@level2name=N'ReleaseDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ޱ�������� ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_EmergencySortC', @level2type=N'COLUMN',@level2name=N'StateRef'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�±�Ӧ��Ԥ���ޱ���ϸ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_EmergencySortC'
GO

ALTER TABLE [dbo].[Manager_EmergencySortC]  WITH CHECK ADD  CONSTRAINT [FK_Manager_EmergencySortC_Manager_EmergencySortC] FOREIGN KEY([EmergencySortId])
REFERENCES [dbo].[Manager_EmergencySortC] ([EmergencySortId])
GO

ALTER TABLE [dbo].[Manager_EmergencySortC] CHECK CONSTRAINT [FK_Manager_EmergencySortC_Manager_EmergencySortC]
GO

ALTER TABLE [dbo].[Manager_EmergencySortC]  WITH CHECK ADD  CONSTRAINT [FK_Manager_EmergencySortC_Manager_MonthReport] FOREIGN KEY([MonthReportId])
REFERENCES [dbo].[Manager_MonthReportC] ([MonthReportId])
GO

ALTER TABLE [dbo].[Manager_EmergencySortC] CHECK CONSTRAINT [FK_Manager_EmergencySortC_Manager_MonthReport]
GO

CREATE TABLE [dbo].[Manager_Month_FileManageC](
	[FileManageId] [nvarchar](50) NOT NULL,
	[MonthReportId] [nvarchar](50) NOT NULL,
	[FileName] [nvarchar](50) NULL,
	[Disposal] [nvarchar](200) NULL,
	[FileArchiveLocation] [nvarchar](150) NULL,
	[SortIndex] [int] NULL,
 CONSTRAINT [PK_Manager_Month_FileManageC] PRIMARY KEY CLUSTERED 
(
	[FileManageId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_FileManageC', @level2type=N'COLUMN',@level2name=N'FileManageId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�±�Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_FileManageC', @level2type=N'COLUMN',@level2name=N'MonthReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ļ�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_FileManageC', @level2type=N'COLUMN',@level2name=N'FileName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_FileManageC', @level2type=N'COLUMN',@level2name=N'Disposal'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ļ��鵵λ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_FileManageC', @level2type=N'COLUMN',@level2name=N'FileArchiveLocation'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_FileManageC', @level2type=N'COLUMN',@level2name=N'SortIndex'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HSE�ļ������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_FileManageC'
GO

ALTER TABLE [dbo].[Manager_Month_FileManageC]  WITH CHECK ADD  CONSTRAINT [FK_Manager_Month_FileManageC_Manager_Month_FileManageC] FOREIGN KEY([MonthReportId])
REFERENCES [dbo].[Manager_MonthReportC] ([MonthReportId])
GO

ALTER TABLE [dbo].[Manager_Month_FileManageC] CHECK CONSTRAINT [FK_Manager_Month_FileManageC_Manager_Month_FileManageC]
GO

CREATE TABLE [dbo].[Manager_Month_FiveExpenseC](
	[FiveExpenseId] [nvarchar](50) NOT NULL,
	[MonthReportId] [nvarchar](50) NOT NULL,
	[InvestmentProject] [nvarchar](150) NULL,
	[PlanCostMonth] [decimal](18, 2) NULL,
	[PlanCostYear] [decimal](18, 2) NULL,
	[ActualCostMonth] [decimal](18, 2) NULL,
	[ActualCostYear] [decimal](18, 2) NULL,
	[SortIndex] [int] NULL,
 CONSTRAINT [PK_Manager_Month_FiveExpenseC] PRIMARY KEY CLUSTERED 
(
	[FiveExpenseId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_FiveExpenseC', @level2type=N'COLUMN',@level2name=N'FiveExpenseId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�±�Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_FiveExpenseC', @level2type=N'COLUMN',@level2name=N'MonthReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ͷ����Ŀ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_FiveExpenseC', @level2type=N'COLUMN',@level2name=N'InvestmentProject'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ƻ����ã����£�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_FiveExpenseC', @level2type=N'COLUMN',@level2name=N'PlanCostMonth'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ƻ����ã��ۼƣ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_FiveExpenseC', @level2type=N'COLUMN',@level2name=N'PlanCostYear'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ʵ�ʷ��ã����£�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_FiveExpenseC', @level2type=N'COLUMN',@level2name=N'ActualCostMonth'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ʵ�ʷ��ã��ۼƣ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_FiveExpenseC', @level2type=N'COLUMN',@level2name=N'ActualCostYear'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_FiveExpenseC', @level2type=N'COLUMN',@level2name=N'SortIndex'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�廷HSE����Ͷ�루��Ԫ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_FiveExpenseC'
GO

ALTER TABLE [dbo].[Manager_Month_FiveExpenseC]  WITH CHECK ADD  CONSTRAINT [FK_Manager_Month_FiveExpenseC_Manager_MonthReport] FOREIGN KEY([MonthReportId])
REFERENCES [dbo].[Manager_MonthReportC] ([MonthReportId])
GO

ALTER TABLE [dbo].[Manager_Month_FiveExpenseC] CHECK CONSTRAINT [FK_Manager_Month_FiveExpenseC_Manager_MonthReport]
GO

CREATE TABLE [dbo].[Manager_Month_HazardC](
	[HazardId] [nvarchar](50) NOT NULL,
	[MonthReportId] [nvarchar](50) NOT NULL,
	[WorkArea] [nvarchar](50) NULL,
	[Subcontractor] [nvarchar](50) NULL,
	[DangerousSource] [nvarchar](50) NULL,
	[ControlMeasures] [nvarchar](100) NULL,
	[SortIndex] [int] NULL,
 CONSTRAINT [PK_Manager_Month_HazardC] PRIMARY KEY CLUSTERED 
(
	[HazardId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_HazardC', @level2type=N'COLUMN',@level2name=N'HazardId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�±�Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_HazardC', @level2type=N'COLUMN',@level2name=N'MonthReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���¼ƻ�ʩ��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_HazardC', @level2type=N'COLUMN',@level2name=N'WorkArea'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����ְ���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_HazardC', @level2type=N'COLUMN',@level2name=N'Subcontractor'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���ܴ��ڵ�Σ��Դ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_HazardC', @level2type=N'COLUMN',@level2name=N'DangerousSource'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ƻ���ȡ�Ŀ��ƴ�ʩ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_HazardC', @level2type=N'COLUMN',@level2name=N'ControlMeasures'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_HazardC', @level2type=N'COLUMN',@level2name=N'SortIndex'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Σ��Դ��̬ʶ�𼰿��Ʊ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_HazardC'
GO

ALTER TABLE [dbo].[Manager_Month_HazardC]  WITH CHECK ADD  CONSTRAINT [FK_Manager_Month_HazardC_Manager_MonthReport] FOREIGN KEY([MonthReportId])
REFERENCES [dbo].[Manager_MonthReportC] ([MonthReportId])
GO

ALTER TABLE [dbo].[Manager_Month_HazardC] CHECK CONSTRAINT [FK_Manager_Month_HazardC_Manager_MonthReport]
GO

CREATE TABLE [dbo].[Manager_HazardSortC](
	[HazardSortId] [nvarchar](50) NOT NULL,
	[MonthReportId] [nvarchar](50) NULL,
	[SortIndex] [int] NULL,
	[HazardName] [nvarchar](100) NULL,
	[UnitAndArea] [nvarchar](200) NULL,
	[StationDef] [nvarchar](500) NULL,
	[HandleWay] [nvarchar](500) NULL,
 CONSTRAINT [PK_Manager_HazardCSort] PRIMARY KEY CLUSTERED 
(
	[HazardSortId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HazardSortC', @level2type=N'COLUMN',@level2name=N'HazardSortId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HazardSortC', @level2type=N'COLUMN',@level2name=N'MonthReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HazardSortC', @level2type=N'COLUMN',@level2name=N'SortIndex'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Σ��Դ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HazardSortC', @level2type=N'COLUMN',@level2name=N'HazardName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���ڵ�λ������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HazardSortC', @level2type=N'COLUMN',@level2name=N'UnitAndArea'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ֳ��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HazardSortC', @level2type=N'COLUMN',@level2name=N'StationDef'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���ƴ�ʩ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HazardSortC', @level2type=N'COLUMN',@level2name=N'HandleWay'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�±�Σ��Դ��ϸ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HazardSortC'
GO

ALTER TABLE [dbo].[Manager_HazardSortC]  WITH CHECK ADD  CONSTRAINT [FK_Manager_HazardCSort_Manager_MonthReport] FOREIGN KEY([MonthReportId])
REFERENCES [dbo].[Manager_MonthReportC] ([MonthReportId])
GO

ALTER TABLE [dbo].[Manager_HazardSortC] CHECK CONSTRAINT [FK_Manager_HazardCSort_Manager_MonthReport]
GO

CREATE TABLE [dbo].[Manager_HseCostC](
	[HseCostId] [nvarchar](50) NOT NULL,
	[MonthReportId] [nvarchar](50) NULL,
	[UnitId] [nvarchar](50) NULL,
	[PlanCost] [money] NULL,
	[RealCost] [money] NULL,
	[TotalRealCost] [money] NULL,
 CONSTRAINT [PK_Manager_HseCostC] PRIMARY KEY CLUSTERED 
(
	[HseCostId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HseCostC', @level2type=N'COLUMN',@level2name=N'HseCostId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�±���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HseCostC', @level2type=N'COLUMN',@level2name=N'MonthReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��λ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HseCostC', @level2type=N'COLUMN',@level2name=N'UnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ƻ���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HseCostC', @level2type=N'COLUMN',@level2name=N'PlanCost'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ʵ��֧��(����)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HseCostC', @level2type=N'COLUMN',@level2name=N'RealCost'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ʵ��֧��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HseCostC', @level2type=N'COLUMN',@level2name=N'TotalRealCost'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�±���HSE������ʩ���ñ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HseCostC'
GO

ALTER TABLE [dbo].[Manager_HseCostC]  WITH CHECK ADD  CONSTRAINT [FK_Manager_HseCostC_Base_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[Manager_HseCostC] CHECK CONSTRAINT [FK_Manager_HseCostC_Base_Unit]
GO

ALTER TABLE [dbo].[Manager_HseCostC]  WITH CHECK ADD  CONSTRAINT [FK_Manager_HseCostC_Manager_MonthReport] FOREIGN KEY([MonthReportId])
REFERENCES [dbo].[Manager_MonthReportC] ([MonthReportId])
GO

ALTER TABLE [dbo].[Manager_HseCostC] CHECK CONSTRAINT [FK_Manager_HseCostC_Manager_MonthReport]
GO

CREATE TABLE [dbo].[Manager_IncentiveSortC](
	[IncentiveSortId] [nvarchar](50) NOT NULL,
	[MonthReportId] [nvarchar](50) NULL,
	[IncentiveType] [nvarchar](30) NULL,
	[BigType] [char](1) NULL,
	[IncentiveMoney] [int] NULL,
	[IncentiveUnit] [nvarchar](100) NULL,
	[IncentiveDate] [nvarchar](50) NULL,
	[SortIndex] [int] NULL,
	[IncentiveReason] [nvarchar](100) NULL,
	[IncentiveBasis] [nvarchar](100) NULL,
 CONSTRAINT [PK_Manager_IncentiveSortC] PRIMARY KEY CLUSTERED 
(
	[IncentiveSortId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_IncentiveSortC', @level2type=N'COLUMN',@level2name=N'IncentiveSortId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�±���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_IncentiveSortC', @level2type=N'COLUMN',@level2name=N'MonthReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_IncentiveSortC', @level2type=N'COLUMN',@level2name=N'IncentiveType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���ࣨ1-�� ����2-�� ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_IncentiveSortC', @level2type=N'COLUMN',@level2name=N'BigType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���ͽ����£�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_IncentiveSortC', @level2type=N'COLUMN',@level2name=N'IncentiveMoney'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�±���HSE���������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_IncentiveSortC'
GO

ALTER TABLE [dbo].[Manager_IncentiveSortC]  WITH CHECK ADD  CONSTRAINT [FK_Manager_IncentiveSortC_Manager_MonthReport] FOREIGN KEY([MonthReportId])
REFERENCES [dbo].[Manager_MonthReportC] ([MonthReportId])
GO

ALTER TABLE [dbo].[Manager_IncentiveSortC] CHECK CONSTRAINT [FK_Manager_IncentiveSortC_Manager_MonthReport]
GO

CREATE TABLE [dbo].[Manager_Month_ManageDocPlanC](
	[ManageDocPlanId] [nvarchar](50) NOT NULL,
	[MonthReportId] [nvarchar](50) NOT NULL,
	[ManageDocPlanName] [nvarchar](100) NULL,
	[CompileMan] [nvarchar](20) NULL,
	[CompileDate] [nvarchar](20) NULL,
	[SortIndex] [int] NULL,
 CONSTRAINT [PK_Manager_Month_ManageDocPlanC] PRIMARY KEY CLUSTERED 
(
	[ManageDocPlanId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�±�Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_ManageDocPlanC', @level2type=N'COLUMN',@level2name=N'MonthReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���¼ƻ��ޱ�ķ���/�ļ�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_ManageDocPlanC', @level2type=N'COLUMN',@level2name=N'ManageDocPlanName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ޱ���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_ManageDocPlanC', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ƻ����ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_ManageDocPlanC', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_ManageDocPlanC', @level2type=N'COLUMN',@level2name=N'SortIndex'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HSE�����ļ�/�����ޱ�ƻ���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_ManageDocPlanC'
GO

ALTER TABLE [dbo].[Manager_Month_ManageDocPlanC]  WITH CHECK ADD  CONSTRAINT [FK_Manager_Month_ManageDocPlanC_Manager_MonthReport] FOREIGN KEY([MonthReportId])
REFERENCES [dbo].[Manager_MonthReportC] ([MonthReportId])
GO

ALTER TABLE [dbo].[Manager_Month_ManageDocPlanC] CHECK CONSTRAINT [FK_Manager_Month_ManageDocPlanC_Manager_MonthReport]
GO


CREATE TABLE [dbo].[Manager_Month_MeetingC](
	[MeetingId] [nvarchar](50) NOT NULL,
	[MonthReportId] [nvarchar](50) NOT NULL,
	[MeetingTitle] [nvarchar](200) NULL,
	[MeetingDate] [nvarchar](20) NULL,
	[Host] [nvarchar](20) NULL,
	[Participants] [nvarchar](100) NULL,
	[SortIndex] [int] NULL,
 CONSTRAINT [PK_Manager_Month_MeetingC] PRIMARY KEY CLUSTERED 
(
	[MeetingId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_MeetingC', @level2type=N'COLUMN',@level2name=N'MeetingId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�±�Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_MeetingC', @level2type=N'COLUMN',@level2name=N'MonthReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���¼ƻ��ٿ��Ļ�������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_MeetingC', @level2type=N'COLUMN',@level2name=N'MeetingTitle'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_MeetingC', @level2type=N'COLUMN',@level2name=N'MeetingDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_MeetingC', @level2type=N'COLUMN',@level2name=N'Host'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ƻ��λ���Ա' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_MeetingC', @level2type=N'COLUMN',@level2name=N'Participants'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_MeetingC', @level2type=N'COLUMN',@level2name=N'SortIndex'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HSSE����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_MeetingC'
GO

ALTER TABLE [dbo].[Manager_Month_MeetingC]  WITH CHECK ADD  CONSTRAINT [FK_Manager_Month_MeetingC_Manager_MonthReport] FOREIGN KEY([MonthReportId])
REFERENCES [dbo].[Manager_MonthReportC] ([MonthReportId])
GO

ALTER TABLE [dbo].[Manager_Month_MeetingC] CHECK CONSTRAINT [FK_Manager_Month_MeetingC_Manager_MonthReport]
GO

CREATE TABLE [dbo].[Manager_MeetingSortC](
	[MeetingSortId] [nvarchar](50) NOT NULL,
	[MonthReportId] [nvarchar](50) NULL,
	[MeetingType] [nvarchar](30) NULL,
	[MeetingHours] [decimal](4, 1) NULL,
	[MeetingHostMan] [nvarchar](50) NULL,
	[MeetingDate] [nvarchar](50) NULL,
	[AttentPerson] [nvarchar](300) NULL,
	[MainContent] [nvarchar](500) NULL,
	[SortIndex] [int] NULL,
 CONSTRAINT [PK_Manager_MeetingSortC] PRIMARY KEY CLUSTERED 
(
	[MeetingSortId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MeetingSortC', @level2type=N'COLUMN',@level2name=N'MeetingType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�±���HSE���������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MeetingSortC'
GO

ALTER TABLE [dbo].[Manager_MeetingSortC]  WITH CHECK ADD  CONSTRAINT [FK_Manager_MeetingSortC_Manager_MonthReport] FOREIGN KEY([MonthReportId])
REFERENCES [dbo].[Manager_MonthReportC] ([MonthReportId])
GO

ALTER TABLE [dbo].[Manager_MeetingSortC] CHECK CONSTRAINT [FK_Manager_MeetingSortC_Manager_MonthReport]
GO

CREATE TABLE [dbo].[Manager_OtherActiveSortC](
	[OtherActiveSortId] [nvarchar](50) NOT NULL,
	[MonthReportId] [nvarchar](50) NULL,
	[SortIndex] [int] NULL,
	[ActiveName] [nvarchar](100) NULL,
	[Num] [nvarchar](50) NULL,
	[YearNum] [nvarchar](50) NULL,
 CONSTRAINT [PK_Manager_OtherActive] PRIMARY KEY CLUSTERED 
(
	[OtherActiveSortId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_OtherActiveSortC', @level2type=N'COLUMN',@level2name=N'OtherActiveSortId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_OtherActiveSortC', @level2type=N'COLUMN',@level2name=N'MonthReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_OtherActiveSortC', @level2type=N'COLUMN',@level2name=N'SortIndex'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_OtherActiveSortC', @level2type=N'COLUMN',@level2name=N'ActiveName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���¿�չ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_OtherActiveSortC', @level2type=N'COLUMN',@level2name=N'Num'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����ۼƴ���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_OtherActiveSortC', @level2type=N'COLUMN',@level2name=N'YearNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�±�����HSE������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_OtherActiveSortC'
GO

ALTER TABLE [dbo].[Manager_OtherActiveSortC]  WITH CHECK ADD  CONSTRAINT [FK_Manager_OtherActive_Manager_MonthReport] FOREIGN KEY([MonthReportId])
REFERENCES [dbo].[Manager_MonthReportC] ([MonthReportId])
GO

ALTER TABLE [dbo].[Manager_OtherActiveSortC] CHECK CONSTRAINT [FK_Manager_OtherActive_Manager_MonthReport]
GO

CREATE TABLE [dbo].[Manager_Month_OtherManagementC](
	[OtherManagementId] [nvarchar](50) NOT NULL,
	[MonthReportId] [nvarchar](50) NOT NULL,
	[ManagementDes] [nvarchar](300) NULL,
	[SortIndex] [int] NULL,
 CONSTRAINT [PK_Manager_Month_OtherManagementC] PRIMARY KEY CLUSTERED 
(
	[OtherManagementId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_OtherManagementC', @level2type=N'COLUMN',@level2name=N'OtherManagementId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�±�Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_OtherManagementC', @level2type=N'COLUMN',@level2name=N'MonthReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_OtherManagementC', @level2type=N'COLUMN',@level2name=N'ManagementDes'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_OtherManagementC', @level2type=N'COLUMN',@level2name=N'SortIndex'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HSE�ֳ��������������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_OtherManagementC'
GO

ALTER TABLE [dbo].[Manager_Month_OtherManagementC]  WITH CHECK ADD  CONSTRAINT [FK_Manager_Month_OtherManagementC_Manager_MonthReport] FOREIGN KEY([MonthReportId])
REFERENCES [dbo].[Manager_MonthReportC] ([MonthReportId])
GO

ALTER TABLE [dbo].[Manager_Month_OtherManagementC] CHECK CONSTRAINT [FK_Manager_Month_OtherManagementC_Manager_MonthReport]
GO

CREATE TABLE [dbo].[Manager_Month_OtherWorkC](
	[OtherWorkId] [nvarchar](50) NOT NULL,
	[MonthReportId] [nvarchar](50) NOT NULL,
	[WorkContentDes] [nvarchar](200) NULL,
	[SortIndex] [int] NULL,
 CONSTRAINT [PK_Manager_Month_OtherWorkC] PRIMARY KEY CLUSTERED 
(
	[OtherWorkId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_OtherWorkC', @level2type=N'COLUMN',@level2name=N'OtherWorkId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�±�Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_OtherWorkC', @level2type=N'COLUMN',@level2name=N'MonthReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_OtherWorkC', @level2type=N'COLUMN',@level2name=N'WorkContentDes'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_OtherWorkC', @level2type=N'COLUMN',@level2name=N'SortIndex'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�������������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_OtherWorkC'
GO

ALTER TABLE [dbo].[Manager_Month_OtherWorkC]  WITH CHECK ADD  CONSTRAINT [FK_Manager_Month_OtherWorkC_Manager_MonthReport] FOREIGN KEY([MonthReportId])
REFERENCES [dbo].[Manager_MonthReportC] ([MonthReportId])
GO

ALTER TABLE [dbo].[Manager_Month_OtherWorkC] CHECK CONSTRAINT [FK_Manager_Month_OtherWorkC_Manager_MonthReport]
GO

CREATE TABLE [dbo].[Manager_Month_OtherWorkPlanC](
	[OtherWorkPlanId] [nvarchar](50) NOT NULL,
	[MonthReportId] [nvarchar](50) NOT NULL,
	[WorkContent] [nvarchar](500) NULL,
	[SortIndex] [int] NULL,
 CONSTRAINT [PK_Manager_Month_OtherWorkPlanC] PRIMARY KEY CLUSTERED 
(
	[OtherWorkPlanId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_OtherWorkPlanC', @level2type=N'COLUMN',@level2name=N'OtherWorkPlanId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�±�Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_OtherWorkPlanC', @level2type=N'COLUMN',@level2name=N'MonthReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ƻ�������������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_OtherWorkPlanC', @level2type=N'COLUMN',@level2name=N'WorkContent'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_OtherWorkPlanC', @level2type=N'COLUMN',@level2name=N'SortIndex'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����HSE�����ƻ���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_OtherWorkPlanC'
GO

ALTER TABLE [dbo].[Manager_Month_OtherWorkPlanC]  WITH CHECK ADD  CONSTRAINT [FK_Manager_Month_OtherWorkPlanC_Manager_MonthReport] FOREIGN KEY([MonthReportId])
REFERENCES [dbo].[Manager_MonthReportC] ([MonthReportId])
GO

ALTER TABLE [dbo].[Manager_Month_OtherWorkPlanC] CHECK CONSTRAINT [FK_Manager_Month_OtherWorkPlanC_Manager_MonthReport]
GO

CREATE TABLE [dbo].[Manager_PersonSortC](
	[PersonSortId] [nvarchar](50) NOT NULL,
	[MonthReportId] [nvarchar](50) NULL,
	[UnitId] [nvarchar](50) NULL,
	[SumPersonNum] [int] NULL,
	[HSEPersonNum] [int] NULL,
	[ContractRange] [ntext] NULL,
	[Remark] [ntext] NULL,
 CONSTRAINT [PK_Manager_PersonCSort] PRIMARY KEY CLUSTERED 
(
	[PersonSortId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_PersonSortC', @level2type=N'COLUMN',@level2name=N'PersonSortId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_PersonSortC', @level2type=N'COLUMN',@level2name=N'MonthReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��λ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_PersonSortC', @level2type=N'COLUMN',@level2name=N'UnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_PersonSortC', @level2type=N'COLUMN',@level2name=N'SumPersonNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HSE������Ա����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_PersonSortC', @level2type=N'COLUMN',@level2name=N'HSEPersonNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�а���Χ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_PersonSortC', @level2type=N'COLUMN',@level2name=N'ContractRange'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ע' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_PersonSortC', @level2type=N'COLUMN',@level2name=N'Remark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�±�����Ͷ����ϸ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_PersonSortC'
GO

ALTER TABLE [dbo].[Manager_PersonSortC]  WITH CHECK ADD  CONSTRAINT [FK_Manager_PersonCSort_Base_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[Manager_PersonSortC] CHECK CONSTRAINT [FK_Manager_PersonCSort_Base_Unit]
GO

ALTER TABLE [dbo].[Manager_PersonSortC]  WITH CHECK ADD  CONSTRAINT [FK_Manager_PersonCSort_Manager_MonthReport] FOREIGN KEY([MonthReportId])
REFERENCES [dbo].[Manager_MonthReportC] ([MonthReportId])
GO

ALTER TABLE [dbo].[Manager_PersonSortC] CHECK CONSTRAINT [FK_Manager_PersonCSort_Manager_MonthReport]
GO

CREATE TABLE [dbo].[Manager_Month_PlanC](
	[PlanId] [nvarchar](50) NOT NULL,
	[MonthReportId] [nvarchar](50) NOT NULL,
	[PlanName] [nvarchar](50) NULL,
	[CompileMan] [nvarchar](20) NULL,
	[CompileDate] [nvarchar](20) NULL,
	[SortIndex] [int] NULL,
 CONSTRAINT [PK_Manager_Month_PlanC] PRIMARY KEY CLUSTERED 
(
	[PlanId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_PlanC', @level2type=N'COLUMN',@level2name=N'PlanId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�±�Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_PlanC', @level2type=N'COLUMN',@level2name=N'MonthReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����ޱ�ķ���/�ļ�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_PlanC', @level2type=N'COLUMN',@level2name=N'PlanName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ޱ���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_PlanC', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����ʱ�� ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_PlanC', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_PlanC', @level2type=N'COLUMN',@level2name=N'SortIndex'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����ļ��������ޱ����˵����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_PlanC'
GO

ALTER TABLE [dbo].[Manager_Month_PlanC]  WITH CHECK ADD  CONSTRAINT [FK_Manager_Month_PlanC_Manager_MonthReport] FOREIGN KEY([MonthReportId])
REFERENCES [dbo].[Manager_MonthReportC] ([MonthReportId])
GO

ALTER TABLE [dbo].[Manager_Month_PlanC] CHECK CONSTRAINT [FK_Manager_Month_PlanC_Manager_MonthReport]
GO

CREATE TABLE [dbo].[Manager_PromotionalActiviteSortC](
	[PromotionalActiviteSortId] [nvarchar](50) NOT NULL,
	[MonthReportId] [nvarchar](50) NULL,
	[SortIndex] [int] NULL,
	[PromotionalActivitiesName] [nvarchar](50) NULL,
	[CompileDate] [nvarchar](50) NULL,
	[ParticipatingUnits] [nvarchar](100) NULL,
	[Remark] [nvarchar](500) NULL,
 CONSTRAINT [PK_Manager_PromotionalActiviteSortC] PRIMARY KEY CLUSTERED 
(
	[PromotionalActiviteSortId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_PromotionalActiviteSortC', @level2type=N'COLUMN',@level2name=N'PromotionalActiviteSortId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_PromotionalActiviteSortC', @level2type=N'COLUMN',@level2name=N'MonthReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_PromotionalActiviteSortC', @level2type=N'COLUMN',@level2name=N'SortIndex'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_PromotionalActiviteSortC', @level2type=N'COLUMN',@level2name=N'PromotionalActivitiesName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_PromotionalActiviteSortC', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�μӵ�λ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_PromotionalActiviteSortC', @level2type=N'COLUMN',@level2name=N'ParticipatingUnits'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�Ч������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_PromotionalActiviteSortC', @level2type=N'COLUMN',@level2name=N'Remark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�±���������Ա�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_PromotionalActiviteSortC'
GO

ALTER TABLE [dbo].[Manager_PromotionalActiviteSortC]  WITH CHECK ADD  CONSTRAINT [FK_Manager_PromotionalActiviteSortC_Manager_MonthReportC] FOREIGN KEY([MonthReportId])
REFERENCES [dbo].[Manager_MonthReportC] ([MonthReportId])
GO

ALTER TABLE [dbo].[Manager_PromotionalActiviteSortC] CHECK CONSTRAINT [FK_Manager_PromotionalActiviteSortC_Manager_MonthReportC]
GO

CREATE TABLE [dbo].[Manager_Month_ReviewRecordC](
	[ReviewRecordId] [nvarchar](50) NOT NULL,
	[MonthReportId] [nvarchar](50) NOT NULL,
	[ReviewRecordName] [nvarchar](500) NULL,
	[ReviewMan] [nvarchar](20) NULL,
	[ReviewDate] [nvarchar](20) NULL,
	[SortIndex] [int] NULL,
 CONSTRAINT [PK_Manager_Month_ReviewRecordC] PRIMARY KEY CLUSTERED 
(
	[ReviewRecordId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_ReviewRecordC', @level2type=N'COLUMN',@level2name=N'ReviewRecordId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�±�Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_ReviewRecordC', @level2type=N'COLUMN',@level2name=N'MonthReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��鷽���������ļ�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_ReviewRecordC', @level2type=N'COLUMN',@level2name=N'ReviewRecordName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_ReviewRecordC', @level2type=N'COLUMN',@level2name=N'ReviewMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_ReviewRecordC', @level2type=N'COLUMN',@level2name=N'ReviewDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_ReviewRecordC', @level2type=N'COLUMN',@level2name=N'SortIndex'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ϸ����¼��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_ReviewRecordC'
GO

ALTER TABLE [dbo].[Manager_Month_ReviewRecordC]  WITH CHECK ADD  CONSTRAINT [FK_Manager_Month_ReviewRecordC_Manager_MonthReport] FOREIGN KEY([MonthReportId])
REFERENCES [dbo].[Manager_MonthReportC] ([MonthReportId])
GO

ALTER TABLE [dbo].[Manager_Month_ReviewRecordC] CHECK CONSTRAINT [FK_Manager_Month_ReviewRecordC_Manager_MonthReport]
GO

CREATE TABLE [dbo].[Manager_Month_SubExpenseC](
	[SubExpenseId] [nvarchar](50) NOT NULL,
	[MonthReportId] [nvarchar](50) NOT NULL,
	[SubUnit] [nvarchar](100) NULL,
	[CostMonth] [nvarchar](50) NULL,
	[CostYear] [nvarchar](50) NULL,
	[SortIndex] [int] NULL,
 CONSTRAINT [PK_Manager_Month_SubExpenseC] PRIMARY KEY CLUSTERED 
(
	[SubExpenseId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_SubExpenseC', @level2type=N'COLUMN',@level2name=N'SubExpenseId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�±�Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_SubExpenseC', @level2type=N'COLUMN',@level2name=N'MonthReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ְ���������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_SubExpenseC', @level2type=N'COLUMN',@level2name=N'SubUnit'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���²������ã�������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_SubExpenseC', @level2type=N'COLUMN',@level2name=N'CostMonth'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ۼ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_SubExpenseC', @level2type=N'COLUMN',@level2name=N'CostYear'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_SubExpenseC', @level2type=N'COLUMN',@level2name=N'SortIndex'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ְ���HSE����Ͷ���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_SubExpenseC'
GO

ALTER TABLE [dbo].[Manager_Month_SubExpenseC]  WITH CHECK ADD  CONSTRAINT [FK_Manager_Month_SubExpenseC_Manager_MonthReportC] FOREIGN KEY([MonthReportId])
REFERENCES [dbo].[Manager_MonthReportC] ([MonthReportId])
GO

ALTER TABLE [dbo].[Manager_Month_SubExpenseC] CHECK CONSTRAINT [FK_Manager_Month_SubExpenseC_Manager_MonthReportC]
GO

CREATE TABLE [dbo].[Manager_TrainActivitySortC](
	[TrainActivitySortId] [nvarchar](50) NOT NULL,
	[MonthReportId] [nvarchar](50) NULL,
	[ActivityName] [nvarchar](200) NULL,
	[TrainDate] [nvarchar](50) NULL,
	[TrainEffect] [nvarchar](200) NULL,
	[SortIndex] [int] NULL,
 CONSTRAINT [PK_Manager_TrainActivitySortC] PRIMARY KEY CLUSTERED 
(
	[TrainActivitySortId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_TrainActivitySortC', @level2type=N'COLUMN',@level2name=N'TrainActivitySortId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�±�Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_TrainActivitySortC', @level2type=N'COLUMN',@level2name=N'MonthReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��Ҫ��ѵ�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_TrainActivitySortC', @level2type=N'COLUMN',@level2name=N'ActivityName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ѵʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_TrainActivitySortC', @level2type=N'COLUMN',@level2name=N'TrainDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ѵЧ�����μ����������ﵽ��Ч����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_TrainActivitySortC', @level2type=N'COLUMN',@level2name=N'TrainEffect'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_TrainActivitySortC', @level2type=N'COLUMN',@level2name=N'SortIndex'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ѵ������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_TrainActivitySortC'
GO

ALTER TABLE [dbo].[Manager_TrainActivitySortC]  WITH CHECK ADD  CONSTRAINT [FK_Manager_TrainActivitySortC_Manager_MonthReportC] FOREIGN KEY([MonthReportId])
REFERENCES [dbo].[Manager_MonthReportC] ([MonthReportId])
GO

ALTER TABLE [dbo].[Manager_TrainActivitySortC] CHECK CONSTRAINT [FK_Manager_TrainActivitySortC_Manager_MonthReportC]
GO

CREATE TABLE [dbo].[Manager_Month_TrainC](
	[TrainId] [nvarchar](50) NOT NULL,
	[MonthReportId] [nvarchar](50) NOT NULL,
	[TrainName] [nvarchar](100) NULL,
	[TrainMan] [nvarchar](20) NULL,
	[TrainDate] [nvarchar](20) NULL,
	[TrainObject] [nvarchar](50) NULL,
	[Remark] [nvarchar](100) NULL,
	[SortIndex] [int] NULL,
 CONSTRAINT [PK_Manager_Month_TrainC] PRIMARY KEY CLUSTERED 
(
	[TrainId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_TrainC', @level2type=N'COLUMN',@level2name=N'TrainId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�±�Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_TrainC', @level2type=N'COLUMN',@level2name=N'MonthReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���¼ƻ���չ����ѵ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_TrainC', @level2type=N'COLUMN',@level2name=N'TrainName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ѵ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_TrainC', @level2type=N'COLUMN',@level2name=N'TrainMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ѵʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_TrainC', @level2type=N'COLUMN',@level2name=N'TrainDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ƻ��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_TrainC', @level2type=N'COLUMN',@level2name=N'TrainObject'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ע' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_TrainC', @level2type=N'COLUMN',@level2name=N'Remark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_TrainC', @level2type=N'COLUMN',@level2name=N'SortIndex'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HSE��ѵ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_Month_TrainC'
GO

ALTER TABLE [dbo].[Manager_Month_TrainC]  WITH CHECK ADD  CONSTRAINT [FK_Manager_Month_TrainC_Manager_MonthReport] FOREIGN KEY([MonthReportId])
REFERENCES [dbo].[Manager_MonthReportC] ([MonthReportId])
GO

ALTER TABLE [dbo].[Manager_Month_TrainC] CHECK CONSTRAINT [FK_Manager_Month_TrainC_Manager_MonthReport]
GO

CREATE TABLE [dbo].[Manager_TrainSortC](
	[TrainSortId] [nvarchar](50) NOT NULL,
	[MonthReportId] [nvarchar](50) NULL,
	[TrainContent] [nvarchar](500) NULL,
	[TeachHour] [numeric](9, 1) NULL,
	[TeachMan] [nvarchar](50) NULL,
	[UnitName] [nvarchar](200) NULL,
	[PersonNum] [int] NULL,
	[SortIndex] [int] NULL,
 CONSTRAINT [PK_Manager_TrainSortC] PRIMARY KEY CLUSTERED 
(
	[TrainSortId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_TrainSortC', @level2type=N'COLUMN',@level2name=N'TrainSortId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�±���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_TrainSortC', @level2type=N'COLUMN',@level2name=N'MonthReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�±���HSE��ѵ�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_TrainSortC'
GO

ALTER TABLE [dbo].[Manager_TrainSortC]  WITH CHECK ADD  CONSTRAINT [FK_Manager_TrainSortC_Manager_MonthReport] FOREIGN KEY([MonthReportId])
REFERENCES [dbo].[Manager_MonthReportC] ([MonthReportId])
GO

ALTER TABLE [dbo].[Manager_TrainSortC] CHECK CONSTRAINT [FK_Manager_TrainSortC_Manager_MonthReport]
GO














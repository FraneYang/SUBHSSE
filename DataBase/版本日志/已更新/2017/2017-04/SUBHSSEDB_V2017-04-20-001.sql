-- ��ȫ�����±��������±���
INSERT INTO Sys_MenuProjectA (MenuId,MenuName,Url,Icon,SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)  
VALUES('E18AF205-9C5B-40F8-B77B-B30C31B10BB5','��ȫ�����±�','Manager/ManagerMonthD.aspx','PageHeaderFooter',27,'03235B30-960D-4FCF-99F7-97773A2EE108','Menu_Project',1,0)
GO
--��ȫ�����±��������±�����ť
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('A3DE3CF0-5D03-4FA7-B8A6-92ED7782BC78','E18AF205-9C5B-40F8-B77B-B30C31B10BB5','����',1)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('1E646E62-0D92-449A-818A-F87D07ECD21B','E18AF205-9C5B-40F8-B77B-B30C31B10BB5','�޸�',2)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('69876C7A-8206-488F-B44A-671FA21DD795','E18AF205-9C5B-40F8-B77B-B30C31B10BB5','ɾ��',3)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('E5B95B0A-0CE8-4145-971B-839FDCA66C5F','E18AF205-9C5B-40F8-B77B-B30C31B10BB5','����',4)  
GO
-- ��ȫ�����±��������±���
INSERT INTO Sys_MenuProjectB (MenuId,MenuName,Url,Icon,SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)  
VALUES('E18AF205-9C5B-40F8-B77B-B30C31B10BB5','��ȫ�����±�','Manager/ManagerMonthD.aspx','PageHeaderFooter',27,'03235B30-960D-4FCF-99F7-97773A2EE108','Menu_Project',1,0)
GO

--������:���������±�������
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('FF36D1CA-E87F-430C-9D9F-5ADF5629F656','MonthReportDEdit1.aspx','1 ��ί������Ҫ',1,'MonthReportDItem')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('967B0FD2-A834-48E0-9CD2-A645B439FEC1','MonthReportDEdit2.aspx','2 ��ȫ�������������±�',2,'MonthReportDItem')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('5BEBEE49-0256-477B-A100-57F7C3581679','MonthReportDEdit3.aspx','3 ���ܽ�',3,'MonthReportDItem')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('A5EC533A-40B8-4AAE-8064-997553585A28','MonthReportDEdit4.aspx','4 ������ְҵ�����±���',4,'MonthReportDItem')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('503A902F-73F8-4467-8976-470BD0EAB8CD','MonthReportDEdit5.aspx','5 ��ȫ����ʦÿ��Ѳ���¼��',5,'MonthReportDItem')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('8DC49F74-9F25-4EED-9B07-9AD8A1378FF1','MonthReportDEdit6.aspx','6 Υ���¼���ܱ�',6,'MonthReportDItem')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('69C20627-27C1-4EF1-9F9C-29032F98B17D','MonthReportDEdit7.aspx','7 ʩ����λ�°�ȫ���˱�',7,'MonthReportDItem')
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

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportD', @level2type=N'COLUMN',@level2name=N'MonthReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportD', @level2type=N'COLUMN',@level2name=N'MonthReportCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ĿId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportD', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�·�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportD', @level2type=N'COLUMN',@level2name=N'Months'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportD', @level2type=N'COLUMN',@level2name=N'MonthReportDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportD', @level2type=N'COLUMN',@level2name=N'ReportMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ȫ�����±�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportD'
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

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HSSEMeetingD', @level2type=N'COLUMN',@level2name=N'HSSEMeetingId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�±�Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HSSEMeetingD', @level2type=N'COLUMN',@level2name=N'MonthReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����Ҫ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HSSEMeetingD', @level2type=N'COLUMN',@level2name=N'MeetingContents'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ί������Ҫ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HSSEMeetingD'
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

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafetyDataD', @level2type=N'COLUMN',@level2name=N'SafetyDataId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�±�Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafetyDataD', @level2type=N'COLUMN',@level2name=N'MonthReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����˾�ֳ�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafetyDataD', @level2type=N'COLUMN',@level2name=N'ThisUnitPersonNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����˾�ֳ�HSE��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafetyDataD', @level2type=N'COLUMN',@level2name=N'ThisUnitHSEPersonNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ְ����ֳ�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafetyDataD', @level2type=N'COLUMN',@level2name=N'SubUnitPersonNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ְ���HSE��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafetyDataD', @level2type=N'COLUMN',@level2name=N'SubUnitHSEPersonNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�˹�ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafetyDataD', @level2type=N'COLUMN',@level2name=N'ManHours'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ȫ�����˹�ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafetyDataD', @level2type=N'COLUMN',@level2name=N'HSEManHours'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ʧ��ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafetyDataD', @level2type=N'COLUMN',@level2name=N'LossHours'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ʧ������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafetyDataD', @level2type=N'COLUMN',@level2name=N'LossDay'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����˴�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafetyDataD', @level2type=N'COLUMN',@level2name=N'DeathNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����˴�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafetyDataD', @level2type=N'COLUMN',@level2name=N'SeriousInjuredNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����˴�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafetyDataD', @level2type=N'COLUMN',@level2name=N'MinorInjuredNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����˴�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafetyDataD', @level2type=N'COLUMN',@level2name=N'OtherNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ҽ�ƴ��ù����˴�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafetyDataD', @level2type=N'COLUMN',@level2name=N'MedicalTreatmentNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�������޹����˴�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafetyDataD', @level2type=N'COLUMN',@level2name=N'WorkLimitNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���Ȱ����¹��˴�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafetyDataD', @level2type=N'COLUMN',@level2name=N'FirstAidNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'δ���¹�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafetyDataD', @level2type=N'COLUMN',@level2name=N'AttemptedAccidentNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����˺��¹ʾ�����ʧ��Ԫ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafetyDataD', @level2type=N'COLUMN',@level2name=N'PersonInjuredLossMoney'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����¹�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafetyDataD', @level2type=N'COLUMN',@level2name=N'FireNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ը�¹�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafetyDataD', @level2type=N'COLUMN',@level2name=N'ExplosionNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ͨ�¹�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafetyDataD', @level2type=N'COLUMN',@level2name=N'TrafficNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��е�豸�¹�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafetyDataD', @level2type=N'COLUMN',@level2name=N'EquipmentNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ֳ������¹�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafetyDataD', @level2type=N'COLUMN',@level2name=N'SiteEnvironmentNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ֳ������豸���ϵ��԰���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafetyDataD', @level2type=N'COLUMN',@level2name=N'TheftCaseNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�Ʋ���ʧ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafetyDataD', @level2type=N'COLUMN',@level2name=N'PropertyLossMoney'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��Ӫҵ��������Ԫ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafetyDataD', @level2type=N'COLUMN',@level2name=N'MainBusinessIncome'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ʩ��������Ԫ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafetyDataD', @level2type=N'COLUMN',@level2name=N'ConstructionIncome'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�������������ѣ���Ԫ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafetyDataD', @level2type=N'COLUMN',@level2name=N'ProjectVolume'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��֧���ֳа��̰�ȫ����������Ԫ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafetyDataD', @level2type=N'COLUMN',@level2name=N'PaidForMoney'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����˷ֳа��̰�ȫ����������Ԫ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafetyDataD', @level2type=N'COLUMN',@level2name=N'ApprovedChargesMoney'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������Ŀ����Ͷ��İ�ȫ����������Ԫ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafetyDataD', @level2type=N'COLUMN',@level2name=N'HasBeenChargedMoney'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HSEÿ�ܻ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafetyDataD', @level2type=N'COLUMN',@level2name=N'WeekMeetingNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HSEίԱ������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafetyDataD', @level2type=N'COLUMN',@level2name=N'CommitteeMeetingNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��Ա��ѵ�˴�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafetyDataD', @level2type=N'COLUMN',@level2name=N'TrainPersonNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��Ŀ�쵼�ܰ�ȫ��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafetyDataD', @level2type=N'COLUMN',@level2name=N'WeekCheckNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ʩ���ֳ�HSE���ϼ���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafetyDataD', @level2type=N'COLUMN',@level2name=N'HSECheckNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ר�ȫ������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafetyDataD', @level2type=N'COLUMN',@level2name=N'SpecialCheckNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�豸HSE����̨/����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafetyDataD', @level2type=N'COLUMN',@level2name=N'EquipmentHSEInspectionNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ȫ��ҵ���֤����������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafetyDataD', @level2type=N'COLUMN',@level2name=N'LicenseNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����ר��ʩ������������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafetyDataD', @level2type=N'COLUMN',@level2name=N'SolutionNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����HSE����֪ͨ���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafetyDataD', @level2type=N'COLUMN',@level2name=N'ReleaseRectifyNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ر�HSE����֪ͨ���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafetyDataD', @level2type=N'COLUMN',@level2name=N'CloseRectifyNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����HSE�������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafetyDataD', @level2type=N'COLUMN',@level2name=N'ReleasePunishNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������Ԫ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafetyDataD', @level2type=N'COLUMN',@level2name=N'PunishMoney'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ӧ�����������ݴ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafetyDataD', @level2type=N'COLUMN',@level2name=N'EmergencyDrillNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����˴����˴�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafetyDataD', @level2type=N'COLUMN',@level2name=N'ParticipantsNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����ֱ��Ͷ����Ԫ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafetyDataD', @level2type=N'COLUMN',@level2name=N'DrillInput'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���������뷽ʽ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafetyDataD', @level2type=N'COLUMN',@level2name=N'DrillTypes'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ȫ�������������±�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SafetyDataD'
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

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthSummaryD', @level2type=N'COLUMN',@level2name=N'MonthSummaryId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�±�Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthSummaryD', @level2type=N'COLUMN',@level2name=N'MonthReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthSummaryD', @level2type=N'COLUMN',@level2name=N'FileContents'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���ܽ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthSummaryD'
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

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_EnvironmentalHealthMonthlyD', @level2type=N'COLUMN',@level2name=N'EnvironmentalHealthMonthlyId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�±�Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_EnvironmentalHealthMonthlyD', @level2type=N'COLUMN',@level2name=N'MonthReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������ְҵ�����±���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_EnvironmentalHealthMonthlyD'
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

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_CheckDayRecordD', @level2type=N'COLUMN',@level2name=N'CheckDayRecordId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�±�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_CheckDayRecordD', @level2type=N'COLUMN',@level2name=N'MonthReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ȫ����ʦÿ��Ѳ���¼��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_CheckDayRecordD'
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

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_ViolationRecordD', @level2type=N'COLUMN',@level2name=N'ViolationRecordId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�±�Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_ViolationRecordD', @level2type=N'COLUMN',@level2name=N'MonthReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Υ���¼���ܱ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_ViolationRecordD'
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

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthSafetyRecordD', @level2type=N'COLUMN',@level2name=N'MonthSafetyRecordId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�±�Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthSafetyRecordD', @level2type=N'COLUMN',@level2name=N'MonthReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ʩ����λ�°�ȫ���˱�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthSafetyRecordD'
GO

ALTER TABLE [dbo].[Manager_MonthSafetyRecordD]  WITH CHECK ADD  CONSTRAINT [FK_Manager_MonthSafetyRecordD_Manager_MonthReportD] FOREIGN KEY([MonthReportId])
REFERENCES [dbo].[Manager_MonthReportD] ([MonthReportId])
GO

ALTER TABLE [dbo].[Manager_MonthSafetyRecordD] CHECK CONSTRAINT [FK_Manager_MonthSafetyRecordD_Manager_MonthReportD]
GO

INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('38FBBA77-8B35-470C-90EE-6861E6DDE03F','�ճ�Ѳ��(��¼)','Check/CheckDayXA.aspx','PageHeaderFooter',25,'467A0CB9-737D-4451-965E-869EBC3A4BD6','Menu_Project',1,0)
GO
--�ճ�Ѳ�찴ť
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('5B20746A-19B6-443A-876F-36BC7781AF23','38FBBA77-8B35-470C-90EE-6861E6DDE03F','����',1)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('6871BDF0-DF82-4DC4-A955-A4273514E937','38FBBA77-8B35-470C-90EE-6861E6DDE03F','�޸�',2)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('85C79C78-B586-4652-B0A1-A8944BC61F2E','38FBBA77-8B35-470C-90EE-6861E6DDE03F','ɾ��',3)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('42BA1A15-60B1-4879-9A62-319271D4B0C3','38FBBA77-8B35-470C-90EE-6861E6DDE03F','����',4)
GO
INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('38FBBA77-8B35-470C-90EE-6861E6DDE03F','�ճ�Ѳ��(��¼)','Check/CheckDayXA.aspx','PageHeaderFooter',25,'467A0CB9-737D-4451-965E-869EBC3A4BD6','Menu_Project',1,0)
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

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckDayXA', @level2type=N'COLUMN',@level2name=N'CheckDayId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckDayXA', @level2type=N'COLUMN',@level2name=N'CheckDayCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ĿId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckDayXA', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���ϸ���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckDayXA', @level2type=N'COLUMN',@level2name=N'NotOKNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���ε�λ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckDayXA', @level2type=N'COLUMN',@level2name=N'DutyUnitIds'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���ΰ���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckDayXA', @level2type=N'COLUMN',@level2name=N'DutyTeamGroupIds'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckDayXA', @level2type=N'COLUMN',@level2name=N'WorkAreaIds'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���ϸ�������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckDayXA', @level2type=N'COLUMN',@level2name=N'Unqualified'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckDayXA', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����˵�λ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckDayXA', @level2type=N'COLUMN',@level2name=N'CompileUnit'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckDayXA', @level2type=N'COLUMN',@level2name=N'CheckDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckDayXA', @level2type=N'COLUMN',@level2name=N'HandleStation'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�Ƿ�ջ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckDayXA', @level2type=N'COLUMN',@level2name=N'IsOK'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�°��ճ�Ѳ���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckDayXA'
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




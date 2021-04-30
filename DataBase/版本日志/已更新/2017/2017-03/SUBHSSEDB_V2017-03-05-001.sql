alter table dbo.Project_ProjectUnit add PlanCostA money null
alter table dbo.Project_ProjectUnit add PlanCostB money null
alter table dbo.Accident_AccidentReport add IsNotConfirm bit null
alter table dbo.Accident_AccidentReport add NotConfirmWorkingHoursLoss nvarchar(100) null
alter table dbo.Accident_AccidentReport add NotConfirmEconomicLoss nvarchar(100) null
alter table dbo.Accident_AccidentReport add NotConfirmEconomicOtherLoss nvarchar(100) null
alter table dbo.Base_Unit alter column ProjectRange nvarchar(1000) null
GO

INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('38143A01-D17C-4234-A1A1-D90A3F887438','�����׶�','BaseInfo/WorkStage.aspx','Clock',260,'0','Menu_BaseInfo',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('39FC7E71-7021-4B74-9B03-A12C074F30F2','38143A01-D17C-4234-A1A1-D90A3F887438','����',1)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('FEAA4962-43AB-41AE-976B-499BEE1123D3','38143A01-D17C-4234-A1A1-D90A3F887438','�޸�',2)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('E90B5930-232B-46AD-97E5-0144E53CADBC','38143A01-D17C-4234-A1A1-D90A3F887438','ɾ��',3)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('EAB7496C-AC99-42D5-A609-5867E68E2691','38143A01-D17C-4234-A1A1-D90A3F887438','����',4)   
GO

CREATE TABLE [dbo].[Base_WorkStage](
	[WorkStageId] [nvarchar](50) NOT NULL,
	[WorkStageCode] [nvarchar](50) NULL,
	[WorkStageName] [nvarchar](50) NOT NULL,
	[Remarks] [nvarchar](150) NULL,
 CONSTRAINT [PK_Base_WorkStage] PRIMARY KEY CLUSTERED 
(
	[WorkStageId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_WorkStage', @level2type=N'COLUMN',@level2name=N'WorkStageId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_WorkStage', @level2type=N'COLUMN',@level2name=N'WorkStageCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����׶�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_WorkStage', @level2type=N'COLUMN',@level2name=N'WorkStageName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ע' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_WorkStage', @level2type=N'COLUMN',@level2name=N'Remarks'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����׶α�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_WorkStage'
GO

INSERT INTO dbo.Base_WorkStage(WorkStageId,WorkStageCode,WorkStageName,Remarks)
VALUES('B840CF8F-ED62-4F2D-9140-0E552015A9D6','01','�ػ�������׮','')
INSERT INTO dbo.Base_WorkStage(WorkStageId,WorkStageCode,WorkStageName,Remarks)
VALUES('145E6655-B0F5-48D9-AFA0-7BF5D13ECE85','02','�������ֽ�������ṹ','')
INSERT INTO dbo.Base_WorkStage(WorkStageId,WorkStageCode,WorkStageName,Remarks)
VALUES('C3BFD8C6-E951-4549-8FE5-AF06AD933688','03','��������','')
INSERT INTO dbo.Base_WorkStage(WorkStageId,WorkStageCode,WorkStageName,Remarks)
VALUES('415F4593-53E1-4610-9964-7D9129D87425','04','���¹ܵ�','')
INSERT INTO dbo.Base_WorkStage(WorkStageId,WorkStageCode,WorkStageName,Remarks)
VALUES('4950110D-6ACE-4144-BFE4-3988FC1E1D1C','05','�ֽṹ','')	 
INSERT INTO dbo.Base_WorkStage(WorkStageId,WorkStageCode,WorkStageName,Remarks)
VALUES('8105CFF5-5986-4361-B700-406C2536D9DA','06','�豸����е���ܵ���װ','')	
INSERT INTO dbo.Base_WorkStage(WorkStageId,WorkStageCode,WorkStageName,Remarks)
VALUES('9D927E44-CB2B-48EE-B07F-8EEC8A8F58C8','07','�����Ǳ�װ','')
INSERT INTO dbo.Base_WorkStage(WorkStageId,WorkStageCode,WorkStageName,Remarks)
VALUES('E9305293-B2BB-4E03-87EF-0B8485AA50A7','08','�������·���','')
INSERT INTO dbo.Base_WorkStage(WorkStageId,WorkStageCode,WorkStageName,Remarks)
VALUES('C5737F60-9B4D-41AE-964F-8566FBF85B09','09','��ɨ���Գ�','')
INSERT INTO dbo.Base_WorkStage(WorkStageId,WorkStageCode,WorkStageName,Remarks)
VALUES('6D93F7B7-CE7C-4DFE-86E0-FFC7ADACA20E','10','������ҵ','')
INSERT INTO dbo.Base_WorkStage(WorkStageId,WorkStageCode,WorkStageName,Remarks)
VALUES('59F921D1-84DC-4A21-AA48-E70B2A7EE976','11','����','')
GO

alter table dbo.Hazard_HazardList alter column WorkStage nvarchar(2000)
alter table dbo.Hazard_HazardSelectedItem alter column WorkStage nvarchar(2000)	
alter table dbo.Technique_HazardListType alter column WorkStage nvarchar(2000)
go

delete from dbo.Check_CheckDayDetail
delete from dbo.Check_CheckSpecialDetail
delete from dbo.Check_CheckColligationDetail
GO
alter table dbo.Check_CheckDayDetail alter column CompleteStatus bit null
alter table dbo.Check_CheckSpecialDetail alter column CompleteStatus bit null
alter table dbo.Check_CheckColligationDetail alter column CompleteStatus bit null
GO
alter table dbo.License_LicenseManager alter column StartDate nvarchar(50) null
alter table dbo.License_LicenseManager alter column EndDate nvarchar(50) null
GO


CREATE TABLE [dbo].[Manager_ResetManHours](
	[ResetManHoursId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[AccidentTypeId] [nvarchar](50) NULL,
	[Abstract] [nvarchar](20) NULL,
	[AccidentDate] [datetime] NULL,
	[BeforeManHours] [int] NULL,
	[AccidentReportId] [nvarchar](50) NULL,
	[ProjectManager] [nvarchar](50) NULL,
	[HSSEManager] [nvarchar](50) NULL,
 CONSTRAINT [PK_Manager_ResetManHours] PRIMARY KEY CLUSTERED 
(
	[ResetManHoursId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_ResetManHours', @level2type=N'COLUMN',@level2name=N'ResetManHoursId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ĿId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_ResetManHours', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�¹�����Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_ResetManHours', @level2type=N'COLUMN',@level2name=N'AccidentTypeId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��Ҫ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_ResetManHours', @level2type=N'COLUMN',@level2name=N'Abstract'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�¹�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_ResetManHours', @level2type=N'COLUMN',@level2name=N'AccidentDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'֮ǰ�ۼ��˹�ʱ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_ResetManHours', @level2type=N'COLUMN',@level2name=N'BeforeManHours'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ԭ�¹�Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_ResetManHours', @level2type=N'COLUMN',@level2name=N'AccidentReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��Ŀ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_ResetManHours', @level2type=N'COLUMN',@level2name=N'ProjectManager'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ȫ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_ResetManHours', @level2type=N'COLUMN',@level2name=N'HSSEManager'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�˹�ʱ�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_ResetManHours'
GO

ALTER TABLE [dbo].[Manager_ResetManHours]  WITH CHECK ADD  CONSTRAINT [FK_Manager_ResetManHours_Accident_AccidentReport] FOREIGN KEY([AccidentReportId])
REFERENCES [dbo].[Accident_AccidentReport] ([AccidentReportId])
GO

ALTER TABLE [dbo].[Manager_ResetManHours] CHECK CONSTRAINT [FK_Manager_ResetManHours_Accident_AccidentReport]
GO

ALTER TABLE [dbo].[Manager_ResetManHours]  WITH CHECK ADD  CONSTRAINT [FK_Manager_ResetManHours_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[Manager_ResetManHours] CHECK CONSTRAINT [FK_Manager_ResetManHours_Base_Project]
GO



alter table Hazard_HazardList add Contents nvarchar(max) null
alter table Hazard_EnvironmentalRiskList add Contents nvarchar(max) null
GO

CREATE TABLE [dbo].[Check_RectifyNotices](
	[RectifyNoticesId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NOT NULL,
	[RectifyNoticesCode] [nvarchar](50) NOT NULL,
	[UnitId] [nvarchar](50) NOT NULL,
	[WorkAreaId] [nvarchar](50) NULL,
	[CheckedDate] [datetime] NULL,
	[WrongContent] [nvarchar](3000) NULL,
	[SignPerson] [nvarchar](50) NULL,
	[SignDate] [datetime] NULL,
	[CompleteStatus] [nvarchar](3000) NULL,
	[DutyPerson] [nvarchar](50) NULL,
	[CompleteDate] [datetime] NULL,
	[IsRectify] [bit] NULL,
	[CheckPerson] [nvarchar](50) NULL,
	[AttachUrl] [nvarchar](2000) NULL,
 CONSTRAINT [PK_Check_RectifyNotices] PRIMARY KEY CLUSTERED 
(
	[RectifyNoticesId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_RectifyNotices', @level2type=N'COLUMN',@level2name=N'RectifyNoticesId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��Ŀid' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_RectifyNotices', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_RectifyNotices', @level2type=N'COLUMN',@level2name=N'RectifyNoticesCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��λId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_RectifyNotices', @level2type=N'COLUMN',@level2name=N'UnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_RectifyNotices', @level2type=N'COLUMN',@level2name=N'WorkAreaId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ܼ�ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_RectifyNotices', @level2type=N'COLUMN',@level2name=N'CheckedDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ȫ�������ݼ��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_RectifyNotices', @level2type=N'COLUMN',@level2name=N'WrongContent'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ǩ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_RectifyNotices', @level2type=N'COLUMN',@level2name=N'SignPerson'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_RectifyNotices', @level2type=N'COLUMN',@level2name=N'SignDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���Ĵ�ʩ��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_RectifyNotices', @level2type=N'COLUMN',@level2name=N'CompleteStatus'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������  ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_RectifyNotices', @level2type=N'COLUMN',@level2name=N'DutyPerson'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_RectifyNotices', @level2type=N'COLUMN',@level2name=N'CompleteDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����λ����Ƿ��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_RectifyNotices', @level2type=N'COLUMN',@level2name=N'IsRectify'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����λ�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_RectifyNotices', @level2type=N'COLUMN',@level2name=N'CheckPerson'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_RectifyNotices', @level2type=N'COLUMN',@level2name=N'AttachUrl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������֪ͨ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_RectifyNotices'
GO

ALTER TABLE [dbo].[Check_RectifyNotices]  WITH CHECK ADD  CONSTRAINT [FK_Check_RectifyNotices_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[Check_RectifyNotices] CHECK CONSTRAINT [FK_Check_RectifyNotices_Base_Project]
GO

ALTER TABLE [dbo].[Check_RectifyNotices]  WITH CHECK ADD  CONSTRAINT [FK_Check_RectifyNotices_Base_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[Check_RectifyNotices] CHECK CONSTRAINT [FK_Check_RectifyNotices_Base_Unit]
GO

ALTER TABLE [dbo].[Check_RectifyNotices]  WITH CHECK ADD  CONSTRAINT [FK_Check_RectifyNotices_ProjectData_WorkArea] FOREIGN KEY([WorkAreaId])
REFERENCES [dbo].[ProjectData_WorkArea] ([WorkAreaId])
GO

ALTER TABLE [dbo].[Check_RectifyNotices] CHECK CONSTRAINT [FK_Check_RectifyNotices_ProjectData_WorkArea]
GO

ALTER TABLE [dbo].[Check_RectifyNotices]  WITH CHECK ADD  CONSTRAINT [FK_Check_RectifyNotices_Sys_User] FOREIGN KEY([SignPerson])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[Check_RectifyNotices] CHECK CONSTRAINT [FK_Check_RectifyNotices_Sys_User]
GO

ALTER TABLE [dbo].[Check_RectifyNotices]  WITH CHECK ADD  CONSTRAINT [FK_Check_RectifyNotices_Sys_User1] FOREIGN KEY([CheckPerson])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[Check_RectifyNotices] CHECK CONSTRAINT [FK_Check_RectifyNotices_Sys_User1]
GO

--�������Ĳ˵���˰�ť
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('F6743F66-33C9-442D-A693-DEEDD6721C15','0038D764-D628-46F0-94FF-D0A22C3C45A3','���',5)
GO


--�������Ĳ˵���˰�ť
--INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
--	VALUES('F6743F66-33C9-442D-A693-DEEDD6721C15','0038D764-D628-46F0-94FF-D0A22C3C45A3','���',5)
--	GO
	
alter table dbo.Check_ProjectCheckItemSet alter column CheckItemName nvarchar(200) null
alter table dbo.Accident_AccidentReport add NotConfirmed bit null
GO

--������Ŀ��ȫ���������Ӳ˵�
INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit) 
VALUES('A139FF69-8B74-489B-AB5F-526B2207DD89','��˾��ȫ�˹�ʱ����','SafetyData/AccidentData.aspx','ApplicationFormMagnify',40,'0987D15D-3A2B-4B59-953A-A30B661E225A','Menu_Server',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('4C8EBAE4-9C31-4EE5-BCD1-2D0C1F0E28C3','A139FF69-8B74-489B-AB5F-526B2207DD89','ɾ��',1)
GO

--������ȫ�¹��Ӳ˵�
INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('6F2C0F0A-3CF6-4B28-AFE2-FB7415ECDB91','�¹�̨��','ProjectAccident/AccidentData.aspx','Page',40,'192147D8-FFD1-44BD-8BC4-9DCA3E73D708','Menu_Server',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('DFBD3C31-5742-402E-8FE8-07DF2B6AFB63','6F2C0F0A-3CF6-4B28-AFE2-FB7415ECDB91','ɾ��',1)
GO

alter table dbo.Check_ViolationPerson alter column ViolationType char(2) null
alter table dbo.Check_ViolationPerson add ViolationDef nvarchar(300) null
alter table dbo.Check_ViolationPerson alter column ViolationPersonCode nvarchar(50) null
alter table dbo.Check_ViolationPerson alter column UnitId nvarchar(50) null
alter table dbo.Check_ViolationPerson alter column PersonId nvarchar(50) null
GO
--�����������������
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('B15975E8-867B-42C8-8D99-570E9D3DA6E9','6','��֤�ϸ�',1,'ViolationTypeOther')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('7E82B247-B419-47E4-AD19-205DB2BD7C5B','7','����Υ��',2,'ViolationTypeOther')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('407E76ED-E334-41FC-86EC-BB0E8EB5CE39','8','�õ�',3,'ViolationTypeOther')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('49245CD9-EBB4-497C-A083-62B83BA5A1E8','9','����',4,'ViolationTypeOther')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('779B1C38-198E-421F-B93E-306E82168BEC','10','����',5,'ViolationTypeOther')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('894BFF6F-4EBB-4E63-87DB-CF324FC38AF1','11','���ּ�',6,'ViolationTypeOther')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('BBB85FF5-873A-455D-A077-860EA0A3329F','12','�ߴ���ҵ',7,'ViolationTypeOther')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('EE89D46A-A513-43BD-9024-6C30BC0BE8BD','13','��װ',8,'ViolationTypeOther')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('A296D1E0-0F95-4601-8636-F5D48ADD6A3B','14','����',9,'ViolationTypeOther')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('6EA4E1F2-392C-4D8B-AEC7-E8AB1E18900B','15','���޿ռ�',10,'ViolationTypeOther')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('7A963C66-C3A8-4517-AD87-56BD90DD50C8','16','��ƿ',11,'ViolationTypeOther')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('4D8CADD9-F976-414D-87EB-6B17454DDF52','17','Σ����Ʒ',12,'ViolationTypeOther')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('10A08BDF-88BF-481C-AA93-548E8081B34F','18','�����豸',13,'ViolationTypeOther')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('B90B14C5-5F52-461C-9824-D1CED893BE93','19','��������',14,'ViolationTypeOther')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('F2E6994A-E6F0-45B2-9754-D875C1F4F2E6','20','������ȫ',15,'ViolationTypeOther')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('60E933E5-9142-4C8A-A3C0-0B6AD04E09D0','21','����ʩ��',16,'ViolationTypeOther')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('31AB3064-54FC-4881-8518-1DEA628EBD21','22','ְҵ����',17,'ViolationTypeOther')
GO

--����HSSE�������������Ӳ˵�
INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('D67D1C85-3798-47A9-A0DB-B4DB47FF2E7D','�����ϱ����','ManagementReport/ReportRemind.aspx','LayoutSidebar',40,'70E51ABF-81C8-49CB-89AC-CF0542A201D6','Menu_Server',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('CD3F50A6-38ED-479C-B1F1-E6628C5A269C','D67D1C85-3798-47A9-A0DB-B4DB47FF2E7D','ɾ��',1)
GO

CREATE TABLE [dbo].[ManagementReport_ReportRemind](
	[ReportRemindId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[Months] [datetime] NULL,
	[Year] [int] NULL,
	[Month] [int] NULL,
	[Quarterly] [int] NULL,
	[HalfYear] [int] NULL,
	[ReportName] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
 CONSTRAINT [PK_ManagementReport_ReportRemind] PRIMARY KEY CLUSTERED 
(
	[ReportRemindId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ManagementReport_ReportRemind', @level2type=N'COLUMN',@level2name=N'ReportRemindId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ĿId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ManagementReport_ReportRemind', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�·�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ManagementReport_ReportRemind', @level2type=N'COLUMN',@level2name=N'Months'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ManagementReport_ReportRemind', @level2type=N'COLUMN',@level2name=N'Year'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�·�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ManagementReport_ReportRemind', @level2type=N'COLUMN',@level2name=N'Month'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ManagementReport_ReportRemind', @level2type=N'COLUMN',@level2name=N'Quarterly'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ManagementReport_ReportRemind', @level2type=N'COLUMN',@level2name=N'HalfYear'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ManagementReport_ReportRemind', @level2type=N'COLUMN',@level2name=N'ReportName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�߱���Ϣ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ManagementReport_ReportRemind'
GO

ALTER TABLE [dbo].[ManagementReport_ReportRemind]  WITH CHECK ADD  CONSTRAINT [FK_ManagementReport_ReportRemind_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[ManagementReport_ReportRemind] CHECK CONSTRAINT [FK_ManagementReport_ReportRemind_Base_Project]
GO


alter table dbo.Solution_ConstructSolution alter column InvestigateType char(1) null
alter table dbo.Solution_ConstructSolution alter column SolutinType char(2) null
GO

alter table dbo.Emergency_DrillRecordList add DrillRecordType char(1) null
alter table dbo.Emergency_DrillRecordList add JointPersonNum int null
alter table dbo.Emergency_DrillRecordList add DrillCost decimal(9,2) null
GO

--������Ӧ����������
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('4B7CB6A5-0223-4C3C-BA6B-9C8CF6E3E358','1','�ۺ������ֳ�',1,'DrillRecordType')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('DDF67DFE-6CC3-425F-ACAF-C9965BE278A0','2','�ۺ���������',2,'DrillRecordType')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('AE42B48F-CDCB-4536-8798-81C430A0BC5A','3','ר�������ֳ�',3,'DrillRecordType')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('E07F28DD-8072-4B58-8F22-005E89290489','4','ר����������',4,'DrillRecordType')
GO


alter table dbo.Technique_CheckItemSet alter column CheckItemName nvarchar(200) null
alter table dbo.Check_ProjectCheckItemSet alter column CheckItemName nvarchar(200) null
alter table dbo.Check_PunishNotice alter column UnitId nvarchar(50) null
GO




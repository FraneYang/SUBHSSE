CREATE TABLE [dbo].[Sys_HttpLog](
	[HttpLogId] [nvarchar](50) NOT NULL,
	[LogTime] [datetime] NULL,
	[UserName] [nvarchar](50) NULL,
	[HttpUrl] [nvarchar](500) NULL,
	[LogTxt] [nvarchar](max) NULL,
 CONSTRAINT [PK_Sys_HttpLog] PRIMARY KEY CLUSTERED 
(
	[HttpLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��־ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_HttpLog', @level2type=N'COLUMN',@level2name=N'LogTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_HttpLog', @level2type=N'COLUMN',@level2name=N'UserName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����·��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_HttpLog', @level2type=N'COLUMN',@level2name=N'HttpUrl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��־��Ϣ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_HttpLog', @level2type=N'COLUMN',@level2name=N'LogTxt'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HTTP������־��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_HttpLog'
GO


CREATE NONCLUSTERED INDEX [SitePerson_PersonInOut_PersonIdChangeTime] ON [dbo].[SitePerson_PersonInOut]
(
	[PersonId] ASC,
	[ChangeTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

ALTER TABLE SitePerson_PersonInOut ADD WorkPostId NVARCHAR(50) NULL
GO
ALTER TABLE SitePerson_PersonInOut ADD PostType NCHAR(1) NULL
GO
UPDATE SitePerson_PersonInOut SET WorkPostId=(SELECT WorkPostId FROM SitePerson_Person WHERE SitePerson_PersonInOut.PersonId=PersonId)
WHERE WorkPostId IS NULL
GO
UPDATE SitePerson_PersonInOut SET PostType=(SELECT PostType FROM Base_WorkPost WHERE SitePerson_PersonInOut.WorkPostId=WorkPostId)
WHERE PostType IS NULL
GO
CREATE TABLE [dbo].[SitePerson_PersonInOutNow](
	[PersonInOutId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[UnitId] [nvarchar](50) NULL,
	[PersonId] [nvarchar](50) NULL,
	[IsIn] [bit] NULL,
	[ChangeTime] [datetime] NULL,
	[InCount] [int] NULL,
	[OutCount] [int] NULL,
	[TotalCount] [int] NULL,
	[ProjectHeadConfirmId] [nvarchar](50) NULL,
	[WorkPostId] [nvarchar](50) NULL,
	[PostType] [nchar](1) NULL,
 CONSTRAINT [PK_SitePerson_PersonInOutNow] PRIMARY KEY CLUSTERED 
(
	[PersonInOutId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���ճ��볡��¼��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_PersonInOutNow'
GO
CREATE NONCLUSTERED INDEX [SitePerson_PersonInOutNow_PersonIdChangeTime] ON [dbo].[SitePerson_PersonInOutNow]
(
	[PersonId] ASC,
	[ChangeTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

--INSERT INTO dbo.SitePerson_PersonInOutNow(PersonInOutId,ProjectId,UnitId,PersonId,IsIn,ChangeTime,InCount,OutCount
--,TotalCount,ProjectHeadConfirmId,WorkPostId,PostType)
--(SELECT PersonInOutId,ProjectId,UnitId,PersonId,IsIn,ChangeTime,InCount,OutCount
--,TotalCount,ProjectHeadConfirmId,WorkPostId,PostType
--FROM SitePerson_PersonInOut WHERE ChangeTime >= DATEADD(DAY,-1,GETDATE()))
--GO

ALTER TABLE QualityAudit_PersonQuality ADD  AuditorId NVARCHAR(50)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_PersonQuality', @level2type=N'COLUMN',@level2name=N'AuditorId'
GO
ALTER TABLE [dbo].[QualityAudit_PersonQuality]  WITH CHECK ADD  CONSTRAINT [FK_QualityAudit_PersonQuality_Sys_User_AuditorId] FOREIGN KEY([AuditorId])
REFERENCES [dbo].[Sys_User] ([UserId])
GO
ALTER TABLE [dbo].[QualityAudit_PersonQuality] CHECK CONSTRAINT [FK_QualityAudit_PersonQuality_Sys_User_AuditorId]
GO
ALTER TABLE QualityAudit_PersonQuality ADD AuditOpinion NVARCHAR(200)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_PersonQuality', @level2type=N'COLUMN',@level2name=N'AuditOpinion'
GO
ALTER TABLE QualityAudit_PersonQuality ADD States VARCHAR(2)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���״̬��0-���ύ��1-����ˣ�2-����ˣ�-1��أ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_PersonQuality', @level2type=N'COLUMN',@level2name=N'States'
GO

ALTER TABLE QualityAudit_SafePersonQuality ADD  AuditorId NVARCHAR(50)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_SafePersonQuality', @level2type=N'COLUMN',@level2name=N'AuditorId'
GO
ALTER TABLE [dbo].[QualityAudit_SafePersonQuality]  WITH CHECK ADD  CONSTRAINT [FK_QualityAudit_SafePersonQuality_Sys_User_AuditorId] FOREIGN KEY([AuditorId])
REFERENCES [dbo].[Sys_User] ([UserId])
GO
ALTER TABLE [dbo].[QualityAudit_SafePersonQuality] CHECK CONSTRAINT [FK_QualityAudit_SafePersonQuality_Sys_User_AuditorId]
GO
ALTER TABLE QualityAudit_SafePersonQuality ADD AuditOpinion NVARCHAR(200)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_SafePersonQuality', @level2type=N'COLUMN',@level2name=N'AuditOpinion'
GO
ALTER TABLE QualityAudit_SafePersonQuality ADD States VARCHAR(2)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���״̬��0-���ύ��1-����ˣ�2-����ˣ�-1��أ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_SafePersonQuality', @level2type=N'COLUMN',@level2name=N'States'
GO

ALTER TABLE ProjectData_TeamGroup ADD GroupLeaderId NVARCHAR(50) NULL
GO
ALTER TABLE [dbo].[ProjectData_TeamGroup]  WITH CHECK ADD  CONSTRAINT [FK_ProjectData_TeamGroup_SitePerson_Person] FOREIGN KEY([GroupLeaderId])
REFERENCES [dbo].[SitePerson_Person] ([PersonId])
GO
ALTER TABLE [dbo].[ProjectData_TeamGroup] CHECK CONSTRAINT [FK_ProjectData_TeamGroup_SitePerson_Person]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���鳤' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectData_TeamGroup', @level2type=N'COLUMN',@level2name=N'GroupLeaderId'
GO


--֪ʶ�����ƶ��ƻ���

CREATE TABLE [dbo].[Test_TestPlan](
	[TestPlanId] [nvarchar](50) NOT NULL,
	[PlanCode] [nvarchar](50) NULL,
	[PlanName] [nvarchar](300) NULL,
	[PlanManId] [nvarchar](50) NULL,
	[PlanDate] [datetime] NULL,
	[TestStartTime] [datetime] NULL,
	[TestEndTime] [datetime] NULL,
	[Duration] [int] NULL,
	[TotalScore] [int] NULL,
	[QuestionCount] [int] NULL,
	[TestPalce] [nvarchar](500) NULL,
	[QRCodeUrl] [nvarchar](2000) NULL,
	[SValue] [int] NULL,
	[MValue] [int] NULL,
	[JValue] [int] NULL,
	[ActualTime] [datetime] NULL,
	[States] [varchar](2) NULL,
 CONSTRAINT [PK_Test_TestPlan] PRIMARY KEY CLUSTERED 
(
	[TestPlanId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Test_TestPlan]  WITH CHECK ADD  CONSTRAINT [FK_Test_TestPlan_Sys_User] FOREIGN KEY([PlanManId])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[Test_TestPlan] CHECK CONSTRAINT [FK_Test_TestPlan_Sys_User]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���Լƻ�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestPlan', @level2type=N'COLUMN',@level2name=N'TestPlanId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestPlan', @level2type=N'COLUMN',@level2name=N'PlanCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ƻ�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestPlan', @level2type=N'COLUMN',@level2name=N'PlanName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ƻ��ƶ���id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestPlan', @level2type=N'COLUMN',@level2name=N'PlanManId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ƻ��ƶ�ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestPlan', @level2type=N'COLUMN',@level2name=N'PlanDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ƻ����Կ�ʼʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestPlan', @level2type=N'COLUMN',@level2name=N'TestStartTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ƻ�����ɨ�����ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestPlan', @level2type=N'COLUMN',@level2name=N'TestEndTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����ʱ������λ�����ӣ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestPlan', @level2type=N'COLUMN',@level2name=N'Duration'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ܷ�ֵ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestPlan', @level2type=N'COLUMN',@level2name=N'TotalScore'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��Ŀ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestPlan', @level2type=N'COLUMN',@level2name=N'QuestionCount'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���Եص�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestPlan', @level2type=N'COLUMN',@level2name=N'TestPalce'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ά��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestPlan', @level2type=N'COLUMN',@level2name=N'QRCodeUrl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ʵ�ʽ���ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestPlan', @level2type=N'COLUMN',@level2name=N'ActualTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���Լƻ�״̬��0-���ύ��1-�ѷ���δ���ԣ�2-�����У�3���Խ�����-1���ϣ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestPlan', @level2type=N'COLUMN',@level2name=N'States'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'֪ʶ�����ƶ��ƻ���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestPlan'
GO


--��������������
CREATE TABLE [dbo].[Test_TestPlanTraining](
	[TestPlanTrainingId] [nvarchar](50) NOT NULL,
	[TestPlanId] [nvarchar](50) NULL,
	[TrainingId] [nvarchar](50) NULL,
	[TestType1Count] [int] NULL,
	[TestType2Count] [int] NULL,
	[TestType3Count] [int] NULL,
	[UserType] [varchar](2) NULL,
 CONSTRAINT [PK_Test_TestPlanTraining] PRIMARY KEY CLUSTERED 
(
	[TestPlanTrainingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Test_TestPlanTraining]  WITH CHECK ADD  CONSTRAINT [FK_Test_TestPlanTraining_Test_TestPlan] FOREIGN KEY([TestPlanId])
REFERENCES [dbo].[Test_TestPlan] ([TestPlanId])
GO

ALTER TABLE [dbo].[Test_TestPlanTraining] CHECK CONSTRAINT [FK_Test_TestPlanTraining_Test_TestPlan]
GO

ALTER TABLE [dbo].[Test_TestPlanTraining]  WITH CHECK ADD  CONSTRAINT [FK_Test_TestPlanTraining_Training_TestTraining1] FOREIGN KEY([TrainingId])
REFERENCES [dbo].[Training_TestTraining] ([TrainingId])
GO

ALTER TABLE [dbo].[Test_TestPlanTraining] CHECK CONSTRAINT [FK_Test_TestPlanTraining_Training_TestTraining1]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�������ͱ�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestPlanTraining', @level2type=N'COLUMN',@level2name=N'TestPlanTrainingId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���Լƻ�id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestPlanTraining', @level2type=N'COLUMN',@level2name=N'TestPlanId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestPlanTraining', @level2type=N'COLUMN',@level2name=N'TrainingId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ѡ������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestPlanTraining', @level2type=N'COLUMN',@level2name=N'TestType1Count'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ѡ������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestPlanTraining', @level2type=N'COLUMN',@level2name=N'TestType2Count'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ж�������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestPlanTraining', @level2type=N'COLUMN',@level2name=N'TestType3Count'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��Ա���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestPlanTraining', @level2type=N'COLUMN',@level2name=N'UserType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestPlanTraining'
GO

--�����¼��
CREATE TABLE [dbo].[Test_TestRecord](
	[TestRecordId] [nvarchar](50) NOT NULL,
	[TestPlanId] [nvarchar](50) NULL,
	[TestManId] [nvarchar](50) NULL,
	[ManType] [varchar](2) NULL,
	[TestManName] [nvarchar](50) NULL,
	[TestStartTime] [datetime] NULL,
	[TotalScore] [int] NULL,
	[QuestionCount] [int] NULL,
	[Duration] [int] NULL,
	[TestEndTime] [datetime] NULL,
	[TestScores] [decimal](18, 1) NULL,
	[UnitId] [nvarchar](50) NULL,
	[DepartId] [nvarchar](50) NULL,
	[ProjectId] [nvarchar](50) NULL,
	[WorkPostId] [nvarchar](50) NULL,
	[IdentityCard] [nvarchar](50) NULL,
	[Telephone] [nvarchar](50) NULL,
 CONSTRAINT [PK_Test_TestRecord] PRIMARY KEY CLUSTERED 
(
	[TestRecordId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Test_TestRecord]  WITH CHECK ADD  CONSTRAINT [FK_Test_TestRecord_Base_Depart] FOREIGN KEY([DepartId])
REFERENCES [dbo].[Base_Depart] ([DepartId])
GO

ALTER TABLE [dbo].[Test_TestRecord] CHECK CONSTRAINT [FK_Test_TestRecord_Base_Depart]
GO

ALTER TABLE [dbo].[Test_TestRecord]  WITH CHECK ADD  CONSTRAINT [FK_Test_TestRecord_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[Test_TestRecord] CHECK CONSTRAINT [FK_Test_TestRecord_Base_Project]
GO

ALTER TABLE [dbo].[Test_TestRecord]  WITH CHECK ADD  CONSTRAINT [FK_Test_TestRecord_Base_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[Test_TestRecord] CHECK CONSTRAINT [FK_Test_TestRecord_Base_Unit]
GO

ALTER TABLE [dbo].[Test_TestRecord]  WITH CHECK ADD  CONSTRAINT [FK_Test_TestRecord_Base_WorkPost] FOREIGN KEY([WorkPostId])
REFERENCES [dbo].[Base_WorkPost] ([WorkPostId])
GO

ALTER TABLE [dbo].[Test_TestRecord] CHECK CONSTRAINT [FK_Test_TestRecord_Base_WorkPost]
GO

ALTER TABLE [dbo].[Test_TestRecord]  WITH CHECK ADD  CONSTRAINT [FK_Test_TestRecord_Test_TestPlan] FOREIGN KEY([TestPlanId])
REFERENCES [dbo].[Test_TestPlan] ([TestPlanId])
GO

ALTER TABLE [dbo].[Test_TestRecord] CHECK CONSTRAINT [FK_Test_TestRecord_Test_TestPlan]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���Լ�¼����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestRecord', @level2type=N'COLUMN',@level2name=N'TestRecordId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���Լƻ���id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestRecord', @level2type=N'COLUMN',@level2name=N'TestPlanId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestRecord', @level2type=N'COLUMN',@level2name=N'TestManId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��Ա���ͣ�1-�û���2-�ֳ���Ա��3-��ʱ��Ա��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestRecord', @level2type=N'COLUMN',@level2name=N'ManType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestRecord', @level2type=N'COLUMN',@level2name=N'TestManName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���Կ�ʼʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestRecord', @level2type=N'COLUMN',@level2name=N'TestStartTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ܷ�ֵ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestRecord', @level2type=N'COLUMN',@level2name=N'TotalScore'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��Ŀ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestRecord', @level2type=N'COLUMN',@level2name=N'QuestionCount'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����ʱ�������ӣ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestRecord', @level2type=N'COLUMN',@level2name=N'Duration'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���Խ���ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestRecord', @level2type=N'COLUMN',@level2name=N'TestEndTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���Գɼ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestRecord', @level2type=N'COLUMN',@level2name=N'TestScores'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������λID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestRecord', @level2type=N'COLUMN',@level2name=N'UnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestRecord', @level2type=N'COLUMN',@level2name=N'DepartId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������ĿId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestRecord', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������λID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestRecord', @level2type=N'COLUMN',@level2name=N'WorkPostId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���֤����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestRecord', @level2type=N'COLUMN',@level2name=N'IdentityCard'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ֻ�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestRecord', @level2type=N'COLUMN',@level2name=N'Telephone'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����¼��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestRecord'
GO


--�����¼��ϸ��

CREATE TABLE [dbo].[Test_TestRecordItem](
	[TestRecordItemId] [nvarchar](50) NOT NULL,
	[TestRecordId] [nvarchar](50) NULL,
	[Abstracts] [nvarchar](2000) NULL,
	[AttachUrl] [nvarchar](2000) NULL,
	[TestType] [char](1) NULL,
	[AItem] [nvarchar](500) NULL,
	[BItem] [nvarchar](500) NULL,
	[CItem] [nvarchar](500) NULL,
	[DItem] [nvarchar](500) NULL,
	[EItem] [nvarchar](500) NULL,
	[AnswerItems] [nvarchar](50) NULL,
	[Score] [int] NULL,
	[SubjectScore] [decimal](18, 1) NULL,
	[SelectedItem] [nvarchar](50) NULL,
	[TrainingItemCode] [nvarchar](50) NULL,
 CONSTRAINT [PK_Test_TestRecordItem] PRIMARY KEY CLUSTERED 
(
	[TestRecordItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Test_TestRecordItem]  WITH CHECK ADD  CONSTRAINT [FK_Test_TestRecordItem_Test_TestRecord] FOREIGN KEY([TestRecordId])
REFERENCES [dbo].[Test_TestRecord] ([TestRecordId])
GO

ALTER TABLE [dbo].[Test_TestRecordItem] CHECK CONSTRAINT [FK_Test_TestRecordItem_Test_TestRecord]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���Լ�¼��ϸ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestRecordItem', @level2type=N'COLUMN',@level2name=N'TestRecordItemId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���Լ�¼����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestRecordItem', @level2type=N'COLUMN',@level2name=N'TestRecordId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��Ŀ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestRecordItem', @level2type=N'COLUMN',@level2name=N'Abstracts'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��Ŀ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestRecordItem', @level2type=N'COLUMN',@level2name=N'AttachUrl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���ͣ�1-��ѡ��2-��ѡ��3-�ж��⣩' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestRecordItem', @level2type=N'COLUMN',@level2name=N'TestType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����A' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestRecordItem', @level2type=N'COLUMN',@level2name=N'AItem'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����B' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestRecordItem', @level2type=N'COLUMN',@level2name=N'BItem'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����C' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestRecordItem', @level2type=N'COLUMN',@level2name=N'CItem'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����D' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestRecordItem', @level2type=N'COLUMN',@level2name=N'DItem'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����E' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestRecordItem', @level2type=N'COLUMN',@level2name=N'EItem'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ȷ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestRecordItem', @level2type=N'COLUMN',@level2name=N'AnswerItems'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��Ŀ��ֵ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestRecordItem', @level2type=N'COLUMN',@level2name=N'Score'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��Ŀ�÷�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestRecordItem', @level2type=N'COLUMN',@level2name=N'SubjectScore'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ش���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestRecordItem', @level2type=N'COLUMN',@level2name=N'SelectedItem'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��Ŀ���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestRecordItem', @level2type=N'COLUMN',@level2name=N'TrainingItemCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���Լ�¼��ϸ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestRecordItem'
GO

CREATE VIEW [dbo].[View_Test_TestPlanTraining]
AS
/*֪ʶ��������������ͼ*/
SELECT	TestPlanTrainingId
	,TestPlanId
	,Test.TrainingId
	,Training.TrainingCode
	,Training.TrainingName
	,TestType1Count
	,TestType2Count
	,TestType3Count
	,UserType
	,(CASE WHEN UserType='1' THEN '������Ա' WHEN UserType='2' THEN '��ʱ�û�' ELSE '��ҵ��Ա' END) AS UserTypeName
FROM dbo.Test_TestPlanTraining AS Test
LEFT JOIN Training_TestTraining AS Training ON Test.TrainingId=Training.TrainingId

GO


CREATE TABLE [dbo].[Emergency_EmergencyTeamItem](
	[EmergencyTeamItemId] [nvarchar](50) NOT NULL,
	[FileId] [nvarchar](50) NULL,
	[PersonId] [nvarchar](50) NULL,
	[Job] [nvarchar](50) NULL,
	[Tel] [nvarchar](50) NULL,
 CONSTRAINT [PK_Emergency_EmergencyTeamItem] PRIMARY KEY CLUSTERED 
(
	[EmergencyTeamItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Emergency_EmergencyTeamItem]  WITH CHECK ADD  CONSTRAINT [FK_Emergency_EmergencyTeamItem_Emergency_EmergencyTeamAndTrain] FOREIGN KEY([FileId])
REFERENCES [dbo].[Emergency_EmergencyTeamAndTrain] ([FileId])
GO

ALTER TABLE [dbo].[Emergency_EmergencyTeamItem] CHECK CONSTRAINT [FK_Emergency_EmergencyTeamItem_Emergency_EmergencyTeamAndTrain]
GO

ALTER TABLE [dbo].[Emergency_EmergencyTeamItem]  WITH CHECK ADD  CONSTRAINT [FK_Emergency_EmergencyTeamItem_SitePerson_Person] FOREIGN KEY([PersonId])
REFERENCES [dbo].[SitePerson_Person] ([PersonId])
GO

ALTER TABLE [dbo].[Emergency_EmergencyTeamItem] CHECK CONSTRAINT [FK_Emergency_EmergencyTeamItem_SitePerson_Person]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ְ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_EmergencyTeamItem', @level2type=N'COLUMN',@level2name=N'Job'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�绰' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_EmergencyTeamItem', @level2type=N'COLUMN',@level2name=N'Tel'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ӧ��������Ա��Ϣ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_EmergencyTeamItem'
GO


CREATE TABLE [dbo].[Emergency_EmergencyProcess](
	[EmergencyProcessId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[ProcessSteps] [nvarchar](50) NULL,
	[ProcessName] [nvarchar](50) NULL,
	[StepOperator] [nvarchar](50) NULL,
	[Remark] [nvarchar](800) NULL,
 CONSTRAINT [PK_Emergency_EmergencyProcess] PRIMARY KEY CLUSTERED 
(
	[EmergencyProcessId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Emergency_EmergencyProcess]  WITH CHECK ADD  CONSTRAINT [FK_Emergency_EmergencyProcess_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[Emergency_EmergencyProcess] CHECK CONSTRAINT [FK_Emergency_EmergencyProcess_Base_Project]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ĿID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_EmergencyProcess', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_EmergencyProcess', @level2type=N'COLUMN',@level2name=N'ProcessSteps'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_EmergencyProcess', @level2type=N'COLUMN',@level2name=N'ProcessName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_EmergencyProcess', @level2type=N'COLUMN',@level2name=N'StepOperator'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ʾ��Ϣ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_EmergencyProcess', @level2type=N'COLUMN',@level2name=N'Remark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ӧ�����̱�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_EmergencyProcess'
GO


CREATE VIEW [dbo].[View_Emergency_EmergencyTeamItem]
AS
/*֪ʶ��������������ͼ*/
SELECT	EmergencyTeamItemId
	,FileId
	,T.PersonId
	,P.PersonName
	,Job
	,Tel
FROM dbo.Emergency_EmergencyTeamItem AS T
LEFT JOIN SitePerson_Person AS P ON T.PersonId = P.PersonId

GO

INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('A5D0287B-2410-4DB1-8BD4-E0534EBAE308','Ӧ������','Emergency/EmergencyProcess.aspx','PageHeaderFooter',60,'B6FBD6B6-F9A0-49B1-87F9-160748162131','Menu_Project',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('02E696EB-0444-4D75-BD4A-51A6BC0F8843','A5D0287B-2410-4DB1-8BD4-E0534EBAE308','����',1)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('4BFFFBD3-9EED-4B2B-938D-93429337E988','A5D0287B-2410-4DB1-8BD4-E0534EBAE308','�޸�',2)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('E81F86B1-ADC6-4567-834A-46CC96E09198','A5D0287B-2410-4DB1-8BD4-E0534EBAE308','ɾ��',3)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('D2A08B2D-C954-4E9D-85E9-27CF0476A3D9','A5D0287B-2410-4DB1-8BD4-E0534EBAE308','����',4)  
GO

INSERT INTO Emergency_EmergencyProcess(EmergencyProcessId,ProcessSteps,ProcessName,StepOperator,Remark)
VALUES('8C67B045-4F83-4158-BC1F-96914F0C9FF7',0,'����','�����˻�Ŀ����','�������ݰ����� ����������� ���¹ʷ����ص� ���¹ʷ�����λ ���ܵ�Ӱ�����Ա��Ŀ �����ܵ��µ��˺� ����Ҫ��ȡ�Ĵ�ʩ')
GO
INSERT INTO Emergency_EmergencyProcess(EmergencyProcessId,ProcessSteps,ProcessName,StepOperator,Remark)
VALUES('BB4148A9-68EF-4EBF-BDB9-44FF42C7DC15',1,'��Ϣ�ӱ��� �����ж�','��ĿӦ��ָ������ �칫��','�����ж����ݰ�����')
GO
INSERT INTO Emergency_EmergencyProcess(EmergencyProcessId,ProcessSteps,ProcessName,StepOperator,Remark)
VALUES('0C685F93-EDFD-4225-A6B2-7A5A4E66C0D2',2,'Ӧ������ ','��ĿӦ���쵼С��','֪ͨ�����Ա��1��������ɢ��2����Ӧ������3������֧����4������������5��ҽ�ƾȻ��ӣ��¹ʱ��棺������˾�����Ź�˾��ҵ�������������� ')
GO
INSERT INTO Emergency_EmergencyProcess(EmergencyProcessId,ProcessSteps,ProcessName,StepOperator,Remark)
VALUES('AF422D6F-9B0F-4217-AA02-A9EB095FB425',3,'Ӧ���ָ�','��ĿӦ���쵼С��','1��������ɢ��2����Ӧ������3������֧����4������������5��ҽ�ƾȻ���')
GO
INSERT INTO Emergency_EmergencyProcess(EmergencyProcessId,ProcessSteps,ProcessName,StepOperator,Remark)
VALUES('01D50303-16C1-4CB5-9D41-CC830C6BE9B8',4,'Ӧ������','��ĿӦ���쵼С��','')
GO
INSERT INTO Emergency_EmergencyProcess(EmergencyProcessId,ProcessSteps,ProcessName,StepOperator,Remark)
VALUES('031A1E80-B626-4F77-8AE3-F4C67789DF01',5,'�ܽ�����','�����Ա','')
GO
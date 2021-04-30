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

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'日志时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_HttpLog', @level2type=N'COLUMN',@level2name=N'LogTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_HttpLog', @level2type=N'COLUMN',@level2name=N'UserName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'请求路径' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_HttpLog', @level2type=N'COLUMN',@level2name=N'HttpUrl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'日志信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_HttpLog', @level2type=N'COLUMN',@level2name=N'LogTxt'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HTTP请求日志表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_HttpLog'
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

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'当日出入场记录表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_PersonInOutNow'
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
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'审核人ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_PersonQuality', @level2type=N'COLUMN',@level2name=N'AuditorId'
GO
ALTER TABLE [dbo].[QualityAudit_PersonQuality]  WITH CHECK ADD  CONSTRAINT [FK_QualityAudit_PersonQuality_Sys_User_AuditorId] FOREIGN KEY([AuditorId])
REFERENCES [dbo].[Sys_User] ([UserId])
GO
ALTER TABLE [dbo].[QualityAudit_PersonQuality] CHECK CONSTRAINT [FK_QualityAudit_PersonQuality_Sys_User_AuditorId]
GO
ALTER TABLE QualityAudit_PersonQuality ADD AuditOpinion NVARCHAR(200)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'审核意见' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_PersonQuality', @level2type=N'COLUMN',@level2name=N'AuditOpinion'
GO
ALTER TABLE QualityAudit_PersonQuality ADD States VARCHAR(2)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'审核状态（0-待提交；1-待审核；2-已审核；-1打回）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_PersonQuality', @level2type=N'COLUMN',@level2name=N'States'
GO

ALTER TABLE QualityAudit_SafePersonQuality ADD  AuditorId NVARCHAR(50)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'审核人ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_SafePersonQuality', @level2type=N'COLUMN',@level2name=N'AuditorId'
GO
ALTER TABLE [dbo].[QualityAudit_SafePersonQuality]  WITH CHECK ADD  CONSTRAINT [FK_QualityAudit_SafePersonQuality_Sys_User_AuditorId] FOREIGN KEY([AuditorId])
REFERENCES [dbo].[Sys_User] ([UserId])
GO
ALTER TABLE [dbo].[QualityAudit_SafePersonQuality] CHECK CONSTRAINT [FK_QualityAudit_SafePersonQuality_Sys_User_AuditorId]
GO
ALTER TABLE QualityAudit_SafePersonQuality ADD AuditOpinion NVARCHAR(200)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'审核意见' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_SafePersonQuality', @level2type=N'COLUMN',@level2name=N'AuditOpinion'
GO
ALTER TABLE QualityAudit_SafePersonQuality ADD States VARCHAR(2)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'审核状态（0-待提交；1-待审核；2-已审核；-1打回）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_SafePersonQuality', @level2type=N'COLUMN',@level2name=N'States'
GO

ALTER TABLE ProjectData_TeamGroup ADD GroupLeaderId NVARCHAR(50) NULL
GO
ALTER TABLE [dbo].[ProjectData_TeamGroup]  WITH CHECK ADD  CONSTRAINT [FK_ProjectData_TeamGroup_SitePerson_Person] FOREIGN KEY([GroupLeaderId])
REFERENCES [dbo].[SitePerson_Person] ([PersonId])
GO
ALTER TABLE [dbo].[ProjectData_TeamGroup] CHECK CONSTRAINT [FK_ProjectData_TeamGroup_SitePerson_Person]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'班组长' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectData_TeamGroup', @level2type=N'COLUMN',@level2name=N'GroupLeaderId'
GO


--知识竞赛制定计划表

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

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'考试计划主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestPlan', @level2type=N'COLUMN',@level2name=N'TestPlanId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestPlan', @level2type=N'COLUMN',@level2name=N'PlanCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'计划名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestPlan', @level2type=N'COLUMN',@level2name=N'PlanName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'计划制定人id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestPlan', @level2type=N'COLUMN',@level2name=N'PlanManId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'计划制定时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestPlan', @level2type=N'COLUMN',@level2name=N'PlanDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'计划考试开始时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestPlan', @level2type=N'COLUMN',@level2name=N'TestStartTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'计划考试扫描结束时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestPlan', @level2type=N'COLUMN',@level2name=N'TestEndTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'考试时长（单位：分钟）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestPlan', @level2type=N'COLUMN',@level2name=N'Duration'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'总分值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestPlan', @level2type=N'COLUMN',@level2name=N'TotalScore'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'题目数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestPlan', @level2type=N'COLUMN',@level2name=N'QuestionCount'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'考试地点' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestPlan', @level2type=N'COLUMN',@level2name=N'TestPalce'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'二维码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestPlan', @level2type=N'COLUMN',@level2name=N'QRCodeUrl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'实际结束时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestPlan', @level2type=N'COLUMN',@level2name=N'ActualTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'考试计划状态（0-待提交；1-已发布未考试；2-考试中；3考试结束；-1作废）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestPlan', @level2type=N'COLUMN',@level2name=N'States'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'知识竞赛制定计划表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestPlan'
GO


--试题类型数量表
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

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'考题类型表主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestPlanTraining', @level2type=N'COLUMN',@level2name=N'TestPlanTrainingId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'考试计划id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestPlanTraining', @level2type=N'COLUMN',@level2name=N'TestPlanId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'考题类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestPlanTraining', @level2type=N'COLUMN',@level2name=N'TrainingId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单选题数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestPlanTraining', @level2type=N'COLUMN',@level2name=N'TestType1Count'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'多选题数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestPlanTraining', @level2type=N'COLUMN',@level2name=N'TestType2Count'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'判断题数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestPlanTraining', @level2type=N'COLUMN',@level2name=N'TestType3Count'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'人员类别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestPlanTraining', @level2type=N'COLUMN',@level2name=N'UserType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'试题类型数量表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestPlanTraining'
GO

--答题记录表
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

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'考试记录主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestRecord', @level2type=N'COLUMN',@level2name=N'TestRecordId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'考试计划表id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestRecord', @level2type=N'COLUMN',@level2name=N'TestPlanId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'考生id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestRecord', @level2type=N'COLUMN',@level2name=N'TestManId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'人员类型（1-用户；2-现场人员；3-临时人员）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestRecord', @level2type=N'COLUMN',@level2name=N'ManType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'考生姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestRecord', @level2type=N'COLUMN',@level2name=N'TestManName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'考试开始时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestRecord', @level2type=N'COLUMN',@level2name=N'TestStartTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'总分值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestRecord', @level2type=N'COLUMN',@level2name=N'TotalScore'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'题目数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestRecord', @level2type=N'COLUMN',@level2name=N'QuestionCount'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'考试时长（分钟）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestRecord', @level2type=N'COLUMN',@level2name=N'Duration'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'考试结束时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestRecord', @level2type=N'COLUMN',@level2name=N'TestEndTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'考试成绩' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestRecord', @level2type=N'COLUMN',@level2name=N'TestScores'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'考生单位ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestRecord', @level2type=N'COLUMN',@level2name=N'UnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'考生部门ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestRecord', @level2type=N'COLUMN',@level2name=N'DepartId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'考生项目Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestRecord', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'考生岗位ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestRecord', @level2type=N'COLUMN',@level2name=N'WorkPostId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'身份证号码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestRecord', @level2type=N'COLUMN',@level2name=N'IdentityCard'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'手机号码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestRecord', @level2type=N'COLUMN',@level2name=N'Telephone'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'答题记录表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestRecord'
GO


--答题记录明细表

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

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'考试记录明细主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestRecordItem', @level2type=N'COLUMN',@level2name=N'TestRecordItemId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'考试记录主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestRecordItem', @level2type=N'COLUMN',@level2name=N'TestRecordId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'题目内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestRecordItem', @level2type=N'COLUMN',@level2name=N'Abstracts'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'题目附件' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestRecordItem', @level2type=N'COLUMN',@level2name=N'AttachUrl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'题型（1-单选；2-多选；3-判断题）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestRecordItem', @level2type=N'COLUMN',@level2name=N'TestType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'答案项A' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestRecordItem', @level2type=N'COLUMN',@level2name=N'AItem'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'答案项B' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestRecordItem', @level2type=N'COLUMN',@level2name=N'BItem'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'答案项C' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestRecordItem', @level2type=N'COLUMN',@level2name=N'CItem'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'答案项D' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestRecordItem', @level2type=N'COLUMN',@level2name=N'DItem'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'答案项E' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestRecordItem', @level2type=N'COLUMN',@level2name=N'EItem'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'正确答案项' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestRecordItem', @level2type=N'COLUMN',@level2name=N'AnswerItems'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'题目分值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestRecordItem', @level2type=N'COLUMN',@level2name=N'Score'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'题目得分' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestRecordItem', @level2type=N'COLUMN',@level2name=N'SubjectScore'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'回答项' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestRecordItem', @level2type=N'COLUMN',@level2name=N'SelectedItem'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'题目编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestRecordItem', @level2type=N'COLUMN',@level2name=N'TrainingItemCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'考试记录明细表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test_TestRecordItem'
GO

CREATE VIEW [dbo].[View_Test_TestPlanTraining]
AS
/*知识竞赛试题类型视图*/
SELECT	TestPlanTrainingId
	,TestPlanId
	,Test.TrainingId
	,Training.TrainingCode
	,Training.TrainingName
	,TestType1Count
	,TestType2Count
	,TestType3Count
	,UserType
	,(CASE WHEN UserType='1' THEN '管理人员' WHEN UserType='2' THEN '临时用户' ELSE '作业人员' END) AS UserTypeName
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

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'职务' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_EmergencyTeamItem', @level2type=N'COLUMN',@level2name=N'Job'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'电话' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_EmergencyTeamItem', @level2type=N'COLUMN',@level2name=N'Tel'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'应急队伍人员信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_EmergencyTeamItem'
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

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_EmergencyProcess', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'步骤' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_EmergencyProcess', @level2type=N'COLUMN',@level2name=N'ProcessSteps'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'步骤名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_EmergencyProcess', @level2type=N'COLUMN',@level2name=N'ProcessName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'步骤操作人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_EmergencyProcess', @level2type=N'COLUMN',@level2name=N'StepOperator'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'提示信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_EmergencyProcess', @level2type=N'COLUMN',@level2name=N'Remark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'应急流程表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_EmergencyProcess'
GO


CREATE VIEW [dbo].[View_Emergency_EmergencyTeamItem]
AS
/*知识竞赛试题类型视图*/
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
VALUES('A5D0287B-2410-4DB1-8BD4-E0534EBAE308','应急流程','Emergency/EmergencyProcess.aspx','PageHeaderFooter',60,'B6FBD6B6-F9A0-49B1-87F9-160748162131','Menu_Project',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('02E696EB-0444-4D75-BD4A-51A6BC0F8843','A5D0287B-2410-4DB1-8BD4-E0534EBAE308','增加',1)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('4BFFFBD3-9EED-4B2B-938D-93429337E988','A5D0287B-2410-4DB1-8BD4-E0534EBAE308','修改',2)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('E81F86B1-ADC6-4567-834A-46CC96E09198','A5D0287B-2410-4DB1-8BD4-E0534EBAE308','删除',3)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('D2A08B2D-C954-4E9D-85E9-27CF0476A3D9','A5D0287B-2410-4DB1-8BD4-E0534EBAE308','保存',4)  
GO

INSERT INTO Emergency_EmergencyProcess(EmergencyProcessId,ProcessSteps,ProcessName,StepOperator,Remark)
VALUES('8C67B045-4F83-4158-BC1F-96914F0C9FF7',0,'报告','当事人或目击者','报告内容包括： －报告人身份 －事故发生地点 －事故发生单位 －受到影响的人员数目 －可能导致的伤害 －需要采取的措施')
GO
INSERT INTO Emergency_EmergencyProcess(EmergencyProcessId,ProcessSteps,ProcessName,StepOperator,Remark)
VALUES('BB4148A9-68EF-4EBF-BDB9-44FF42C7DC15',1,'信息接报及 警情判断','项目应急指挥中心 办公室','警情判断内容包括：')
GO
INSERT INTO Emergency_EmergencyProcess(EmergencyProcessId,ProcessSteps,ProcessName,StepOperator,Remark)
VALUES('0C685F93-EDFD-4225-A6B2-7A5A4E66C0D2',2,'应急启动 ','项目应急领导小组','通知相关人员：1、警戒疏散组2、供应保障组3、技术支持组4、义务消防队5、医疗救护队；事故报告：赛鼎公司、集团公司、业主、当地政府部 ')
GO
INSERT INTO Emergency_EmergencyProcess(EmergencyProcessId,ProcessSteps,ProcessName,StepOperator,Remark)
VALUES('AF422D6F-9B0F-4217-AA02-A9EB095FB425',3,'应急恢复','项目应急领导小组','1、警戒疏散组2、供应保障组3、技术支持组4、义务消防队5、医疗救护队')
GO
INSERT INTO Emergency_EmergencyProcess(EmergencyProcessId,ProcessSteps,ProcessName,StepOperator,Remark)
VALUES('01D50303-16C1-4CB5-9D41-CC830C6BE9B8',4,'应急结束','项目应急领导小组','')
GO
INSERT INTO Emergency_EmergencyProcess(EmergencyProcessId,ProcessSteps,ProcessName,StepOperator,Remark)
VALUES('031A1E80-B626-4F77-8AE3-F4C67789DF01',5,'总结评审','相关人员','')
GO
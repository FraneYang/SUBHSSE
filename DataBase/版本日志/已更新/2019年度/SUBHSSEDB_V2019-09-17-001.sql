--ALTER TABLE EduTrain_TrainRecord ADD TrainStates VARCHAR(2) NULL
--GO
--EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'培训状态（0-计划中；1-待考试；2-考试中；3-已结束）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainRecord', @level2type=N'COLUMN',@level2name=N'TrainStates'
--GO

ALTER TABLE EduTrain_TrainRecord ADD WorkPostIds NVARCHAR(MAX) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'培训岗位ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainRecord', @level2type=N'COLUMN',@level2name=N'WorkPostIds'
GO
--培训教材适合岗位ID
ALTER TABLE Training_CompanyTrainingItem ADD WorkPostIds NVARCHAR(MAX) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'适合岗位ids' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_CompanyTrainingItem', @level2type=N'COLUMN',@level2name=N'WorkPostIds'
GO
--培训教材适合岗位ID
ALTER TABLE Training_Training ADD WorkPostIds NVARCHAR(MAX) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'适合岗位ids' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_Training', @level2type=N'COLUMN',@level2name=N'WorkPostIds'
GO

ALTER TABLE EduTrain_TrainRecord ADD PlanId NVARCHAR(50) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'培训计划ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainRecord', @level2type=N'COLUMN',@level2name=N'PlanId'
GO

ALTER TABLE [dbo].[EduTrain_TrainRecord]  WITH CHECK ADD  CONSTRAINT [FK_EduTrain_TrainRecord_Training_Plan] FOREIGN KEY([PlanId])
REFERENCES [dbo].[Training_Plan] ([PlanId])
GO
ALTER TABLE [dbo].[EduTrain_TrainRecord] CHECK CONSTRAINT [FK_EduTrain_TrainRecord_Training_Plan]
GO

ALTER TABLE Training_PlanItem ADD CompanyTrainingId NVARCHAR(50) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公司培训教材类型ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_PlanItem', @level2type=N'COLUMN',@level2name=N'CompanyTrainingId'
GO
ALTER TABLE [dbo].[Training_PlanItem]  WITH CHECK ADD  CONSTRAINT [FK_Training_PlanItem_Training_CompanyTraining] FOREIGN KEY([CompanyTrainingId])
REFERENCES [dbo].[Training_CompanyTraining] ([CompanyTrainingId])
GO
ALTER TABLE [dbo].[Training_PlanItem] CHECK CONSTRAINT [FK_Training_PlanItem_Training_CompanyTraining]
GO
--Training_Plan 新增字段
ALTER TABLE Training_Plan ADD TrainContent NVARCHAR(500) NULL
GO
ALTER TABLE Training_Plan ADD TrainStartDate DATETIME NULL
GO
ALTER TABLE Training_Plan ADD TrainEndDate DATETIME NULL
GO
ALTER TABLE Training_Plan ADD TeachHour numeric(9, 1) NULL
GO
ALTER TABLE Training_Plan ADD TeachMan nvarchar(50) NULL
GO
ALTER TABLE Training_Plan ADD TeachAddress nvarchar(100) NULL
GO
ALTER TABLE Training_Plan ADD TrainTypeId nvarchar(50) NULL
GO
ALTER TABLE Training_Plan ADD TrainLevelId nvarchar(50) NULL
GO
ALTER TABLE Training_Plan ADD UnitIds nvarchar(800) NULL
GO
ALTER TABLE Training_Plan ALTER COLUMN WorkPostId NVARCHAR(MAX) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'培训内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_Plan', @level2type=N'COLUMN',@level2name=N'TrainContent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'培训开始日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_Plan', @level2type=N'COLUMN',@level2name=N'TrainStartDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'培训结束日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_Plan', @level2type=N'COLUMN',@level2name=N'TrainEndDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'学时' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_Plan', @level2type=N'COLUMN',@level2name=N'TeachHour'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'授课人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_Plan', @level2type=N'COLUMN',@level2name=N'TeachMan'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_Plan', @level2type=N'COLUMN',@level2name=N'TeachAddress'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'培训类型ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_Plan', @level2type=N'COLUMN',@level2name=N'TrainTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'培训级别id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_Plan', @level2type=N'COLUMN',@level2name=N'TrainLevelId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单位ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_Plan', @level2type=N'COLUMN',@level2name=N'UnitIds'
GO

ALTER TABLE [dbo].[Training_Plan]  WITH CHECK ADD  CONSTRAINT [FK_Training_Plan_Base_TrainLevel] FOREIGN KEY([TrainLevelId])
REFERENCES [dbo].[Base_TrainLevel] ([TrainLevelId])
GO
ALTER TABLE [dbo].[Training_Plan] CHECK CONSTRAINT [FK_Training_Plan_Base_TrainLevel]
GO

ALTER TABLE [dbo].[Training_Plan]  WITH CHECK ADD  CONSTRAINT [FK_Training_Plan_Base_TrainType] FOREIGN KEY([TrainTypeId])
REFERENCES [dbo].[Base_TrainType] ([TrainTypeId])
GO
ALTER TABLE [dbo].[Training_Plan] CHECK CONSTRAINT [FK_Training_Plan_Base_TrainType]
GO

CREATE TABLE [dbo].[Training_TaskItem](
	[TaskItemId] [nvarchar](50) NOT NULL,
	[TaskId] [nvarchar](50) NULL,
	[PlanId] [nvarchar](50) NULL,
	[PersonId] [nvarchar](50) NULL,
	[TrainingItemCode] [nvarchar](50) NULL,
	[TrainingItemName] [nvarchar](100) NULL,
	[AttachUrl] [nvarchar](2000) NULL,
 CONSTRAINT [PK_Training_TaskItem] PRIMARY KEY CLUSTERED 
(
	[TaskItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Training_TaskItem]  WITH CHECK ADD  CONSTRAINT [FK_Training_TaskItem_SitePerson_Person] FOREIGN KEY([PersonId])
REFERENCES [dbo].[SitePerson_Person] ([PersonId])
GO

ALTER TABLE [dbo].[Training_TaskItem] CHECK CONSTRAINT [FK_Training_TaskItem_SitePerson_Person]
GO

ALTER TABLE [dbo].[Training_TaskItem]  WITH CHECK ADD  CONSTRAINT [FK_Training_TaskItem_Training_Plan] FOREIGN KEY([PlanId])
REFERENCES [dbo].[Training_Plan] ([PlanId])
GO

ALTER TABLE [dbo].[Training_TaskItem] CHECK CONSTRAINT [FK_Training_TaskItem_Training_Plan]
GO

ALTER TABLE [dbo].[Training_TaskItem]  WITH CHECK ADD  CONSTRAINT [FK_Training_TaskItem_Training_Task] FOREIGN KEY([TaskId])
REFERENCES [dbo].[Training_Task] ([TaskId])
GO

ALTER TABLE [dbo].[Training_TaskItem] CHECK CONSTRAINT [FK_Training_TaskItem_Training_Task]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'人员培训教材明细ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TaskItem', @level2type=N'COLUMN',@level2name=N'TaskItemId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'培训任务ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TaskItem', @level2type=N'COLUMN',@level2name=N'TaskId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'培训计划ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TaskItem', @level2type=N'COLUMN',@level2name=N'PlanId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'培训人员ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TaskItem', @level2type=N'COLUMN',@level2name=N'PersonId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'教材编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TaskItem', @level2type=N'COLUMN',@level2name=N'TrainingItemCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'教材名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TaskItem', @level2type=N'COLUMN',@level2name=N'TrainingItemName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'附件' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TaskItem', @level2type=N'COLUMN',@level2name=N'AttachUrl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'培训人员培训教材明细表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TaskItem'
GO

CREATE PROCEDURE [dbo].[Sp_GetTraining_TaskItemTraining]     
	@PlanId NVARCHAR(50),
	@WorkPostId NVARCHAR(200)=NULL
AS  
/*获取人员培训教材*/          
BEGIN
SELECT p.PlanId
	,p.ProjectId
	,P.PlanCode
	,P.PlanName 
	,CI.CompanyTrainingItemCode AS TrainingItemCode
	,CI.CompanyTrainingItemName AS TrainingItemName 
	,CI.AttachUrl
FROM Training_Plan AS P
LEFT JOIN Training_PlanItem AS PLI ON PLI.PlanId=P.PlanId
LEFT JOIN Training_CompanyTraining AS C ON PLI.CompanyTrainingId = C.CompanyTrainingId 
LEFT JOIN Training_CompanyTrainingItem AS CI  ON C.CompanyTrainingId =PLI.CompanyTrainingId
WHERE P.PlanId =@PlanId AND (CI.WorkPostIds IS NULL OR CI.WorkPostIds LIKE ('%'+@WorkPostId+'%'))
   AND PLI.PlanItemId IS NOT NULL AND CI.CompanyTrainingId IS NOT NULL
END
GO
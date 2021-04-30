ALTER TABLE Training_TestPlan ADD PlanId NVARCHAR(50) NULL
GO
ALTER TABLE [dbo].[Training_TestPlan]  WITH CHECK ADD  CONSTRAINT [FK_Training_TestPlan_Training_Plan] FOREIGN KEY([PlanId])
REFERENCES [dbo].[Training_Plan] ([PlanId])
GO
ALTER TABLE [dbo].[Training_TestPlan] CHECK CONSTRAINT [FK_Training_TestPlan_Training_Plan]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'培训计划ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestPlan', @level2type=N'COLUMN',@level2name=N'PlanId'
GO

--新增考试规则表
CREATE TABLE [dbo].[Sys_TestRule](
	[TestRuleId] [nvarchar](50) NOT NULL,
	[Duration] [int] NOT NULL,
	[SValue] [int] NOT NULL,
	[MValue] [int] NOT NULL,
	[JValue] [int] NOT NULL,
	[SCount] [int] NOT NULL,
	[MCount] [int] NOT NULL,
	[JCount] [int] NOT NULL,
 CONSTRAINT [PK_Sys_TestRule] PRIMARY KEY CLUSTERED 
(
	[TestRuleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Sys_TestRule] ADD  CONSTRAINT [DF_Sys_TestRule_Duration]  DEFAULT ((0)) FOR [Duration]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_TestRule', @level2type=N'COLUMN',@level2name=N'TestRuleId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'考试时长（分钟）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_TestRule', @level2type=N'COLUMN',@level2name=N'Duration'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单选题分值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_TestRule', @level2type=N'COLUMN',@level2name=N'SValue'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'多选题分值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_TestRule', @level2type=N'COLUMN',@level2name=N'MValue'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'判断题分值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_TestRule', @level2type=N'COLUMN',@level2name=N'JValue'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单选题数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_TestRule', @level2type=N'COLUMN',@level2name=N'SCount'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'多选题数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_TestRule', @level2type=N'COLUMN',@level2name=N'MCount'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'判断题数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_TestRule', @level2type=N'COLUMN',@level2name=N'JCount'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'考试规则表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_TestRule'
GO
--初始数据
INSERT INTO Sys_TestRule (TestRuleId,Duration,SValue,MValue,JValue,SCount,MCount,JCount)
VALUES('4D6F95B6-9922-4B6E-B539-43ED002AA9B0',90,1,2,1,40,10,40)
GO

ALTER TABLE Training_Plan ADD QRCodeUrl NVARCHAR(2000) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'二维码路径' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_Plan', @level2type=N'COLUMN',@level2name=N'QRCodeUrl'
GO

--ALTER TABLE EduTrain_TrainRecord DROP COLUMN TrainStates
--GO

ALTER TABLE Training_TestRecord ADD Duration INT NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'考试时长（分钟）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestRecord', @level2type=N'COLUMN',@level2name=N'Duration'
GO

UPDATE Training_TestRecord SET Duration = 90
GO
ALTER TABLE Training_TestRecord alter column Duration INT  NOT NULL
GO

UPDATE Training_TestPlan SET Duration = 90
GO
ALTER TABLE Training_TestPlan alter column Duration INT  NOT NULL
GO

ALTER TABLE Training_TestPlan alter column TestStartTime datetime  NOT NULL
GO
update Training_TestPlan set TestEndTime= DATEADD(MINUTE,90,TestStartTime)
go
ALTER TABLE Training_TestPlan alter column TestEndTime datetime  NOT NULL
GO

ALTER TABLE Training_TestTrainingItem DROP COLUMN Score
GO

ALTER VIEW [dbo].[View_Training_TestTrainingItem]  AS 
/*培训试题信息视图*/
SELECT Training.TrainingId
	,Training.TrainingCode
	,Training.TrainingName
	,Item.TrainingItemId	
	,Item.TrainingItemCode
	,Item.TrainingItemName
	,Item.Abstracts
	,Item.AttachUrl
	,Item.VersionNum
	,Item.TestType
	,Item.WorkPostIds
	,Item.WorkPostNames
	,Item.AItem
	,Item.BItem
	,Item.CItem
	,Item.DItem
	,Item.EItem
	--,Item.Score
	,Item.AnswerItems
 FROM dbo.Training_TestTrainingItem AS Item
 LEFT JOIN Training_TestTraining AS Training ON Item.TrainingId = Training.TrainingId

GO

ALTER TABLE Training_TestPlan ADD SValue INT NULL
GO
ALTER TABLE Training_TestPlan ADD MValue INT NULL
GO
ALTER TABLE Training_TestPlan ADD JValue INT NULL
GO
UPDATE Training_TestPlan SET SValue=1,MValue=2,JValue=1 
GO
ALTER TABLE Training_TestPlan ALTER COLUMN SValue INT NOT  NULL
GO
ALTER TABLE Training_TestPlan ALTER COLUMN MValue INT NOT  NULL
GO
ALTER TABLE Training_TestPlan ALTER COLUMN JValue INT NOT NULL
GO
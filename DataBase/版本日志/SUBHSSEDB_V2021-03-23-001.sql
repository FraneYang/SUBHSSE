--培训计划按钮
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('4951679A-1AA6-4864-AD7F-6D872BA90625','335D6EA7-B6A1-4065-A9C8-6DB5C2E3FE08','增加',1)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('12DA20C9-3780-49E5-A489-4A42EF81B0A0','335D6EA7-B6A1-4065-A9C8-6DB5C2E3FE08','修改',2)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('51DEC512-8772-4699-BDBF-BD3C1D282552','335D6EA7-B6A1-4065-A9C8-6DB5C2E3FE08','删除',3)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('170A8A51-B7CB-4B5E-BD3D-292708F74E18','335D6EA7-B6A1-4065-A9C8-6DB5C2E3FE08','保存',4)  
GO

--考试计划按钮
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('85EC3EF9-414F-418A-A2E2-609FAB7908C0','0DE63603-F9D3-40DB-89DE-2621E794482B','增加',1)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('72DB701F-BBE5-4485-A7DF-7454C19D4810','0DE63603-F9D3-40DB-89DE-2621E794482B','修改',2)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('9C8EF57C-C679-44B9-B110-F856BF3CB154','0DE63603-F9D3-40DB-89DE-2621E794482B','删除',3)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('A9036715-6B42-455D-86B6-416D0E92BFAE','0DE63603-F9D3-40DB-89DE-2621E794482B','保存',4)  
GO

ALTER TABLE Training_TestPlan ADD TrainTypeId NVARCHAR(50) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'培训类型ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestPlan', @level2type=N'COLUMN',@level2name=N'TrainTypeId'
GO
ALTER TABLE [dbo].[Training_TestPlan]  WITH CHECK ADD  CONSTRAINT [FK_Training_TestPlan_Base_TrainType] FOREIGN KEY([TrainTypeId])
REFERENCES [dbo].[Base_TrainType] ([TrainTypeId])
GO
ALTER TABLE [dbo].[Training_TestPlan] CHECK CONSTRAINT [FK_Training_TestPlan_Base_TrainType]
GO

UPDATE Training_TestPlan SET TrainTypeId=(SELECT TrainTypeId 
FROM Training_Plan WHERE PlanId=Training_TestPlan.PlanId AND  TrainTypeId IS NOT NULL)
GO

ALTER TABLE Training_ModelTestRecord ADD Duration INT NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'考试时长[分钟]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_ModelTestRecord', @level2type=N'COLUMN',@level2name=N'Duration'
GO
ALTER TABLE Training_ModelTestRecord ADD TotalScore INT NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'总分' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_ModelTestRecord', @level2type=N'COLUMN',@level2name=N'TotalScore'
GO
ALTER TABLE Training_ModelTestRecord ADD QuestionCount INT NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'题目数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_ModelTestRecord', @level2type=N'COLUMN',@level2name=N'QuestionCount'
GO
ALTER TABLE Training_ModelTestRecord ADD SValue INT NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单选题分值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_ModelTestRecord', @level2type=N'COLUMN',@level2name=N'SValue'
GO
ALTER TABLE Training_ModelTestRecord ADD MValue INT NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'多选题分值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_ModelTestRecord', @level2type=N'COLUMN',@level2name=N'MValue'
GO
ALTER TABLE Training_ModelTestRecord ADD JValue INT NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'判断题分值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_ModelTestRecord', @level2type=N'COLUMN',@level2name=N'JValue'
GO
ALTER TABLE Training_ModelTestRecord ADD IdentityCard NVARCHAR(50) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'身份证号码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_ModelTestRecord', @level2type=N'COLUMN',@level2name=N'IdentityCard'
GO
ALTER TABLE Training_ModelTestRecord ADD UnitId NVARCHAR(50) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单位ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_ModelTestRecord', @level2type=N'COLUMN',@level2name=N'UnitId'
GO
ALTER TABLE Training_ModelTestRecord ADD WorkPostId NVARCHAR(50) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'岗位ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_ModelTestRecord', @level2type=N'COLUMN',@level2name=N'WorkPostId'
GO
ALTER TABLE Training_ModelTestRecord ADD CompileDate DateTime NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_ModelTestRecord', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

CREATE TABLE [dbo].[Training_ModelTestRecordTraining](
	[TestPlanTrainingId] [nvarchar](50) NOT NULL,
	[ModelTestRecordId] [nvarchar](50) NULL,
	[TrainingId] [nvarchar](50) NULL,
	[TestType1Count] [int] NULL,
	[TestType2Count] [int] NULL,
	[TestType3Count] [int] NULL,
 CONSTRAINT [PK_Training_ModelTestRecordTraining] PRIMARY KEY CLUSTERED 
(
	[TestPlanTrainingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Training_ModelTestRecordTraining]  WITH CHECK ADD  CONSTRAINT [FK_Training_ModelTestRecordTraining_Training_ModelTestRecord] FOREIGN KEY([ModelTestRecordId])
REFERENCES [dbo].[Training_ModelTestRecord] ([ModelTestRecordId])
GO

ALTER TABLE [dbo].[Training_ModelTestRecordTraining] CHECK CONSTRAINT [FK_Training_ModelTestRecordTraining_Training_ModelTestRecord]
GO

ALTER TABLE [dbo].[Training_ModelTestRecordTraining]  WITH CHECK ADD  CONSTRAINT [FK_Training_ModelTestRecordTraining_Training_TestTraining] FOREIGN KEY([TrainingId])
REFERENCES [dbo].[Training_TestTraining] ([TrainingId])
GO

ALTER TABLE [dbo].[Training_ModelTestRecordTraining] CHECK CONSTRAINT [FK_Training_ModelTestRecordTraining_Training_TestTraining]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'考试计划考题类型所占表主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_ModelTestRecordTraining', @level2type=N'COLUMN',@level2name=N'TestPlanTrainingId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'考试计划id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_ModelTestRecordTraining', @level2type=N'COLUMN',@level2name=N'ModelTestRecordId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'考题类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_ModelTestRecordTraining', @level2type=N'COLUMN',@level2name=N'TrainingId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单选题数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_ModelTestRecordTraining', @level2type=N'COLUMN',@level2name=N'TestType1Count'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'多选题数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_ModelTestRecordTraining', @level2type=N'COLUMN',@level2name=N'TestType2Count'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'判断题数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_ModelTestRecordTraining', @level2type=N'COLUMN',@level2name=N'TestType3Count'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'考试类型所占数量表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_ModelTestRecordTraining'
GO

ALTER TABLE [dbo].[Training_ModelTestRecord] DROP CONSTRAINT [FK_Training_ModelTestRecord_Training_TestTraining]
GO

ALTER TABLE Training_ModelTestRecord DROP COLUMN  TrainingId
GO

INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('3C98D6FF-3566-4376-BC76-2287B68F6FFD','模拟考试','EduTrain/ModelTestRecord.aspx','PageHeaderFooter',50,'6E3101D6-7A1C-4047-B372-1758E884372E','Menu_Server',1,0)
GO

ALTER TABLE Training_ModelTestRecordItem ADD TrainingItemCode NVARCHAR(50) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'试题编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_ModelTestRecordItem', @level2type=N'COLUMN',@level2name=N'TrainingItemCode'
GO
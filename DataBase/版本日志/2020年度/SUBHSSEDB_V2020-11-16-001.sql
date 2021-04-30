ALTER TABLE Training_TestTraining ADD TrainingEngName NVARCHAR(500) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������Ӣ������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestTraining', @level2type=N'COLUMN',@level2name=N'TrainingEngName'
GO

ALTER TABLE Training_TestTrainingItem ADD AbstractsEng NVARCHAR(2000) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestTrainingItem', @level2type=N'COLUMN',@level2name=N'AbstractsEng'
GO
ALTER TABLE Training_TestTrainingItem ADD AItemEng NVARCHAR(2000) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ѡ��AӢ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestTrainingItem', @level2type=N'COLUMN',@level2name=N'AItemEng'
GO
ALTER TABLE Training_TestTrainingItem ADD BItemEng NVARCHAR(2000) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ѡ��BӢ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestTrainingItem', @level2type=N'COLUMN',@level2name=N'BItemEng'
GO
ALTER TABLE Training_TestTrainingItem ADD CItemEng NVARCHAR(2000) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ѡ��CӢ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestTrainingItem', @level2type=N'COLUMN',@level2name=N'CItemEng'
GO
ALTER TABLE Training_TestTrainingItem ADD DItemEng NVARCHAR(2000) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ѡ��DӢ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestTrainingItem', @level2type=N'COLUMN',@level2name=N'DItemEng'
GO
ALTER TABLE Training_TestTrainingItem ADD EItemEng NVARCHAR(2000) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ѡ��EӢ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestTrainingItem', @level2type=N'COLUMN',@level2name=N'EItemEng'
GO

ALTER VIEW [dbo].[View_Training_TestTrainingItem]  AS 
/*��ѵ������Ϣ��ͼ*/
SELECT Training.TrainingId
	,Training.TrainingCode
	,Training.TrainingName
	,Item.TrainingItemId	
	,Item.TrainingItemCode
	,Item.TrainingItemName
	,Item.Abstracts
	,Item.AbstractsEng
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
	,Item.AItemEng
	,Item.BItemEng
	,Item.CItemEng
	,Item.DItemEng
	,Item.EItemEng
	--,Item.Score
	,Item.AnswerItems
 FROM dbo.Training_TestTrainingItem AS Item
 LEFT JOIN Training_TestTraining AS Training ON Item.TrainingId = Training.TrainingId

GO

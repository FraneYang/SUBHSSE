ALTER TABLE Training_TestTraining ADD TrainingRussianName NVARCHAR(500) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�������Ͷ�������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestTraining', @level2type=N'COLUMN',@level2name=N'TrainingRussianName'
GO

ALTER TABLE Training_TestTrainingItem ADD AbstractsRussian NVARCHAR(2000) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestTrainingItem', @level2type=N'COLUMN',@level2name=N'AbstractsRussian'
GO
ALTER TABLE Training_TestTrainingItem ADD AItemRussian NVARCHAR(2000) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ѡ��A����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestTrainingItem', @level2type=N'COLUMN',@level2name=N'AItemRussian'
GO
ALTER TABLE Training_TestTrainingItem ADD BItemRussian NVARCHAR(2000) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ѡ��B����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestTrainingItem', @level2type=N'COLUMN',@level2name=N'BItemRussian'
GO
ALTER TABLE Training_TestTrainingItem ADD CItemRussian NVARCHAR(2000) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ѡ��C����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestTrainingItem', @level2type=N'COLUMN',@level2name=N'CItemRussian'
GO
ALTER TABLE Training_TestTrainingItem ADD DItemRussian NVARCHAR(2000) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ѡ��D����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestTrainingItem', @level2type=N'COLUMN',@level2name=N'DItemRussian'
GO
ALTER TABLE Training_TestTrainingItem ADD EItemRussian NVARCHAR(2000) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ѡ��E����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestTrainingItem', @level2type=N'COLUMN',@level2name=N'EItemRussian'
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
	,Item.AbstractsRussian
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
	,Item.AItemRussian
	,Item.BItemRussian
	,Item.CItemRussian
	,Item.DItemRussian
	,Item.EItemRussian
	--,Item.Score
	,Item.AnswerItems
 FROM dbo.Training_TestTrainingItem AS Item
 LEFT JOIN Training_TestTraining AS Training ON Item.TrainingId = Training.TrainingId

GO

ALTER TABLE [dbo].[SitePerson_Person] ADD Languages NVARCHAR(50) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_Person', @level2type=N'COLUMN',@level2name=N'Languages'
GO


INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('6E3101D6-7A1C-4047-B372-1758E884372E','��Ա��ѵ�뿼��','','TableEdit',130,'0','Menu_Server',0,0)
GO
	INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('939B6481-75E3-4CEA-B248-5FB069797094','��Ա��Ϣ','ServerTest/PersonInfo.aspx','PageHeaderFooter',10,'6E3101D6-7A1C-4047-B372-1758E884372E','Menu_Server',1,0)
	GO
	--��Ա��Ϣ��ť
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('DE547890-0A95-44B7-A70F-D99A84C988A8','939B6481-75E3-4CEA-B248-5FB0697970940','����',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('4DBC00D8-C877-4083-8E2D-2920355E180D','939B6481-75E3-4CEA-B248-5FB0697970940','�޸�',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('AD6B0547-FDED-44D8-AAEB-A459669AA9D3','939B6481-75E3-4CEA-B248-5FB0697970940','ɾ��',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('2CD73EDA-E699-4688-B497-892C3B3D6482','939B6481-75E3-4CEA-B248-5FB0697970940','����',4)  
	GO
	INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('335D6EA7-B6A1-4065-A9C8-6DB5C2E3FE08','��ѵ�ƻ�','EduTrain/Plan.aspx','PageHeaderFooter',20,'6E3101D6-7A1C-4047-B372-1758E884372E','Menu_Server',1,0)
	GO
	INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('CB91E53D-CDA2-48EE-AF13-102A6D355391','��ѵ��¼','ServerTest/TrainRecord.aspx','PageHeaderFooter',25,'6E3101D6-7A1C-4047-B372-1758E884372E','Menu_Server',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('03D7B380-CC0F-41A9-A60D-64456FECBF49','CB91E53D-CDA2-48EE-AF13-102A6D355391','ɾ��',3)
	GO
	INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('0DE63603-F9D3-40DB-89DE-2621E794482B','���Լƻ�','EduTrain/TestPlan.aspx','PageHeaderFooter',30,'6E3101D6-7A1C-4047-B372-1758E884372E','Menu_Server',1,0)
	GO    
	INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('67408019-C050-462A-9BAB-E594DC1A99DE','���Լ�¼','EduTrain/TestRecord.aspx','PageHeaderFooter',40,'6E3101D6-7A1C-4047-B372-1758E884372E','Menu_Server',1,0)
	GO	

	--INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	--VALUES('CB37413A-2937-49B2-8A1B-2882EA392C66','����ͳ��','EduTrain/TestStatistics.aspx','PageHeaderFooter',50,'6E3101D6-7A1C-4047-B372-1758E884372E','Menu_Server',1,0)
	--GO

--ɾ����Ա��ĿID��Ϊ������
ALTER TABLE SitePerson_Person ALTER COLUMN ProjectId NVARCHAR(50) NULL
GO
--ɾ����ѵ��¼ID��Ϊ������
ALTER TABLE EduTrain_TrainRecord ALTER COLUMN ProjectId NVARCHAR(50) NULL
GO
--ALTER TABLE [dbo].[SitePerson_Person] DROP CONSTRAINT [FK_SitePerson_Person_Base_Project]
--GO

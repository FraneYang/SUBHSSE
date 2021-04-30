CREATE VIEW [dbo].[View_EduTrain_TrainTest]
AS
/*��ѵ����*/
SELECT TrainTestId
	,TrainingId
	,QsnCode
	,COrder
	,QsnContent
	,QsnAnswer
	,QsnCategory
	,QsnKind
	,QsnImportant
	,(CASE QsnCategory WHEN '2' THEN '��ý����' WHEN '3' THEN 'ͼƬ��' ELSE '������' END) AS QsnCategoryName
	,(CASE QsnKind WHEN '1' THEN '��ѡ' WHEN '2' THEN '��ѡ' WHEN '3' THEN '�ж�' ELSE '' END) AS QsnKindName
	,(CASE QsnImportant WHEN '0' THEN '����' WHEN '1' THEN 'һ��' WHEN '2' THEN '����' ELSE '' END) AS QsnImportantName
	,Analysis
	,Description
	,UploadTime
FROM EduTrain_TrainTest
GO

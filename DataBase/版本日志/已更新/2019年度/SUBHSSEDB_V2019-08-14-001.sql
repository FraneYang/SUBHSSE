CREATE VIEW [dbo].[View_EduTrain_TrainTest]
AS
/*培训试题*/
SELECT TrainTestId
	,TrainingId
	,QsnCode
	,COrder
	,QsnContent
	,QsnAnswer
	,QsnCategory
	,QsnKind
	,QsnImportant
	,(CASE QsnCategory WHEN '2' THEN '多媒体题' WHEN '3' THEN '图片题' ELSE '文字题' END) AS QsnCategoryName
	,(CASE QsnKind WHEN '1' THEN '单选' WHEN '2' THEN '多选' WHEN '3' THEN '判断' ELSE '' END) AS QsnKindName
	,(CASE QsnImportant WHEN '0' THEN '容易' WHEN '1' THEN '一般' WHEN '2' THEN '困难' ELSE '' END) AS QsnImportantName
	,Analysis
	,Description
	,UploadTime
FROM EduTrain_TrainTest
GO

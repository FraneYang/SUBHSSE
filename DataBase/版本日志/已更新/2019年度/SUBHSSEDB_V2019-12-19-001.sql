--培训记录明细列表
ALTER VIEW [dbo].[View_EduTrain_TrainRecordDetail]  AS 
/*培训记录明细列表视图*/
SELECT trainRecordDetail.TrainDetailId, 
	trainRecordDetail.TrainingId, 
	trainRecordDetail.PersonId, 
	trainRecordDetail.CheckScore,
	trainRecordDetail.CheckResult,
	person.UnitId,
	unit.UnitName,
	person.PersonName,
	person.WorkPostId,
	workPost.WorkPostCode,
	workPost.WorkPostName
FROM dbo.EduTrain_TrainRecordDetail AS trainRecordDetail
LEFT JOIN dbo.SitePerson_Person AS person ON person.PersonId = trainRecordDetail.PersonId
LEFT JOIN dbo.Base_Unit AS unit ON unit.UnitId=person.UnitId
LEFT JOIN dbo.Base_WorkPost AS workPost ON person.WorkPostId=workPost.WorkPostId
GO



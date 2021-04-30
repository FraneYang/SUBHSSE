ALTER VIEW [dbo].[View_EduTrain_TrainFind]
AS
/*»À‘±≈‡—µ≤È—Ø*/
SELECT person.CardNo
		,person.PersonName
	    ,trainDetail.PersonId
		,train.ProjectId
		,unit.UnitId
		,unit.UnitName
		,post.WorkPostName
		,train.TrainTitle
		,train.TrainStartDate
		,train.TrainEndDate
		,train.TrainTypeId
		,tt.TrainTypeName
		,train.TrainLevelId
		,Levels.TrainLevelName
		,train.TeachHour
		,trainDetail.CheckScore
		,trainDetail.CheckResult
		,train.TeachMan
		,pu.UnitType
from  dbo.EduTrain_TrainRecordDetail trainDetail
	  LEFT JOIN dbo.EduTrain_TrainRecord train ON train.TrainingId = trainDetail.TrainingId 
	  LEFT JOIN dbo.SitePerson_Person person ON trainDetail.PersonId =person.PersonId  
	  LEFT JOIN dbo.Base_WorkPost post ON post.WorkPostId = Person.WorkPostId 
	  LEFT JOIN dbo.Base_Unit unit ON unit.UnitId = person.UnitId 
	  LEFT JOIN dbo.Project_ProjectUnit pu ON train.ProjectId=pu.ProjectId AND  pu.UnitId = unit.UnitId  
	  LEFT JOIN dbo.Base_TrainType tt ON tt.TrainTypeId=train.TrainTypeId
      LEFT JOIN dbo.Base_TrainLevel Levels ON Levels.TrainLevelId=train.TrainLevelId
WHERE person.PersonName IS NOT NULL
GO



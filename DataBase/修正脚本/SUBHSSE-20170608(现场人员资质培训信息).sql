SELECT Project.ProjectName  --项目
	,Project.ProjectId 
	,Unit.UnitName --单位
	,Unit.UnitId
	,Person.PersonName --人员
	,Person.PersonId
	,WorkPost.WorkPostName --岗位
	,WorkPost.WorkPostId
	,WorkPost.PostType --岗位类型（等于2时 是特岗人员）
	,(CASE WHEN WorkPost.PostType='2' THEN '是' ELSE '否' END ) AS IsSpecialPost --是否特岗
	,Certificate.CertificateName --特岗证书
	,PersonQuality.CertificateNo --证书编号
	,PersonQuality.SendUnit --发证单位
	,PersonQuality.SendDate --发证时间
	,PersonQuality.LimitDate --证书有效期
	,PersonTrainRecord.TrainTypeName --培训类型
	,PersonTrainRecord.TrainStartDate --培训时间
	,PersonTrainRecord.TeachAddress --培训地点
	,PersonTrainRecord.CheckScore --培训得分
	,PersonTrainRecord.CheckResult --培训结果
FROM SitePerson_Person AS Person
LEFT JOIN Base_Project AS Project ON Person.ProjectId=Project.ProjectId
LEFT JOIN Base_Unit AS Unit ON Person.UnitId=Unit.UnitId
LEFT JOIN Base_WorkPost AS WorkPost ON Person.WorkPostId=WorkPost.WorkPostId
LEFT JOIN QualityAudit_PersonQuality AS PersonQuality ON Person.PersonId=PersonQuality.PersonId
LEFT JOIN Base_Certificate AS Certificate ON PersonQuality.CertificateId=Certificate.CertificateId
LEFT JOIN (SELECT TrainType.TrainTypeName
		,TrainRecord.TrainStartDate
		,TrainRecord.TeachAddress
		,TrainRecordDetail.PersonId		
		,(CASE WHEN TrainRecordDetail.CheckResult=1 THEN '通过' ELSE '未通过' END) AS CheckResult
		,TrainRecordDetail.CheckScore
		FROM EduTrain_TrainRecord AS TrainRecord
		LEFT JOIN Base_TrainType AS TrainType ON TrainRecord.TrainTypeId =TrainType.TrainTypeId
		LEFT JOIN EduTrain_TrainRecordDetail AS TrainRecordDetail ON TrainRecord.TrainingId =TrainRecordDetail.TrainingId) AS PersonTrainRecord 
		ON Person.PersonId=PersonTrainRecord.PersonId
ORDER BY Project.ProjectCode,Unit.UnitCode,Person.PersonName
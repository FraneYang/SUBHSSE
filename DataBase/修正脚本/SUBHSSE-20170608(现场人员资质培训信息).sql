SELECT Project.ProjectName  --��Ŀ
	,Project.ProjectId 
	,Unit.UnitName --��λ
	,Unit.UnitId
	,Person.PersonName --��Ա
	,Person.PersonId
	,WorkPost.WorkPostName --��λ
	,WorkPost.WorkPostId
	,WorkPost.PostType --��λ���ͣ�����2ʱ ���ظ���Ա��
	,(CASE WHEN WorkPost.PostType='2' THEN '��' ELSE '��' END ) AS IsSpecialPost --�Ƿ��ظ�
	,Certificate.CertificateName --�ظ�֤��
	,PersonQuality.CertificateNo --֤����
	,PersonQuality.SendUnit --��֤��λ
	,PersonQuality.SendDate --��֤ʱ��
	,PersonQuality.LimitDate --֤����Ч��
	,PersonTrainRecord.TrainTypeName --��ѵ����
	,PersonTrainRecord.TrainStartDate --��ѵʱ��
	,PersonTrainRecord.TeachAddress --��ѵ�ص�
	,PersonTrainRecord.CheckScore --��ѵ�÷�
	,PersonTrainRecord.CheckResult --��ѵ���
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
		,(CASE WHEN TrainRecordDetail.CheckResult=1 THEN 'ͨ��' ELSE 'δͨ��' END) AS CheckResult
		,TrainRecordDetail.CheckScore
		FROM EduTrain_TrainRecord AS TrainRecord
		LEFT JOIN Base_TrainType AS TrainType ON TrainRecord.TrainTypeId =TrainType.TrainTypeId
		LEFT JOIN EduTrain_TrainRecordDetail AS TrainRecordDetail ON TrainRecord.TrainingId =TrainRecordDetail.TrainingId) AS PersonTrainRecord 
		ON Person.PersonId=PersonTrainRecord.PersonId
ORDER BY Project.ProjectCode,Unit.UnitCode,Person.PersonName
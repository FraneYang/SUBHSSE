ALTER VIEW [dbo].[View_EduTrain_TrainFind]
AS
SELECT person.CardNo,person.PersonName,train.ProjectId, unit.UnitId, unit.UnitName, post.WorkPostName, train.TrainTitle, 
       train.TrainStartDate,train.TrainEndDate, train.TrainTypeId,train.TeachHour,tt.TrainTypeName, trainDetail.CheckScore, trainDetail.CheckResult,train.TeachMan, 
       pu.UnitType
from  dbo.EduTrain_TrainRecordDetail trainDetail LEFT JOIN
      dbo.EduTrain_TrainRecord train ON train.TrainingId = trainDetail.TrainingId 
	  LEFT JOIN dbo.SitePerson_Person person ON person.PersonId = trainDetail.PersonId 
	  LEFT JOIN dbo.Base_WorkPost post ON post.WorkPostId = Person.WorkPostId 
	  LEFT JOIN dbo.Base_Unit unit ON unit.UnitId = person.UnitId 
	  LEFT JOIN dbo.Project_ProjectUnit pu ON train.ProjectId=pu.ProjectId AND  pu.UnitId = unit.UnitId  
	  LEFT JOIN dbo.Base_TrainType tt ON tt.TrainTypeId=train.TrainTypeId

GO

ALTER VIEW [dbo].[View_Law_LawRegulationList]  AS 
SELECT
	Law.LawRegulationId
	,Law.LawRegulationCode
	,Law.LawRegulationName
	,Law.ApprovalDate
	,Law.EffectiveDate
	,Law.Description
	--,Law.AttachUrl
	,Law.LawsRegulationsTypeId
	,Law.CompileMan
	,CompileUser.UserName AS CompileManName
	,Law.CompileDate
	,Law.AuditMan
	,AuditUser.UserName AS AuditManName
	,Law.AuditDate
	,Law.IsPass
	,Law.IsBuild
	,Law.UpState
	,LawsRegulationsType.Code AS  LawsRegulationsTypeCode
	,LawsRegulationsType.Name AS LawsRegulationsTypeName
	,(CASE WHEN IsPass=1 THEN '' ELSE '' END) AS IsPassName
	, Substring(Law.AttachUrl,charindex('~',Law.AttachUrl)+1,LEN(Law.AttachUrl)) as  AttachUrlName
	,Law.UnitId
	,(CASE WHEN Law.UpState='1' THEN '本单位' WHEN Law.UpState='2' THEN '待上报' when Law.UpState='3' then '已上报' when Law.UpState='4' then '上报失败' end) as UpStates
	,ConstUpState.ConstText AS UpStateName
	,(CASE WHEN IsBuild = 1 THEN '集团' ELSE '' END ) AS IsBuildName
	,AttachFile.AttachFileId
	,AttachFile.AttachSource
	,AttachFile.ToKeyId
	,AttachFile.AttachUrl
FROM dbo.Law_LawRegulationList AS Law
LEFT JOIN dbo.Base_LawsRegulationsType AS  LawsRegulationsType  ON LawsRegulationsType .Id=Law.LawsRegulationsTypeId
LEFT JOIN Sys_User AS CompileUser ON CompileUser.UserId=Law.CompileMan
LEFT JOIN Sys_User AS AuditUser ON AuditUser.UserId=Law.AuditMan
LEFT JOIN AttachFile AS AttachFile ON Law.LawRegulationId=AttachFile.ToKeyId
LEFT JOIN Sys_Const AS ConstUpState ON Law.UpState=ConstUpState.ConstValue and ConstUpState.GroupId='UpState'
GO

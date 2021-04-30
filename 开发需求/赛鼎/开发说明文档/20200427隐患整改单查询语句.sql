--隐患整改单列表：
SELECT R.RectifyNoticesId,R.ProjectId,CodeRecords.Code AS RectifyNoticesCode,R.UnitId ,Unit.UnitName,R.WorkAreaId
,WorkAreaName= STUFF((SELECT ',' + WorkAreaName FROM dbo.ProjectData_WorkArea where PATINDEX('%,' + RTRIM(WorkAreaId) + ',%',',' +R.WorkAreaId + ',')>0 FOR XML PATH('')), 1, 1,'')
,CheckPersonName= (STUFF(( SELECT ',' + UserName FROM dbo.Sys_User where PATINDEX('%,' + RTRIM(UserId) + ',%',',' +R.CheckManIds+ ',')>0 FOR XML PATH('')), 1, 1,'')+ (CASE WHEN CheckManNames IS NOT NULL AND CheckManNames !='' THEN ','+ CheckManNames ELSE '' END))
,R.DutyPerson,R.CheckedDate,DutyPerson.UserName AS DutyPersonName,R.DutyPersonTime,R.CompleteDate
,(CASE WHEN States = 1 THEN '待签发' WHEN States = 2 THEN '待整改' WHEN States = 3 THEN '待审核' WHEN States = 4 THEN '待复查' WHEN States = 5 THEN '已完成' ELSE '待提交' END) AS StatesName
FROM Check_RectifyNotices AS R
LEFT JOIN Base_Project AS Project ON Project.ProjectId = R.ProjectId 
LEFT JOIN Base_Unit AS Unit ON Unit.UnitId = R.UnitId 
LEFT JOIN Sys_User AS DutyPerson ON DutyPerson.UserId = R.DutyPerson
LEFT JOIN Sys_CodeRecords AS CodeRecords ON R.RectifyNoticesId = CodeRecords.DataId 
WHERE States IS NOT NULL AND Project.ProjectId=@ProjectId

--隐患整单详细
SELECT R.RectifyNoticesId
	,R.RectifyNoticesCode
	,Project.ProjectName
	,Unit.UnitId
	,Unit.UnitName
	,R.WorkAreaId
	,WorkAreaName= STUFF((SELECT ',' + WorkAreaName FROM dbo.ProjectData_WorkArea where PATINDEX('%,' + RTRIM(WorkAreaId) + ',%',',' +R.WorkAreaId + ',')>0 FOR XML PATH('')), 1, 1,'')
	,CheckManNames=CheckManNames + STUFF((SELECT ',' + UserName FROM dbo.Sys_User where PATINDEX('%,' + RTRIM(UserId) + ',%',',' +R.CheckManIds + ',')>0 FOR XML PATH('')), 1, 1,'')
	,R.CheckedDate
	,(CASE WHEN HiddenHazardType ='2' THEN '较大' WHEN HiddenHazardType ='3' THEN '重大' ELSE '一般' END) AS HiddenHazardTypeName
	,CompleteMan.UserName AS CompleteManName
	,SignPerson.UserName AS SignPersonName
	,R.SignDate
	,ProfessionalEngineer.UserName AS ProfessionalEngineerName
	,R.ProfessionalEngineerTime1
	,R.ProfessionalEngineerTime2
	,ConstructionManager.UserName AS ConstructionManagerName
	,R.ConstructionManagerTime1
	,R.ConstructionManagerTime2
	,ProjectManager.UserName AS ProjectManagerName
	,R.ProjectManagerTime1
	,R.ProjectManagerTime2
	,DutyPerson.UserName AS DutyPersonName
	,R.DutyPersonTime
	,R.CompleteDate
	,UnitHeadMan.UserName AS UnitHeadManName
	,R.UnitHeadManDate
	,R.ReCheckOpinion
	,CheckPerson.UserName AS CheckPersonName
	,R.ReCheckDate
	,R.States
	,(CASE WHEN States = 1 THEN '待签发' WHEN States = 2 THEN '待整改' WHEN States = 3 THEN '待审核' WHEN States = 4 THEN '待复查' WHEN States = 5 THEN '已完成' ELSE '待提交' END) AS StatesName
FROM Check_RectifyNotices AS R
LEFT JOIN Base_Project AS Project ON R.ProjectId=Project.ProjectId
LEFT JOIN Base_Unit AS Unit ON R.UnitId=Unit.UnitId
LEFT JOIN Sys_User AS CompleteMan ON R.CompleteManId=CompleteMan.UserId
LEFT JOIN Sys_User AS SignPerson ON R.SignPerson=SignPerson.UserId
LEFT JOIN Sys_User AS ProfessionalEngineer ON R.ProfessionalEngineerId=ProfessionalEngineer.UserId
LEFT JOIN Sys_User AS ConstructionManager ON R.ConstructionManagerId=ConstructionManager.UserId
LEFT JOIN Sys_User AS ProjectManager ON R.ProjectManagerId=ProjectManager.UserId
LEFT JOIN Sys_User AS DutyPerson ON R.DutyPersonId=DutyPerson.UserId
LEFT JOIN Sys_User AS UnitHeadMan ON R.UnitHeadManId=UnitHeadMan.UserId
LEFT JOIN Sys_User AS CheckPerson ON R.CheckPerson=CheckPerson.UserId
WHERE RectifyNoticesId='003fc712-1b3c-418b-8d7d-35b4800a4edd'

SELECT Item.RectifyNoticesItemId
	,R.RectifyNoticesId
	,Item.WrongContent
	,Item.Requirement
	,Item.LimitTime
	,Item.RectifyResults
	,Item.IsRectify
	,(CASE WHEN Item.IsRectify=1 THEN '合格' ELSE '不合格' END) AS IsRectifyName
	,att1.AttachUrl AS PhotoBeforeUrl 
	,att2.AttachUrl AS PhotoAfterUrl 
FROM Check_RectifyNoticesItem AS Item
LEFT JOIN Check_RectifyNotices AS R ON Item.RectifyNoticesId=R.RectifyNoticesId
LEFT JOIN AttachFile AS att1 ON (Item.RectifyNoticesId+'#1')=att1.ToKeyId
LEFT JOIN AttachFile AS att2 ON (Item.RectifyNoticesId+'#2')=att2.ToKeyId
WHERE R.RectifyNoticesId='003fc712-1b3c-418b-8d7d-35b4800a4edd'
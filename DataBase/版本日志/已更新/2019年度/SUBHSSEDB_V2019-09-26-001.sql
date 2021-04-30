--其他会议
ALTER TABLE Meeting_AttendMeeting ADD MeetingPlace nvarchar(200) null
go
--班前会
ALTER TABLE Meeting_ClassMeeting ADD MeetingPlace nvarchar(200) null
go
ALTER TABLE Meeting_ClassMeeting ADD MeetingHours decimal(9,1) null
go
ALTER TABLE Meeting_ClassMeeting ADD MeetingHostMan nvarchar(50) null
go
ALTER TABLE Meeting_ClassMeeting ADD AttentPerson nvarchar(300) null
go
--月例会
ALTER TABLE Meeting_MonthMeeting ADD MeetingPlace nvarchar(200) null
go
--专题会议
ALTER TABLE Meeting_SpecialMeeting ADD MeetingPlace nvarchar(200) null
go
--周会议
ALTER TABLE Meeting_WeekMeeting ADD MeetingPlace nvarchar(200) null
go


ALTER PROCEDURE [dbo].[Sp_GetTraining_TaskItemTraining]     
	@PlanId NVARCHAR(50),
	@WorkPostId NVARCHAR(200)=NULL
AS  
/*获取人员培训教材*/          
BEGIN
SELECT DISTINCT p.PlanId
	,p.ProjectId
	,P.PlanCode
	,P.PlanName 
	,CI.CompanyTrainingItemCode AS TrainingItemCode
	,CI.CompanyTrainingItemName AS TrainingItemName 
	,CI.AttachUrl
FROM Training_Plan AS P
LEFT JOIN Training_PlanItem AS PLI ON PLI.PlanId=P.PlanId
LEFT JOIN Training_CompanyTraining AS C ON PLI.CompanyTrainingId = C.CompanyTrainingId 
LEFT JOIN Training_CompanyTrainingItem AS CI  ON C.CompanyTrainingId =PLI.CompanyTrainingId
WHERE P.PlanId =@PlanId AND (CI.WorkPostIds IS NULL OR CI.WorkPostIds LIKE ('%'+@WorkPostId+'%'))
   AND PLI.PlanItemId IS NOT NULL AND CI.CompanyTrainingId IS NOT NULL
END
GO



ALTER PROCEDURE [dbo].[Sp_APP_GetToDoItems]     
	@projectId NVARCHAR(50),
	@userId NVARCHAR(200)=NULL
AS  
/*获取当前人待办事项*/          
BEGIN
SELECT HazardRegisterId AS DataId
	,'F21FFCAA-872A-4995-BB5B-E9C430950845' AS MenuId
	,'安全巡检' AS MenuName
	,register.RegisterDef AS Content
	,UserId
	,users.UserName
	,register.RegisterDate AS DataTime
	,CONVERT(varchar(100),register.RegisterDate, 23) AS DataTimeStr
	,'' AS UrlStr
FROM HSSE_Hazard_HazardRegister AS register 
LEFT JOIN Sys_User AS users ON users.UserId =@userId
WHERE register.ProjectId=@projectId AND 
((register.states = '1' AND register.ResponsibleMan =@userId) OR (register.states = '2' AND register.CheckManId =@userId))		
 
union all

 SELECT PlanId AS DataId
	,'B782A26B-D85C-4F84-8B45-F7AA47B3159E' AS MenuId
	,'培训计划' AS MenuName
	,PlanName AS Content
	,UserId
	,users.UserName
	,DesignerDate AS DataTime
	,CONVERT(varchar(100),DesignerDate, 23) AS DataTimeStr
	,'' AS UrlStr
FROM Training_Plan AS ePlan
LEFT JOIN Sys_User AS users ON ePlan.DesignerId= users.UserId 
WHERE ePlan.ProjectId=@projectId AND 
(States = '0' OR States = '1' ) AND ePlan.DesignerId =@userId

union all

 SELECT TestPlanId AS DataId
	,'FAF7F4A4-A4BC-4D94-9E88-0CF5A380DB34' AS MenuId
	,'考试计划' AS MenuName
	,PlanName AS Content
	,UserId
	,users.UserName
	,PlanDate AS DataTime
	,CONVERT(varchar(100),PlanDate, 23) AS DataTimeStr
	,'' AS UrlStr
FROM Training_TestPlan AS TPlan
LEFT JOIN Sys_User AS users ON users.UserId =TPlan.PlanManId
WHERE TPlan.ProjectId=@projectId AND 
(States = '0' OR States = '1' ) AND PlanManId =@userId
ORDER BY DataTime DESC 

END
GO

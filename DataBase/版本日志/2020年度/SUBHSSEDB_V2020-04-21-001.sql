--获取当前人待办事项
ALTER PROCEDURE [dbo].[Sp_APP_GetToDoItems]     
	@projectId NVARCHAR(50),
	@userId NVARCHAR(200)=NULL
AS  
/*获取当前人待办事项*/          
BEGIN
SELECT HazardRegisterId AS DataId
	,'B6BE5FE0-CB84-47FF-A6C3-5AD9E1CCE079' AS MenuId
	,'安全巡检' AS MenuName
	,register.RegisterDef AS Content
	,UserId
	,users.UserName
	,register.RegisterDate AS DataTime
	,CONVERT(varchar(100),register.RegisterDate, 23) AS DataTimeStr
	,'/pages/grow/safe_confirm/main' AS UrlStr
FROM HSSE_Hazard_HazardRegister AS register 
LEFT JOIN Sys_User AS users ON users.UserId =@userId
WHERE register.ProjectId=@projectId AND 
((register.states = '1' AND (register.ResponsibleMan =@userId OR register.CCManIds LIKE ('%'+@userId+'%') )) 
OR (register.states = '2' AND register.CheckManId =@userId))		

UNION ALL
SELECT PlanId AS DataId
	,'B782A26B-D85C-4F84-8B45-F7AA47B3159E' AS MenuId
	,'培训计划' AS MenuName
	,PlanName AS Content
	,UserId
	,users.UserName
	,DesignerDate AS DataTime
	,CONVERT(varchar(100),DesignerDate, 23) AS DataTimeStr
	,'/pages/train_task/train_index/main' AS UrlStr
FROM Training_Plan AS ePlan
LEFT JOIN Sys_User AS users ON ePlan.DesignerId= users.UserId 
WHERE ePlan.ProjectId=@projectId AND 
(States = '0' OR States = '1' ) AND ePlan.DesignerId =@userId

UNION ALL
SELECT TestPlanId AS DataId
	,'FAF7F4A4-A4BC-4D94-9E88-0CF5A380DB34' AS MenuId
	,'考试计划' AS MenuName
	,PlanName AS Content
	,UserId
	,users.UserName
	,PlanDate AS DataTime
	,CONVERT(varchar(100),PlanDate, 23) AS DataTimeStr
	,'/pages/train_task/test_list/main' AS UrlStr	
FROM Training_TestPlan AS TPlan
LEFT JOIN Sys_User AS users ON users.UserId =TPlan.PlanManId
WHERE TPlan.ProjectId=@projectId AND 
(States = '0' OR States = '1' ) AND PlanManId =@userId

UNION ALL
SELECT FireWorkId AS DataId
	,'2E58D4F1-2FF1-450E-8A00-1CE3BBCF8D4B' AS MenuId
	,'动火作业' AS MenuName
	,LicenseCode AS Content
	,UserId
	,users.UserName
	,ApplyDate AS DataTime
	,CONVERT(varchar(100),ApplyDate, 23) AS DataTimeStr
	,(CASE WHEN States = '0' THEN '/pages/job_info/dh_add/main' 
			ELSE '/pages/job_info/dh_approval/main' END) AS UrlStr	
FROM License_FireWork AS License
   LEFT JOIN Sys_User AS users ON users.UserId =License.NextManId
WHERE License.ProjectId=@projectId 
	AND (States = '0' OR States = '1' ) 
	AND License.NextManId LIKE '%'+ @userId+'%'

UNION ALL
SELECT HeightWorkId AS DataId
	,'DA1CAE8E-B5BF-4AC0-9996-AF6CAA412CA9' AS MenuId
	,'高处作业' AS MenuName
	,LicenseCode AS Content
	,UserId
	,users.UserName
	,ApplyDate AS DataTime
	,CONVERT(varchar(100),ApplyDate, 23) AS DataTimeStr
	,(CASE WHEN States = '0' THEN '/pages/job_info/gc_add/main' 
			ELSE '/pages/job_info/dh_approval/main' END) AS UrlStr	
FROM License_HeightWork AS License
   LEFT JOIN Sys_User AS users ON users.UserId =License.NextManId
WHERE License.ProjectId=@projectId 
	AND (States = '0' OR States = '1' ) 
	AND License.NextManId LIKE '%'+ @userId+'%'

UNION ALL
SELECT LimitedSpaceId AS DataId
	,'AEC9166D-1C91-45F0-8BFE-D3D0479A28C7' AS MenuId
	,'受限空间' AS MenuName
	,LicenseCode AS Content
	,UserId
	,users.UserName
	,ApplyDate AS DataTime
	,CONVERT(varchar(100),ApplyDate, 23) AS DataTimeStr
	,(CASE WHEN States = '0' THEN '/pages/job_info/sxkj_add/main' 
			ELSE '/pages/job_info/dh_approval/main' END) AS UrlStr	
FROM License_LimitedSpace AS License
   LEFT JOIN Sys_User AS users ON users.UserId =License.NextManId
WHERE License.ProjectId=@projectId 
	AND (States = '0' OR States = '1' ) 
	AND License.NextManId LIKE '%'+ @userId+'%'

UNION ALL
SELECT RadialWorkId AS DataId
	,'F72FF20B-D3EB-46A5-97F7-C99B2473A140' AS MenuId
	,'射线作业' AS MenuName
	,LicenseCode AS Content
	,UserId
	,users.UserName
	,ApplyDate AS DataTime
	,CONVERT(varchar(100),ApplyDate, 23) AS DataTimeStr
	,(CASE WHEN States = '0' THEN '/pages/job_info/sx_add/main' 
			ELSE '/pages/job_info/dh_approval/main' END) AS UrlStr	
FROM License_RadialWork AS License
   LEFT JOIN Sys_User AS users ON users.UserId =License.NextManId
WHERE License.ProjectId=@projectId 
	AND (States = '0' OR States = '1' ) 
	AND License.NextManId LIKE '%'+ @userId+'%'

UNION ALL
SELECT OpenCircuitId AS DataId
	,'4E607E83-41FC-4F49-B26F-A21CFE38328F' AS MenuId
	,'断路(占道)' AS MenuName
	,LicenseCode AS Content
	,UserId
	,users.UserName
	,ApplyDate AS DataTime
	,CONVERT(varchar(100),ApplyDate, 23) AS DataTimeStr
	,(CASE WHEN States = '0' THEN '/pages/job_info/dl_add/main' 
			ELSE '/pages/job_info/dh_approval/main' END) AS UrlStr	
FROM License_OpenCircuit AS License
   LEFT JOIN Sys_User AS users ON users.UserId =License.NextManId
WHERE License.ProjectId=@projectId 
	AND (States = '0' OR States = '1' ) 
	AND License.NextManId LIKE '%'+ @userId+'%'

UNION ALL
SELECT BreakGroundId AS DataId
	,'755C6AC9-2E38-4D4F-AF33-33CB1744A907' AS MenuId
	,'动土作业' AS MenuName
	,LicenseCode AS Content
	,UserId
	,users.UserName
	,ApplyDate AS DataTime
	,CONVERT(varchar(100),ApplyDate, 23) AS DataTimeStr
	,(CASE WHEN States = '0' THEN '/pages/job_info/dt_add/main' 
			ELSE '/pages/job_info/dh_approval/main' END) AS UrlStr	
FROM License_BreakGround AS License
   LEFT JOIN Sys_User AS users ON users.UserId =License.NextManId
WHERE License.ProjectId=@projectId 
	AND (States = '0' OR States = '1' ) 
	AND License.NextManId LIKE '%'+ @userId+'%'

UNION ALL
SELECT NightWorkId AS DataId
	,'7BBAE649-7B00-4475-A911-BFE3A37AC55B' AS MenuId
	,'夜间施工' AS MenuName
	,LicenseCode AS Content
	,UserId
	,users.UserName
	,ApplyDate AS DataTime
	,CONVERT(varchar(100),ApplyDate, 23) AS DataTimeStr
	,(CASE WHEN States = '0' THEN '/pages/job_info/yjsg_add/main' 
			ELSE '/pages/job_info/dh_approval/main' END) AS UrlStr	
FROM License_NightWork AS License
   LEFT JOIN Sys_User AS users ON users.UserId =License.NextManId
WHERE License.ProjectId=@projectId 
	AND (States = '0' OR States = '1' ) 
	AND License.NextManId LIKE '%'+ @userId+'%'

UNION ALL
SELECT LiftingWorkId AS DataId
	,'A1BE3AB6-9D4A-41E7-8870-E73423165451' AS MenuId
	,'吊装作业' AS MenuName
	,LicenseCode AS Content
	,UserId
	,users.UserName
	,ApplyDate AS DataTime
	,CONVERT(varchar(100),ApplyDate, 23) AS DataTimeStr
	,(CASE WHEN States = '0' THEN '/pages/job_info/dz_add/main' 
			ELSE '/pages/job_info/dh_approval/main' END) AS UrlStr	
FROM License_LiftingWork AS License
   LEFT JOIN Sys_User AS users ON users.UserId =License.NextManId
WHERE License.ProjectId=@projectId 
	AND (States = '0' OR States = '1' ) 
	AND License.NextManId LIKE '%'+ @userId+'%'

UNION ALL
SELECT RectifyNoticesId AS DataId
	,'0038D764-D628-46F0-94FF-D0A22C3C45A3' AS MenuId
	,'隐患整改' AS MenuName
	,(CASE WHEN Rectify.States =1 THEN '待签发：' 
		   WHEN Rectify.States =2 THEN '待整改：' 
		   WHEN Rectify.States =3 THEN '待审核：' 
		   WHEN Rectify.States =4 THEN '待复查：' 
		   WHEN Rectify.States =5 THEN '已完成：' 
		   ELSE '待提交：' END + RectifyNoticesCode) AS Content	
	,users.UserId
	,users.UserName
	,CheckedDate AS DataTime
	,CONVERT(varchar(100),CheckedDate, 23) AS DataTimeStr
	,(CASE WHEN ISNULL(Rectify.States,0) =0 THEN '/pages/grow/rn_add/main' --提交
		   WHEN Rectify.States =1 THEN '/pages/grow/rn_approval/main' --签发
		   WHEN Rectify.States =2 THEN '/pages/grow/rn_rectify/main' --整改
		   WHEN Rectify.States =3 THEN '/pages/grow/rn_rectifycf/main' --审核
		   WHEN Rectify.States =4 THEN '/pages/grow/rn_confirm/main'  --复查
		ELSE '/pages/grow/rn_add/main' END) AS UrlStr	
FROM Check_RectifyNotices AS Rectify
	LEFT JOIN Sys_User AS users ON users.UserId =@userId
WHERE Rectify.ProjectId=@projectId AND Rectify.States <> 5
	AND ((ISNULL(Rectify.States,0) =0 AND Rectify.CompleteManId LIKE '%'+ @userId+'%')
		 OR (Rectify.States =1 AND Rectify.SignPerson LIKE '%'+ @userId+'%')
		 OR (Rectify.States =2 AND Rectify.DutyPersonId LIKE '%'+ @userId+'%')
		 OR (Rectify.States =3 AND Rectify.UnitHeadManId LIKE '%'+ @userId+'%')
		 OR (Rectify.States =4 AND Rectify.CheckPerson LIKE '%'+ @userId+'%')
		 OR (Rectify.ProfessionalEngineerId LIKE '%'+ @userId+'%' AND (ProfessionalEngineerTime1 IS NULL OR ProfessionalEngineerTime2 IS NULL))
		 OR (Rectify.ConstructionManagerId LIKE '%'+ @userId+'%' AND (ConstructionManagerTime1 IS NULL OR ConstructionManagerTime2 IS NULL))
		 OR (Rectify.ProjectManagerId LIKE '%'+ @userId+'%' AND (ProjectManagerTime1 IS NULL OR ProjectManagerTime2 IS NULL)))

UNION ALL
SELECT PersonId AS DataId
	,'EE260447-028F-46AF-8864-9A5DC9DAA5BD' AS MenuId
	,'现场人员' AS MenuName
	,Person.PersonName AS Content	
	,users.UserId
	,users.UserName
	,Person.InTime AS DataTime
	,CONVERT(varchar(100),Person.InTime, 23) AS DataTimeStr
	,('/pages/info/people_detail/main') AS UrlStr	
FROM SitePerson_Person AS Person
   LEFT JOIN Sys_User AS users ON users.UserId =@userId
WHERE Person.ProjectId=@projectId AND (Person.IsUsed IS NULL OR Person.IsUsed= 0)
	AND Person.AuditorId = @userId AND Person.AuditorDate IS NULL

UNION ALL
SELECT TaskId AS DataId
	,'E108F75D-89D0-4DCA-8356-A156C328805C' AS MenuId
	,'培训任务' AS MenuName
	,Plans.PlanName AS Content	
	,users.UserId
	,users.UserName
	,TaskDate AS DataTime
	,CONVERT(varchar(100),TaskDate, 23) AS DataTimeStr
	,('/pages/train_task/task_list/main') AS UrlStr	
FROM Training_Task AS Task
   LEFT JOIN Sys_User AS users ON users.UserId =@userId
   LEFT JOIN Training_Plan AS Plans ON Plans.PlanId =Task.PlanId
WHERE Task.ProjectId=@projectId AND (Task.States IS NULL OR Task.States != 2)
	AND Task.UserId = @userId 

	UNION ALL
SELECT PauseNoticeId AS DataId
	,'C81DB7ED-165E-4C69-86B0-A3AAE37059FE' AS MenuId
	,'暂停令' AS MenuName
	,PauseNotice.PauseContent AS Content	
	,users.UserId
	,users.UserName
	,PauseTime AS DataTime
	,CONVERT(varchar(100),PauseTime, 23) AS DataTimeStr
	,('/pages/info/stop_confirm/main') AS UrlStr	
FROM Check_PauseNotice AS PauseNotice
   LEFT JOIN Sys_User AS users ON users.UserId =@userId  
WHERE PauseNotice.ProjectId=@projectId AND ConfirmDate IS NULL
	AND PauseNotice.ProjectHeadConfirmId = @userId 
ORDER BY DataTime DESC 
END

GO

-- 隐患整改单 选择检查人id
ALTER TABLE Check_RectifyNotices ADD CheckManIds nvarchar(2000) null
go
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'检查人Ids' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_RectifyNotices', @level2type=N'COLUMN',@level2name=N'CheckManIds'
GO

INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('C3B6B222-44DC-46F3-B783-B1FC0F743C48','隐患整改单(赛鼎)','Check/RectifyNotices.aspx','PageHeaderFooter',70,'467A0CB9-737D-4451-965E-869EBC3A4BD6','Menu_Project',1,0)
GO
--隐患整改单按钮
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('7C851AD5-57CB-444E-9246-C0AE4FFEFABB','C3B6B222-44DC-46F3-B783-B1FC0F743C48','增加',1)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('E2EDBEED-D46C-4DCF-AFEE-13EE86EB022E','C3B6B222-44DC-46F3-B783-B1FC0F743C48','修改',2)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('37813E3D-6509-4F70-A7F9-F6BBA825B827','C3B6B222-44DC-46F3-B783-B1FC0F743C48','删除',3)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('E3C7FF40-5FF7-4937-8C6E-FE8772C5FDEE','C3B6B222-44DC-46F3-B783-B1FC0F743C48','保存',4)	
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('F69771B8-5964-4E5F-A628-2E841D996DCD','C3B6B222-44DC-46F3-B783-B1FC0F743C48','审核',5)
GO

INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('C3B6B222-44DC-46F3-B783-B1FC0F743C48','隐患整改单(赛鼎)','Check/RectifyNotices.aspx','PageHeaderFooter',70,'467A0CB9-737D-4451-965E-869EBC3A4BD6','Menu_Project',1,0)
GO


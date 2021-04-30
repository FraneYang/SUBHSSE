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
	,'/pages/grow/safe_confirm/' AS UrlStr
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
	,(CASE WHEN Rectify.SignDate IS NULL THEN '待签发：' 
		   WHEN Rectify.SignDate IS NOT NULL AND Rectify.CompleteDate IS NULL THEN '待整改：'
		   WHEN Rectify.CompleteDate IS NOT NULL AND Rectify.ReCheckDate IS NULL THEN '待复查：'
			ELSE '' END + RectifyNoticesCode) AS Content	
	,users.UserId
	,users.UserName
	,CheckedDate AS DataTime
	,CONVERT(varchar(100),CheckedDate, 23) AS DataTimeStr
	,(CASE WHEN Rectify.SignDate IS NULL THEN '/pages/rectifynotices_info/dz_add/main' --签发
		   WHEN Rectify.SignDate IS NOT NULL AND Rectify.CompleteDate IS NULL THEN '/pages/job_info/dz_add/main' --整改
		   WHEN Rectify.CompleteDate IS NOT NULL AND Rectify.ReCheckDate IS NULL THEN '/pages/job_info/dz_add/main'  --复查
		ELSE '/pages/job_info/dh_approval/main' END) AS UrlStr	
FROM Check_RectifyNotices AS Rectify
   LEFT JOIN Sys_User AS users ON users.UserId =@userId
WHERE Rectify.ProjectId=@projectId 
	AND ((Rectify.SignDate IS NULL AND Rectify.SignPerson LIKE '%'+ @userId+'%')
		 OR (Rectify.SignDate IS NOT NULL AND Rectify.CompleteDate IS NULL AND Rectify.DutyPersonId LIKE '%'+ @userId+'%')
		 OR (Rectify.CompleteDate IS NOT NULL AND Rectify.ReCheckDate IS NULL AND Rectify.CheckPerson LIKE '%'+ @userId+'%'))
ORDER BY DataTime DESC 

END
GO

ALTER TABLE InformationProject_Picture ALTER COLUMN  PictureType NVARCHAR(50)
GO

ALTER TABLE [dbo].[InformationProject_Picture]  WITH CHECK ADD  CONSTRAINT [FK_InformationProject_Picture_Base_PictureType] FOREIGN KEY([PictureType])
REFERENCES [dbo].[Base_PictureType] ([PictureTypeId])
GO

ALTER TABLE [dbo].[InformationProject_Picture] CHECK CONSTRAINT [FK_InformationProject_Picture_Base_PictureType]
GO
--巡检表新增 整改单ID
ALTER TABLE HSSE_Hazard_HazardRegister ADD RectifyNoticesId NVARCHAR(50) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'整改单ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_HazardRegister', @level2type=N'COLUMN',@level2name=N'RectifyNoticesId'
GO
ALTER TABLE [dbo].[HSSE_Hazard_HazardRegister]  WITH CHECK ADD  CONSTRAINT [FK_HSSE_Hazard_HazardRegister_Check_RectifyNotices] FOREIGN KEY([RectifyNoticesId])
REFERENCES [dbo].[Check_RectifyNotices] ([RectifyNoticesId])
GO
ALTER TABLE [dbo].[HSSE_Hazard_HazardRegister] CHECK CONSTRAINT [FK_HSSE_Hazard_HazardRegister_Check_RectifyNotices]
GO

/****** Object:  Index [IX_Meeting_ClassMeeting]    Script Date: 2019/12/5 20:13:50 ******/
CREATE NONCLUSTERED INDEX [IX_Meeting_ClassMeeting] ON [dbo].[Meeting_ClassMeeting]
(
	[ProjectId] ASC,
	[States] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

/****** Object:  Index [IX_Meeting_AttendMeeting]    Script Date: 2019/12/5 20:13:50 ******/
CREATE NONCLUSTERED INDEX [IX_Meeting_AttendMeeting] ON [dbo].[Meeting_AttendMeeting]
(
	[ProjectId] ASC,
	[States] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO


/****** Object:  Index [IX_Meeting_MonthMeeting]    Script Date: 2019/12/5 20:13:50 ******/
CREATE NONCLUSTERED INDEX [IX_Meeting_MonthMeeting] ON [dbo].[Meeting_MonthMeeting]
(
	[ProjectId] ASC,
	[States] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO


/****** Object:  Index [IX_Meeting_SpecialMeeting]    Script Date: 2019/12/5 20:13:50 ******/
CREATE NONCLUSTERED INDEX [IX_Meeting_SpecialMeeting] ON [dbo].[Meeting_SpecialMeeting]
(
	[ProjectId] ASC,
	[States] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO


/****** Object:  Index [IX_Meeting_WeekMeeting]    Script Date: 2019/12/5 20:13:50 ******/
CREATE NONCLUSTERED INDEX [IX_Meeting_WeekMeeting] ON [dbo].[Meeting_WeekMeeting]
(
	[ProjectId] ASC,
	[States] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

/****** Object:  Index [IX_AttachFile]    Script Date: 2019/12/5 20:17:14 ******/
CREATE NONCLUSTERED INDEX [IX_AttachFile] ON [dbo].[AttachFile]
(
	[ToKeyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

/****** Object:  Index [IX_License_FireWork]    Script Date: 2019/12/6 18:36:47 ******/
CREATE NONCLUSTERED INDEX [IX_License_FireWork] ON [dbo].[License_FireWork]
(
	[ProjectId] ASC,
	[States] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO


/****** Object:  Index [IX_License_FireWork_1]    Script Date: 2019/12/6 18:36:51 ******/
CREATE NONCLUSTERED INDEX [IX_License_FireWork_1] ON [dbo].[License_FireWork]
(
	[LicenseCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO


/****** Object:  Index [IX_License_FireWork_2]    Script Date: 2019/12/6 18:36:55 ******/
CREATE NONCLUSTERED INDEX [IX_License_FireWork_2] ON [dbo].[License_FireWork]
(
	[ApplyDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_License_HeightWork]    Script Date: 2019/12/6 18:36:47 ******/
CREATE NONCLUSTERED INDEX [IX_License_HeightWork] ON [dbo].[License_HeightWork]
(
	[ProjectId] ASC,
	[States] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO


/****** Object:  Index [IX_License_HeightWork_1]    Script Date: 2019/12/6 18:36:51 ******/
CREATE NONCLUSTERED INDEX [IX_License_HeightWork_1] ON [dbo].[License_HeightWork]
(
	[LicenseCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO


/****** Object:  Index [IX_License_HeightWork_2]    Script Date: 2019/12/6 18:36:55 ******/
CREATE NONCLUSTERED INDEX [IX_License_HeightWork_2] ON [dbo].[License_HeightWork]
(
	[ApplyDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_License_BreakGround]    Script Date: 2019/12/6 18:36:47 ******/
CREATE NONCLUSTERED INDEX [IX_License_BreakGround] ON [dbo].[License_BreakGround]
(
	[ProjectId] ASC,
	[States] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO


/****** Object:  Index [IX_License_BreakGround_1]    Script Date: 2019/12/6 18:36:51 ******/
CREATE NONCLUSTERED INDEX [IX_License_BreakGround_1] ON [dbo].[License_BreakGround]
(
	[LicenseCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO


/****** Object:  Index [IX_License_BreakGround_2]    Script Date: 2019/12/6 18:36:55 ******/
CREATE NONCLUSTERED INDEX [IX_License_BreakGround_2] ON [dbo].[License_BreakGround]
(
	[ApplyDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_License_LiftingWork]    Script Date: 2019/12/6 18:36:47 ******/
CREATE NONCLUSTERED INDEX [IX_License_LiftingWork] ON [dbo].[License_LiftingWork]
(
	[ProjectId] ASC,
	[States] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO


/****** Object:  Index [IX_License_LiftingWork_1]    Script Date: 2019/12/6 18:36:51 ******/
CREATE NONCLUSTERED INDEX [IX_License_LiftingWork_1] ON [dbo].[License_LiftingWork]
(
	[LicenseCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO


/****** Object:  Index [IX_License_LiftingWork_2]    Script Date: 2019/12/6 18:36:55 ******/
CREATE NONCLUSTERED INDEX [IX_License_LiftingWork_2] ON [dbo].[License_LiftingWork]
(
	[ApplyDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_License_LimitedSpace]    Script Date: 2019/12/6 18:36:47 ******/
CREATE NONCLUSTERED INDEX [IX_License_LimitedSpace] ON [dbo].[License_LimitedSpace]
(
	[ProjectId] ASC,
	[States] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO


/****** Object:  Index [IX_License_LimitedSpace_1]    Script Date: 2019/12/6 18:36:51 ******/
CREATE NONCLUSTERED INDEX [IX_License_LimitedSpace_1] ON [dbo].[License_LimitedSpace]
(
	[LicenseCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO


/****** Object:  Index [IX_License_LimitedSpace_2]    Script Date: 2019/12/6 18:36:55 ******/
CREATE NONCLUSTERED INDEX [IX_License_LimitedSpace_2] ON [dbo].[License_LimitedSpace]
(
	[ApplyDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_License_NightWork]    Script Date: 2019/12/6 18:36:47 ******/
CREATE NONCLUSTERED INDEX [IX_License_NightWork] ON [dbo].[License_NightWork]
(
	[ProjectId] ASC,
	[States] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO


/****** Object:  Index [IX_License_NightWork_1]    Script Date: 2019/12/6 18:36:51 ******/
CREATE NONCLUSTERED INDEX [IX_License_NightWork_1] ON [dbo].[License_NightWork]
(
	[LicenseCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO


/****** Object:  Index [IX_License_NightWork_2]    Script Date: 2019/12/6 18:36:55 ******/
CREATE NONCLUSTERED INDEX [IX_License_NightWork_2] ON [dbo].[License_NightWork]
(
	[ApplyDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_License_OpenCircuit]    Script Date: 2019/12/6 18:36:47 ******/
CREATE NONCLUSTERED INDEX [IX_License_OpenCircuit] ON [dbo].[License_OpenCircuit]
(
	[ProjectId] ASC,
	[States] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO


/****** Object:  Index [IX_License_OpenCircuit_1]    Script Date: 2019/12/6 18:36:51 ******/
CREATE NONCLUSTERED INDEX [IX_License_OpenCircuit_1] ON [dbo].[License_OpenCircuit]
(
	[LicenseCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO


/****** Object:  Index [IX_License_OpenCircuit_2]    Script Date: 2019/12/6 18:36:55 ******/
CREATE NONCLUSTERED INDEX [IX_License_OpenCircuit_2] ON [dbo].[License_OpenCircuit]
(
	[ApplyDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_License_RadialWork]    Script Date: 2019/12/6 18:36:47 ******/
CREATE NONCLUSTERED INDEX [IX_License_RadialWork] ON [dbo].[License_RadialWork]
(
	[ProjectId] ASC,
	[States] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO


/****** Object:  Index [IX_License_RadialWork_1]    Script Date: 2019/12/6 18:36:51 ******/
CREATE NONCLUSTERED INDEX [IX_License_RadialWork_1] ON [dbo].[License_RadialWork]
(
	[LicenseCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO


/****** Object:  Index [IX_License_RadialWork_2]    Script Date: 2019/12/6 18:36:55 ******/
CREATE NONCLUSTERED INDEX [IX_License_RadialWork_2] ON [dbo].[License_RadialWork]
(
	[ApplyDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_License_LicenseItem]    Script Date: 2019/12/6 18:41:08 ******/
CREATE NONCLUSTERED INDEX [IX_License_LicenseItem] ON [dbo].[License_LicenseItem]
(
	[DataId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_License_LicenseItem_1]    Script Date: 2019/12/6 18:41:16 ******/
CREATE NONCLUSTERED INDEX [IX_License_LicenseItem_1] ON [dbo].[License_LicenseItem]
(
	[DataId] ASC,
	[SortIndex] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

ALTER TABLE Training_TestTrainingItem ALTER COLUMN WorkPostIds NVARCHAR(4000) NULL
GO
/****** Object:  Index [IX_Training_TestTrainingItem]    Script Date: 2019/12/6 18:45:54 ******/
CREATE NONCLUSTERED INDEX [IX_Training_TestTrainingItem] ON [dbo].[Training_TestTrainingItem]
(
	[TestType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NonClusteredIndex-20191206-184536]    Script Date: 2019/12/6 18:46:02 ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20191206-184536] ON [dbo].[Training_TestTrainingItem]
(
	[TrainingId] ASC,
	[WorkPostIds] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

/****** Object:  Index [NonClusteredIndex-20191206-200335]    Script Date: 2019/12/6 20:04:26 ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20191206-200335] ON [dbo].[Check_RectifyNotices]
(
	[ProjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

/****** Object:  Index [NonClusteredIndex-20191206-200412]    Script Date: 2019/12/6 20:04:30 ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20191206-200412] ON [dbo].[Check_RectifyNotices]
(
	[RectifyNoticesCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
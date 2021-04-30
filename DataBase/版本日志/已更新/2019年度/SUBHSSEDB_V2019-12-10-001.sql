ALTER TABLE [dbo].[HSSE_Hazard_HazardRegister] DROP CONSTRAINT [FK_HSSE_Hazard_HazardRegister_Check_RectifyNotices]
GO
ALTER TABLE HSSE_Hazard_HazardRegister DROP COLUMN  RectifyNoticesId
GO

ALTER TABLE HSSE_Hazard_HazardRegister ADD ResultType VARCHAR(2) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'相关联单据类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_HazardRegister', @level2type=N'COLUMN',@level2name=N'ResultType'
GO

ALTER TABLE HSSE_Hazard_HazardRegister ADD ResultId NVARCHAR(50) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项关联单据ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_HazardRegister', @level2type=N'COLUMN',@level2name=N'ResultId'
GO

ALTER TABLE HSSE_Hazard_CheckSpecial ADD CheckItemTypeName NVARCHAR(50) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'检查类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_CheckSpecial', @level2type=N'COLUMN',@level2name=N'CheckItemTypeName'
GO
ALTER TABLE HSSE_Hazard_CheckSpecial ADD CheckItemSetName NVARCHAR(50) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'检查项' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_CheckSpecial', @level2type=N'COLUMN',@level2name=N'CheckItemSetName'
GO

ALTER TABLE InformationProject_ReceiveFileManager ADD FileType VARCHAR(2) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件类型（0-项目发文；1-单位来文）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_ReceiveFileManager', @level2type=N'COLUMN',@level2name=N'FileType'
GO
/****** Object:  Index [NonClusteredIndex-20191213-100432]    Script Date: 2019/12/13 10:05:16 ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20191213-100432] ON [dbo].[InformationProject_ReceiveFileManager]
(
	[ProjectId] ASC,
	[States] ASC,
	[FileType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

UPDATE InformationProject_ReceiveFileManager SET FileType=0 WHERE FileUnitId IS NULL
GO

UPDATE InformationProject_ReceiveFileManager SET FileType=1 WHERE FileType IS NULL
GO

/****** Object:  Index [NonClusteredIndex-20191212-144622]    Script Date: 2019/12/12 15:52:24 ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20191212-144622] ON [dbo].[HSSE_Hazard_CheckSpecial]
(
	[CheckSpecialCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

CREATE TABLE [dbo].[HSSE_Hazard_CheckSpecialItem](
	[CheckSpecialItemId] [nvarchar](50) NOT NULL,
	[CheckSpecialId] [nvarchar](50) NULL,
	[DutyUnitId] [nvarchar](50) NULL,
	[WorkAreaId] [nvarchar](50) NULL,
	[CheckContent] [nvarchar](500) NULL,
	[SortIndex] [int] NULL,
	[IsOk] [bit] NULL,
	[RectifyNoticesId] [nvarchar](50) NULL,
 CONSTRAINT [PK_HSSE_Hazard_CheckSpecialItem] PRIMARY KEY CLUSTERED 
(
	[CheckSpecialItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[HSSE_Hazard_CheckSpecialItem]  WITH CHECK ADD  CONSTRAINT [FK_HSSE_Hazard_CheckSpecialItem_Base_Unit] FOREIGN KEY([DutyUnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[HSSE_Hazard_CheckSpecialItem] CHECK CONSTRAINT [FK_HSSE_Hazard_CheckSpecialItem_Base_Unit]
GO

ALTER TABLE [dbo].[HSSE_Hazard_CheckSpecialItem]  WITH CHECK ADD  CONSTRAINT [FK_HSSE_Hazard_CheckSpecialItem_Check_RectifyNotices] FOREIGN KEY([RectifyNoticesId])
REFERENCES [dbo].[Check_RectifyNotices] ([RectifyNoticesId])
GO

ALTER TABLE [dbo].[HSSE_Hazard_CheckSpecialItem] CHECK CONSTRAINT [FK_HSSE_Hazard_CheckSpecialItem_Check_RectifyNotices]
GO

ALTER TABLE [dbo].[HSSE_Hazard_CheckSpecialItem]  WITH CHECK ADD  CONSTRAINT [FK_HSSE_Hazard_CheckSpecialItem_HSSE_Hazard_CheckSpecial] FOREIGN KEY([CheckSpecialId])
REFERENCES [dbo].[HSSE_Hazard_CheckSpecial] ([CheckSpecialId])
GO

ALTER TABLE [dbo].[HSSE_Hazard_CheckSpecialItem] CHECK CONSTRAINT [FK_HSSE_Hazard_CheckSpecialItem_HSSE_Hazard_CheckSpecial]
GO

ALTER TABLE [dbo].[HSSE_Hazard_CheckSpecialItem]  WITH CHECK ADD  CONSTRAINT [FK_HSSE_Hazard_CheckSpecialItem_ProjectData_WorkArea] FOREIGN KEY([WorkAreaId])
REFERENCES [dbo].[ProjectData_WorkArea] ([WorkAreaId])
GO

ALTER TABLE [dbo].[HSSE_Hazard_CheckSpecialItem] CHECK CONSTRAINT [FK_HSSE_Hazard_CheckSpecialItem_ProjectData_WorkArea]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_CheckSpecialItem', @level2type=N'COLUMN',@level2name=N'CheckSpecialItemId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'专项检查ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_CheckSpecialItem', @level2type=N'COLUMN',@level2name=N'CheckSpecialId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'受检单位ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_CheckSpecialItem', @level2type=N'COLUMN',@level2name=N'DutyUnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'检查区域ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_CheckSpecialItem', @level2type=N'COLUMN',@level2name=N'WorkAreaId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'检查内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_CheckSpecialItem', @level2type=N'COLUMN',@level2name=N'CheckContent'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'序号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_CheckSpecialItem', @level2type=N'COLUMN',@level2name=N'SortIndex'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否合格' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_CheckSpecialItem', @level2type=N'COLUMN',@level2name=N'IsOk'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'整改单ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_CheckSpecialItem', @level2type=N'COLUMN',@level2name=N'RectifyNoticesId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'专项检查明细表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_CheckSpecialItem'
GO

/****** Object:  Index [NonClusteredIndex-20191212-155618]    Script Date: 2019/12/12 15:56:31 ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20191212-155618] ON [dbo].[HSSE_Hazard_CheckSpecialItem]
(
	[CheckSpecialId] ASC,
	[SortIndex] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Check_RectifyNotices] DROP CONSTRAINT [FK_Check_RectifyNotices_ProjectData_WorkArea]
GO

ALTER TABLE Check_RectifyNotices ALTER COLUMN WorkAreaId NVARCHAR(500) NULL
GO


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
	,(CASE WHEN Rectify.SignDate IS NULL THEN '/pages/grow/rn_add/main' --签发
		   WHEN Rectify.SignDate IS NOT NULL AND Rectify.CompleteDate IS NULL THEN '/pages/grow/rn_approval/main' --整改
		   WHEN Rectify.CompleteDate IS NOT NULL AND Rectify.ReCheckDate IS NULL THEN 'pages/grow/rn_confirm/main'  --复查
		ELSE '/pages/grow/rn_add/main' END) AS UrlStr	
FROM Check_RectifyNotices AS Rectify
   LEFT JOIN Sys_User AS users ON users.UserId =@userId
WHERE Rectify.ProjectId=@projectId 
	AND ((Rectify.SignDate IS NULL AND Rectify.SignPerson LIKE '%'+ @userId+'%')
		 OR (Rectify.SignDate IS NOT NULL AND Rectify.CompleteDate IS NULL AND Rectify.DutyPersonId LIKE '%'+ @userId+'%')
		 OR (Rectify.CompleteDate IS NOT NULL AND Rectify.ReCheckDate IS NULL AND Rectify.CheckPerson LIKE '%'+ @userId+'%'))
ORDER BY DataTime DESC 

END
GO


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
	,(CASE WHEN Rectify.SignDate IS NULL THEN '待签发：' 
		   WHEN Rectify.SignDate IS NOT NULL AND Rectify.CompleteDate IS NULL THEN '待整改：'
		   WHEN Rectify.CompleteDate IS NOT NULL AND Rectify.ReCheckDate IS NULL THEN '待复查：'
			ELSE '' END + RectifyNoticesCode) AS Content	
	,users.UserId
	,users.UserName
	,CheckedDate AS DataTime
	,CONVERT(varchar(100),CheckedDate, 23) AS DataTimeStr
	,(CASE WHEN Rectify.SignDate IS NULL THEN '/pages/grow/rn_add/main' --签发
		   WHEN Rectify.SignDate IS NOT NULL AND Rectify.CompleteDate IS NULL THEN '/pages/grow/rn_approval/main' --整改
		   WHEN Rectify.CompleteDate IS NOT NULL AND Rectify.ReCheckDate IS NULL THEN 'pages/grow/rn_confirm/main'  --复查
		ELSE '/pages/grow/rn_add/main' END) AS UrlStr	
FROM Check_RectifyNotices AS Rectify
   LEFT JOIN Sys_User AS users ON users.UserId =@userId
WHERE Rectify.ProjectId=@projectId 
	AND ((Rectify.SignDate IS NULL AND Rectify.SignPerson LIKE '%'+ @userId+'%')
		 OR (Rectify.SignDate IS NOT NULL AND Rectify.CompleteDate IS NULL AND Rectify.DutyPersonId LIKE '%'+ @userId+'%')
		 OR (Rectify.CompleteDate IS NOT NULL AND Rectify.ReCheckDate IS NULL AND Rectify.CheckPerson LIKE '%'+ @userId+'%'))
ORDER BY DataTime DESC 

END

GO

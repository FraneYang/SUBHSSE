CREATE TABLE [dbo].[Sys_MobileMenu](
	[MenuId] [nvarchar](50) NOT NULL,
	[MenuName] [nvarchar](50) NULL,
	[SortIndex] [int] NULL,
	[Url] [nvarchar](200) NULL,
	[SuperMenu] [nvarchar](50) NULL,
 CONSTRAINT [PK_Sys_MobileMenu] PRIMARY KEY CLUSTERED 
(
	[MenuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_MobileMenu', @level2type=N'COLUMN',@level2name=N'MenuId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_MobileMenu', @level2type=N'COLUMN',@level2name=N'MenuName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_MobileMenu', @level2type=N'COLUMN',@level2name=N'SortIndex'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'路径' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_MobileMenu', @level2type=N'COLUMN',@level2name=N'Url'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'上级菜单' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_MobileMenu', @level2type=N'COLUMN',@level2name=N'SuperMenu'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'移动端菜单ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_MobileMenu'
GO

--安全巡检
INSERT INTO dbo.Sys_MobileMenu(MenuId,MenuName,SortIndex,Url,SuperMenu)
VALUES('F21FFCAA-872A-4995-BB5B-E9C430950845','安全巡检',10,'','0')
GO

CREATE PROCEDURE [dbo].[Sp_APP_GetToDoItems]     
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
FROM HSSE_Hazard_HazardRegister AS register 
LEFT JOIN Sys_User AS users ON users.UserId =@userId
WHERE register.ProjectId=@projectId AND 
((register.states = '1' AND register.ResponsibleMan =@userId) OR (register.states = '2' AND register.CheckManId =@userId))		
ORDER BY DataTime DESC
   
END
GO

ALTER VIEW [dbo].[View_Sys_User]  AS 
/*用户信息列表视图*/ 
SELECT 
	Users.UserId
      ,Users.Account
      ,Users.UserCode
      ,Users.Password
      ,Users.UserName
      ,Users.RoleId
      ,Users.UnitId
      ,Users.IsPosts
      ,Users.IsReplies
      ,Users.IsDeletePosts
      ,Users.IsPost
      ,Users.LoginProjectId
      ,Users.Sex
      ,Users.BirthDay
      ,Users.Marriage
      ,Users.Nation
      ,Users.IdentityCard
      ,Users.Email
      ,Users.Telephone
      ,Users.Education
      ,Users.Hometown
      ,Users.PositionId
      ,Users.PhotoUrl
      ,Users.Performance
      ,Users.PageSize
      ,Users.IsOffice
      ,Users.DeviceId
      ,Users.SessionString
      ,Users.RCount
      ,Users.DataSources
	,CASE WHEN  Users.IsPost=1 THEN '是' ELSE '否' END AS IsPostName		
	,CASE WHEN  Users.IsPosts=1 THEN '是' ELSE '否' END AS IsPostsName
	,CASE WHEN  Users.IsReplies=1 THEN '是' ELSE '否' END AS IsRepliesName
	,CASE WHEN  Users.IsDeletePosts=1 THEN '是' ELSE '否' END AS IsDeletePostsName
	,Roles.RoleName
	,Roles.RoleCode
	,Roles.IsAuditFlow
	,Unit.UnitCode
	,Unit.UnitName	
	,Const13.ConstText AS RoleTypeName
From dbo.Sys_User AS Users
LEFT JOIN Sys_Role AS Roles ON Roles.RoleId=Users.RoleId
LEFT JOIN Base_Unit AS Unit ON Unit.UnitId=Users.UnitId
LEFT JOIN Sys_Const AS Const13 ON Roles.RoleType=Const13.ConstValue AND Const13.GroupId='0013'

GO

/**********隐患巡检（手机端）视图*************/
ALTER VIEW [dbo].[View_Hazard_HazardRegister]
AS
SELECT Registration.HazardRegisterId, 
	Registration.HazardCode, 
	Registration.RegisterDate, 
	Registration.RegisterDef, 
	Registration.Rectification, 
	Registration.Place, 
	Registration.ResponsibleUnit, 
	Registration.Observer, 
	Registration.RectifiedDate, 
	Registration.ProjectId, 
	Registration.states,
	Registration.IsEffective,
	Registration.ResponsibleMan,
	Registration.CheckManId,
	Registration.CheckTime,
	Registration.RectificationPeriod,
	Registration.ImageUrl,
	Registration.RectificationImageUrl,
	Registration.RectificationTime,
	Registration.ConfirmMan,
	Registration.ConfirmDate,
	Registration.HandleIdea, 
	Registration.CutPayment, 
	Registration.ProblemTypes, 
	Registration.CheckSpecialId,
	Registration.CheckItemDetailId,
	Registration.SupCheckItemSetId,
	Registration.CheckItemSetId,
	Registration.SafeSupervisionId,
	Registration.SafeSupervisionIsOK,
	Project.ProjectName,
	Registration.CheckCycle,
	WorkArea.WorkAreaName,
	Unit.UnitName AS ResponsibilityUnitName,
	User1.UserName AS ResponsibilityManName,
	ISNULL(User1.Telephone,'') AS ResponsibilityManTel,
	User2.UserName AS CheckManName,
	ISNULL(User2.Telephone,'') AS  CheckManTel,
	User3.UserName AS ConfirmManName,
	ISNULL(User3.Telephone,'') AS  ConfirmManTel,
	User4.UserName AS ResponsibilityManName2,
	ISNULL(User4.Telephone,'') AS  ResponsibilityMan2Tel,
	(CASE WHEN Registration.states='1' and Registration.SafeSupervisionIsOK is null THEN '待整改' 
	WHEN Registration.states='1' and Registration.SafeSupervisionIsOK=1 THEN '合格' 
	WHEN Registration.states='2' THEN '已整改' 
	WHEN Registration.states='3' THEN '已闭环' 
	ELSE '已作废' END ) AS StatesStr,
	RegisterTypes.RegisterTypesId,
	RegisterTypes.RegisterTypesName,
	CheckItemDetail.CheckContent,  --专项检查项内容
	Registration.DIC_ID
FROM dbo.HSSE_Hazard_HazardRegister AS Registration
LEFT JOIN dbo.Base_Project AS Project ON Project.ProjectId = Registration.ProjectId
LEFT JOIN dbo.ProjectData_WorkArea AS WorkArea ON WorkArea.WorkAreaId = Registration.Place 
LEFT JOIN dbo.HSSE_Hazard_HazardRegisterTypes AS RegisterTypes ON RegisterTypes.RegisterTypesId = Registration.RegisterTypesId 
LEFT JOIN dbo.Base_Unit AS Unit ON Unit.UnitId = Registration.ResponsibleUnit
LEFT JOIN dbo.Sys_User AS User1 ON User1.UserId = Registration.ResponsibleMan   
LEFT JOIN dbo.Sys_User AS User2 ON User2.UserId = Registration.CheckManId
LEFT JOIN dbo.Sys_User AS User3 ON User3.UserId = Registration.ConfirmMan
LEFT JOIN dbo.Sys_User AS User4 ON User4.UserId = Registration.ResponsibleMan2
LEFT JOIN dbo.HSSE_Check_CheckItemDetail AS CheckItemDetail ON CheckItemDetail.CheckItemDetailId = Registration.CheckItemDetailId

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
ORDER BY DataTime DESC
   
END
GO

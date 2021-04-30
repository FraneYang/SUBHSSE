CREATE VIEW [dbo].[View_QualityAudit_EquipmentQuality]  AS 
/*机具设备资质信息列表视图*/ 
SELECT equ.EquipmentQualityId
      ,equ.ProjectId
      ,equ.EquipmentQualityCode
      ,equ.UnitId
	  ,Unit.UnitName
      ,equ.SpecialEquipmentId
	  ,sp.SpecialEquipmentName
      ,equ.EquipmentQualityName
      ,equ.SizeModel
      ,equ.FactoryCode
      ,equ.CertificateCode
      ,equ.CheckDate
      ,equ.LimitDate
      ,equ.InDate
      ,equ.OutDate
      ,equ.ApprovalPerson
      ,equ.CarNum
      ,equ.Remark
      ,equ.CompileMan
	  ,U.UserName AS CompileManName
      ,equ.CompileDate
      ,equ.QRCodeAttachUrl
	  ,REPLACE(a.AttachUrl,'\', '/') AS AttachUrl
FROM QualityAudit_EquipmentQuality AS equ
LEFT JOIN Base_Unit AS Unit ON Unit.UnitId=equ.UnitId
LEFT JOIN Base_SpecialEquipment AS sp ON equ.SpecialEquipmentId = sp.SpecialEquipmentId
LEFT JOIN Sys_User AS U ON U.UserId = equ.CompileMan
LEFT JOIN AttachFile AS a ON a.ToKeyId = equ.EquipmentQualityId
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
      ,ISNULL(Users.Email,'') AS Email
      ,ISNULL(Users.Telephone,'') AS Telephone
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


INSERT dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES  ('CD7FA75D-A3AA-4FAF-B30D-445332BA1F50','8IDKGJE2-09B1-4607-BC6D-865CE48F0002','导入',5)
GO

ALTER TABLE Sys_User ADD DepartId NVARCHAR(50) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'部门ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_User', @level2type=N'COLUMN',@level2name=N'DepartId'
GO
ALTER TABLE [dbo].[Sys_User]  WITH CHECK ADD  CONSTRAINT [FK_Sys_User_Base_Depart] FOREIGN KEY([DepartId])
REFERENCES [dbo].[Base_Depart] ([DepartId])
GO

ALTER TABLE [dbo].[Sys_User] CHECK CONSTRAINT [FK_Sys_User_Base_Depart]
GO

ALTER TABLE SitePerson_Person ADD IsForeign BIT NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否外籍人员' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_Person', @level2type=N'COLUMN',@level2name=N'IsForeign'
GO

ALTER TABLE SitePerson_Person ADD IsOutside BIT NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否外聘人员' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_Person', @level2type=N'COLUMN',@level2name=N'IsOutside'
GO
ALTER VIEW [dbo].[View_SitePerson_Person]
AS
SELECT Person.PersonId,
	Person.CardNo,
	Person.PersonName,
	Person.Sex, 
	(Case Person.Sex WHEN '1' THEN '男' WHEN '2' THEN '女' ELSE '' END) AS SexName, 
	Person.IdentityCard, 
	Person.Address, 
	Person.ProjectId, 
	Person.UnitId, 
	Person.TeamGroupId, 
	Person.WorkAreaId, 
	Person.WorkPostId, 	
	Person.InTime, 
	Person.OutTime, 
	Person.OutResult, 
	Person.Telephone, 
	Person.PositionId, 
	Person.PostTitleId, 
	Person.PhotoUrl, 
	Person.IsUsed,
	(CASE Person.IsUsed WHEN 'TRUE' THEN '是' ELSE '否' END) AS IsUsedName, 
	Person.IsCardUsed, 
	(CASE Person.IsCardUsed WHEN 'TRUE' THEN '是' ELSE '否' END) AS IsCardUsedName, 
	Person.PersonIndex,
	Project.ProjectCode,
	Project.ProjectName,
	Unit.UnitCode,
	Unit.UnitName,
	TeamGroup.TeamGroupName,
	WorkArea.WorkAreaCode,
	WorkArea.WorkAreaName,
	Post.WorkPostName,
	Position.PositionName,
	Title.PostTitleName,
	Depart.DepartName,
	Post.PostType,
	Post.IsHsse,
	(SELECT COUNT(*) FROM EduTrain_TrainRecordDetail T WHERE T.PersonId=Person.PersonId) AS TrainCount,
	Person.AuditorId,
	sysUser.UserName AS AuditorName,
	Person.AuditorDate,
	Person.IDCardUrl,
	Person.IsForeign,
	Person.IsOutside
FROM SitePerson_Person AS Person
LEFT JOIN Base_Project AS Project ON Project.ProjectId=Person.ProjectId
LEFT JOIN Base_Unit AS Unit ON Unit.UnitId = Person.UnitId
LEFT JOIN ProjectData_TeamGroup AS TeamGroup ON TeamGroup.TeamGroupId=Person.TeamGroupId
LEFT JOIN ProjectData_WorkArea AS WorkArea ON WorkArea.WorkAreaId = Person.WorkAreaId
LEFT JOIN Base_WorkPost AS Post ON Post.WorkPostId = Person.WorkPostId
LEFT JOIN Base_Position AS Position ON Position.PositionId = Person.PositionId
Left JOIN Base_PostTitle AS Title ON Title.PostTitleId = Person.PostTitleId
Left JOIN Base_Depart AS Depart ON Depart.DepartId = Person.DepartId
Left JOIN Sys_User AS sysUser ON sysUser.UserId = Person.AuditorId
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
	ISNULL(WorkArea.WorkAreaName,'') AS WorkAreaName,
	Unit.UnitName AS ResponsibilityUnitName,
	User1.UserName AS ResponsibilityManName,
	ISNULL(User1.Telephone,'') AS ResponsibilityManTel,
	User2.UserName AS CheckManName,
	ISNULL(User2.Telephone,'') AS  CheckManTel,
	User2.UnitId AS SendUnitId,
	User3.UserName AS ConfirmManName,
	ISNULL(User3.Telephone,'') AS  ConfirmManTel,
	User4.UserName AS ResponsibilityManName2,
	ISNULL(User4.Telephone,'') AS  ResponsibilityMan2Tel,
	(CASE WHEN Registration.states='1' and (Registration.SafeSupervisionIsOK is null OR Registration.SafeSupervisionIsOK=0) THEN '待整改' 
	WHEN Registration.states='1' and Registration.SafeSupervisionIsOK=1 THEN '合格' 
	WHEN Registration.states='2' THEN '已整改' 
	WHEN Registration.states='3' THEN '已闭环' 
	ELSE '已作废' END ) AS StatesStr,
	RegisterTypes.RegisterTypesId,
	RegisterTypes.RegisterTypesName,
	CheckItemDetail.CheckContent,  --专项检查项内容
	Registration.DIC_ID,
	Registration.CCManIds,
	CCManNames = STUFF(( SELECT ',' + UserName FROM Sys_User
				    where PATINDEX('%,' + RTRIM(Sys_User.UserId) + ',%',',' + Registration.CCManIds + ',')>0
					ORDER BY PATINDEX('%,' + RTRIM(Registration.CCManIds) + ',%',',' + Registration.CCManIds + ',')
					FOR XML PATH('')), 1, 1,'')
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

ALTER TABLE HSSE_Hazard_HazardRegister ADD Requirements NVARCHAR(400) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'整改要求' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_HazardRegister', @level2type=N'COLUMN',@level2name=N'Requirements'
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
					FOR XML PATH('')), 1, 1,''),
	Registration.Requirements
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



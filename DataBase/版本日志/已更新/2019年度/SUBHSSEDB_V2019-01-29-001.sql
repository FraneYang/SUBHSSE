ALTER VIEW [dbo].[View_Check_CheckDayDetail] 
AS 
/*日常巡检明细列表视图*/
SELECT checkDayDetail.CheckDayDetailId, 
	checkDayDetail.CheckDayId, 
	checkDayDetail.CheckItem, 
	checkDayDetail.CheckItemType,
	checkDayDetail.Unqualified,
	checkDayDetail.CheckArea,
	checkDayDetail.UnitId,
	checkDayDetail.HandleStep,
	checkDayDetail.CompleteStatus,
	(case when checkDayDetail.CompleteStatus =1 then '是' 
			when checkDayDetail.CompleteStatus =0 then '否' else '' end) as  CompleteStatusName,
	checkDayDetail.LimitedDate,
	checkDayDetail.CompletedDate,
	checkDayDetail.Suggestions,
	checkDayDetail.CheckContent,
	(case when checkDayDetail.CheckContent is not null then checkDayDetail.CheckContent
	else checkItemSet.CheckItemName end) as CheckItemStr,
	checkDayDetail.WorkArea,
	unit.UnitName,
	const.ConstText as HandleStepStr
FROM dbo.Check_CheckDayDetail AS checkDayDetail
--LEFT JOIN dbo.Check_ProjectCheckItemDetail AS checkItemDetail ON checkItemDetail.CheckItemDetailId=checkDayDetail.CheckItem
LEFT JOIN dbo.Check_ProjectCheckItemSet AS checkItemSet ON checkItemSet.CheckItemSetId=checkDayDetail.CheckItem
LEFT JOIN dbo.Base_Unit AS unit ON unit.UnitId=checkDayDetail.UnitId
LEFT JOIN Sys_Const AS const ON const.ConstValue = checkDayDetail.HandleStep and const.GroupId='HandleStep'


GO


INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('7AC97581-08C2-4848-A117-BDC034EF6666','专项检查类型*','BaseInfo/SpecialCheckTypes.aspx','TableRelationship',285,'0','Menu_BaseInfo',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('93FACE68-8811-47B0-BE5B-E64922E155BA','7AC97581-08C2-4848-A117-BDC034EF6666','增加',1)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('71220D7E-3312-4562-86D0-6B48DA848405','7AC97581-08C2-4848-A117-BDC034EF6666','修改',2)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('BE18E5DC-C08E-4A2A-92E5-BB6E494A1626','7AC97581-08C2-4848-A117-BDC034EF6666','删除',3)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('524CA955-386F-4F0F-BA14-A11667C00EFD','7AC97581-08C2-4848-A117-BDC034EF6666','保存',4)   
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
	User2.UserName AS CheckManName,
	User3.UserName AS ConfirmManName,
	User4.UserName AS ResponsibilityManName2,
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

ALTER TABLE Check_CheckSpecial ADD PartInPersonNames NVARCHAR(1000) null
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'检查组成员姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckSpecial', @level2type=N'COLUMN',@level2name=N'PartInPersonNames'
GO

ALTER TABLE Check_CheckColligation ADD PartInPersonNames NVARCHAR(1000) null
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'检查组成员姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckColligation', @level2type=N'COLUMN',@level2name=N'PartInPersonNames'
GO

ALTER TABLE Check_CheckHoliday ADD PartInPersonNames NVARCHAR(1000) null
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'检查组成员姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckHoliday', @level2type=N'COLUMN',@level2name=N'PartInPersonNames'
GO

ALTER TABLE Check_CheckWork ADD PartInPersonNames NVARCHAR(1000) null
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'检查组成员姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckWork', @level2type=N'COLUMN',@level2name=N'PartInPersonNames'
GO

ALTER VIEW [dbo].[View_Check_CheckSpecialDetail]  AS 
/*专项检查明细列表视图*/
	SELECT checkSpecialDetail.CheckSpecialDetailId, 
	checkSpecialDetail.CheckSpecialId, 
	checkSpecialDetail.CheckItem, 
	checkSpecialDetail.CheckItemType,
	checkSpecialDetail.Unqualified,
	checkSpecialDetail.CheckArea,
	checkSpecialDetail.UnitId,
	checkSpecialDetail.HandleStep,
	checkSpecialDetail.CompleteStatus,
	(case when checkSpecialDetail.CompleteStatus =1 then '是' 
				when checkSpecialDetail.CompleteStatus =0 then '否' else '' end) as  CompleteStatusName,
	checkSpecialDetail.LimitedDate,
	checkSpecialDetail.CompletedDate,
	checkSpecialDetail.Suggestions,
	checkSpecialDetail.CheckContent,
	(case when checkSpecialDetail.CheckContent is not null then checkSpecialDetail.CheckContent
	else checkItemSet.CheckItemName end) as CheckItemStr,
	checkSpecialDetail.WorkArea,
	unit.UnitName,
	const.ConstText as HandleStepStr
FROM dbo.Check_CheckSpecialDetail AS checkSpecialDetail
--LEFT JOIN dbo.Check_ProjectCheckItemDetail AS checkItemDetail ON checkItemDetail.CheckItemDetailId=checkSpecialDetail.CheckItem
LEFT JOIN dbo.Check_ProjectCheckItemSet AS checkItemSet ON checkItemSet.CheckItemSetId=checkSpecialDetail.CheckItem
LEFT JOIN dbo.Base_Unit AS unit ON unit.UnitId=checkSpecialDetail.UnitId
LEFT JOIN Sys_Const AS const ON const.ConstValue = checkSpecialDetail.HandleStep and const.GroupId='HandleStep'

GO

ALTER VIEW [dbo].[View_Check_CheckColligationDetail]  AS 
/*综合大检查明细列表视图*/
SELECT checkColligationDetail.CheckColligationDetailId, 
checkColligationDetail.CheckColligationId, 
checkColligationDetail.CheckItem, 
checkColligationDetail.CheckItemType,
checkColligationDetail.Unqualified,
checkColligationDetail.CheckArea,
checkColligationDetail.UnitId,
checkColligationDetail.HandleStep,
checkColligationDetail.CompleteStatus,
(case when checkColligationDetail.CompleteStatus =1 then '是' 
			when checkColligationDetail.CompleteStatus =0 then '否' else '' end) as  CompleteStatusName,
checkColligationDetail.LimitedDate,
checkColligationDetail.CompletedDate,
checkColligationDetail.Suggestions,
checkColligationDetail.CheckContent,
case when checkColligationDetail.CheckContent is not null then checkColligationDetail.CheckContent
else checkItemSet.CheckItemName end as CheckItemStr,
checkColligationDetail.WorkArea,
unit.UnitName,
const.ConstText as HandleStepStr
FROM dbo.Check_CheckColligationDetail AS checkColligationDetail
--LEFT JOIN dbo.Check_ProjectCheckItemDetail AS checkItemDetail ON checkItemDetail.CheckItemDetailId=checkColligationDetail.CheckItem
LEFT JOIN dbo.Check_ProjectCheckItemSet AS checkItemSet ON checkItemSet.CheckItemSetId=checkColligationDetail.CheckItem
LEFT JOIN dbo.Base_Unit AS unit ON unit.UnitId=checkColligationDetail.UnitId
LEFT JOIN Sys_Const AS const ON const.ConstValue = checkColligationDetail.HandleStep and const.GroupId='HandleStep'



GO

ALTER VIEW [dbo].[View_Check_CheckHolidayDetail]  
AS 
/*季节性/节假日检查明细列表视图*/
SELECT checkHolidayDetail.CheckHolidayDetailId, 
	checkHolidayDetail.CheckHolidayId, 
	checkHolidayDetail.CheckItem, 
	checkHolidayDetail.CheckResult,
	checkHolidayDetail.CheckOpinion,
	checkHolidayDetail.CheckStation,
	checkHolidayDetail.HandleResult,
	checkHolidayDetail.CheckContent,
	case when checkHolidayDetail.CheckContent is not null then checkHolidayDetail.CheckContent
	else checkItemSet.CheckItemName end as CheckItemStr
FROM dbo.Check_CheckHolidayDetail AS checkHolidayDetail
--LEFT JOIN dbo.Check_ProjectCheckItemDetail AS checkItemDetail
		-- ON checkItemDetail.CheckItemDetailId=checkHolidayDetail.CheckItem
LEFT JOIN dbo.Check_ProjectCheckItemSet AS checkItemSet ON checkItemSet.CheckItemSetId=checkHolidayDetail.CheckItem

GO

ALTER VIEW [dbo].[View_Check_CheckWorkDetail]  
AS 
/*开工前检查明细列表视图*/
SELECT checkWorkDetail.CheckWorkDetailId, 
	checkWorkDetail.CheckWorkId, 
	checkWorkDetail.CheckItem, 
	checkWorkDetail.CheckResult,
	checkWorkDetail.CheckOpinion,
	checkWorkDetail.CheckStation,
	checkWorkDetail.HandleResult,
	checkWorkDetail.CheckContent,
	case when checkWorkDetail.CheckContent is not null then checkWorkDetail.CheckContent
	else checkItemSet.CheckItemName end as CheckItemStr
FROM dbo.Check_CheckWorkDetail AS checkWorkDetail
--LEFT JOIN dbo.Check_ProjectCheckItemDetail AS checkItemDetail 
--ON checkItemDetail.CheckItemDetailId=checkWorkDetail.CheckItem
LEFT JOIN dbo.Check_ProjectCheckItemSet AS checkItemSet ON checkItemSet.CheckItemSetId=checkWorkDetail.CheckItem

GO

ALTER VIEW [dbo].[View_CheckAnalysis]
AS
/*检查项分析视图*/
SELECT ProjectId,CheckItemType,CheckItem,CheckTime,UnitId,CheckArea
FROM Check_CheckDayDetail AS CheckDayDetail
	LEFT JOIN Check_CheckDay AS CheckDay ON CheckDayDetail.CheckDayId =CheckDay.CheckDayId
	WHERE CheckDay.States = '2'
UNION ALL
SELECT ProjectId,CheckItemType,CheckItem,CheckTime,UnitId,CheckArea
FROM Check_CheckColligationDetail AS CheckColligationDetail
	LEFT JOIN Check_CheckColligation AS CheckColligation ON CheckColligationDetail.CheckColligationId =CheckColligation.CheckColligationId
	WHERE CheckColligation.States = '2'
UNION ALL
SELECT ProjectId,CheckItemType,CheckItem,CheckTime,UnitId,CheckArea
FROM Check_CheckSpecialDetail AS CheckSpecialDetail
	LEFT JOIN Check_CheckSpecial AS CheckSpecial ON CheckSpecialDetail.CheckSpecialId =CheckSpecial.CheckSpecialId
	WHERE CheckSpecial.States = '2'
UNION ALL
SELECT CheckHoliday.ProjectId,ProjectCheckItemSet.CheckType,CheckItem,CheckTime,NULL,NULL  --待优化
FROM Check_CheckHolidayDetail AS CheckHolidayDetail
	LEFT JOIN Check_CheckHoliday AS CheckHoliday ON CheckHolidayDetail.CheckHolidayId =CheckHoliday.CheckHolidayId
	LEFT JOIN Check_ProjectCheckItemDetail AS ProjectCheckItemDetail ON CheckHolidayDetail.CheckItem =ProjectCheckItemDetail.CheckItemDetailId
		LEFT JOIN Check_ProjectCheckItemSet AS ProjectCheckItemSet ON ProjectCheckItemDetail.CheckItemSetId =ProjectCheckItemSet.CheckItemSetId
	WHERE CheckHoliday.States = '2'
UNION ALL
SELECT CheckWork.ProjectId,ProjectCheckItemSet.CheckType,CheckItem,CheckTime,NULL,NULL --待优化
FROM Check_CheckWorkDetail AS CheckWorkDetail
	LEFT JOIN Check_CheckWork AS CheckWork ON CheckWorkDetail.CheckWorkId =CheckWork.CheckWorkId
	LEFT JOIN Check_ProjectCheckItemDetail AS ProjectCheckItemDetail ON CheckWorkDetail.CheckItem =ProjectCheckItemDetail.CheckItemDetailId
		LEFT JOIN Check_ProjectCheckItemSet AS ProjectCheckItemSet ON ProjectCheckItemDetail.CheckItemSetId =ProjectCheckItemSet.CheckItemSetId
	WHERE CheckWork.States = '2'

GO

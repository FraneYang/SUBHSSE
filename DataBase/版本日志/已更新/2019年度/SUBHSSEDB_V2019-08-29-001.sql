ALTER TABLE [dbo].[Check_CheckDayDetail] DROP CONSTRAINT [FK_Check_CheckDayDetail_SitePerson_Person]
GO

ALTER TABLE [dbo].[Check_CheckColligationDetail] DROP CONSTRAINT [FK_Check_CheckColligationDetail_SitePerson_Person]
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
(CASE WHEN checkColligationDetail.CompleteStatus =1 THEN '是' 
			WHEN checkColligationDetail.CompleteStatus =0 THEN '否' ELSE '' END) AS  CompleteStatusName,
checkColligationDetail.LimitedDate,
checkColligationDetail.CompletedDate,
checkColligationDetail.Suggestions,
checkColligationDetail.CheckContent,
CASE WHEN checkColligationDetail.CheckContent IS NOT NULL THEN checkColligationDetail.CheckContent
ELSE checkItemSet.CheckItemName END AS CheckItemStr,
checkColligationDetail.WorkArea,
unit.UnitName,
const.ConstText AS HandleStepStr,
checkColligationDetail.HiddenDangerType,
checkColligationDetail.HiddenDangerLevel,
person.UserName AS PersonName
FROM dbo.Check_CheckColligationDetail AS checkColligationDetail
--LEFT JOIN dbo.Check_ProjectCheckItemDetail AS checkItemDetail ON checkItemDetail.CheckItemDetailId=checkColligationDetail.CheckItem
LEFT JOIN dbo.Check_ProjectCheckItemSet AS checkItemSet ON checkItemSet.CheckItemSetId=checkColligationDetail.CheckItem
LEFT JOIN dbo.Base_Unit AS unit ON unit.UnitId=checkColligationDetail.UnitId
LEFT JOIN dbo.Sys_User AS person ON person.UserId = checkColligationDetail.PersonId
LEFT JOIN Sys_Const AS const ON const.ConstValue = checkColligationDetail.HandleStep AND const.GroupId='HandleStep'

GO


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
	(CASE WHEN checkDayDetail.CompleteStatus =1 THEN '是' 
			WHEN checkDayDetail.CompleteStatus =0 THEN '否' ELSE '' END) AS  CompleteStatusName,
	checkDayDetail.LimitedDate,
	checkDayDetail.CompletedDate,
	checkDayDetail.Suggestions,
	checkDayDetail.CheckContent,
	(CASE WHEN checkDayDetail.CheckContent IS NOT NULL THEN checkDayDetail.CheckContent
	ELSE checkItemSet.CheckItemName END) AS CheckItemStr,
	checkDayDetail.WorkArea,
	unit.UnitName,
	const.ConstText AS HandleStepStr,
	checkDayDetail.HiddenDangerType,
	checkDayDetail.HiddenDangerLevel,
	person.UserName AS PersonName
FROM dbo.Check_CheckDayDetail AS checkDayDetail
--LEFT JOIN dbo.Check_ProjectCheckItemDetail AS checkItemDetail ON checkItemDetail.CheckItemDetailId=checkDayDetail.CheckItem
LEFT JOIN dbo.Check_ProjectCheckItemSet AS checkItemSet ON checkItemSet.CheckItemSetId=checkDayDetail.CheckItem
LEFT JOIN dbo.Base_Unit AS unit ON unit.UnitId=checkDayDetail.UnitId
LEFT JOIN dbo.Sys_User AS person ON person.UserId = checkDayDetail.PersonId
LEFT JOIN Sys_Const AS const ON const.ConstValue = checkDayDetail.HandleStep AND const.GroupId='HandleStep'


GO




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
	checkColligationDetail.WorkArea,unit.UnitName,
	(case when checkColligationDetail.HandleStep ='3'and checkColligationDetail.RectifyNoticeId is not null then (const.ConstText + (select code from Sys_CodeRecords where DataId=checkColligationDetail.RectifyNoticeId))
	 else const.ConstText end) AS HandleStepStr,
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



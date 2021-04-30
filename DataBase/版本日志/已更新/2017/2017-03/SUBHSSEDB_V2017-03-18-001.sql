
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
checkDayDetail.LimitedDate,
checkDayDetail.CompletedDate,
checkDayDetail.Suggestions,
case when checkItemDetail.CheckContent is not null then checkItemDetail.CheckContent
else checkItemSet.CheckItemName end as CheckItemStr,
checkDayDetail.WorkArea,
unit.UnitName,
const.ConstText as HandleStepStr
FROM dbo.Check_CheckDayDetail AS checkDayDetail
LEFT JOIN dbo.Check_ProjectCheckItemDetail AS checkItemDetail ON checkItemDetail.CheckItemDetailId=checkDayDetail.CheckItem
LEFT JOIN dbo.Check_ProjectCheckItemSet AS checkItemSet ON checkItemSet.CheckItemSetId=checkDayDetail.CheckItem
LEFT JOIN dbo.Base_Unit AS unit ON unit.UnitId=checkDayDetail.UnitId
LEFT JOIN Sys_Const AS const ON const.ConstValue = checkDayDetail.HandleStep and const.GroupId='HandleStep'

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
checkSpecialDetail.LimitedDate,
checkSpecialDetail.CompletedDate,
checkSpecialDetail.Suggestions,
case when checkItemDetail.CheckContent is not null then checkItemDetail.CheckContent
else checkItemSet.CheckItemName end as CheckItemStr,
checkSpecialDetail.WorkArea,
unit.UnitName,
const.ConstText as HandleStepStr
FROM dbo.Check_CheckSpecialDetail AS checkSpecialDetail
LEFT JOIN dbo.Check_ProjectCheckItemDetail AS checkItemDetail ON checkItemDetail.CheckItemDetailId=checkSpecialDetail.CheckItem
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
checkColligationDetail.LimitedDate,
checkColligationDetail.CompletedDate,
checkColligationDetail.Suggestions,
case when checkItemDetail.CheckContent is not null then checkItemDetail.CheckContent
else checkItemSet.CheckItemName end as CheckItemStr,
checkColligationDetail.WorkArea,
unit.UnitName,
const.ConstText as HandleStepStr
FROM dbo.Check_CheckColligationDetail AS checkColligationDetail
LEFT JOIN dbo.Check_ProjectCheckItemDetail AS checkItemDetail ON checkItemDetail.CheckItemDetailId=checkColligationDetail.CheckItem
LEFT JOIN dbo.Check_ProjectCheckItemSet AS checkItemSet ON checkItemSet.CheckItemSetId=checkColligationDetail.CheckItem
LEFT JOIN dbo.Base_Unit AS unit ON unit.UnitId=checkColligationDetail.UnitId
LEFT JOIN Sys_Const AS const ON const.ConstValue = checkColligationDetail.HandleStep and const.GroupId='HandleStep'


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
case when checkItemDetail.CheckContent is not null then checkItemDetail.CheckContent
else checkItemSet.CheckItemName end as CheckItemStr
FROM dbo.Check_CheckWorkDetail AS checkWorkDetail
LEFT JOIN dbo.Check_ProjectCheckItemDetail AS checkItemDetail 
ON checkItemDetail.CheckItemDetailId=checkWorkDetail.CheckItem
LEFT JOIN dbo.Check_ProjectCheckItemSet AS checkItemSet ON checkItemSet.CheckItemSetId=checkWorkDetail.CheckItem
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
case when checkItemDetail.CheckContent is not null then checkItemDetail.CheckContent
else checkItemSet.CheckItemName end as CheckItemStr
FROM dbo.Check_CheckHolidayDetail AS checkHolidayDetail
LEFT JOIN dbo.Check_ProjectCheckItemDetail AS checkItemDetail
		 ON checkItemDetail.CheckItemDetailId=checkHolidayDetail.CheckItem
LEFT JOIN dbo.Check_ProjectCheckItemSet AS checkItemSet ON checkItemSet.CheckItemSetId=checkHolidayDetail.CheckItem

GO







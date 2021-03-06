ALTER TABLE Sys_ErrLogInfo ALTER COLUMN ErrMessage NVARCHAR(MAX) NULL
GO
ALTER TABLE Sys_ErrLogInfo ALTER COLUMN ErrUrl NVARCHAR(2000) NULL
GO
ALTER TABLE Sys_ErrLogInfo ALTER COLUMN ErrIP NVARCHAR(500) NULL
GO

ALTER VIEW [dbo].[View_SummaryList]
AS
/*项目现场隐患排查与治理统计表*/
SELECT CheckDayDetail.CheckDayDetailId AS DetailId
	,CheckDay.ProjectId
	,'1' AS CheckType
	,CheckDayDetail.Unqualified
	,CheckDay.CheckTime
	,ISNULL(HiddenDangerType,ItemSet.CheckItemName) AS HiddenDangerType
	,HiddenDangerLevel
	,Unit.UnitName
	,sysUserPerson.UserName AS PersonName --责任人
	,LimitedDate
	,const.ConstText AS HandleStepStr
	,CheckDayDetail.CompletedDate  --复查日期
	,CheckPerson.UserName AS ReCheckPersonName --复查人
	,(CASE WHEN checkDayDetail.CompleteStatus =1 THEN '已整改' 
		WHEN checkDayDetail.CompleteStatus =0 THEN '未整改' ELSE '' END) AS IsRectifyName --复查结果
	,(CASE WHEN checkDayDetail.CompleteStatus =1 THEN '关闭' 
		WHEN checkDayDetail.CompleteStatus =0 THEN '未关闭' ELSE '' END) AS CompleteStatusName
	,CheckDay.CheckPerson AS CheckPersonId
	,CkPerson.UserName AS CheckPersonName
	,CheckDayDetail.Suggestions
FROM  dbo.Check_CheckDayDetail CheckDayDetail
	  LEFT JOIN dbo.Check_CheckDay CheckDay ON CheckDay.CheckDayId = CheckDayDetail.CheckDayId 
	  LEFT JOIN Sys_CodeRecords AS CodeRecords ON CheckDay.CheckDayId=CodeRecords.DataId	
	  LEFT JOIN Base_Unit AS Unit ON Unit.UnitId=CheckDayDetail.UnitId
	  LEFT JOIN Sys_User AS sysUserPerson ON sysUserPerson.UserId=CheckDayDetail.PersonId
	  LEFT JOIN Sys_Const AS const ON const.ConstValue = CheckDayDetail.HandleStep and const.GroupId='HandleStep'
	  LEFT JOIN Check_RectifyNotices AS RectifyNotices ON RectifyNotices.RectifyNoticesId=CheckDayDetail.RectifyNoticeId
	  LEFT JOIN Sys_User AS CheckPerson ON CheckPerson.UserId=RectifyNotices.CheckPerson
	  LEFT JOIN Sys_User AS CkPerson ON CkPerson.UserId=CheckDay.CheckPerson
	  LEFT JOIN Check_ProjectCheckItemSet AS ItemSet ON ItemSet.CheckItemSetId=CheckDayDetail.CheckItem

UNION ALL 
SELECT CheckSpecialDetail.CheckSpecialDetailId AS DetailId 
	,CheckSpecial.ProjectId
	,'2' AS CheckType
	,CheckSpecialDetail.Unqualified
	,CheckSpecial.CheckTime
	,ItemSet.CheckItemName AS HiddenDangerType
	,'' AS HiddenDangerLevel
	,Unit.UnitName
	,'' AS PersonName --责任人
	,LimitedDate
	,const.ConstText AS HandleStepStr
	,CheckSpecialDetail.CompletedDate  --复查日期
	,CheckPerson.UserName AS ReCheckPersonName --复查人
	,(CASE WHEN CheckSpecialDetail.CompleteStatus =1 THEN '已整改' 
	WHEN CheckSpecialDetail.CompleteStatus =0 THEN '未整改' ELSE '' END) AS IsRectifyName --复查结果
	,(CASE WHEN CheckSpecialDetail.CompleteStatus =1 THEN '关闭' 
	WHEN CheckSpecialDetail.CompleteStatus =0 THEN '未关闭' ELSE '' END) AS CompleteStatusName
	,CheckSpecial.CheckPerson AS CheckPersonId
	,CkPerson.UserName AS CheckPersonName
	,CheckSpecialDetail.Suggestions
FROM  dbo.Check_CheckSpecialDetail CheckSpecialDetail
	LEFT JOIN dbo.Check_CheckSpecial CheckSpecial ON CheckSpecial.CheckSpecialId = CheckSpecialDetail.CheckSpecialId 
	LEFT JOIN Sys_CodeRecords AS CodeRecords ON CheckSpecial.CheckSpecialId=CodeRecords.DataId	
	LEFT JOIN Base_Unit AS Unit ON Unit.UnitId=CheckSpecialDetail.UnitId
	LEFT JOIN Sys_Const AS const ON const.ConstValue = CheckSpecialDetail.HandleStep and const.GroupId='HandleStep'
	LEFT JOIN Check_RectifyNotices AS RectifyNotices ON RectifyNotices.RectifyNoticesId=CheckSpecialDetail.RectifyNoticeId
	LEFT JOIN Sys_User AS CheckPerson ON CheckPerson.UserId=RectifyNotices.CheckPerson
	LEFT JOIN Sys_User AS CkPerson ON CkPerson.UserId=CheckSpecial.CheckPerson
	LEFT JOIN Check_ProjectCheckItemSet AS ItemSet ON ItemSet.CheckItemSetId=CheckSpecialDetail.CheckItem

UNION ALL
SELECT CheckColligationDetail.CheckColligationDetailId AS DetailId  
        ,CheckColligation.ProjectId
        ,'3' AS CheckType
		,CheckColligationDetail.Unqualified
	,CheckColligation.CheckTime
	,ISNULL(HiddenDangerType,ItemSet.CheckItemName) AS HiddenDangerType
	,HiddenDangerLevel
	,Unit.UnitName
	,sysUserPerson.UserName AS PersonName --责任人
	,LimitedDate
	,const.ConstText AS HandleStepStr
	,CheckColligationDetail.CompletedDate  --复查日期
	,CheckPerson.UserName AS ReCheckPersonName --复查人
	,(CASE WHEN CheckColligationDetail.CompleteStatus =1 THEN '已整改' 
		WHEN CheckColligationDetail.CompleteStatus =0 THEN '未整改' ELSE '' END) AS IsRectifyName --复查结果
	,(CASE WHEN CheckColligationDetail.CompleteStatus =1 THEN '关闭' 
		WHEN CheckColligationDetail.CompleteStatus =0 THEN '未关闭' ELSE '' END) AS CompleteStatusName
	,CheckColligation.CheckPerson AS CheckPersonId
	,CkPerson.UserName AS CheckPersonName
	,CheckColligationDetail.Suggestions
FROM  dbo.Check_CheckColligationDetail CheckColligationDetail
	  LEFT JOIN dbo.Check_CheckColligation CheckColligation ON CheckColligation.CheckColligationId = CheckColligationDetail.CheckColligationId 
	  LEFT JOIN Sys_CodeRecords AS CodeRecords ON CheckColligation.CheckColligationId=CodeRecords.DataId
	  LEFT JOIN Base_Unit AS Unit ON Unit.UnitId=CheckColligationDetail.UnitId
	  LEFT JOIN Sys_Const AS const ON const.ConstValue = CheckColligationDetail.HandleStep and const.GroupId='HandleStep'
	  LEFT JOIN Sys_User AS sysUserPerson ON sysUserPerson.UserId=CheckColligationDetail.PersonId
	  LEFT JOIN Check_RectifyNotices AS RectifyNotices ON RectifyNotices.RectifyNoticesId=CheckColligationDetail.RectifyNoticeId
	  LEFT JOIN Sys_User AS CheckPerson ON CheckPerson.UserId=RectifyNotices.CheckPerson
	  LEFT JOIN Sys_User AS CkPerson ON CkPerson.UserId=CheckColligation.CheckPerson
	  LEFT JOIN Check_ProjectCheckItemSet AS ItemSet ON ItemSet.CheckItemSetId=CheckColligationDetail.CheckItem

UNION ALL
SELECT CheckWorkDetail.CheckWorkDetailId AS DetailId   
	,CheckWork.ProjectId
	,'4' AS CheckType
	,CheckWorkDetail.CheckResult AS Unqualified
	,CheckWork.CheckTime
	,ItemSet.CheckItemName AS HiddenDangerType
	,'' AS HiddenDangerLevel
	,CheckWork.Area AS UnitName
	,'' AS PersonName
	,'' AS LimitedDate
	,CheckWorkDetail.HandleResult AS HandleStepStr
	,'' AS CompletedDate
	,'' AS ReCheckPersonName
	,'' AS IsRectifyName
	,CheckWorkDetail.CheckStation AS  CompleteStatusName
	,CheckWork.CompileMan AS CheckPersonId
	,CheckPerson.UserName AS CheckPersonName
	,CheckWorkDetail.CheckOpinion AS Suggestions
FROM  dbo.Check_CheckWorkDetail CheckWorkDetail
	  LEFT JOIN dbo.Check_CheckWork CheckWork ON CheckWork.CheckWorkId = CheckWorkDetail.CheckWorkId 
	  LEFT JOIN Sys_CodeRecords AS CodeRecords ON CheckWork.CheckWorkId=CodeRecords.DataId
	  LEFT JOIN Sys_User AS CheckPerson ON CheckPerson.UserId=CheckWork.CompileMan
	  LEFT JOIN Check_ProjectCheckItemSet AS ItemSet ON ItemSet.CheckItemSetId=CheckWorkDetail.CheckItem

UNION ALL
SELECT CheckHolidayDetail.CheckHolidayDetailId AS DetailId   
    ,CheckHoliday.ProjectId
    ,'5' AS CheckType
	,CheckHolidayDetail.CheckResult AS Unqualified
	,CheckHoliday.CheckTime
	,ItemSet.CheckItemName AS HiddenDangerType
	,'' AS HiddenDangerLevel
	,CheckHoliday.Area AS UnitName
	,'' AS PersonName
	,'' AS LimitedDate
	,CheckHolidayDetail.HandleResult AS HandleStepStr
	,'' AS CompletedDate
	,'' AS ReCheckPersonName
	,'' AS IsRectifyName
	,CheckHolidayDetail.CheckStation AS  CompleteStatusName
	,CheckHoliday.CompileMan AS CheckPersonId
	,CheckPerson.UserName AS CheckPersonName
	,CheckHolidayDetail.CheckOpinion AS Suggestions
FROM  dbo.Check_CheckHolidayDetail CheckHolidayDetail
	  LEFT JOIN dbo.Check_CheckHoliday CheckHoliday ON CheckHoliday.CheckHolidayId = CheckHolidayDetail.CheckHolidayId 
	  LEFT JOIN Sys_CodeRecords AS CodeRecords ON CheckHoliday.CheckHolidayId=CodeRecords.DataId
	  LEFT JOIN Sys_User AS CheckPerson ON CheckPerson.UserId=CheckHoliday.CompileMan
	  LEFT JOIN Check_ProjectCheckItemSet AS ItemSet ON ItemSet.CheckItemSetId=CheckHolidayDetail.CheckItem
GO



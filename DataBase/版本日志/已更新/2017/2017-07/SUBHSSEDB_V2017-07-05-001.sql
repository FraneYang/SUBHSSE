ALTER PROCEDURE [dbo].[SpCheckDayStatistic]     
	@ProjectId nvarchar(50),
	@StartTime nvarchar(15)=null,        
	@EndTime nvarchar(15)=null,
	@States char(1)=null,
	@UnitName nvarchar(200)=null,
	@WorkAreaName nvarchar(200)=null           
AS  
/*日常巡检检查*/          
BEGIN
SELECT 	CheckDayDetail.CheckDayDetailId
	,CheckDay.CheckDayId
	,CheckDay.CheckDayId+','+ISNULL(CheckDayDetail.CheckDayDetailId,'') AS NewChcekId
	,CodeRecords.Code AS CheckDayCode
	,ISNULL(Checks.CheckCount,0) AS CheckCount	
	,CheckDayDetail.WorkArea
	,Unit.UnitName
	,CheckDayDetail.CompleteStatus
	,(CASE WHEN CheckDayDetail.CompleteStatus=1 THEN '已完成' ELSE '' END) AS CompleteStatusName
	,CONVERT(varchar(100), CheckDayDetail.LimitedDate, 23) as LimitedDate
	,CheckDayDetail.CompletedDate
	,CheckDay.CheckPerson
	,CONVERT(varchar(100), CheckDay.CheckTime, 23) as CheckTime
	--,CheckDay.CheckTime
	,CheckDayDetail.CheckItemType
	,CheckDayDetail.CheckItem
	,CheckDayDetail.HandleStep
	,CheckDayDetail.Unqualified
	,(CASE WHEN CheckDay.States='0' OR CheckDay.States IS NULL THEN '待['+Users.UserName+']提交' WHEN CheckDay.States='2' THEN '审核/审批完成' ELSE '待['+OperateUser.UserName+']办理' END) AS  FlowOperateName
	,CheckPersonUsers.UserName AS CheckPersonName
from Check_CheckDay AS CheckDay 
LEFT JOIN Sys_CodeRecords AS CodeRecords ON CheckDay.CheckDayId=CodeRecords.DataId
LEFT JOIN Check_CheckDayDetail AS CheckDayDetail on CheckDayDetail.CheckDayId = CheckDay.CheckDayId AND  CheckDayDetail.CheckDayDetailId IS NOT NULL 
--LEFT JOIN ProjectData_WorkArea AS WorkArea on WorkArea.WorkAreaId=CheckDayDetail.CheckArea        
LEFT JOIN Base_Unit AS Unit on Unit.UnitId=CheckDayDetail.UnitId        
LEFT JOIN (SELECT COUNT(*)  AS CheckCount, CheckDayId 
			FROM Check_CheckDayDetail GROUP BY CheckDayId) AS Checks ON Checks.CheckDayId = CheckDay.CheckDayId 
LEFT JOIN Sys_FlowOperate AS FlowOperate ON CheckDay.CheckDayId=FlowOperate.DataId AND FlowOperate.IsClosed <> 1
LEFT JOIN Sys_User AS OperateUser ON FlowOperate.OperaterId=OperateUser.UserId
LEFT JOIN Sys_User AS Users ON CheckDay.CompileMan=Users.UserId
LEFT JOIN Sys_User AS CheckPersonUsers ON CheckDay.CheckPerson=CheckPersonUsers.UserId
WHERE  (@StartTime is null or CheckDay.CheckTime>=@StartTime) 
		and (@EndTime is null or CheckDay.CheckTime <=@EndTime ) 
		and CheckDay.ProjectId=@ProjectId
		and (@States is null or CheckDay.States=@States) 
		and (@UnitName is null or Unit.UnitName like '%'+@UnitName+'%' ) 
		and (@WorkAreaName is null or CheckDayDetail.WorkArea like '%'+@WorkAreaName+'%' ) 
order by CheckDayCode desc
   
END



GO



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
WHERE  (@StartTime is null or CheckDay.CheckTime>=@StartTime) 
		and (@EndTime is null or CheckDay.CheckTime <=@EndTime ) 
		and CheckDay.ProjectId=@ProjectId
		and (@States is null or CheckDay.States=@States) 
		and (@UnitName is null or Unit.UnitName like '%'+@UnitName+'%' ) 
		and (@WorkAreaName is null or CheckDayDetail.WorkArea like '%'+@WorkAreaName+'%' ) 
order by CheckDayCode desc
   
END


GO

ALTER PROCEDURE [dbo].[SpCheckColligationStatistic]     
	@ProjectId nvarchar(50),
	@StartTime nvarchar(15)=null,        
	@EndTime nvarchar(15)=null,
	@States char(1)=null,
	@UnitName nvarchar(200)=null,
	@WorkAreaName nvarchar(200)=null          
AS
/*综合大检查*/      
BEGIN
SELECT 	CheckColligationDetail.CheckColligationDetailId
	,CheckColligation.CheckColligationId
	,CheckColligation.CheckColligationId+','+ISNULL(CheckColligationDetail.CheckColligationDetailId,'') AS NewChcekId
	,CodeRecords.Code AS CheckColligationCode
	,ISNULL(Checks.CheckCount,0) AS CheckCount	
	,CheckColligationDetail.WorkArea
	,Unit.UnitName
	,CheckColligationDetail.CompleteStatus
	,(CASE WHEN CheckColligationDetail.CompleteStatus=1 THEN '已完成' ELSE '' END) AS CompleteStatusName
	,CONVERT(varchar(100), CheckColligationDetail.LimitedDate, 23) as LimitedDate
	,CheckColligationDetail.CompletedDate
	,CheckColligation.CheckPerson
	,user1.UserName as CheckPersonName
	,CONVERT(varchar(100), CheckColligation.CheckTime, 23) as CheckTime
	--,CheckColligation.CheckTime
	,CheckColligationDetail.CheckItemType
	,CheckColligationDetail.CheckItem
	,CheckColligationDetail.HandleStep
	,CheckColligationDetail.Unqualified
	,(CASE WHEN CheckColligation.CheckType ='0' THEN '周检' WHEN CheckColligation.CheckType ='1' THEN '月检' ELSE '其它' END)  AS CheckTypeName
	,(CASE WHEN CheckColligation.States='0' OR CheckColligation.States IS NULL THEN '待['+Users.UserName+']提交' WHEN CheckColligation.States='2' THEN '审核/审批完成' ELSE '待['+OperateUser.UserName+']办理' END) AS  FlowOperateName
from Check_CheckColligation AS CheckColligation 
LEFT JOIN Sys_CodeRecords AS CodeRecords ON CheckColligation.CheckColligationId=CodeRecords.DataId
LEFT JOIN Sys_User AS user1 ON CheckColligation.CheckPerson=user1.UserId
LEFT JOIN Check_CheckColligationDetail  AS CheckColligationDetail 
	on CheckColligationDetail.CheckColligationId = CheckColligation.CheckColligationId AND CheckColligationDetail.CheckColligationDetailId IS NOT NULL   
--LEFT JOIN ProjectData_WorkArea AS WorkArea on WorkArea.WorkAreaId=CheckColligationDetail.CheckArea        
LEFT JOIN Base_Unit AS Unit on Unit.UnitId=CheckColligationDetail.UnitId        
LEFT JOIN (SELECT COUNT(*)  AS CheckCount, CheckColligationId 
			FROM Check_CheckColligationDetail GROUP BY CheckColligationId) AS Checks ON Checks.CheckColligationId = CheckColligation.CheckColligationId 
LEFT JOIN Sys_FlowOperate AS FlowOperate ON CheckColligation.CheckColligationId=FlowOperate.DataId AND FlowOperate.IsClosed <> 1
LEFT JOIN Sys_User AS OperateUser ON FlowOperate.OperaterId=OperateUser.UserId
LEFT JOIN Sys_User AS Users ON CheckColligation.CompileMan=Users.UserId
WHERE  (@StartTime is null or CheckColligation.CheckTime>=@StartTime) 
		and (@EndTime is null or CheckColligation.CheckTime <=@EndTime ) 
		and CheckColligation.ProjectId=@ProjectId
		and (@States is null or CheckColligation.States=@States) 
		and (@UnitName is null or Unit.UnitName like '%'+@UnitName+'%' ) 
		and (@WorkAreaName is null or CheckColligationDetail.WorkArea like '%'+@WorkAreaName+'%' ) 
order by CheckColligationCode desc   
END

GO


ALTER PROCEDURE [dbo].[SpCheckSpecialStatistic]     
	@ProjectId nvarchar(50),
	@StartTime nvarchar(15)=null,        
	@EndTime nvarchar(15)=null,
	@States char(1)=null,
	@UnitName nvarchar(200)=null,
	@WorkAreaName nvarchar(200)=null             
AS      
/*专项检查*/          
BEGIN
SELECT CheckSpecialDetail.CheckSpecialDetailId
	,CheckSpecial.CheckSpecialId
	,CheckSpecial.CheckSpecialId+','+ISNULL(CheckSpecialDetail.CheckSpecialDetailId,'') AS NewChcekId
	,CodeRecords.Code AS CheckSpecialCode
	,ISNULL(Checks.CheckCount,0) AS CheckCount	
	,CheckSpecialDetail.WorkArea
	,Unit.UnitName
	,CheckSpecialDetail.CompleteStatus
	,(CASE WHEN CheckSpecialDetail.CompleteStatus=1 THEN '已完成' ELSE '' END) AS CompleteStatusName
	,CONVERT(varchar(100), CheckSpecialDetail.LimitedDate, 23) as LimitedDate
	,CheckSpecialDetail.CompletedDate
	,CheckSpecial.CheckPerson
	,user1.UserName as CheckPersonName
	,CONVERT(varchar(100), CheckSpecial.CheckTime, 23) as CheckTime
	--,CheckSpecial.CheckTime
	,CheckSpecialDetail.CheckItemType
	,CheckSpecialDetail.CheckItem
	,CheckSpecialDetail.HandleStep
	,CheckSpecialDetail.Unqualified
	,(CASE WHEN CheckSpecial.CheckType ='0' THEN '周检' WHEN CheckSpecial.CheckType ='1' THEN '月检' ELSE '其它' END)  AS CheckTypeName
	,(CASE WHEN CheckSpecial.States='0' OR CheckSpecial.States IS NULL THEN '待['+Users.UserName+']提交' WHEN CheckSpecial.States='2' THEN '审核/审批完成' ELSE '待['+OperateUser.UserName+']办理' END) AS  FlowOperateName
from Check_CheckSpecial AS CheckSpecial 
LEFT JOIN Sys_CodeRecords AS CodeRecords ON CheckSpecial.CheckSpecialId=CodeRecords.DataId
LEFT JOIN Sys_User AS user1 ON CheckSpecial.CheckPerson=user1.UserId
LEFT JOIN Check_CheckSpecialDetail  AS CheckSpecialDetail 
	on CheckSpecialDetail.CheckSpecialId = CheckSpecial.CheckSpecialId  AND  CheckSpecialDetail.CheckSpecialDetailId IS NOT NULL 
--LEFT JOIN ProjectData_WorkArea AS WorkArea on WorkArea.WorkAreaId=CheckSpecialDetail.CheckArea        
LEFT JOIN Base_Unit AS Unit on Unit.UnitId=CheckSpecialDetail.UnitId        
LEFT JOIN (SELECT COUNT(*)  AS CheckCount, CheckSpecialId 
			FROM Check_CheckSpecialDetail GROUP BY CheckSpecialId) AS Checks ON Checks.CheckSpecialId = CheckSpecial.CheckSpecialId 
LEFT JOIN Sys_FlowOperate AS FlowOperate ON CheckSpecial.CheckSpecialId=FlowOperate.DataId AND FlowOperate.IsClosed <> 1
LEFT JOIN Sys_User AS OperateUser ON FlowOperate.OperaterId=OperateUser.UserId
LEFT JOIN Sys_User AS Users ON CheckSpecial.CompileMan=Users.UserId
WHERE  (@StartTime is null or CheckSpecial.CheckTime>=@StartTime) 
		and (@EndTime is null or CheckSpecial.CheckTime <=@EndTime ) 
		and CheckSpecial.ProjectId=@ProjectId
		and (@States is null or CheckSpecial.States=@States) 
		and (@UnitName is null or Unit.UnitName like '%'+@UnitName+'%' ) 
		and (@WorkAreaName is null or CheckSpecialDetail.WorkArea like '%'+@WorkAreaName+'%' ) 
order by CheckSpecialCode desc   
END

GO




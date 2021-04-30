--创建日期视图
ALTER VIEW [dbo].[View_Sys_Log]
as
SELECT
	logs.LogId
	,logs.UserId
	,sysUser.UserName
	,unit.UnitName
	,logs.OperationTime
	,logs.Ip
	,logs.HostName
	,logs.OperationLog
	,logs.ProjectId
	,project.ProjectName
	,logs.LogSource
	,logs.SystemId
	,logs.MenuId
	,logs.OperationName
FROM dbo.Sys_Log as logs
LEFT JOIN Sys_User as sysUser ON sysUser.UserId=logs.UserId
LEFT JOIN Base_Project as project ON project.ProjectId=logs.ProjectId
LEFT JOIN Base_Unit as unit on sysUser.UnitId=unit.UnitId


GO

update Sys_User set Password='B59C67BF196A4758191E42F76670CEBA' where Account='hfnbd'
GO

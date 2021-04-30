--更新安全文件上报目录
update Supervise_SubUnitReport set SupSubUnitReportId='613f688c-c4f8-44f5-821d-1b59ee10c3c5'
,SubUnitReportName='02月份',SubUnitReportCode='20190402'
where SubUnitReportId='0a8ba9d6-2a1e-4954-8c27-52b5de5785b3'
GO

ALTER TABLE Sys_Log ADD UpState CHAR(1) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'上报状态（2-未报；3-已上报）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Log', @level2type=N'COLUMN',@level2name=N'UpState'
GO
UPDATE Sys_Log SET UpState = 3
GO

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
	,logs.UpState
FROM dbo.Sys_Log as logs
LEFT JOIN Sys_User as sysUser ON sysUser.UserId=logs.UserId
LEFT JOIN Base_Project as project ON project.ProjectId=logs.ProjectId
LEFT JOIN Base_Unit as unit on sysUser.UnitId=unit.UnitId
GO
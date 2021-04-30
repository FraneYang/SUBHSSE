--select * from SitePerson_DayReport 
--where projectid='325be27f-78f0-41fa-93d8-eb43b5731b7b' and CompileDate='2020-10-15'
---删除齐翔项目2020-10-15人工时日报
delete from Sys_CodeRecords where DataId='c7c69d7d-9f94-40ee-bcdf-208cd265b19f'
go
delete from Sys_FlowOperate where DataId='c7c69d7d-9f94-40ee-bcdf-208cd265b19f'
go
DELETE FROM SitePerson_DayReportUnitDetail WHERE DayReportDetailId
in (select DayReportDetailId FROM SitePerson_DayReportDetail WHERE DayReportId='c7c69d7d-9f94-40ee-bcdf-208cd265b19f')
go
DELETE FROM SitePerson_DayReportDetail WHERE DayReportId='c7c69d7d-9f94-40ee-bcdf-208cd265b19f'
go
DELETE FROM SitePerson_DayReport WHERE DayReportId='c7c69d7d-9f94-40ee-bcdf-208cd265b19f'
go
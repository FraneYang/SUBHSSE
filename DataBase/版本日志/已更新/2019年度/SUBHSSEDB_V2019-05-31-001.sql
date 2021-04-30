DELETE FROM Sys_FlowOperate WHERE MenuId ='EED8DBEE-83F6-4B5B-8382-AF40EB66B0A9'
	AND DataId NOT IN (SELECT PerfomanceRecordId FROM Perfomance_PerfomanceRecord)
GO
--安全管理机构序号
ALTER TABLE HSSESystem_HSSEManageItem ALTER  COLUMN SortIndex NVARCHAR(50) NULL
GO

--安全主体责任序号
ALTER TABLE HSSESystem_HSSEMainDuty ADD SortIndex NVARCHAR(50) NULL
GO

--职工伤亡事故原因分析平均工时总数改为两位小数
ALTER TABLE Information_AccidentCauseReport ALTER  COLUMN AverageTotalHours decimal(19,2) NULL
GO

 
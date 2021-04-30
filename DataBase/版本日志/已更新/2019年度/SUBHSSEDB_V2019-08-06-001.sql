INSERT dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES  ('618B72BB-4B51-4996-B638-047E7C04D329','一般事故隐患','一般事故隐患',1,'HiddenDangerLevel')
GO
INSERT dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES  ('D4BCCA61-DF7F-4435-88B3-F5B30CF4E4CB','重大事故隐患','重大事故隐患',2,'HiddenDangerLevel')
GO
INSERT dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES  ('96D23309-22BB-47E7-B82F-35B6A429AFA4','其他','其他',3,'HiddenDangerLevel')
GO

UPDATE Check_CheckDayDetail SET HiddenDangerLevel = 2 WHERE HiddenDangerLevel LIKE '%重大%'
GO
UPDATE Check_CheckDayDetail SET HiddenDangerLevel = 1 WHERE HiddenDangerLevel LIKE '%一般%'
GO

UPDATE Check_CheckColligationDetail SET HiddenDangerLevel = 2 WHERE HiddenDangerLevel LIKE '%重大%'
GO
UPDATE Check_CheckColligationDetail SET HiddenDangerLevel = 1 WHERE HiddenDangerLevel LIKE '%一般%'
GO
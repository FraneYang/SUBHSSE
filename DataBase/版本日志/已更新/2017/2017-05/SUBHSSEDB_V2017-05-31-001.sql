ALTER TABLE  Check_CheckHoliday ADD thisUnitId NVARCHAR(50) NULL
GO

UPDATE Check_CheckHoliday SET thisUnitId=A.UnitId FROM Base_Unit A WHERE 
A.IsBuild=1 AND A.IsThisUnit=1
GO

ALTER TABLE  Check_CheckWork ADD thisUnitId NVARCHAR(50) NULL
GO

UPDATE Check_CheckWork SET thisUnitId=A.UnitId FROM Base_Unit A WHERE 
A.IsBuild=1 AND A.IsThisUnit=1
GO
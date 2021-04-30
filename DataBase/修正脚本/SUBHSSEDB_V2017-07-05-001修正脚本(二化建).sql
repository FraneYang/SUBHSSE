
UPDATE HSSESystem_HSSEOrganize SET UnitId='cbb77f48-d9bd-4d50-9254-c3cd2518b9f2'  
WHERE UnitId='993ad100-7aaf-4526-acd8-047d554df761'
GO
UPDATE Information_DrillConductedQuarterlyReport SET UnitId='cbb77f48-d9bd-4d50-9254-c3cd2518b9f2'  
WHERE UnitId='993ad100-7aaf-4526-acd8-047d554df761'
GO
UPDATE Supervise_SuperviseCheckReport SET UnitId='cbb77f48-d9bd-4d50-9254-c3cd2518b9f2'  
WHERE UnitId='993ad100-7aaf-4526-acd8-047d554df761'
GO
UPDATE .SitePerson_PersonInOut SET UnitId='cbb77f48-d9bd-4d50-9254-c3cd2518b9f2'  
WHERE UnitId='993ad100-7aaf-4526-acd8-047d554df761'
GO
UPDATE .Supervise_SubUnitCheckRectify SET UnitId='cbb77f48-d9bd-4d50-9254-c3cd2518b9f2'  
WHERE UnitId='993ad100-7aaf-4526-acd8-047d554df761'
GO
DELETE FROM Base_Unit WHERE UnitId='993ad100-7aaf-4526-acd8-047d554df761'
GO
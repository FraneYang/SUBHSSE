INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('B6BE5FE0-CB84-47FF-A6C3-5AD9E1CCE079','隐患巡检（手机端）','Check/Registration.aspx','PageHeaderFooter',75,'467A0CB9-737D-4451-965E-869EBC3A4BD6','Menu_Project',1,0)
GO

INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('B6BE5FE0-CB84-47FF-A6C3-5AD9E1CCE079','隐患巡检（手机端）','Check/Registration.aspx','PageHeaderFooter',85,'467A0CB9-737D-4451-965E-869EBC3A4BD6','Menu_Project',1,0)
GO

DELETE FROM Sys_MenuProjectB WHERE MenuId='A6B2879F-73CD-490C-8843-1F2F25D6EC61' OR  MenuId='08BBEB1C-00CB-4929-95E1-1FED0E8FDA77'
GO
DELETE FROM Sys_ButtonToMenu WHERE MenuId='A6B2879F-73CD-490C-8843-1F2F25D6EC61' OR  MenuId='08BBEB1C-00CB-4929-95E1-1FED0E8FDA77'
GO
DELETE FROM Sys_MenuProjectA WHERE MenuId='A6B2879F-73CD-490C-8843-1F2F25D6EC61' OR  MenuId='08BBEB1C-00CB-4929-95E1-1FED0E8FDA77'
GO
DELETE FROM Sys_Menu WHERE MenuId='A6B2879F-73CD-490C-8843-1F2F25D6EC61' OR  MenuId='08BBEB1C-00CB-4929-95E1-1FED0E8FDA77'
GO
DELETE FROM Sys_MenuUsed WHERE MenuId='A6B2879F-73CD-490C-8843-1F2F25D6EC61' OR  MenuId='08BBEB1C-00CB-4929-95E1-1FED0E8FDA77'
GO

/**********隐患巡检（手机端）视图*************/
CREATE VIEW View_Inspection_Registration
AS
SELECT Registration.RegistrationId, 
Registration.ProjectId, 
Registration.WorkAreaId, 
Registration.ProblemDescription, 
Registration.ProblemTypes, 
Registration.TakeSteps, 
Registration.ResponsibilityUnitId, 
Registration.ResponsibilityManId, 
Registration.RectificationPeriod, 
Registration.CheckManId, 
Registration.CheckTime, 
Registration.ImageUrl, 
Registration.RectificationImageUrl, 
Registration.RectificationTime, 
Registration.State,
Project.ProjectName,
WorkArea.WorkAreaName,
Unit.UnitName AS ResponsibilityUnitName,
User1.UserName AS ResponsibilityManName,	 
User2.UserName AS CheckManName,
(CASE Registration.State WHEN '0' THEN '未整改' WHEN '1' THEN '已整改' WHEN '3' THEN '已闭环' END ) AS States
FROM dbo.Inspection_Registration AS Registration
LEFT JOIN dbo.Base_Project AS Project ON Project.ProjectId = Registration.ProjectId
LEFT JOIN dbo.ProjectData_WorkArea AS WorkArea ON WorkArea.WorkAreaId = Registration.WorkAreaId 
LEFT JOIN dbo.Base_Unit AS Unit ON Unit.UnitId = Registration.ResponsibilityUnitId
LEFT JOIN dbo.Sys_User AS User1 ON User1.UserId = Registration.ResponsibilityManId   
LEFT JOIN dbo.Sys_User AS User2 ON User2.UserId = Registration.CheckManId
GO

ALTER TABLE SafetyData_SafetyData ALTER COLUMN Score DECIMAL(19,1)
GO
ALTER TABLE SafetyData_SafetyDataCheckItem ALTER COLUMN ShouldScore DECIMAL(19,1)
GO
ALTER TABLE SafetyData_SafetyDataCheckItem ALTER COLUMN RealScore DECIMAL(19,1)
GO
ALTER TABLE SafetyData_SafetyDataPlan ALTER COLUMN Score DECIMAL(19,1)
GO
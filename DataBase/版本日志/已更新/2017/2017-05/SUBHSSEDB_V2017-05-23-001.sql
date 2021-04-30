ALTER TABLE Technique_Environmental ALTER COLUMN Code  NVARCHAR(50) NULL
GO
ALTER TABLE Technique_Environmental ALTER COLUMN ControlMeasures  NVARCHAR(800) NULL
GO
ALTER TABLE Technique_Environmental ALTER COLUMN Remark  NVARCHAR(800) NULL
GO

ALTER TABLE Hazard_EnvironmentalRiskItem ALTER COLUMN Code  NVARCHAR(50) NULL
GO
ALTER TABLE Hazard_EnvironmentalRiskItem ALTER COLUMN ControlMeasures  NVARCHAR(800) NULL
GO
ALTER TABLE Hazard_EnvironmentalRiskItem ALTER COLUMN Remark  NVARCHAR(800) NULL
GO

ALTER TABLE ProjectData_WorkArea ALTER COLUMN WorkAreaName  NVARCHAR(500) NULL
GO
ALTER TABLE ProjectData_WorkArea ALTER COLUMN WorkAreaCode  NVARCHAR(500) NULL
GO

ALTER TABLE ProjectSupervision_ProjectEvaluation ALTER COLUMN EvaluationDef NVARCHAR(300) NULL
GO

ALTER VIEW [dbo].[View_Supervise_SuperviseCheckRectify]  AS 
SELECT DISTINCT
	S.SuperviseCheckRectifyId,
	S.SuperviseCheckRectifyCode,
	S.ProjectId,
	Project.ProjectName,
	S.UnitId,
	U.UnitName,
	S.CheckDate,
	S.IsFromMainUnit,
	CASE S.HandleState WHEN '1' THEN '未签发' 
					   WHEN '2' THEN '未完成'
					   ELSE '已完成' END AS HandleState,
	S.IssueMan,
	S.IssueDate
	,ISNULL(TotalCount.TotalCount,0) AS TotalCount --总项
	,ISNULL(CompleteCount.CompleteCount,0) AS CompleteCount --完成项
	,(ISNULL(TotalCount.TotalCount,0) -ISNULL(CompleteCount.CompleteCount,0)) AS UnCompleteCount
FROM dbo.Supervise_SuperviseCheckRectify AS S
LEFT JOIN Base_Project AS Project ON S.ProjectId = Project.ProjectId
LEFT JOIN dbo.Base_Unit AS U ON U.UnitId = S.UnitId
LEFT JOIN (SELECT COUNT(*) AS TotalCount, SuperviseCheckRectifyId 
		FROM dbo.Supervise_SuperviseCheckRectifyItem GROUP BY SuperviseCheckRectifyId) AS TotalCount 
		ON S.SuperviseCheckRectifyId=TotalCount.SuperviseCheckRectifyId
LEFT JOIN (SELECT COUNT(*) AS CompleteCount, SuperviseCheckRectifyId 
		FROM dbo.Supervise_SuperviseCheckRectifyItem
		WHERE RealEndDate IS NOT NULL
		 GROUP BY SuperviseCheckRectifyId) AS CompleteCount 
		ON S.SuperviseCheckRectifyId=CompleteCount.SuperviseCheckRectifyId

GO
--企业整改单 增加验证人 验证时间
ALTER TABLE Supervise_SuperviseCheckRectifyItem ADD VerifierName NVARCHAR(50) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'验证人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supervise_SuperviseCheckRectifyItem', @level2type=N'COLUMN',@level2name=N'VerifierName'
GO
ALTER TABLE Supervise_SuperviseCheckRectifyItem ADD VerifierDate DATETIME NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'验证时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supervise_SuperviseCheckRectifyItem', @level2type=N'COLUMN',@level2name=N'VerifierDate'
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
	S.HandleState,
	CASE S.HandleState WHEN '1' THEN '未签发' 
					   WHEN '2' THEN '未完成'
					   WHEN '3' THEN '待验收'
					   ELSE '已闭环' END AS HandleStateName,
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


ALTER VIEW [dbo].[View_Supervise_SuperviseCheckRectifyItem]  AS 
SELECT S.SuperviseCheckRectifyItemId, 
	S.SuperviseCheckRectifyId, 
	S.RectifyItemId, 
	S.ConfirmMan,
	S.ConfirmDate,
	S.OrderEndDate,
	S.OrderEndPerson,
	S.RealEndDate,
	RI.HazardSourcePoint,
	RI.RiskAnalysis,
	RI.RiskPrevention,
	R.RectifyName,
	R.RectifyCode,
	S.AttachUrl,
	Substring(S.AttachUrl,charindex('~',S.AttachUrl)+1,LEN(S.AttachUrl)) as  AttachUrlName
	,SuperviseCheckRectify.UnitId
	,SuperviseCheckRectify.CheckDate
	,S.VerifierName
	,S.VerifierDate
FROM dbo.Supervise_SuperviseCheckRectifyItem AS S
LEFT JOIN dbo.Technique_RectifyItem AS RI ON RI.RectifyItemId=S.RectifyItemId
LEFT JOIN dbo.Technique_Rectify AS R ON R.RectifyId=RI.RectifyId
LEFT JOIN dbo.Supervise_SuperviseCheckRectify AS SuperviseCheckRectify ON S.SuperviseCheckRectifyid=SuperviseCheckRectify.SuperviseCheckRectifyId

GO
DELETE FROM Sys_Set WHERE SetId=-101
GO
ALTER TABLE Sys_User ADD PageSize INT NULL
GO

ALTER PROCEDURE [dbo].[SpPersonStatistic]
@ProjectId nvarchar(50),
@StartTime nvarchar(15),
@EndTime nvarchar(15)
AS
/*现场人员考勤统计试图-统计内容待优化*/
BEGIN
SELECT  ROW_NUMBER() OVER(ORDER BY Unit.UnitName,Checking.WorkAreaName,WorkPost.WorkPostName) as Number
	,Unit.UnitName
	,Checking.WorkAreaName
	,WorkPost.WorkPostName
	,COUNT(Checking.CheckingId) AS PersonCount
FROM SitePerson_Checking AS Checking
	LEFT JOIN SitePerson_Person AS Person ON Checking.PersonId =Person.PersonId
	LEFT JOIN Base_Unit AS Unit ON Person.UnitId=Unit.UnitId
	LEFT JOIN Base_WorkPost WorkPost ON WorkPost.WorkPostId=Person.WorkPostId
WHERE Checking.ProjectId= @ProjectId AND Checking.IntoOutTime>=@StartTime and Checking.IntoOutTime < @EndTime
GROUP BY Unit.UnitName,Checking.WorkAreaName,WorkPost.WorkPostName
ORDER BY Unit.UnitName,Checking.WorkAreaName,WorkPost.WorkPostName

END
GO
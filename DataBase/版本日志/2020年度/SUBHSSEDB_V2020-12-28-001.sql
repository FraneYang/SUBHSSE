INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('7A510CD1-3112-495E-964E-0D786D94EDAC','数据统计','','ShapeAlignLeft',140,'0','Menu_Server',0,0)
GO
	INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('DEA788B4-F2F8-4671-B363-63E428649C3B','考试统计','DataStatistics/TestStatistics.aspx','PageHeaderFooter',10,'7A510CD1-3112-495E-964E-0D786D94EDAC','Menu_Server',1,0)
	GO
	INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('ABE9C6E1-83FB-42BE-B1EC-ECF6DD8B9847','安全检查统计','DataStatistics/CheckStatistics.aspx','PageHeaderFooter',20,'7A510CD1-3112-495E-964E-0D786D94EDAC','Menu_Server',1,0)
	GO
	INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('9F6964CB-994E-424E-9D39-F59B1A2F1CCF','隐患整改统计','DataStatistics/RectifyNoticesStatistics.aspx','PageHeaderFooter',30,'7A510CD1-3112-495E-964E-0D786D94EDAC','Menu_Server',1,0)
	GO
	INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('F07B8A6C-D9E0-41E8-9BCB-F965B5C2DFD6','安全会议统计','DataStatistics/MeetStatistics.aspx','PageHeaderFooter',40,'7A510CD1-3112-495E-964E-0D786D94EDAC','Menu_Server',1,0)
	GO

CREATE PROCEDURE [dbo].[SpTestStatisticsStatistic]   
	@CompanyId NVARCHAR(50)=NULL,  
	@ProjectId NVARCHAR(50)=NULL,
	@UnitId NVARCHAR(50)=NULL,
	@TeamGroupId NVARCHAR(50)=NULL,
	@TrainTypeId NVARCHAR(50)=NULL,
	@StartTime NVARCHAR(50)=NULL,        
	@EndTime NVARCHAR(50)=NULL,	
	@PassName NVARCHAR(50)=NULL,
	@IsTest NVARCHAR(50)=NULL,	
	@PersonName NVARCHAR(200)=NULL
AS  
/*考试统计*/          
BEGIN
SELECT NEWID() AS ID 
	,(CASE WHEN person.ProjectId is null THEN person.UnitId ELSE company.UnitId END) AS CompanyId
	,(CASE WHEN person.ProjectId is null THEN unit.UnitName ELSE company.UnitName END) AS CompanyName
	,project.ProjectId
	,project.ProjectName
	,unit.UnitId
	,unit.UnitName
	,team.TeamGroupId
	,team.TeamGroupName
	,person.PersonId
	,person.PersonName
	,trainType.TrainTypeName
	,trainType.TrainTypeId
	,testRecord.TestScores
	,testRecord.TestStartTime
	,(CASE WHEN testRecord.TestStartTime IS NOT NULL 
		THEN (CASE WHEN ISNULL(testRecord.TestScores,0) >= ISNULL((SELECT top 1 PassingScore FROM Sys_TestRule),80) THEN '是' ELSE '否' END)
		ELSE '' END) AS PassName
FROM SitePerson_Person AS person
LEFT JOIN Base_Project AS project on person.ProjectId =project.ProjectId
LEFT JOIN Base_Unit AS company on project.UnitId =company.UnitId
LEFT JOIN Base_Unit AS unit on person.UnitId =unit.UnitId
LEFT JOIN ProjectData_TeamGroup AS team on person.TeamGroupId =team.TeamGroupId
LEFT JOIN Training_TestRecord AS testRecord on person.PersonId =testRecord.TestManId
LEFT JOIN Training_TestPlan AS testPlan on testRecord.TestPlanId =testPlan.TestPlanId
LEFT JOIN Training_Plan AS tplan on testPlan.PlanId =tplan.PlanId
LEFT JOIN Base_TrainType AS trainType on tplan.TrainTypeId =trainType.TrainTypeId
WHERE (project.ProjectState='1' OR project.ProjectState IS NULL)
AND (@StartTime IS NULL OR testRecord.TestStartTime>=@StartTime) 
		AND (@EndTime IS NULL OR testRecord.TestStartTime <=@EndTime ) 
		AND (@CompanyId IS NULL OR (CASE WHEN person.ProjectId is null THEN person.UnitId ELSE company.UnitId END)=@CompanyId) 
		AND (@ProjectId  IS NULL OR person.ProjectId =@ProjectId) 
		AND (@UnitId  IS NULL OR person.UnitId =@UnitId) 
		AND (@TeamGroupId  IS NULL OR person.TeamGroupId =@TeamGroupId) 
		AND (@TrainTypeId  IS NULL OR trainType.TrainTypeId =@TrainTypeId) 
		AND (@PassName  IS NULL OR (CASE WHEN testRecord.TestStartTime IS NOT NULL 
		THEN (CASE WHEN ISNULL(testRecord.TestScores,0) >= ISNULL((SELECT top 1 PassingScore FROM Sys_TestRule),80) THEN '1' ELSE '0' END)
		ELSE '' END)=@PassName) 
		AND (@IsTest IS NULL OR ((@IsTest=1 AND testRecord.TestStartTime IS NOT NULL) OR (@IsTest=0 AND testRecord.TestStartTime IS NULL))) 
		AND (@PersonName IS NULL OR person.PersonName LIKE '%'+@PersonName+'%' ) 
ORDER BY CompanyName,ProjectName,UnitName,TeamGroupName,person.PersonName
   
END
GO



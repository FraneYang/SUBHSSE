INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('FBB09DE4-B94C-4850-8597-63B27E19916A','ÅàÑµ¿¼ÊÔÍ³¼Æ','DataStatistics/TrainingTestStatistics.aspx','PageHeaderFooter',3,'7A510CD1-3112-495E-964E-0D786D94EDAC','Menu_Server',1,0)
GO	

CREATE PROCEDURE [dbo].[SpTrainingTestStatistics]   
	@CompanyId NVARCHAR(50)=NULL,  
	@ProjectId NVARCHAR(50)=NULL,
	@UnitId NVARCHAR(50)=NULL,
	@StartTime NVARCHAR(50)=NULL,        
	@EndTime NVARCHAR(50)=NULL,	
	@IsProject NVARCHAR(50)=NULL,
	@type NVARCHAR(50)=NULL,
	@thisunitId NVARCHAR(50)=NULL
AS  
/*ÅàÑµ¿¼ÊÔÍ³¼Æ*/          
BEGIN
SELECT NEWID() AS ID 
	,company.UnitId AS CompanyId
	,company.UnitName as CompanyName
	,project.ProjectId
	,project.ProjectName
	,person.UnitId
	,unit.UnitName
	,trainType.TrainTypeName
	,trainType.TrainTypeId
	,COUNT(DISTINCT testRecord.TestManId) AS PersonCount
FROM Training_TestRecord AS testRecord
LEFT JOIN SitePerson_Person AS person on person.PersonId =testRecord.TestManId
LEFT JOIN Base_Project AS project on person.ProjectId =project.ProjectId
LEFT JOIN Base_Unit AS company on project.UnitId =company.UnitId
LEFT JOIN Base_Unit AS unit on person.UnitId =unit.UnitId
LEFT JOIN Training_TestPlan AS testPlan on testRecord.TestPlanId =testPlan.TestPlanId
LEFT JOIN Base_TrainType AS trainType on testPlan.TrainTypeId =trainType.TrainTypeId
WHERE (project.ProjectState='1' OR project.ProjectState IS NULL)
AND (@StartTime IS NULL OR testRecord.TestStartTime>=@StartTime) 
AND (@EndTime IS NULL OR testRecord.TestStartTime <=@EndTime ) 
AND (@CompanyId IS NULL OR project.UnitId=@CompanyId) 
AND (@ProjectId  IS NULL OR person.ProjectId =@ProjectId) 
AND (@UnitId  IS NULL OR person.UnitId =@UnitId) 	
AND (@IsProject IS NULL OR (@IsProject ='0' AND testRecord.ProjectId IS NULL) OR (@IsProject ='1' AND testRecord.ProjectId IS NOT NULL) ) 
AND ((@type='1' AND company.UnitId=@thisunitId ) OR (@type='2' AND company.UnitId !=@thisunitId) OR @type='0' OR @type IS NULL)
GROUP BY company.UnitId,company.UnitName,project.ProjectId,project.ProjectName
,person.UnitId,unit.UnitName,TrainTypeName,trainType.TrainTypeId
   
END
GO

UPDATE Training_TestTraining SET IsEndLever =0 
WHERE (SELECT COUNT(*) FROM Training_TestTraining AS B WHERE B.SupTrainingId=Training_TestTraining.TrainingId) > 0
GO
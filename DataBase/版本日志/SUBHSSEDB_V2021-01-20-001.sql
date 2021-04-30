CREATE TABLE [dbo].[Training_TaskItemSchedule](
	[TaskItemScheduleId] [nvarchar](50) NOT NULL,
	[TaskItemId] [nvarchar](50) NULL,
	[TaskId] [nvarchar](50) NULL,
	[PlanId] [nvarchar](50) NULL,
	[PersonId] [nvarchar](50) NULL,
	[StartTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
 CONSTRAINT [PK_Training_TaskItemSchedule] PRIMARY KEY CLUSTERED 
(
	[TaskItemScheduleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Training_TaskItemSchedule]  WITH CHECK ADD  CONSTRAINT [FK_Training_TaskItemSchedule_SitePerson_Person] FOREIGN KEY([PersonId])
REFERENCES [dbo].[SitePerson_Person] ([PersonId])
GO

ALTER TABLE [dbo].[Training_TaskItemSchedule] CHECK CONSTRAINT [FK_Training_TaskItemSchedule_SitePerson_Person]
GO

ALTER TABLE [dbo].[Training_TaskItemSchedule]  WITH CHECK ADD  CONSTRAINT [FK_Training_TaskItemSchedule_Training_Plan] FOREIGN KEY([PlanId])
REFERENCES [dbo].[Training_Plan] ([PlanId])
GO

ALTER TABLE [dbo].[Training_TaskItemSchedule] CHECK CONSTRAINT [FK_Training_TaskItemSchedule_Training_Plan]
GO

ALTER TABLE [dbo].[Training_TaskItemSchedule]  WITH CHECK ADD  CONSTRAINT [FK_Training_TaskItemSchedule_Training_Task] FOREIGN KEY([TaskId])
REFERENCES [dbo].[Training_Task] ([TaskId])
GO

ALTER TABLE [dbo].[Training_TaskItemSchedule] CHECK CONSTRAINT [FK_Training_TaskItemSchedule_Training_Task]
GO

ALTER TABLE [dbo].[Training_TaskItemSchedule]  WITH CHECK ADD  CONSTRAINT [FK_Training_TaskItemSchedule_Training_TaskItem] FOREIGN KEY([TaskItemId])
REFERENCES [dbo].[Training_TaskItem] ([TaskItemId])
GO

ALTER TABLE [dbo].[Training_TaskItemSchedule] CHECK CONSTRAINT [FK_Training_TaskItemSchedule_Training_TaskItem]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'培训学习时间ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TaskItemSchedule', @level2type=N'COLUMN',@level2name=N'TaskItemScheduleId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'培训明细ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TaskItemSchedule', @level2type=N'COLUMN',@level2name=N'TaskItemId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'培训任务ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TaskItemSchedule', @level2type=N'COLUMN',@level2name=N'TaskId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'培训计划ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TaskItemSchedule', @level2type=N'COLUMN',@level2name=N'PlanId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'培训人员ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TaskItemSchedule', @level2type=N'COLUMN',@level2name=N'PersonId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'开始时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TaskItemSchedule', @level2type=N'COLUMN',@level2name=N'StartTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'结束时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TaskItemSchedule', @level2type=N'COLUMN',@level2name=N'EndTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'培训学习时间表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TaskItemSchedule'
GO

CREATE PROCEDURE [dbo].[SpTrainingTaskStatistic]   
	@CompanyId NVARCHAR(50)=NULL,  
	@ProjectId NVARCHAR(50)=NULL,
	@UnitId NVARCHAR(50)=NULL,
	@TeamGroupId NVARCHAR(50)=NULL,
	@TrainTypeId NVARCHAR(50)=NULL,
	@StartTime NVARCHAR(50)=NULL,        
	@EndTime NVARCHAR(50)=NULL,	
	@States NVARCHAR(50)=NULL,	
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
	,tplan.PlanName
	,tplan.TeachMan
	,Task.TaskDate
	,(CASE WHEN Task.States='1'THEN '已响应' WHEN Task.States='2'THEN '已完成' ELSE '未响应'END) AS StatesName
	,(SELECT CONVERT(nvarchar, ISNULL(SUM(ABS(ISNULL(DATEDIFF(SECOND,StartTime,EndTime),0))),0)/60)+'分'
			+CONVERT(nvarchar,ISNULL(SUM(ABS(ISNULL(DATEDIFF(SECOND,StartTime,EndTime),0))),0)%60)+'秒'
		FROM Training_TaskItemSchedule A WHERE A.TaskId=Task.TaskID) AS ScheduleTime
FROM SitePerson_Person AS person
LEFT JOIN Base_Project AS project on person.ProjectId =project.ProjectId
LEFT JOIN Base_Unit AS company on project.UnitId =company.UnitId
LEFT JOIN Base_Unit AS unit on person.UnitId =unit.UnitId
LEFT JOIN ProjectData_TeamGroup AS team on person.TeamGroupId =team.TeamGroupId
LEFT JOIN Training_Task AS Task on person.PersonId =Task.TaskId
LEFT JOIN Training_Plan AS tplan on Task.PlanId =tplan.PlanId
LEFT JOIN Base_TrainType AS trainType on tplan.TrainTypeId =trainType.TrainTypeId
WHERE (project.ProjectState='1' OR project.ProjectState IS NULL)
AND (@StartTime IS NULL OR Task.TaskDate>=@StartTime) 
		AND (@EndTime IS NULL OR Task.TaskDate <=@EndTime ) 
		AND (@CompanyId IS NULL OR (CASE WHEN person.ProjectId is null THEN person.UnitId ELSE company.UnitId END)=@CompanyId) 
		AND (@ProjectId  IS NULL OR person.ProjectId =@ProjectId) 
		AND (@UnitId  IS NULL OR person.UnitId =@UnitId) 
		AND (@TeamGroupId  IS NULL OR person.TeamGroupId =@TeamGroupId) 
		AND (@TrainTypeId  IS NULL OR trainType.TrainTypeId =@TrainTypeId) 
		AND (@States IS NULL OR Task.States=@States) 
		AND (@PersonName IS NULL OR person.PersonName LIKE '%'+@PersonName+'%' ) 
ORDER BY CompanyName,ProjectName,UnitName,TeamGroupName,person.PersonName
   
END

GO

INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('657F95F5-D6E5-4195-8722-E22F7EA52447','培训统计','DataStatistics/TrainingTaskStatistics.aspx','PageHeaderFooter',5,'7A510CD1-3112-495E-964E-0D786D94EDAC','Menu_Server',1,0)
GO
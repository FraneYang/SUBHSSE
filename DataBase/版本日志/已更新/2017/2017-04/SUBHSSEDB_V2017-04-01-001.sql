UPDATE Sys_MenuProjectA SET MenuName='环境因素识别与评价' WHERE MenuId='762F0BF9-471B-4115-B35E-03A26C573877'
GO
UPDATE Sys_MenuProjectB SET MenuName='环境因素识别与评价' WHERE MenuId='762F0BF9-471B-4115-B35E-03A26C573877'
GO
UPDATE Sys_MenuProjectA SET SuperMenu='467A0CB9-737D-4451-965E-869EBC3A4BD6',SortIndex=73 WHERE MenuId='A6B2879F-73CD-490C-8843-1F2F25D6EC61'
GO
UPDATE Sys_MenuProjectA SET SuperMenu='467A0CB9-737D-4451-965E-869EBC3A4BD6',SortIndex=75 WHERE MenuId='08BBEB1C-00CB-4929-95E1-1FED0E8FDA77'
GO
UPDATE Sys_MenuProjectB SET SuperMenu='467A0CB9-737D-4451-965E-869EBC3A4BD6',SortIndex=73 WHERE MenuId='A6B2879F-73CD-490C-8843-1F2F25D6EC61'
GO
UPDATE Sys_MenuProjectB SET SuperMenu='467A0CB9-737D-4451-965E-869EBC3A4BD6',SortIndex=75 WHERE MenuId='08BBEB1C-00CB-4929-95E1-1FED0E8FDA77'
GO

ALTER PROCEDURE [dbo].[SpCheckColligationStatistic]     
	@ProjectId nvarchar(50),
	@StartTime nvarchar(15)=null,        
	@EndTime nvarchar(15)=null,
	@States char(1)=null,
	@UnitName nvarchar(200)=null,
	@WorkAreaName nvarchar(200)=null          
AS
/*综合大检查*/      
BEGIN
SELECT 	CheckColligationDetail.CheckColligationDetailId
	,CheckColligation.CheckColligationId
	,CheckColligation.CheckColligationId+','+ISNULL(CheckColligationDetail.CheckColligationDetailId,'') AS NewChcekId
	,CodeRecords.Code AS CheckColligationCode
	,Checks.CheckCount
	,CheckColligationDetail.WorkArea
	,Unit.UnitName
	,CheckColligationDetail.CompleteStatus
	,CONVERT(varchar(100), CheckColligationDetail.LimitedDate, 23) as LimitedDate
	,CheckColligationDetail.CompletedDate
	,CheckColligation.CheckPerson
	,user1.UserName as CheckPersonName
	,CONVERT(varchar(100), CheckColligation.CheckTime, 23) as CheckTime
	--,CheckColligation.CheckTime
	,CheckColligationDetail.CheckItemType
	,CheckColligationDetail.CheckItem
	,CheckColligationDetail.HandleStep
	,CheckColligationDetail.Unqualified
	,(CASE WHEN CheckColligation.CheckType ='0' THEN '周检' WHEN CheckColligation.CheckType ='1' THEN '月检' ELSE '其它' END)  AS CheckTypeName
	,(CASE WHEN CheckColligation.States='0' OR CheckColligation.States IS NULL THEN '待['+Users.UserName+']提交' WHEN CheckColligation.States='2' THEN '审核/审批完成' ELSE '待['+OperateUser.UserName+']办理' END) AS  FlowOperateName
from Check_CheckColligation AS CheckColligation 
LEFT JOIN Sys_CodeRecords AS CodeRecords ON CheckColligation.CheckColligationId=CodeRecords.DataId
LEFT JOIN Sys_User AS user1 ON CheckColligation.CheckPerson=user1.UserId
LEFT JOIN Check_CheckColligationDetail  AS CheckColligationDetail on CheckColligationDetail.CheckColligationId = CheckColligation.CheckColligationId    
--LEFT JOIN ProjectData_WorkArea AS WorkArea on WorkArea.WorkAreaId=CheckColligationDetail.CheckArea        
LEFT JOIN Base_Unit AS Unit on Unit.UnitId=CheckColligationDetail.UnitId        
LEFT JOIN (SELECT COUNT(*)  AS CheckCount, CheckColligationId 
			FROM Check_CheckColligationDetail GROUP BY CheckColligationId) AS Checks ON Checks.CheckColligationId = CheckColligation.CheckColligationId 
LEFT JOIN Sys_FlowOperate AS FlowOperate ON CheckColligation.CheckColligationId=FlowOperate.DataId AND FlowOperate.IsClosed <> 1
LEFT JOIN Sys_User AS OperateUser ON FlowOperate.OperaterId=OperateUser.UserId
LEFT JOIN Sys_User AS Users ON CheckColligation.CompileMan=Users.UserId
WHERE  (@StartTime is null or CheckColligation.CheckTime>=@StartTime) 
		and (@EndTime is null or CheckColligation.CheckTime <=@EndTime ) 
		and CheckColligation.ProjectId=@ProjectId
		and (@States is null or CheckColligation.States=@States) 
		and (@UnitName is null or Unit.UnitName like '%'+@UnitName+'%' ) 
		and (@WorkAreaName is null or CheckColligationDetail.WorkArea like '%'+@WorkAreaName+'%' ) 
order by CheckColligationCode desc   
END
GO

ALTER PROCEDURE [dbo].[SpCheckDayStatistic]     
	@ProjectId nvarchar(50),
	@StartTime nvarchar(15)=null,        
	@EndTime nvarchar(15)=null,
	@States char(1)=null,
	@UnitName nvarchar(200)=null,
	@WorkAreaName nvarchar(200)=null           
AS  
/*日常巡检检查*/          
BEGIN
SELECT 	CheckDayDetail.CheckDayDetailId
	,CheckDay.CheckDayId
	,CheckDay.CheckDayId+','+ISNULL(CheckDayDetail.CheckDayDetailId,'') AS NewChcekId
	,CodeRecords.Code AS CheckDayCode
	,Checks.CheckCount
	,CheckDayDetail.WorkArea
	,Unit.UnitName
	,CheckDayDetail.CompleteStatus
	,CONVERT(varchar(100), CheckDayDetail.LimitedDate, 23) as LimitedDate
	,CheckDayDetail.CompletedDate
	,CheckDay.CheckPerson
	,CheckUser.UserName AS CheckPersonName
	,CONVERT(varchar(100), CheckDay.CheckTime, 23) as CheckTime
	--,CheckDay.CheckTime
	,CheckDayDetail.CheckItemType
	,CheckDayDetail.CheckItem
	,CheckDayDetail.HandleStep
	,CheckDayDetail.Unqualified
	,(CASE WHEN CheckDay.States='0' OR CheckDay.States IS NULL THEN '待['+Users.UserName+']提交' WHEN CheckDay.States='2' THEN '审核/审批完成' ELSE '待['+OperateUser.UserName+']办理' END) AS  FlowOperateName
from Check_CheckDay AS CheckDay 
LEFT JOIN Sys_CodeRecords AS CodeRecords ON CheckDay.CheckDayId=CodeRecords.DataId
LEFT JOIN Check_CheckDayDetail  AS CheckDayDetail on CheckDayDetail.CheckDayId = CheckDay.CheckDayId    
--LEFT JOIN ProjectData_WorkArea AS WorkArea on WorkArea.WorkAreaId=CheckDayDetail.CheckArea        
LEFT JOIN Base_Unit AS Unit on Unit.UnitId=CheckDayDetail.UnitId       
LEFT JOIN (SELECT COUNT(*)  AS CheckCount, CheckDayId 
			FROM Check_CheckDayDetail GROUP BY CheckDayId) AS Checks ON Checks.CheckDayId = CheckDay.CheckDayId 
LEFT JOIN Sys_FlowOperate AS FlowOperate ON CheckDay.CheckDayId=FlowOperate.DataId AND FlowOperate.IsClosed <> 1
LEFT JOIN Sys_User AS OperateUser ON FlowOperate.OperaterId=OperateUser.UserId
LEFT JOIN Sys_User AS Users ON CheckDay.CompileMan=Users.UserId
LEFT JOIN Sys_User AS CheckUser on CheckDay.CheckPerson=CheckUser.UserId 
WHERE  (@StartTime is null or CheckDay.CheckTime>=@StartTime) 
		and (@EndTime is null or CheckDay.CheckTime <=@EndTime ) 
		and CheckDay.ProjectId=@ProjectId
		and (@States is null or CheckDay.States=@States) 
		and (@UnitName is null or Unit.UnitName like '%'+@UnitName+'%' ) 
		and (@WorkAreaName is null or CheckDayDetail.WorkArea like '%'+@WorkAreaName+'%' ) 
order by CheckDayCode desc
   
END

GO

ALTER PROCEDURE [dbo].[SpCheckSpecialStatistic]     
	@ProjectId nvarchar(50),
	@StartTime nvarchar(15)=null,        
	@EndTime nvarchar(15)=null,
	@States char(1)=null,
	@UnitName nvarchar(200)=null,
	@WorkAreaName nvarchar(200)=null             
AS      
/*专项检查*/          
BEGIN
SELECT CheckSpecialDetail.CheckSpecialDetailId
	,CheckSpecial.CheckSpecialId
	,CheckSpecial.CheckSpecialId+','+ISNULL(CheckSpecialDetail.CheckSpecialDetailId,'') AS NewChcekId
	,CodeRecords.Code AS CheckSpecialCode
	,Checks.CheckCount
	,CheckSpecialDetail.WorkArea
	,Unit.UnitName
	,CheckSpecialDetail.CompleteStatus
	,CONVERT(varchar(100), CheckSpecialDetail.LimitedDate, 23) as LimitedDate
	,CheckSpecialDetail.CompletedDate
	,CheckSpecial.CheckPerson	
	,user1.UserName as CheckPersonName
	,CONVERT(varchar(100), CheckSpecial.CheckTime, 23) as CheckTime
	--,CheckSpecial.CheckTime
	,CheckSpecialDetail.CheckItemType
	,CheckSpecialDetail.CheckItem
	,CheckSpecialDetail.HandleStep
	,CheckSpecialDetail.Unqualified
	,(CASE WHEN CheckSpecial.CheckType ='0' THEN '周检' WHEN CheckSpecial.CheckType ='1' THEN '月检' ELSE '其它' END)  AS CheckTypeName
	,(CASE WHEN CheckSpecial.States='0' OR CheckSpecial.States IS NULL THEN '待['+Users.UserName+']提交' WHEN CheckSpecial.States='2' THEN '审核/审批完成' ELSE '待['+OperateUser.UserName+']办理' END) AS  FlowOperateName
from Check_CheckSpecial AS CheckSpecial 
LEFT JOIN Sys_CodeRecords AS CodeRecords ON CheckSpecial.CheckSpecialId=CodeRecords.DataId
LEFT JOIN Sys_User AS user1 ON CheckSpecial.CheckPerson=user1.UserId
LEFT JOIN Check_CheckSpecialDetail  AS CheckSpecialDetail on CheckSpecialDetail.CheckSpecialId = CheckSpecial.CheckSpecialId    
--LEFT JOIN ProjectData_WorkArea AS WorkArea on WorkArea.WorkAreaId=CheckSpecialDetail.CheckArea        
LEFT JOIN Base_Unit AS Unit on Unit.UnitId=CheckSpecialDetail.UnitId        
LEFT JOIN (SELECT COUNT(*)  AS CheckCount, CheckSpecialId 
			FROM Check_CheckSpecialDetail GROUP BY CheckSpecialId) AS Checks ON Checks.CheckSpecialId = CheckSpecial.CheckSpecialId 
LEFT JOIN Sys_FlowOperate AS FlowOperate ON CheckSpecial.CheckSpecialId=FlowOperate.DataId AND FlowOperate.IsClosed <> 1
LEFT JOIN Sys_User AS OperateUser ON FlowOperate.OperaterId=OperateUser.UserId
LEFT JOIN Sys_User AS Users ON CheckSpecial.CompileMan=Users.UserId
WHERE  (@StartTime is null or CheckSpecial.CheckTime>=@StartTime) 
		and (@EndTime is null or CheckSpecial.CheckTime <=@EndTime ) 
		and CheckSpecial.ProjectId=@ProjectId
		and (@States is null or CheckSpecial.States=@States) 
		and (@UnitName is null or Unit.UnitName like '%'+@UnitName+'%' ) 
		and (@WorkAreaName is null or CheckSpecialDetail.WorkArea like '%'+@WorkAreaName+'%' ) 
order by CheckSpecialCode desc   
END
GO

alter table dbo.Accident_AccidentHandle add DeathPersonNum int null
go
alter table dbo.Accident_AccidentHandle add InjuriesPersonNum int null
go
alter table dbo.Accident_AccidentHandle add MinorInjuriesPersonNum int null
go
alter table dbo.Accident_AccidentHandle add WorkHoursLoss decimal(9,2) null
GO
delete from dbo.Accident_NoFourLetoff
go
delete from dbo.Accident_AccidentHandle
GO
alter table dbo.Accident_AccidentHandle alter column MoneyLoss decimal(9,2) null
GO

alter table dbo.Manager_Month_AccidentDesciptionC alter column MonthDataNum decimal(9,2) null
go
alter table dbo.Manager_Month_AccidentDesciptionC alter column YearDataNum decimal(9,2) null
GO

ALTER VIEW [dbo].[View_NewDynamic] 
AS
SELECT PersonQuality.PersonQualityId AS Id
	,'特岗人员资质' AS Type, ( '[' + ISNULL(Person.CardNo,'') +']'+ Person.PersonName +'已过期，项目：'+ Project.ProjectName) AS Name
	,PersonQuality.LimitDate AS Date
	,'~/QualityAudit/PersonQualityEdit.aspx?PersonId={0}' AS Url
	,Project.ProjectId 
FROM QualityAudit_PersonQuality AS PersonQuality
	LEFT JOIN SitePerson_Person AS Person ON Person.PersonId = PersonQuality.PersonId
	LEFT JOIN Base_Project AS Project ON Person.ProjectId =Project.ProjectId
WHERE PersonQuality.LimitDate<=GETDATE() 
AND (GETDATE()< Person.OutTime OR Person.OutTime IS NULL)

UNION
SELECT EquipmentQuality.EquipmentQualityId
	,'特种设备资质', EquipmentQuality.EquipmentQualityName+'已过期，项目：'+ Project.ProjectName
	,EquipmentQuality.LimitDate
	,'~/QualityAudit/EquipmentQualityEdit.aspx?EquipmentQualityId={0}' AS Url 
	,Project.ProjectId
FROM QualityAudit_EquipmentQuality AS EquipmentQuality 
	LEFT JOIN Base_SpecialEquipment AS SpecialEquipment ON SpecialEquipment.SpecialEquipmentId = EquipmentQuality.SpecialEquipmentId
	LEFT JOIN Base_Project AS Project ON EquipmentQuality.ProjectId =Project.ProjectId
WHERE EquipmentQuality.LimitDate<=GETDATE() 
	AND (GETDATE()< EquipmentQuality.OutDate OR EquipmentQuality.OutDate IS NULL)

UNION
SELECT CarManager.CarManagerId
	,'现场车辆管理', CarName+'年检已过期，项目：'+ Project.ProjectName
	,CarManager.LastYearCheckDate
	,'~/Administrative/CarManagerView.aspx?CarManagerId={0}' AS Url 
	,Project.ProjectId
FROM Administrative_CarManager AS CarManager 
	LEFT JOIN Base_Project AS Project ON CarManager.ProjectId =Project.ProjectId
WHERE CarManager.LastYearCheckDate<=GETDATE() 

UNION
SELECT CarManager.CarManagerId
	,'现场车辆管理', CarName+'保险已过期，项目：'+ Project.ProjectName
	,CarManager.InsuranceDate
	,'~/Administrative/CarManagerView.aspx?CarManagerId={0}' AS Url 
	,Project.ProjectId
FROM Administrative_CarManager AS CarManager 
	LEFT JOIN Base_Project AS Project ON CarManager.ProjectId =Project.ProjectId
WHERE CarManager.InsuranceDate<=GETDATE() 

UNION
SELECT DriverManager.DriverManagerId
	,'驾驶员管理', DriverName+'年检已过期，项目：'+ Project.ProjectName
	,DriverManager.CheckDate
	,'~/Administrative/DriverManagerView.aspx?DriverManagerId={0}' AS Url 
	,Project.ProjectId
FROM Administrative_DriverManager AS DriverManager 
	LEFT JOIN Base_Project AS Project ON DriverManager.ProjectId =Project.ProjectId
WHERE DriverManager.CheckDate<=GETDATE()

UNION
SELECT LicenseManager.LicenseManagerId
	,'作业许可证', LicenseManagerCode+'已过期，项目：'+ Project.ProjectName
	,LicenseManager.EndDate
	,'~/License/LicenseManagerView.aspx?LicenseManagerId={0}' AS Url 
	,Project.ProjectId
FROM License_LicenseManager AS LicenseManager 
	LEFT JOIN Base_Project AS Project ON LicenseManager.ProjectId =Project.ProjectId
WHERE LicenseManager.EndDate<=GETDATE() AND  DATEADD(DAY,1,LicenseManager.EndDate)>=GETDATE()

UNION
SELECT PunishNotice.PunishNoticeId
	,'处罚通知单', PunishNoticeCode+'未响应，项目：'+ Project.ProjectName
	,PunishNotice.PunishNoticeDate
	,'~/Check/PunishNoticeEdit.aspx?PunishNoticeId={0}' AS Url 
	,Project.ProjectId
FROM Check_PunishNotice AS PunishNotice 
	LEFT JOIN Base_Project AS Project ON PunishNotice.ProjectId =Project.ProjectId
	LEFT JOIN AttachFile AS AttachFile ON PunishNotice.PunishNoticeId =AttachFile.ToKeyId
WHERE AttachFile.ToKeyId IS NULL AND PunishNotice.States='2'

UNION
SELECT item.HazardListId
	,'危害源辩识评价', hList.HazardCode+'未响应，项目：'+ Project.ProjectName
	,hl.CompileDate
	,'~/Hazard/Response.aspx?HazardListId={0}' AS Url 
	,Project.ProjectId
FROM Hazard_HazardSelectedItem AS item 
	left join dbo.Hazard_HazardList hl on item.HazardListId=hl.HazardListId
	left join dbo.Technique_HazardList hList on item.HazardId=hList.HazardId
	LEFT JOIN Base_Project AS Project ON hl.ProjectId =Project.ProjectId
WHERE item.IsResponse = 0 and dateadd(wk,item.PromptTime,hl.CompileDate)<=GETDATE()
GO

ALTER TABLE Check_CheckColligation ALTER COLUMN PartInPersons NVARCHAR(2000)
GO
ALTER TABLE Check_CheckColligation ADD PartInPersonIds NVARCHAR(2000)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'检查组成员ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckColligation', @level2type=N'COLUMN',@level2name=N'PartInPersonIds'
GO

ALTER TABLE Check_CheckSpecial ALTER COLUMN PartInPersons NVARCHAR(2000)
GO
ALTER TABLE Check_CheckSpecial ADD PartInPersonIds NVARCHAR(2000)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'检查组成员ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckSpecial', @level2type=N'COLUMN',@level2name=N'PartInPersonIds'
GO

alter table dbo.Check_IncentiveNotice add TeamGroupId nvarchar(50) null
GO
alter table dbo.Check_IncentiveNotice add constraint FK_Check_IncentiveNotice_ProjectData_TeamGroup
foreign key (TeamGroupId) references ProjectData_TeamGroup (TeamGroupId)
GO 

alter table dbo.Check_PunishNotice add IncentiveReason nvarchar(100) null
GO

UPDATE Sys_FlowOperate SET MenuId='9B42977B-FA0B-48EF-8616-D53FC14E5127' 
WHERE MenuId='B42977B-FA0B-48EF-8616-D53FC14E5127' 
GO
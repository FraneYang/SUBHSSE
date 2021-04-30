INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('0E30F917-0C51-4C45-BD19-981039CA44F5','日常巡检（五环）','Check/CheckDayWH.aspx','PageHeaderFooter',22,'467A0CB9-737D-4451-965E-869EBC3A4BD6','Menu_Project',1,0)
GO
--日常巡检按钮
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('8BB6E89A-6F4D-4708-B1D5-19E7F9C93DBC','0E30F917-0C51-4C45-BD19-981039CA44F5','增加',1)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('8CC6E923-0363-4834-9791-A9B53D027D0B','0E30F917-0C51-4C45-BD19-981039CA44F5','修改',2)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('987AE3C6-B374-4BBE-8478-4257D6DFABE5','0E30F917-0C51-4C45-BD19-981039CA44F5','删除',3)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('3CA31AFA-51C4-4B90-89EB-84F0304A5B76','0E30F917-0C51-4C45-BD19-981039CA44F5','保存',4)
GO

INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('0E30F917-0C51-4C45-BD19-981039CA44F5','日常巡检（五环）','Check/CheckDayWH.aspx','PageHeaderFooter',22,'467A0CB9-737D-4451-965E-869EBC3A4BD6','Menu_Project',1,0)
GO

ALTER TABLE dbo.Check_CheckDayDetail ADD HiddenDangerType NVARCHAR(50)
ALTER TABLE dbo.Check_CheckDayDetail ADD HiddenDangerLevel NVARCHAR(50)
ALTER TABLE dbo.Check_CheckDayDetail ADD PersonId NVARCHAR(50)
GO
ALTER TABLE [dbo].[Check_CheckDayDetail]  WITH CHECK ADD  CONSTRAINT [FK_Check_CheckDayDetail_SitePerson_Person] FOREIGN KEY([PersonId])
REFERENCES [dbo].[SitePerson_Person] ([PersonId])
GO

ALTER TABLE [dbo].[Check_CheckDayDetail] CHECK CONSTRAINT [FK_Check_CheckDayDetail_SitePerson_Person]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'隐患类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckDayDetail', @level2type=N'COLUMN',@level2name=N'HiddenDangerType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'隐患级别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckDayDetail', @level2type=N'COLUMN',@level2name=N'HiddenDangerLevel'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'责任人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckDayDetail', @level2type=N'COLUMN',@level2name=N'PersonId'
GO
ALTER PROCEDURE [dbo].[SpCheckDayStatistic]     
	@ProjectId NVARCHAR(50),
	@StartTime NVARCHAR(15)=NULL,        
	@EndTime NVARCHAR(15)=NULL,
	@States CHAR(1)=NULL,
	@UnitName NVARCHAR(200)=NULL,
	@WorkAreaName NVARCHAR(200)=NULL
AS  
/*日常巡检检查*/          
BEGIN
SELECT 	CheckDayDetail.CheckDayDetailId
	,CheckDay.CheckDayId
	,CheckDay.CheckDayId+','+ISNULL(CheckDayDetail.CheckDayDetailId,'') AS NewChcekId
	,CodeRecords.Code AS CheckDayCode
	,ISNULL(Checks.CheckCount,0) AS CheckCount	
	,CheckDayDetail.WorkArea
	,Unit.UnitName
	,CheckDayDetail.CompleteStatus
	,(CASE WHEN CheckDayDetail.CompleteStatus=1 THEN '已完成' ELSE '' END) AS CompleteStatusName
	,CONVERT(VARCHAR(100), CheckDayDetail.LimitedDate, 23) AS LimitedDate
	,CheckDayDetail.CompletedDate
	,CheckDay.CheckPerson
	,CONVERT(VARCHAR(100), CheckDay.CheckTime, 23) AS CheckTime
	--,CheckDay.CheckTime
	,CheckDayDetail.CheckItemType
	,CheckDayDetail.CheckItem
	,CheckDayDetail.HandleStep
	,CheckDayDetail.Unqualified
	,(CASE WHEN CheckDay.States='0' OR CheckDay.States IS NULL THEN '待['+ISNULL(OperateUser.UserName,Users.UserName)+']提交' WHEN CheckDay.States='2' THEN '审核/审批完成' ELSE '待['+OperateUser.UserName+']办理' END) AS  FlowOperateName
	,CheckPersonUsers.UserName AS CheckPersonName
	,person.PersonName
	,CheckDayDetail.HiddenDangerType
	,CheckDayDetail.HiddenDangerLevel
FROM Check_CheckDay AS CheckDay 
LEFT JOIN Sys_CodeRecords AS CodeRecords ON CheckDay.CheckDayId=CodeRecords.DataId
LEFT JOIN Check_CheckDayDetail AS CheckDayDetail ON CheckDayDetail.CheckDayId = CheckDay.CheckDayId AND  CheckDayDetail.CheckDayDetailId IS NOT NULL 
--LEFT JOIN ProjectData_WorkArea AS WorkArea on WorkArea.WorkAreaId=CheckDayDetail.CheckArea        
LEFT JOIN Base_Unit AS Unit ON Unit.UnitId=CheckDayDetail.UnitId        
LEFT JOIN (SELECT COUNT(*)  AS CheckCount, CheckDayId 
			FROM Check_CheckDayDetail GROUP BY CheckDayId) AS Checks ON Checks.CheckDayId = CheckDay.CheckDayId 
LEFT JOIN Sys_FlowOperate AS FlowOperate ON CheckDay.CheckDayId=FlowOperate.DataId AND FlowOperate.IsClosed <> 1
LEFT JOIN Sys_User AS OperateUser ON FlowOperate.OperaterId=OperateUser.UserId
LEFT JOIN Sys_User AS Users ON CheckDay.CompileMan=Users.UserId
LEFT JOIN Sys_User AS CheckPersonUsers ON CheckDay.CheckPerson=CheckPersonUsers.UserId
LEFT JOIN dbo.SitePerson_Person AS person ON person.PersonId = CheckDayDetail.PersonId
WHERE  (@StartTime IS NULL OR CheckDay.CheckTime>=@StartTime) 
		AND (@EndTime IS NULL OR CheckDay.CheckTime <=@EndTime ) 
		AND CheckDay.ProjectId=@ProjectId
		AND (@States IS NULL OR CheckDay.States=@States) 
		AND (@UnitName IS NULL OR Unit.UnitName LIKE '%'+@UnitName+'%' ) 
		AND (@WorkAreaName IS NULL OR CheckDayDetail.WorkArea LIKE '%'+@WorkAreaName+'%' ) 
ORDER BY CheckDayCode DESC
   
END
GO

ALTER VIEW [dbo].[View_Check_CheckDayDetail] 
AS 
/*日常巡检明细列表视图*/
SELECT checkDayDetail.CheckDayDetailId, 
	checkDayDetail.CheckDayId, 
	checkDayDetail.CheckItem, 
	checkDayDetail.CheckItemType,
	checkDayDetail.Unqualified,
	checkDayDetail.CheckArea,
	checkDayDetail.UnitId,
	checkDayDetail.HandleStep,
	checkDayDetail.CompleteStatus,
	(CASE WHEN checkDayDetail.CompleteStatus =1 THEN '是' 
			WHEN checkDayDetail.CompleteStatus =0 THEN '否' ELSE '' END) AS  CompleteStatusName,
	checkDayDetail.LimitedDate,
	checkDayDetail.CompletedDate,
	checkDayDetail.Suggestions,
	checkDayDetail.CheckContent,
	(CASE WHEN checkDayDetail.CheckContent IS NOT NULL THEN checkDayDetail.CheckContent
	ELSE checkItemSet.CheckItemName END) AS CheckItemStr,
	checkDayDetail.WorkArea,
	unit.UnitName,
	const.ConstText AS HandleStepStr,
	checkDayDetail.HiddenDangerType,
	checkDayDetail.HiddenDangerLevel,
	person.PersonName
FROM dbo.Check_CheckDayDetail AS checkDayDetail
--LEFT JOIN dbo.Check_ProjectCheckItemDetail AS checkItemDetail ON checkItemDetail.CheckItemDetailId=checkDayDetail.CheckItem
LEFT JOIN dbo.Check_ProjectCheckItemSet AS checkItemSet ON checkItemSet.CheckItemSetId=checkDayDetail.CheckItem
LEFT JOIN dbo.Base_Unit AS unit ON unit.UnitId=checkDayDetail.UnitId
LEFT JOIN dbo.SitePerson_Person AS person ON person.PersonId = checkDayDetail.PersonId
LEFT JOIN Sys_Const AS const ON const.ConstValue = checkDayDetail.HandleStep AND const.GroupId='HandleStep'


GO



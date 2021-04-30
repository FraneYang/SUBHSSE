
INSERT dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon,SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES  ('E8363923-06CD-47C2-BFE1-F18212094710','综合检查（五环）','Check/CheckColligationWH.aspx','PageHeaderFooter',45,'467A0CB9-737D-4451-965E-869EBC3A4BD6','Menu_Project',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('837F04F7-2FD9-43F9-AA05-37CE55B17C03','E8363923-06CD-47C2-BFE1-F18212094710','增加',1)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('454700A1-C7D9-48D0-876C-E69920D2D8C5','E8363923-06CD-47C2-BFE1-F18212094710','修改',2)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('661ACF5A-3347-437C-82CC-4A20FFA5BD7D','E8363923-06CD-47C2-BFE1-F18212094710','删除',3)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('41A12BAA-1AF1-4B10-965F-9ED1647F0142','E8363923-06CD-47C2-BFE1-F18212094710','保存',4)  
GO


ALTER TABLE dbo.Check_CheckColligationDetail ADD HiddenDangerType NVARCHAR(50)
ALTER TABLE dbo.Check_CheckColligationDetail ADD HiddenDangerLevel NVARCHAR(50)
ALTER TABLE dbo.Check_CheckColligationDetail ADD PersonId NVARCHAR(50)
GO

ALTER TABLE [dbo].[Check_CheckColligationDetail]  WITH CHECK ADD  CONSTRAINT [FK_Check_CheckColligationDetail_SitePerson_Person] FOREIGN KEY([PersonId])
REFERENCES [dbo].[SitePerson_Person] ([PersonId])
GO

ALTER TABLE [dbo].[Check_CheckColligationDetail] CHECK CONSTRAINT [FK_Check_CheckColligationDetail_SitePerson_Person]
GO
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'隐患类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckColligationDetail', @level2type=N'COLUMN',@level2name=N'HiddenDangerType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'隐患级别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckColligationDetail', @level2type=N'COLUMN',@level2name=N'HiddenDangerLevel'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'责任人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckColligationDetail', @level2type=N'COLUMN',@level2name=N'PersonId'
GO


ALTER PROCEDURE [dbo].[SpCheckColligationStatistic]     
	@ProjectId NVARCHAR(50),
	@StartTime NVARCHAR(15)=NULL,        
	@EndTime NVARCHAR(15)=NULL,
	@States CHAR(1)=NULL,
	@UnitName NVARCHAR(200)=NULL,
	@WorkAreaName NVARCHAR(200)=NULL          
AS
/*综合大检查*/      
BEGIN
SELECT 	CheckColligationDetail.CheckColligationDetailId
	,CheckColligation.CheckColligationId
	,CheckColligation.CheckColligationId+','+ISNULL(CheckColligationDetail.CheckColligationDetailId,'') AS NewChcekId
	,CodeRecords.Code AS CheckColligationCode
	,ISNULL(Checks.CheckCount,0) AS CheckCount	
	,CheckColligationDetail.WorkArea
	,Unit.UnitName
	,CheckColligationDetail.CompleteStatus
	,(CASE WHEN CheckColligationDetail.CompleteStatus=1 THEN '已完成' ELSE '' END) AS CompleteStatusName
	,CONVERT(VARCHAR(100), CheckColligationDetail.LimitedDate, 23) AS LimitedDate
	,CheckColligationDetail.CompletedDate
	,CheckColligation.CheckPerson
	,user1.UserName AS CheckPersonName
	,CONVERT(VARCHAR(100), CheckColligation.CheckTime, 23) AS CheckTime
	--,CheckColligation.CheckTime
	,CheckColligationDetail.CheckItemType
	,CheckColligationDetail.CheckItem
	,CheckColligationDetail.HandleStep
	,CheckColligationDetail.Unqualified
	,CheckColligationDetail.HiddenDangerType
	,CheckColligationDetail.HiddenDangerLevel
	,person.PersonName
	,(CASE WHEN CheckColligation.CheckType ='0' THEN '周检' WHEN CheckColligation.CheckType ='1' THEN '月检' ELSE '其它' END)  AS CheckTypeName
	,(CASE WHEN CheckColligation.States='0' OR CheckColligation.States IS NULL THEN '待['+ISNULL(OperateUser.UserName,Users.UserName)+']提交' WHEN CheckColligation.States='2' THEN '审核/审批完成' ELSE '待['+OperateUser.UserName+']办理' END) AS  FlowOperateName
FROM Check_CheckColligation AS CheckColligation 
LEFT JOIN Sys_CodeRecords AS CodeRecords ON CheckColligation.CheckColligationId=CodeRecords.DataId
LEFT JOIN Sys_User AS user1 ON CheckColligation.CheckPerson=user1.UserId
LEFT JOIN Check_CheckColligationDetail  AS CheckColligationDetail 
	ON CheckColligationDetail.CheckColligationId = CheckColligation.CheckColligationId AND CheckColligationDetail.CheckColligationDetailId IS NOT NULL   
--LEFT JOIN ProjectData_WorkArea AS WorkArea on WorkArea.WorkAreaId=CheckColligationDetail.CheckArea        
LEFT JOIN Base_Unit AS Unit ON Unit.UnitId=CheckColligationDetail.UnitId        
LEFT JOIN (SELECT COUNT(*)  AS CheckCount, CheckColligationId 
			FROM Check_CheckColligationDetail GROUP BY CheckColligationId) AS Checks ON Checks.CheckColligationId = CheckColligation.CheckColligationId 
LEFT JOIN Sys_FlowOperate AS FlowOperate ON CheckColligation.CheckColligationId=FlowOperate.DataId AND FlowOperate.IsClosed <> 1
LEFT JOIN Sys_User AS OperateUser ON FlowOperate.OperaterId=OperateUser.UserId
LEFT JOIN Sys_User AS Users ON CheckColligation.CompileMan=Users.UserId
LEFT JOIN dbo.SitePerson_Person AS person ON person.PersonId=CheckColligationDetail.PersonId
WHERE  (@StartTime IS NULL OR CheckColligation.CheckTime>=@StartTime) 
		AND (@EndTime IS NULL OR CheckColligation.CheckTime <=@EndTime ) 
		AND CheckColligation.ProjectId=@ProjectId
		AND (@States IS NULL OR CheckColligation.States=@States) 
		AND (@UnitName IS NULL OR Unit.UnitName LIKE '%'+@UnitName+'%' ) 
		AND (@WorkAreaName IS NULL OR CheckColligationDetail.WorkArea LIKE '%'+@WorkAreaName+'%' ) 
ORDER BY CheckColligationCode DESC   
END


GO



ALTER VIEW [dbo].[View_Check_CheckColligationDetail]  AS 
/*综合大检查明细列表视图*/
SELECT checkColligationDetail.CheckColligationDetailId, 
checkColligationDetail.CheckColligationId, 
checkColligationDetail.CheckItem, 
checkColligationDetail.CheckItemType,
checkColligationDetail.Unqualified,
checkColligationDetail.CheckArea,
checkColligationDetail.UnitId,
checkColligationDetail.HandleStep,
checkColligationDetail.CompleteStatus,
(CASE WHEN checkColligationDetail.CompleteStatus =1 THEN '是' 
			WHEN checkColligationDetail.CompleteStatus =0 THEN '否' ELSE '' END) AS  CompleteStatusName,
checkColligationDetail.LimitedDate,
checkColligationDetail.CompletedDate,
checkColligationDetail.Suggestions,
checkColligationDetail.CheckContent,
CASE WHEN checkColligationDetail.CheckContent IS NOT NULL THEN checkColligationDetail.CheckContent
ELSE checkItemSet.CheckItemName END AS CheckItemStr,
checkColligationDetail.WorkArea,
unit.UnitName,
const.ConstText AS HandleStepStr,
checkColligationDetail.HiddenDangerType,
checkColligationDetail.HiddenDangerLevel,
person.PersonName
FROM dbo.Check_CheckColligationDetail AS checkColligationDetail
--LEFT JOIN dbo.Check_ProjectCheckItemDetail AS checkItemDetail ON checkItemDetail.CheckItemDetailId=checkColligationDetail.CheckItem
LEFT JOIN dbo.Check_ProjectCheckItemSet AS checkItemSet ON checkItemSet.CheckItemSetId=checkColligationDetail.CheckItem
LEFT JOIN dbo.Base_Unit AS unit ON unit.UnitId=checkColligationDetail.UnitId
LEFT JOIN dbo.SitePerson_Person AS person ON person.PersonId = checkColligationDetail.PersonId
LEFT JOIN Sys_Const AS const ON const.ConstValue = checkColligationDetail.HandleStep AND const.GroupId='HandleStep'

GO

ALTER TABLE Check_CheckWorkDetail ADD SortIndex INT NULL
GO 

ALTER VIEW [dbo].[View_Check_CheckWorkDetail]  
AS 
/*开工前检查明细列表视图*/
SELECT checkWorkDetail.CheckWorkDetailId, 
	checkWorkDetail.CheckWorkId, 
	checkWorkDetail.CheckItem, 
	checkWorkDetail.CheckResult,
	checkWorkDetail.CheckOpinion,
	checkWorkDetail.CheckStation,
	checkWorkDetail.HandleResult,
	checkWorkDetail.CheckContent,
	case when checkWorkDetail.CheckContent is not null then checkWorkDetail.CheckContent
	else checkItemSet.CheckItemName end as CheckItemStr,
	checkWorkDetail.SortIndex
FROM dbo.Check_CheckWorkDetail AS checkWorkDetail
--LEFT JOIN dbo.Check_ProjectCheckItemDetail AS checkItemDetail 
--ON checkItemDetail.CheckItemDetailId=checkWorkDetail.CheckItem
LEFT JOIN dbo.Check_ProjectCheckItemSet AS checkItemSet ON checkItemSet.CheckItemSetId=checkWorkDetail.CheckItem

GO

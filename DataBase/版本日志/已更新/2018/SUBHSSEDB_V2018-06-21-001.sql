ALTER VIEW [dbo].[View_SitePerson_Person]
AS
SELECT Person.PersonId,
	Person.CardNo,
	Person.PersonName,
	(Case Person.Sex WHEN '1' THEN '��' WHEN '2' THEN 'Ů' ELSE '' END) AS Sex, 
	Person.IdentityCard, 
	Person.Address, 
	Person.ProjectId, 
	Person.UnitId, 
	Person.TeamGroupId, 
	Person.WorkAreaId, 
	Person.WorkPostId, 	
	Person.InTime, 
	Person.OutTime, 
	Person.OutResult, 
	Person.Telephone, 
	Person.PositionId, 
	Person.PostTitleId, 
	Person.PhotoUrl, 
	(CASE Person.IsUsed WHEN 'TRUE' THEN '��' ELSE '��' END) AS IsUsed, 
	(CASE Person.IsCardUsed WHEN 'TRUE' THEN '��' ELSE '��' END) AS IsCardUsed, 
	Person.PersonIndex,
	Project.ProjectCode,
	Project.ProjectName,
	Unit.UnitCode,
	Unit.UnitName,
	TeamGroup.TeamGroupName,
	WorkArea.WorkAreaCode,
	WorkArea.WorkAreaName,
	Post.WorkPostName,
	Position.PositionName,
	Title.PostTitleName,
	Depart.DepartName,
	Post.PostType,
	Post.IsHsse,
	(SELECT COUNT(*) FROM EduTrain_TrainRecordDetail T WHERE T.PersonId=Person.PersonId) AS TrainCount
FROM SitePerson_Person AS Person
LEFT JOIN Base_Project AS Project ON Project.ProjectId=Person.ProjectId
LEFT JOIN Base_Unit AS Unit ON Unit.UnitId = Person.UnitId
LEFT JOIN ProjectData_TeamGroup AS TeamGroup ON TeamGroup.TeamGroupId=Person.TeamGroupId
LEFT JOIN ProjectData_WorkArea AS WorkArea ON WorkArea.WorkAreaId = Person.WorkAreaId
LEFT JOIN Base_WorkPost AS Post ON Post.WorkPostId = Person.WorkPostId
LEFT JOIN Base_Position AS Position ON Position.PositionId = Person.PositionId
Left JOIN Base_PostTitle AS Title ON Title.PostTitleId = Person.PostTitleId
Left JOIN Base_Depart AS Depart ON Depart.DepartId = Person.DepartId

GO

--��ѵ��¼��ϸ�б�
ALTER VIEW [dbo].[View_EduTrain_TrainRecordDetail]  AS 
/*��ѵ��¼��ϸ�б���ͼ*/
SELECT trainRecordDetail.TrainDetailId, 
	trainRecordDetail.TrainingId, 
	trainRecordDetail.PersonId, 
	trainRecordDetail.CheckScore,
	trainRecordDetail.CheckResult,
	person.UnitId,
	unit.UnitName,
	person.PersonName
FROM dbo.EduTrain_TrainRecordDetail AS trainRecordDetail
LEFT JOIN dbo.SitePerson_Person AS person ON person.PersonId = trainRecordDetail.PersonId
LEFT JOIN dbo.Base_Unit AS unit ON unit.UnitId=person.UnitId

GO
--�������ݼ���ҳ��
INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('3ACE1F4B-9D7F-4923-8668-9B6AA3CA17CA','���ݼ���','Personal/FileSearch.aspx','FolderFind',40,'0','Menu_Personal',1,0)
GO

ALTER TABLE Supervise_SuperviseCheckRectify ALTER COLUMN ProjectId NVARCHAR(50) NULL
GO
ALTER TABLE [dbo].[Supervise_SuperviseCheckRectify]  WITH CHECK ADD  CONSTRAINT [FK_Supervise_SuperviseCheckRectify_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[Supervise_SuperviseCheckRectify] CHECK CONSTRAINT [FK_Supervise_SuperviseCheckRectify_Base_Project]
GO

INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('29F27641-06ED-435A-9F9B-FCE6366801BE','��ҵ�ල�������','Hazard/ProjectSuperviseCheckRectify.aspx','PageHeaderFooter',72,'467A0CB9-737D-4451-965E-869EBC3A4BD6','Menu_Project',1,0)
GO
--��ȫ�ල�������
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('B6BC2531-A381-4843-9E08-C49EFB3B541B','29F27641-06ED-435A-9F9B-FCE6366801BE','�޸�',2)	
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('FBBC83E5-DF22-4995-8086-CB7A970CE2D3','29F27641-06ED-435A-9F9B-FCE6366801BE','����',4)  
GO

INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('29F27641-06ED-435A-9F9B-FCE6366801BE','��ҵ�ල�������','Hazard/ProjectSuperviseCheckRectify.aspx','PageHeaderFooter',82,'467A0CB9-737D-4451-965E-869EBC3A4BD6','Menu_Project',1,0)
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
	CASE S.HandleState WHEN '1' THEN 'δǩ��' 
					   WHEN '2' THEN 'δ���'
					   ELSE '�����' END AS HandleStateName,
	S.IssueMan,
	S.IssueDate
	,ISNULL(TotalCount.TotalCount,0) AS TotalCount --����
	,ISNULL(CompleteCount.CompleteCount,0) AS CompleteCount --�����
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



INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('A5ADCB3B-2BB6-4980-AF04-5EFE3C7CB698','B6BE5FE0-CB84-47FF-A6C3-5AD9E1CCE079','删除',1)
GO

UPDATE Technique_HazardListType SET IsCompany=0 WHERE IsCompany IS NULL
GO

ALTER VIEW [dbo].[View_SitePerson_Person]
AS
SELECT Person.PersonId,
	Person.CardNo,
	Person.PersonName,
	(Case Person.Sex WHEN '1' THEN '男' WHEN '2' THEN '女' ELSE '' END) AS Sex, 
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
	(CASE Person.IsUsed WHEN 'TRUE' THEN '是' ELSE '否' END) AS IsUsed, 
	(CASE Person.IsCardUsed WHEN 'TRUE' THEN '是' ELSE '否' END) AS IsCardUsed, 
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
	Post.IsHsse
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


ALTER TABLE Technique_Environmental ADD IsCompany BIT --是否公司
GO

INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('069F993E-6C7E-4703-B6DB-D1A81024B483','773B59F9-61F9-4F5E-9D68-A1BF9322AFFA','导入',5)
GO

INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('DC2AA8C2-82A8-4F7A-832D-9889C65AA228','公司环境因素危险源','Technique/CompanyEnvironmental.aspx','Page',17,'F3B157B7-9BEE-4150-80CB-087828F1C51D','Menu_Resource',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('8858EDDB-999A-4F53-A6F1-C638DBBCE593','DC2AA8C2-82A8-4F7A-832D-9889C65AA228','增加',1)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('A7C503E2-7529-401C-9591-B652C54DC7A4','DC2AA8C2-82A8-4F7A-832D-9889C65AA228','修改',2)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('2E142169-2F37-413B-AB4A-60DAF56BA8E3','DC2AA8C2-82A8-4F7A-832D-9889C65AA228','删除',3)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('BF4C3CF0-2A08-4923-9827-EDDE5E0E3F85','DC2AA8C2-82A8-4F7A-832D-9889C65AA228','保存',4)	
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('B9FFCF57-10E5-438E-A265-495EB4D64440','DC2AA8C2-82A8-4F7A-832D-9889C65AA228','导入',5)
GO

UPDATE Technique_Environmental SET IsCompany=0 WHERE IsCompany IS NULL
GO
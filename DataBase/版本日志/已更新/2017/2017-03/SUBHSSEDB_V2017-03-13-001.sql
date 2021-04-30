alter table dbo.SecuritySystem_SafetySystem add UnitId nvarchar(50) null
GO
alter table dbo.SecuritySystem_SafetySystem add constraint FK_SecuritySystem_SafetySystem_Base_Unit
foreign key (UnitId) references Base_Unit (UnitId)
GO

alter table dbo.SecuritySystem_SafetyInstitution add UnitId nvarchar(50) null
GO
alter table dbo.SecuritySystem_SafetyInstitution add constraint FK_SecuritySystem_SafetyInstitution_Base_Unit
foreign key (UnitId) references Base_Unit (UnitId)
GO

alter table dbo.SitePerson_PersonInOut add InCount int null
alter table dbo.SitePerson_PersonInOut add OutCount int null
alter table dbo.SitePerson_PersonInOut add TotalCount int null
GO

alter table dbo.SitePerson_Person add DepartId nvarchar(50) null
GO
alter table dbo.SitePerson_Person add constraint FK_SitePerson_Person_Base_Depart
foreign key (DepartId) references Base_Depart (DepartId)
GO

ALTER VIEW [dbo].[View_SitePerson_Person]
AS
SELECT Person.PersonId,
	Person.CardNo,
	Person.PersonName,
	(Case Person.Sex WHEN '1' THEN 'ÄÐ' WHEN '2' THEN 'Å®' ELSE '' END) AS Sex, 
	Person.IdentityCard, 
	Person.Address, 
	Person.ProjectId, 
	Person.UnitId, 
	Person.TeamGroupId, 
	Person.WorkAreaId, 
	Person.WorkPostId, 
	Person.CertificateId, 
	Person.CertificateCode, 
	Person.CertificateLimitTime, 
	Person.InTime, 
	Person.OutTime, 
	Person.OutResult, 
	Person.Telephone, 
	Person.PositionId, 
	Person.PostTitleId, 
	Person.PhotoUrl, 
	(CASE Person.IsUsed WHEN 'TRUE' THEN 'ÊÇ' ELSE '·ñ' END) AS IsUsed, 
	(CASE Person.IsCardUsed WHEN 'TRUE' THEN 'ÊÇ' ELSE '·ñ' END) AS IsCardUsed, 
	Person.PersonIndex,
	Project.ProjectCode,
	Project.ProjectName,
	Unit.UnitCode,
	Unit.UnitName,
	TeamGroup.TeamGroupName,
	WorkArea.WorkAreaCode,
	WorkArea.WorkAreaName,
	Post.WorkPostName,
	Certificat.CertificateName,
	Position.PositionName,
	Title.PostTitleName,
	Person.SendCardNo,
	Depart.DepartName
FROM SitePerson_Person AS Person
LEFT JOIN Base_Project AS Project ON Project.ProjectId=Person.ProjectId
LEFT JOIN Base_Unit AS Unit ON Unit.UnitId = Person.UnitId
LEFT JOIN ProjectData_TeamGroup AS TeamGroup ON TeamGroup.TeamGroupId=Person.TeamGroupId
LEFT JOIN ProjectData_WorkArea AS WorkArea ON WorkArea.WorkAreaId = Person.WorkAreaId
LEFT JOIN Base_WorkPost AS Post ON Post.WorkPostId = Person.WorkPostId
LEFT JOIN Base_Certificate AS Certificat ON Certificat.CertificateId=Person.CertificateId
LEFT JOIN Base_Position AS Position ON Position.PositionId = Person.PositionId
Left JOIN Base_PostTitle AS Title ON Title.PostTitleId = Person.PostTitleId
Left JOIN Base_Depart AS Depart ON Depart.DepartId = Person.DepartId
GO



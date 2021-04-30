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
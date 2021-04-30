update dbo.Sys_MenuCommon set MenuName='领导督查类型*'
where MenuId='60BFBA33-B5C7-4EBF-A4AE-1B820559676D'
GO
update dbo.Sys_MenuProjectA set MenuName='领导督查'
where MenuId='247B76AA-01BF-4A40-BB4C-B3EAF441F538'
GO

alter table dbo.Sys_Log add SystemId nvarchar(50) null
GO
alter table dbo.QualityAudit_EquipmentQuality add QRCodeAttachUrl nvarchar(200) null
GO
alter table dbo.QualityAudit_GeneralEquipmentQuality add QRCodeAttachUrl nvarchar(200) null
GO
alter table dbo.Solution_ConstructSolution add QRCodeAttachUrl nvarchar(200) null
GO
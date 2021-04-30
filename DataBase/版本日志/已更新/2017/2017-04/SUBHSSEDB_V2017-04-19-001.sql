
UPDATE Technique_Environmental SET AValue =1 WHERE AValue=2 OR AValue IS NULL AND  SmallType='2'
GO
UPDATE Technique_Environmental SET AValue =3 WHERE AValue=4 AND  SmallType='2'
GO
UPDATE Technique_Environmental SET AValue =5 WHERE AValue >4 AND  SmallType='2'
GO

UPDATE Technique_Environmental SET BValue =1 WHERE BValue=2 OR BValue IS NULL AND  SmallType='2'
GO
UPDATE Technique_Environmental SET BValue =3 WHERE BValue=4 AND  SmallType='2'
GO
UPDATE Technique_Environmental SET BValue =5 WHERE BValue >4 AND  SmallType='2'
GO

UPDATE Technique_Environmental SET CValue =1 WHERE CValue=2 OR CValue IS NULL AND  SmallType='2'
GO
UPDATE Technique_Environmental SET CValue =3 WHERE CValue=4  AND  SmallType='2'
GO
UPDATE Technique_Environmental SET CValue =5 WHERE CValue >4 AND  SmallType='2'
GO

UPDATE Technique_Environmental SET DValue =1 WHERE DValue=2 OR DValue IS NULL AND  SmallType='2'
GO
UPDATE Technique_Environmental SET DValue =3 WHERE DValue=4 AND  SmallType='2'
GO
UPDATE Technique_Environmental SET DValue =5 WHERE DValue >4 AND  SmallType='2'
GO

UPDATE Technique_Environmental SET EValue =1 WHERE EValue=2 OR EValue IS NULL AND  SmallType='2'
GO
UPDATE Technique_Environmental SET EValue =3 WHERE EValue=4 AND  SmallType='2'
GO
UPDATE Technique_Environmental SET EValue =5 WHERE EValue >4 AND  SmallType='2'
GO
UPDATE Technique_Environmental SET ZValue=(AValue + BValue +CValue +DValue+EValue) WHERE SmallType='2'
GO

UPDATE Technique_Environmental SET AValue =NULL , BValue =NULL, CValue =NULL, DValue =NULL, EValue =NULL, ZValue =NULL
WHERE SmallType='1'
GO

UPDATE Technique_Environmental SET IsImportant = 0
GO
UPDATE Technique_Environmental SET IsImportant = 1
WHERE FValue>=5 OR GValue>=5 OR ISNULL(FValue,0)+ISNULL(GValue,0) >= 7 AND SmallType='1'
GO
UPDATE Technique_Environmental SET IsImportant = 1
WHERE AValue>=5 OR BValue>=5 OR DValue >=5 OR ISNULL(AValue,0)+ISNULL(BValue,0)+ISNULL(CValue,0)+ISNULL(DValue,0)+ISNULL(EValue,0) >= 15 AND SmallType='2'
GO

ALTER TABLE Hazard_EnvironmentalRiskItem ADD FValue INT NULL 
GO

ALTER TABLE Hazard_EnvironmentalRiskItem ADD GValue INT NULL 
GO

UPDATE Hazard_EnvironmentalRiskItem SET AValue =1 WHERE AValue=2 OR AValue IS NULL AND  SmallType='2'
GO
UPDATE Hazard_EnvironmentalRiskItem SET AValue =3 WHERE AValue=4 AND  SmallType='2'
GO
UPDATE Hazard_EnvironmentalRiskItem SET AValue =5 WHERE AValue >4 AND  SmallType='2'
GO

UPDATE Hazard_EnvironmentalRiskItem SET BValue =1 WHERE BValue=2 OR BValue IS NULL AND  SmallType='2'
GO
UPDATE Hazard_EnvironmentalRiskItem SET BValue =3 WHERE BValue=4 AND  SmallType='2'
GO
UPDATE Hazard_EnvironmentalRiskItem SET BValue =5 WHERE BValue >4 AND  SmallType='2'
GO

UPDATE Hazard_EnvironmentalRiskItem SET CValue =1 WHERE CValue=2 OR CValue IS NULL AND  SmallType='2'
GO
UPDATE Hazard_EnvironmentalRiskItem SET CValue =3 WHERE CValue=4  AND  SmallType='2'
GO
UPDATE Hazard_EnvironmentalRiskItem SET CValue =5 WHERE CValue >4 AND  SmallType='2'
GO

UPDATE Hazard_EnvironmentalRiskItem SET DValue =1 WHERE DValue=2 OR DValue IS NULL AND  SmallType='2'
GO
UPDATE Hazard_EnvironmentalRiskItem SET DValue =3 WHERE DValue=4 AND  SmallType='2'
GO
UPDATE Hazard_EnvironmentalRiskItem SET DValue =5 WHERE DValue >4 AND  SmallType='2'
GO

UPDATE Hazard_EnvironmentalRiskItem SET EValue =1 WHERE EValue=2 OR EValue IS NULL AND  SmallType='2'
GO
UPDATE Hazard_EnvironmentalRiskItem SET EValue =3 WHERE EValue=4 AND  SmallType='2'
GO
UPDATE Hazard_EnvironmentalRiskItem SET EValue =5 WHERE EValue >4 AND  SmallType='2'
GO
UPDATE Hazard_EnvironmentalRiskItem SET ZValue=(AValue + BValue +CValue +DValue+EValue) WHERE SmallType='2'
GO

UPDATE Hazard_EnvironmentalRiskItem SET AValue =NULL , BValue =NULL, CValue =NULL, DValue =NULL, EValue =NULL, ZValue =NULL
WHERE SmallType='1'
GO

UPDATE Hazard_EnvironmentalRiskItem SET IsImportant = 0
GO
UPDATE Hazard_EnvironmentalRiskItem SET IsImportant = 1
WHERE FValue>=5 OR GValue>=5 OR ISNULL(FValue,0)+ISNULL(GValue,0) >= 7 AND SmallType='1'
GO
UPDATE Hazard_EnvironmentalRiskItem SET IsImportant = 1
WHERE AValue>=5 OR BValue>=5 OR DValue >=5 OR ISNULL(AValue,0)+ISNULL(BValue,0)+ISNULL(CValue,0)+ISNULL(DValue,0)+ISNULL(EValue,0) >= 15 AND SmallType='2'
GO

UPDATE Hazard_EnvironmentalRiskList SET IdentificationDate= CompileDate
GO

UPDATE Hazard_EnvironmentalRiskList SET CompileMan= NULL
WHERE (SELECT COUNT(*) FROM Sys_User WHERE UserId=CompileMan OR UserName=CompileMan) = 0
GO

UPDATE Hazard_EnvironmentalRiskList SET CompileMan= b.UserId
FROM Sys_User b WHERE CompileMan = b.UserName
GO

ALTER TABLE [dbo].[Hazard_EnvironmentalRiskList]  WITH CHECK ADD  CONSTRAINT [FK_Hazard_EnvironmentalRiskList_Sys_User1] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO
ALTER TABLE [dbo].[Hazard_EnvironmentalRiskList] CHECK CONSTRAINT [FK_Hazard_EnvironmentalRiskList_Sys_User1]
GO

ALTER TABLE [dbo].[Hazard_EnvironmentalRiskItem]  WITH CHECK ADD  CONSTRAINT [FK_Hazard_EnvironmentalRiskItem_Hazard_EnvironmentalRiskList] FOREIGN KEY([EnvironmentalRiskListId])
REFERENCES [dbo].[Hazard_EnvironmentalRiskList] ([EnvironmentalRiskListId])
GO

ALTER TABLE [dbo].[Hazard_EnvironmentalRiskItem] CHECK CONSTRAINT [FK_Hazard_EnvironmentalRiskItem_Hazard_EnvironmentalRiskList]
GO

ALTER TABLE Hazard_EnvironmentalRiskItem ADD EnvironmentalId NVARCHAR(50) NULL
GO
ALTER TABLE [dbo].[Hazard_EnvironmentalRiskItem]  WITH CHECK ADD  CONSTRAINT [FK_Hazard_EnvironmentalRiskItem_Technique_Environmental] FOREIGN KEY([EnvironmentalId])
REFERENCES [dbo].[Technique_Environmental] ([EnvironmentalId])
GO

ALTER TABLE [dbo].[Hazard_EnvironmentalRiskItem] CHECK CONSTRAINT [FK_Hazard_EnvironmentalRiskItem_Technique_Environmental]
GO

UPDATE Hazard_EnvironmentalRiskItem SET Hazard_EnvironmentalRiskItem.EnvironmentalId=B.EnvironmentalId
FROM Technique_Environmental AS B 
WHERE Hazard_EnvironmentalRiskItem.Code =B.Code
GO

ALTER TABLE Technique_Environmental ADD ControlMeasures NVARCHAR(200) NULL
GO
ALTER TABLE Technique_Environmental ADD Remark NVARCHAR(200) NULL
GO
ALTER TABLE Hazard_EnvironmentalRiskItem ADD ControlMeasures NVARCHAR(200) NULL
GO
ALTER TABLE Hazard_EnvironmentalRiskItem ADD Remark NVARCHAR(200) NULL
GO
--环境危险源评价明细列表
ALTER VIEW [dbo].[View_Hazard_EnvironmentalRiskItem]  AS 
/*环境危险源评价明细列表视图*/
SELECT riskItem.EnvironmentalRiskItemId, 
	riskItem.EnvironmentalRiskListId, 
	riskItem.EType, 
	riskItem.ActivePoint,
	riskItem.EnvironmentalFactors,
	riskItem.AValue,
	riskItem.BValue,
	riskItem.CValue,
	riskItem.DValue,
	riskItem.EValue,
	(ISNULL(riskItem.AValue,0) + ISNULL(riskItem.BValue,0)+ ISNULL(riskItem.CValue,0)+ ISNULL(riskItem.DValue,0)+ ISNULL(riskItem.EValue,0)) AS ZValue1,
	riskItem.FValue,riskItem.GValue,(ISNULL(riskItem.FValue,0) + ISNULL(riskItem.GValue,0)) AS ZValue2,
	riskItem.SmallType,
	riskItem.IsImportant,
	riskItem.Code,
	Sys_ConstEType.ConstText AS ETypeName,
	Sys_ConstESmallType.ConstText AS SmallTypeName
	,riskItem.EnvironmentalId
	,riskItem.ControlMeasures
	,riskItem.Remark
FROM dbo.Hazard_EnvironmentalRiskItem AS riskItem
LEFT JOIN Sys_Const AS  Sys_ConstEType  ON riskItem.EType=Sys_ConstEType.ConstValue and Sys_ConstEType.GroupId='EnvironmentalType'
LEFT JOIN Sys_Const AS Sys_ConstESmallType ON riskItem.SmallType=Sys_ConstESmallType.ConstValue and Sys_ConstESmallType.GroupId='EnvironmentalSmallType'

GO


ALTER VIEW [dbo].[View_NewDynamic] 
AS
SELECT PersonQuality.PersonId AS Id
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
	,'危险源辩识评价', hList.HazardCode+'未响应，项目：'+ Project.ProjectName
	,hl.CompileDate
	,'~/Hazard/Response.aspx?HazardListId={0}' AS Url 
	,Project.ProjectId
FROM Hazard_HazardSelectedItem AS item 
	left join dbo.Hazard_HazardList hl on item.HazardListId=hl.HazardListId
	left join dbo.Technique_HazardList hList on item.HazardId=hList.HazardId
	LEFT JOIN Base_Project AS Project ON hl.ProjectId =Project.ProjectId
WHERE item.IsResponse = 0 AND dateadd(wk,item.PromptTime,hl.CompileDate)<=GETDATE()

GO

ALTER TABLE Hazard_HazardList ADD WorkAreaName NVARCHAR(500) NULL
GO
ALTER TABLE Hazard_HazardList ADD IdentificationDate datetime NULL
GO
ALTER TABLE Hazard_HazardList ADD ControllingPerson  NVARCHAR(50) NULL
GO
ALTER TABLE [dbo].[Hazard_HazardList]  WITH CHECK ADD  CONSTRAINT [FK_Hazard_HazardList_Sys_User1] FOREIGN KEY([ControllingPerson])
REFERENCES [dbo].[Sys_User] ([UserId])
GO
ALTER TABLE [dbo].[Hazard_HazardList] CHECK CONSTRAINT [FK_Hazard_HazardList_Sys_User1]
GO

ALTER TABLE InformationProject_ReceiveFileManager ADD UnitIds NVARCHAR(2000)
GO


/**********隐患巡检（手机端）视图*************/
ALTER VIEW [dbo].[View_Inspection_Registration]
AS
SELECT Registration.RegistrationId, 
Registration.ProjectId, 
Registration.WorkAreaId, 
Registration.ProblemDescription, 
Registration.ProblemTypes, 
Registration.TakeSteps, 
Registration.ResponsibilityUnitId, 
Registration.ResponsibilityManId, 
Registration.RectificationPeriod, 
Registration.CheckManId, 
Registration.CheckTime, 
Registration.ImageUrl, 
Registration.RectificationImageUrl, 
Registration.RectificationTime, 
Registration.State,
Project.ProjectName,
WorkArea.WorkAreaName,
Unit.UnitName AS ResponsibilityUnitName,
User1.UserName AS ResponsibilityManName,	 
User2.UserName AS CheckManName,
(CASE Registration.State 
WHEN '0' THEN '待审核' 
WHEN '1' THEN '已审核' 
WHEN '2' THEN '已整改' 
WHEN '3' THEN '已确认' 
WHEN '4' THEN '已作废' 
END ) AS States
FROM dbo.Inspection_Registration AS Registration
LEFT JOIN dbo.Base_Project AS Project ON Project.ProjectId = Registration.ProjectId
LEFT JOIN dbo.ProjectData_WorkArea AS WorkArea ON WorkArea.WorkAreaId = Registration.WorkAreaId 
LEFT JOIN dbo.Base_Unit AS Unit ON Unit.UnitId = Registration.ResponsibilityUnitId
LEFT JOIN dbo.Sys_User AS User1 ON User1.UserId = Registration.ResponsibilityManId   
LEFT JOIN dbo.Sys_User AS User2 ON User2.UserId = Registration.CheckManId
GO

ALTER TABLE Base_Project ADD IsUpTotalMonth BIT NULL
GO
UPDATE Base_Project SET IsUpTotalMonth=1
GO

ALTER TABLE Hazard_EnvironmentalRiskItem ADD EnvironmentEffect NVARCHAR(200)
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
	,riskItem.EnvironmentEffect
FROM dbo.Hazard_EnvironmentalRiskItem AS riskItem
LEFT JOIN Sys_Const AS  Sys_ConstEType  ON riskItem.EType=Sys_ConstEType.ConstValue and Sys_ConstEType.GroupId='EnvironmentalType'
LEFT JOIN Sys_Const AS Sys_ConstESmallType ON riskItem.SmallType=Sys_ConstESmallType.ConstValue and Sys_ConstESmallType.GroupId='EnvironmentalSmallType'


GO

/************环境危险源辨识与评价主表*************/
CREATE PROCEDURE [dbo].[Sp_Hazard_EnvironmentalRiskListReport]
 @EnvironmentalRiskListId nvarchar(50)
AS
SELECT EnvironmentalRiskList.EnvironmentalRiskListId, 
EnvironmentalRiskList.ProjectId, 
EnvironmentalRiskList.RiskCode, 
EnvironmentalRiskList.CompileMan, 
EnvironmentalRiskList.CompileDate, 
EnvironmentalRiskList.AttachUrl, 
EnvironmentalRiskList.States, 
EnvironmentalRiskList.Contents, 
EnvironmentalRiskList.WorkAreaName, 
EnvironmentalRiskList.IdentificationDate, 
EnvironmentalRiskList.ControllingPerson,
U1.UserName AS CompileManName,
U2.UserName AS ControllingPersonName,
Project.ProjectName
FROM dbo.Hazard_EnvironmentalRiskList AS EnvironmentalRiskList
LEFT JOIN Sys_User AS U1 ON U1.UserId = EnvironmentalRiskList.CompileMan
LEFT JOIN Sys_User AS U2 ON U2.UserId = EnvironmentalRiskList.ControllingPerson
LEFT JOIN Base_Project AS Project ON Project.ProjectId = EnvironmentalRiskList.ProjectId
WHERE EnvironmentalRiskList.EnvironmentalRiskListId = @EnvironmentalRiskListId

GO

/************环境危险源辨识与评价明细表*************/
CREATE PROCEDURE [dbo].[Sp_Hazard_EnvironmentalRiskListReportItem]
 @EnvironmentalRiskListId nvarchar(50)
AS
SELECT ROW_NUMBER() OVER (ORDER BY Item.EnvironmentalRiskItemId) AS Number,
Item.EnvironmentalRiskItemId, 
Item.EnvironmentalRiskListId, 
Item.EnvironmentalId, 
ConstEType.ConstText AS EType, 
Item.ActivePoint, 
Item.EnvironmentalFactors, 
Item.AValue, 
Item.BValue, 
Item.CValue, 
Item.DValue, 
Item.EValue, 
Item.ZValue, 
Const.ConstText AS SmallType,  
Item.IsImportant,
(CASE Item.IsImportant WHEN 'true' THEN '是' ELSE '否' END)AS IsImportantName,
Item.Code, 
Item.GValue, 
Item.ControlMeasures, 
Item.Remark, 
Item.FValue, 
Item.EnvironmentEffect,
(ISNULL(Item.AValue,0) + ISNULL(Item.BValue,0)+ ISNULL(Item.CValue,0)+ ISNULL(Item.DValue,0)+ ISNULL(Item.EValue,0)) AS ZValue1,
(ISNULL(Item.FValue,0) + ISNULL(Item.GValue,0)) AS ZValue2
FROM dbo.Hazard_EnvironmentalRiskItem AS Item
LEFT JOIN dbo.Hazard_EnvironmentalRiskList AS EnvironmentalRiskList ON EnvironmentalRiskList.EnvironmentalRiskListId = Item.EnvironmentalRiskListId
LEFT JOIN Technique_Environmental AS Environmental ON Environmental.EnvironmentalId = Item.EnvironmentalId
LEFT JOIN dbo.Sys_Const AS Const ON	Const.ConstValue = Item.SmallType AND Const.GroupId = 'EnvironmentalSmallType'
LEFT JOIN dbo.Sys_Const AS ConstEType ON Item.EType = ConstEType.ConstValue AND ConstEType.GroupId='EnvironmentalType'
WHERE Item.EnvironmentalRiskListId = @EnvironmentalRiskListId
GO


/************环境危险源辨识与评价明细表(重要环境因素)*************/
CREATE PROCEDURE [dbo].[Sp_Hazard_EnvironmentalRiskListReportImportantItem]
 @EnvironmentalRiskListId nvarchar(50)
AS
SELECT ROW_NUMBER() OVER (ORDER BY Item.EnvironmentalRiskItemId) AS Number,
Item.EnvironmentalRiskItemId, 
Item.EnvironmentalRiskListId, 
Item.EnvironmentalId, 
ConstEType.ConstText AS EType, 
Item.ActivePoint, 
Item.EnvironmentalFactors, 
Item.AValue, 
Item.BValue, 
Item.CValue, 
Item.DValue, 
Item.EValue, 
Item.ZValue, 
Const.ConstText AS SmallType,  
Item.IsImportant,
(CASE Item.IsImportant WHEN 'true' THEN '是' ELSE '否' END)AS IsImportantName,
Item.Code, 
Item.GValue, 
Item.ControlMeasures, 
Item.Remark, 
Item.FValue, 
Item.EnvironmentEffect,
(ISNULL(Item.AValue,0) + ISNULL(Item.BValue,0)+ ISNULL(Item.CValue,0)+ ISNULL(Item.DValue,0)+ ISNULL(Item.EValue,0)) AS ZValue1,
(ISNULL(Item.FValue,0) + ISNULL(Item.GValue,0)) AS ZValue2
FROM dbo.Hazard_EnvironmentalRiskItem AS Item
LEFT JOIN dbo.Hazard_EnvironmentalRiskList AS EnvironmentalRiskList ON EnvironmentalRiskList.EnvironmentalRiskListId = Item.EnvironmentalRiskListId
LEFT JOIN Technique_Environmental AS Environmental ON Environmental.EnvironmentalId = Item.EnvironmentalId
LEFT JOIN dbo.Sys_Const AS Const ON	Const.ConstValue = Item.SmallType AND Const.GroupId = 'EnvironmentalSmallType'
LEFT JOIN dbo.Sys_Const AS ConstEType ON Item.EType = ConstEType.ConstValue AND ConstEType.GroupId='EnvironmentalType'
WHERE Item.IsImportant ='true'
AND Item.EnvironmentalRiskListId = @EnvironmentalRiskListId
GO

INSERT INTO Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
Values('782C896E-8CE7-4C15-99B0-EF3E3542C82D','12','环境危险源辨识与评价',12,'Report')
GO
INSERT INTO Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
Values('7A702DDF-5274-4E32-AF08-F096B72E1A0D','13','环境危险源辨识与评价(重要环境因素)',13,'Report')
GO


INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('7612C1CB-7578-4931-B6A0-61FE91F5CC98','762F0BF9-471B-4115-B35E-03A26C573877','打印',5)  
GO

alter table dbo.QualityAudit_PersonQuality add CertificateId nvarchar(50) null
GO
alter table dbo.QualityAudit_PersonQuality add constraint FK_QualityAudit_PersonQuality_Base_Certificate
foreign key (CertificateId) references dbo.Base_Certificate (CertificateId)
GO 

alter table dbo.SitePerson_Checking add PersonId nvarchar(50) null
alter table dbo.SitePerson_Checking add WorkAreaName nvarchar(100) null
GO
alter table dbo.SitePerson_Checking add constraint FK_SitePerson_Checking_SitePerson_Person
foreign key (PersonId) references dbo.SitePerson_Person (PersonId)
GO 


ALTER VIEW [dbo].[View_SitePerson_Checking]
AS
/*人员考勤视图*/
SELECT ch.CheckingId,person.CardNo,ch.ProjectId,person.IdentityCard,ch.WorkAreaId,ch.IntoOutTime,ch.IntoOut,
       ch.[Address],ch.WorkAreaName,person.PersonName,person.UnitId,unit.UnitName,ch.States
from  dbo.SitePerson_Checking ch 
      left join dbo.SitePerson_Person person on ch.PersonId=person.PersonId
      left join dbo.Base_Unit unit on person.UnitId=unit.UnitId



GO


ALTER TABLE InformationProject_Notice ALTER COLUMN NoticeCode NVARCHAR(50) NULL
GO
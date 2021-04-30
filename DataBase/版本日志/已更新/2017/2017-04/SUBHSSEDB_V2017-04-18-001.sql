ALTER TABLE Hazard_EnvironmentalRiskList ADD WorkAreaName NVARCHAR(500) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目区域' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_EnvironmentalRiskList', @level2type=N'COLUMN',@level2name=N'WorkAreaName'
GO 
ALTER TABLE Hazard_EnvironmentalRiskList ADD IdentificationDate datetime NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'辨识时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_EnvironmentalRiskList', @level2type=N'COLUMN',@level2name=N'IdentificationDate'
GO 

ALTER TABLE Hazard_EnvironmentalRiskList ADD ControllingPerson  NVARCHAR(50) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'控制责任人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_EnvironmentalRiskList', @level2type=N'COLUMN',@level2name=N'ControllingPerson'
GO 

ALTER TABLE [dbo].[Hazard_EnvironmentalRiskList]  WITH CHECK ADD  CONSTRAINT [FK_Hazard_EnvironmentalRiskList_Sys_User] FOREIGN KEY([ControllingPerson])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[Hazard_EnvironmentalRiskList] CHECK CONSTRAINT [FK_Hazard_EnvironmentalRiskList_Sys_User]
GO

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

ALTER TABLE Technique_Environmental ADD FValue INT NULL 
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'F值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Technique_Environmental', @level2type=N'COLUMN',@level2name=N'FValue'
GO
ALTER TABLE Technique_Environmental ADD GValue INT NULL 
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'G值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Technique_Environmental', @level2type=N'COLUMN',@level2name=N'GValue'
GO

UPDATE Sys_Const SET ConstText='能源资源类' WHERE GroupId='EnvironmentalSmallType' AND ConstValue='1'
GO
UPDATE Sys_Const SET ConstText='污染类' WHERE GroupId='EnvironmentalSmallType' AND ConstValue='2'
GO

--常量表:施工方案类型
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('3C03AC5D-3AE8-46AC-A946-72A1C9583431','91','其它',91,'CNProfessional')
GO

--本部项目安全管理资料子菜单
INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit) 
VALUES('1364D490-6614-4E0D-8BF8-EEFAE2B26AE7','管理台账','SafetyData/AccidentStatisc.aspx','ApplicationFormMagnify',60,'0987D15D-3A2B-4B59-953A-A30B661E225A','Menu_Server',1,0)
GO

CREATE VIEW [dbo].[View_AccidentStatisc]  AS 
/*所有事故台账列表视图*/ 
SELECT accidentReport.AccidentReportId,
    accidentReport.ProjectId, 
	project.ProjectCode, 
	project.ProjectName, 
	accidentReport.AccidentTypeId,
	const.ConstText as AccidentTypeName,
	AccidentDate, 
    isnull(FileContent,Abstract) as Abstract,
	WorkingHoursLoss,
	isnull(EconomicLoss,0)+isnull(EconomicOtherLoss,0) as MoneyLoss
From dbo.Accident_AccidentReport AS accidentReport
LEFT JOIN Base_Project AS project ON project.ProjectId=accidentReport.ProjectId
left join Sys_Const as const on const.ConstValue=accidentReport.AccidentTypeId and const.GroupId='AccidentReportRegistration'
union
(
SELECT accidentReportOther.AccidentReportOtherId, 
    accidentReportOther.ProjectId, 
	project.ProjectCode, 
	project.ProjectName, 
	accidentReportOther.AccidentTypeId,
	const.ConstText as AccidentTypeName,
	AccidentDate, 
    isnull(ProcessDescription,Abstract) as Abstract,
	WorkingHoursLoss,
	isnull(EconomicLoss,0)+isnull(EconomicOtherLoss,0) as MoneyLoss
From dbo.Accident_AccidentReportOther AS accidentReportOther
LEFT JOIN Base_Project AS project ON project.ProjectId=accidentReportOther.ProjectId
left join Sys_Const as const on const.ConstValue=accidentReportOther.AccidentTypeId and const.GroupId='AccidentInvestigationProcessingReport')
GO

UPDATE Sys_MenuCommon SET SortIndex=50 WHERE MenuId='A139FF69-8B74-489B-AB5F-526B2207DD89'
GO

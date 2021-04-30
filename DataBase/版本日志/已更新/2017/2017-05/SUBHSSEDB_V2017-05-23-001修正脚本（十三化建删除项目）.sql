--删除多余项目 2017-05-19
--只十三化建执行，其他单位不要执行
DELETE FROM Sys_Log WHERE ProjectId IN ('4e393b32-47e5-4bf1-9ffa-8e0bc457dd9c')
GO
DELETE FROM ManagementReport_ReportRemind WHERE ProjectId IN ('4e393b32-47e5-4bf1-9ffa-8e0bc457dd9c')
GO
DELETE FROM ProjectSupervision_ProjectEvaluation WHERE ProjectId IN ('4e393b32-47e5-4bf1-9ffa-8e0bc457dd9c')
GO
DELETE FROM Sys_CodeRecords WHERE ProjectId IN ('4e393b32-47e5-4bf1-9ffa-8e0bc457dd9c')
GO
DELETE FROM SitePerson_MonthReportUnitDetail WHERE MonthReportDetailId IN (SELECT MonthReportDetailId FROM SitePerson_MonthReportDetail WHERE MonthReportId IN (SELECT MonthReportId FROM SitePerson_MonthReport WHERE ProjectId IN ('4e393b32-47e5-4bf1-9ffa-8e0bc457dd9c')))
GO
DELETE FROM SitePerson_MonthReportDetail WHERE MonthReportId IN (SELECT MonthReportId FROM SitePerson_MonthReport WHERE ProjectId IN ('4e393b32-47e5-4bf1-9ffa-8e0bc457dd9c'))
GO
DELETE FROM SitePerson_MonthReport WHERE ProjectId IN ('4e393b32-47e5-4bf1-9ffa-8e0bc457dd9c')
GO
DELETE FROM SitePerson_PersonInOut WHERE ProjectId IN ('4e393b32-47e5-4bf1-9ffa-8e0bc457dd9c')
GO
DELETE FROM QualityAudit_PersonQuality WHERE PersonId IN (SELECT PersonId FROM SitePerson_Person WHERE ProjectId IN ('4e393b32-47e5-4bf1-9ffa-8e0bc457dd9c'))
GO
DELETE FROM SitePerson_Person WHERE ProjectId IN ('4e393b32-47e5-4bf1-9ffa-8e0bc457dd9c')
GO
DELETE FROM ProjectData_TeamGroup WHERE ProjectId IN ('4e393b32-47e5-4bf1-9ffa-8e0bc457dd9c')
GO
DELETE FROM SitePerson_Checking WHERE ProjectId IN ('4e393b32-47e5-4bf1-9ffa-8e0bc457dd9c')
GO
DELETE FROM License_EquipmentSafetyList WHERE ProjectId IN ('4e393b32-47e5-4bf1-9ffa-8e0bc457dd9c')
GO
DELETE FROM License_LicenseManager WHERE ProjectId IN ('4e393b32-47e5-4bf1-9ffa-8e0bc457dd9c')
GO
DELETE FROM ProjectData_WorkArea WHERE ProjectId IN ('4e393b32-47e5-4bf1-9ffa-8e0bc457dd9c')
GO
DELETE FROM Sys_FlowOperate WHERE ProjectId IN ('4e393b32-47e5-4bf1-9ffa-8e0bc457dd9c')
GO
DELETE FROM Hazard_EnvironmentalRiskItem WHERE EnvironmentalRiskListId IN (SELECT EnvironmentalRiskListId FROM Hazard_EnvironmentalRiskList WHERE ProjectId IN ('4e393b32-47e5-4bf1-9ffa-8e0bc457dd9c'))
GO
DELETE FROM Hazard_EnvironmentalRiskList WHERE ProjectId IN ('4e393b32-47e5-4bf1-9ffa-8e0bc457dd9c')
GO
DELETE FROM SitePerson_DayReportUnitDetail WHERE DayReportDetailId IN (SELECT DayReportDetailId FROM SitePerson_DayReportDetail WHERE DayReportId IN (SELECT DayReportId FROM SitePerson_DayReport WHERE ProjectId IN ('4e393b32-47e5-4bf1-9ffa-8e0bc457dd9c')))
GO
DELETE FROM SitePerson_DayReportDetail WHERE DayReportId IN (SELECT DayReportId FROM SitePerson_DayReport WHERE ProjectId IN ('4e393b32-47e5-4bf1-9ffa-8e0bc457dd9c'))
GO
DELETE FROM SitePerson_DayReport WHERE ProjectId IN ('4e393b32-47e5-4bf1-9ffa-8e0bc457dd9c')
GO
DELETE FROM SecuritySystem_SafetyOrganization WHERE ProjectId IN ('4e393b32-47e5-4bf1-9ffa-8e0bc457dd9c')
GO
DELETE FROM InformationProject_MillionsMonthlyReport WHERE ProjectId IN ('4e393b32-47e5-4bf1-9ffa-8e0bc457dd9c')
GO
DELETE FROM Law_LawRegulationSelectedItem WHERE LawRegulationIdentifyId IN (SELECT LawRegulationIdentifyId FROM Law_LawRegulationIdentify WHERE ProjectId IN ('4e393b32-47e5-4bf1-9ffa-8e0bc457dd9c'))
GO
DELETE FROM Law_LawRegulationIdentify WHERE ProjectId IN ('4e393b32-47e5-4bf1-9ffa-8e0bc457dd9c')
GO
DELETE FROM InformationProject_ConstructionStandardSelectedItem WHERE ConstructionStandardIdentifyId IN (SELECT ConstructionStandardIdentifyId FROM InformationProject_ConstructionStandardIdentify WHERE ProjectId IN ('4e393b32-47e5-4bf1-9ffa-8e0bc457dd9c'))
GO
DELETE FROM InformationProject_ConstructionStandardIdentify WHERE ProjectId IN ('4e393b32-47e5-4bf1-9ffa-8e0bc457dd9c')
GO
DELETE FROM ActionPlan_ActionPlanList WHERE ProjectId IN ('4e393b32-47e5-4bf1-9ffa-8e0bc457dd9c')
GO
DELETE FROM License_SecurityLicense WHERE ProjectId IN ('4e393b32-47e5-4bf1-9ffa-8e0bc457dd9c')
GO
DELETE FROM EduTrain_TrainRecordDetail WHERE TrainingId IN (SELECT TrainingId FROM EduTrain_TrainRecord WHERE ProjectId IN ('4e393b32-47e5-4bf1-9ffa-8e0bc457dd9c'))
GO
DELETE FROM EduTrain_TrainRecord WHERE ProjectId IN ('4e393b32-47e5-4bf1-9ffa-8e0bc457dd9c')
GO
DELETE FROM Solution_ConstructSolution WHERE ProjectId IN ('4e393b32-47e5-4bf1-9ffa-8e0bc457dd9c')
GO
DELETE FROM Check_CheckDay WHERE ProjectId IN ('4e393b32-47e5-4bf1-9ffa-8e0bc457dd9c')
GO

DELETE FROM Check_CheckSpecial WHERE ProjectId IN ('4e393b32-47e5-4bf1-9ffa-8e0bc457dd9c')
GO
DELETE FROM SecuritySystem_SafetySystem WHERE ProjectId IN ('4e393b32-47e5-4bf1-9ffa-8e0bc457dd9c')
GO
DELETE FROM SecuritySystem_SafetyInstitution WHERE ProjectId IN ('4e393b32-47e5-4bf1-9ffa-8e0bc457dd9c')
GO

DELETE FROM QualityAudit_InUnit WHERE ProjectId IN ('4e393b32-47e5-4bf1-9ffa-8e0bc457dd9c')
GO
DELETE FROM ActionPlan_ManagerRule WHERE ProjectId IN ('4e393b32-47e5-4bf1-9ffa-8e0bc457dd9c')
GO
DELETE FROM InformationProject_FileCabinetAItem WHERE FileCabinetAId IN (SELECT FileCabinetAId FROM InformationProject_FileCabinetA WHERE ProjectId IN ('4e393b32-47e5-4bf1-9ffa-8e0bc457dd9c'))
GO
DELETE FROM InformationProject_FileCabinetA WHERE ProjectId IN ('4e393b32-47e5-4bf1-9ffa-8e0bc457dd9c')
GO
DELETE FROM Project_ProjectUser WHERE ProjectId IN ('4e393b32-47e5-4bf1-9ffa-8e0bc457dd9c')
GO
DELETE FROM Project_ProjectUnit WHERE ProjectId IN ('4e393b32-47e5-4bf1-9ffa-8e0bc457dd9c')
GO
DELETE FROM Check_ProjectCheckItemDetail WHERE CheckItemSetId IN (SELECT CheckItemSetId FROM Check_ProjectCheckItemSet WHERE ProjectId IN ('4e393b32-47e5-4bf1-9ffa-8e0bc457dd9c'))
GO

DELETE FROM Check_ProjectCheckItemSet WHERE ProjectId IN ('4e393b32-47e5-4bf1-9ffa-8e0bc457dd9c')
GO
DELETE FROM Manager_HSSELog WHERE ProjectId IN ('4e393b32-47e5-4bf1-9ffa-8e0bc457dd9c')
GO
DELETE FROM InformationProject_ReceiveFileManager WHERE ProjectId IN ('4e393b32-47e5-4bf1-9ffa-8e0bc457dd9c')
GO
DELETE FROM Base_Project WHERE ProjectId IN ('4e393b32-47e5-4bf1-9ffa-8e0bc457dd9c')
GO
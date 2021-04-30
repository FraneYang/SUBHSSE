--删除多余项目 2017-05-19
--只十三化建执行，其他单位不要执行
DELETE FROM Sys_Log WHERE ProjectId NOT IN ('328f4285-5f40-430f-99cc-51946a03a6f1','8b548869-20a4-4a19-b8e3-8a50d4f8473b','d112a1bf-acb0-415c-911d-2e2ad0992633')
GO
DELETE FROM ManagementReport_ReportRemind WHERE ProjectId NOT IN ('328f4285-5f40-430f-99cc-51946a03a6f1','8b548869-20a4-4a19-b8e3-8a50d4f8473b','d112a1bf-acb0-415c-911d-2e2ad0992633')
GO
DELETE FROM ProjectSupervision_ProjectEvaluation WHERE ProjectId NOT IN ('328f4285-5f40-430f-99cc-51946a03a6f1','8b548869-20a4-4a19-b8e3-8a50d4f8473b','d112a1bf-acb0-415c-911d-2e2ad0992633')
GO
DELETE FROM Sys_CodeRecords WHERE ProjectId NOT IN ('328f4285-5f40-430f-99cc-51946a03a6f1','8b548869-20a4-4a19-b8e3-8a50d4f8473b','d112a1bf-acb0-415c-911d-2e2ad0992633')
GO
DELETE FROM SitePerson_MonthReportUnitDetail WHERE MonthReportDetailId IN (SELECT MonthReportDetailId FROM SitePerson_MonthReportDetail WHERE MonthReportId IN (SELECT MonthReportId FROM SitePerson_MonthReport WHERE ProjectId NOT IN ('328f4285-5f40-430f-99cc-51946a03a6f1','8b548869-20a4-4a19-b8e3-8a50d4f8473b','d112a1bf-acb0-415c-911d-2e2ad0992633')))
GO
DELETE FROM SitePerson_MonthReportDetail WHERE MonthReportId IN (SELECT MonthReportId FROM SitePerson_MonthReport WHERE ProjectId NOT IN ('328f4285-5f40-430f-99cc-51946a03a6f1','8b548869-20a4-4a19-b8e3-8a50d4f8473b','d112a1bf-acb0-415c-911d-2e2ad0992633'))
GO
DELETE FROM SitePerson_MonthReport WHERE ProjectId NOT IN ('328f4285-5f40-430f-99cc-51946a03a6f1','8b548869-20a4-4a19-b8e3-8a50d4f8473b','d112a1bf-acb0-415c-911d-2e2ad0992633')
GO
DELETE FROM SitePerson_PersonInOut WHERE ProjectId NOT IN ('328f4285-5f40-430f-99cc-51946a03a6f1','8b548869-20a4-4a19-b8e3-8a50d4f8473b','d112a1bf-acb0-415c-911d-2e2ad0992633')
GO
DELETE FROM QualityAudit_PersonQuality WHERE PersonId IN (SELECT PersonId FROM SitePerson_Person WHERE ProjectId NOT IN ('328f4285-5f40-430f-99cc-51946a03a6f1','8b548869-20a4-4a19-b8e3-8a50d4f8473b','d112a1bf-acb0-415c-911d-2e2ad0992633'))
GO
DELETE FROM SitePerson_Person WHERE ProjectId NOT IN ('328f4285-5f40-430f-99cc-51946a03a6f1','8b548869-20a4-4a19-b8e3-8a50d4f8473b','d112a1bf-acb0-415c-911d-2e2ad0992633')
GO
DELETE FROM ProjectData_TeamGroup WHERE ProjectId NOT IN ('328f4285-5f40-430f-99cc-51946a03a6f1','8b548869-20a4-4a19-b8e3-8a50d4f8473b','d112a1bf-acb0-415c-911d-2e2ad0992633')
GO
DELETE FROM SitePerson_Checking WHERE ProjectId NOT IN ('328f4285-5f40-430f-99cc-51946a03a6f1','8b548869-20a4-4a19-b8e3-8a50d4f8473b','d112a1bf-acb0-415c-911d-2e2ad0992633')
GO
DELETE FROM License_EquipmentSafetyList WHERE ProjectId NOT IN ('328f4285-5f40-430f-99cc-51946a03a6f1','8b548869-20a4-4a19-b8e3-8a50d4f8473b','d112a1bf-acb0-415c-911d-2e2ad0992633')
GO
DELETE FROM License_LicenseManager WHERE ProjectId NOT IN ('328f4285-5f40-430f-99cc-51946a03a6f1','8b548869-20a4-4a19-b8e3-8a50d4f8473b','d112a1bf-acb0-415c-911d-2e2ad0992633')
GO
DELETE FROM ProjectData_WorkArea WHERE ProjectId NOT IN ('328f4285-5f40-430f-99cc-51946a03a6f1','8b548869-20a4-4a19-b8e3-8a50d4f8473b','d112a1bf-acb0-415c-911d-2e2ad0992633')
GO
DELETE FROM Sys_FlowOperate WHERE ProjectId NOT IN ('328f4285-5f40-430f-99cc-51946a03a6f1','8b548869-20a4-4a19-b8e3-8a50d4f8473b','d112a1bf-acb0-415c-911d-2e2ad0992633')
GO
DELETE FROM Hazard_EnvironmentalRiskItem WHERE EnvironmentalRiskListId IN (SELECT EnvironmentalRiskListId FROM Hazard_EnvironmentalRiskList WHERE ProjectId NOT IN ('328f4285-5f40-430f-99cc-51946a03a6f1','8b548869-20a4-4a19-b8e3-8a50d4f8473b','d112a1bf-acb0-415c-911d-2e2ad0992633'))
GO
DELETE FROM Hazard_EnvironmentalRiskList WHERE ProjectId NOT IN ('328f4285-5f40-430f-99cc-51946a03a6f1','8b548869-20a4-4a19-b8e3-8a50d4f8473b','d112a1bf-acb0-415c-911d-2e2ad0992633')
GO
DELETE FROM SitePerson_DayReportUnitDetail WHERE DayReportDetailId IN (SELECT DayReportDetailId FROM SitePerson_DayReportDetail WHERE DayReportId IN (SELECT DayReportId FROM SitePerson_DayReport WHERE ProjectId NOT IN ('328f4285-5f40-430f-99cc-51946a03a6f1','8b548869-20a4-4a19-b8e3-8a50d4f8473b','d112a1bf-acb0-415c-911d-2e2ad0992633')))
GO
DELETE FROM SitePerson_DayReportDetail WHERE DayReportId IN (SELECT DayReportId FROM SitePerson_DayReport WHERE ProjectId NOT IN ('328f4285-5f40-430f-99cc-51946a03a6f1','8b548869-20a4-4a19-b8e3-8a50d4f8473b','d112a1bf-acb0-415c-911d-2e2ad0992633'))
GO
DELETE FROM SitePerson_DayReport WHERE ProjectId NOT IN ('328f4285-5f40-430f-99cc-51946a03a6f1','8b548869-20a4-4a19-b8e3-8a50d4f8473b','d112a1bf-acb0-415c-911d-2e2ad0992633')
GO
DELETE FROM SecuritySystem_SafetyOrganization WHERE ProjectId NOT IN ('328f4285-5f40-430f-99cc-51946a03a6f1','8b548869-20a4-4a19-b8e3-8a50d4f8473b','d112a1bf-acb0-415c-911d-2e2ad0992633')
GO
DELETE FROM InformationProject_MillionsMonthlyReport WHERE ProjectId NOT IN ('328f4285-5f40-430f-99cc-51946a03a6f1','8b548869-20a4-4a19-b8e3-8a50d4f8473b','d112a1bf-acb0-415c-911d-2e2ad0992633')
GO
DELETE FROM Law_LawRegulationSelectedItem WHERE LawRegulationIdentifyId IN (SELECT LawRegulationIdentifyId FROM Law_LawRegulationIdentify WHERE ProjectId NOT IN ('328f4285-5f40-430f-99cc-51946a03a6f1','8b548869-20a4-4a19-b8e3-8a50d4f8473b','d112a1bf-acb0-415c-911d-2e2ad0992633'))
GO
DELETE FROM Law_LawRegulationIdentify WHERE ProjectId NOT IN ('328f4285-5f40-430f-99cc-51946a03a6f1','8b548869-20a4-4a19-b8e3-8a50d4f8473b','d112a1bf-acb0-415c-911d-2e2ad0992633')
GO
DELETE FROM InformationProject_ConstructionStandardSelectedItem WHERE ConstructionStandardIdentifyId IN (SELECT ConstructionStandardIdentifyId FROM InformationProject_ConstructionStandardIdentify WHERE ProjectId NOT IN ('328f4285-5f40-430f-99cc-51946a03a6f1','8b548869-20a4-4a19-b8e3-8a50d4f8473b','d112a1bf-acb0-415c-911d-2e2ad0992633'))
GO
DELETE FROM InformationProject_ConstructionStandardIdentify WHERE ProjectId NOT IN ('328f4285-5f40-430f-99cc-51946a03a6f1','8b548869-20a4-4a19-b8e3-8a50d4f8473b','d112a1bf-acb0-415c-911d-2e2ad0992633')
GO
DELETE FROM ActionPlan_ActionPlanList WHERE ProjectId NOT IN ('328f4285-5f40-430f-99cc-51946a03a6f1','8b548869-20a4-4a19-b8e3-8a50d4f8473b','d112a1bf-acb0-415c-911d-2e2ad0992633')
GO
DELETE FROM License_SecurityLicense WHERE ProjectId NOT IN ('328f4285-5f40-430f-99cc-51946a03a6f1','8b548869-20a4-4a19-b8e3-8a50d4f8473b','d112a1bf-acb0-415c-911d-2e2ad0992633')
GO
DELETE FROM EduTrain_TrainRecordDetail WHERE TrainingId IN (SELECT TrainingId FROM EduTrain_TrainRecord WHERE ProjectId NOT IN ('328f4285-5f40-430f-99cc-51946a03a6f1','8b548869-20a4-4a19-b8e3-8a50d4f8473b','d112a1bf-acb0-415c-911d-2e2ad0992633'))
GO
DELETE FROM EduTrain_TrainRecord WHERE ProjectId NOT IN ('328f4285-5f40-430f-99cc-51946a03a6f1','8b548869-20a4-4a19-b8e3-8a50d4f8473b','d112a1bf-acb0-415c-911d-2e2ad0992633')
GO
DELETE FROM Solution_ConstructSolution WHERE ProjectId NOT IN ('328f4285-5f40-430f-99cc-51946a03a6f1','8b548869-20a4-4a19-b8e3-8a50d4f8473b','d112a1bf-acb0-415c-911d-2e2ad0992633')
GO
DELETE FROM Check_CheckDay WHERE ProjectId NOT IN ('328f4285-5f40-430f-99cc-51946a03a6f1','8b548869-20a4-4a19-b8e3-8a50d4f8473b','d112a1bf-acb0-415c-911d-2e2ad0992633')
GO

DELETE FROM Check_CheckSpecial WHERE ProjectId NOT IN ('328f4285-5f40-430f-99cc-51946a03a6f1','8b548869-20a4-4a19-b8e3-8a50d4f8473b','d112a1bf-acb0-415c-911d-2e2ad0992633')
GO
DELETE FROM SecuritySystem_SafetySystem WHERE ProjectId NOT IN ('328f4285-5f40-430f-99cc-51946a03a6f1','8b548869-20a4-4a19-b8e3-8a50d4f8473b','d112a1bf-acb0-415c-911d-2e2ad0992633')
GO
DELETE FROM SecuritySystem_SafetyInstitution WHERE ProjectId NOT IN ('328f4285-5f40-430f-99cc-51946a03a6f1','8b548869-20a4-4a19-b8e3-8a50d4f8473b','d112a1bf-acb0-415c-911d-2e2ad0992633')
GO

DELETE FROM QualityAudit_InUnit WHERE ProjectId NOT IN ('328f4285-5f40-430f-99cc-51946a03a6f1','8b548869-20a4-4a19-b8e3-8a50d4f8473b','d112a1bf-acb0-415c-911d-2e2ad0992633')
GO
DELETE FROM ActionPlan_ManagerRule WHERE ProjectId NOT IN ('328f4285-5f40-430f-99cc-51946a03a6f1','8b548869-20a4-4a19-b8e3-8a50d4f8473b','d112a1bf-acb0-415c-911d-2e2ad0992633')
GO
DELETE FROM InformationProject_FileCabinetAItem WHERE FileCabinetAId IN (SELECT FileCabinetAId FROM InformationProject_FileCabinetA WHERE ProjectId NOT IN ('328f4285-5f40-430f-99cc-51946a03a6f1','8b548869-20a4-4a19-b8e3-8a50d4f8473b','d112a1bf-acb0-415c-911d-2e2ad0992633'))
GO
DELETE FROM InformationProject_FileCabinetA WHERE ProjectId NOT IN ('328f4285-5f40-430f-99cc-51946a03a6f1','8b548869-20a4-4a19-b8e3-8a50d4f8473b','d112a1bf-acb0-415c-911d-2e2ad0992633')
GO
DELETE FROM Project_ProjectUser WHERE ProjectId NOT IN ('328f4285-5f40-430f-99cc-51946a03a6f1','8b548869-20a4-4a19-b8e3-8a50d4f8473b','d112a1bf-acb0-415c-911d-2e2ad0992633')
GO
DELETE FROM Project_ProjectUnit WHERE ProjectId NOT IN ('328f4285-5f40-430f-99cc-51946a03a6f1','8b548869-20a4-4a19-b8e3-8a50d4f8473b','d112a1bf-acb0-415c-911d-2e2ad0992633')
GO
DELETE FROM Check_ProjectCheckItemDetail WHERE CheckItemSetId IN (SELECT CheckItemSetId FROM Check_ProjectCheckItemSet WHERE ProjectId NOT IN ('328f4285-5f40-430f-99cc-51946a03a6f1','8b548869-20a4-4a19-b8e3-8a50d4f8473b','d112a1bf-acb0-415c-911d-2e2ad0992633'))
GO

DELETE FROM Check_ProjectCheckItemSet WHERE ProjectId NOT IN ('328f4285-5f40-430f-99cc-51946a03a6f1','8b548869-20a4-4a19-b8e3-8a50d4f8473b','d112a1bf-acb0-415c-911d-2e2ad0992633')
GO
DELETE FROM Manager_HSSELog WHERE ProjectId NOT IN ('328f4285-5f40-430f-99cc-51946a03a6f1','8b548869-20a4-4a19-b8e3-8a50d4f8473b','d112a1bf-acb0-415c-911d-2e2ad0992633')
GO
DELETE FROM InformationProject_ReceiveFileManager WHERE ProjectId NOT IN ('328f4285-5f40-430f-99cc-51946a03a6f1','8b548869-20a4-4a19-b8e3-8a50d4f8473b','d112a1bf-acb0-415c-911d-2e2ad0992633')
GO
DELETE FROM License_HSETechnical WHERE ProjectId NOT IN ('328f4285-5f40-430f-99cc-51946a03a6f1','8b548869-20a4-4a19-b8e3-8a50d4f8473b','d112a1bf-acb0-415c-911d-2e2ad0992633')
GO
DELETE FROM InformationProject_AccidentCauseReport WHERE ProjectId NOT IN ('328f4285-5f40-430f-99cc-51946a03a6f1','8b548869-20a4-4a19-b8e3-8a50d4f8473b','d112a1bf-acb0-415c-911d-2e2ad0992633')
GO
DELETE FROM QualityAudit_EquipmentQuality WHERE ProjectId NOT IN ('328f4285-5f40-430f-99cc-51946a03a6f1','8b548869-20a4-4a19-b8e3-8a50d4f8473b','d112a1bf-acb0-415c-911d-2e2ad0992633')
GO
DELETE FROM Base_Project WHERE ProjectId NOT IN ('328f4285-5f40-430f-99cc-51946a03a6f1','8b548869-20a4-4a19-b8e3-8a50d4f8473b','d112a1bf-acb0-415c-911d-2e2ad0992633')
GO
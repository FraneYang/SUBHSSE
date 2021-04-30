--删除多余项目 2017-05-19
--只十三化建执行，其他单位不要执行
DELETE FROM Sys_Log WHERE ProjectId IN ('a9f58825-e827-4acd-820c-2ea73f2ea649','5e53abb8-c831-44a4-93e8-bfe5cf85a03b','f3bc33d7-13c3-41e2-8110-c6a8bada9721','e295a359-63bb-4f81-8ae8-8daa598897fd','36dc6c58-bfca-4607-aa75-8ff2b7bba704','9aa4a9ff-4cd7-4ad2-8a4e-69861b13bfcb')
GO
DELETE FROM ManagementReport_ReportRemind WHERE ProjectId IN ('a9f58825-e827-4acd-820c-2ea73f2ea649','5e53abb8-c831-44a4-93e8-bfe5cf85a03b','f3bc33d7-13c3-41e2-8110-c6a8bada9721','e295a359-63bb-4f81-8ae8-8daa598897fd','36dc6c58-bfca-4607-aa75-8ff2b7bba704','9aa4a9ff-4cd7-4ad2-8a4e-69861b13bfcb')
GO
DELETE FROM ProjectSupervision_ProjectEvaluation WHERE ProjectId IN ('a9f58825-e827-4acd-820c-2ea73f2ea649','5e53abb8-c831-44a4-93e8-bfe5cf85a03b','f3bc33d7-13c3-41e2-8110-c6a8bada9721','e295a359-63bb-4f81-8ae8-8daa598897fd','36dc6c58-bfca-4607-aa75-8ff2b7bba704','9aa4a9ff-4cd7-4ad2-8a4e-69861b13bfcb')
GO
DELETE FROM Sys_CodeRecords WHERE ProjectId IN ('a9f58825-e827-4acd-820c-2ea73f2ea649','5e53abb8-c831-44a4-93e8-bfe5cf85a03b','f3bc33d7-13c3-41e2-8110-c6a8bada9721','e295a359-63bb-4f81-8ae8-8daa598897fd','36dc6c58-bfca-4607-aa75-8ff2b7bba704','9aa4a9ff-4cd7-4ad2-8a4e-69861b13bfcb')
GO
DELETE FROM SitePerson_MonthReportUnitDetail WHERE MonthReportDetailId IN (SELECT MonthReportDetailId FROM SitePerson_MonthReportDetail WHERE MonthReportId IN (SELECT MonthReportId FROM SitePerson_MonthReport WHERE ProjectId IN ('a9f58825-e827-4acd-820c-2ea73f2ea649','5e53abb8-c831-44a4-93e8-bfe5cf85a03b','f3bc33d7-13c3-41e2-8110-c6a8bada9721','e295a359-63bb-4f81-8ae8-8daa598897fd','36dc6c58-bfca-4607-aa75-8ff2b7bba704','9aa4a9ff-4cd7-4ad2-8a4e-69861b13bfcb')))
GO
DELETE FROM SitePerson_MonthReportDetail WHERE MonthReportId IN (SELECT MonthReportId FROM SitePerson_MonthReport WHERE ProjectId IN ('a9f58825-e827-4acd-820c-2ea73f2ea649','5e53abb8-c831-44a4-93e8-bfe5cf85a03b','f3bc33d7-13c3-41e2-8110-c6a8bada9721','e295a359-63bb-4f81-8ae8-8daa598897fd','36dc6c58-bfca-4607-aa75-8ff2b7bba704','9aa4a9ff-4cd7-4ad2-8a4e-69861b13bfcb'))
GO
DELETE FROM SitePerson_MonthReport WHERE ProjectId IN ('a9f58825-e827-4acd-820c-2ea73f2ea649','5e53abb8-c831-44a4-93e8-bfe5cf85a03b','f3bc33d7-13c3-41e2-8110-c6a8bada9721','e295a359-63bb-4f81-8ae8-8daa598897fd','36dc6c58-bfca-4607-aa75-8ff2b7bba704','9aa4a9ff-4cd7-4ad2-8a4e-69861b13bfcb')
GO
DELETE FROM SitePerson_PersonInOut WHERE ProjectId IN ('a9f58825-e827-4acd-820c-2ea73f2ea649','5e53abb8-c831-44a4-93e8-bfe5cf85a03b','f3bc33d7-13c3-41e2-8110-c6a8bada9721','e295a359-63bb-4f81-8ae8-8daa598897fd','36dc6c58-bfca-4607-aa75-8ff2b7bba704','9aa4a9ff-4cd7-4ad2-8a4e-69861b13bfcb')
GO
DELETE FROM QualityAudit_PersonQuality WHERE PersonId IN (SELECT PersonId FROM SitePerson_Person WHERE ProjectId IN ('a9f58825-e827-4acd-820c-2ea73f2ea649','5e53abb8-c831-44a4-93e8-bfe5cf85a03b','f3bc33d7-13c3-41e2-8110-c6a8bada9721','e295a359-63bb-4f81-8ae8-8daa598897fd','36dc6c58-bfca-4607-aa75-8ff2b7bba704','9aa4a9ff-4cd7-4ad2-8a4e-69861b13bfcb'))
GO
DELETE FROM SitePerson_Person WHERE ProjectId IN ('a9f58825-e827-4acd-820c-2ea73f2ea649','5e53abb8-c831-44a4-93e8-bfe5cf85a03b','f3bc33d7-13c3-41e2-8110-c6a8bada9721','e295a359-63bb-4f81-8ae8-8daa598897fd','36dc6c58-bfca-4607-aa75-8ff2b7bba704','9aa4a9ff-4cd7-4ad2-8a4e-69861b13bfcb')
GO
DELETE FROM ProjectData_TeamGroup WHERE ProjectId IN ('a9f58825-e827-4acd-820c-2ea73f2ea649','5e53abb8-c831-44a4-93e8-bfe5cf85a03b','f3bc33d7-13c3-41e2-8110-c6a8bada9721','e295a359-63bb-4f81-8ae8-8daa598897fd','36dc6c58-bfca-4607-aa75-8ff2b7bba704','9aa4a9ff-4cd7-4ad2-8a4e-69861b13bfcb')
GO
DELETE FROM SitePerson_Checking WHERE ProjectId IN ('a9f58825-e827-4acd-820c-2ea73f2ea649','5e53abb8-c831-44a4-93e8-bfe5cf85a03b','f3bc33d7-13c3-41e2-8110-c6a8bada9721','e295a359-63bb-4f81-8ae8-8daa598897fd','36dc6c58-bfca-4607-aa75-8ff2b7bba704','9aa4a9ff-4cd7-4ad2-8a4e-69861b13bfcb')
GO
DELETE FROM License_EquipmentSafetyList WHERE ProjectId IN ('a9f58825-e827-4acd-820c-2ea73f2ea649','5e53abb8-c831-44a4-93e8-bfe5cf85a03b','f3bc33d7-13c3-41e2-8110-c6a8bada9721','e295a359-63bb-4f81-8ae8-8daa598897fd','36dc6c58-bfca-4607-aa75-8ff2b7bba704','9aa4a9ff-4cd7-4ad2-8a4e-69861b13bfcb')
GO
DELETE FROM License_LicenseManager WHERE ProjectId IN ('a9f58825-e827-4acd-820c-2ea73f2ea649','5e53abb8-c831-44a4-93e8-bfe5cf85a03b','f3bc33d7-13c3-41e2-8110-c6a8bada9721','e295a359-63bb-4f81-8ae8-8daa598897fd','36dc6c58-bfca-4607-aa75-8ff2b7bba704','9aa4a9ff-4cd7-4ad2-8a4e-69861b13bfcb')
GO
DELETE FROM ProjectData_WorkArea WHERE ProjectId IN ('a9f58825-e827-4acd-820c-2ea73f2ea649','5e53abb8-c831-44a4-93e8-bfe5cf85a03b','f3bc33d7-13c3-41e2-8110-c6a8bada9721','e295a359-63bb-4f81-8ae8-8daa598897fd','36dc6c58-bfca-4607-aa75-8ff2b7bba704','9aa4a9ff-4cd7-4ad2-8a4e-69861b13bfcb')
GO
DELETE FROM Sys_FlowOperate WHERE ProjectId IN ('a9f58825-e827-4acd-820c-2ea73f2ea649','5e53abb8-c831-44a4-93e8-bfe5cf85a03b','f3bc33d7-13c3-41e2-8110-c6a8bada9721','e295a359-63bb-4f81-8ae8-8daa598897fd','36dc6c58-bfca-4607-aa75-8ff2b7bba704','9aa4a9ff-4cd7-4ad2-8a4e-69861b13bfcb')
GO
DELETE FROM Hazard_EnvironmentalRiskItem WHERE EnvironmentalRiskListId IN (SELECT EnvironmentalRiskListId FROM Hazard_EnvironmentalRiskList WHERE ProjectId IN ('a9f58825-e827-4acd-820c-2ea73f2ea649','5e53abb8-c831-44a4-93e8-bfe5cf85a03b','f3bc33d7-13c3-41e2-8110-c6a8bada9721','e295a359-63bb-4f81-8ae8-8daa598897fd','36dc6c58-bfca-4607-aa75-8ff2b7bba704','9aa4a9ff-4cd7-4ad2-8a4e-69861b13bfcb'))
GO
DELETE FROM Hazard_EnvironmentalRiskList WHERE ProjectId IN ('a9f58825-e827-4acd-820c-2ea73f2ea649','5e53abb8-c831-44a4-93e8-bfe5cf85a03b','f3bc33d7-13c3-41e2-8110-c6a8bada9721','e295a359-63bb-4f81-8ae8-8daa598897fd','36dc6c58-bfca-4607-aa75-8ff2b7bba704','9aa4a9ff-4cd7-4ad2-8a4e-69861b13bfcb')
GO
DELETE FROM SitePerson_DayReportUnitDetail WHERE DayReportDetailId IN (SELECT DayReportDetailId FROM SitePerson_DayReportDetail WHERE DayReportId IN (SELECT DayReportId FROM SitePerson_DayReport WHERE ProjectId IN ('a9f58825-e827-4acd-820c-2ea73f2ea649','5e53abb8-c831-44a4-93e8-bfe5cf85a03b','f3bc33d7-13c3-41e2-8110-c6a8bada9721','e295a359-63bb-4f81-8ae8-8daa598897fd','36dc6c58-bfca-4607-aa75-8ff2b7bba704','9aa4a9ff-4cd7-4ad2-8a4e-69861b13bfcb')))
GO
DELETE FROM SitePerson_DayReportDetail WHERE DayReportId IN (SELECT DayReportId FROM SitePerson_DayReport WHERE ProjectId IN ('a9f58825-e827-4acd-820c-2ea73f2ea649','5e53abb8-c831-44a4-93e8-bfe5cf85a03b','f3bc33d7-13c3-41e2-8110-c6a8bada9721','e295a359-63bb-4f81-8ae8-8daa598897fd','36dc6c58-bfca-4607-aa75-8ff2b7bba704','9aa4a9ff-4cd7-4ad2-8a4e-69861b13bfcb'))
GO
DELETE FROM SitePerson_DayReport WHERE ProjectId IN ('a9f58825-e827-4acd-820c-2ea73f2ea649','5e53abb8-c831-44a4-93e8-bfe5cf85a03b','f3bc33d7-13c3-41e2-8110-c6a8bada9721','e295a359-63bb-4f81-8ae8-8daa598897fd','36dc6c58-bfca-4607-aa75-8ff2b7bba704','9aa4a9ff-4cd7-4ad2-8a4e-69861b13bfcb')
GO
DELETE FROM SecuritySystem_SafetyOrganization WHERE ProjectId IN ('a9f58825-e827-4acd-820c-2ea73f2ea649','5e53abb8-c831-44a4-93e8-bfe5cf85a03b','f3bc33d7-13c3-41e2-8110-c6a8bada9721','e295a359-63bb-4f81-8ae8-8daa598897fd','36dc6c58-bfca-4607-aa75-8ff2b7bba704','9aa4a9ff-4cd7-4ad2-8a4e-69861b13bfcb')
GO
DELETE FROM InformationProject_MillionsMonthlyReport WHERE ProjectId IN ('a9f58825-e827-4acd-820c-2ea73f2ea649','5e53abb8-c831-44a4-93e8-bfe5cf85a03b','f3bc33d7-13c3-41e2-8110-c6a8bada9721','e295a359-63bb-4f81-8ae8-8daa598897fd','36dc6c58-bfca-4607-aa75-8ff2b7bba704','9aa4a9ff-4cd7-4ad2-8a4e-69861b13bfcb')
GO
DELETE FROM Law_LawRegulationSelectedItem WHERE LawRegulationIdentifyId IN (SELECT LawRegulationIdentifyId FROM Law_LawRegulationIdentify WHERE ProjectId IN ('a9f58825-e827-4acd-820c-2ea73f2ea649','5e53abb8-c831-44a4-93e8-bfe5cf85a03b','f3bc33d7-13c3-41e2-8110-c6a8bada9721','e295a359-63bb-4f81-8ae8-8daa598897fd','36dc6c58-bfca-4607-aa75-8ff2b7bba704','9aa4a9ff-4cd7-4ad2-8a4e-69861b13bfcb'))
GO
DELETE FROM Law_LawRegulationIdentify WHERE ProjectId IN ('a9f58825-e827-4acd-820c-2ea73f2ea649','5e53abb8-c831-44a4-93e8-bfe5cf85a03b','f3bc33d7-13c3-41e2-8110-c6a8bada9721','e295a359-63bb-4f81-8ae8-8daa598897fd','36dc6c58-bfca-4607-aa75-8ff2b7bba704','9aa4a9ff-4cd7-4ad2-8a4e-69861b13bfcb')
GO
DELETE FROM InformationProject_ConstructionStandardSelectedItem WHERE ConstructionStandardIdentifyId IN (SELECT ConstructionStandardIdentifyId FROM InformationProject_ConstructionStandardIdentify WHERE ProjectId IN ('a9f58825-e827-4acd-820c-2ea73f2ea649','5e53abb8-c831-44a4-93e8-bfe5cf85a03b','f3bc33d7-13c3-41e2-8110-c6a8bada9721','e295a359-63bb-4f81-8ae8-8daa598897fd','36dc6c58-bfca-4607-aa75-8ff2b7bba704','9aa4a9ff-4cd7-4ad2-8a4e-69861b13bfcb'))
GO
DELETE FROM InformationProject_ConstructionStandardIdentify WHERE ProjectId IN ('a9f58825-e827-4acd-820c-2ea73f2ea649','5e53abb8-c831-44a4-93e8-bfe5cf85a03b','f3bc33d7-13c3-41e2-8110-c6a8bada9721','e295a359-63bb-4f81-8ae8-8daa598897fd','36dc6c58-bfca-4607-aa75-8ff2b7bba704','9aa4a9ff-4cd7-4ad2-8a4e-69861b13bfcb')
GO
DELETE FROM ActionPlan_ActionPlanList WHERE ProjectId IN ('a9f58825-e827-4acd-820c-2ea73f2ea649','5e53abb8-c831-44a4-93e8-bfe5cf85a03b','f3bc33d7-13c3-41e2-8110-c6a8bada9721','e295a359-63bb-4f81-8ae8-8daa598897fd','36dc6c58-bfca-4607-aa75-8ff2b7bba704','9aa4a9ff-4cd7-4ad2-8a4e-69861b13bfcb')
GO
DELETE FROM License_SecurityLicense WHERE ProjectId IN ('a9f58825-e827-4acd-820c-2ea73f2ea649','5e53abb8-c831-44a4-93e8-bfe5cf85a03b','f3bc33d7-13c3-41e2-8110-c6a8bada9721','e295a359-63bb-4f81-8ae8-8daa598897fd','36dc6c58-bfca-4607-aa75-8ff2b7bba704','9aa4a9ff-4cd7-4ad2-8a4e-69861b13bfcb')
GO
DELETE FROM EduTrain_TrainRecordDetail WHERE TrainingId IN (SELECT TrainingId FROM EduTrain_TrainRecord WHERE ProjectId IN ('a9f58825-e827-4acd-820c-2ea73f2ea649','5e53abb8-c831-44a4-93e8-bfe5cf85a03b','f3bc33d7-13c3-41e2-8110-c6a8bada9721','e295a359-63bb-4f81-8ae8-8daa598897fd','36dc6c58-bfca-4607-aa75-8ff2b7bba704','9aa4a9ff-4cd7-4ad2-8a4e-69861b13bfcb'))
GO
DELETE FROM EduTrain_TrainRecord WHERE ProjectId IN ('a9f58825-e827-4acd-820c-2ea73f2ea649','5e53abb8-c831-44a4-93e8-bfe5cf85a03b','f3bc33d7-13c3-41e2-8110-c6a8bada9721','e295a359-63bb-4f81-8ae8-8daa598897fd','36dc6c58-bfca-4607-aa75-8ff2b7bba704','9aa4a9ff-4cd7-4ad2-8a4e-69861b13bfcb')
GO
DELETE FROM Solution_ConstructSolution WHERE ProjectId IN ('a9f58825-e827-4acd-820c-2ea73f2ea649','5e53abb8-c831-44a4-93e8-bfe5cf85a03b','f3bc33d7-13c3-41e2-8110-c6a8bada9721','e295a359-63bb-4f81-8ae8-8daa598897fd','36dc6c58-bfca-4607-aa75-8ff2b7bba704','9aa4a9ff-4cd7-4ad2-8a4e-69861b13bfcb')
GO
DELETE FROM Check_CheckDay WHERE ProjectId IN ('a9f58825-e827-4acd-820c-2ea73f2ea649','5e53abb8-c831-44a4-93e8-bfe5cf85a03b','f3bc33d7-13c3-41e2-8110-c6a8bada9721','e295a359-63bb-4f81-8ae8-8daa598897fd','36dc6c58-bfca-4607-aa75-8ff2b7bba704','9aa4a9ff-4cd7-4ad2-8a4e-69861b13bfcb')
GO

DELETE FROM Check_CheckSpecial WHERE ProjectId IN ('a9f58825-e827-4acd-820c-2ea73f2ea649','5e53abb8-c831-44a4-93e8-bfe5cf85a03b','f3bc33d7-13c3-41e2-8110-c6a8bada9721','e295a359-63bb-4f81-8ae8-8daa598897fd','36dc6c58-bfca-4607-aa75-8ff2b7bba704','9aa4a9ff-4cd7-4ad2-8a4e-69861b13bfcb')
GO
DELETE FROM SecuritySystem_SafetySystem WHERE ProjectId IN ('a9f58825-e827-4acd-820c-2ea73f2ea649','5e53abb8-c831-44a4-93e8-bfe5cf85a03b','f3bc33d7-13c3-41e2-8110-c6a8bada9721','e295a359-63bb-4f81-8ae8-8daa598897fd','36dc6c58-bfca-4607-aa75-8ff2b7bba704','9aa4a9ff-4cd7-4ad2-8a4e-69861b13bfcb')
GO
DELETE FROM SecuritySystem_SafetyInstitution WHERE ProjectId IN ('a9f58825-e827-4acd-820c-2ea73f2ea649','5e53abb8-c831-44a4-93e8-bfe5cf85a03b','f3bc33d7-13c3-41e2-8110-c6a8bada9721','e295a359-63bb-4f81-8ae8-8daa598897fd','36dc6c58-bfca-4607-aa75-8ff2b7bba704','9aa4a9ff-4cd7-4ad2-8a4e-69861b13bfcb')
GO

DELETE FROM QualityAudit_InUnit WHERE ProjectId IN ('a9f58825-e827-4acd-820c-2ea73f2ea649','5e53abb8-c831-44a4-93e8-bfe5cf85a03b','f3bc33d7-13c3-41e2-8110-c6a8bada9721','e295a359-63bb-4f81-8ae8-8daa598897fd','36dc6c58-bfca-4607-aa75-8ff2b7bba704','9aa4a9ff-4cd7-4ad2-8a4e-69861b13bfcb')
GO
DELETE FROM ActionPlan_ManagerRule WHERE ProjectId IN ('a9f58825-e827-4acd-820c-2ea73f2ea649','5e53abb8-c831-44a4-93e8-bfe5cf85a03b','f3bc33d7-13c3-41e2-8110-c6a8bada9721','e295a359-63bb-4f81-8ae8-8daa598897fd','36dc6c58-bfca-4607-aa75-8ff2b7bba704','9aa4a9ff-4cd7-4ad2-8a4e-69861b13bfcb')
GO
DELETE FROM InformationProject_FileCabinetAItem WHERE FileCabinetAId IN (SELECT FileCabinetAId FROM InformationProject_FileCabinetA WHERE ProjectId IN ('a9f58825-e827-4acd-820c-2ea73f2ea649','5e53abb8-c831-44a4-93e8-bfe5cf85a03b','f3bc33d7-13c3-41e2-8110-c6a8bada9721','e295a359-63bb-4f81-8ae8-8daa598897fd','36dc6c58-bfca-4607-aa75-8ff2b7bba704','9aa4a9ff-4cd7-4ad2-8a4e-69861b13bfcb'))
GO
DELETE FROM InformationProject_FileCabinetA WHERE ProjectId IN ('a9f58825-e827-4acd-820c-2ea73f2ea649','5e53abb8-c831-44a4-93e8-bfe5cf85a03b','f3bc33d7-13c3-41e2-8110-c6a8bada9721','e295a359-63bb-4f81-8ae8-8daa598897fd','36dc6c58-bfca-4607-aa75-8ff2b7bba704','9aa4a9ff-4cd7-4ad2-8a4e-69861b13bfcb')
GO
DELETE FROM Project_ProjectUser WHERE ProjectId IN ('a9f58825-e827-4acd-820c-2ea73f2ea649','5e53abb8-c831-44a4-93e8-bfe5cf85a03b','f3bc33d7-13c3-41e2-8110-c6a8bada9721','e295a359-63bb-4f81-8ae8-8daa598897fd','36dc6c58-bfca-4607-aa75-8ff2b7bba704','9aa4a9ff-4cd7-4ad2-8a4e-69861b13bfcb')
GO
DELETE FROM Project_ProjectUnit WHERE ProjectId IN ('a9f58825-e827-4acd-820c-2ea73f2ea649','5e53abb8-c831-44a4-93e8-bfe5cf85a03b','f3bc33d7-13c3-41e2-8110-c6a8bada9721','e295a359-63bb-4f81-8ae8-8daa598897fd','36dc6c58-bfca-4607-aa75-8ff2b7bba704','9aa4a9ff-4cd7-4ad2-8a4e-69861b13bfcb')
GO
DELETE FROM Check_ProjectCheckItemDetail WHERE CheckItemSetId IN (SELECT CheckItemSetId FROM Check_ProjectCheckItemSet WHERE ProjectId IN ('a9f58825-e827-4acd-820c-2ea73f2ea649','5e53abb8-c831-44a4-93e8-bfe5cf85a03b','f3bc33d7-13c3-41e2-8110-c6a8bada9721','e295a359-63bb-4f81-8ae8-8daa598897fd','36dc6c58-bfca-4607-aa75-8ff2b7bba704','9aa4a9ff-4cd7-4ad2-8a4e-69861b13bfcb'))
GO

DELETE FROM Check_ProjectCheckItemSet WHERE ProjectId IN ('a9f58825-e827-4acd-820c-2ea73f2ea649','5e53abb8-c831-44a4-93e8-bfe5cf85a03b','f3bc33d7-13c3-41e2-8110-c6a8bada9721','e295a359-63bb-4f81-8ae8-8daa598897fd','36dc6c58-bfca-4607-aa75-8ff2b7bba704','9aa4a9ff-4cd7-4ad2-8a4e-69861b13bfcb')
GO
DELETE FROM Manager_HSSELog WHERE ProjectId IN ('a9f58825-e827-4acd-820c-2ea73f2ea649','5e53abb8-c831-44a4-93e8-bfe5cf85a03b','f3bc33d7-13c3-41e2-8110-c6a8bada9721','e295a359-63bb-4f81-8ae8-8daa598897fd','36dc6c58-bfca-4607-aa75-8ff2b7bba704','9aa4a9ff-4cd7-4ad2-8a4e-69861b13bfcb')
GO
DELETE FROM InformationProject_ReceiveFileManager WHERE ProjectId IN ('a9f58825-e827-4acd-820c-2ea73f2ea649','5e53abb8-c831-44a4-93e8-bfe5cf85a03b','f3bc33d7-13c3-41e2-8110-c6a8bada9721','e295a359-63bb-4f81-8ae8-8daa598897fd','36dc6c58-bfca-4607-aa75-8ff2b7bba704','9aa4a9ff-4cd7-4ad2-8a4e-69861b13bfcb')
GO
DELETE FROM Base_Project WHERE ProjectId IN ('a9f58825-e827-4acd-820c-2ea73f2ea649','5e53abb8-c831-44a4-93e8-bfe5cf85a03b','f3bc33d7-13c3-41e2-8110-c6a8bada9721','e295a359-63bb-4f81-8ae8-8daa598897fd','36dc6c58-bfca-4607-aa75-8ff2b7bba704','9aa4a9ff-4cd7-4ad2-8a4e-69861b13bfcb')
GO
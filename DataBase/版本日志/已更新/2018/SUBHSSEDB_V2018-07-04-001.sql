UPDATE Sys_MenuCommon SET MenuName='项目安全文件上报' WHERE MenuId='306A1C97-B6B1-4AE4-AFC1-6933E821C129'
GO
UPDATE Sys_MenuProjectA SET MenuName='项目安全文件上报' WHERE MenuId='BD16BE8D-0F4D-4C80-A4D7-707156B541B8'
GO
UPDATE Sys_MenuProjectB SET MenuName='项目安全文件上报' WHERE MenuId='BD16BE8D-0F4D-4C80-A4D7-707156B541B8'
GO

/**********安全生产数据季报**********/
ALTER  PROCEDURE [dbo].[Sp_Information_SafetyQuarterlyReport]
 @SafetyQuarterlyReportId nvarchar(50)
AS
SELECT S.SafetyQuarterlyReportId
,S.UnitId
,((CAST (S.YearId AS NVARCHAR(20))) + '年' + (CASE S.Quarters
WHEN '1' THEN '第一季度'
WHEN '2' THEN '第二季度'
WHEN '3' THEN '第三季度'
WHEN '4' THEN '第四季度'
END )) AS YQ
,S.TotalInWorkHours
,S.TotalInWorkHoursRemark
,S.TotalOutWorkHours
,S.TotalOutWorkHoursRemark
,S.WorkHoursLossRate
,S.WorkHoursLossRateRemark
,S.WorkHoursAccuracy
,S.WorkHoursAccuracyRemark
,CAST(S.MainBusinessIncome AS nvarchar(15)) AS MainBusinessIncome
,S.MainBusinessIncomeRemark
,CAST(S.ConstructionRevenue AS nvarchar(15)) AS ConstructionRevenue
,S.ConstructionRevenueRemark
,CAST(S.UnitTimeIncome AS nvarchar(15)) AS UnitTimeIncome
,S.UnitTimeIncomeRemark
,S.BillionsOutputMortality
,S.BillionsOutputMortalityRemark
,S.MajorFireAccident
,S.MajorFireAccidentRemark
,S.MajorEquipAccident
,S.MajorEquipAccidentRemark
,S.AccidentFrequency
,S.AccidentFrequencyRemark
,S.SeriousInjuryAccident
,S.SeriousInjuryAccidentRemark
,S.FireAccident
,S.FireAccidentRemark
,S.EquipmentAccident
,S.EquipmentAccidentRemark
,S.PoisoningAndInjuries
,S.PoisoningAndInjuriesRemark
,S.ProductionSafetyInTotal
,S.ProductionSafetyInTotalRemark
,CAST(S.ProtectionInput AS nvarchar(15)) AS ProtectionInput
,S.ProtectionInputRemark
,CAST(S.LaboAndHealthIn AS nvarchar(15)) AS LaboAndHealthIn
,S.LaborAndHealthInRemark
,CAST(S.TechnologyProgressIn AS nvarchar(15)) AS TechnologyProgressIn
,S.TechnologyProgressInRemark
,CAST(S.EducationTrainIn AS nvarchar(15)) AS EducationTrainIn
,S.EducationTrainInRemark
,S.ProjectCostRate
,S.ProjectCostRateRemark
,CAST(S.ProductionInput AS nvarchar(15)) AS ProductionInput
,S.ProductionInputRemark
,S.Revenue
,S.RevenueRemark
,S.FullTimeMan
,S.FullTimeManRemark
,S.FullTimeManAttachUrl
,S.PMMan
,S.PMManRemark
,S.PMManAttachUrl
,S.CorporateDirectorEdu
,S.CorporateDirectorEduRemark
,S.ProjectLeaderEdu
,S.ProjectLeaderEduRemark
,S.FullTimeEdu
,S.FullTimeEduRemark
,S.ThreeKidsEduRate
,S.ThreeKidsEduRateRemark
,S.UplinReportRate
,S.UplinReportRateRemark
,S.Remarks
,S.FillingDate
,S.CompileMan
,S.UpState
,S.HandleState
,S.HandleMan
,S.KeyEquipmentTotal
,S.KeyEquipmentTotalRemark
,S.KeyEquipmentReportCount
,S.KeyEquipmentReportCountRemark
,S.ChemicalAreaProjectCount
,S.ChemicalAreaProjectCountRemark
,S.HarmfulMediumCoverCount
,S.HarmfulMediumCoverCountRemark
,S.HarmfulMediumCoverRate
,S.HarmfulMediumCoverRateRemark
,U.UnitName
FROM dbo.Information_SafetyQuarterlyReport AS S
LEFT JOIN dbo.Base_Unit AS U ON U.UnitId = S.UnitId
WHERE S.SafetyQuarterlyReportId = @SafetyQuarterlyReportId




GO



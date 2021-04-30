INSERT INTO Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('A9187195-BED4-4C02-8CD5-D3FFD132A401','6','项目现场百万工时安全统计月报',6,'Report')
INSERT INTO Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('F402D196-891E-45A7-B160-DF9D0EA131F4','7','项目现场职工伤亡事故原因分析',7,'Report')
INSERT INTO Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('EDCEED08-93DE-483B-89C8-3C33BC2297BE','8','项目现场安全生产数据季报',8,'Report')
INSERT INTO Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('70A69D64-1CF4-4342-9C32-5F26645C4491','9','项目现场应急演练开展情况季报',9,'Report')
INSERT INTO Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('2831174B-B9D5-4291-B59F-48FF32DF5861','10','项目现场应急演练工作计划半年报表',10,'Report')
GO
/**********项目现场百万工时安全统计月报**********/
CREATE PROCEDURE [dbo].[Sp_InformationProject_MillionsMonthlyReport]
 @MillionsMonthlyReportId nvarchar(50)
AS
SELECT MillionsMonthlyReport.MillionsMonthlyReportId
,ROW_NUMBER() OVER (ORDER BY MillionsMonthlyReport.MillionsMonthlyReportId ASC) AS Num
,MillionsMonthlyReport.ProjectId
,((CAST (MillionsMonthlyReport.Year AS NVARCHAR(20))) + '年' + (CAST(MillionsMonthlyReport.Month AS NVARCHAR(20))) + '月') AS YE
,MillionsMonthlyReport.CompileMan
,MillionsMonthlyReport.CompileDate
,MillionsMonthlyReport.States
,MillionsMonthlyReport.Affiliation
,MillionsMonthlyReport.Name
,MillionsMonthlyReport.PostPersonNum
,MillionsMonthlyReport.SnapPersonNum
,MillionsMonthlyReport.ContractorNum
,MillionsMonthlyReport.SumPersonNum
,MillionsMonthlyReport.TotalWorkNum
,MillionsMonthlyReport.SeriousInjuriesNum
,MillionsMonthlyReport.SeriousInjuriesPersonNum
,MillionsMonthlyReport.SeriousInjuriesLossHour
,MillionsMonthlyReport.MinorAccidentNum
,MillionsMonthlyReport.MinorAccidentPersonNum
,MillionsMonthlyReport.MinorAccidentLossHour
,MillionsMonthlyReport.OtherAccidentNum
,MillionsMonthlyReport.OtherAccidentPersonNum
,MillionsMonthlyReport.OtherAccidentLossHour
,MillionsMonthlyReport.RestrictedWorkPersonNum
,MillionsMonthlyReport.RestrictedWorkLossHour
,MillionsMonthlyReport.MedicalTreatmentPersonNum
,MillionsMonthlyReport.MedicalTreatmentLossHour
,MillionsMonthlyReport.FireNum
,MillionsMonthlyReport.ExplosionNum
,MillionsMonthlyReport.TrafficNum
,MillionsMonthlyReport.EquipmentNum
,MillionsMonthlyReport.QualityNum
,MillionsMonthlyReport.OtherNum
,MillionsMonthlyReport.FirstAidDressingsNum
,MillionsMonthlyReport.AttemptedEventNum
,MillionsMonthlyReport.LossDayNum
FROM dbo.InformationProject_MillionsMonthlyReport AS MillionsMonthlyReport
WHERE MillionsMonthlyReport.MillionsMonthlyReportId = @MillionsMonthlyReportId

GO

/**********项目现场职工伤亡事故原因分析主表**********/
CREATE PROCEDURE [dbo].[Sp_InformationProject_AccidentCauseReport]
 @AccidentCauseReportId nvarchar(50)
AS
SELECT AccidentCauseReport.AccidentCauseReportId
, AccidentCauseReport.ProjectId
, AccidentCauseReport.UnitId
, AccidentCauseReport.AccidentCauseReportCode
, AccidentCauseReport.Year
, ((CAST (AccidentCauseReport.Month AS NVARCHAR(10)))+'月') AS Month
, ((CAST((AccidentCauseReport.Month-1) AS NVARCHAR(10)))+'月') AS LastMonth
, AccidentCauseReport.DeathAccident
, AccidentCauseReport.DeathToll
, AccidentCauseReport.InjuredAccident
, AccidentCauseReport.InjuredToll
, AccidentCauseReport.MinorWoundAccident
, AccidentCauseReport.MinorWoundToll
, AccidentCauseReport.AverageTotalHours
, AccidentCauseReport.AverageManHours
, AccidentCauseReport.TotalLossMan
, AccidentCauseReport.LastMonthLossHoursTotal
, AccidentCauseReport.KnockOffTotal
, AccidentCauseReport.DirectLoss
, AccidentCauseReport.IndirectLosses
, AccidentCauseReport.TotalLoss
, AccidentCauseReport.TotalLossTime
, AccidentCauseReport.CompileMan
, AccidentCauseReport.CompileDate
, AccidentCauseReport.States
, Unit.UnitName
, U.UserName
FROM dbo.InformationProject_AccidentCauseReport	AS AccidentCauseReport
LEFT JOIN dbo.Base_Unit	AS Unit ON Unit.UnitId = AccidentCauseReport.UnitId 
LEFT JOIN dbo.Sys_User AS U ON U.UserId = AccidentCauseReport.CompileMan
WHERE AccidentCauseReport.AccidentCauseReportId = @AccidentCauseReportId

GO

/**********项目现场职工伤亡事故原因分析明细表**********/
CREATE PROCEDURE [dbo].[Sp_InformationProject_AccidentCauseReportItem]
 @AccidentCauseReportId nvarchar(50)
AS
SELECT AccidentCauseReportItem.AccidentCauseReportItemId
, AccidentCauseReportItem.AccidentCauseReportId
, AccidentCauseReportItem.AccidentType
, AccidentCauseReportItem.TotalDeath
, AccidentCauseReportItem.TotalInjuries
, AccidentCauseReportItem.TotalMinorInjuries
, AccidentCauseReportItem.Death1
, AccidentCauseReportItem.Injuries1
, AccidentCauseReportItem.MinorInjuries1
, AccidentCauseReportItem.Death2
, AccidentCauseReportItem.Injuries2
, AccidentCauseReportItem.MinorInjuries2
, AccidentCauseReportItem.Death3
, AccidentCauseReportItem.Injuries3
, AccidentCauseReportItem.MinorInjuries3
, AccidentCauseReportItem.Death4
, AccidentCauseReportItem.Injuries4
, AccidentCauseReportItem.MinorInjuries4
, AccidentCauseReportItem.Death5
, AccidentCauseReportItem.Injuries5
, AccidentCauseReportItem.MinorInjuries5
, AccidentCauseReportItem.Death6
, AccidentCauseReportItem.Injuries6
, AccidentCauseReportItem.MinorInjuries6
, AccidentCauseReportItem.Death7
, AccidentCauseReportItem.Injuries7
, AccidentCauseReportItem.MinorInjuries7
, AccidentCauseReportItem.Death8
, AccidentCauseReportItem.Injuries8
, AccidentCauseReportItem.MinorInjuries8
, AccidentCauseReportItem.Death9
, AccidentCauseReportItem.Injuries9
, AccidentCauseReportItem.MinorInjuries9
, AccidentCauseReportItem.Death10
, AccidentCauseReportItem.Injuries10
, AccidentCauseReportItem.MinorInjuries10
, AccidentCauseReportItem.Death11
, AccidentCauseReportItem.Injuries11
, AccidentCauseReportItem.MinorInjuries11
FROM dbo.InformationProject_AccidentCauseReportItem	AS AccidentCauseReportItem
WHERE AccidentCauseReportItem.AccidentCauseReportId = @AccidentCauseReportId

GO

/**********项目现场安全生产数据季报**********/
CREATE PROCEDURE [dbo].[Sp_InformationProject_SafetyQuarterlyReport]
 @SafetyQuarterlyReportId nvarchar(50)
AS
SELECT SafetyQuarterlyReport.SafetyQuarterlyReportId
,SafetyQuarterlyReport.ProjectId
,SafetyQuarterlyReport.UnitId
,SafetyQuarterlyReport.YearId
,SafetyQuarterlyReport.Quarters
,((CAST (SafetyQuarterlyReport.YearId AS NVARCHAR(20))) + '年' + (CASE SafetyQuarterlyReport.Quarters
WHEN '1' THEN '第一季度'
WHEN '2' THEN '第二季度'
WHEN '3' THEN '第三季度'
WHEN '4' THEN '第四季度'
END )) AS YQ
,SafetyQuarterlyReport.TotalInWorkHours
,SafetyQuarterlyReport.TotalInWorkHoursRemark
,SafetyQuarterlyReport.TotalOutWorkHours
,SafetyQuarterlyReport.TotalOutWorkHoursRemark
,SafetyQuarterlyReport.WorkHoursLossRate
,SafetyQuarterlyReport.WorkHoursLossRateRemark
,SafetyQuarterlyReport.WorkHoursAccuracy
,SafetyQuarterlyReport.WorkHoursAccuracyRemark
,SafetyQuarterlyReport.MainBusinessIncome
,SafetyQuarterlyReport.MainBusinessIncomeRemark
,SafetyQuarterlyReport.ConstructionRevenue
,SafetyQuarterlyReport.ConstructionRevenueRemark
,SafetyQuarterlyReport.UnitTimeIncome
,SafetyQuarterlyReport.UnitTimeIncomeRemark
,SafetyQuarterlyReport.BillionsOutputMortality
,SafetyQuarterlyReport.BillionsOutputMortalityRemark
,SafetyQuarterlyReport.MajorFireAccident
,SafetyQuarterlyReport.MajorFireAccidentRemark
,SafetyQuarterlyReport.MajorEquipAccident
,SafetyQuarterlyReport.MajorEquipAccidentRemark
,SafetyQuarterlyReport.AccidentFrequency
,SafetyQuarterlyReport.AccidentFrequencyRemark
,SafetyQuarterlyReport.SeriousInjuryAccident
,SafetyQuarterlyReport.SeriousInjuryAccidentRemark
,SafetyQuarterlyReport.FireAccident
,SafetyQuarterlyReport.FireAccidentRemark
,SafetyQuarterlyReport.EquipmentAccident
,SafetyQuarterlyReport.EquipmentAccidentRemark
,SafetyQuarterlyReport.PoisoningAndInjuries
,SafetyQuarterlyReport.PoisoningAndInjuriesRemark
,SafetyQuarterlyReport.ProductionSafetyInTotal
,SafetyQuarterlyReport.ProductionSafetyInTotalRemark
,SafetyQuarterlyReport.ProtectionInput
,SafetyQuarterlyReport.ProtectionInputRemark
,SafetyQuarterlyReport.LaboAndHealthIn
,SafetyQuarterlyReport.LaborAndHealthInRemark
,SafetyQuarterlyReport.TechnologyProgressIn
,SafetyQuarterlyReport.TechnologyProgressInRemark
,SafetyQuarterlyReport.EducationTrainIn
,SafetyQuarterlyReport.EducationTrainInRemark
,SafetyQuarterlyReport.ProjectCostRate
,SafetyQuarterlyReport.ProjectCostRateRemark
,SafetyQuarterlyReport.ProductionInput
,SafetyQuarterlyReport.ProductionInputRemark
,SafetyQuarterlyReport.Revenue
,SafetyQuarterlyReport.RevenueRemark
,SafetyQuarterlyReport.FullTimeMan
,SafetyQuarterlyReport.FullTimeManRemark
,SafetyQuarterlyReport.FullTimeManAttachUrl
,SafetyQuarterlyReport.PMMan
,SafetyQuarterlyReport.PMManRemark
,SafetyQuarterlyReport.PMManAttachUrl
,SafetyQuarterlyReport.CorporateDirectorEdu
,SafetyQuarterlyReport.CorporateDirectorEduRemark
,SafetyQuarterlyReport.ProjectLeaderEdu
,SafetyQuarterlyReport.ProjectLeaderEduRemark
,SafetyQuarterlyReport.FullTimeEdu
,SafetyQuarterlyReport.FullTimeEduRemark
,SafetyQuarterlyReport.ThreeKidsEduRate
,SafetyQuarterlyReport.ThreeKidsEduRateRemark
,SafetyQuarterlyReport.UplinReportRate
,SafetyQuarterlyReport.UplinReportRateRemark
,SafetyQuarterlyReport.Remarks
,SafetyQuarterlyReport.KeyEquipmentTotal
,SafetyQuarterlyReport.KeyEquipmentTotalRemark
,SafetyQuarterlyReport.KeyEquipmentReportCount
,SafetyQuarterlyReport.KeyEquipmentReportCountRemark
,SafetyQuarterlyReport.ChemicalAreaProjectCount
,SafetyQuarterlyReport.ChemicalAreaProjectCountRemark
,SafetyQuarterlyReport.HarmfulMediumCoverCount
,SafetyQuarterlyReport.HarmfulMediumCoverCountRemark
,SafetyQuarterlyReport.HarmfulMediumCoverRate
,SafetyQuarterlyReport.HarmfulMediumCoverRateRemark
,SafetyQuarterlyReport.CompileMan
,SafetyQuarterlyReport.CompileDate
,SafetyQuarterlyReport.States
,Unit.UnitName
,U.UserName
FROM dbo.InformationProject_SafetyQuarterlyReport AS SafetyQuarterlyReport
LEFT JOIN Base_Unit AS Unit ON Unit.UnitId = SafetyQuarterlyReport.UnitId
LEFT JOIN Sys_User AS U ON U.UserId = SafetyQuarterlyReport.CompileMan
WHERE SafetyQuarterlyReport.SafetyQuarterlyReportId = @SafetyQuarterlyReportId


GO
/************项目现场应急演练开展情况季报主表******************/
CREATE PROCEDURE [dbo].[Sp_InformationProject_DrillConductedQuarterlyReport]
 @DrillConductedQuarterlyReportId nvarchar(50)
AS
SELECT Drill.DrillConductedQuarterlyReportId
,Drill.ProjectId
,Drill.UnitId
,(CAST (Drill.YearId AS NVARCHAR(20)) + '年' + (CASE Drill.Quarter 
WHEN '1' THEN '第一季度' 
WHEN '2' THEN '第二季度'
WHEN '3' THEN '第三季度'
WHEN '4' THEN '第四季度'
END)) AS Quarters
,Drill.CompileMan
,Drill.CompileDate
,Unit.UnitName
,U.UserName
,SUM(Item.TotalConductCount) AS SumTotalConductCount
,SUM(Item.TotalPeopleCount) AS SumTotalPeopleCount
,SUM(Item.TotalInvestment) AS SumTotalInvestment
,SUM(Item.HQConductCount) AS SumHQConductCount
,SUM(Item.HQPeopleCount) AS SumHQPeopleCount
,SUM(Item.HQInvestment) AS SumHQInvestment
,SUM(Item.BasicConductCount) AS SumBasicConductCount
,SUM(Item.BasicPeopleCount) AS SumBasicPeopleCount
,SUM(Item.BasicInvestment) AS SumBasicInvestment
FROM InformationProject_DrillConductedQuarterlyReport AS Drill
LEFT JOIN InformationProject_DrillConductedQuarterlyReportItem AS Item ON Item.DrillConductedQuarterlyReportId = Drill.DrillConductedQuarterlyReportId
LEFT JOIN Base_Unit AS Unit ON Unit.UnitId = Drill.UnitId
LEFT JOIN Sys_User AS U ON U.UserId = Drill.CompileMan
WHERE Drill.DrillConductedQuarterlyReportId = @DrillConductedQuarterlyReportId
GROUP BY Drill.DrillConductedQuarterlyReportId
,Drill.ProjectId
,Drill.UnitId
,Drill.YearId
,Drill.Quarter
,Drill.CompileMan
,Drill.CompileDate
,Unit.UnitName
,U.UserName
GO

/************项目现场应急演练开展情况季报明细表******************/
CREATE PROCEDURE [dbo].[Sp_InformationProject_DrillConductedQuarterlyReportItem]
 @DrillConductedQuarterlyReportId nvarchar(50)
AS
SELECT Item.DrillConductedQuarterlyReportItemId
,ROW_NUMBER() OVER (ORDER BY Item.DrillConductedQuarterlyReportItemId) AS Number
,Item.DrillConductedQuarterlyReportId
,Item.IndustryType
,Item.TotalConductCount
,Item.TotalPeopleCount
,Item.TotalInvestment
,Item.HQConductCount
,Item.HQPeopleCount
,Item.HQInvestment
,Item.BasicConductCount
,Item.BasicPeopleCount
,Item.BasicInvestment
,Item.ComprehensivePractice
,Item.CPScene
,Item.CPDesktop
,Item.SpecialDrill
,Item.SDScene
,Item.SDDesktop
,Item.SortIndex
FROM dbo.InformationProject_DrillConductedQuarterlyReportItem AS Item
LEFT JOIN dbo.InformationProject_DrillConductedQuarterlyReport AS Drill ON Drill.DrillConductedQuarterlyReportId = Item.DrillConductedQuarterlyReportId
WHERE Item.DrillConductedQuarterlyReportId = @DrillConductedQuarterlyReportId 

GO

/************项目现场应急演练工作计划半年报主表******************/
CREATE PROCEDURE [dbo].[Sp_InformationProject_DrillPlanHalfYearReport]
 @DrillPlanHalfYearReportId nvarchar(50)
AS
SELECT Drill.DrillPlanHalfYearReportId
, Drill.ProjectId
, Drill.UnitId
, Drill.YearId
, Drill.HalfYearId
,(CAST(Drill.YearId as NVARCHAR(20)) + '年' + (CASE Drill.HalfYearId
 WHEN '1' THEN '上半年' 
ELSE '下半年' END)) AS HalfYear
, Drill.Telephone
, Drill.CompileMan
, Drill.CompileDate
, Drill.States
, Unit.UnitName
FROM dbo.InformationProject_DrillPlanHalfYearReport	AS Drill
LEFT JOIN Base_Unit AS Unit ON Unit.UnitId = Drill.UnitId
WHERE Drill.DrillPlanHalfYearReportId = @DrillPlanHalfYearReportId

GO

/************项目现场应急演练工作计划半年报明细表******************/
CREATE PROCEDURE [dbo].[Sp_InformationProject_DrillPlanHalfYearReportItem]
 @DrillPlanHalfYearReportId nvarchar(50)
AS
SELECT Item.DrillPlanHalfYearReportItemId
,ROW_NUMBER() OVER(ORDER BY Item.DrillPlanHalfYearReportItemId) AS Number
, Item.DrillPlanHalfYearReportId
, Item.DrillPlanName
, Item.OrganizationUnit
, Item.DrillPlanDate
, Item.AccidentScene
, Item.ExerciseWay
, Item.SortIndex
FROM dbo.InformationProject_DrillPlanHalfYearReportItem AS Item
WHERE Item.DrillPlanHalfYearReportId = @DrillPlanHalfYearReportId
 GO

ALTER TABLE [dbo].[QualityAudit_SubUnitQuality] DROP CONSTRAINT [FK_QualityAudit_SubUnitQuality_Base_Project]
GO

ALTER TABLE QualityAudit_SubUnitQuality DROP COLUMN ProjectId
GO

alter table dbo.QualityAudit_ProjectRecord add UnitId nvarchar(50) null
GO
alter table dbo.QualityAudit_ProjectRecord add constraint FK_QualityAudit_ProjectRecord_Base_Unit
foreign key (UnitId) references Base_Unit (UnitId)
GO
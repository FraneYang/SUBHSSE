
/*************企业百万工时安全统计月报表**************/
ALTER VIEW [dbo].[View_Information_MillionsMonthlyReport]
AS
SELECT 
Report.MillionsMonthlyReportId,
Report.UnitId,
Report.FillingDate,
Report.UpState,
(ISNULL(Group_0008.ConstText,'-') + ISNULL(Group_0009.ConstText,'-')) AS ReportDate,
Group_0008.ConstText as YearStr,
Group_0009.ConstText as MonthStr,
U.UnitName,
Report.Year,
Report.Month,
Report.DutyPerson,
Report.RecordableIncidentRate,
Report.LostTimeRate,
Report.LostTimeInjuryRate,
Report.DeathAccidentFrequency,
Report.AccidentMortality,
Report.HandleState,
Report.HandleMan,
US.UserName
FROM dbo.Information_MillionsMonthlyReport AS Report
LEFT JOIN Base_Unit AS U ON U.UnitId=Report.UnitId
LEFT JOIN Sys_Const  AS Group_0008 ON Group_0008.GroupId='0008' AND Group_0008.ConstValue =Report.[Year]
LEFT JOIN Sys_Const  AS Group_0009 ON Group_0009.GroupId='0009' AND Group_0009.ConstValue =Report.[Month]
LEFT JOIN Sys_User AS US ON US.UserId=Report.HandleMan






GO



/*******职工伤亡事故原因分析报表*********/
ALTER VIEW [dbo].[View_Information_AccidentCauseReport]
AS
SELECT S.AccidentCauseReportId,
S.UnitId,
U.UnitName,
S.FillingDate,
(ISNULL(Group_0008.ConstText,'-') + ISNULL(Group_0009.ConstText,'-')) AS ReportDate,
Group_0008.ConstText as YearStr,
Group_0009.ConstText as MonthStr,
S.AccidentCauseReportCode,
S.Year,
S.Month,
S.DeathAccident,
S.DeathToll,
S.InjuredAccident,
S.InjuredToll,
S.MinorWoundAccident,
S.MinorWoundToll,
S.AverageTotalHours,
S.AverageManHours,
S.TotalLossMan,
S.LastMonthLossHoursTotal,
S.KnockOffTotal,
S.DirectLoss,
S.IndirectLosses,
S.TotalLoss,
S.TotalLossTime,
S.FillCompanyPersonCharge,
S.TabPeople,
S.AuditPerson,
S.UpState,
S.HandleState,
US.UserName
FROM dbo.Information_AccidentCauseReport AS S
LEFT JOIN Base_Unit AS U ON U.UnitId=S.UnitId
LEFT JOIN Sys_Const  AS Group_0008 ON Group_0008.GroupId='0008' AND Group_0008.ConstValue =S.[Year]
LEFT JOIN Sys_Const  AS Group_0009 ON Group_0009.GroupId='0009' AND Group_0009.ConstValue =S.[Month]
LEFT JOIN Sys_User AS US ON US.UserId=S.HandleMan








GO



ALTER VIEW [dbo].[View_Information_DrillConductedQuarterlyReport]  AS 
SELECT 
	Report.DrillConductedQuarterlyReportId, 
	Report.UnitId, 
	Report.ReportDate,
	Report.YearId,
	Report.Quarter,
	Report.UpState,
	Report.HandleState,
	(ISNULL(Group_0008.ConstText,'-') + ISNULL(Group_0011.ConstText,'-')) AS Quarters,
	u.UnitName,
	Report.HandleMan,
	US.UserName
FROM dbo.Information_DrillConductedQuarterlyReport AS Report
LEFT JOIN Sys_Const  AS Group_0008 ON Group_0008.GroupId='0008' AND Group_0008.ConstValue =Report.YearId
LEFT JOIN Sys_Const  AS Group_0011 ON Group_0011.GroupId='0011' AND Group_0011.ConstValue =Report.Quarter
Left join Base_Unit as u on u.UnitId=Report.UnitId
LEFT JOIN Sys_User AS US ON US.UserId=Report.HandleMan








GO


/***********应急演练开展情况季报*********/
ALTER VIEW [dbo].[View_Information_DrillConductedQuarterlyReportItem]
AS
SELECT ReportItem.DrillConductedQuarterlyReportItemId
, ReportItem.DrillConductedQuarterlyReportId
, ReportItem.IndustryType
, ReportItem.TotalConductCount
, ReportItem.TotalPeopleCount
, ReportItem.TotalInvestment
, ReportItem.HQConductCount
, ReportItem.HQPeopleCount
, ReportItem.HQInvestment
, ReportItem.BasicConductCount
, ReportItem.BasicPeopleCount
, ReportItem.BasicInvestment
, ReportItem.ComprehensivePractice
, ReportItem.CPScene
, ReportItem.CPDesktop
, ReportItem.SpecialDrill
, ReportItem.SDScene
, ReportItem.SDDesktop
, ReportItem.SortIndex
,Report.UnitId
,Report.ReportDate
,Report.Quarter
,Report.YearId
,Report.CompileMan
,Report.UpState
,Report.HandleState
,Report.HandleMan
,U.UnitName
FROM dbo.Information_DrillConductedQuarterlyReportItem AS ReportItem
LEFT JOIN dbo.Information_DrillConductedQuarterlyReport AS Report ON Report.DrillConductedQuarterlyReportId=ReportItem.DrillConductedQuarterlyReportId
LEFT JOIN dbo.Base_Unit AS U ON U.UnitId =Report.UnitId





GO


ALTER VIEW [dbo].[View_Information_DrillPlanHalfYearReport]
AS
SELECT 
DrillPlanHalfYearReportId, 
Report.UnitId,
Report.CompileMan,
Report.CompileDate,
Report.Telephone,
Report.YearId,
Report.HalfYearId,
Report.UpState,
Report.HandleState,
(ISNULL(Group_0008.ConstText,'-') + ISNULL(Group_0010.ConstText,'-')) AS Years,
u.UnitName,
us.UserName,
Report.HandleMan,
USR.UserName AS HandleManName
FROM dbo.Information_DrillPlanHalfYearReport AS Report
left join Base_Unit as u on u.UnitId = Report.UnitId
left join Sys_User as us on us.UserId = Report.CompileMan
LEFT JOIN Sys_User AS USR ON US.UserId = Report.HandleMan
LEFT JOIN Sys_Const  AS Group_0008 ON Group_0008.GroupId='0008' AND Group_0008.ConstValue =Report.YearId
LEFT JOIN Sys_Const  AS Group_0010 ON Group_0010.GroupId='0010' AND Group_0010.ConstValue =Report.HalfYearId












GO


/***********应急演练工作计划半年报明细表*********/
ALTER VIEW [dbo].[View_Information_DrillPlanHalfYearReportItem]
AS
SELECT ReportItem.DrillPlanHalfYearReportItemId
, ReportItem.DrillPlanHalfYearReportId
, ReportItem.DrillPlanName
, ReportItem.OrganizationUnit
, ReportItem.DrillPlanDate
, ReportItem.AccidentScene
, ReportItem.ExerciseWay
, ReportItem.SortIndex
,Report.UnitId
,Report.CompileMan
,Report.CompileDate
,Report.YearId
,Report.HalfYearId
,Report.Telephone
,Report.UpState
,Report.HandleState
,Report.HandleMan
,U.UnitName
FROM dbo.Information_DrillPlanHalfYearReportItem AS ReportItem
LEFT JOIN dbo.Information_DrillPlanHalfYearReport AS Report ON Report.DrillPlanHalfYearReportId=ReportItem.DrillPlanHalfYearReportId
LEFT JOIN dbo.Base_Unit AS U ON U.UnitId =Report.UnitId




GO


/*************安全生产数据季报**************/
ALTER VIEW [dbo].[View_Information_SafetyQuarterlyReport]
AS
SELECT 
Report.SafetyQuarterlyReportId,
Report.UnitId,
Report.YearId,
Report.Quarters,
Report.UpState,
Group_0011.ConstText as QuartersStr,
U.UnitName,
Report.TotalInWorkHours,
Report.TotalInWorkHoursRemark,
Report.TotalOutWorkHours,
Report.TotalOutWorkHoursRemark,
Report.WorkHoursLossRate,
Report.WorkHoursLossRateRemark,
Report.WorkHoursAccuracy,
Report.WorkHoursAccuracyRemark,
Report.MainBusinessIncome,
Report.MainBusinessIncomeRemark,
Report.ConstructionRevenue,
Report.ConstructionRevenueRemark,
Report.UnitTimeIncome,
Report.UnitTimeIncomeRemark,
Report.BillionsOutputMortality,
Report.BillionsOutputMortalityRemark,
Report.MajorFireAccident,
Report.MajorFireAccidentRemark,
Report.MajorEquipAccident,
Report.MajorEquipAccidentRemark,
Report.AccidentFrequency,
Report.AccidentFrequencyRemark,
Report.SeriousInjuryAccident,
Report.SeriousInjuryAccidentRemark,
Report.FireAccident,
Report.FireAccidentRemark,
Report.EquipmentAccident,
Report.EquipmentAccidentRemark,
Report.PoisoningAndInjuries,
Report.PoisoningAndInjuriesRemark,
Report.ProductionSafetyInTotal,
Report.ProductionSafetyInTotalRemark,
Report.ProtectionInput,
Report.ProtectionInputRemark,
Report.LaboAndHealthIn,
Report.LaborAndHealthInRemark,
Report.TechnologyProgressIn,
Report.TechnologyProgressInRemark,
Report.EducationTrainIn,
Report.EducationTrainInRemark,
Report.ProjectCostRate,
Report.ProjectCostRateRemark,
Report.ProductionInput,
Report.ProductionInputRemark,
Report.Revenue,
Report.RevenueRemark,
Report.FullTimeMan,
Report.FullTimeManRemark,
Report.FullTimeManAttachUrl,
Report.PMMan,
Report.PMManRemark,
Report.PMManAttachUrl,
Report.CorporateDirectorEdu,
Report.CorporateDirectorEduRemark,
Report.ProjectLeaderEdu,
Report.ProjectLeaderEduRemark,
Report.FullTimeEdu,
Report.FullTimeEduRemark,
Report.ThreeKidsEduRate,
Report.ThreeKidsEduRateRemark,
Report.UplinReportRate,
Report.UplinReportRateRemark,
Report.Remarks,
Report.FillingDate,
Report.KeyEquipmentTotal,
Report.KeyEquipmentTotalRemark,
Report.KeyEquipmentReportCount,
Report.KeyEquipmentReportCountRemark,
Report.ChemicalAreaProjectCount,
Report.ChemicalAreaProjectCountRemark,
Report.HarmfulMediumCoverCount,
Report.HarmfulMediumCoverCountRemark,
Report.HarmfulMediumCoverRate,
Report.HarmfulMediumCoverRateRemark,
Report.HandleState,
Report.HandleMan,
US.UserName
FROM dbo.Information_SafetyQuarterlyReport AS Report
LEFT JOIN Base_Unit AS U ON U.UnitId=Report.UnitId
LEFT JOIN Sys_Const  AS Group_0011 ON Group_0011.GroupId='0011' AND Group_0011.ConstValue =Report.Quarters
LEFT JOIN Sys_User AS US ON US.UserId=Report.HandleMan









GO



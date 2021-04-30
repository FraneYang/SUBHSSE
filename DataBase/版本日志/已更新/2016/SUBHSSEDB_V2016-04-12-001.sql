UPDATE AttachFile SET AttachUrl =replace(AttachUrl,'\培训教材\','\')
WHERE AttachUrl LIKE '%培训教材%'
GO
UPDATE AttachFile SET AttachUrl =replace(AttachUrl,'\培训录像及动画\','\')
WHERE AttachUrl LIKE '%培训录像及动画%'
GO

UPDATE Training_TrainingItem SET AttachUrl =replace(AttachUrl,'\培训教材\','\')
WHERE AttachUrl LIKE '%培训教材%'
GO

UPDATE Training_TrainingItem SET AttachUrl =replace(AttachUrl,'\培训录像及动画\','\')
WHERE AttachUrl LIKE '%培训录像及动画%'
GO

ALTER TABLE AttachFile ADD MenuId NVARCHAR(50) NULL
GO


ALTER PROCEDURE [dbo].[sp_GetTest]
(
   @WorkPostId varchar(50),
   @ABVolume varchar(50)
)
AS
--获取试卷信息
BEGIN
 
  select t.TestId, tdb.TestType,tdb.ItemType,tdb.TestNo,
         tdb.TestKey,tdb.KeyNumber,tdb.TestPath,t.TestCode,c.TestScore,
         c.TestConditionId,c.WorkPostId
  from dbo.Edu_Online_Test t 
 
  left join dbo.Edu_Online_TestDB tdb on tdb.TestId=t.TestDBId
  left join dbo.Edu_Online_TestCondition c on c.TestConditionId=t.TestConditionId
            and c.WorkPostId=@WorkPostId and c.ABVolume=@ABVolume
   where c.WorkPostId is not null and c.ABVolume is not null
  order by tdb.ItemType,t.TestCode
END




GO


INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('CDD69197-5597-40DB-85F1-84A9E1774D68','F62D1C56-8FB0-480D-9702-84B168D0A89F','保存',1)
GO



/**********百万工时安全统计月报主表**********/
ALTER PROCEDURE [dbo].[Sp_Information_MillionsMonthlyReport]
 @MillionsMonthlyReportId nvarchar(50)
AS
SELECT M.MillionsMonthlyReportId
, M.UnitId
,((CAST (M.Year AS NVARCHAR(20))) + '年' + (CAST(M.Month AS NVARCHAR(20))) + '月') AS YE
, M.FillingMan
, M.FillingDate
, M.DutyPerson
, M.RecordableIncidentRate
, M.LostTimeRate
, M.LostTimeInjuryRate
, M.DeathAccidentFrequency
, M.AccidentMortality
, U.UnitName
, SUM(SumPostPersonNum) AS SumPostPersonNum
, SUM(SumSnapPersonNum) AS SumSnapPersonNum
, SUM(SumContractorNum) AS SumContractorNum
, SUM(SumSumPersonNum) AS SumSumPersonNum
, SUM(SumTotalWorkNum) AS SumTotalWorkNum
, SUM(SumSeriousInjuriesNum) AS SumSeriousInjuriesNum
, SUM(SumSeriousInjuriesPersonNum) AS SumSeriousInjuriesPersonNum
, SUM(SumSeriousInjuriesLossHour) AS SumSeriousInjuriesLossHour
, SUM(SumMinorAccidentNum) AS SumMinorAccidentNum
, SUM(SumMinorAccidentPersonNum) AS SumMinorAccidentPersonNum
, SUM(SumMinorAccidentLossHour) AS SumMinorAccidentLossHour
, SUM(SumOtherAccidentNum) AS SumOtherAccidentNum
, SUM(SumOtherAccidentPersonNum) AS SumOtherAccidentPersonNum
, SUM(SumOtherAccidentLossHour) AS SumOtherAccidentLossHour
, SUM(SumRestrictedWorkPersonNum) AS SumRestrictedWorkPersonNum
, SUM(SumRestrictedWorkLossHour) AS SumRestrictedWorkLossHour
, SUM(SumMedicalTreatmentPersonNum) AS SumMedicalTreatmentPersonNum
, SUM(SumMedicalTreatmentLossHour) AS SumMedicalTreatmentLossHour
, SUM(SumFireNum) AS SumFireNum
, SUM(SumExplosionNum) AS SumExplosionNum
, SUM(SumTrafficNum) AS SumTrafficNum
, SUM(SumEquipmentNum) AS SumEquipmentNum
, SUM(SumQualityNum) AS SumQualityNum
, SUM(SumOtherNum) AS SumOtherNum
, SUM(SumFirstAidDressingsNum) AS SumFirstAidDressingsNum
, SUM(SumAttemptedEventNum) AS SumAttemptedEventNum
, SUM(SumLossDayNum) AS SumLossDayNum
FROM dbo.Information_MillionsMonthlyReport AS M
LEFT JOIN  (SELECT  SUM(I.PostPersonNum) AS SumPostPersonNum
, SUM(I.SnapPersonNum) AS SumSnapPersonNum
, SUM(I.ContractorNum) AS SumContractorNum
, SUM(I.SumPersonNum) AS SumSumPersonNum
, SUM(I.TotalWorkNum) AS SumTotalWorkNum
, SUM(I.SeriousInjuriesNum) AS SumSeriousInjuriesNum
, SUM(I.SeriousInjuriesPersonNum) AS SumSeriousInjuriesPersonNum
, SUM(I.SeriousInjuriesLossHour) AS SumSeriousInjuriesLossHour
, SUM(I.MinorAccidentNum) AS SumMinorAccidentNum
, SUM(I.MinorAccidentPersonNum) AS SumMinorAccidentPersonNum
, SUM(I.MinorAccidentLossHour) AS SumMinorAccidentLossHour
, SUM(I.OtherAccidentNum) AS SumOtherAccidentNum
, SUM(I.OtherAccidentPersonNum) AS SumOtherAccidentPersonNum
, SUM(I.OtherAccidentLossHour) AS SumOtherAccidentLossHour
, SUM(I.RestrictedWorkPersonNum) AS SumRestrictedWorkPersonNum
, SUM(I.RestrictedWorkLossHour) AS SumRestrictedWorkLossHour
, SUM(I.MedicalTreatmentPersonNum) AS SumMedicalTreatmentPersonNum
, SUM(I.MedicalTreatmentLossHour) AS SumMedicalTreatmentLossHour
, SUM(I.FireNum) AS SumFireNum
, SUM(I.ExplosionNum) AS SumExplosionNum
, SUM(I.TrafficNum) AS SumTrafficNum
, SUM(I.EquipmentNum) AS SumEquipmentNum
, SUM(I.QualityNum) AS SumQualityNum
, SUM(I.OtherNum) AS SumOtherNum
, SUM(I.FirstAidDressingsNum) AS SumFirstAidDressingsNum
, SUM(I.AttemptedEventNum) AS SumAttemptedEventNum
, SUM(I.LossDayNum) AS SumLossDayNum
,MYear.UnitId
,MYear.Year
,MYear.Month
FROM dbo.Information_MillionsMonthlyReportItem AS I
LEFT JOIN  dbo.Information_MillionsMonthlyReport AS MYear ON I.MillionsMonthlyReportId = MYear.MillionsMonthlyReportId
WHERE I.Affiliation='本月合计'
GROUP BY MYear.UnitId, MYear.Year,MYear.Month) AS MYear ON MYear.Year = M.Year AND MYear.Month <=M.Month AND MYear.UnitId = M.UnitId
LEFT JOIN dbo.Base_Unit AS U ON U.UnitId=M.UnitId
WHERE M.MillionsMonthlyReportId = @MillionsMonthlyReportId
GROUP BY M.MillionsMonthlyReportId
, M.UnitId
, M.Year
, M.Month
, M.FillingMan
, M.FillingDate
, M.DutyPerson
, M.RecordableIncidentRate
, M.LostTimeRate
, M.LostTimeInjuryRate
, M.DeathAccidentFrequency
, M.AccidentMortality
, U.UnitName
GO
	
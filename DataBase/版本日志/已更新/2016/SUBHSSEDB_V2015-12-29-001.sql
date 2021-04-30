
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('AE5A454F-578E-4C52-969B-20AB87006A73','3156A9F0-276D-4AD4-BF84-45CF6DFC215C','����',7)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('88D736EA-3ADC-4100-B17E-A1A1F16D9D2A','3156A9F0-276D-4AD4-BF84-45CF6DFC215C','��ӡ',8)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('A71F1236-204F-4B34-B887-19B31CE56F63','4BC71D2E-7D94-48C1-A61A-139637825AA5','����',7)
GO	
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('C90343CD-4DBE-4C3B-BEDD-888C9B514F8B','4BC71D2E-7D94-48C1-A61A-139637825AA5','��ӡ',8)
GO	
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('BED22C29-BA30-4BD2-A244-8588F2A0635B','A3894BAD-3F4A-4BB4-98CF-A76C588AE53F','����',6)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('C4922011-37CD-4B79-820A-D8CAAE39144D','A3894BAD-3F4A-4BB4-98CF-A76C588AE53F','��ӡ',7)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('5231B22C-BF0B-478B-92DD-1C1B30BC7270','7985C759-8EB9-4B7D-AC65-00541280B46C','����',7)	
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('25A11FB5-AB22-42CC-9E94-29FF9221B25B','7985C759-8EB9-4B7D-AC65-00541280B46C','��ӡ',8)	
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('F287B0ED-D725-4CD3-B422-5319112F452B','70DEB27A-D6FF-4D57-879B-0270F2967FA0','����',7)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('30F188D4-84D4-4D3C-8ECE-B499ACB1C3C8','70DEB27A-D6FF-4D57-879B-0270F2967FA0','��ӡ',8)
GO


/****** Object:  View [dbo].[View_DataIn_MillionsMonthlyReport]    Script Date: 12/21/2015 15:03:26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/***********����ʱ��ȫͳ���±���*********/
CREATE VIEW [dbo].[View_DataIn_MillionsMonthlyReport]
AS
SELECT MItem.MillionsMonthlyReportItemId
, MItem.MillionsMonthlyReportId
, MItem.SortIndex
, MItem.Affiliation
, MItem.Name
, MItem.PostPersonNum
, MItem.SnapPersonNum
, MItem.ContractorNum
, MItem.SumPersonNum
, MItem.TotalWorkNum
, MItem.SeriousInjuriesNum
, MItem.SeriousInjuriesPersonNum
, MItem.SeriousInjuriesLossHour
, MItem.MinorAccidentNum
, MItem.MinorAccidentPersonNum
, MItem.MinorAccidentLossHour
, MItem.OtherAccidentNum
, MItem.OtherAccidentPersonNum
, MItem.OtherAccidentLossHour
, MItem.RestrictedWorkPersonNum
, MItem.RestrictedWorkLossHour
, MItem.MedicalTreatmentPersonNum
, MItem.MedicalTreatmentLossHour
, MItem.FireNum
, MItem.ExplosionNum
, MItem.TrafficNum
, MItem.EquipmentNum
, MItem.QualityNum
, MItem.OtherNum
, MItem.FirstAidDressingsNum
, MItem.AttemptedEventNum
, MItem.LossDayNum
,M.UnitId
,M.Year
,M.Month
,M.FillingMan
,M.FillingDate
,M.DutyPerson
,M.RecordableIncidentRate
,M.LostTimeRate
,M.LostTimeInjuryRate
,M.DeathAccidentFrequency
,M.AccidentMortality
,M.UpState
,M.HandleState
,M.HandleMan
,U.UnitName
FROM dbo.Information_MillionsMonthlyReportItem AS MItem
LEFT JOIN dbo.Information_MillionsMonthlyReport AS M ON M.MillionsMonthlyReportId=MItem.MillionsMonthlyReportId
LEFT JOIN dbo.Base_Unit AS U ON U.UnitId =M.UnitId

GO





/****** Object:  View [dbo].[View_DataIn_AccidentCauseReport]    Script Date: 12/23/2015 15:25:44 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/*************ְ�������¹�ԭ���������***************/
CREATE VIEW [dbo].[View_DataIn_AccidentCauseReport]
AS
SELECT AItem.AccidentCauseReportItemId
, AItem.AccidentCauseReportId
, AItem.AccidentType
, AItem.TotalDeath
, AItem.TotalInjuries
, AItem.TotalMinorInjuries
, AItem.Death1
, AItem.Injuries1
, AItem.MinorInjuries1
, AItem.Death2
, AItem.Injuries2
, AItem.MinorInjuries2
, AItem.Death3
, AItem.Injuries3
, AItem.MinorInjuries3
, AItem.Death4
, AItem.Injuries4
, AItem.MinorInjuries4
, AItem.Death5
, AItem.Injuries5
, AItem.MinorInjuries5
, AItem.Death6
, AItem.Injuries6
, AItem.MinorInjuries6
, AItem.Death7
, AItem.Injuries7
, AItem.MinorInjuries7
, AItem.Death8
, AItem.Injuries8
, AItem.MinorInjuries8
, AItem.Death9
, AItem.Injuries9
, AItem.MinorInjuries9
, AItem.Death10
, AItem.Injuries10
, AItem.MinorInjuries10
, AItem.Death11
, AItem.Injuries11
, AItem.MinorInjuries11
, A.UnitId
, A.AccidentCauseReportCode
, A.Year
, A.Month
, A.DeathAccident
, A.DeathToll
, A.InjuredAccident
, A.InjuredToll
, A.MinorWoundAccident
, A.MinorWoundToll
, A.AverageTotalHours
, A.AverageManHours
, A.TotalLossMan
, A.LastMonthLossHoursTotal
, A.KnockOffTotal
, A.DirectLoss
, A.IndirectLosses
, A.TotalLoss
, A.TotalLossTime
, A.FillCompanyPersonCharge
, A.TabPeople
, A.AuditPerson
, A.FillingDate
, A.UpState
, A.HandleState
, A.HandleMan
, U.UnitName
FROM dbo.Information_AccidentCauseReportItem AS AItem
LEFT JOIN dbo.Information_AccidentCauseReport AS A ON A.AccidentCauseReportId=AItem.AccidentCauseReportId
LEFT JOIN dbo.Base_Unit AS U ON U.UnitId=A.UnitId

GO

/***********Ӧ�����������ƻ����걨��ϸ��*********/
create VIEW [dbo].[View_Information_DrillPlanHalfYearReportItem]
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


/***********Ӧ��������չ�������*********/
create VIEW [dbo].[View_Information_DrillConductedQuarterlyReportItem]
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


INSERT INTO dbo.Sys_Menu (MenuId, MenuName, Url, SortIndex, SuperMenu)
VALUES('0C67F4A8-1BE7-40BE-9621-B02A28FD13ED','�������','ReportPrint/PrintDesigner.aspx',100,'D1A0F410-09B1-4607-BC6D-865CE48F080F')
GO


--��ӡ����
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('4C57E704-DB54-479F-B946-010049D0DE0C','1','����ʱ��ȫͳ���±�',1,'Report')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('C7D60BE0-2C52-49FF-B0E2-F0D8D3B2CA10','2','ְ�������¹�ԭ�������',2,'Report')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('B03ACB80-0F6C-4A19-BCD1-BC1FAA601BD0','3','��ȫ�������ݼ���',3,'Report')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('B6020919-CB6D-42BF-84D2-538A3B06135F','4','Ӧ��������չ�������',4,'Report')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('F077DC71-E050-42D3-B58A-10F0C2757406','5','Ӧ�����������ƻ����걨',5,'Report')
GO




/****** Object:  StoredProcedure [dbo].[Sp_Information_AccidentCauseReport]    Script Date: 12/26/2015 10:59:29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


/************ְ����������ԭ���������******************/
CREATE PROCEDURE [dbo].[Sp_Information_AccidentCauseReport]
 @AccidentCauseReportId nvarchar(50)
AS
SELECT A.AccidentCauseReportId
, A.UnitId
, A.AccidentCauseReportCode
, A.Year
,((CAST (A.Month AS NVARCHAR(10)))+'��') AS Month
,((CAST((A.Month-1) AS NVARCHAR(10)))+'��') AS LastMonth
, A.DeathAccident
, A.DeathToll
, A.InjuredAccident
, A.InjuredToll
, A.MinorWoundAccident
, A.MinorWoundToll
, A.AverageTotalHours
, A.AverageManHours
, A.TotalLossMan
, A.LastMonthLossHoursTotal
, A.KnockOffTotal
, A.DirectLoss
, A.IndirectLosses
, A.TotalLoss
, A.TotalLossTime
, A.FillCompanyPersonCharge
, A.TabPeople
, A.AuditPerson
, A.FillingDate
, A.UpState
, A.HandleState
, A.HandleMan
, U.UnitName
, UR.UserName
FROM dbo.Information_AccidentCauseReport AS A
LEFT JOIN dbo.Base_Unit AS U ON U.UnitId = A.UnitId
LEFT JOIN dbo.Sys_User AS UR ON UR.UserId = A.HandleMan
WHERE A.AccidentCauseReportId = @AccidentCauseReportId


GO



/****** Object:  StoredProcedure [dbo].[Sp_Information_AccidentCauseReportItem]    Script Date: 12/26/2015 10:59:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/************ְ����������ԭ�������ϸ��******************/
CREATE PROCEDURE [dbo].[Sp_Information_AccidentCauseReportItem]
 @AccidentCauseReportId nvarchar(50)
AS
SELECT I.AccidentCauseReportItemId
,I.AccidentCauseReportId
,I.AccidentType
,I.TotalDeath
,I.TotalInjuries
,I.TotalMinorInjuries
,I.Death1
,I.Injuries1
,I.MinorInjuries1
,I.Death2
,I.Injuries2
,I.MinorInjuries2
,I.Death3
,I.Injuries3
,I.MinorInjuries3
,I.Death4
,I.Injuries4
,I.MinorInjuries4
,I.Death5
,I.Injuries5
,I.MinorInjuries5
,I.Death6
,I.Injuries6
,I.MinorInjuries6
,I.Death7
,I.Injuries7
,I.MinorInjuries7
,I.Death8
,I.Injuries8
,I.MinorInjuries8
,I.Death9
,I.Injuries9
,I.MinorInjuries9
,I.Death10
,I.Injuries10
,I.MinorInjuries10
,I.Death11
,I.Injuries11
,I.MinorInjuries11
FROM dbo.Information_AccidentCauseReportItem AS I
WHERE I.AccidentCauseReportId = @AccidentCauseReportId

GO




/****** Object:  StoredProcedure [dbo].[Sp_Information_DrillConductedQuarterlyReport]    Script Date: 12/26/2015 11:00:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


/************Ӧ��������չ�����������******************/
CREATE PROCEDURE [dbo].[Sp_Information_DrillConductedQuarterlyReport]
 @DrillConductedQuarterlyReportId nvarchar(50)
AS
SELECT D.DrillConductedQuarterlyReportId
,D.UnitId
,(CAST (D.YearId AS NVARCHAR(20)) + '��' + (CASE D.Quarter 
WHEN '1' THEN '��һ����' 
WHEN '2' THEN '�ڶ�����'
WHEN '3' THEN '��������'
WHEN '4' THEN '���ļ���'
END)) AS Quarters
,U.UnitName
,UR.UserName
,SUM(I.TotalConductCount) AS SumTotalConductCount
,SUM(I.TotalPeopleCount) AS SumTotalPeopleCount
,SUM(I.TotalInvestment) AS SumTotalInvestment
,SUM(I.HQConductCount) AS SumHQConductCount
,SUM(I.HQPeopleCount) AS SumHQPeopleCount
,SUM(I.HQInvestment) AS SumHQInvestment
,SUM(I.BasicConductCount) AS SumBasicConductCount
,SUM(I.BasicPeopleCount) AS SumBasicPeopleCount
,SUM(I.BasicInvestment) AS SumBasicInvestment
--, SUM(I.ComprehensivePractice) AS SumComprehensivePractice
--, SUM(I.CPScene) AS SumCPScene
--, SUM(I.CPDesktop) AS SumCPDesktop
--, SUM(I.SpecialDrill) AS SumSpecialDrill
--, SUM(I.SDScene) AS SumSDScene
--, SUM(I.SDDesktop) AS SumSDDesktop
FROM dbo.Information_DrillConductedQuarterlyReport AS D
LEFT JOIN dbo.Information_DrillConductedQuarterlyReportItem AS I ON I.DrillConductedQuarterlyReportId=D.DrillConductedQuarterlyReportId
LEFT JOIN dbo.Base_Unit AS U ON U.UnitId = D.UnitId
LEFT JOIN dbo.Sys_User AS UR ON UR.UserId = D.HandleMan
WHERE D.DrillConductedQuarterlyReportId = @DrillConductedQuarterlyReportId
GROUP BY D.DrillConductedQuarterlyReportId,D.UnitId,D.YearId,D.Quarter,U.UnitName,UR.UserName



GO



/****** Object:  StoredProcedure [dbo].[Sp_Information_DrillConductedQuarterlyReportItem]    Script Date: 12/26/2015 11:00:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




/************Ӧ��������չ���������ϸ��******************/
CREATE PROCEDURE [dbo].[Sp_Information_DrillConductedQuarterlyReportItem]
 @DrillConductedQuarterlyReportId nvarchar(50)
AS
SELECT I.DrillConductedQuarterlyReportItemId
, ROW_NUMBER() OVER (ORDER BY I.DrillConductedQuarterlyReportItemId) AS Number
, I.DrillConductedQuarterlyReportId
, I.IndustryType
, I.TotalConductCount
, I.TotalPeopleCount
, I.TotalInvestment
, I.HQConductCount
, I.HQPeopleCount
, I.HQInvestment
, I.BasicConductCount
, I.BasicPeopleCount
, I.BasicInvestment
, I.ComprehensivePractice
, I.CPScene
, I.CPDesktop
, I.SpecialDrill
, I.SDScene
, I.SDDesktop
FROM dbo.Information_DrillConductedQuarterlyReportItem AS I
WHERE I.DrillConductedQuarterlyReportId = @DrillConductedQuarterlyReportId


GO




/****** Object:  StoredProcedure [dbo].[Sp_Information_DrillPlanHalfYearReport]    Script Date: 12/26/2015 11:00:40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




/************Ӧ�����������ƻ����걨����******************/
CREATE PROCEDURE [dbo].[Sp_Information_DrillPlanHalfYearReport]
 @DrillPlanHalfYearReportId nvarchar(50)
AS
SELECT D.DrillPlanHalfYearReportId
,D.UnitId
,D.CompileMan
,D.CompileDate
,(CAST(D.YearId as NVARCHAR(20)) + '��' + (CASE D.HalfYearId WHEN '1' THEN '�ϰ���' ELSE '�°���' END)) AS HalfYear
,D.Telephone
,D.UpState
,D.HandleState
,D.HandleMan
,U.UnitName
FROM dbo.Information_DrillPlanHalfYearReport AS D
LEFT JOIN dbo.Base_Unit AS U ON U.UnitId = D.UnitId
LEFT JOIN dbo.Sys_User AS UR ON UR.UserId = D.HandleMan
WHERE D.DrillPlanHalfYearReportId = @DrillPlanHalfYearReportId




GO



/****** Object:  StoredProcedure [dbo].[Sp_Information_DrillPlanHalfYearReportItem]    Script Date: 12/26/2015 11:00:50 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



/************Ӧ�����������ƻ����걨��ϸ��******************/
CREATE PROCEDURE [dbo].[Sp_Information_DrillPlanHalfYearReportItem]
 @DrillPlanHalfYearReportId nvarchar(50)
AS
SELECT I.DrillPlanHalfYearReportItemId
,ROW_NUMBER() OVER(ORDER BY DrillPlanHalfYearReportItemId) AS Number
,I.DrillPlanHalfYearReportId
,I.DrillPlanName
,I.OrganizationUnit
,I.DrillPlanDate
,I.AccidentScene
,I.ExerciseWay
FROM dbo.Information_DrillPlanHalfYearReportItem AS I
WHERE I.DrillPlanHalfYearReportId = @DrillPlanHalfYearReportId


GO




/****** Object:  StoredProcedure [dbo].[Sp_Information_MillionsMonthlyReport]    Script Date: 12/26/2015 11:01:00 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






/**********����ʱ��ȫͳ���±�����**********/
CREATE PROCEDURE [dbo].[Sp_Information_MillionsMonthlyReport]
 @MillionsMonthlyReportId nvarchar(50)
AS
SELECT M.MillionsMonthlyReportId
, M.UnitId
,((CAST (M.Year AS NVARCHAR(20))) + '��' + (CAST(M.Month AS NVARCHAR(20))) + '��') AS YE
, M.FillingMan
, M.FillingDate
, M.DutyPerson
, M.RecordableIncidentRate
, M.LostTimeRate
, M.LostTimeInjuryRate
, M.DeathAccidentFrequency
, M.AccidentMortality
, U.UnitName
, SUM(I.PostPersonNum) AS SumPostPersonNum
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
FROM dbo.Information_MillionsMonthlyReport AS M
LEFT JOIN dbo.Information_MillionsMonthlyReportItem AS I ON I.MillionsMonthlyReportId = M.MillionsMonthlyReportId
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




/****** Object:  StoredProcedure [dbo].[Sp_Information_MillionsMonthlyReportItem]    Script Date: 12/26/2015 11:01:09 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






/**********����ʱ��ȫͳ���±���ϸ��**********/
CREATE PROCEDURE [dbo].[Sp_Information_MillionsMonthlyReportItem]
 @MillionsMonthlyReportId nvarchar(50)
AS
SELECT I.MillionsMonthlyReportItemId
, I.MillionsMonthlyReportId
, I.SortIndex
, I.Affiliation
, I.Name
, I.PostPersonNum
, I.SnapPersonNum
, I.ContractorNum
, I.SumPersonNum
, I.TotalWorkNum
, I.SeriousInjuriesNum
, I.SeriousInjuriesPersonNum
, I.SeriousInjuriesLossHour
, I.MinorAccidentNum
, I.MinorAccidentPersonNum
, I.MinorAccidentLossHour
, I.OtherAccidentNum
, I.OtherAccidentPersonNum
, I.OtherAccidentLossHour
, I.RestrictedWorkPersonNum
, I.RestrictedWorkLossHour
, I.MedicalTreatmentPersonNum
, I.MedicalTreatmentLossHour
, I.FireNum
, I.ExplosionNum
, I.TrafficNum
, I.EquipmentNum
, I.QualityNum
, I.OtherNum
, I.FirstAidDressingsNum
, I.AttemptedEventNum
, I.LossDayNum
FROM dbo.Information_MillionsMonthlyReportItem AS I
WHERE I.MillionsMonthlyReportId = @MillionsMonthlyReportId
ORDER BY I.SortIndex



GO



/****** Object:  StoredProcedure [dbo].[Sp_Information_SafetyQuarterlyReport]    Script Date: 12/26/2015 11:01:18 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



/**********��ȫ�������ݼ���**********/
CREATE  PROCEDURE [dbo].[Sp_Information_SafetyQuarterlyReport]
 @SafetyQuarterlyReportId nvarchar(50)
AS
SELECT S.SafetyQuarterlyReportId
,S.UnitId
,((CAST (S.YearId AS NVARCHAR(20))) + '��' + (CASE S.Quarters
WHEN '1' THEN '��һ����'
WHEN '2' THEN '�ڶ�����'
WHEN '3' THEN '��������'
WHEN '4' THEN '���ļ���'
END )) AS YQ
,S.TotalInWorkHours
,S.TotalInWorkHoursRemark
,S.TotalOutWorkHours
,S.TotalOutWorkHoursRemark
,S.WorkHoursLossRate
,S.WorkHoursLossRateRemark
,S.WorkHoursAccuracy
,S.WorkHoursAccuracyRemark
,S.MainBusinessIncome
,S.MainBusinessIncomeRemark
,S.ConstructionRevenue
,S.ConstructionRevenueRemark
,S.UnitTimeIncome
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
,S.ProtectionInput
,S.ProtectionInputRemark
,S.LaboAndHealthIn
,S.LaborAndHealthInRemark
,S.TechnologyProgressIn
,S.TechnologyProgressInRemark
,S.EducationTrainIn
,S.EducationTrainInRemark
,S.ProjectCostRate
,S.ProjectCostRateRemark
,S.ProductionInput
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



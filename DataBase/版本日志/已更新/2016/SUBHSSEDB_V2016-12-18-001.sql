CREATE VIEW [dbo].[View_SafetyData_SafetyDataPlan] 
AS 
/*��ҵ��ȫ�ƻ�����ͼ*/
SELECT SafetyDataPlan.SafetyDataPlanId
      ,SafetyDataPlan.ProjectId
	  ,Project.ProjectName
      ,SafetyDataPlan.SafetyDataId
	  ,SafetyData.Title
	  ,SafetyData.Code
	  ,convert(varchar(7),SafetyDataPlan.CheckDate,120) AS CheckMonth 
      ,SafetyDataPlan.CheckDate
      ,SafetyDataPlan.RealStartDate
      ,SafetyDataPlan.RealEndDate
      ,SafetyDataPlan.Score
      ,SafetyDataPlan.Remark
FROM SafetyData_SafetyDataPlan AS SafetyDataPlan
LEFT JOIN SafetyData_SafetyData AS SafetyData ON SafetyDataPlan.SafetyDataId =SafetyData.SafetyDataId
LEFT JOIN Base_Project AS Project ON SafetyDataPlan.ProjectId =Project.ProjectId


GO




 
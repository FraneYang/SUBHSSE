UPDATE SafetyData_SafetyDataCheckItem SET RealScore=ShouldScore 
WHERE RealScore !=0 AND RealScore != ShouldScore AND RealScore IS NOT NULL
GO
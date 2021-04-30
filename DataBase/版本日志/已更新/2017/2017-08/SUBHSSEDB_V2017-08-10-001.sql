UPDATE Check_CheckDayDetail SET CompleteStatus=1 
WHERE CompletedDate IS NOT NULL AND  (CompleteStatus IS NULL OR CompleteStatus =0)
GO
UPDATE Check_CheckSpecialDetail SET CompleteStatus=1 
WHERE CompletedDate IS NOT NULL AND  (CompleteStatus IS NULL OR CompleteStatus =0)
GO
UPDATE Check_CheckColligationDetail SET CompleteStatus=1 
WHERE CompletedDate IS NOT NULL AND  (CompleteStatus IS NULL OR CompleteStatus =0)
GO
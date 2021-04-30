DELETE FROM Check_CheckRectifyItem 
WHERE CheckRectifyId IN ( SELECT CheckRectifyId FROM Check_CheckRectify 
WHERE CheckDate='2017-09-01' AND IssueDate='2017-11-15' AND CheckRectifyCode='2017/9/1-R' 
AND HandleState='2') 
GO
DELETE FROM Check_CheckRectify 
WHERE CheckDate='2017-09-01' AND IssueDate='2017-11-15' AND CheckRectifyCode='2017/9/1-R'
AND HandleState='2'
GO
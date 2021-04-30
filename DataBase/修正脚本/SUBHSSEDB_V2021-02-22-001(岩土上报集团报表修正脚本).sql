UPDATE Information_MillionsMonthlyReport SET UpState=3,HandleState=4
WHERE  UpState != 3 OR HandleState != 4
GO
UPDATE Information_AccidentCauseReport SET UpState=3,HandleState=4
WHERE  UpState != 3 OR HandleState != 4
GO
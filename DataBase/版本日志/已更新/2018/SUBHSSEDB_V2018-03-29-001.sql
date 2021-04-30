/************HSSE日志暨管理数据收集*************/
CREATE PROCEDURE [dbo].[Sp_Manager_HSSELogReport]
 @HSSELogId nvarchar(50)
AS
SELECT HSSELogId
    ,Project.ProjectId
	,Project.ProjectName
    ,CompileDate
    ,CompileMan
	,U.UserName
    ,Weather
	,Const.ConstText
    ,IsVisible
    ,Contents12
    ,Contents13
    ,Contents21
    ,Num21
    ,Contents22
    ,Num22
    ,Contents23
    ,Num23
    ,Contents24
    ,Num24
    ,Contents25
    ,Num25
    ,Contents26
    ,Num26
    ,Contents27
    ,Num27
    ,Contents28
    ,Num28
    ,Contents29
    ,Num29
    ,Contents210
    ,Num210
    ,Num211
    ,Contents31
    ,Num31
    ,Contents32
    ,Num32
    ,Contents33
    ,Num33
    ,Contents34
    ,Num34
    ,Contents41
    ,Contents42
    ,Contents43
    ,Contents51
    ,Contents52
    ,Num11
FROM dbo.Manager_HSSELog
LEFT JOIN Sys_User AS U ON Manager_HSSELog.CompileMan = U.UserId
LEFT JOIN Base_Project AS Project ON Project.ProjectId = Manager_HSSELog.ProjectId
LEFT JOIN Sys_Const AS Const ON Const.ConstValue = Manager_HSSELog.Weather AND Const.GroupId='Weather'
WHERE HSSELogId = HSSELogId

GO


INSERT INTO Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
Values('005434A8-2FCA-43B2-925A-D7321C029F8C','16','HSSE日志暨管理数据收集',16,'Report')
GO
INSERT INTO Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
Values('92FFAFA4-4037-4F52-B8C3-F63E032CE5C0','14','职业健康安全危险源辨识与评价',14,'Report')
GO
INSERT INTO Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
Values('CDB21652-8053-4AC9-9691-650E04F4A716','15','职业健康安全危险源辨识与评价(重大危险源)',15,'Report')
GO

INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('125972F2-F78A-4BC2-8B77-B85144AC942A','EDC50857-7762-4498-83C6-5BDE85036BAB','打印',5)  
GO

/***********职业健康安全危险源辨识与评价主表************/
CREATE PROCEDURE [dbo].[Sp_Hazard_HazardListReport]
 @HazardListId nvarchar(50)
AS
SELECT HazardList.HazardListId, 
HazardList.HazardListCode, 
HazardList.ProjectId, 
HazardList.VersionNo, 
HazardList.CompileMan, 
HazardList.CompileDate, 
HazardList.States, 
HazardList.WorkStage, 
HazardList.Contents, 
HazardList.WorkAreaName, 
HazardList.IdentificationDate, 
HazardList.ControllingPerson,
Project.ProjectName,
U.UserName AS CompileManName,
U2.UserName AS ControllingPersonName
FROM dbo.Hazard_HazardList AS HazardList
LEFT JOIN Base_Project AS Project ON Project.ProjectId = HazardList.ProjectId
LEFT JOIN Sys_User AS U ON U.UserId = HazardList.CompileMan
LEFT JOIN Sys_User AS U2 ON U2.UserId = HazardList.ControllingPerson 
WHERE HazardList.HazardListId = @HazardListId 
GO

/***********职业健康安全危险源辨识与评价明细表************/
CREATE PROCEDURE [dbo].[Sp_Hazard_HazardSelectedItemReport]
 @HazardListId nvarchar(50)
AS
SELECT ROW_NUMBER() OVER (ORDER BY HazardSelectedItem.HazardId) AS Number,
HazardSelectedItem.HazardId, 
HazardSelectedItem.HazardListTypeId,
HazardSelectedItem.HazardListId,
HazardSelectedItem.HazardItems, 
HazardSelectedItem.DefectsType, 
HazardSelectedItem.MayLeadAccidents, 
HazardSelectedItem.HelperMethod, 
HazardSelectedItem.HazardJudge_L, 
HazardSelectedItem.HazardJudge_E, 
HazardSelectedItem.HazardJudge_C, 
HazardSelectedItem.HazardJudge_D, 
(CASE HazardSelectedItem.HazardLevel
WHEN '1' THEN 'Ⅰ'
WHEN '2' THEN 'Ⅱ'
WHEN '3' THEN 'Ⅲ'
WHEN '4' THEN 'Ⅳ'
WHEN '5' THEN 'Ⅴ' END) AS HazardLevel, 
HazardSelectedItem.ControlMeasures, 
HazardSelectedItem.IsResponse, 
HazardSelectedItem.ResponseRecode, 
HazardSelectedItem.PromptTime, 
HazardSelectedItem.Remark, 
HazardSelectedItem.WorkStage,
HazardListType2.HazardListTypeName
FROM dbo.Hazard_HazardSelectedItem AS HazardSelectedItem
LEFT JOIN dbo.Technique_HazardListType AS HazardListType ON HazardListType.HazardListTypeId = HazardSelectedItem.HazardListTypeId 
lEFT JOIN dbo.Technique_HazardListType AS HazardListType2 ON HazardListType2.HazardListTypeId = HazardListType.SupHazardListTypeId
WHERE HazardSelectedItem.HazardListId = @HazardListId 
GO


/***********职业健康安全危险源辨识与评价（重大危险源）明细表************/
CREATE PROCEDURE [dbo].[Sp_Hazard_HazardSelectedItemImportantReport]
 @HazardListId nvarchar(50)
AS
SELECT ROW_NUMBER() OVER (ORDER BY HazardSelectedItem.HazardId) AS Number,
HazardSelectedItem.HazardId, 
HazardSelectedItem.HazardListTypeId,
HazardSelectedItem.HazardListId,
HazardSelectedItem.HazardItems, 
HazardSelectedItem.DefectsType, 
HazardSelectedItem.MayLeadAccidents, 
HazardSelectedItem.HelperMethod, 
HazardSelectedItem.HazardJudge_L, 
HazardSelectedItem.HazardJudge_E, 
HazardSelectedItem.HazardJudge_C, 
HazardSelectedItem.HazardJudge_D, 
(CASE HazardSelectedItem.HazardLevel
WHEN '1' THEN 'Ⅰ'
WHEN '2' THEN 'Ⅱ'
WHEN '3' THEN 'Ⅲ'
WHEN '4' THEN 'Ⅳ'
WHEN '5' THEN 'Ⅴ' END) AS HazardLevel, 
HazardSelectedItem.ControlMeasures, 
HazardSelectedItem.IsResponse, 
HazardSelectedItem.ResponseRecode, 
HazardSelectedItem.PromptTime, 
HazardSelectedItem.Remark, 
HazardSelectedItem.WorkStage,
HazardListType2.HazardListTypeName
FROM dbo.Hazard_HazardSelectedItem AS HazardSelectedItem
LEFT JOIN dbo.Technique_HazardListType AS HazardListType ON HazardListType.HazardListTypeId = HazardSelectedItem.HazardListTypeId 
LEFT JOIN dbo.Technique_HazardListType AS HazardListType2 ON HazardListType2.HazardListTypeId = HazardListType.SupHazardListTypeId
WHERE HazardSelectedItem.HazardJudge_D > 160 
AND HazardSelectedItem.HazardListId = @HazardListId 

GO

ALTER TABLE dbo.Technique_HazardListType ADD IsCompany BIT	 --是否本公司
GO


INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('C0018E8C-C88B-4E25-BCFC-F0BF3CACC63A','公司危险源清单','Technique/CompanyHazardList.aspx','Page',12,'F3B157B7-9BEE-4150-80CB-087828F1C51D','Menu_Resource',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('99BD52A4-D6C9-4E2D-89E0-D577BA3E33F4','C0018E8C-C88B-4E25-BCFC-F0BF3CACC63A','增加',1)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('3028DA81-099D-4153-9F93-8B996DEB2F77','C0018E8C-C88B-4E25-BCFC-F0BF3CACC63A','修改',2)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('E09E5632-69EC-4BA5-9EE5-E21720BD743B','C0018E8C-C88B-4E25-BCFC-F0BF3CACC63A','删除',3)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('DDD0519A-1DD6-46D7-8E68-5464E9C06BBF','C0018E8C-C88B-4E25-BCFC-F0BF3CACC63A','保存',4)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('ABD1A68C-4EEC-4816-8B85-D446E8CF359A','C0018E8C-C88B-4E25-BCFC-F0BF3CACC63A','导入',8)   
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('219D3916-ABB8-4D3F-8656-8A114F22A603','C0018E8C-C88B-4E25-BCFC-F0BF3CACC63A','导出',9)
GO





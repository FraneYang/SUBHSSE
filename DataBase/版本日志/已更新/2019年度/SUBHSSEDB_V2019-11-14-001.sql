ALTER PROCEDURE [dbo].[Sp_GetTraining_TaskItemTraining]     
	@PlanId NVARCHAR(50),
	@WorkPostId NVARCHAR(200)=NULL
AS  
/*获取人员培训教材*/          
BEGIN
SELECT DISTINCT p.PlanId
	,p.ProjectId
	,P.PlanCode
	,P.PlanName 
	,CI.CompanyTrainingItemCode AS TrainingItemCode
	,CI.CompanyTrainingItemName AS TrainingItemName 
	,AttachFile.AttachUrl
FROM Training_Plan AS P
LEFT JOIN Training_PlanItem AS PLI ON PLI.PlanId=P.PlanId
LEFT JOIN Training_CompanyTraining AS C ON PLI.CompanyTrainingId = C.CompanyTrainingId 
LEFT JOIN Training_CompanyTrainingItem AS CI  ON C.CompanyTrainingId =PLI.CompanyTrainingId
LEFT JOIN AttachFile AS AttachFile  ON CI.CompanyTrainingItemId =AttachFile.ToKeyId
WHERE P.PlanId =@PlanId AND (CI.WorkPostIds IS NULL OR CI.WorkPostIds LIKE ('%'+@WorkPostId+'%'))
   AND PLI.PlanItemId IS NOT NULL AND CI.CompanyTrainingId IS NOT NULL
END
GO

--新增及格分数线
ALTER TABLE Sys_TestRule ADD PassingScore INT NULL
GO
UPDATE Sys_TestRule SET PassingScore=80
GO
ALTER TABLE Sys_TestRule ALTER COLUMN PassingScore INT NOT NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'及格分数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_TestRule', @level2type=N'COLUMN',@level2name=N'PassingScore'
GO

ALTER VIEW [dbo].[View_SitePerson_Person]
AS
SELECT Person.PersonId,
	Person.CardNo,
	Person.PersonName,
	Person.Sex, 
	(Case Person.Sex WHEN '1' THEN '男' WHEN '2' THEN '女' ELSE '' END) AS SexName, 
	Person.IdentityCard, 
	Person.Address, 
	Person.ProjectId, 
	Person.UnitId, 
	Person.TeamGroupId, 
	Person.WorkAreaId, 
	Person.WorkPostId, 	
	Person.InTime, 
	Person.OutTime, 
	Person.OutResult, 
	Person.Telephone, 
	Person.PositionId, 
	Person.PostTitleId, 
	Person.PhotoUrl, 
	Person.IsUsed,
	(CASE Person.IsUsed WHEN 'TRUE' THEN '是' ELSE '否' END) AS IsUsedName, 
	Person.IsCardUsed, 
	(CASE Person.IsCardUsed WHEN 'TRUE' THEN '是' ELSE '否' END) AS IsCardUsedName, 
	Person.PersonIndex,
	Project.ProjectCode,
	Project.ProjectName,
	Unit.UnitCode,
	Unit.UnitName,
	TeamGroup.TeamGroupName,
	WorkArea.WorkAreaCode,
	WorkArea.WorkAreaName,
	Post.WorkPostName,
	Position.PositionName,
	Title.PostTitleName,
	Depart.DepartName,
	Post.PostType,
	Post.IsHsse,
	(SELECT COUNT(*) FROM EduTrain_TrainRecordDetail T WHERE T.PersonId=Person.PersonId) AS TrainCount
FROM SitePerson_Person AS Person
LEFT JOIN Base_Project AS Project ON Project.ProjectId=Person.ProjectId
LEFT JOIN Base_Unit AS Unit ON Unit.UnitId = Person.UnitId
LEFT JOIN ProjectData_TeamGroup AS TeamGroup ON TeamGroup.TeamGroupId=Person.TeamGroupId
LEFT JOIN ProjectData_WorkArea AS WorkArea ON WorkArea.WorkAreaId = Person.WorkAreaId
LEFT JOIN Base_WorkPost AS Post ON Post.WorkPostId = Person.WorkPostId
LEFT JOIN Base_Position AS Position ON Position.PositionId = Person.PositionId
Left JOIN Base_PostTitle AS Title ON Title.PostTitleId = Person.PostTitleId
Left JOIN Base_Depart AS Depart ON Depart.DepartId = Person.DepartId

GO

CREATE TABLE [dbo].[Base_PictureType](
	[PictureTypeId] [nvarchar](50) NOT NULL,
	[Code] [nvarchar](50) NULL,
	[Name] [nvarchar](50) NULL,
	[Remark] [nvarchar](500) NULL,
 CONSTRAINT [PK_Base_PictureType] PRIMARY KEY CLUSTERED 
(
	[PictureTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_PictureType', @level2type=N'COLUMN',@level2name=N'Code'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_PictureType', @level2type=N'COLUMN',@level2name=N'Name'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_PictureType', @level2type=N'COLUMN',@level2name=N'Remark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图片类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_PictureType'
GO

INSERT INTO Base_PictureType(PictureTypeId,Code,Name) 
VALUES('1','1','HSE管理')
GO
INSERT INTO Base_PictureType(PictureTypeId,Code,Name) 
VALUES('2','2','HSE安全')
GO
INSERT INTO Base_PictureType(PictureTypeId,Code,Name) 
VALUES('3','3','职业健康')
GO
INSERT INTO Base_PictureType(PictureTypeId,Code,Name) 
VALUES('4','4','环境保护')
GO
INSERT INTO Base_PictureType(PictureTypeId,Code,Name) 
VALUES('5','5','教育培训')
GO

INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('D95CA72C-182C-4718-92A4-3F665E0FB660','项目图片分类','BaseInfo/PictureType.aspx','PageHeaderFooter',310,'0','Menu_BaseInfo',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('0957C59D-E9E0-40E5-A422-3A596C3BFB0B','D95CA72C-182C-4718-92A4-3F665E0FB660','增加',1)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('EA5F5B14-4D9D-4BBC-83F3-330985CCE771','D95CA72C-182C-4718-92A4-3F665E0FB660','修改',2)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('21C14F40-BCC1-4D69-B6C7-5DC296EA97E6','D95CA72C-182C-4718-92A4-3F665E0FB660','删除',3)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('B0D1F559-A842-46AD-B836-32FD325B9ABB','D95CA72C-182C-4718-92A4-3F665E0FB660','保存',4)   
GO

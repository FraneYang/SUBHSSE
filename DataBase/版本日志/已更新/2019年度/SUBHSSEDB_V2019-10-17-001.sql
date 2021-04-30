CREATE TABLE [dbo].[Base_TrainTypeItem](
	[TrainTypeItemId] [nvarchar](50) NOT NULL,
	[TrainTypeId] [nvarchar](50) NOT NULL,
	[TrainingId] [nvarchar](50) NOT NULL,
	[SCount] [int] NOT NULL,
	[MCount] [int] NOT NULL,
	[JCount] [int] NOT NULL,
 CONSTRAINT [PK_Base_TrainTypeItem] PRIMARY KEY CLUSTERED 
(
	[TrainTypeItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Base_TrainTypeItem]  WITH CHECK ADD  CONSTRAINT [FK_Base_TrainTypeItem_Base_TrainType] FOREIGN KEY([TrainTypeId])
REFERENCES [dbo].[Base_TrainType] ([TrainTypeId])
GO

ALTER TABLE [dbo].[Base_TrainTypeItem] CHECK CONSTRAINT [FK_Base_TrainTypeItem_Base_TrainType]
GO

ALTER TABLE [dbo].[Base_TrainTypeItem]  WITH CHECK ADD  CONSTRAINT [FK_Base_TrainTypeItem_Training_TestTraining] FOREIGN KEY([TrainingId])
REFERENCES [dbo].[Training_TestTraining] ([TrainingId])
GO

ALTER TABLE [dbo].[Base_TrainTypeItem] CHECK CONSTRAINT [FK_Base_TrainTypeItem_Training_TestTraining]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_TrainTypeItem', @level2type=N'COLUMN',@level2name=N'TrainTypeItemId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'培训类型ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_TrainTypeItem', @level2type=N'COLUMN',@level2name=N'TrainTypeId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'试题类型ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_TrainTypeItem', @level2type=N'COLUMN',@level2name=N'TrainingId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单选题数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_TrainTypeItem', @level2type=N'COLUMN',@level2name=N'SCount'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'多选题数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_TrainTypeItem', @level2type=N'COLUMN',@level2name=N'MCount'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'判断题数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_TrainTypeItem', @level2type=N'COLUMN',@level2name=N'JCount'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'培训试题类型表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_TrainTypeItem'
GO

ALTER TABLE HSSE_Hazard_HazardRegister ADD CCManIds nvarchar(2000) null
go
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'抄送人员IDs' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_HazardRegister', @level2type=N'COLUMN',@level2name=N'CCManIds'
GO

/**********隐患巡检（手机端）视图*************/
ALTER VIEW [dbo].[View_Hazard_HazardRegister]
AS
SELECT Registration.HazardRegisterId, 
	Registration.HazardCode, 
	Registration.RegisterDate, 
	Registration.RegisterDef, 
	Registration.Rectification, 
	Registration.Place, 
	Registration.ResponsibleUnit, 
	Registration.Observer, 
	Registration.RectifiedDate, 
	Registration.ProjectId, 
	Registration.states,
	Registration.IsEffective,
	Registration.ResponsibleMan,
	Registration.CheckManId,
	Registration.CheckTime,
	Registration.RectificationPeriod,
	Registration.ImageUrl,
	Registration.RectificationImageUrl,
	Registration.RectificationTime,
	Registration.ConfirmMan,
	Registration.ConfirmDate,
	Registration.HandleIdea, 
	Registration.CutPayment, 
	Registration.ProblemTypes, 
	Registration.CheckSpecialId,
	Registration.CheckItemDetailId,
	Registration.SupCheckItemSetId,
	Registration.CheckItemSetId,
	Registration.SafeSupervisionId,
	Registration.SafeSupervisionIsOK,
	Project.ProjectName,
	Registration.CheckCycle,
	WorkArea.WorkAreaName,
	Unit.UnitName AS ResponsibilityUnitName,
	User1.UserName AS ResponsibilityManName,
	ISNULL(User1.Telephone,'') AS ResponsibilityManTel,
	User2.UserName AS CheckManName,
	ISNULL(User2.Telephone,'') AS  CheckManTel,
	User3.UserName AS ConfirmManName,
	ISNULL(User3.Telephone,'') AS  ConfirmManTel,
	User4.UserName AS ResponsibilityManName2,
	ISNULL(User4.Telephone,'') AS  ResponsibilityMan2Tel,
	(CASE WHEN Registration.states='1' and Registration.SafeSupervisionIsOK is null THEN '待整改' 
	WHEN Registration.states='1' and Registration.SafeSupervisionIsOK=1 THEN '合格' 
	WHEN Registration.states='2' THEN '已整改' 
	WHEN Registration.states='3' THEN '已闭环' 
	ELSE '已作废' END ) AS StatesStr,
	RegisterTypes.RegisterTypesId,
	RegisterTypes.RegisterTypesName,
	CheckItemDetail.CheckContent,  --专项检查项内容
	Registration.DIC_ID,
	Registration.CCManIds,
	CCManNames = STUFF(( SELECT ',' + UserName FROM Sys_User
				    where PATINDEX('%,' + RTRIM(Sys_User.UserId) + ',%',',' + Registration.CCManIds + ',')>0
					ORDER BY PATINDEX('%,' + RTRIM(Registration.CCManIds) + ',%',',' + Registration.CCManIds + ',')
					FOR XML PATH('')), 1, 1,'')
FROM dbo.HSSE_Hazard_HazardRegister AS Registration
LEFT JOIN dbo.Base_Project AS Project ON Project.ProjectId = Registration.ProjectId
LEFT JOIN dbo.ProjectData_WorkArea AS WorkArea ON WorkArea.WorkAreaId = Registration.Place 
LEFT JOIN dbo.HSSE_Hazard_HazardRegisterTypes AS RegisterTypes ON RegisterTypes.RegisterTypesId = Registration.RegisterTypesId 
LEFT JOIN dbo.Base_Unit AS Unit ON Unit.UnitId = Registration.ResponsibleUnit
LEFT JOIN dbo.Sys_User AS User1 ON User1.UserId = Registration.ResponsibleMan   
LEFT JOIN dbo.Sys_User AS User2 ON User2.UserId = Registration.CheckManId
LEFT JOIN dbo.Sys_User AS User3 ON User3.UserId = Registration.ConfirmMan
LEFT JOIN dbo.Sys_User AS User4 ON User4.UserId = Registration.ResponsibleMan2
LEFT JOIN dbo.HSSE_Check_CheckItemDetail AS CheckItemDetail ON CheckItemDetail.CheckItemDetailId = Registration.CheckItemDetailId

GO


ALTER PROCEDURE [dbo].[Sp_APP_GetToDoItems]     
	@projectId NVARCHAR(50),
	@userId NVARCHAR(200)=NULL
AS  
/*获取当前人待办事项*/          
BEGIN
SELECT HazardRegisterId AS DataId
	,'F21FFCAA-872A-4995-BB5B-E9C430950845' AS MenuId
	,'安全巡检' AS MenuName
	,register.RegisterDef AS Content
	,UserId
	,users.UserName
	,register.RegisterDate AS DataTime
	,CONVERT(varchar(100),register.RegisterDate, 23) AS DataTimeStr
	,'' AS UrlStr
FROM HSSE_Hazard_HazardRegister AS register 
LEFT JOIN Sys_User AS users ON users.UserId =@userId
WHERE register.ProjectId=@projectId AND 
((register.states = '1' AND (register.ResponsibleMan =@userId OR register.CCManIds LIKE ('%'+@userId+'%') )) 
OR (register.states = '2' AND register.CheckManId =@userId))		

union all
 SELECT PlanId AS DataId
	,'B782A26B-D85C-4F84-8B45-F7AA47B3159E' AS MenuId
	,'培训计划' AS MenuName
	,PlanName AS Content
	,UserId
	,users.UserName
	,DesignerDate AS DataTime
	,CONVERT(varchar(100),DesignerDate, 23) AS DataTimeStr
	,'' AS UrlStr
FROM Training_Plan AS ePlan
LEFT JOIN Sys_User AS users ON ePlan.DesignerId= users.UserId 
WHERE ePlan.ProjectId=@projectId AND 
(States = '0' OR States = '1' ) AND ePlan.DesignerId =@userId

union all
 SELECT TestPlanId AS DataId
	,'FAF7F4A4-A4BC-4D94-9E88-0CF5A380DB34' AS MenuId
	,'考试计划' AS MenuName
	,PlanName AS Content
	,UserId
	,users.UserName
	,PlanDate AS DataTime
	,CONVERT(varchar(100),PlanDate, 23) AS DataTimeStr
	,'' AS UrlStr
FROM Training_TestPlan AS TPlan
LEFT JOIN Sys_User AS users ON users.UserId =TPlan.PlanManId
WHERE TPlan.ProjectId=@projectId AND 
(States = '0' OR States = '1' ) AND PlanManId =@userId
ORDER BY DataTime DESC 
END
GO

INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('8E5B4A8E-B06E-4C8A-A2C8-1091A9BCAF72','工程师HSE日志','Manager/PersonDayReport.aspx','PageHeaderFooter',160,'03235B30-960D-4FCF-99F7-97773A2EE108','Menu_Project',1,0)
GO
--工程师HSE日志
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('5E9CE851-9CCE-4B7E-9DFA-9575B2D22413','8E5B4A8E-B06E-4C8A-A2C8-1091A9BCAF72','增加',1)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('52E28127-F078-424F-917E-A7C41D8A1C72','8E5B4A8E-B06E-4C8A-A2C8-1091A9BCAF72','修改',2)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('4A662B9D-8564-423D-8312-9B697A0A79FA','8E5B4A8E-B06E-4C8A-A2C8-1091A9BCAF72','删除',3)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('4FA1A85E-CA18-41A4-8B5C-FC2C494647C1','8E5B4A8E-B06E-4C8A-A2C8-1091A9BCAF72','保存',4) 
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('C2BF5762-6E52-4E36-BA72-7BE5C7C88C18','8E5B4A8E-B06E-4C8A-A2C8-1091A9BCAF72','提交',5)  
GO

INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('8E5B4A8E-B06E-4C8A-A2C8-1091A9BCAF72','工程师HSE日志','Manager/PersonDayReport.aspx','PageHeaderFooter',160,'03235B30-960D-4FCF-99F7-97773A2EE108','Menu_Project',1,0)
GO
INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('A3507DF7-F972-44F9-91BF-02E378F64653','赛鼎HSE月报','Manager/PersonMonthReport.aspx','PageHeaderFooter',170,'03235B30-960D-4FCF-99F7-97773A2EE108','Menu_Project',1,0)
GO
--工程师HSE月报
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('E4C80458-D412-4A95-9A0F-5442308868F4','A3507DF7-F972-44F9-91BF-02E378F64653','增加',1)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('35BF9D4C-2175-44A6-8C7E-2135476C3759','A3507DF7-F972-44F9-91BF-02E378F64653','修改',2)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('35E6EE14-2EC1-48CF-96EC-FC815F13E49E','A3507DF7-F972-44F9-91BF-02E378F64653','删除',3)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('1E545D01-F00D-4D32-B22B-7D62F08DF575','A3507DF7-F972-44F9-91BF-02E378F64653','保存',4) 
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('BB9AB85B-AE89-4C8F-9170-99A5912E7AB3','A3507DF7-F972-44F9-91BF-02E378F64653','提交',5)  
GO
INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('A3507DF7-F972-44F9-91BF-02E378F64653','赛鼎HSE月报','Manager/PersonMonthReport.aspx','PageHeaderFooter',170,'03235B30-960D-4FCF-99F7-97773A2EE108','Menu_Project',1,0)
GO

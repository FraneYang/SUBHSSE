UPDATE License_LicenseManager SET StartDate =NULL,EndDate=NULL
GO
ALTER TABLE License_LicenseManager ALTER COLUMN StartDate DATETIME NULL
GO
ALTER TABLE License_LicenseManager ALTER COLUMN EndDate DATETIME NULL
GO
--增加申请人字段
ALTER TABLE License_LicenseManager ADD ApplicantMan NVARCHAR(50) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'申请人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_LicenseManager', @level2type=N'COLUMN',@level2name=N'ApplicantMan'
GO
ALTER VIEW [dbo].[View_License_LicenseManager]
AS
/*现场安全许可证*/
SELECT LicenseManager.LicenseManagerId, 
	LicenseManager.ProjectId, 
	LicenseManager.LicenseTypeId, 
	LicenseManager.LicenseManagerCode, 
	LicenseManager.LicenseManageName, 
	LicenseManager.UnitId, 
	LicenseManager.LicenseManageContents, 
	LicenseManager.CompileMan, 
	LicenseManager.CompileDate, 
	LicenseManager.States,
	Project.ProjectCode,
	Project.ProjectName,
	LicenseType.LicenseTypeName,
	Unit.UnitName,
	Users.UserName,
	LicenseManager.WorkAreaId,
	WorkArea.WorkAreaName,
	LicenseManager.StartDate,
	LicenseManager.EndDate,
	LicenseManager.ApplicantMan
FROM dbo.License_LicenseManager AS LicenseManager
LEFT JOIN dbo.Base_Project AS Project ON Project.ProjectId = LicenseManager.ProjectId
LEFT JOIN dbo.Base_LicenseType AS LicenseType ON LicenseType.LicenseTypeId = LicenseManager.LicenseTypeId
LEFT JOIN dbo.Base_Unit AS Unit ON Unit.UnitId = LicenseManager.UnitId
LEFT JOIN dbo.Sys_User AS Users ON Users.UserId = LicenseManager.CompileMan
LEFT JOIN dbo.ProjectData_WorkArea AS WorkArea ON WorkArea.WorkAreaId = LicenseManager.WorkAreaId
GO

UPDATE Sys_MenuCommon SET MenuName='物资名称*' WHERE MenuId='7C07BCB4-5D51-4061-BB71-60AD25F6F21D'
GO

INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('CCF9E615-78C9-4085-BCFE-0F9907D3FA0A','物资类别*','BaseInfo/GoodsCategory.aspx','Paintcan',215,'0','Menu_BaseInfo',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('F46CE6B2-B9C2-494F-B1BD-2F93F79F198E','CCF9E615-78C9-4085-BCFE-0F9907D3FA0A','增加',1)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('9E6B988F-BBF7-4C20-B235-AD53C463D2DD','CCF9E615-78C9-4085-BCFE-0F9907D3FA0A','修改',2)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('C52C4A23-ABCB-4FB6-8E84-340079DCA84B','CCF9E615-78C9-4085-BCFE-0F9907D3FA0A','删除',3)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('BF7145EC-C342-4ED5-8979-C17A73CB55B7','CCF9E615-78C9-4085-BCFE-0F9907D3FA0A','保存',4)   
GO

CREATE TABLE [dbo].[Base_GoodsCategory](
	[GoodsCategoryId] [nvarchar](50) NOT NULL,
	[GoodsCategoryCode] [nvarchar](50) NULL,
	[GoodsCategoryName] [nvarchar](50) NULL,
	[Remark] [nvarchar](500) NULL,
 CONSTRAINT [PK_Base_GoodsCategory] PRIMARY KEY CLUSTERED 
(
	[GoodsCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_GoodsCategory', @level2type=N'COLUMN',@level2name=N'GoodsCategoryId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_GoodsCategory', @level2type=N'COLUMN',@level2name=N'GoodsCategoryCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_GoodsCategory', @level2type=N'COLUMN',@level2name=N'GoodsCategoryName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_GoodsCategory', @level2type=N'COLUMN',@level2name=N'Remark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'物资类别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_GoodsCategory'
GO

INSERT INTO dbo.Base_GoodsCategory(GoodsCategoryId,GoodsCategoryCode,GoodsCategoryName)
 VALUES('36571a63-32bb-42fc-b7b1-0c7a904ad638','006','消防器材')
GO
INSERT INTO dbo.Base_GoodsCategory(GoodsCategoryId,GoodsCategoryCode,GoodsCategoryName) 
VALUES('7d28846c-043e-4a4c-a5ff-672b565bf2c1','002','PPE')
GO
INSERT INTO dbo.Base_GoodsCategory(GoodsCategoryId,GoodsCategoryCode,GoodsCategoryName) 
VALUES('7d39c7ea-cb88-44a4-8c45-eda3ff5b8a40','001','标志、标识')
GO
INSERT INTO dbo.Base_GoodsCategory(GoodsCategoryId,GoodsCategoryCode,GoodsCategoryName) 
VALUES('8b993c75-d670-4d73-8006-7a27161975a4','003','检测器具')
GO
INSERT INTO dbo.Base_GoodsCategory(GoodsCategoryId,GoodsCategoryCode,GoodsCategoryName)
 VALUES('9af505ca-f4b0-4abb-97a8-ef36ed88b264','005','药品')
 GO
INSERT INTO dbo.Base_GoodsCategory(GoodsCategoryId,GoodsCategoryCode,GoodsCategoryName)
 VALUES('abb85cf0-ea53-4f83-8126-ecf3557b1e48','004','应急物品')
 GO
INSERT INTO dbo.Base_GoodsCategory(GoodsCategoryId,GoodsCategoryCode,GoodsCategoryName) 
VALUES('f3744329-e25a-4fc8-a96b-6ab8a8715b4c','007','其他')
GO
ALTER TABLE CostGoods_GoodsManage DROP COLUMN GoodsType
GO
ALTER TABLE CostGoods_GoodsManage ADD  GoodsCategoryId NVARCHAR(50) NULL
GO

ALTER TABLE [dbo].[CostGoods_GoodsManage]  WITH CHECK ADD  CONSTRAINT [FK_CostGoods_GoodsManage_Base_GoodsCategory] FOREIGN KEY([GoodsCategoryId])
REFERENCES [dbo].[Base_GoodsCategory] ([GoodsCategoryId])
GO

ALTER TABLE [dbo].[CostGoods_GoodsManage] CHECK CONSTRAINT [FK_CostGoods_GoodsManage_Base_GoodsCategory]
GO

ALTER TABLE Solution_ConstructSolution ADD CompileManName NVARCHAR(50) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制人姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Solution_ConstructSolution', @level2type=N'COLUMN',@level2name=N'CompileManName'
GO

ALTER TABLE Accident_AccidentHandle ADD UnitId NVARCHAR(50) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'事故单位' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accident_AccidentHandle', @level2type=N'COLUMN',@level2name=N'UnitId'
GO

ALTER TABLE [dbo].[Accident_AccidentHandle]  WITH CHECK ADD  CONSTRAINT [FK_Accident_AccidentHandle_Base_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[Accident_AccidentHandle] CHECK CONSTRAINT [FK_Accident_AccidentHandle_Base_Unit]
GO

ALTER TABLE Accident_AccidentHandle ALTER COLUMN AccidentDef NVARCHAR(500) NULL
GO

INSERT INTO Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('1C939B14-75F8-450C-9359-13186A279E43','11','培训记录',11,'Report')
GO

/***********培训记录主表************/
CREATE PROCEDURE [dbo].[Sp_EduTrain_TrainRecordReport]
 @TrainingId nvarchar(50)
AS
SELECT TrainRecord.TrainingId
, TrainRecord.TrainingCode
, TrainRecord.ProjectId
, TrainRecord.TrainTitle
, TrainRecord.TrainContent
, TrainRecord.TrainStartDate
, TrainRecord.TrainEndDate
, TrainRecord.TeachHour
, TrainRecord.TeachMan
, TrainRecord.TeachAddress
, TrainRecord.Remark
, TrainRecord.TrainTypeId
, TrainRecord.TrainLevelId
, TrainRecord.AttachUrl
, TrainRecord.UnitIds
, TrainRecord.States
, TrainRecord.CompileMan
, TrainRecord.TrainPersonNum
, TrainType.TrainTypeName
, TrainLevel.TrainLevelName
, Users.UserName
, UnitName = STUFF(( SELECT ',' + UnitName FROM Base_Unit
WHERE PATINDEX('%,' + RTRIM(UnitId) + ',%',',' + TrainRecord.UnitIds + ',')>0
ORDER BY PATINDEX('%,' + RTRIM(TrainingId) + ',%',',' + TrainRecord.UnitIds + ',') 
FOR XML PATH('')), 1, 1,'')
FROM EduTrain_TrainRecord AS TrainRecord
LEFT JOIN Base_TrainType AS TrainType ON TrainType.TrainTypeId = TrainRecord.TrainTypeId
LEFT JOIN Base_TrainLevel AS TrainLevel ON TrainLevel.TrainLevelId = TrainRecord.TrainLevelId 
LEFT JOIN Sys_User AS Users ON Users.UserId = TrainRecord.CompileMan
WHERE TrainRecord.TrainingId = @TrainingId



GO


/***********培训记录明细表************/
CREATE PROCEDURE [dbo].[Sp_EduTrain_TrainRecordDetailReport]
 @TrainingId nvarchar(50)
AS
SELECT ROW_NUMBER() OVER(ORDER BY TrainRecordDetail.TrainDetailId) AS Number
, TrainRecordDetail.TrainDetailId
, TrainRecordDetail.TrainingId
, TrainRecordDetail.PersonId
, TrainRecordDetail.CheckScore
, (CASE TrainRecordDetail.CheckResult WHEN 'TRUE' THEN '合格' ELSE '不合格' END ) AS CheckResult
, Person.PersonName
, Unit.UnitName
FROM EduTrain_TrainRecordDetail AS TrainRecordDetail
LEFT JOIN SitePerson_Person AS Person ON Person.PersonId = TrainRecordDetail.PersonId 
LEFT JOIN Base_Unit AS Unit ON Unit.UnitId = Person.UnitId
WHERE TrainRecordDetail.TrainingId = @TrainingId
GO

--五环管理月报内容项
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('DFB42D2F-1CA2-4E21-AABB-BBE1FBE75F5C','MonthReportCEdit1.aspx','1 项目概况',1,'MonthReportCItem')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('2CA1F0E6-37FE-4267-85EB-E07764D5BE80','MonthReportCEdit2.aspx','2 本月项目现场HSE人力投入情况',2,'MonthReportCItem')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('D8141695-CD8C-4724-98A5-C5DD015FA917','MonthReportCEdit3.aspx','3 本月项目现场HSE人工日统计',3,'MonthReportCItem')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('244E173B-43D8-4D37-B4BE-FFBAF6EC18B7','MonthReportCEdit4.aspx','4 本月项目HSE现场管理',4,'MonthReportCItem')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('890B9A0E-DA44-471A-92BD-E7150E4FFC7C','MonthReportCEdit5.aspx','5 本月项目HSE内业管理',5,'MonthReportCItem')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('7EC9E717-5869-4B16-8D38-7CD156C0330A','MonthReportCEdit6.aspx','6 本月项目HSE费用管理',6,'MonthReportCItem')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('80488E9F-5289-4A77-A7E8-0B13FEF14ABA','MonthReportCEdit7.aspx','7 HSE事故/事件描述',7,'MonthReportCItem')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('FC2F863C-248D-424C-998D-9FC00B55C13D','MonthReportCEdit8.aspx','8 其他工作情况',8,'MonthReportCItem')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('C11BB760-8C4D-489F-8FA3-324BD0CBEB38','MonthReportCEdit9.aspx','9 下月工作计划',9,'MonthReportCItem')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('671D47D7-511A-404C-B864-3179483F3579','MonthReportCEdit10.aspx','10 存在的主要问题及改进措施、 需要项目经理、项目主管、公司相关部门、业主协调解决事宜',10,'MonthReportCItem')
GO

alter table dbo.Project_ProjectUnit add ContractRange nvarchar(500) null
GO
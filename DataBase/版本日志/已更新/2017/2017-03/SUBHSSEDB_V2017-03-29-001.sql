UPDATE Sys_MenuCommon SET MenuName='文件柜B(内业)' WHERE MenuId= 'DDD1CE30-F8B9-4011-A20F-7AC60B34788C'
GO
UPDATE Sys_MenuProjectB SET MenuName='文件柜B(内业)' WHERE MenuId= '200019A4-E24F-4C87-8C52-9970F78DBF73'
GO
UPDATE Sys_MenuProjectA SET MenuName='文件柜B(内业)' WHERE MenuId= '200019A4-E24F-4C87-8C52-9970F78DBF73'
GO

UPDATE Sys_FlowOperate SET Url='../CostGoods/CostManageView.aspx?CostManageId={0}' 
WHERE Url='CostManageView.aspx?CostManageId={0}'
GO

--现场人员信息 发卡卡号只保留一个字段
ALTER TABLE SitePerson_Person DROP COLUMN SendCardNo
GO
--删除发卡 视图
/****** Object:  View [dbo].[HSSE_View_SendCard]    Script Date: 2017/3/29 14:17:16 ******/
DROP VIEW [dbo].[HSSE_View_SendCard]
GO
--安全管理组织机构表增加单位
DELETE FROM SecuritySystem_SafetyManageOrganization
GO
ALTER TABLE SecuritySystem_SafetyManageOrganization ADD UnitId NVARCHAR(50) NULL
GO

ALTER TABLE [dbo].[SecuritySystem_SafetyManageOrganization]  WITH CHECK ADD  CONSTRAINT [FK_SecuritySystem_SafetyManageOrganization_Base_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO
ALTER TABLE [dbo].[SecuritySystem_SafetyManageOrganization] CHECK CONSTRAINT [FK_SecuritySystem_SafetyManageOrganization_Base_Unit]
GO

ALTER VIEW [dbo].[View_SitePerson_Person]
AS
SELECT Person.PersonId,
	Person.CardNo,
	Person.PersonName,
	(Case Person.Sex WHEN '1' THEN '男' WHEN '2' THEN '女' ELSE '' END) AS Sex, 
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
	(CASE Person.IsUsed WHEN 'TRUE' THEN '是' ELSE '否' END) AS IsUsed, 
	(CASE Person.IsCardUsed WHEN 'TRUE' THEN '是' ELSE '否' END) AS IsCardUsed, 
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
	Depart.DepartName
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

ALTER VIEW [dbo].[View_NewDynamic] 
AS
/*首页导航：资质预警*/
SELECT PersonQuality.PersonQualityId AS Id,'特岗人员资质' AS Type, ( '[' + Person.CardNo +']'+ Person.PersonName +'已过期，项目：'+ Project.ProjectName) AS Name,PersonQuality.LimitDate AS Date,'~/QualityAudit/PersonQualityEdit.aspx?PersonId={0}' AS Url 
FROM QualityAudit_PersonQuality AS PersonQuality
	LEFT JOIN SitePerson_Person AS Person ON Person.PersonId = PersonQuality.PersonId
	LEFT JOIN Base_Project AS Project ON Person.ProjectId =Project.ProjectId
WHERE PersonQuality.LimitDate<=GETDATE() 
AND (GETDATE()< Person.OutTime OR Person.OutTime IS NULL)

UNION
SELECT EquipmentQuality.EquipmentQualityId,'特种设备资质', EquipmentQuality.EquipmentQualityName+'已过期，项目：'+ Project.ProjectName,EquipmentQuality.LimitDate,'~/QualityAudit/EquipmentQualityEdit.aspx?EquipmentQualityId={0}' AS Url 
FROM QualityAudit_EquipmentQuality AS EquipmentQuality 
	LEFT JOIN Base_SpecialEquipment AS SpecialEquipment ON SpecialEquipment.SpecialEquipmentId = EquipmentQuality.SpecialEquipmentId
	LEFT JOIN Base_Project AS Project ON EquipmentQuality.ProjectId =Project.ProjectId
WHERE EquipmentQuality.LimitDate<=GETDATE() 
	AND (GETDATE()< EquipmentQuality.OutDate OR EquipmentQuality.OutDate IS NULL)


GO

INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('09186AA8-991C-49F0-9D46-5C798D54FE0B','违章曝光台','InformationProject/Exposure.aspx','PageHeaderFooter',15,'66DFD649-FBC2-463F-BD1A-04095D713C8E','Menu_Project',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('C80C36B2-FD0E-4381-806B-CE348F67B126','09186AA8-991C-49F0-9D46-5C798D54FE0B','增加',1)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('37977456-943F-4C4D-A7A3-2D1698892545','09186AA8-991C-49F0-9D46-5C798D54FE0B','修改',2)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('1209D25D-CFCC-4519-B183-D64410A46E22','09186AA8-991C-49F0-9D46-5C798D54FE0B','删除',3)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('396703EE-68B4-458D-94CF-F0EC8AA92D60','09186AA8-991C-49F0-9D46-5C798D54FE0B','保存',4)	 	
GO

INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('09186AA8-991C-49F0-9D46-5C798D54FE0B','违章曝光台','InformationProject/Exposure.aspx','PageHeaderFooter',15,'66DFD649-FBC2-463F-BD1A-04095D713C8E','Menu_Project',1,0)
GO

CREATE TABLE [dbo].[InformationProject_Exposure](
	[ExposureId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[ExposureCode] [nvarchar](50) NULL,
	[ExposureDate] [datetime] NULL,
	[UnitId] [nvarchar](50) NULL,
	[FileName] [nvarchar](2000) NULL,
	[Remark] [nvarchar](2000) NULL,
	[CompileMan] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
 CONSTRAINT [PK_InformationProject_Exposure] PRIMARY KEY CLUSTERED 
(
	[ExposureId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_Exposure', @level2type=N'COLUMN',@level2name=N'ExposureId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_Exposure', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_Exposure', @level2type=N'COLUMN',@level2name=N'ExposureCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'曝光日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_Exposure', @level2type=N'COLUMN',@level2name=N'ExposureDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单位Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_Exposure', @level2type=N'COLUMN',@level2name=N'UnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_Exposure', @level2type=N'COLUMN',@level2name=N'FileName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_Exposure', @level2type=N'COLUMN',@level2name=N'Remark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_Exposure', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_Exposure', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'违章曝光台表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_Exposure'
GO

ALTER TABLE [dbo].[InformationProject_Exposure]  WITH CHECK ADD  CONSTRAINT [FK_InformationProject_Exposure_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[InformationProject_Exposure] CHECK CONSTRAINT [FK_InformationProject_Exposure_Base_Project]
GO

ALTER TABLE [dbo].[InformationProject_Exposure]  WITH CHECK ADD  CONSTRAINT [FK_InformationProject_Exposure_Base_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[InformationProject_Exposure] CHECK CONSTRAINT [FK_InformationProject_Exposure_Base_Unit]
GO

ALTER TABLE [dbo].[InformationProject_Exposure]  WITH CHECK ADD  CONSTRAINT [FK_InformationProject_Exposure_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[InformationProject_Exposure] CHECK CONSTRAINT [FK_InformationProject_Exposure_Sys_User]
GO

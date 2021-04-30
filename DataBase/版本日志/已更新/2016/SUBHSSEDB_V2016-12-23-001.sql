ALTER TABLE Law_LawRegulationIdentify ADD UpdateDate DATETIME NULL
GO
ALTER TABLE InformationProject_ConstructionStandardIdentify ADD UpdateDate DATETIME NULL
GO

ALTER VIEW [dbo].[View_InformationProject_ConstructionStandardIdentify]
/*标准规范辨识列表视图*/
AS
SELECT ConstructionStandardIdentify.ConstructionStandardIdentifyId,
	CodeRecords.Code AS ConstructionStandardIdentifyCode,
    ConstructionStandardIdentify.VersionNumber,
    ConstructionStandardIdentify.ProjectId,
	ConstructionStandardIdentify.IdentifyPerson,
    ConstructionStandardIdentify.IdentifyDate,
    ConstructionStandardIdentify.Remark,
    ConstructionStandardIdentify.State,
	user1.UserName as IdentifyPersonName,
	(CASE WHEN ConstructionStandardIdentify.State = '0' OR ConstructionStandardIdentify.State IS NULL THEN '待['+OperateUser.UserName+']提交' WHEN ConstructionStandardIdentify.State =  '2' THEN '审核/审批完成' ELSE '待['+OperateUser.UserName+']办理' END) AS  FlowOperateName,
	ConstructionStandardIdentify.UpdateDate
FROM dbo.InformationProject_ConstructionStandardIdentify AS ConstructionStandardIdentify
LEFT JOIN dbo.Sys_User AS user1 ON  ConstructionStandardIdentify.IdentifyPerson =user1.UserId
LEFT JOIN Sys_CodeRecords AS CodeRecords ON ConstructionStandardIdentify.ConstructionStandardIdentifyId=CodeRecords.DataId 
LEFT JOIN Sys_FlowOperate AS FlowOperate ON ConstructionStandardIdentify.ConstructionStandardIdentifyId=FlowOperate.DataId AND FlowOperate.IsClosed <> 1
LEFT JOIN Sys_User AS OperateUser ON FlowOperate.OperaterId=OperateUser.UserId

GO

UPDATE dbo.Sys_MenuProjectA SET  MenuName='安全实施计划/管理规定' WHERE MenuId='E38EE43D-C526-493F-A177-712BA9B22291'
GO
UPDATE dbo.Sys_MenuProjectA SET  MenuName='安全实施计划' WHERE MenuId='CBC47C8B-141C-446B-90D9-CE8F5AE66CE4'
GO
UPDATE dbo.Sys_MenuProjectA SET  MenuName='安全管理规定' WHERE MenuId='775EFCF4-DE5C-46E9-8EA3-B16270E2F6A6'
GO
UPDATE dbo.Sys_MenuProjectA SET  MenuName='项目安全协议清单' WHERE MenuId='874B4232-E0AD-41CD-8C66-8A7FF2D79358'
GO
UPDATE dbo.Sys_MenuProjectA SET  MenuName='作业许可管理' WHERE MenuId='473A87D2-1365-4A68-BD38-06F312F81BC2'
GO
UPDATE Sys_MenuProjectA SET SuperMenu = '5FF7BBD8-3E0A-4C90-8976-AFF5CE7E17A5',SortIndex='30',MenuName='危大工程施工方案清单',Url='Solution/LargerHazardList.aspx' WHERE MenuId= '5B3D3F7B-9B50-4927-B131-11D13D4D1C19'
GO


UPDATE dbo.Sys_MenuProjectB SET  MenuName='安全实施计划/管理规定' WHERE MenuId='E38EE43D-C526-493F-A177-712BA9B22291'
GO
UPDATE dbo.Sys_MenuProjectB SET  MenuName='安全实施计划' WHERE MenuId='CBC47C8B-141C-446B-90D9-CE8F5AE66CE4'
GO
UPDATE dbo.Sys_MenuProjectB SET  MenuName='安全管理规定' WHERE MenuId='775EFCF4-DE5C-46E9-8EA3-B16270E2F6A6'
GO
UPDATE dbo.Sys_MenuProjectB SET  MenuName='项目安全协议清单' WHERE MenuId='874B4232-E0AD-41CD-8C66-8A7FF2D79358'
GO
UPDATE dbo.Sys_MenuProjectB SET  MenuName='作业许可管理' WHERE MenuId='473A87D2-1365-4A68-BD38-06F312F81BC2'
GO
UPDATE Sys_MenuProjectB SET SuperMenu = '5FF7BBD8-3E0A-4C90-8976-AFF5CE7E17A5',SortIndex='30',MenuName='危大工程施工方案清单',Url='Solution/LargerHazardList.aspx' WHERE MenuId= '5B3D3F7B-9B50-4927-B131-11D13D4D1C19'
GO

UPDATE Sys_Menu SET MenuName='安全实施计划' WHERE MenuId='CBC47C8B-141C-446B-90D9-CE8F5AE66CE4'	
GO
UPDATE Sys_Menu SET MenuName='安全管理规定' WHERE MenuId='775EFCF4-DE5C-46E9-8EA3-B16270E2F6A6'
GO
UPDATE Sys_Menu SET MenuName = '项目安全协议清单' WHERE MenuId= '874B4232-E0AD-41CD-8C66-8A7FF2D79358'
GO
UPDATE Sys_Menu SET MenuName = '作业许可管理' WHERE MenuId= '473A87D2-1365-4A68-BD38-06F312F81BC2'
GO
UPDATE Sys_Menu SET SuperMenu = '5FF7BBD8-3E0A-4C90-8976-AFF5CE7E17A5',SortIndex='30',MenuName='危大工程施工方案清单',Url='Solution/LargerHazardList.aspx' WHERE MenuId= '5B3D3F7B-9B50-4927-B131-11D13D4D1C19'
GO

INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('27DE7248-C4FF-4288-BBAC-11CB8741AD67','专家论证清单','Solution/ExpertArgumentList.aspx','PageHeaderFooter',40,'5FF7BBD8-3E0A-4C90-8976-AFF5CE7E17A5','Menu_Project',1,0)
GO
专家论证清单按钮
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('36EE636B-630B-4F42-95B5-8E8C3E4029F7','27DE7248-C4FF-4288-BBAC-11CB8741AD67','增加',1)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('4E709EEA-E13A-4268-9096-84B5AE9D6AC4','27DE7248-C4FF-4288-BBAC-11CB8741AD67','修改',2)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('3B00C7C0-6E6A-4C27-B851-0E15AE1C4755','27DE7248-C4FF-4288-BBAC-11CB8741AD67','删除',3)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('4A355C96-1A0B-4CCF-AE28-916A194B06B6','27DE7248-C4FF-4288-BBAC-11CB8741AD67','保存',4)  
GO

INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('27DE7248-C4FF-4288-BBAC-11CB8741AD67','专家论证清单','Solution/ExpertArgumentList.aspx','PageHeaderFooter',40,'5FF7BBD8-3E0A-4C90-8976-AFF5CE7E17A5','Menu_Project',1,0)
GO

ALTER TABLE dbo.QualityAudit_PersonQuality ADD AuditDate DATETIME NULL
GO

ALTER TABLE Hazard_LargerHazard ADD Descriptions NVARCHAR(500) NULL
GO
ALTER TABLE License_EquipmentSafetyList ADD SendMan NVARCHAR(50) NULL
GO
ALTER TABLE Emergency_EmergencyList ADD AuditMan NVARCHAR(50) NULL
GO
ALTER TABLE Emergency_EmergencyList ADD ApproveMan NVARCHAR(50) NULL
GO

ALTER TABLE [dbo].[Emergency_EmergencyList]  WITH CHECK ADD  CONSTRAINT [FK_Emergency_EmergencyList_Sys_User1] FOREIGN KEY([AuditMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[Emergency_EmergencyList] CHECK CONSTRAINT [FK_Emergency_EmergencyList_Sys_User1]
GO
ALTER TABLE [dbo].[Emergency_EmergencyList]  WITH CHECK ADD  CONSTRAINT [FK_Emergency_EmergencyList_Sys_User2] FOREIGN KEY([ApproveMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[Emergency_EmergencyList] CHECK CONSTRAINT [FK_Emergency_EmergencyList_Sys_User2]
GO


ALTER TABLE Check_IncentiveNotice ADD SignMan NVARCHAR(50) NULL
GO
ALTER TABLE Check_IncentiveNotice ADD ApproveMan NVARCHAR(50) NULL
GO
ALTER TABLE [dbo].[Check_IncentiveNotice]  WITH CHECK ADD  CONSTRAINT [FK_Check_IncentiveNotice_Sys_User1] FOREIGN KEY([SignMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[Check_IncentiveNotice] CHECK CONSTRAINT [FK_Check_IncentiveNotice_Sys_User1]
GO

ALTER TABLE Check_PunishNotice ADD SignMan NVARCHAR(50) NULL
GO
ALTER TABLE Check_PunishNotice ADD ApproveMan NVARCHAR(50) NULL
GO
ALTER TABLE Check_PunishNotice ADD ContractNum NVARCHAR(50) NULL
GO
ALTER TABLE [dbo].[Check_PunishNotice]  WITH CHECK ADD  CONSTRAINT [FK_Check_PunishNotice_Sys_User1] FOREIGN KEY([SignMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[Check_PunishNotice] CHECK CONSTRAINT [FK_Check_PunishNotice_Sys_User1]
GO

ALTER TABLE [dbo].[Check_PunishNotice]  WITH CHECK ADD  CONSTRAINT [FK_Check_PunishNotice_Sys_User2] FOREIGN KEY([ApproveMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[Check_PunishNotice] CHECK CONSTRAINT [FK_Check_PunishNotice_Sys_User2]
GO


/****** Object:  Table [dbo].[Hazard_LargerHazard]    Script Date: 2016/12/21 10:16:33 ******/
DROP TABLE [dbo].[Hazard_LargerHazard]
GO
/****** Object:  Table [dbo].[Solution_LargerHazard]    Script Date: 2016/12/21 10:16:33 ******/
CREATE TABLE [dbo].[Solution_LargerHazard](
	[HazardId] [nvarchar](50) NOT NULL,
	[HazardCode] [nvarchar](50) NULL,
	[HazardType] [nvarchar](50) NULL,
	[ProjectId] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[ExpectedTime] [datetime] NULL,
	[IsArgument] [bit] NULL,
	[RecordTime] [datetime] NULL,
	[RecardMan] [nvarchar](50) NULL,
	[Remark] [nvarchar](1000) NULL,
	[States] [char](1) NULL,
	[Descriptions] [nvarchar](500) NULL,
 CONSTRAINT [PK_Solution_LargerHazard] PRIMARY KEY CLUSTERED 
(
	[HazardId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[Solution_LargerHazard]  WITH CHECK ADD  CONSTRAINT [FK_Solution_LargerSolution_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[Solution_LargerHazard] CHECK CONSTRAINT [FK_Solution_LargerSolution_Base_Project]
GO

ALTER TABLE [dbo].[Solution_LargerHazard]  WITH CHECK ADD  CONSTRAINT [FK_Solution_LargerSolution_Sys_User] FOREIGN KEY([RecardMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[Solution_LargerHazard] CHECK CONSTRAINT [FK_Solution_LargerSolution_Sys_User]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Solution_LargerHazard', @level2type=N'COLUMN',@level2name=N'HazardId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Solution_LargerHazard', @level2type=N'COLUMN',@level2name=N'HazardCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类型（基坑支护、降水工程；土方开挖工程；模板工程及支撑体系；起重吊装及安装拆卸工程；脚手架工程；拆除、爆破工程；其它）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Solution_LargerHazard', @level2type=N'COLUMN',@level2name=N'HazardType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Solution_LargerHazard', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'地点' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Solution_LargerHazard', @level2type=N'COLUMN',@level2name=N'Address'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'预期时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Solution_LargerHazard', @level2type=N'COLUMN',@level2name=N'ExpectedTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否需专家论证' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Solution_LargerHazard', @level2type=N'COLUMN',@level2name=N'IsArgument'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Solution_LargerHazard', @level2type=N'COLUMN',@level2name=N'RecordTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Solution_LargerHazard', @level2type=N'COLUMN',@level2name=N'RecardMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Solution_LargerHazard', @level2type=N'COLUMN',@level2name=N'Remark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'危险性较大的分部分项工程清单表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Solution_LargerHazard'
GO

UPDATE Sys_MenuCommon SET MenuName='岗位信息*' WHERE MenuId='D4FC3583-31A7-49B3-8F32-007E9756D678'
GO
UPDATE Sys_MenuCommon SET MenuName='特岗证书*' WHERE MenuId='3A40AF0B-C9B8-4AF9-A683-FEADD8CC3A1C'
GO
UPDATE Sys_MenuCommon SET MenuName='机具设备*' WHERE MenuId='B7926494-8CCD-40BD-1111-6BD10176DA0D'
GO
UPDATE Sys_MenuCommon SET MenuName='事故类型*' WHERE MenuId='F6C0E3DE-84CB-45CE-A46A-84DD51B8FBCB'
GO
UPDATE Sys_MenuCommon SET MenuName='许可证类型*' WHERE MenuId='4C86AEA0-5D8A-4677-8F53-D1C757141CD3'
GO
UPDATE Sys_MenuCommon SET MenuName='物资名称*' WHERE MenuId='7C07BCB4-5D51-4061-BB71-60AD25F6F21D'
GO
UPDATE Sys_MenuCommon SET MenuName='培训类别*' WHERE MenuId='091322A8-4FFB-472C-91EB-ABB3E491262A'
GO
UPDATE Sys_MenuCommon SET MenuName='培训级别*' WHERE MenuId='B27A0196-06A0-412D-B734-FB348AA6E312'
GO
UPDATE Sys_MenuCommon SET MenuName='专家类别' WHERE MenuId='45EBF358-F03D-4A85-848C-0C59766D3CC8'
GO
UPDATE Sys_MenuCommon SET MenuName='法律法规类型' WHERE MenuId='871A4DA2-2CE0-4049-8255-3759A269110E'
GO
UPDATE Sys_MenuCommon SET MenuName='标准规范类型' WHERE MenuId='ACA1906A-4A68-4632-A13A-342DECE32D3E'
GO
UPDATE Sys_MenuCommon SET MenuName='管理规定分类' WHERE MenuId='5DAADE2B-C2D2-4765-A47A-A1C3139775DC'
GO
UPDATE Sys_MenuCommon SET MenuName='规章制度类别' WHERE MenuId='F7B600D2-999C-4C60-96D4-B7CB7129C0B5'
GO
UPDATE Sys_MenuCommon SET MenuName='应急预案类型' WHERE MenuId='CD5D9B58-4313-4463-BAE6-481A0D3775D9'
GO
UPDATE Sys_MenuCommon SET MenuName='专项方案类别' WHERE MenuId='2181FB42-22F2-4342-B604-96F5770FE892'
GO
UPDATE Sys_MenuCommon SET MenuName='交流话题类型' WHERE MenuId='F416839E-A37B-4DA0-AA50-8B06EBEF3139'
GO
UPDATE Sys_MenuCommon SET MenuName='物资类别' WHERE MenuId='7C07BCB4-5D51-4061-BB71-60AD25F6F21D'
GO
UPDATE Sys_MenuCommon SET MenuName='费用类型*' WHERE MenuId='000F8328-AB84-4235-95F8-E826DB292D83'
GO




--增加角色表 内置项字段
ALTER TABLE Sys_Role ADD IsSystemBuilt BIT NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否系统内置' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Role', @level2type=N'COLUMN',@level2name=N'IsSystemBuilt'
GO

ALTER TABLE Sys_Role ADD AuthorizedRoleIds NVARCHAR(4000)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'可授权角色id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Role', @level2type=N'COLUMN',@level2name=N'AuthorizedRoleIds'
GO

ALTER TABLE Sys_Role ADD AuthorizedRoleNames NVARCHAR(4000)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'可授权角色名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Role', @level2type=N'COLUMN',@level2name=N'AuthorizedRoleNames'
GO

INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('2572CDC8-BA26-4C74-B6F7-CB3D63E91E72','安全体系','','LayoutContent',15,'0','Menu_Server',0,0)
GO
UPDATE dbo.Sys_MenuCommon SET SuperMenu='2572CDC8-BA26-4C74-B6F7-CB3D63E91E72',MenuType='Menu_Server' 
WHERE MenuId IN('8IDKGJE2-09B1-6UIO-3EFM-5TGED48F0001','32F5CC8C-E0F4-456C-AB88-77E36269FA50')
GO

CREATE TABLE [dbo].[Sys_MenuUsed](
	[MenuUsedId] [nvarchar](50) NOT NULL,
	[MenuId] [nvarchar](50) NULL,
	[MenuType] [nvarchar](50) NULL,
	[IsUsed] [bit] NULL,
	[ModifyDate] [datetime] NULL,
 CONSTRAINT [PK_Sys_MenuUsed] PRIMARY KEY CLUSTERED 
(
	[MenuUsedId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_MenuUsed', @level2type=N'COLUMN',@level2name=N'MenuUsedId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_MenuUsed', @level2type=N'COLUMN',@level2name=N'MenuId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单类型【模块】' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_MenuUsed', @level2type=N'COLUMN',@level2name=N'MenuType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否启用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_MenuUsed', @level2type=N'COLUMN',@level2name=N'IsUsed'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_MenuUsed', @level2type=N'COLUMN',@level2name=N'ModifyDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单是否启用记录表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_MenuUsed'
GO

菜单预制启用
INSERT INTO Sys_MenuUsed(MenuUsedId,MenuId,MenuType,IsUsed,ModifyDate) 
SELECT MenuUsedId,MenuId,MenuType,1,GETDATE() FROM Sys_Menu
GO

ALTER TABLE EduTrain_TrainRecord ADD TrainPersonNum INT
GO
ALTER VIEW [dbo].[View_EduTrain_TrainFind]
AS
SELECT person.CardNo,person.PersonName,pu.ProjectId, unit.UnitId, unit.UnitName, post.WorkPostName, train.TrainTitle, 
       train.TrainStartDate,train.TrainEndDate, train.TrainTypeId,train.TeachHour,tt.TrainTypeName, trainDetail.CheckScore, trainDetail.CheckResult,train.TeachMan, 
       pu.UnitType
from  dbo.EduTrain_TrainRecordDetail trainDetail left join
      dbo.EduTrain_TrainRecord train ON train.TrainingId = trainDetail.TrainingId left join
      dbo.SitePerson_Person person ON person.PersonId = trainDetail.PersonId left join
      dbo.Base_WorkPost post ON post.WorkPostId = Person.WorkPostId left join
      dbo.Base_Unit unit ON unit.UnitId = person.UnitId left join
	  dbo.Project_ProjectUnit pu ON pu.UnitId = unit.UnitId left join
	  dbo.Base_TrainType tt ON tt.TrainTypeId=train.TrainTypeId
	  

GO

ALTER TABLE QualityAudit_InUnit ADD HSEAgreementUrl NVARCHAR(500)
GO

ALTER TABLE License_LicenseManager ADD WorkAreaId NVARCHAR(50)
ALTER TABLE License_LicenseManager ADD StartDate DATETIME  
ALTER TABLE License_LicenseManager ADD EndDate DATETIME
GO
ALTER TABLE [dbo].[License_LicenseManager]  WITH CHECK ADD  CONSTRAINT [FK_License_LicenseManager_ProjectData_WorkArea] FOREIGN KEY([WorkAreaId])
REFERENCES [dbo].[ProjectData_WorkArea] ([WorkAreaId])
GO

ALTER TABLE [dbo].[License_LicenseManager] CHECK CONSTRAINT [FK_License_LicenseManager_ProjectData_WorkArea]
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
WorkArea.WorkAreaName
FROM dbo.License_LicenseManager AS LicenseManager
LEFT JOIN dbo.Base_Project AS Project ON Project.ProjectId = LicenseManager.ProjectId
LEFT JOIN dbo.Base_LicenseType AS LicenseType ON LicenseType.LicenseTypeId = LicenseManager.LicenseTypeId
LEFT JOIN dbo.Base_Unit AS Unit ON Unit.UnitId = LicenseManager.UnitId
LEFT JOIN dbo.Sys_User AS Users ON Users.UserId = LicenseManager.CompileMan
LEFT JOIN dbo.ProjectData_WorkArea AS WorkArea ON WorkArea.WorkAreaId = LicenseManager.WorkAreaId


GO


CREATE TABLE [dbo].[Solution_ExpertArgument](
	[ExpertArgumentId] [nvarchar](50) NOT NULL,
	[ExpertArgumentCode] [nvarchar](50) NULL,
	[HazardType] [nvarchar](50) NULL,
	[ProjectId] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[ExpectedTime] [datetime] NULL,
	[IsArgument] [bit] NULL,
	[RecordTime] [datetime] NULL,
	[RecardMan] [nvarchar](50) NULL,
	[Remark] [nvarchar](1000) NULL,
	[States] [char](1) NULL,
	[Descriptions] [nvarchar](500) NULL,
 CONSTRAINT [PK_Solution_ExpertArgument] PRIMARY KEY CLUSTERED 
(
	[ExpertArgumentId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Solution_ExpertArgument', @level2type=N'COLUMN',@level2name=N'ExpertArgumentId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Solution_ExpertArgument', @level2type=N'COLUMN',@level2name=N'ExpertArgumentCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类型（基坑支护、降水工程；土方开挖工程；模板工程及支撑体系；起重吊装及安装拆卸工程；脚手架工程；拆除、爆破工程；其它）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Solution_ExpertArgument', @level2type=N'COLUMN',@level2name=N'HazardType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Solution_ExpertArgument', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'地点' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Solution_ExpertArgument', @level2type=N'COLUMN',@level2name=N'Address'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'预期时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Solution_ExpertArgument', @level2type=N'COLUMN',@level2name=N'ExpectedTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否需专家论证' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Solution_ExpertArgument', @level2type=N'COLUMN',@level2name=N'IsArgument'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Solution_ExpertArgument', @level2type=N'COLUMN',@level2name=N'RecordTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Solution_ExpertArgument', @level2type=N'COLUMN',@level2name=N'RecardMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Solution_ExpertArgument', @level2type=N'COLUMN',@level2name=N'Remark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'专家论证清单表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Solution_ExpertArgument'
GO

ALTER TABLE [dbo].[Solution_ExpertArgument]  WITH CHECK ADD  CONSTRAINT [FK_Solution_ExpertArgument_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[Solution_ExpertArgument] CHECK CONSTRAINT [FK_Solution_ExpertArgument_Base_Project]
GO

ALTER TABLE [dbo].[Solution_ExpertArgument]  WITH CHECK ADD  CONSTRAINT [FK_Solution_ExpertArgument_Sys_User] FOREIGN KEY([RecardMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[Solution_ExpertArgument] CHECK CONSTRAINT [FK_Solution_ExpertArgument_Sys_User]
GO


ALTER TABLE Check_PauseNotice ADD SignMan NVARCHAR(50)
ALTER TABLE Check_PauseNotice ADD ApproveMan NVARCHAR(50)
GO
ALTER TABLE [dbo].[Check_PauseNotice]  WITH CHECK ADD  CONSTRAINT [FK_Check_PauseNotice_Sys_User] FOREIGN KEY([SignMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[Check_PauseNotice] CHECK CONSTRAINT [FK_Check_PauseNotice_Sys_User]
GO
ALTER TABLE [dbo].[Check_PauseNotice]  WITH CHECK ADD  CONSTRAINT [FK_Check_PauseNotice_Sys_User1] FOREIGN KEY([ApproveMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[Check_PauseNotice] CHECK CONSTRAINT [FK_Check_PauseNotice_Sys_User1]
GO


ALTER TABLE InApproveManager_EquipmentQualityIn ADD DutyMan NVARCHAR(50)
GO

ALTER TABLE Base_Project ADD ShortName NVARCHAR(200) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目简称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_Project', @level2type=N'COLUMN',@level2name=N'ShortName'
GO
ALTER TABLE Base_Project ADD ProjectType NVARCHAR(20) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_Project', @level2type=N'COLUMN',@level2name=N'ProjectType'
GO
ALTER TABLE Base_Project ADD PostCode NVARCHAR(20) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'邮政编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_Project', @level2type=N'COLUMN',@level2name=N'PostCode'
GO
ALTER TABLE Base_Project ADD Remark NVARCHAR(500) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_Project', @level2type=N'COLUMN',@level2name=N'Remark'
GO

项目类型
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('07C853E4-BF3A-437E-90A1-44A45211E5E4','1','EPC',1,'ProjectType')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('3753DAE7-C2CF-4C31-B970-4FB5B88C9DA4','2','EPCM',2,'ProjectType')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('05C4234A-86EA-49D0-B868-BF7218746331','3','PMC',3,'ProjectType')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('C361419D-EE17-4480-AB21-DF1438BF4D14','4','其他',4,'ProjectType')
GO
INSERT INTO dbo.Sys_Role(RoleId,RoleName,RoleCode,RoleType,IsAuditFlow,IsSystemBuilt)VALUES('1184835B-73AF-47FB-9F83-20740CE2FAD7','项目经理',100,1,1,1);
INSERT INTO dbo.Sys_Role(RoleId,RoleName,RoleCode,RoleType,IsAuditFlow,IsSystemBuilt)VALUES('A184835B-73AF-ERHM-9F83-20740CE2FAD7','项目副经理',110,1,1,1);
INSERT INTO dbo.Sys_Role(RoleId,RoleName,RoleCode,RoleType,IsAuditFlow,IsSystemBuilt)VALUES('GCB64EF3-AB0A-40BC-824D-CC314598D5DC','质量经理',120,1,1,1);
INSERT INTO dbo.Sys_Role(RoleId,RoleName,RoleCode,RoleType,IsAuditFlow,IsSystemBuilt)VALUES('22F78A47-F59C-4FE8-9C43-2DD304CB2108','施工经理',130,1,1,1);
INSERT INTO dbo.Sys_Role(RoleId,RoleName,RoleCode,RoleType,IsAuditFlow,IsSystemBuilt)VALUES('AAE579CF-A249-4336-BAFE-7FB4D5753451','施工副经理',140,1,1,1);
INSERT INTO dbo.Sys_Role(RoleId,RoleName,RoleCode,RoleType,IsAuditFlow,IsSystemBuilt)VALUES('3314753D-E295-4D87-B938-E8C8EF5C17BC','项目HSSE经理',150,1,1,1);
INSERT INTO dbo.Sys_Role(RoleId,RoleName,RoleCode,RoleType,IsAuditFlow,IsSystemBuilt)VALUES('UTD74411-D95E-4CB3-B6D1-F41B4F4FB268','控制经理',160,1,1,1);
INSERT INTO dbo.Sys_Role(RoleId,RoleName,RoleCode,RoleType,IsAuditFlow,IsSystemBuilt)VALUES('65453141-716D-44F5-922F-80601AC1C219','控制副经理',170,1,1,1);
INSERT INTO dbo.Sys_Role(RoleId,RoleName,RoleCode,RoleType,IsAuditFlow,IsSystemBuilt)VALUES('9BED9186-1FB1-4711-963F-E90D6EC1D629','设计经理',180,1,1,1);
INSERT INTO dbo.Sys_Role(RoleId,RoleName,RoleCode,RoleType,IsAuditFlow,IsSystemBuilt)VALUES('3D2E1BC5-CE1C-4BE3-9A3E-0FBC3738729F','设计副经理',190,1,1,1);
INSERT INTO dbo.Sys_Role(RoleId,RoleName,RoleCode,RoleType,IsAuditFlow,IsSystemBuilt)VALUES('DBEB0B79-0713-495C-8BD9-8C4330D1178A','采购经理',200,1,1,1);
INSERT INTO dbo.Sys_Role(RoleId,RoleName,RoleCode,RoleType,IsAuditFlow,IsSystemBuilt)VALUES('23D656A6-F887-4DBB-9DB6-BBC2887DD86C','采购副经理',210,1,1,1);
INSERT INTO dbo.Sys_Role(RoleId,RoleName,RoleCode,RoleType,IsAuditFlow,IsSystemBuilt)VALUES('TA3737E4-3677-4B7C-B6F6-D546CC2D83E0','开车经理',220,1,1,1);
INSERT INTO dbo.Sys_Role(RoleId,RoleName,RoleCode,RoleType,IsAuditFlow,IsSystemBuilt)VALUES('66D2ECB4-2946-4C6E-8E4B-1C4CD096B8A5','HSSE工程师',230,1,1,1);



CREATE TABLE [dbo].[ProjectData_CodeTemplateRule](
	[CodeTemplateRuleId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[MenuId] [nvarchar](50) NULL,
	[Template] [nvarchar](max) NULL,
	[Symbol] [nvarchar](10) NULL,
	[IsProjectCode] [bit] NULL,
	[Prefix] [nvarchar](50) NULL,
	[IsUnitCode] [bit] NULL,
	[Digit] [int] NULL,
	[OwerSymbol] [nvarchar](10) NULL,
	[OwerIsProjectCode] [bit] NULL,
	[OwerPrefix] [nvarchar](50) NULL,
	[OwerIsUnitCode] [bit] NULL,
	[OwerDigit] [int] NULL,
 CONSTRAINT [PK_ProjectData_CodeTemplateRule] PRIMARY KEY CLUSTERED 
(
	[CodeTemplateRuleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [dbo].[ProjectData_CodeTemplateRule]  WITH CHECK ADD  CONSTRAINT [FK_ProjectData_CodeTemplateRule_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[ProjectData_CodeTemplateRule] CHECK CONSTRAINT [FK_ProjectData_CodeTemplateRule_Base_Project]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单规则id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectData_CodeTemplateRule', @level2type=N'COLUMN',@level2name=N'CodeTemplateRuleId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectData_CodeTemplateRule', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectData_CodeTemplateRule', @level2type=N'COLUMN',@level2name=N'MenuId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'模板内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectData_CodeTemplateRule', @level2type=N'COLUMN',@level2name=N'Template'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'间隔符号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectData_CodeTemplateRule', @level2type=N'COLUMN',@level2name=N'Symbol'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否添加项目号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectData_CodeTemplateRule', @level2type=N'COLUMN',@level2name=N'IsProjectCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'前缀' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectData_CodeTemplateRule', @level2type=N'COLUMN',@level2name=N'Prefix'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否添加单位代号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectData_CodeTemplateRule', @level2type=N'COLUMN',@level2name=N'IsUnitCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流水号位数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectData_CodeTemplateRule', @level2type=N'COLUMN',@level2name=N'Digit'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'间隔符号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectData_CodeTemplateRule', @level2type=N'COLUMN',@level2name=N'OwerSymbol'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否添加项目号(业主)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectData_CodeTemplateRule', @level2type=N'COLUMN',@level2name=N'OwerIsProjectCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'前缀(业主)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectData_CodeTemplateRule', @level2type=N'COLUMN',@level2name=N'OwerPrefix'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否添加单位代号(业主)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectData_CodeTemplateRule', @level2type=N'COLUMN',@level2name=N'OwerIsUnitCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流水号位数(业主)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectData_CodeTemplateRule', @level2type=N'COLUMN',@level2name=N'OwerDigit'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目菜单规则（编码/模板）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectData_CodeTemplateRule'
GO


CREATE TABLE [dbo].[Base_LicenseType](
	[LicenseTypeId] [nvarchar](50) NOT NULL,
	[LicenseTypeCode] [nvarchar](50) NULL,
	[LicenseTypeName] [nvarchar](50) NULL,
	[Remark] [nvarchar](500) NULL,
 CONSTRAINT [PK_HSSE_License_LicenseType] PRIMARY KEY CLUSTERED 
(
	[LicenseTypeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_LicenseType', @level2type=N'COLUMN',@level2name=N'LicenseTypeId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'许可证类型编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_LicenseType', @level2type=N'COLUMN',@level2name=N'LicenseTypeCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'安全许可证类型名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_LicenseType', @level2type=N'COLUMN',@level2name=N'LicenseTypeName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_LicenseType', @level2type=N'COLUMN',@level2name=N'Remark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'安全许可证类型表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_LicenseType'
GO

CREATE TABLE [dbo].[License_LicenseManager](
	[LicenseManagerId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[LicenseTypeId] [nvarchar](50) NULL,
	[LicenseManagerCode] [nvarchar](50) NULL,
	[LicenseManageName] [nvarchar](50) NULL,
	[UnitId] [nvarchar](50) NULL,
	[LicenseManageContents] [nvarchar](max) NULL,
	[CompileMan] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
	[States] [char](1) NULL,
 CONSTRAINT [PK_License_LicenseManager] PRIMARY KEY CLUSTERED 
(
	[LicenseManagerId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_LicenseManager', @level2type=N'COLUMN',@level2name=N'LicenseManagerId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_LicenseManager', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'许可证类型ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_LicenseManager', @level2type=N'COLUMN',@level2name=N'LicenseTypeId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'许可证编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_LicenseManager', @level2type=N'COLUMN',@level2name=N'LicenseManagerCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'许可证名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_LicenseManager', @level2type=N'COLUMN',@level2name=N'LicenseManageName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'申请单位ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_LicenseManager', @level2type=N'COLUMN',@level2name=N'UnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'许可证内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_LicenseManager', @level2type=N'COLUMN',@level2name=N'LicenseManageContents'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_LicenseManager', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_LicenseManager', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_LicenseManager', @level2type=N'COLUMN',@level2name=N'States'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'现场作业许可证' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_LicenseManager'
GO

ALTER TABLE [dbo].[License_LicenseManager]  WITH CHECK ADD  CONSTRAINT [FK_License_LicenseManager_Base_LicenseType] FOREIGN KEY([LicenseTypeId])
REFERENCES [dbo].[Base_LicenseType] ([LicenseTypeId])
GO

ALTER TABLE [dbo].[License_LicenseManager] CHECK CONSTRAINT [FK_License_LicenseManager_Base_LicenseType]
GO

ALTER TABLE [dbo].[License_LicenseManager]  WITH CHECK ADD  CONSTRAINT [FK_License_LicenseManager_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[License_LicenseManager] CHECK CONSTRAINT [FK_License_LicenseManager_Base_Project]
GO

ALTER TABLE [dbo].[License_LicenseManager]  WITH CHECK ADD  CONSTRAINT [FK_License_LicenseManager_Base_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[License_LicenseManager] CHECK CONSTRAINT [FK_License_LicenseManager_Base_Unit]
GO

ALTER TABLE [dbo].[License_LicenseManager]  WITH CHECK ADD  CONSTRAINT [FK_License_LicenseManager_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[License_LicenseManager] CHECK CONSTRAINT [FK_License_LicenseManager_Sys_User]
GO


CREATE VIEW View_License_LicenseManager
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
Users.UserName
FROM dbo.License_LicenseManager AS LicenseManager
LEFT JOIN dbo.Base_Project AS Project ON Project.ProjectId = LicenseManager.ProjectId
LEFT JOIN dbo.Base_LicenseType AS LicenseType ON LicenseType.LicenseTypeId = LicenseManager.LicenseTypeId
LEFT JOIN dbo.Base_Unit AS Unit ON Unit.UnitId = LicenseManager.UnitId
LEFT JOIN dbo.Sys_User AS Users ON Users.UserId = LicenseManager.CompileMan

GO

CREATE TABLE [dbo].[License_SecurityLicense](
	[SecurityLicenseId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[SecurityLicenseCode] [nvarchar](50) NOT NULL,
	[SecurityLicenseName] [nvarchar](50) NOT NULL,
	[NewProjectName] [nvarchar](100) NULL,
	[NewProjectPart] [nvarchar](50) NULL,
	[UnitId] [nvarchar](50) NULL,
	[LimitDate] [nvarchar](10) NULL,
	[SignMan] [nvarchar](50) NULL,
	[SignDate] [datetime] NULL,
	[ConfirmMan] [nvarchar](50) NULL,
	[AddMeasure] [nvarchar](50) NULL,
	[AddMeasureMan] [nvarchar](50) NULL,
	[SecurityLicenseContents] [nvarchar](max) NULL,
 CONSTRAINT [PK_License_SecurityLicense] PRIMARY KEY CLUSTERED 
(
	[SecurityLicenseId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_SecurityLicense', @level2type=N'COLUMN',@level2name=N'SecurityLicenseId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_SecurityLicense', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'许可证编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_SecurityLicense', @level2type=N'COLUMN',@level2name=N'SecurityLicenseCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'许可证名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_SecurityLicense', @level2type=N'COLUMN',@level2name=N'SecurityLicenseName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'新开工程名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_SecurityLicense', @level2type=N'COLUMN',@level2name=N'NewProjectName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'新开工程部位' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_SecurityLicense', @level2type=N'COLUMN',@level2name=N'NewProjectPart'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单位id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_SecurityLicense', @level2type=N'COLUMN',@level2name=N'UnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'施工期限' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_SecurityLicense', @level2type=N'COLUMN',@level2name=N'LimitDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'签发人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_SecurityLicense', @level2type=N'COLUMN',@level2name=N'SignMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'签发日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_SecurityLicense', @level2type=N'COLUMN',@level2name=N'SignDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'确认人员' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_SecurityLicense', @level2type=N'COLUMN',@level2name=N'ConfirmMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'补充措施' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_SecurityLicense', @level2type=N'COLUMN',@level2name=N'AddMeasure'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'补充人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_SecurityLicense', @level2type=N'COLUMN',@level2name=N'AddMeasureMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'许可证内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_SecurityLicense', @level2type=N'COLUMN',@level2name=N'SecurityLicenseContents'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'新开项目作业许可证' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_SecurityLicense'
GO

ALTER TABLE [dbo].[License_SecurityLicense]  WITH CHECK ADD  CONSTRAINT [FK_License_SecurityLicense_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[License_SecurityLicense] CHECK CONSTRAINT [FK_License_SecurityLicense_Base_Project]
GO

ALTER TABLE [dbo].[License_SecurityLicense]  WITH CHECK ADD  CONSTRAINT [FK_License_SecurityLicense_Base_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[License_SecurityLicense] CHECK CONSTRAINT [FK_License_SecurityLicense_Base_Unit]
GO

ALTER TABLE [dbo].[License_SecurityLicense]  WITH CHECK ADD  CONSTRAINT [FK_License_SecurityLicense_Sys_User] FOREIGN KEY([SignMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[License_SecurityLicense] CHECK CONSTRAINT [FK_License_SecurityLicense_Sys_User]
GO

CREATE VIEW View_License_SecurityLicense
/*新开项目安全许可证*/
AS
SELECT SecurityLicense.SecurityLicenseId, 
SecurityLicense.ProjectId, 
SecurityLicense.SecurityLicenseCode, 
SecurityLicense.SecurityLicenseName, 
SecurityLicense.NewProjectName, 
SecurityLicense.NewProjectPart, 
SecurityLicense.UnitId, 
SecurityLicense.LimitDate, 
SecurityLicense.SignMan, 
SecurityLicense.SignDate, 
SecurityLicense.ConfirmMan, 
SecurityLicense.AddMeasure, 
SecurityLicense.AddMeasureMan, 
SecurityLicense.SecurityLicenseContents,
Project.ProjectCode,
Project.ProjectName,
Unit.UnitName,
Users.UserName
FROM dbo.License_SecurityLicense AS	SecurityLicense
LEFT JOIN dbo.Base_Project AS Project ON Project.ProjectId = SecurityLicense.ProjectId
LEFT JOIN dbo.Base_Unit AS Unit ON Unit.UnitId = SecurityLicense.UnitId
LEFT JOIN dbo.Sys_User AS Users ON Users.UserId = SecurityLicense.SignMan 
GO
ALTER TABLE Sys_Menu ADD ModifyDate datetime NULL
GO
ALTER TABLE Base_Unit ADD EMail NVARCHAR(200) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'邮箱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_Unit', @level2type=N'COLUMN',@level2name=N'EMail'
GO
ALTER VIEW [dbo].[View_Base_Unit]  AS 
/*单位信息列表视图*/ 
SELECT UnitId, 
	UnitCode, 
	UnitName, 
	ProjectRange,
	Corporate, 
	Address, 
	Telephone, 
	Fax, 
	EMail,
	UnitType.UnitTypeId,
	UnitType.UnitTypeCode,
	UnitType.UnitTypeName,
	CASE IsThisUnit WHEN 'true' THEN '是' ELSE '否' END AS IsThisUnit,
	CASE IsBuild WHEN 'true' THEN '集团' ELSE '' END AS IsBuild
From dbo.Base_Unit AS Unit
LEFT JOIN Base_UnitType AS UnitType ON UnitType.UnitTypeId=Unit.UnitTypeId

GO

CREATE TABLE [dbo].[Technique_CheckItemSet](
	[CheckItemSetId] [nvarchar](50) NOT NULL,
	[CheckItemName] [nvarchar](50) NULL,
	[SupCheckItem] [nvarchar](50) NULL,
	[CheckType] [char](1) NULL,
	[MapCode] [char](2) NULL,
	[IsEndLever] [bit] NULL,
	[SortIndex] [int] NULL,
	[IsBuiltIn] [bit] NULL,
 CONSTRAINT [PK_Technique_CheckItemSet] PRIMARY KEY CLUSTERED 
(
	[CheckItemSetId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Technique_CheckItemSet', @level2type=N'COLUMN',@level2name=N'CheckItemSetId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'检查项目名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Technique_CheckItemSet', @level2type=N'COLUMN',@level2name=N'CheckItemName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'上级' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Technique_CheckItemSet', @level2type=N'COLUMN',@level2name=N'SupCheckItem'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'检查类型（1-日常巡检，2-专项检查，3-综合大检查）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Technique_CheckItemSet', @level2type=N'COLUMN',@level2name=N'CheckType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否末级' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Technique_CheckItemSet', @level2type=N'COLUMN',@level2name=N'IsEndLever'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排列序号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Technique_CheckItemSet', @level2type=N'COLUMN',@level2name=N'SortIndex'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'检查项目设置表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Technique_CheckItemSet'
GO

CREATE TABLE [dbo].[Technique_CheckItemDetail](
	[CheckItemDetailId] [nvarchar](50) NOT NULL,
	[CheckItemSetId] [nvarchar](50) NOT NULL,
	[CheckContent] [nvarchar](300) NULL,
	[SortIndex] [int] NULL,
	[IsBuiltIn] [bit] NULL,
 CONSTRAINT [PK_Technique_CheckItemDetail] PRIMARY KEY CLUSTERED 
(
	[CheckItemDetailId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Technique_CheckItemDetail', @level2type=N'COLUMN',@level2name=N'CheckItemDetailId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'检查项目' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Technique_CheckItemDetail', @level2type=N'COLUMN',@level2name=N'CheckItemSetId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'检查项明细表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Technique_CheckItemDetail'
GO

ALTER TABLE [dbo].[Technique_CheckItemDetail]  WITH CHECK ADD  CONSTRAINT [FK_Technique_CheckItemDetail_Technique_CheckItemSet] FOREIGN KEY([CheckItemSetId])
REFERENCES [dbo].[Technique_CheckItemSet] ([CheckItemSetId])
GO

ALTER TABLE [dbo].[Technique_CheckItemDetail] CHECK CONSTRAINT [FK_Technique_CheckItemDetail_Technique_CheckItemSet]
GO

CREATE TABLE [dbo].[Check_ProjectCheckItemSet](
	[CheckItemSetId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[CheckItemName] [nvarchar](50) NULL,
	[SupCheckItem] [nvarchar](50) NULL,
	[CheckType] [char](1) NULL,
	[MapCode] [char](2) NULL,
	[IsEndLever] [bit] NULL,
	[SortIndex] [int] NULL,
	[IsBuiltIn] [bit] NULL,
	[OldCheckItemSetId] [nvarchar](50) NULL,
 CONSTRAINT [PK_Check_ProjectCheckItemSet] PRIMARY KEY CLUSTERED 
(
	[CheckItemSetId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_ProjectCheckItemSet', @level2type=N'COLUMN',@level2name=N'CheckItemSetId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'检查项目名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_ProjectCheckItemSet', @level2type=N'COLUMN',@level2name=N'CheckItemName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'上级' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_ProjectCheckItemSet', @level2type=N'COLUMN',@level2name=N'SupCheckItem'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'检查类型（1-日常巡检，2-专项检查，3-综合大检查）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_ProjectCheckItemSet', @level2type=N'COLUMN',@level2name=N'CheckType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否末级' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_ProjectCheckItemSet', @level2type=N'COLUMN',@level2name=N'IsEndLever'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排列序号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_ProjectCheckItemSet', @level2type=N'COLUMN',@level2name=N'SortIndex'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公共资源检查项中的Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_ProjectCheckItemSet', @level2type=N'COLUMN',@level2name=N'OldCheckItemSetId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'检查项目设置表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_ProjectCheckItemSet'
GO

ALTER TABLE [dbo].[Check_ProjectCheckItemSet]  WITH CHECK ADD  CONSTRAINT [FK_Check_ProjectCheckItemSet_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[Check_ProjectCheckItemSet] CHECK CONSTRAINT [FK_Check_ProjectCheckItemSet_Base_Project]
GO

CREATE TABLE [dbo].[Check_ProjectCheckItemDetail](
	[CheckItemDetailId] [nvarchar](50) NOT NULL,
	[CheckItemSetId] [nvarchar](50) NOT NULL,
	[CheckContent] [nvarchar](300) NULL,
	[SortIndex] [int] NULL,
	[IsBuiltIn] [bit] NULL,
 CONSTRAINT [PK_Check_ProjectCheckItemDetail] PRIMARY KEY CLUSTERED 
(
	[CheckItemDetailId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_ProjectCheckItemDetail', @level2type=N'COLUMN',@level2name=N'CheckItemDetailId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'检查项目' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_ProjectCheckItemDetail', @level2type=N'COLUMN',@level2name=N'CheckItemSetId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'检查项明细表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_ProjectCheckItemDetail'
GO

ALTER TABLE [dbo].[Check_ProjectCheckItemDetail]  WITH CHECK ADD  CONSTRAINT [FK_Check_ProjectCheckItemDetail_Technique_CheckItemSet] FOREIGN KEY([CheckItemSetId])
REFERENCES [dbo].[Check_ProjectCheckItemSet] ([CheckItemSetId])
GO

ALTER TABLE [dbo].[Check_ProjectCheckItemDetail] CHECK CONSTRAINT [FK_Check_ProjectCheckItemDetail_Technique_CheckItemSet]
GO

CREATE TABLE [dbo].[Manager_ManagerWeek](
	[ManagerWeekId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NOT NULL,
	[ManagerWeekCode] [nvarchar](50) NULL,
	[ManagerWeekName] [nvarchar](50) NULL,
	[FileContent] [nvarchar](max) NULL,
	[CompileMan] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
	[States] [char](1) NULL,
 CONSTRAINT [PK_Manager_ManagerWeek] PRIMARY KEY CLUSTERED 
(
	[ManagerWeekId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_ManagerWeek', @level2type=N'COLUMN',@level2name=N'ManagerWeekId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_ManagerWeek', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'周报编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_ManagerWeek', @level2type=N'COLUMN',@level2name=N'ManagerWeekCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'周报名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_ManagerWeek', @level2type=N'COLUMN',@level2name=N'ManagerWeekName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'周报内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_ManagerWeek', @level2type=N'COLUMN',@level2name=N'FileContent'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_ManagerWeek', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_ManagerWeek', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_ManagerWeek', @level2type=N'COLUMN',@level2name=N'States'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'管理周报' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_ManagerWeek'
GO

ALTER TABLE [dbo].[Manager_ManagerWeek]  WITH CHECK ADD  CONSTRAINT [FK_Manager_ManagerWeek_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[Manager_ManagerWeek] CHECK CONSTRAINT [FK_Manager_ManagerWeek_Base_Project]
GO

ALTER TABLE [dbo].[Manager_ManagerWeek]  WITH CHECK ADD  CONSTRAINT [FK_Manager_ManagerWeek_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[Manager_ManagerWeek] CHECK CONSTRAINT [FK_Manager_ManagerWeek_Sys_User]
GO
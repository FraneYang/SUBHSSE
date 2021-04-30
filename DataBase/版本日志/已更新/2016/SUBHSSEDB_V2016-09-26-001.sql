
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

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�˵�����id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectData_CodeTemplateRule', @level2type=N'COLUMN',@level2name=N'CodeTemplateRuleId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��Ŀid' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectData_CodeTemplateRule', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�˵�id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectData_CodeTemplateRule', @level2type=N'COLUMN',@level2name=N'MenuId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ģ������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectData_CodeTemplateRule', @level2type=N'COLUMN',@level2name=N'Template'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectData_CodeTemplateRule', @level2type=N'COLUMN',@level2name=N'Symbol'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�Ƿ������Ŀ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectData_CodeTemplateRule', @level2type=N'COLUMN',@level2name=N'IsProjectCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ǰ׺' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectData_CodeTemplateRule', @level2type=N'COLUMN',@level2name=N'Prefix'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�Ƿ���ӵ�λ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectData_CodeTemplateRule', @level2type=N'COLUMN',@level2name=N'IsUnitCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ˮ��λ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectData_CodeTemplateRule', @level2type=N'COLUMN',@level2name=N'Digit'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectData_CodeTemplateRule', @level2type=N'COLUMN',@level2name=N'OwerSymbol'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�Ƿ������Ŀ��(ҵ��)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectData_CodeTemplateRule', @level2type=N'COLUMN',@level2name=N'OwerIsProjectCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ǰ׺(ҵ��)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectData_CodeTemplateRule', @level2type=N'COLUMN',@level2name=N'OwerPrefix'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�Ƿ���ӵ�λ����(ҵ��)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectData_CodeTemplateRule', @level2type=N'COLUMN',@level2name=N'OwerIsUnitCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ˮ��λ��(ҵ��)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectData_CodeTemplateRule', @level2type=N'COLUMN',@level2name=N'OwerDigit'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��Ŀ�˵����򣨱���/ģ�壩' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectData_CodeTemplateRule'
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

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_LicenseType', @level2type=N'COLUMN',@level2name=N'LicenseTypeId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���֤���ͱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_LicenseType', @level2type=N'COLUMN',@level2name=N'LicenseTypeCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ȫ���֤��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_LicenseType', @level2type=N'COLUMN',@level2name=N'LicenseTypeName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ע' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_LicenseType', @level2type=N'COLUMN',@level2name=N'Remark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ȫ���֤���ͱ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_LicenseType'
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

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_LicenseManager', @level2type=N'COLUMN',@level2name=N'LicenseManagerId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ĿID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_LicenseManager', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���֤����ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_LicenseManager', @level2type=N'COLUMN',@level2name=N'LicenseTypeId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���֤���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_LicenseManager', @level2type=N'COLUMN',@level2name=N'LicenseManagerCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���֤����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_LicenseManager', @level2type=N'COLUMN',@level2name=N'LicenseManageName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���뵥λID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_LicenseManager', @level2type=N'COLUMN',@level2name=N'UnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���֤����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_LicenseManager', @level2type=N'COLUMN',@level2name=N'LicenseManageContents'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_LicenseManager', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_LicenseManager', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'״̬' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_LicenseManager', @level2type=N'COLUMN',@level2name=N'States'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ֳ���ҵ���֤' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_LicenseManager'
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
/*�ֳ���ȫ���֤*/
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

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_SecurityLicense', @level2type=N'COLUMN',@level2name=N'SecurityLicenseId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ĿID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_SecurityLicense', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���֤���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_SecurityLicense', @level2type=N'COLUMN',@level2name=N'SecurityLicenseCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���֤����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_SecurityLicense', @level2type=N'COLUMN',@level2name=N'SecurityLicenseName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�¿���������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_SecurityLicense', @level2type=N'COLUMN',@level2name=N'NewProjectName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�¿����̲�λ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_SecurityLicense', @level2type=N'COLUMN',@level2name=N'NewProjectPart'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��λid' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_SecurityLicense', @level2type=N'COLUMN',@level2name=N'UnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ʩ������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_SecurityLicense', @level2type=N'COLUMN',@level2name=N'LimitDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ǩ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_SecurityLicense', @level2type=N'COLUMN',@level2name=N'SignMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ǩ������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_SecurityLicense', @level2type=N'COLUMN',@level2name=N'SignDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ȷ����Ա' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_SecurityLicense', @level2type=N'COLUMN',@level2name=N'ConfirmMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����ʩ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_SecurityLicense', @level2type=N'COLUMN',@level2name=N'AddMeasure'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_SecurityLicense', @level2type=N'COLUMN',@level2name=N'AddMeasureMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���֤����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_SecurityLicense', @level2type=N'COLUMN',@level2name=N'SecurityLicenseContents'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�¿���Ŀ��ҵ���֤' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_SecurityLicense'
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
/*�¿���Ŀ��ȫ���֤*/
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
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_Unit', @level2type=N'COLUMN',@level2name=N'EMail'
GO
ALTER VIEW [dbo].[View_Base_Unit]  AS 
/*��λ��Ϣ�б���ͼ*/ 
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
	CASE IsThisUnit WHEN 'true' THEN '��' ELSE '��' END AS IsThisUnit,
	CASE IsBuild WHEN 'true' THEN '����' ELSE '' END AS IsBuild
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

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Technique_CheckItemSet', @level2type=N'COLUMN',@level2name=N'CheckItemSetId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����Ŀ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Technique_CheckItemSet', @level2type=N'COLUMN',@level2name=N'CheckItemName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ϼ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Technique_CheckItemSet', @level2type=N'COLUMN',@level2name=N'SupCheckItem'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������ͣ�1-�ճ�Ѳ�죬2-ר���飬3-�ۺϴ��飩' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Technique_CheckItemSet', @level2type=N'COLUMN',@level2name=N'CheckType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�Ƿ�ĩ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Technique_CheckItemSet', @level2type=N'COLUMN',@level2name=N'IsEndLever'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Technique_CheckItemSet', @level2type=N'COLUMN',@level2name=N'SortIndex'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����Ŀ���ñ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Technique_CheckItemSet'
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

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Technique_CheckItemDetail', @level2type=N'COLUMN',@level2name=N'CheckItemDetailId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����Ŀ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Technique_CheckItemDetail', @level2type=N'COLUMN',@level2name=N'CheckItemSetId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�������ϸ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Technique_CheckItemDetail'
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

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_ProjectCheckItemSet', @level2type=N'COLUMN',@level2name=N'CheckItemSetId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����Ŀ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_ProjectCheckItemSet', @level2type=N'COLUMN',@level2name=N'CheckItemName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ϼ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_ProjectCheckItemSet', @level2type=N'COLUMN',@level2name=N'SupCheckItem'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������ͣ�1-�ճ�Ѳ�죬2-ר���飬3-�ۺϴ��飩' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_ProjectCheckItemSet', @level2type=N'COLUMN',@level2name=N'CheckType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�Ƿ�ĩ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_ProjectCheckItemSet', @level2type=N'COLUMN',@level2name=N'IsEndLever'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_ProjectCheckItemSet', @level2type=N'COLUMN',@level2name=N'SortIndex'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������Դ������е�Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_ProjectCheckItemSet', @level2type=N'COLUMN',@level2name=N'OldCheckItemSetId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����Ŀ���ñ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_ProjectCheckItemSet'
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

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_ProjectCheckItemDetail', @level2type=N'COLUMN',@level2name=N'CheckItemDetailId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����Ŀ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_ProjectCheckItemDetail', @level2type=N'COLUMN',@level2name=N'CheckItemSetId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�������ϸ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_ProjectCheckItemDetail'
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

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_ManagerWeek', @level2type=N'COLUMN',@level2name=N'ManagerWeekId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��Ŀid' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_ManagerWeek', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ܱ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_ManagerWeek', @level2type=N'COLUMN',@level2name=N'ManagerWeekCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ܱ�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_ManagerWeek', @level2type=N'COLUMN',@level2name=N'ManagerWeekName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ܱ�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_ManagerWeek', @level2type=N'COLUMN',@level2name=N'FileContent'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_ManagerWeek', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_ManagerWeek', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'״̬' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_ManagerWeek', @level2type=N'COLUMN',@level2name=N'States'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����ܱ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_ManagerWeek'
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
/*****系统设置表*****/
--Sys_User
ALTER TABLE Sys_User ADD DeviceId NVARCHAR(100) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'设备ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_User', @level2type=N'COLUMN',@level2name=N'DeviceId'
GO
ALTER TABLE Sys_User ADD SessionString NVARCHAR(MAX) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'参数字符串' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_User', @level2type=N'COLUMN',@level2name=N'SessionString'
GO
ALTER TABLE Sys_User ADD RCount INT NULL
GO
--Sys_Role
ALTER TABLE Sys_Role  ADD IsAPPLeaderRole BIT NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否app领导角色' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Role', @level2type=N'COLUMN',@level2name=N'IsAPPLeaderRole'
GO
--Sys_System	
--Sys_RolePower
--Sys_Const
--Sys_ButtonPower
--Sys_Query
CREATE TABLE [dbo].[Sys_Query](
	[QueryId] [nvarchar](60) NOT NULL,
	[QueryName] [nvarchar](80) NULL,
	[InputParams] [nvarchar](4000) NULL,
	[OutputParams] [nvarchar](4000) NULL,
	[QueryType] [smallint] NULL,
	[QueryFlag] [smallint] NULL,
	[Sort] [smallint] NULL,
	[QuerySql] [nvarchar](4000) NULL,
	[AppQueryDesc] [nvarchar](500) NULL,
	[IsDelete] [bit] NOT NULL,
	[Remark] [nvarchar](500) NULL,
 CONSTRAINT [PK_Sys_AppQuery] PRIMARY KEY CLUSTERED 
(
	[QueryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'查询主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Query', @level2type=N'COLUMN',@level2name=N'QueryId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'查询名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Query', @level2type=N'COLUMN',@level2name=N'QueryName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'入参' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Query', @level2type=N'COLUMN',@level2name=N'InputParams'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'出参' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Query', @level2type=N'COLUMN',@level2name=N'OutputParams'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'查询类型 1:安全;2:质量;3:焊接;4:其他;' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Query', @level2type=N'COLUMN',@level2name=N'QueryType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'具体查询标志' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Query', @level2type=N'COLUMN',@level2name=N'QueryFlag'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Query', @level2type=N'COLUMN',@level2name=N'Sort'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Sql脚本语句' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Query', @level2type=N'COLUMN',@level2name=N'QuerySql'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'查询描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Query', @level2type=N'COLUMN',@level2name=N'AppQueryDesc'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'逻辑删除标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Query', @level2type=N'COLUMN',@level2name=N'IsDelete'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Query', @level2type=N'COLUMN',@level2name=N'Remark'
GO

--Sys_Log
ALTER TABLE Sys_Log ADD LogSource TINYINT NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'日志来源.1:PC; 2:APP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Log', @level2type=N'COLUMN',@level2name=N'LogSource'
GO

--Attach_Image
CREATE TABLE [dbo].[Attach_Image](
	[attach_image_id] [nvarchar](50) NOT NULL,
	[image_series] [nvarchar](20) NULL,
	[file_name] [nvarchar](50) NULL,
	[file_size] [float] NULL,
	[file_type] [nvarchar](10) NULL,
	[created_date] [datetime] NULL,
	[created_by] [nvarchar](50) NULL,
	[series_desc] [nvarchar](500) NULL,
	[file_path] [nvarchar](500) NULL,
	[series_timestamp] [nvarchar](20) NULL,
 CONSTRAINT [PK_Attach_Image] PRIMARY KEY CLUSTERED 
(
	[attach_image_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'UUID主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Attach_Image', @level2type=N'COLUMN',@level2name=N'attach_image_id'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件系列' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Attach_Image', @level2type=N'COLUMN',@level2name=N'image_series'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Attach_Image', @level2type=N'COLUMN',@level2name=N'file_name'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件大小单位KB' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Attach_Image', @level2type=N'COLUMN',@level2name=N'file_size'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Attach_Image', @level2type=N'COLUMN',@level2name=N'file_type'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Attach_Image', @level2type=N'COLUMN',@level2name=N'created_date'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Attach_Image', @level2type=N'COLUMN',@level2name=N'created_by'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图片系列描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Attach_Image', @level2type=N'COLUMN',@level2name=N'series_desc'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图片路径' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Attach_Image', @level2type=N'COLUMN',@level2name=N'file_path'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图片系列标识号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Attach_Image', @level2type=N'COLUMN',@level2name=N'series_timestamp'
GO
--AttachFile
--AudiFlow
--AuditFlowApprove

/*****基础信息表*****/
--Base_ProjectType	
--Base_Project
ALTER TABLE Base_Project ADD ProjectMainPerson NVARCHAR(500) NULL
GO
ALTER TABLE Base_Project ADD ProjectLiaisonPerson NVARCHAR(500) NULL
GO
--Base_Unit	
ALTER TABLE Base_Unit ALTER COLUMN UnitName NVARCHAR(200)
GO
ALTER TABLE Base_Unit ALTER COLUMN UnitCode NVARCHAR(100)
GO
ALTER TABLE Base_Unit ADD ShortUnitName NVARCHAR(50) NULL
GO
--Base_Installation
--Base_TeamGroup
--Base_Organization	
--Base_Position
--Base_Post		
--Base_Title	
--Base_Module
CREATE TABLE [dbo].[Base_Module](
	[module_id] [nvarchar](50) NOT NULL,
	[module_type] [tinyint] NOT NULL,
	[module_name] [nvarchar](50) NOT NULL,
	[is_show] [bit] NOT NULL,
 CONSTRAINT [PK_Base_Module] PRIMARY KEY CLUSTERED 
(
	[module_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'APP模块Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_Module', @level2type=N'COLUMN',@level2name=N'module_id'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'模块类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_Module', @level2type=N'COLUMN',@level2name=N'module_type'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'模块名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_Module', @level2type=N'COLUMN',@level2name=N'module_name'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否显示' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_Module', @level2type=N'COLUMN',@level2name=N'is_show'
GO

--Base_Person
ALTER TABLE SitePerson_Person ADD CertificateId NVARCHAR(50) NULL
GO
ALTER TABLE SitePerson_Person ADD CertificateCode NVARCHAR(20) NULL
GO
ALTER TABLE SitePerson_Person ADD CertificateLimitTime datetime NULL
GO
ALTER TABLE SitePerson_Person ADD QualificationCertificateUrl NVARCHAR(200) NULL
GO
ALTER TABLE SitePerson_Person ADD TrainingCertificateUrl NVARCHAR(200) NULL
GO
ALTER TABLE SitePerson_Person ADD QRCodeAttachUrl NVARCHAR(200) NULL
GO

--Base_PersonBlackList
CREATE TABLE [dbo].[Base_PersonBlackList](
	[PersonBlackListId] [nvarchar](50) NOT NULL,
	[PersonId] [nvarchar](50) NULL,
 CONSTRAINT [PK_Base_PersonBlackList] PRIMARY KEY CLUSTERED 
(
	[PersonBlackListId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Base_PersonBlackList]  WITH CHECK ADD  CONSTRAINT [FK_Base_PersonBlackList_Base_Person] FOREIGN KEY([PersonId])
REFERENCES [dbo].[SitePerson_Person] ([PersonId])
GO

ALTER TABLE [dbo].[Base_PersonBlackList] CHECK CONSTRAINT [FK_Base_PersonBlackList_Base_Person]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_PersonBlackList', @level2type=N'COLUMN',@level2name=N'PersonBlackListId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'人员Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_PersonBlackList', @level2type=N'COLUMN',@level2name=N'PersonId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'人员黑名单' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_PersonBlackList'
GO

/*****项目数据表*****/
--Project_Installation		
--Project_RoleButtonPower	
--Project_RolePower	
--Project_Sys_Set		
--Project_Unit
ALTER TABLE Project_ProjectUnit ADD Phone nvarchar(15) null
go	
ALTER TABLE Project_ProjectUnit ADD AuditMan nvarchar(20) null
go
	
--Project_User
--Project_UserButtonPower	
--Project_UserPower		
--Project_WorkArea
ALTER TABLE ProjectData_WorkArea ADD SystemId nvarchar(50) null
go

/*****安全管理*****/
--HSSE_QualityAudit_PersonQuality	
CREATE TABLE [dbo].[HSSE_QualityAudit_PersonQuality](
	[PersonQualityId] [nvarchar](50) NOT NULL,
	[UnitId] [nvarchar](50) NULL,
	[PersonId] [nvarchar](50) NOT NULL,
	[CertificateNo] [nvarchar](30) NULL,
	[CertificateName] [nvarchar](20) NULL,
	[Grade] [nvarchar](500) NULL,
	[SendUnit] [nvarchar](50) NULL,
	[SendDate] [datetime] NULL,
	[EnableYear] [int] NULL,
	[LateCheckDate] [datetime] NULL,
	[ApprovalPerson] [nvarchar](20) NULL,
	[ScanUrl] [nvarchar](150) NULL,
	[Remark] [nvarchar](200) NULL,
	[ProjectId] [nvarchar](50) NULL,
	[IsSee] [char](1) NULL,
 CONSTRAINT [PK_HSSE_QualityAudit_PersonQuality_1] PRIMARY KEY CLUSTERED 
(
	[PersonQualityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[HSSE_QualityAudit_PersonQuality]  WITH CHECK ADD  CONSTRAINT [FK_HSSE_QualityAudit_PersonQuality_Base_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[HSSE_QualityAudit_PersonQuality] CHECK CONSTRAINT [FK_HSSE_QualityAudit_PersonQuality_Base_Unit]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_QualityAudit_PersonQuality', @level2type=N'COLUMN',@level2name=N'PersonQualityId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单位' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_QualityAudit_PersonQuality', @level2type=N'COLUMN',@level2name=N'UnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'人员' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_QualityAudit_PersonQuality', @level2type=N'COLUMN',@level2name=N'PersonId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'资质证书编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_QualityAudit_PersonQuality', @level2type=N'COLUMN',@level2name=N'CertificateNo'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'特岗证书名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_QualityAudit_PersonQuality', @level2type=N'COLUMN',@level2name=N'CertificateName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'准操项目' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_QualityAudit_PersonQuality', @level2type=N'COLUMN',@level2name=N'Grade'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发证单位' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_QualityAudit_PersonQuality', @level2type=N'COLUMN',@level2name=N'SendUnit'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发证时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_QualityAudit_PersonQuality', @level2type=N'COLUMN',@level2name=N'SendDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'有效年限' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_QualityAudit_PersonQuality', @level2type=N'COLUMN',@level2name=N'EnableYear'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最近审查时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_QualityAudit_PersonQuality', @level2type=N'COLUMN',@level2name=N'LateCheckDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'审批人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_QualityAudit_PersonQuality', @level2type=N'COLUMN',@level2name=N'ApprovalPerson'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'扫描件路径' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_QualityAudit_PersonQuality', @level2type=N'COLUMN',@level2name=N'ScanUrl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_QualityAudit_PersonQuality', @level2type=N'COLUMN',@level2name=N'Remark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'特殊岗位人员资质表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_QualityAudit_PersonQuality'
GO	

--HSSE_Base_Equipment
CREATE TABLE [dbo].[HSSE_Base_Equipment](
	[EquipmentId] [nvarchar](50) NOT NULL,
	[EquipmentType] [nvarchar](30) NULL,
	[IsSpecialEquipment] [bit] NULL,
	[SortIndex] [int] NULL,
	[Def] [nvarchar](100) NULL,
 CONSTRAINT [PK_HSSE_Base_SpecialEquipment] PRIMARY KEY CLUSTERED 
(
	[EquipmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'特种机具设备主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Base_Equipment', @level2type=N'COLUMN',@level2name=N'EquipmentId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'设备名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Base_Equipment', @level2type=N'COLUMN',@level2name=N'EquipmentType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否特殊设备（true-特殊设备,false-不是特殊设备）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Base_Equipment', @level2type=N'COLUMN',@level2name=N'IsSpecialEquipment'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排列序号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Base_Equipment', @level2type=N'COLUMN',@level2name=N'SortIndex'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Base_Equipment', @level2type=N'COLUMN',@level2name=N'Def'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'机具设备表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Base_Equipment'
GO

--HSSE_QualityAudit_EquipmentQuality	
CREATE TABLE [dbo].[HSSE_QualityAudit_EquipmentQuality](
	[EquipmentQualityCode] [nvarchar](50) NOT NULL,
	[SpecialEquipmentType] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[UnitId] [nvarchar](50) NULL,
	[EquipmentName] [nvarchar](20) NULL,
	[SizeModel] [nvarchar](30) NULL,
	[FactoryCode] [nvarchar](30) NULL,
	[CertificateCode] [nvarchar](30) NULL,
	[ProvidedDate] [datetime] NULL,
	[EnableYear] [int] NULL,
	[ApprovalPerson] [nvarchar](20) NULL,
	[ScanUrl] [nvarchar](1000) NULL,
	[Remark] [nvarchar](200) NULL,
	[InTime] [datetime] NULL,
	[OutTime] [datetime] NULL,
	[IsSee] [char](1) NULL,
	[AprovalCode] [nvarchar](50) NULL,
	[AprovalNumber] [nvarchar](50) NULL,
	[AprovalState] [char](1) NULL,
	[AttachUrl] [nvarchar](2000) NULL,
	[VerificationProof] [nvarchar](200) NULL,
	[Operator] [nvarchar](50) NULL,
	[OperationArea] [nvarchar](100) NULL,
	[InspectionInformation] [nvarchar](100) NULL,
	[InspectionUnit] [nvarchar](100) NULL,
	[LimitDate] [datetime] NULL,
	[InspectionUrl] [nvarchar](200) NULL,
 CONSTRAINT [PK_HSSE_QualityAudit_EquipmentQuality] PRIMARY KEY CLUSTERED 
(
	[EquipmentQualityCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[HSSE_QualityAudit_EquipmentQuality]  WITH CHECK ADD  CONSTRAINT [FK_HSSE_QualityAudit_EquipmentQuality_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[HSSE_QualityAudit_EquipmentQuality] CHECK CONSTRAINT [FK_HSSE_QualityAudit_EquipmentQuality_Base_Project]
GO

ALTER TABLE [dbo].[HSSE_QualityAudit_EquipmentQuality]  WITH CHECK ADD  CONSTRAINT [FK_HSSE_QualityAudit_EquipmentQuality_Base_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[HSSE_QualityAudit_EquipmentQuality] CHECK CONSTRAINT [FK_HSSE_QualityAudit_EquipmentQuality_Base_Unit]
GO

ALTER TABLE [dbo].[HSSE_QualityAudit_EquipmentQuality]  WITH CHECK ADD  CONSTRAINT [FK_HSSE_QualityAudit_EquipmentQuality_HSSE_Base_Equipment] FOREIGN KEY([SpecialEquipmentType])
REFERENCES [dbo].[HSSE_Base_Equipment] ([EquipmentId])
GO

ALTER TABLE [dbo].[HSSE_QualityAudit_EquipmentQuality] CHECK CONSTRAINT [FK_HSSE_QualityAudit_EquipmentQuality_HSSE_Base_Equipment]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_QualityAudit_EquipmentQuality', @level2type=N'COLUMN',@level2name=N'EquipmentQualityCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'特种机具设备类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_QualityAudit_EquipmentQuality', @level2type=N'COLUMN',@level2name=N'SpecialEquipmentType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'所属项目' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_QualityAudit_EquipmentQuality', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'所属单位' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_QualityAudit_EquipmentQuality', @level2type=N'COLUMN',@level2name=N'UnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'机具名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_QualityAudit_EquipmentQuality', @level2type=N'COLUMN',@level2name=N'EquipmentName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'规格型号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_QualityAudit_EquipmentQuality', @level2type=N'COLUMN',@level2name=N'SizeModel'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'出厂编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_QualityAudit_EquipmentQuality', @level2type=N'COLUMN',@level2name=N'FactoryCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'合格证编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_QualityAudit_EquipmentQuality', @level2type=N'COLUMN',@level2name=N'CertificateCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报验日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_QualityAudit_EquipmentQuality', @level2type=N'COLUMN',@level2name=N'ProvidedDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'有效年限' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_QualityAudit_EquipmentQuality', @level2type=N'COLUMN',@level2name=N'EnableYear'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最近检验单位' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_QualityAudit_EquipmentQuality', @level2type=N'COLUMN',@level2name=N'ApprovalPerson'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报验扫描件' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_QualityAudit_EquipmentQuality', @level2type=N'COLUMN',@level2name=N'ScanUrl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_QualityAudit_EquipmentQuality', @level2type=N'COLUMN',@level2name=N'Remark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'特殊机具设备资质表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_QualityAudit_EquipmentQuality'
GO
	
--HSSE_Solution_ConstructSolutionAudit
CREATE TABLE [dbo].[HSSE_Solution_ConstructSolutionAudit](
	[ConstructSolutionAuditId] [nvarchar](50) NOT NULL,
	[ConstructSolutionCode] [nvarchar](50) NULL,
	[AuditMan] [nvarchar](50) NULL,
	[AuditDate] [datetime] NULL,
	[AuditStep] [char](1) NULL,
	[AuditNum] [int] NULL,
 CONSTRAINT [PK_HSSE_Solution_ConstructSolutionAudit] PRIMARY KEY CLUSTERED 
(
	[ConstructSolutionAuditId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Solution_ConstructSolutionAudit', @level2type=N'COLUMN',@level2name=N'ConstructSolutionAuditId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'施工方案编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Solution_ConstructSolutionAudit', @level2type=N'COLUMN',@level2name=N'ConstructSolutionCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'审查人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Solution_ConstructSolutionAudit', @level2type=N'COLUMN',@level2name=N'AuditMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'审查时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Solution_ConstructSolutionAudit', @level2type=N'COLUMN',@level2name=N'AuditDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'审查步骤(0-修改完善后重报，1-编制，2-现场HSSE工程师审查, 3-现场HSSE经理审查，4-项目HSSE经理审查，5-施工经理审查/批准，6-项目经理批准)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Solution_ConstructSolutionAudit', @level2type=N'COLUMN',@level2name=N'AuditStep'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'施工方案审查表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Solution_ConstructSolutionAudit'
GO
--HSSE_Hazard_HazardRegisterTypes
CREATE TABLE [dbo].[HSSE_Hazard_HazardRegisterTypes](
	[RegisterTypesId] [nvarchar](50) NOT NULL,
	[RegisterTypesName] [nvarchar](200) NULL,
	[TypeCode] [nvarchar](50) NULL,
	[HazardRegisterType] [char](1) NULL,
	[GroupType] [char](1) NULL,
	[Remark] [nvarchar](200) NULL,
	[IsPunished] [bit] NULL,
 CONSTRAINT [PK_HSSE_Hazard_HazardRegisterType] PRIMARY KEY CLUSTERED 
(
	[RegisterTypesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'巡检问题类型id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_HazardRegisterTypes', @level2type=N'COLUMN',@level2name=N'RegisterTypesId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'巡检类型名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_HazardRegisterTypes', @level2type=N'COLUMN',@level2name=N'RegisterTypesName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_HazardRegisterTypes', @level2type=N'COLUMN',@level2name=N'TypeCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'巡检(手机)隐患类型表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_HazardRegisterTypes'
GO
--HSSE_Hazard_HazardRegister
CREATE TABLE [dbo].[HSSE_Hazard_HazardRegister](
	[HazardRegisterId] [nvarchar](50) NOT NULL,
	[HazardCode] [nvarchar](20) NULL,
	[RegisterDate] [datetime] NULL,
	[RegisterDef] [nvarchar](500) NULL,
	[Rectification] [nvarchar](60) NULL,
	[Place] [nvarchar](50) NULL,
	[ResponsibleUnit] [nvarchar](50) NULL,
	[Observer] [nvarchar](20) NULL,
	[RectifiedDate] [datetime] NULL,
	[AttachUrl] [nvarchar](150) NULL,
	[ProjectId] [nvarchar](50) NULL,
	[states] [char](1) NULL,
	[IsEffective] [char](1) NULL,
	[ResponsibleMan] [nvarchar](50) NULL,
	[CheckManId] [nvarchar](50) NULL,
	[CheckTime] [datetime] NULL,
	[RectificationPeriod] [datetime] NULL,
	[ImageUrl] [nvarchar](2000) NULL,
	[RectificationImageUrl] [nvarchar](2000) NULL,
	[RectificationTime] [datetime] NULL,
	[ConfirmMan] [nvarchar](50) NULL,
	[ConfirmDate] [datetime] NULL,
	[HandleIdea] [nvarchar](500) NULL,
	[CutPayment] [int] NOT NULL,
	[ProblemTypes] [char](1) NULL,
	[RegisterTypesId] [nvarchar](50) NULL,
	[CheckCycle] [char](1) NULL,
	[CheckItemDetailId] [nvarchar](50) NULL,
	[SupCheckItemSetId] [nvarchar](50) NULL,
	[CheckItemSetId] [nvarchar](50) NULL,
	[CheckSpecialId] [nvarchar](50) NULL,
	[InstallationId] [nvarchar](50) NULL,
	[SafeSupervisionId] [nvarchar](50) NULL,
	[ResponsibleMan2] [nvarchar](50) NULL,
	[SafeSupervisionIsOK] [bit] NULL,
	[GpsLocation] [nvarchar](50) NULL,
	[IsWx] [nvarchar](1) NULL,
	[DIC_ID] [varchar](60) NULL,
 CONSTRAINT [PK_HSSE_Hazard_HazardRegister] PRIMARY KEY CLUSTERED 
(
	[HazardRegisterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[HSSE_Hazard_HazardRegister] ADD  DEFAULT ((0)) FOR [CutPayment]
GO

ALTER TABLE [dbo].[HSSE_Hazard_HazardRegister] ADD  CONSTRAINT [DF_HSSE_Hazard_HazardRegister_CheckCycle]  DEFAULT ('D') FOR [CheckCycle]
GO

ALTER TABLE [dbo].[HSSE_Hazard_HazardRegister] ADD  CONSTRAINT [DF_HSSE_Hazard_HazardRegister_IsWx]  DEFAULT (N'N') FOR [IsWx]
GO

ALTER TABLE [dbo].[HSSE_Hazard_HazardRegister]  WITH CHECK ADD  CONSTRAINT [FK_HSSE_Hazard_HazardRegister_Base_Unit] FOREIGN KEY([ResponsibleUnit])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[HSSE_Hazard_HazardRegister] CHECK CONSTRAINT [FK_HSSE_Hazard_HazardRegister_Base_Unit]
GO

ALTER TABLE [dbo].[HSSE_Hazard_HazardRegister]  WITH CHECK ADD  CONSTRAINT [FK_HSSE_Hazard_HazardRegister_HSSE_Hazard_HazardRegisterTypes] FOREIGN KEY([RegisterTypesId])
REFERENCES [dbo].[HSSE_Hazard_HazardRegisterTypes] ([RegisterTypesId])
GO

ALTER TABLE [dbo].[HSSE_Hazard_HazardRegister] CHECK CONSTRAINT [FK_HSSE_Hazard_HazardRegister_HSSE_Hazard_HazardRegisterTypes]
GO


EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_HazardRegister', @level2type=N'COLUMN',@level2name=N'HazardRegisterId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'观察日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_HazardRegister', @level2type=N'COLUMN',@level2name=N'RegisterDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'观察说明' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_HazardRegister', @level2type=N'COLUMN',@level2name=N'RegisterDef'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'整改措施' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_HazardRegister', @level2type=N'COLUMN',@level2name=N'Rectification'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'地点' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_HazardRegister', @level2type=N'COLUMN',@level2name=N'Place'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'负责方（单位）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_HazardRegister', @level2type=N'COLUMN',@level2name=N'ResponsibleUnit'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'观察员' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_HazardRegister', @level2type=N'COLUMN',@level2name=N'Observer'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'整改日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_HazardRegister', @level2type=N'COLUMN',@level2name=N'RectifiedDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态 1：待整改；2：已整改，待确认；3：已确认，即已闭环；4：已作废' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_HazardRegister', @level2type=N'COLUMN',@level2name=N'states'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否审核 0：待审核；1：审核通过，待整改；' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_HazardRegister', @level2type=N'COLUMN',@level2name=N'IsEffective'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'负责人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_HazardRegister', @level2type=N'COLUMN',@level2name=N'ResponsibleMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'巡检员' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_HazardRegister', @level2type=N'COLUMN',@level2name=N'CheckManId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'巡检时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_HazardRegister', @level2type=N'COLUMN',@level2name=N'CheckTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'整改期限' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_HazardRegister', @level2type=N'COLUMN',@level2name=N'RectificationPeriod'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'整改前图片路径' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_HazardRegister', @level2type=N'COLUMN',@level2name=N'ImageUrl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'整改后图片路径' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_HazardRegister', @level2type=N'COLUMN',@level2name=N'RectificationImageUrl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'整改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_HazardRegister', @level2type=N'COLUMN',@level2name=N'RectificationTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'确认人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_HazardRegister', @level2type=N'COLUMN',@level2name=N'ConfirmMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'确认时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_HazardRegister', @level2type=N'COLUMN',@level2name=N'ConfirmDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'整改意见' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_HazardRegister', @level2type=N'COLUMN',@level2name=N'HandleIdea'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'问题类型 0：安全；1：质量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_HazardRegister', @level2type=N'COLUMN',@level2name=N'ProblemTypes'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'巡检隐患类型id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_HazardRegister', @level2type=N'COLUMN',@level2name=N'RegisterTypesId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'检查' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_HazardRegister', @level2type=N'COLUMN',@level2name=N'CheckCycle'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'详细Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_HazardRegister', @level2type=N'COLUMN',@level2name=N'CheckItemDetailId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'上级d' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_HazardRegister', @level2type=N'COLUMN',@level2name=N'SupCheckItemSetId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'检查项id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_HazardRegister', @level2type=N'COLUMN',@level2name=N'CheckItemSetId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'装置Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_HazardRegister', @level2type=N'COLUMN',@level2name=N'InstallationId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'质量巡检问题类型id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_HazardRegister', @level2type=N'COLUMN',@level2name=N'DIC_ID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'危险观察登记' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_HazardRegister'
GO

--HSSE_Hazard_PunishItem
CREATE TABLE [dbo].[HSSE_Hazard_PunishItem](
	[PunishItemId] [nvarchar](50) NOT NULL,
	[PunishItemCode] [nvarchar](50) NULL,
	[PunishItemType] [char](1) NULL,
	[PunishItemContent] [nvarchar](500) NULL,
	[Deduction] [int] NULL,
	[PunishMoney] [int] NULL,
 CONSTRAINT [PK_HSSE_Hazard_PunishItem] PRIMARY KEY CLUSTERED 
(
	[PunishItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_PunishItem', @level2type=N'COLUMN',@level2name=N'PunishItemId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_PunishItem', @level2type=N'COLUMN',@level2name=N'PunishItemCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类型（1-安全，2-质量）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_PunishItem', @level2type=N'COLUMN',@level2name=N'PunishItemType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'处罚内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_PunishItem', @level2type=N'COLUMN',@level2name=N'PunishItemContent'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'扣分（一般(1)、较重（3）、严重（6）、非常严重（9）、极其严重（12））' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_PunishItem', @level2type=N'COLUMN',@level2name=N'Deduction'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'罚款' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_PunishItem', @level2type=N'COLUMN',@level2name=N'PunishMoney'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'处罚项基础信息表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_PunishItem'
GO
		
--HSSE_Hazard_PunishRecord
CREATE TABLE [dbo].[HSSE_Hazard_PunishRecord](
	[PunishRecordId] [nvarchar](50) NOT NULL,
	[PersonId] [nvarchar](50) NULL,
	[PunishItemId] [nvarchar](50) NULL,
	[PunishDate] [datetime] NULL,
	[CompileMan] [nvarchar](50) NULL,
	[HazardRegisterId] [nvarchar](50) NULL,
	[ProjectId] [nvarchar](50) NULL,
	[PunishReason] [nvarchar](200) NULL,
 CONSTRAINT [PK_HSSE_Hazard_PunishRecord] PRIMARY KEY CLUSTERED 
(
	[PunishRecordId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[HSSE_Hazard_PunishRecord]  WITH CHECK ADD  CONSTRAINT [FK_HSSE_Hazard_PunishRecord_Base_Person] FOREIGN KEY([PersonId])
REFERENCES [dbo].[SitePerson_Person] ([PersonId])
GO

ALTER TABLE [dbo].[HSSE_Hazard_PunishRecord] CHECK CONSTRAINT [FK_HSSE_Hazard_PunishRecord_Base_Person]
GO

ALTER TABLE [dbo].[HSSE_Hazard_PunishRecord]  WITH CHECK ADD  CONSTRAINT [FK_HSSE_Hazard_PunishRecord_HSSE_Hazard_HazardRegister] FOREIGN KEY([HazardRegisterId])
REFERENCES [dbo].[HSSE_Hazard_HazardRegister] ([HazardRegisterId])
GO

ALTER TABLE [dbo].[HSSE_Hazard_PunishRecord] CHECK CONSTRAINT [FK_HSSE_Hazard_PunishRecord_HSSE_Hazard_HazardRegister]
GO

ALTER TABLE [dbo].[HSSE_Hazard_PunishRecord]  WITH CHECK ADD  CONSTRAINT [FK_HSSE_Hazard_PunishRecord_HSSE_Hazard_PunishItem] FOREIGN KEY([PunishItemId])
REFERENCES [dbo].[HSSE_Hazard_PunishItem] ([PunishItemId])
GO

ALTER TABLE [dbo].[HSSE_Hazard_PunishRecord] CHECK CONSTRAINT [FK_HSSE_Hazard_PunishRecord_HSSE_Hazard_PunishItem]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_PunishRecord', @level2type=N'COLUMN',@level2name=N'PunishRecordId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'人员Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_PunishRecord', @level2type=N'COLUMN',@level2name=N'PersonId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'处罚项Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_PunishRecord', @level2type=N'COLUMN',@level2name=N'PunishItemId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'处罚日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_PunishRecord', @level2type=N'COLUMN',@level2name=N'PunishDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_PunishRecord', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'关联隐患主键ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_PunishRecord', @level2type=N'COLUMN',@level2name=N'HazardRegisterId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'处罚记录表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_PunishRecord'
GO
--HSSE_Check_CheckItemSet	
CREATE TABLE [dbo].[HSSE_Check_CheckItemSet](
	[CheckItemSetId] [nvarchar](50) NOT NULL,
	[CheckItemName] [nvarchar](50) NULL,
	[SupCheckItem] [nvarchar](50) NULL,
	[MapCode] [char](2) NULL,
	[IsEndLever] [bit] NULL,
	[SortIndex] [int] NULL,
	[IsBuiltIn] [bit] NULL,
 CONSTRAINT [PK_HSSE_Check_CheckItemSet] PRIMARY KEY CLUSTERED 
(
	[CheckItemSetId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Check_CheckItemSet', @level2type=N'COLUMN',@level2name=N'CheckItemSetId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'检查项目名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Check_CheckItemSet', @level2type=N'COLUMN',@level2name=N'CheckItemName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'上级' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Check_CheckItemSet', @level2type=N'COLUMN',@level2name=N'SupCheckItem'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否末级' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Check_CheckItemSet', @level2type=N'COLUMN',@level2name=N'IsEndLever'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排列序号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Check_CheckItemSet', @level2type=N'COLUMN',@level2name=N'SortIndex'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'检查项目设置表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Check_CheckItemSet'
GO

--HSSE_Check_CheckItemDetail	
CREATE TABLE [dbo].[HSSE_Check_CheckItemDetail](
	[CheckItemDetailId] [nvarchar](50) NOT NULL,
	[CheckItemSetId] [nvarchar](50) NOT NULL,
	[CheckContent] [nvarchar](300) NULL,
	[SortIndex] [int] NULL,
	[IsBuiltIn] [bit] NULL,
 CONSTRAINT [PK_HSSE_Check_CheckItemDetail] PRIMARY KEY CLUSTERED 
(
	[CheckItemDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[HSSE_Check_CheckItemDetail]  WITH CHECK ADD  CONSTRAINT [FK_HSSE_Check_CheckItemDetail_HSSE_Check_CheckItemSet] FOREIGN KEY([CheckItemSetId])
REFERENCES [dbo].[HSSE_Check_CheckItemSet] ([CheckItemSetId])
GO

ALTER TABLE [dbo].[HSSE_Check_CheckItemDetail] CHECK CONSTRAINT [FK_HSSE_Check_CheckItemDetail_HSSE_Check_CheckItemSet]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Check_CheckItemDetail', @level2type=N'COLUMN',@level2name=N'CheckItemDetailId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'检查项目' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Check_CheckItemDetail', @level2type=N'COLUMN',@level2name=N'CheckItemSetId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'检查项明细表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Check_CheckItemDetail'
GO

--HSSE_Weather
CREATE TABLE [dbo].[HSSE_Weather](
	[WeatherId] [int] NOT NULL,
	[WeatherStatus] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_HSSE_Weather] PRIMARY KEY CLUSTERED 
(
	[WeatherId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Weather', @level2type=N'COLUMN',@level2name=N'WeatherId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'天气情况' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Weather', @level2type=N'COLUMN',@level2name=N'WeatherStatus'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'天气情况表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Weather'
GO

--HSSE_Check_CheckSpecial
CREATE TABLE [dbo].[HSSE_Check_CheckSpecial](
	[CheckSpecialCode] [nvarchar](50) NOT NULL,
	[CheckSpecialName] [nvarchar](50) NULL,
	[ProjectId] [nvarchar](50) NOT NULL,
	[UnitId] [nvarchar](500) NULL,
	[WorkArea] [nvarchar](500) NULL,
	[WeatherId] [int] NULL,
	[Temperature] [numeric](3, 1) NULL,
	[Hnmidity] [numeric](3, 1) NULL,
	[WindSpeed] [numeric](3, 1) NULL,
	[AllowType] [nvarchar](50) NULL,
	[LimitTime] [datetime] NULL,
	[IsField] [bit] NULL,
	[IsInPlace] [bit] NULL,
	[ViolationRule] [nvarchar](10) NULL,
	[CheckPerson] [nvarchar](50) NULL,
	[CheckTime] [datetime] NULL,
	[VerifyPerson] [nvarchar](50) NULL,
	[VerifyTime] [datetime] NULL,
	[CheckType] [char](1) NOT NULL,
	[ToIncentiveNotice] [nvarchar](30) NULL,
	[ToPauseNotice] [nvarchar](30) NULL,
	[ToRectifyNotice] [nvarchar](30) NULL,
 CONSTRAINT [PK_HSSE_Check_CheckSpecial] PRIMARY KEY CLUSTERED 
(
	[CheckSpecialCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[HSSE_Check_CheckSpecial]  WITH CHECK ADD  CONSTRAINT [FK_HSSE_Check_CheckSpecial_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[HSSE_Check_CheckSpecial] CHECK CONSTRAINT [FK_HSSE_Check_CheckSpecial_Base_Project]
GO

ALTER TABLE [dbo].[HSSE_Check_CheckSpecial]  WITH CHECK ADD  CONSTRAINT [FK_HSSE_Check_CheckSpecial_HSSE_Weather] FOREIGN KEY([WeatherId])
REFERENCES [dbo].[HSSE_Weather] ([WeatherId])
GO

ALTER TABLE [dbo].[HSSE_Check_CheckSpecial] CHECK CONSTRAINT [FK_HSSE_Check_CheckSpecial_HSSE_Weather]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编号（主键）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Check_CheckSpecial', @level2type=N'COLUMN',@level2name=N'CheckSpecialCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'检查名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Check_CheckSpecial', @level2type=N'COLUMN',@level2name=N'CheckSpecialName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Check_CheckSpecial', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单位' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Check_CheckSpecial', @level2type=N'COLUMN',@level2name=N'UnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作业区域' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Check_CheckSpecial', @level2type=N'COLUMN',@level2name=N'WorkArea'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'天气情况' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Check_CheckSpecial', @level2type=N'COLUMN',@level2name=N'WeatherId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'温度' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Check_CheckSpecial', @level2type=N'COLUMN',@level2name=N'Temperature'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'湿度' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Check_CheckSpecial', @level2type=N'COLUMN',@level2name=N'Hnmidity'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'风速' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Check_CheckSpecial', @level2type=N'COLUMN',@level2name=N'WindSpeed'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'许可证类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Check_CheckSpecial', @level2type=N'COLUMN',@level2name=N'AllowType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'有效期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Check_CheckSpecial', @level2type=N'COLUMN',@level2name=N'LimitTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'监护人在场（true-是，false-否）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Check_CheckSpecial', @level2type=N'COLUMN',@level2name=N'IsField'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'监护措施是否到位（true-是，false-否）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Check_CheckSpecial', @level2type=N'COLUMN',@level2name=N'IsInPlace'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'违章处理' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Check_CheckSpecial', @level2type=N'COLUMN',@level2name=N'ViolationRule'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'检查人（可能多人）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Check_CheckSpecial', @level2type=N'COLUMN',@level2name=N'CheckPerson'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'检查时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Check_CheckSpecial', @level2type=N'COLUMN',@level2name=N'CheckTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'验证人（可能多人）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Check_CheckSpecial', @level2type=N'COLUMN',@level2name=N'VerifyPerson'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'验证时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Check_CheckSpecial', @level2type=N'COLUMN',@level2name=N'VerifyTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'检查类型(1-作业许可检查，2-管理行为检查，3-现场作业过程检查)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Check_CheckSpecial', @level2type=N'COLUMN',@level2name=N'CheckType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'对应奖罚通知编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Check_CheckSpecial', @level2type=N'COLUMN',@level2name=N'ToIncentiveNotice'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'对应停工令编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Check_CheckSpecial', @level2type=N'COLUMN',@level2name=N'ToPauseNotice'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'对应患整改通知编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Check_CheckSpecial', @level2type=N'COLUMN',@level2name=N'ToRectifyNotice'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'专项检查表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Check_CheckSpecial'
GO

--HSSE_Check_CheckSpecialDetail	
CREATE TABLE [dbo].[HSSE_Check_CheckSpecialDetail](
	[CheckSpecialDetailId] [nvarchar](50) NOT NULL,
	[CheckSpecialCode] [nvarchar](50) NULL,
	[CheckItemDetailId] [nvarchar](50) NULL,
	[IsCheck] [bit] NULL,
 CONSTRAINT [PK_HSSE_Check_CheckSpecialDetail] PRIMARY KEY CLUSTERED 
(
	[CheckSpecialDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[HSSE_Check_CheckSpecialDetail]  WITH CHECK ADD  CONSTRAINT [FK_HSSE_Check_CheckSpecialDetail_HSSE_Check_CheckItemDetail] FOREIGN KEY([CheckItemDetailId])
REFERENCES [dbo].[HSSE_Check_CheckItemDetail] ([CheckItemDetailId])
GO

ALTER TABLE [dbo].[HSSE_Check_CheckSpecialDetail] CHECK CONSTRAINT [FK_HSSE_Check_CheckSpecialDetail_HSSE_Check_CheckItemDetail]
GO

ALTER TABLE [dbo].[HSSE_Check_CheckSpecialDetail]  WITH CHECK ADD  CONSTRAINT [FK_HSSE_Check_CheckSpecialDetail_HSSE_Check_CheckItemDetail1] FOREIGN KEY([CheckItemDetailId])
REFERENCES [dbo].[HSSE_Check_CheckItemDetail] ([CheckItemDetailId])
GO

ALTER TABLE [dbo].[HSSE_Check_CheckSpecialDetail] CHECK CONSTRAINT [FK_HSSE_Check_CheckSpecialDetail_HSSE_Check_CheckItemDetail1]
GO

ALTER TABLE [dbo].[HSSE_Check_CheckSpecialDetail]  WITH CHECK ADD  CONSTRAINT [FK_HSSE_Check_CheckSpecialDetail_HSSE_Check_CheckSpecial] FOREIGN KEY([CheckSpecialCode])
REFERENCES [dbo].[HSSE_Check_CheckSpecial] ([CheckSpecialCode])
GO

ALTER TABLE [dbo].[HSSE_Check_CheckSpecialDetail] CHECK CONSTRAINT [FK_HSSE_Check_CheckSpecialDetail_HSSE_Check_CheckSpecial]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Check_CheckSpecialDetail', @level2type=N'COLUMN',@level2name=N'CheckSpecialDetailId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'专项检查' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Check_CheckSpecialDetail', @level2type=N'COLUMN',@level2name=N'CheckSpecialCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'检查项目' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Check_CheckSpecialDetail', @level2type=N'COLUMN',@level2name=N'CheckItemDetailId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否检查' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Check_CheckSpecialDetail', @level2type=N'COLUMN',@level2name=N'IsCheck'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'专项检查明细表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Check_CheckSpecialDetail'
GO

--HSSE_Hazard_SafeSupervision
CREATE TABLE [dbo].[HSSE_Hazard_SafeSupervision](
	[SafeSupervisionId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[CheckType] [char](1) NULL,
	[CheckManId] [nvarchar](50) NULL,
	[CheckDate] [datetime] NULL,
	[SafeSupervisionCode] [nvarchar](50) NULL,
 CONSTRAINT [PK_HSSE_Hazard_SafeSupervision] PRIMARY KEY CLUSTERED 
(
	[SafeSupervisionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[HSSE_Hazard_SafeSupervision]  WITH CHECK ADD  CONSTRAINT [FK_HSSE_Hazard_SafeSupervision_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[HSSE_Hazard_SafeSupervision] CHECK CONSTRAINT [FK_HSSE_Hazard_SafeSupervision_Base_Project]
GO

ALTER TABLE [dbo].[HSSE_Hazard_SafeSupervision]  WITH CHECK ADD  CONSTRAINT [FK_HSSE_Hazard_SafeSupervision_Sys_User] FOREIGN KEY([CheckManId])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[HSSE_Hazard_SafeSupervision] CHECK CONSTRAINT [FK_HSSE_Hazard_SafeSupervision_Sys_User]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_SafeSupervision', @level2type=N'COLUMN',@level2name=N'SafeSupervisionId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_SafeSupervision', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'检查类型（1-公司领导班子，2-职能管理部门领导，3-业务单位领导班子，4-业务单位部门领导）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_SafeSupervision', @level2type=N'COLUMN',@level2name=N'CheckType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'检查人Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_SafeSupervision', @level2type=N'COLUMN',@level2name=N'CheckManId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'检查日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_SafeSupervision', @level2type=N'COLUMN',@level2name=N'CheckDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'APP安全督察主表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_SafeSupervision'
GO

--HSSE_Hazard_Geography
CREATE TABLE [dbo].[HSSE_Hazard_Geography](
	[geography_id] [nvarchar](50) NOT NULL,
	[HazardRegisterId] [nvarchar](50) NULL,
	[geography_coordinate] [nvarchar](50) NULL,
	[landmark] [nvarchar](500) NULL,
	[create_date] [datetime] NOT NULL
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_Geography', @level2type=N'COLUMN',@level2name=N'geography_id'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'巡检外键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_Geography', @level2type=N'COLUMN',@level2name=N'HazardRegisterId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'坐标[经度，维度]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_Geography', @level2type=N'COLUMN',@level2name=N'geography_coordinate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'地标' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_Geography', @level2type=N'COLUMN',@level2name=N'landmark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'日期时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_Geography', @level2type=N'COLUMN',@level2name=N'create_date'
GO

/*****质量管理*****/
--WBS_CnProfession
--Wbs_UnitProject		
--Wbs_WbsSet	
--CQMS_quality_three_check	

/*****设备管理*****/
--SBGL_Equipment
--SBGL_EquipmentAccident	
--SBGL_EquipmentCheck	
--SBGL_EquipmentCheckDetail	
--SBGL_EquipmentInApply	
--SBGL_EquipmentInCheck
--SBGL_EquipmentInCheckDetail	
--SBGL_EquipmentInCheckItem	
--SBGL_EquipmentMaintain
--SBGL_EquipmentMaintainDetail
--SBGL_EquipmentMaintainItem
--SBGL_EquipmentOtherCheckItem	
--SBGL_EquipmentOut
--SBGL_EquipmentRepair
--SBGL_EquipmentRepairDetail
--SBGL_EquipmentRepairItem
--SBGL_EquipmentType
--SBGL_ProjectEquipment
--SBGL_EquipmentInApplyDetail
--SBGL_EquipmentOutDetail			
--SBGL_Equipment
--SBGL_EquipmentInCheck
--SBGL_Equipment
--SBGL_EquipmentInCheck	

/*****焊接管理*****/
--HJGL_BS_WelderQualifiedProject
--HJGL_BS_Welder	
--HJGL_BS_Component
--HJGL_BS_IsoClass
--HJGL_BS_JointType
--HJGL_BS_MaterialClass
--HJGL_BS_MaterialCompare
--HJGL_BS_MaterialGroup
--HJGL_BS_NDTRate
--HJGL_BS_NDTType
--HJGL_BS_PackageTestType
--HJGL_BS_SchTab
--HJGL_BS_Service
--HJGL_BS_SlopeType
--HJGL_BS_Standard
--HJGL_BS_Steel
--HJGL_BS_WelderItem
--HJGL_BS_WelderQualifiedProject
--HJGL_BS_WelderScore
--HJGL_BS_WeldLocation
--HJGL_BS_WeldMaterial
--HJGL_BS_WeldMethod
--HJGL_BS_WeldMethodItem
--HJGL_BS_WeldPosition
--HJGL_BS_WeldPositionItem
	
--HJGL_ElectrodeRecovery
--HJGL_ElectrodeRecoveryItem
--HJGL_Project_WeldMaterial
--HJGL_BS_Steel  
--HJGL_BO_PreWeldReportMain
--HJGL_PW_IsoInfo
--HJGL_PW_JointInfo

--HJGL_ElectrodeRecovery

/*****质量评价*****/
--Indicator


--Sys_Query 插入查询数据
INSERT INTO Sys_Query(QueryId,QueryName,InputParams,OutputParams,QueryType,QueryFlag,Sort,QuerySql,AppQueryDesc,IsDelete) 
VALUES ('021EEEE8-63F4-4141-A27E-6D90FF0B4879','【检查人员信息】','[{"paramsEnName":"projectId","paramsZhName":"项目Id","isNotNull":"true"},{"paramsEnName":"queryPk","paramsZhName":"查询主键","isNotNull":"true"},{"paramsEnName":"listIndex","paramsZhName":"列表显示索引","initValue":"0","isNotNull":"false"},{"paramsEnName":"queryNo","paramsZhName":"人员卡号","isNotNull":"true"}]','[{"paramsEnName":"CardNo","paramsZhDesc":"卡号"},{"paramsEnName":"PersonName","paramsZhDesc":"姓名"},{"paramsEnName":"IdentityCard","paramsZhDesc":"身份证号"},{"paramsEnName":"sex","paramsZhDesc":"性别"},{"paramsEnName":"PhotoUrl","paramsZhDesc":"头像"},{"paramsEnName":"Telephone","paramsZhDesc":"手机号码"},{"paramsEnName":"UnitCode","paramsZhDesc":"所属单位"},{"paramsEnName":"UnitName","paramsZhDesc":"单位名称"},{"paramsEnName":"WorkAreaCode","paramsZhDesc":"所属工区"},{"paramsEnName":"WorkAreaName","paramsZhDesc":"工区名称"},{"paramsEnName":"CertificateNo","paramsZhDesc":"证书编号"},{"paramsEnName":"CertificateName","paramsZhDesc":"证书名称"},{"paramsEnName":"SendUnit","paramsZhDesc":"发证单位"},{"paramsEnName":"SendDate","paramsZhDesc":"发证日期"},{"paramsEnName":"EnableYear","paramsZhDesc":"有效期限"},{"paramsEnName":"LateCheckDate","paramsZhDesc":"最新核证日期"}]',1,1,5,' select   BP.CardNo,BP.PersonName,BP.IdentityCard,BP.Sex,BP.PhotoUrl,BP.Telephone,  BU.UnitCode,BU.UnitName,  WA.WorkAreaCode,WA.WorkAreaName,  PQ.CertificateNo,PQ.CertificateName,PQ.SendUnit,PQ.SendDate,PQ.EnableYear,PQ.LateCheckDate   from Base_Person BP   left join Base_Unit BU on BP.UnitId = BU.UnitId  left join Project_WorkArea WA on BP.WorkAreaId = WA.WorkAreaId  left join HSSE_QualityAudit_PersonQuality PQ on BP.PostId = PQ.PersonQualityId  where BP.projectId = @project_Id and CardNo = @query_No','通过扫描或者输入【人员卡号】抽查核实现场人员基本信息(姓名、岗位、单位和资质证书等相关信息)。',0) 
GO
INSERT INTO Sys_Query(QueryId,QueryName,InputParams,OutputParams,QueryType,QueryFlag,Sort,QuerySql,AppQueryDesc,IsDelete) 
VALUES ('05695D2F-CA26-44B3-B251-C8F358D170DA','【管线焊口信息查询及核对】','[{"paramsEnName":"projectId","paramsZhName":"项目Id","isNotNull":"true"},{"paramsEnName":"queryPk","paramsZhName":"查询主键","isNotNull":"true"},{"paramsEnName":"listIndex","paramsZhName":"列表显示索引","initValue":"JOT_JointNo,JOT_WeldDate,CellWelderName","isNotNull":"false"},{"paramsEnName":"queryNo","paramsZhName":"管线编号","isNotNull":"true"}]','[{"paramsEnName":"ISO_IsoNo","paramsZhDesc":"管线编号"},{"paramsEnName":"JOT_JointNo","paramsZhDesc":"焊口代号"},{"paramsEnName":"CellWelderCode","paramsZhDesc":"盖面焊工编号"},{"paramsEnName":"CellWelderName","paramsZhDesc":"盖面焊工姓名"},{"paramsEnName":"FloorWelderCode","paramsZhDesc":"打底焊工编号"},{"paramsEnName":"FloorWelderName","paramsZhDesc":"打底焊工姓名"},{"paramsEnName":"JOT_DoneDin","paramsZhDesc":"完成达因"},{"paramsEnName":"JOT_Dia","paramsZhDesc":"焊口达因"},{"paramsEnName":"JOT_WeldDate","paramsZhDesc":"焊接日报日期"},{"paramsEnName":"JOT_DailyReportNo","paramsZhDesc":"焊接日报编号"},{"paramsEnName":"UserName","paramsZhDesc":"焊接日报制表人"},{"paramsEnName":"CHT_TableDate","paramsZhDesc":"焊接日报制表日期"},{"paramsEnName":"WLO_Code","paramsZhDesc":"预制/安装"},{"paramsEnName":"JOT_Size","paramsZhDesc":"尺寸"},{"paramsEnName":"JOT_Sch","paramsZhDesc":"壁厚"},{"paramsEnName":"JOT_JointDesc","paramsZhDesc":"焊口规格"},{"paramsEnName":"JOT_Location","paramsZhDesc":"焊口位置"},{"paramsEnName":"WMT_MatCode","paramsZhDesc":"焊接材质"}]',3,7,20,'select PW.ISO_IsoNo,JOT_JointNo,BW.WED_Code AS CellWelderCode,BW.WED_Name AS CellWelderName,  BE.WED_Code AS FloorWelderCode,BE.WED_Name AS FloorWelderName,JOT_DoneDin,JOT_Dia,JOT_WeldDate,  JOT_DailyReportNo,UserName,CHT_TableDate,  WLO_Code,JOT_Size,JOT_Sch,JOT_JointDesc,JOT_Location,WM.WMT_MatCode  from HJGL_PW_JointInfo PJ   left join HJGL_PW_IsoInfo PW on PJ.ISO_ID = PW.ISO_ID  left join HJGL_BS_Welder BW on BW.WED_ID = JOT_CellWelder  left join HJGL_BS_Welder BE on BE.WED_ID = JOT_FloorWelder  left join HJGL_BS_WeldMaterial WM on WME_ID = JOT_WeldMat  left join HJGL_BO_WeldReportMain WR on WR.DReportID = PJ.DReportID   left join Sys_User SU on SU.UserId = WR.CHT_Tabler  where PW.projectId = @project_Id and  PW.ISO_IsoNo = @query_No  order by JOT_JointNo','通过扫描或者输入【管线编号】查询该管线的所有焊口信息情况便于现场及时核对。',0) 
GO
INSERT INTO Sys_Query(QueryId,QueryName,InputParams,OutputParams,QueryType,QueryFlag,Sort,QuerySql,AppQueryDesc,IsDelete) 
VALUES ('06EFB24C-DE2C-4F60-965F-D1734ED7AD52','【施工及HSE专项方案查询】','[{"paramsEnName":"projectId","paramsZhName":"项目Id","isNotNull":"true"},{"paramsEnName":"queryPk","paramsZhName":"查询主键","isNotNull":"true"},{"paramsEnName":"listIndex","paramsZhName":"列表显示索引","initValue":"0","isNotNull":"false"},{"paramsEnName":"queryNo","paramsZhName":"方案审查编号","isNotNull":"true"}]','[{"paramsEnName":"ConstructSolutionCode","paramsZhDesc":"方案审查编号"},{"paramsEnName":"FileName","paramsZhDesc":"方案名称"},{"paramsEnName":"VersionNo","paramsZhDesc":"版本号"},{"paramsEnName":"ProjectCode","paramsZhDesc":"所属项目"},{"paramsEnName":"ProjectName","paramsZhDesc":"项目名称"},{"paramsEnName":"UnitCode","paramsZhDesc":"所属单位"},{"paramsEnName":"UnitName","paramsZhDesc":"单位代号"},{"paramsEnName":"SolutionName","paramsZhDesc":"方案类型"},{"paramsEnName":"State","paramsZhDesc":"审批状态"},{"paramsEnName":"StateDesc","paramsZhDesc":"状态描述"},{"paramsEnName":"CompileUserName","paramsZhDesc":"编制人"},{"paramsEnName":"CompileDate","paramsZhDesc":"编制时间"},{"paramsEnName":"AuditUserName","paramsZhDesc":"审核人"},{"paramsEnName":"AuditDate","paramsZhDesc":"审核时间"}]',1,6,15,' select SC.ConstructSolutionCode,FileName,VersionNo ,BP.ProjectCode,BP.ProjectName,BU.UnitCode,BU.UnitName,  SS.SolutionName,SC.State,''0-修改完善后重报，1-编制，2-现场HSSE工程师审查, 3-现场HSSE经理审查，4-项目HSSE经理审查，5-施工经理审查/批准，6-项目经理批准，7-审批完成'' as StateDesc,  SU.UserName as CompileUserName,SC.CompileDate,UU.UserName as AuditUserName,CS.AuditDate  from HSSE_Solution_ConstructSolution SC  left join HSSE_Solution_ConstructSolutionAudit CS on SC.ConstructSolutionCode = CS.ConstructSolutionCode  left join Base_Project BP on BP.ProjectId = SC.ProjectId  left join Base_Unit BU on BU.UnitId = SC.UnitId  left join Sys_User  SU on SU.UserId = SC.CompileMan   left join Sys_User  UU on SU.UserId = CS.AuditMan   left join HSSE_Solution_SolutionSet SS on SS.SolutionSetId = SC.SolutinType  where BP.projectId = @project_Id and  SC.ConstructSolutionCode = @query_No','通过扫描或者输入【方案审查编号】查询施工方案中的HSE部分内容或HSE专项方案内容。',0) 
GO
INSERT INTO Sys_Query(QueryId,QueryName,InputParams,OutputParams,QueryType,QueryFlag,Sort,QuerySql,AppQueryDesc,IsDelete) 
VALUES ('08F41137-5339-49EB-B519-EA5352CEAC6B','【检查特殊工种作业人员信息】','[{"paramsEnName":"projectId","paramsZhName":"项目Id","isNotNull":"true"},{"paramsEnName":"queryPk","paramsZhName":"查询主键","isNotNull":"true"},{"paramsEnName":"listIndex","paramsZhName":"列表显示索引","initValue":"0","isNotNull":"false"},{"paramsEnName":"queryNo","paramsZhName":"人员卡号","isNotNull":"true"}]','[{"paramsEnName":"CardNo","paramsZhDesc":"卡号"},{"paramsEnName":"PersonName","paramsZhDesc":"姓名"},{"paramsEnName":"IdentityCard","paramsZhDesc":"身份证号"},{"paramsEnName":"sex","paramsZhDesc":"性别"},{"paramsEnName":"PhotoUrl","paramsZhDesc":"头像"},{"paramsEnName":"Telephone","paramsZhDesc":"手机号码"},{"paramsEnName":"UnitCode","paramsZhDesc":"所属单位"},{"paramsEnName":"UnitName","paramsZhDesc":"单位名称"},{"paramsEnName":"WorkAreaCode","paramsZhDesc":"所属工区"},{"paramsEnName":"WorkAreaName","paramsZhDesc":"工区名称"},{"paramsEnName":"CertificateNo","paramsZhDesc":"证书编号"},{"paramsEnName":"CertificateName","paramsZhDesc":"证书名称"},{"paramsEnName":"SendUnit","paramsZhDesc":"发证单位"},{"paramsEnName":"SendDate","paramsZhDesc":"发证日期"},{"paramsEnName":"LimitDate","paramsZhDesc":"有效期限"},{"paramsEnName":"LateCheckDate","paramsZhDesc":"最新核证日期"},{"paramsEnName":"ApprovalPerson","paramsZhDesc":"审核人"}]',2,8,5,'select BP.CardNo,BP.PersonName,BP.IdentityCard,BP.Sex,BP.PhotoUrl,BP.Telephone,  BU.UnitCode,BU.UnitName,WA.WorkAreaCode,WA.WorkAreaName,  PQ.CertificateNo,PQ.CertificateName,PQ.SendUnit,PQ.SendDate,PQ.LimitDate,  PQ.ApprovalPerson,PQ.LateCheckDate  from CQMS_QualityAudit_PersonQuality PQ  left join Base_Person BP on BP.PersonId = PQ.PersonId  left join Base_Unit BU on BU.UnitId = PQ.UnitId  left join Project_WorkArea WA on BP.WorkAreaId = WA.WorkAreaId  where BP.projectId = @project_Id and  CardNo = @query_No','通过扫描或者输入【人员卡号】抽查核实现场特殊工种人员基本信息(姓名、岗位、单位和资质证书等相关信息)。',0) 
GO
INSERT INTO Sys_Query(QueryId,QueryName,InputParams,OutputParams,QueryType,QueryFlag,Sort,QuerySql,AppQueryDesc,IsDelete) 
VALUES ('185F5797-C51F-4876-A13C-2FE1A49863CA','【焊工信息查询】','[{"paramsEnName":"projectId","paramsZhName":"项目Id","isNotNull":"true"},{"paramsEnName":"queryPk","paramsZhName":"查询主键","isNotNull":"true"},{"paramsEnName":"listIndex","paramsZhName":"列表显示索引","initValue":"0","isNotNull":"false"},{"paramsEnName":"queryNo","paramsZhName":"身份证号","isNotNull":"true"}]','[{"paramsEnName":"WED_Code","paramsZhDesc":"焊工代号"},{"paramsEnName":"WED_Name","paramsZhDesc":"焊工姓名"},{"paramsEnName":"IdentityCard","paramsZhDesc":"身份证号"},{"paramsEnName":"UnitName","paramsZhDesc":"单位名称"},{"paramsEnName":"TeamGroupName","paramsZhDesc":"班组名称"},       {"paramsEnName":"WED_WorkCode","paramsZhDesc":"证书编号"},{"paramsEnName":"WED_Class","paramsZhDesc":"焊工等级"}]',3,15,10,'SELECT Welder.WED_ID,         Welder.WED_Code,         Welder.WED_Name,         Welder.IdentityCard,         Welder.WED_Unit,         Unit.UnitName,         Welder.EDU_ID,         Education.TeamGroupName,         Welder.WED_WorkCode,         Welder.WED_Class         FROM HJGL_BS_Welder AS Welder    LEFT JOIN Base_Unit AS Unit ON Welder.WED_Unit = Unit.UnitId   LEFT JOIN Base_TeamGroup AS Education ON Welder.EDU_ID = Education.TeamGroupId   WHERE Welder.ProjectId=@project_Id and Welder.IdentityCard=@query_No','通过扫描或者输入【身份证号】查询该焊工的基本信息。',0) 
GO
INSERT INTO Sys_Query(QueryId,QueryName,InputParams,OutputParams,QueryType,QueryFlag,Sort,QuerySql,AppQueryDesc,IsDelete) 
VALUES ('37F4B825-40DA-4589-AF38-EE7D71F3CC6C','【施工质量预警功能】','[{"paramsEnName":"projectId","paramsZhName":"项目Id","isNotNull":"true"},{"paramsEnName":"queryPk","paramsZhName":"查询主键","isNotNull":"true"},{"paramsEnName":"listIndex","paramsZhName":"列表显示索引","initValue":"QualityId,QualityDec,QualityType","isNotNull":"false"},{"paramsEnName":"queryNo","paramsZhName":"施工项目Id","isNotNull":"true"}]','[{"paramsEnName":"QualityId","paramsZhDesc":"预警Id"},{"paramsEnName":"QualityDec","paramsZhDesc":"预警描述"},{"paramsEnName":"QualityType","paramsZhDesc":"预警类型"}]',2,11,20,'EXEC CQMS_SpEnableCueQualityDesktop @query_No','该查询结果包括：单位资质到期预警、特岗资质人员资质证书到期预警、特种设备有效期预警、设备仪器检定日期预警、专业质量技术问题到期预警。',0) 
GO
INSERT INTO Sys_Query(QueryId,QueryName,InputParams,OutputParams,QueryType,QueryFlag,Sort,QuerySql,AppQueryDesc,IsDelete) 
VALUES ('43A8A222-4028-4F3B-B760-ED51AC5843C6','【施工安全预警功能】','[{"paramsEnName":"projectId","paramsZhName":"项目Id","isNotNull":"true"},{"paramsEnName":"queryPk","paramsZhName":"查询主键","isNotNull":"true"},{"paramsEnName":"listIndex","paramsZhName":"列表显示索引","initValue":"QualityId,QualityDec,QualityType","isNotNull":"false"},{"paramsEnName":"queryNo","paramsZhName":"施工项目Id","isNotNull":"true"}]','[{"paramsEnName":"QualityId","paramsZhDesc":"预警Id"},{"paramsEnName":"QualityDec","paramsZhDesc":"预警描述"},{"paramsEnName":"QualityType","paramsZhDesc":"预警类型"}]',1,10,20,'EXEC HSSE_SpEnableCueQualityDesktop @query_No','该查询结果包括：单位资质到期预警、特岗资质人员资质证书到期预警、特种设备有效期预警、设备仪器检定日期预警。',0) 
GO
INSERT INTO Sys_Query(QueryId,QueryName,InputParams,OutputParams,QueryType,QueryFlag,Sort,QuerySql,AppQueryDesc,IsDelete) 
VALUES ('57790C1C-A9FF-41B2-BFDD-C4FEBEB98841','【质量施工专项方案查询】','[{"paramsEnName":"projectId","paramsZhName":"项目Id","isNotNull":"true"},{"paramsEnName":"queryPk","paramsZhName":"查询主键","isNotNull":"true"},{"paramsEnName":"listIndex","paramsZhName":"列表显示索引","initValue":"0","isNotNull":"false"},{"paramsEnName":"queryNo","paramsZhName":"方案审查编号","isNotNull":"true"}]','[{"paramsEnName":"ConstructSolutionCode","paramsZhDesc":"方案审查编号"},{"paramsEnName":"FileName","paramsZhDesc":"方案名称"},{"paramsEnName":"VersionNo","paramsZhDesc":"版本号"},{"paramsEnName":"ProjectCode","paramsZhDesc":"所属项目"},{"paramsEnName":"ProjectName","paramsZhDesc":"项目名称"},{"paramsEnName":"UnitCode","paramsZhDesc":"所属单位"},{"paramsEnName":"UnitName","paramsZhDesc":"单位代号"},{"paramsEnName":"SolutionName","paramsZhDesc":"方案类型"},{"paramsEnName":"State","paramsZhDesc":"审批状态"},{"paramsEnName":"StateDesc","paramsZhDesc":"状态描述"},{"paramsEnName":"CompileUserName","paramsZhDesc":"编制人"},{"paramsEnName":"CompileDate","paramsZhDesc":"编制时间"},{"paramsEnName":"AuditUserName","paramsZhDesc":"审核人"},{"paramsEnName":"AuditDate","paramsZhDesc":"审核时间"}]',2,9,10,'select SC.ConstructSolutionCode,FileName,VersionNo ,BP.ProjectCode,BP.ProjectName,BU.UnitCode,BU.UnitName,  SS.SolutionName,SC.State,''0-修改完善后重报，1-编制，2-现场HSSE工程师审查, 3-现场HSSE经理审查，4-项目HSSE经理审查，5-施工经理审查/批准，6-项目经理批准，7-审批完成'' as StateDesc,  SU.UserName as CompileUserName,SC.CompileDate,UU.UserName as AuditUserName,CS.AuditDate  from CQMS_Solution_ConstructSolution SC  left join CQMS_Solution_ConstructSolutionAudit CS on SC.ConstructSolutionId = CS.ConstructSolutionId  left join Base_Project BP on BP.ProjectId = SC.ProjectId  left join Base_Unit BU on BU.UnitId = SC.UnitId  left join Sys_User  SU on SU.UserId = SC.CompileMan   left join Sys_User  UU on SU.UserId = CS.AuditMan   left join HSSE_Solution_SolutionSet SS on SS.SolutionSetId = SC.CnProfessionId  where BP.projectId = @project_Id and SC.ConstructSolutionCode = @query_No','通过扫描或者输入【质量方案审查编号】查询质量施工方案，便于各方质量管理人员、施工管理人员审批施工作业许可证等信息。',0) 
GO
INSERT INTO Sys_Query(QueryId,QueryName,InputParams,OutputParams,QueryType,QueryFlag,Sort,QuerySql,AppQueryDesc,IsDelete) 
VALUES ('5AE3E1D1-C26C-4250-8960-AF3CE7F647EE','【焊工业绩分析核对】','[{"paramsEnName":"projectId","paramsZhName":"项目Id","isNotNull":"true"},{"paramsEnName":"queryPk","paramsZhName":"查询主键","isNotNull":"true"},{"paramsEnName":"listIndex","paramsZhName":"列表显示索引","initValue":"0","isNotNull":"false"},{"paramsEnName":"queryNo","paramsZhName":"焊工编号","isNotNull":"true"}]','[{"paramsEnName":"UnitName","paramsZhDesc":"所属单位"}, {"paramsEnName":"EDU_Name","paramsZhDesc":"所属班组"}, {"paramsEnName":"WED_Code","paramsZhDesc":"焊工编号"}, {"paramsEnName":"WED_Name","paramsZhDesc":"焊工姓名"}, {"paramsEnName":"WED_Sex","paramsZhDesc":"性别"}, {"paramsEnName":"WED_Birthday","paramsZhDesc":"出生日期"}, {"paramsEnName":"WED_WorkCode","paramsZhDesc":"上岗证书"}, {"paramsEnName":"WED_Class","paramsZhDesc":"焊工等级"}, {"paramsEnName":"WED_IfOnGuard","paramsZhDesc":"在岗状态"}, {"paramsEnName":"total_jot","paramsZhDesc":"总焊口数"}, {"paramsEnName":"totaldin","paramsZhDesc":"总达因数"}, {"paramsEnName":"total_repairjot","paramsZhDesc":"总返口数"}, {"paramsEnName":"repairrate","paramsZhDesc":"返修率%"}, {"paramsEnName":"totalfilm","paramsZhDesc":"总片数"}, {"paramsEnName":"passfilm","paramsZhDesc":"合格片数"}, {"paramsEnName":"notpassfilm","paramsZhDesc":"不合格片数"}, {"paramsEnName":"passrate","paramsZhDesc":"合格率%"}, {"paramsEnName":"unpassrate","paramsZhDesc":"不合格率%"}]',3,3,5,'SELECT  welder.ProjectId,   welder.wed_code,-- 焊工代码   welder.wed_name,--焊工名称   welder.WED_Sex, --性别   welder.WED_Birthday, --出生年月   welder.WED_WorkCode, --证书   welder.WED_Class,  --等级   unit.UnitName,   --所属单位   education.EDU_Name AS education,  --所在班组   (CASE WHEN welder.WED_IfOnGuard=1 THEN ''在岗'' else ''不在岗'' end) as WED_IfOnGuard, --在岗状态      ISNULL(totaldin.total_jot,0) AS total_jot , --总焊口    CAST(ISNULL(totaldin.totaldin,0) AS DECIMAL(19,2))AS totaldin, ----总达因值     ISNULL(total_repairjot.total_repairjot,0) AS total_repairjot,  --总返口数   CAST((CASE ISNULL(totaldin.total_jot,0) WHEN 0 THEN 0     ELSE 100.0 * isnull(total_repairjot.total_repairjot,0)/(1.0 * totaldin.total_jot) END) AS DECIMAL(19,3))    AS repairrate, -- 返修率   ISNULL(totalfilm.totalfilm,0) AS totalfilm, --总片数   ISNULL(totalfilm.passfilm,0) AS passfilm, --合格片数   (ISNULL(totalfilm.totalfilm , 0) - ISNULL(totalfilm.passfilm ,0)) AS notpassfilm, --不合格片数   CAST((CASE ISNULL(totalfilm.totalfilm,0) WHEN 0 THEN 0     ELSE 100.0 * isnull(totalfilm.passfilm,0)/(1.0 * totalfilm.totalfilm) END) AS DECIMAL(19,3))    AS passrate,--合格率       CAST((CASE ISNULL(totalfilm.totalfilm,0) WHEN 0 THEN 0     ELSE 100.0 * (ISNULL(totalfilm.totalfilm , 0) - ISNULL(totalfilm.passfilm ,0)) /(1.0 * totalfilm.totalfilm) END) AS DECIMAL(19,3))     AS unpassrate--不合格率      FROM HJGL_BS_Welder AS welder  LEFT JOIN HJGL_HS_Education AS education  ON education.EDU_ID= welder.EDU_ID   LEFT JOIN Base_Unit unit on welder.WED_Unit = unit.UnitId     --总达因值 --总焊口  LEFT JOIN (SELECT SUM(jot_donedin) AS totaldin     ,COUNT(*) AS total_jot     ,HJGL_pw_jointinfo.JOT_CellWelder     FROM HJGL_pw_jointinfo        GROUP  BY  HJGL_pw_jointinfo.JOT_CellWelder) AS totaldin ON totaldin.JOT_CellWelder = welder.WED_ID  --总返口数  LEFT JOIN (SELECT  COUNT(*) AS total_repairjot     ,HJGL_pw_jointinfo.JOT_CellWelder     FROM HJGL_pw_jointinfo        LEFT JOIN dbo.HJGL_CH_TrustItem AS TrustItem ON HJGL_pw_jointinfo.JOT_ID = TrustItem.JOT_ID      LEFT JOIN dbo.HJGL_CH_Trust AS Trust ON Trust.CH_TrustID= TrustItem.CH_TrustID          LEFT JOIN HJGL_BO_WeldReportMain ON HJGL_pw_jointinfo.DReportID = HJGL_BO_WeldReportMain.DReportID         WHERE Trust.CH_TrustType=''2'' and JOT_JointStatus !=''102''    GROUP BY HJGL_pw_jointinfo.JOT_CellWelder) AS total_repairjot ON total_repairjot.JOT_CellWelder = welder.WED_ID  --总片数 --合格片数  LEFT JOIN (SELECT SUM(cht_totalfilm) AS totalfilm      ,SUM(cht_passfilm) AS passfilm      ,HJGL_pw_jointinfo.JOT_CellWelder     FROM HJGL_CH_CheckItem     LEFT JOIN HJGL_pw_jointinfo ON HJGL_pw_jointinfo.jot_id=HJGL_CH_CheckItem.jot_id         WHERE HJGL_CH_CheckItem.jot_id is not null     GROUP  BY HJGL_pw_jointinfo.JOT_CellWelder) AS totalfilm ON totalfilm.JOT_CellWelder = welder.WED_ID      WHERE welder.ProjectId = @project_Id AND welder.WED_Code=@query_No','通过扫描或者输入【焊工编号】查询焊工人员的基本信息(所属单位、姓名、焊接资质和业绩等)。',0) 
GO
INSERT INTO Sys_Query(QueryId,QueryName,InputParams,OutputParams,QueryType,QueryFlag,Sort,QuerySql,AppQueryDesc,IsDelete) 
VALUES ('7D670242-4FE0-4E37-9883-B9C2AEA18C53','【检查机具信息】','[{"paramsEnName":"projectId","paramsZhName":"项目Id","isNotNull":"true"},{"paramsEnName":"queryPk","paramsZhName":"查询主键","isNotNull":"true"},{"paramsEnName":"listIndex","paramsZhName":"列表显示索引","initValue":"0","isNotNull":"false"},{"paramsEnName":"queryNo","paramsZhName":"机具编号","isNotNull":"true"}]','[{"paramsEnName":"ProjectId","paramsZhDesc":"所属项目"},{"paramsEnName":"UnitId","paramsZhDesc":"所属单位"},{"paramsEnName":"EquipmentName","paramsZhDesc":"机具名称"},{"paramsEnName":"SizeModel","paramsZhDesc":"规格尺寸"},{"paramsEnName":"FactoryCode","paramsZhDesc":"生产厂家"},{"paramsEnName":"CertificateCode","paramsZhDesc":"合格证号"},{"paramsEnName":"ProvidedDate","paramsZhDesc":"生产日期"},{"paramsEnName":"EnableYear","paramsZhDesc":"有效期限"},{"paramsEnName":"ApprovalPerson","paramsZhDesc":"最近检验人"},{"paramsEnName":"ScanUrl","paramsZhDesc":"报验扫描件"},{"paramsEnName":"AprovalCode","paramsZhDesc":"最近检验单位"}]',1,2,10,'select    ProjectId  ,   UnitId  ,   EquipmentName  ,   SizeModel  ,   FactoryCode  ,   CertificateCode  ,   ProvidedDate  ,   EnableYear  ,   ApprovalPerson  ,   ScanUrl ,    AprovalCode  ,   AprovalNumber  ,   AprovalState     from HSSE_QualityAudit_EquipmentQuality   where  projectId = @project_Id and CertificateCode = @query_No','通过扫描或者输入【机具编号】抽查核实机具的基本信息(所属单位、进场日期、生产厂家和和检验信息)。',0)
 GO
INSERT INTO Sys_Query(QueryId,QueryName,InputParams,OutputParams,QueryType,QueryFlag,Sort,QuerySql,AppQueryDesc,IsDelete) 
VALUES ('B380596C-CA38-471A-8A18-74F8E1CC40B4','【现场试压包查询及核对】','[{"paramsEnName":"projectId","paramsZhName":"项目Id","isNotNull":"true"},{"paramsEnName":"queryPk","paramsZhName":"查询主键","isNotNull":"true"},{"paramsEnName":"listIndex","paramsZhName":"列表显示索引","initValue":"0","isNotNull":"false"},{"paramsEnName":"queryNo","paramsZhName":"管线编号","isNotNull":"true"}]','[{"paramsEnName":"ISO_ID","paramsZhDesc":"管线编号"},{"paramsEnName":"PTP_TestPackageNo","paramsZhDesc":"试压编号"},{"paramsEnName":"PTP_TestPackageCode","paramsZhDesc":"试压包号"},{"paramsEnName":"PTP_TestPackageName","paramsZhDesc":"系统名称"},{"paramsEnName":"PTP_TestHeat","paramsZhDesc":"试验压力"},{"paramsEnName":"PTP_TestService","paramsZhDesc":"试验介质"},{"paramsEnName":"PTP_TestAmbientTemp","paramsZhDesc":"试验环境温度"},{"paramsEnName":"PTP_TestMediumTemp","paramsZhDesc":"试验介质温度"},{"paramsEnName":"PTP_TestType","paramsZhDesc":"试验类型"},{"paramsEnName":"PTP_Finisher","paramsZhDesc":"完工人"},{"paramsEnName":"PTP_FinishDate","paramsZhDesc":"完工时间"},{"paramsEnName":"PTP_Tabler","paramsZhDesc":"建档人"},{"paramsEnName":"PTP_TableDate","paramsZhDesc":"建档时间"},{"paramsEnName":"PTP_Modifier","paramsZhDesc":"修改人"},{"paramsEnName":"PTP_ModifyDate","paramsZhDesc":"修改日期"},{"paramsEnName":"PTP_Auditer","paramsZhDesc":"审核人"},{"paramsEnName":"PTP_AduditDate","paramsZhDesc":"审核日期"}]',3,4,10,'select  PW.ISO_IsoNo as ISO_ID,TT.PTP_TestPackageNo,PTP_TestPackageCode,PTP_TestPackageName,PTP_TestHeat,PTP_TestService,  PTP_TestAmbientTemp,PTP_TestMediumTemp,PTP_TestType,PTP_Finisher,PTP_FinishDate,SU.UserName as PTP_Tabler,PTP_TableDate,  US.UserName as PTP_Modifier,PTP_ModifyDate,PTP_Auditer,PTP_AduditDate  from HJGL_TP_IsoList TI  left join HJGL_TP_TestPackage TT on TI.PTP_ID = TT.PTP_ID  left join HJGL_PW_IsoInfo PW on TI.ISO_ID = PW.ISO_ID  left join Sys_User SU on SU.UserId = TT.PTP_Tabler  left join Sys_User US on US.UserId = TT.PTP_Modifier  where TI.ISO_ID in (select ISO_ID from HJGL_PW_IsoInfo where projectId = @project_Id and ISO_IsoNo = @query_No)','通过扫描或者输入【管线号】查询该管线所属的试压包的试压情况信息。',0) 
GO
INSERT INTO Sys_Query(QueryId,QueryName,InputParams,OutputParams,QueryType,QueryFlag,Sort,QuerySql,AppQueryDesc,IsDelete) 
VALUES ('B4CE3E14-A4AE-4287-8CF5-E96B12F147C3','【焊工合格项目信息查询】','[{"paramsEnName":"projectId","paramsZhName":"项目Id","isNotNull":"true"},{"paramsEnName":"queryPk","paramsZhName":"查询主键","isNotNull":"true"},{"paramsEnName":"listIndex","paramsZhName":"列表显示索引","initValue":"QualifiedProjectCode,WED_Code,WED_Name","isNotNull":"false"},{"paramsEnName":"queryNo","paramsZhName":"身份证号","isNotNull":"true"}]','[{"paramsEnName":"QualifiedProjectCode","paramsZhDesc":"合格项目代号"},{"paramsEnName":"WED_Code","paramsZhDesc":"焊工代号"},{"paramsEnName":"WED_Name","paramsZhDesc":"焊工姓名"},{"paramsEnName":"IdentityCard","paramsZhDesc":"身份证号"},{"paramsEnName":"LimitDate","paramsZhDesc":"有效期限"},{"paramsEnName":"GTAWMax","paramsZhDesc":"GTAW最大厚度"},       {"paramsEnName":"SMAWMax","paramsZhDesc":"SMAW最大厚度"},{"paramsEnName":"DiaMin","paramsZhDesc":"最小口径"}]',3,16,11,'select WelderQualifiedProject.WelderQualifiedProjectId,         Welder.WED_Name,          Welder.WED_Code,          WelderQualifiedProject.QualifiedProjectCode,         CONVERT(varchar(100), WelderQualifiedProject.LimitDate, 23) as LimitDate,          WelderQualifiedProject.GTAWMax,          WelderQualifiedProject.SMAWMax,          WelderQualifiedProject.DiaMin          from HJGL_BS_WelderQualifiedProject as WelderQualifiedProject  left join HJGL_BS_Welder as Welder on Welder.WED_ID=WelderQualifiedProject.WED_ID  WHERE Welder.ProjectId=@project_Id and Welder.IdentityCard=@query_No','通过扫描或者输入【身份证号】查询该焊工的基本信息。',0)
 GO
INSERT INTO Sys_Query(QueryId,QueryName,InputParams,OutputParams,QueryType,QueryFlag,Sort,QuerySql,AppQueryDesc,IsDelete) 
VALUES ('D3B6517A-52DA-479C-82A5-653C8C109A0A','【焊接进度和质量查询及核对】','[{"paramsEnName":"projectId","paramsZhName":"项目Id","isNotNull":"true"},{"paramsEnName":"queryPk","paramsZhName":"查询主键","isNotNull":"true"},{"paramsEnName":"listIndex","paramsZhName":"列表显示索引","initValue":"0","isNotNull":"false"},{"paramsEnName":"queryNo","paramsZhName":"管线编号","isNotNull":"true"}]','[{"paramsEnName":"ISO_IsoNo","paramsZhDesc":"管线编号"},{"paramsEnName":"baw_areano","paramsZhDesc":"工区代号"},{"paramsEnName":"bsu_unitcode","paramsZhDesc":"单位代码"},{"paramsEnName":"bsu_unitname","paramsZhDesc":"单位名称"},{"paramsEnName":"maxdate","paramsZhDesc":"最近焊期"},{"paramsEnName":"total_jot","paramsZhDesc":"总焊口"},{"paramsEnName":"total_sjot","paramsZhDesc":"预制总焊口数"},{"paramsEnName":"total_fjot","paramsZhDesc":"安装总焊口数"},{"paramsEnName":"finished_total_jot","paramsZhDesc":"完成总焊口"},{"paramsEnName":"finished_total_sjot","paramsZhDesc":"预制完成总焊口数"},{"paramsEnName":"finished_total_fjot","paramsZhDesc":"安装完成总焊口数"},{"paramsEnName":"cut_total_jot","paramsZhDesc":"切除焊口"},{"paramsEnName":"finisedrate","paramsZhDesc":"完成比例/焊口"},{"paramsEnName":"finisedrate_s","paramsZhDesc":"预制完成比例/焊口"},{"paramsEnName":"finisedrate_f","paramsZhDesc":"安装完成比例/焊口"},{"paramsEnName":"total_din","paramsZhDesc":"焊口总达因"},{"paramsEnName":"total_Sdin","paramsZhDesc":"预制总达因"},{"paramsEnName":"total_Fdin","paramsZhDesc":"安装总达因"},{"paramsEnName":"finished_total_din","paramsZhDesc":"完成总达因"},{"paramsEnName":"finished_total_Sdin","paramsZhDesc":"预制完成总达因"},{"paramsEnName":"finished_total_Fdin","paramsZhDesc":"安装完成总达因"},{"paramsEnName":"finisedrate_din","paramsZhDesc":"完成比例/达因"},{"paramsEnName":"finisedrate_din_s","paramsZhDesc":"预制完成比例/达因"},{"paramsEnName":"finisedrate_din_f","paramsZhDesc":"安装完成比例/达因"},{"paramsEnName":"total_film","paramsZhDesc":"总拍片数"},{"paramsEnName":"pass_film","paramsZhDesc":"合格片数"},{"paramsEnName":"passreate","paramsZhDesc":"合格率"},{"paramsEnName":"ext_total_film","paramsZhDesc":"扩透总片数"},{"paramsEnName":"ext_pass_film","paramsZhDesc":"扩透合格片数"},{"paramsEnName":"ext_passreate","paramsZhDesc":"扩透合格率"},{"paramsEnName":"point_total_film","paramsZhDesc":"点口总片数"},{"paramsEnName":"point_pass_film","paramsZhDesc":"点口合格片数"},{"paramsEnName":"point_passreate","paramsZhDesc":"点口合格率"},{"paramsEnName":"cut_total_film","paramsZhDesc":"切除总片数"},{"paramsEnName":"cut_pass_film","paramsZhDesc":"切除合格片数"},{"paramsEnName":"ext_jot","paramsZhDesc":"扩透总数"},{"paramsEnName":"point_jot","paramsZhDesc":"点口总数"},{"paramsEnName":"trust_total_jot","paramsZhDesc":"委托总数"},{"paramsEnName":"check_total_jot","paramsZhDesc":"总已探数"},{"paramsEnName":"total_repairjot","paramsZhDesc":"总返口数"},{"paramsEnName":"source_rate","paramsZhDesc":"要求比例"},{"paramsEnName":"trustrate","paramsZhDesc":"委托比例"},{"paramsEnName":"checkrate","paramsZhDesc":"已探比例"}]',3,5,15,'EXEC HJGL_sp_rpt_iso_analyze null,@query_No,null,null,null','通过扫描或者输入【管线编号】查询该管线的焊接进度和质量情况便于现场及时核对。',0) 
GO

INSERT INTO dbo.Base_Module (module_id,module_type,module_name,is_show)
VALUES ('67BF2119-EA34-48F8-9901-C0A959F90DE7',1,'施工安全管理APP',1)
GO
INSERT INTO dbo.Base_Module (module_id,module_type,module_name,is_show)
VALUES ('12AC48F8-75A3-4867-8BCD-DBC05D85A817',2,'施工质量管理APP',1)
GO
INSERT INTO dbo.Base_Module (module_id,module_type,module_name,is_show)
VALUES ('A1431AA0-9C77-430C-865A-F29EF49DAEFF',3,'焊接质量管理APP',1)
GO

--HSSE_Hazard_HazardRegisterTypes
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) 
VALUES('0cb4043c-2461-46f9-b9cc-d0ceef9939df','自然环境及采取相应措施','501',2,5,'',NULL)  
GO
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) 
VALUES('0EDAE644-DA8B-49F1-9AA4-6EF4F11F67BD','检查承包单位领导班子会、HSE专题会、生产协调会上是否对近阶段本单位安全生产形势进行分析，对如何解决存在的问题是否进行讨论并明确责任部门和整改要。','6',3,1,'查会议纪要',NULL) 
GO
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) 
VALUES('1122D210-39D5-4C5A-B10E-67BD6CD9ECB3','检查承包单位重大施工技术方案的编制、审核、审批和实施是否符合规定','19',3,2,'查现场，查相关记录',NULL)  
GO
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) 
VALUES('1381bd4a-b74f-48e9-9b55-f28406f65117','质量管理性文件执行','403',2,4,'1、方案交底2、方案执行',NULL)  
GO
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) 
VALUES('14a0cca0-d9f7-40bc-82e7-10256b535399','特殊工种持证情况','102',2,1,'',NULL)  
GO
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) 
VALUES('17F0550E-2B43-4132-A782-1631B6542306','检查节假日前后开复工安全工作部署，是否有相关安排和布置，是否具体实施','10',3,1,'查相关记录',NULL)  
GO
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) VALUES('1fb18723-b800-45f9-96fd-67045568e88b','吊装作业','3',1,NULL,NULL,'1') ;
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) VALUES('2029B471-5A81-4CB8-BD20-D64DAD72BBD6','是否定期不定期参加基层单位或班组周一安全活动，对基层班前讲话的开展情况进行检查、指导','7',3,1,'班组施工日志',NULL) ;
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) VALUES('2034e6c6-3e09-4cb2-9b87-8cd49ec42f7e','其他','19',1,NULL,NULL,'1') ;
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) VALUES('20a5b715-c739-43b6-a3fc-80fec338899c','设备管理','15',1,NULL,NULL,'1') ;
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) VALUES('21253a36-1dde-4ed8-abaa-470ac0a11eb6','受限空间','16',1,NULL,NULL,'1') ;
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) VALUES('23a36c8c-9e3d-4d4d-9562-3d78d668849f','交叉作业','8',1,NULL,NULL,'1') ;
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) VALUES('2A1CE5F8-C696-4785-AF75-ACA198D64C15','检查承包单位HSE目标、指标分解落实情况','2',3,1,'查相关文件',NULL) ;
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) VALUES('42FEA50B-E21E-4B17-BF63-D6A623916376','检查承包单位HSE体系是否完善、管理资源是否落实、制度建设是否完善','18',3,2,'查相关文件，查现场',NULL) ;
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) VALUES('4644954e-4668-4176-a133-5609ab7c64c3','临时用电','12',1,NULL,NULL,'1') ;
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) VALUES('4c81310d-0150-4c38-b631-0491ae7168b1','脚手架','9',1,NULL,NULL,'1') ;
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) VALUES('57849043-F64D-4343-AD17-F64A2060B44C','检查承包单位领导安全承包工作开展情况，抽查干部进行基层安全承包活动的频次是否符合承包计划、工作是否扎实有效开展','9',3,1,'查承包工作计划、实施记录',NULL) ;
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) VALUES('598CC4AD-F38A-41A7-A6CD-9E30E0C45A1F','检查承包单位工会组织如何在HSE管理中发挥监督管理作用，检查承包单位员工劳动条件、职业健康管理是否依法合规','20',3,2,'查现场，查相关记录',NULL) ;
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) VALUES('5aebe6e2-e975-4666-86e4-df267dde69e0','质量意识','104',2,1,'',NULL) ;
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) VALUES('618AB14A-FF5C-4910-9421-F8A072B9F4E3','检查承包单位HSE风险识别、评估和控制状况，特别是重大风险管控情况，查风险识别流程、重大风险承包落实情况，风险告知、风险承包公示情况','4',3,1,'查施工生产现场、查相关记录',NULL) ;
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) VALUES('6253B63B-F5F7-4D64-83E0-2DF78EE1CE8A','按照行政分工，检查分管业务范围内的HSE重要工作、突出隐患和重要事项。','17',3,2,'查相关记录',NULL) ;
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) VALUES('65CE5D51-FC4B-498D-AEA2-90A74D6919D9','检查承包单位落实公司年度安全工作会议精神的情况，是否有具体的部署和安排','1',3,1,'查会议纪要、文件、计划和方案',NULL) ;
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) VALUES('719342EF-4ACA-48E5-A496-2878046D2D25','检查承包单位应急管理工作，如应急预案的修订、评审和演练是否符合要求','13',3,2,'查相关记录',NULL) ;
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) VALUES('7537C8A7-B9D3-4F00-901D-D526ECA45EE9','检查承包单位一把手的“六必”工作履职情况，是否知晓“六必”的工作内容和要求','3',3,1,'讯问、交谈，查相关记录',NULL) ;
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) VALUES('7b091bbc-1270-4490-a418-adbcd8657fd0','计量器具','301',2,3,'1、报验2、使用3、台账',NULL) ;
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) VALUES('7D7230DD-B6FF-470C-BF5D-5BE7C005508B','检查承包单位领导班子下基层安全督查开展情况，重点检查“两特”期间安全督查情况','8',3,1,'查阅相关记录',NULL) ;
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) VALUES('85a06721-c367-435d-905f-f78f05987778','材料入场验收','201',2,2,'1、外观检验2、质量证明文件3、复验',NULL) ;
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) VALUES('8a42aed7-e4a6-45cc-9423-bb0dcb7e0cea','工作能力','103',2,1,'',NULL) ;
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) VALUES('908c3ae4-49cd-4c17-b39a-d5c09cf1aeb3','存放保管','202',2,2,'1、分类、标识2、堆放3、色标4、烘烤房',NULL) ;
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) VALUES('9226bdab-94ca-4906-ab93-7406217ae2e9','管理类','6',1,NULL,NULL,'1') ;
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) VALUES('9556a932-d657-4121-9cba-3c59332e6158','成品保护','601',2,6,'',NULL) ;
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) VALUES('975b8867-023d-466d-9b78-8db032290c50','安全通道','2',1,NULL,NULL,'1') ;
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) VALUES('a2aeee07-39da-4599-a932-7a4a2c5c0186','PPE','1',1,NULL,NULL,'1') ;
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) VALUES('a3222e78-eb23-4e52-9509-61c71f702ff9','三气管理','14',1,NULL,NULL,'1') ;
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) VALUES('a94f1eb6-b165-4d60-b31b-8783d0bdfe2d','人员教育','13',1,NULL,NULL,'1') ;
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) VALUES('ac25ec0d-af27-4bf8-b79d-72c88ce6f249','开挖作业','10',1,NULL,NULL,'1') ;
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) VALUES('afb023c4-49f8-494a-968b-f5abf97d4e7f','热处理作业','20',1,NULL,NULL,'1') ;
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) VALUES('B085C17C-1D4F-4ACB-AEFB-76A7F0EF2390','检查承包单位在节假日及社会敏感时段领导干部现场带班制度执行情况','5',3,1,'查阅带班记录',NULL) ;
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) VALUES('B248AC5E-79CD-4DB0-AE58-6436F3F66945','检查承包单位HSE专项费用提取和使用是否专款专用、合理合规，检查承包单位是否将HSE管理纳入经济责任制','22',3,2,'查相关资料',NULL) ;
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) VALUES('B6B5B70C-2C6C-43CC-AE57-3F30127CBBA1','检查承包单位HSE培训开展情况','11',3,1,'查相关记录',NULL) ;
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) VALUES('b9a15752-3545-4b45-a285-91cdea368908','文明施工','17',1,NULL,NULL,'1') ;
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) VALUES('BE7786A9-3264-4FE6-A858-DC51ACC3AE92','检查承包单位党组织如何在HSE工作中起好保证监督作用，是否有具体的行动','16',3,2,'查现场、查相关记录',NULL) ;
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) VALUES('c0c97679-c292-4957-a534-7a1101239082','基坑围护','7',1,NULL,NULL,'1') ;
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) VALUES('c308ae13-a543-403f-b2f7-59d845803098','质保体系人员到岗到位及持证情况','101',2,1,'',NULL) ;
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) VALUES('c65eda41-bf7b-44c4-a6f1-ed78074fa851','作业平台','18',1,NULL,NULL,'1') ;
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) VALUES('C960A346-AF55-4AE1-9328-82B9AEB04ACD','检查承包单位在开展效能监察时，是否将HSE管理纳入效能监察范围','21',3,2,'查相关记录',NULL) ;
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) VALUES('ca230861-3f88-4817-9aa6-97bd8a28a367','质量管理性文件报审','402',2,4,'1、图纸会审2、设计交底3、方案报批4、专项方案管理',NULL) ;
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) VALUES('CAC44DA0-15B6-4CCC-A09A-8665A34768D2','检查承包单位是否把HSE工作作为宣传思想工作的重要内容','15',3,2,'查相关记录',NULL) ;
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) VALUES('d1cc27da-acd7-4230-be73-d2324606b62c','临边洞口','11',1,NULL,NULL,'1') ;
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) VALUES('D2B153DB-7878-42B8-B437-CBD5147F7C29','检查承包单位领导班子是否履行“一岗双责，党政同责”的安全管理职责','14',3,2,'查现场和相关记录',NULL) ;
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) VALUES('deabf3d6-0cd4-4300-9908-87c1e72d5f01','高处作业','5',1,NULL,NULL,'1') ;
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) VALUES('e4bc771c-f040-46b4-baaf-283ab7010a6c','使用','203',2,2,'1、错误2、可追溯性',NULL) ;
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) VALUES('ea6a3105-c524-4a19-9242-7e7ee8c3be87','合法合规性','401',2,4,'1、执行法律法规标准规范设计文件2、项目管理程序文件',NULL) ;
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) VALUES('f844e83c-2da3-4e6a-9194-def31c4f84c0','动火作业','4',1,NULL,NULL,'1') ;
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) VALUES('FB0F0B8C-F403-4763-A9A2-2AD474DA6A79','检查承包单位分包管理情况，特别是合法合规分包、分包关键人员到岗到位情况、班组建设情况','12',3,1,'查现场，查相关记录',NULL) ;
--天气
INSERT INTO dbo.HSSE_Weather(WeatherId,WeatherStatus) VALUES(	1,'晴');
INSERT INTO dbo.HSSE_Weather(WeatherId,WeatherStatus) VALUES(	2,'阴');
INSERT INTO dbo.HSSE_Weather(WeatherId,WeatherStatus) VALUES(	3,'小雨');
INSERT INTO dbo.HSSE_Weather(WeatherId,WeatherStatus) VALUES(	4,'雷阵雨');
INSERT INTO dbo.HSSE_Weather(WeatherId,WeatherStatus) VALUES(	5,'小雪');
INSERT INTO dbo.HSSE_Weather(WeatherId,WeatherStatus) VALUES(	6,'大雪');
INSERT INTO dbo.HSSE_Weather(WeatherId,WeatherStatus) VALUES(	7,'霜冻');
INSERT INTO dbo.HSSE_Weather(WeatherId,WeatherStatus) VALUES(	8,'雾');
INSERT INTO dbo.HSSE_Weather(WeatherId,WeatherStatus) VALUES(	9,'扬尘');
INSERT INTO dbo.HSSE_Weather(WeatherId,WeatherStatus) VALUES(	10,'沙尘暴');
GO



--插入专项检查数据
INSERT INTO dbo.HSSE_Check_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex)
VALUES('0BDE0BAF-4633-4864-90EF-AD9FF7266FC8','作业许可证检查','0','1','false',10)
GO

INSERT INTO dbo.HSSE_Check_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex)
VALUES('B4B5CF58-2DE6-4086-B5FA-2CA3F11A3178','管理行为检查','0','2','false',20)
GO

INSERT INTO dbo.HSSE_Check_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex)
VALUES('72B74888-8190-40B4-8C5D-9344F44C9683','现场作业过程检查','0','3','false',30)
GO

INSERT INTO dbo.HSSE_Check_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex)
VALUES('448B443C-B477-4C67-AAFA-DB03A0C5D17F','破土作业许可证','0BDE0BAF-4633-4864-90EF-AD9FF7266FC8','1A','true',40)
GO

INSERT INTO dbo.HSSE_Check_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex)
VALUES('14F2DA76-A9A9-4CAD-ADFE-D9C42F6AEF63','动火作业许可证','0BDE0BAF-4633-4864-90EF-AD9FF7266FC8','1B','true',50)
GO

INSERT INTO dbo.HSSE_Check_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex)
VALUES('29828709-D103-413D-902F-1CDB90E2CFC1','临时用电作业许可证','0BDE0BAF-4633-4864-90EF-AD9FF7266FC8','1C','true',60)
GO

INSERT INTO dbo.HSSE_Check_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex)
VALUES('48F06310-5C74-4696-8249-3F5E1863D90C','脚手架使用许可证','0BDE0BAF-4633-4864-90EF-AD9FF7266FC8','1D','true',70)
GO

INSERT INTO dbo.HSSE_Check_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex)
VALUES('366AC069-60BB-4D0A-A049-63CCCAEFC48C','起重吊装作业许可证','0BDE0BAF-4633-4864-90EF-AD9FF7266FC8','1E','true',80)
GO

INSERT INTO dbo.HSSE_Check_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex)
VALUES('D61D5E9C-3378-4FC1-83F6-FB4F66B2EAC5','射线作业许可证','0BDE0BAF-4633-4864-90EF-AD9FF7266FC8','1F','true',90)
GO

INSERT INTO dbo.HSSE_Check_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex)
VALUES('B57C6ECB-1891-49EC-9D21-1DF4FD07C9B1','受限空间作业许可证','0BDE0BAF-4633-4864-90EF-AD9FF7266FC8','1G','true',100)
GO

INSERT INTO dbo.HSSE_Check_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex)
VALUES('2C0660F9-D093-46E8-93E9-1D01D05EF718','新开项目安全许可证','0BDE0BAF-4633-4864-90EF-AD9FF7266FC8','1H','true',110)
GO

INSERT INTO dbo.HSSE_Check_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex)
VALUES('A321A0E8-C438-4AAD-BDA1-460083ECDBF7','高处作业许可证','0BDE0BAF-4633-4864-90EF-AD9FF7266FC8','1I','true',120)
GO

INSERT INTO dbo.HSSE_Check_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex)
VALUES('A3E0CB1E-FC5D-4C8F-B76D-E9E21311C184','临边(洞口、攀登、悬空)作业许可证','0BDE0BAF-4633-4864-90EF-AD9FF7266FC8','1J','true',130)
GO

INSERT INTO dbo.HSSE_Check_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex)
VALUES('79211283-4A46-4321-BF6E-0C349F24C16D','危险化学物品使用许可证','0BDE0BAF-4633-4864-90EF-AD9FF7266FC8','1K','true',140)
GO

INSERT INTO dbo.HSSE_Check_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex)
VALUES('B1758ADE-5B0C-40EC-B400-5C382EDCF4CA','HSE组织机构及管理体系运行','B4B5CF58-2DE6-4086-B5FA-2CA3F11A3178','2A','true',150)
GO

INSERT INTO dbo.HSSE_Check_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex)
VALUES('803A5E17-7DF1-4B6D-9409-E0E0F5D39DDD','现场安全方案/措施管理规定','B4B5CF58-2DE6-4086-B5FA-2CA3F11A3178','2B','true',160)
GO

INSERT INTO dbo.HSSE_Check_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex)
VALUES('B8F280FA-3CAC-43FD-98AE-B759FCD8287D','个人防护用品使用','B4B5CF58-2DE6-4086-B5FA-2CA3F11A3178','2C','true',170)
GO

INSERT INTO dbo.HSSE_Check_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex)
VALUES('DE7930B3-94A0-44AE-8479-39592EC9BAAB','HSE宣传与警示管理','B4B5CF58-2DE6-4086-B5FA-2CA3F11A3178','2D','true',180)
GO

INSERT INTO dbo.HSSE_Check_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex)
VALUES('D3ADAF1D-7799-42E9-BBFD-EB89D93DBED6','HSE培训及持证上岗','B4B5CF58-2DE6-4086-B5FA-2CA3F11A3178','2E','true',190)
GO

INSERT INTO dbo.HSSE_Check_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex)
VALUES('5AEB3327-BA14-4405-A687-B30AAA81D5A8','临时访客HSE管理','B4B5CF58-2DE6-4086-B5FA-2CA3F11A3178','2F','true',200)
GO

INSERT INTO dbo.HSSE_Check_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex)
VALUES('6FF1023B-FCDE-4EC5-9778-439CA1D1D0D7','现场车辆进出管理','B4B5CF58-2DE6-4086-B5FA-2CA3F11A3178','2G','true',210)
GO

INSERT INTO dbo.HSSE_Check_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex)
VALUES('A44B1736-4563-4773-8C2D-140C6A76F103','HSE风险评估和隐患治理','B4B5CF58-2DE6-4086-B5FA-2CA3F11A3178','2H','true',220)
GO

INSERT INTO dbo.HSSE_Check_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex)
VALUES('0DE6C919-02AD-4297-B6E1-D0D60C31DEA7','现场HSE应急管理','B4B5CF58-2DE6-4086-B5FA-2CA3F11A3178','2I','true',230)
GO

INSERT INTO dbo.HSSE_Check_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex)
VALUES('1AFA2D62-681A-4D58-86FA-E40C8B13DD88','HSE信息管理规定','B4B5CF58-2DE6-4086-B5FA-2CA3F11A3178','2J','true',240)
GO

INSERT INTO dbo.HSSE_Check_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex)
VALUES('F7AA4D86-D92A-4683-B7AD-A11BF9D9EA5B','施工队、班组安全活动管理','B4B5CF58-2DE6-4086-B5FA-2CA3F11A3178','2K','true',250)
GO

INSERT INTO dbo.HSSE_Check_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex)
VALUES('889BE6F2-C413-4EC5-8F42-6CAA3EB2724D','文明施工、班组安全活动管理','B4B5CF58-2DE6-4086-B5FA-2CA3F11A3178','2L','true',260)
GO

INSERT INTO dbo.HSSE_Check_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex)
VALUES('8A6E4DD8-8433-4080-8F91-A538EA8F0CFE','职业卫生管理','B4B5CF58-2DE6-4086-B5FA-2CA3F11A3178','2M','true',270)
GO

INSERT INTO dbo.HSSE_Check_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex)
VALUES('DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','用电管理','72B74888-8190-40B4-8C5D-9344F44C9683','3A','true',280)
GO

INSERT INTO dbo.HSSE_Check_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex)
VALUES('52AD156A-C6A6-4FFB-B9BD-7A1588E4CD0A','动土作业安全管理','72B74888-8190-40B4-8C5D-9344F44C9683','3B','true',290)
GO

INSERT INTO dbo.HSSE_Check_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex)
VALUES('0CD8C338-07B9-4AE3-A2A6-04485098FE91','动火管理','72B74888-8190-40B4-8C5D-9344F44C9683','3C','true',300)
GO

INSERT INTO dbo.HSSE_Check_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex)
VALUES('FD18318D-CF10-47A9-86C5-CC066B5119B3','脚手架管理','72B74888-8190-40B4-8C5D-9344F44C9683','3D','true',310)
GO

INSERT INTO dbo.HSSE_Check_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex)
VALUES('EC986070-16BF-4343-8850-252D9A747358','高处作业管理','72B74888-8190-40B4-8C5D-9344F44C9683','3E','true',320)
GO

INSERT INTO dbo.HSSE_Check_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex)
VALUES('82884781-F5B6-4623-A0BC-112DCA6665D9','起重作业管理','72B74888-8190-40B4-8C5D-9344F44C9683','3F','true',330)
GO

INSERT INTO dbo.HSSE_Check_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex)
VALUES('99431E70-833A-464D-8066-E41E230646DA','射线作业安全管理','72B74888-8190-40B4-8C5D-9344F44C9683','3G','true',340)
GO

INSERT INTO dbo.HSSE_Check_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex)
VALUES('77205883-AE5F-4047-8241-6922A2CCE6C4','受限空间作业安全管理','72B74888-8190-40B4-8C5D-9344F44C9683','3H','true',350)
GO

INSERT INTO dbo.HSSE_Check_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex)
VALUES('8DC2F97B-CB4F-4848-B528-6A8155C26771','气瓶安全管理','72B74888-8190-40B4-8C5D-9344F44C9683','3I','true',360)
GO

INSERT INTO dbo.HSSE_Check_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex)
VALUES('C9288081-8BD3-4949-A9C6-6320F827D35B','危险物品管理','72B74888-8190-40B4-8C5D-9344F44C9683','3J','true',370)
GO

INSERT INTO dbo.HSSE_Check_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex)
VALUES('10A8AF77-8103-422D-AE72-FAEB058C4770','特种设备管理','72B74888-8190-40B4-8C5D-9344F44C9683','3K','true',380)
GO

INSERT INTO dbo.HSSE_Check_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex)
VALUES('B8940917-27F4-438A-BA8E-744B54691F09','车辆管理','72B74888-8190-40B4-8C5D-9344F44C9683','3L','true',390)
GO

INSERT INTO dbo.HSSE_Check_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex)
VALUES('E6635238-4A3D-4101-B8E2-8356CBF046C2','环境保护管理','72B74888-8190-40B4-8C5D-9344F44C9683','3M','true',400)
GO

INSERT INTO dbo.HSSE_Check_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex)
VALUES('18D13FB6-0B9D-4CB0-AC3C-AAA67F27F419','消防安全管理','72B74888-8190-40B4-8C5D-9344F44C9683','3N','true',410)
GO



--插入检查内容
INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('20900CE0-1993-4800-8775-52F4FDDD0143','448B443C-B477-4C67-AAFA-DB03A0C5D17F','有破土作业的技术方案/措施，交底清楚、到位',10)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('192906F1-2155-4AD5-9D47-E166D0A786E8','448B443C-B477-4C67-AAFA-DB03A0C5D17F','破土作业前，必须逐条落实审核单位意见及有关HSE措施，并对所有作业人员进行HSE教育和HSE技术交底后方可施工',20)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('103953E3-85B9-4063-BDA0-538E074B6DD9','448B443C-B477-4C67-AAFA-DB03A0C5D17F','明确施工区域地质、水文、地下供排水管线',30)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('FD94D84B-A417-4054-8F00-DFA05B10E835','448B443C-B477-4C67-AAFA-DB03A0C5D17F','明确埋地管道、电缆、电信设施',40)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('F1E5D1AF-AC3E-403E-9077-E9B694E7F12A','448B443C-B477-4C67-AAFA-DB03A0C5D17F','明确测量用的永久性标志、地质和地震部门设置的长期观察孔',50)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('1D5E572E-1F38-466E-93D8-E80F7465C26B','448B443C-B477-4C67-AAFA-DB03A0C5D17F','明确地下不明物、砂巷等情况',60)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('5986D8D5-8ECA-4C80-BC2C-2495C520D1D2','448B443C-B477-4C67-AAFA-DB03A0C5D17F','根据作业票要求事项和地下隐蔽工程情况进行现场标识，明确破土作业的范围和施工方法',70)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('F12B2ADF-3C34-49EE-AEE5-1F9181E4A5FF','448B443C-B477-4C67-AAFA-DB03A0C5D17F','在生产装置、灌区内施工，应设专人负责监护',80)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('BB15FD0C-1110-4018-9EE6-0655FDE2525B','448B443C-B477-4C67-AAFA-DB03A0C5D17F','所有作业人员是否清楚有下列情况之一要及时报告，经同意后方能继续作业：a)需要占用规划批准范围以外的场地；b)可能损坏道路、管线、电力、邮电通讯等公共设施的；c)需要临时停水、停电、中断道路交通的；d)需要进行爆破的。',90)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('63F5F0B6-E1AE-45E0-9817-398CF0103617','448B443C-B477-4C67-AAFA-DB03A0C5D17F','在道路上(包括居民区)、成产装置、灌区内施工时，应在现场设围栏及警告牌，夜间应设警示灯',100)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('ACB485AE-0649-436F-929B-85E4888F8635','448B443C-B477-4C67-AAFA-DB03A0C5D17F','开挖地沟、坑、池时，根据开挖深度按规定采取放坡或加固等专门措施，防止坍塌伤人，且应在其周围设置围栏和警告标志，夜间设红灯警示。',110)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('827B6FF5-4FC1-44DA-BA14-B10C2A45848B','14F2DA76-A9A9-4CAD-ADFE-D9C42F6AEF63','有动火作业的技术方案/措施，交底清楚、到位',120)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('AF93F228-1D59-4B17-84B5-B7AF2877F0F8','14F2DA76-A9A9-4CAD-ADFE-D9C42F6AEF63','动火作业人员上岗前，必须按规定进行上岗前的动火安全教育，掌握动火作业的安全基础知识，并会使用消防器材',130)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('2711B5D3-CF0D-47DD-BE70-379A5B96B4C9','14F2DA76-A9A9-4CAD-ADFE-D9C42F6AEF63','动火作业人员是否熟悉周围环境和撤离路线',140)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('7BCDFB08-00C7-4193-BBEB-FD16B3F97BED','14F2DA76-A9A9-4CAD-ADFE-D9C42F6AEF63','动火作业的施工现场，必须按规定配置消防器材，并保持消防道路畅通',150)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('7E1C5703-386F-4B3B-9E05-E81A2CEBE93C','14F2DA76-A9A9-4CAD-ADFE-D9C42F6AEF63','动火作业部位附近是否有可燃、易燃、易爆物品，是否已清理或采取了有效的安全防范措施',160)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('47842163-042E-4A5B-AD48-9D49D0A0E923','14F2DA76-A9A9-4CAD-ADFE-D9C42F6AEF63','与外部相连的管道与设备，是否查清有无险情',170)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('88E8255A-D474-47A4-86FE-7FB05BDE137D','14F2DA76-A9A9-4CAD-ADFE-D9C42F6AEF63','附近是否有与明火作业相抵触的工种在作业',180)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('2DFA56AB-801B-4F5F-879A-304717F395CA','14F2DA76-A9A9-4CAD-ADFE-D9C42F6AEF63','在有可燃、易爆气体的区域进行爆破和锤击作业时，是否已对现场的可燃、易爆气体含量进行分析切合格',190)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('D651EBAB-E825-4609-9096-3C43D63AFB45','14F2DA76-A9A9-4CAD-ADFE-D9C42F6AEF63','是否满足特殊作业动火要求',200)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('8E296E80-E9ED-46BD-A252-35E0FA407E3F','14F2DA76-A9A9-4CAD-ADFE-D9C42F6AEF63','是否满足高空作业动火要求',210)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('A30AA4B5-759F-4804-AD75-9F5ECEEB41E7','29828709-D103-413D-902F-1CDB90E2CFC1','整体布线规范、合理，符合临时用电技术方案/措施的要求',220)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('83BC3116-8028-4C64-92D1-3CE451A9F659','29828709-D103-413D-902F-1CDB90E2CFC1','总/分配电箱分布合理，箱内电器配置、布线整齐可靠，电器性能良好',230)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('3BC4A468-4B8E-41D0-BC21-E715244A9798','29828709-D103-413D-902F-1CDB90E2CFC1','采用五线制线路，电压等级符合要求，测试合格；线路架设位置、高度、支撑符合要求',240)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('01AFADBA-6F7A-4215-9CF5-EEE9354C02CD','29828709-D103-413D-902F-1CDB90E2CFC1','电气元件、用电设备、线路容量、负荷满足要求',250)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('0B3EDCA4-5598-4BED-9490-9A7BD51412C9','29828709-D103-413D-902F-1CDB90E2CFC1','开关箱内装设漏电保护器技术参数符合要求；所用电缆、导线截面符合要求，开关电气容量相互匹配',260)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('0FC369CF-A331-4AA5-82B6-8DF6A9925662','29828709-D103-413D-902F-1CDB90E2CFC1','配电箱、开关箱的保护接零(接地)措施正确规范；箱内清洁，无杂物，箱门有锁',270)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('32E962C0-CC90-4AFE-8ED6-79A0107DD2DE','29828709-D103-413D-902F-1CDB90E2CFC1','电气线路、接头绝缘良好，无破皮、漏电现象',280)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('752D7F3C-5E46-4782-933F-5B47AFEDFBC4','29828709-D103-413D-902F-1CDB90E2CFC1','电气设备性能良好，有防雨防潮措施；有规范、可靠的接零、接地措施',290)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('F345D6B5-C78D-441C-8452-C0C7A8B0C22C','29828709-D103-413D-902F-1CDB90E2CFC1','安装临时线路的人员有电工证',300)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('7C27769D-4828-4CC6-9E71-E5AC03D4EF2B','29828709-D103-413D-902F-1CDB90E2CFC1','配电盘与周围物体的屏护距离符合要求；操作、维护通道、工作接地、零线重复接地符合要求',310)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('67E9E7F5-97DE-475D-ADDB-82C9614C4904','48F06310-5C74-4696-8249-3F5E1863D90C','脚手架整体具有稳定性，符合施工技术方案/措施的要求',320)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('C1588ECA-04B6-4FFB-BB15-ECED1C538A47','48F06310-5C74-4696-8249-3F5E1863D90C','脚手架立杆间距≤2m,大横杆间距≤1.6m,作业面处小横杆间距≤1m',330)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('0E89DFD9-5BCF-40E8-AE42-40EDF3092135','48F06310-5C74-4696-8249-3F5E1863D90C','扫地杆齐全,必要时立杆要有垫板',340)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('A1C53824-C683-4C84-88C6-9EEF2B35F882','48F06310-5C74-4696-8249-3F5E1863D90C','脚手架设有上下通道,梯阶(踏步)间距≤400mm',350)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('E854751B-8D8D-4EA3-AF01-183CEE8C9281','48F06310-5C74-4696-8249-3F5E1863D90C','作业面跳板满铺,特殊情况下铺设宽度≥600mm',360)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('E4BE11E3-90A7-4BA3-BC18-9937AED09F07','48F06310-5C74-4696-8249-3F5E1863D90C','脚手架作业面四周预留洞口防护到位',370)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('A8AD3B4D-E9E2-46A0-9D82-DE0913A76BFE','48F06310-5C74-4696-8249-3F5E1863D90C','脚手架作业面,楼梯间等护栏为双护栏,其设置高度:第一道护栏以400mm为宜,第二道护栏以1m为宜',380)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('F76A6D99-B784-434D-8E50-3509AC463413','48F06310-5C74-4696-8249-3F5E1863D90C','扣件与钢管连接松紧适宜,各杆件接头合适',390)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('031AF968-0EE2-4FD7-90E6-D2C8EE2F0F02','48F06310-5C74-4696-8249-3F5E1863D90C','剪刀撑、抛撑、固定杆搭设齐全',400)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('C9F121A4-2051-4BF2-92F1-C6E1DA37B170','48F06310-5C74-4696-8249-3F5E1863D90C','大型脚手架接地符合要求',410)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('6395B9A9-24EC-4E9B-AACC-D4FF813C1132','48F06310-5C74-4696-8249-3F5E1863D90C','脚手架能够满足施工(承载)的要求',420)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('84A2B5DA-0660-4E98-9323-43EA2771E7AB','366AC069-60BB-4D0A-A049-63CCCAEFC48C','有该项吊装作业的技术方案/措施,并按规定进行了交底',430)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('CD86C50D-E202-47B0-9E68-E975FC38E5D1','366AC069-60BB-4D0A-A049-63CCCAEFC48C','起重机械吊装性能等完好，并能满足吊装要求',440)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('1D9BC5C7-84E0-4F99-BCE6-7AD098C3E2F1','366AC069-60BB-4D0A-A049-63CCCAEFC48C','起重机械司机和起重作业人员持证上岗',450)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('CD2D63F5-E6F6-45F0-A329-4E49E1AF5406','366AC069-60BB-4D0A-A049-63CCCAEFC48C','起重作业所需劳动保护用品齐全、到位、能够满足施工要求',460)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('BABC5D6F-6FD1-445A-A0F3-353FED97BBE6','366AC069-60BB-4D0A-A049-63CCCAEFC48C','起重吊装指挥和司机对“十不吊”和各自岗位安全成产责任制清楚',470)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('35D3AD57-4E1C-4FD8-9532-1B4AE67EE78D','366AC069-60BB-4D0A-A049-63CCCAEFC48C','班组自检合格',480)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('97EFD3FD-9EF2-45D7-8D22-87B62AC986E1','366AC069-60BB-4D0A-A049-63CCCAEFC48C','专业复检合格',490)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('D81F93D7-9725-48B9-85EE-3E79A436A8C7','366AC069-60BB-4D0A-A049-63CCCAEFC48C','相关管理单位联合检查合格',500)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('0A1BFF93-CEDA-4DB9-9AA7-A354142B4772','D61D5E9C-3378-4FC1-83F6-FB4F66B2EAC5','使用放射源，有相应的安全防护措施，有事故应急预案和相应的应急措施和设备',510)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('0323C0AB-618A-425E-B560-6D77DDC0CCC0','D61D5E9C-3378-4FC1-83F6-FB4F66B2EAC5','放射施工作业前，将放射作业时间、地点、内容、设防措施等向在该地点及其周周放射作业可能辐射到的施工作业人员交代清楚',520)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('A9E9F659-4C03-48F3-8FDD-CC2C39AC82AA','D61D5E9C-3378-4FC1-83F6-FB4F66B2EAC5','向所有参与放射作业施工的全体人员交代清楚作业时间、地点、内容、设施措施、自身保护措施和事故应急措施等',530)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('5AE4E4AC-0A68-4FFF-B9D9-FD32B6ADBB4E','D61D5E9C-3378-4FC1-83F6-FB4F66B2EAC5','放射施工作业施工设防、警戒区设置大小符合规定要求，“旗-绳”警戒醒目(晚间放射施工作业增加红色警示灯)，并设专人负责监护',540)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('AA622D3A-4C85-4D40-B51A-90AA8B4F255D','D61D5E9C-3378-4FC1-83F6-FB4F66B2EAC5','放射施工作业所使用的设备等符合有关规定要求',550)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('B25A79CB-549B-49F9-A448-97D4167CB725','D61D5E9C-3378-4FC1-83F6-FB4F66B2EAC5','放射施工作业人员防护等符合有关规定要求',560)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('4F300DCB-786B-4EE4-B28D-E065FC77B1D0','B57C6ECB-1891-49EC-9D21-1DF4FD07C9B1','有进受限空间作业技术方案/措施，交底清楚，到位',570)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('54A720FC-3CF4-4411-B8DD-BF8AEA2D91CE','B57C6ECB-1891-49EC-9D21-1DF4FD07C9B1','所有与受限空间有联系的阀门、管线加盲板断开，进行工艺吹扫蒸煮',580)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('67EFB3D1-59D2-44A0-BC94-8E0F22A8E0CB','B57C6ECB-1891-49EC-9D21-1DF4FD07C9B1','盛装过可燃有害液体、气体的受限空间，分析其可燃气体，当其爆炸下限>4%时浓度应<0.5%，爆炸下限<4%时浓度应<2%；含氧19.5%~23.%为合格，有毒有害物质不超过国家规定的“车间空气中有毒有害物质的最高允许浓度”指标',590)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('64B33809-C9C8-4451-BB5B-B89DF0AE9974','B57C6ECB-1891-49EC-9D21-1DF4FD07C9B1','受限空间打开通气孔自然通风两小时以上，必要时采用强制通风或佩戴呼吸器；但受限空间内动焊缺氧时，严禁用通氧气方法补氧',600)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('8DD20933-A830-44E8-B823-8FEAD2F7F0AD','B57C6ECB-1891-49EC-9D21-1DF4FD07C9B1','使用不产生火花的工具；使用手持电动工具应有漏电保护',610)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('735D0042-A51F-404E-9DCC-4BCA68201749','B57C6ECB-1891-49EC-9D21-1DF4FD07C9B1','带搅拌机的受限空间要切断电源，在开关上挂“有人检修，禁止合闸”标志牌；上锁或设专人监护',620)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('A0D6743F-9183-41E0-9A0A-1C8666694B22','B57C6ECB-1891-49EC-9D21-1DF4FD07C9B1','所用照明应使用安全电压，电线绝缘良好。特别潮湿场所和金属受限空间内作业，行灯电压应12V以下或使用1:1隔离变压器',630)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('BA8F697C-F960-4F31-B13B-FCBB6C9F5622','B57C6ECB-1891-49EC-9D21-1DF4FD07C9B1','进入受限空间内作业，外面需有专人监护；并规定互相联络方法和信号；受限空间出入口内外无障碍物，保证畅通无阻',640)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('7B0D34E2-BB33-4F51-8845-23C9FDE4BB6F','B57C6ECB-1891-49EC-9D21-1DF4FD07C9B1','作业人员必须穿符合安全规定的劳动保护着装和防护器具',650)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('1B149431-DBD6-4FBD-B831-47EF58B02B8D','B57C6ECB-1891-49EC-9D21-1DF4FD07C9B1','严禁使用吊车、卷扬机运送作业人员',660)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('940A90E4-F42F-48A7-8C69-C85E34457F56','B57C6ECB-1891-49EC-9D21-1DF4FD07C9B1','盛装能产生自聚物的受限空间要求按规定蒸煮和做聚合物试验',670)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('6E15FE1F-5AA4-408F-B686-6E757E0A8CEE','B57C6ECB-1891-49EC-9D21-1DF4FD07C9B1','受限空间外配备一定数量的应急救护用具和一定数量的灭火器材',680)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('C919BF5F-48E4-42D4-8DB7-884D1C6744D9','B57C6ECB-1891-49EC-9D21-1DF4FD07C9B1','作业前后登记清点人员、工具、材料等，防止遗留在受限空间内',690)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('9531CC02-FB0F-4CF9-A6E0-8CB224E1C14B','B57C6ECB-1891-49EC-9D21-1DF4FD07C9B1','对进受限空间作业人员及监护人进行安全应急处理、救护方法等方面教育，并明确每个人的职责',700)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('3464F684-BCDF-4BA5-A65B-47AB8EECBB07','2C0660F9-D093-46E8-93E9-1D01D05EF718','有该项目施工作业的技术方案/措施',710)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('4C6791A8-416E-4465-8C00-5E4998D64339','2C0660F9-D093-46E8-93E9-1D01D05EF718','作业前，按照规定进行了技术交底和相应的安全交底(教育)',720)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('8E1C765A-78A7-4F14-BAC9-0B814F24B165','2C0660F9-D093-46E8-93E9-1D01D05EF718','施工作业人员劳动保护用品配备到位，符合该项目施工作业的要求',730)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('3F7BD28A-0146-4822-9979-6AF5C85994F2','2C0660F9-D093-46E8-93E9-1D01D05EF718','落实了该项目施工作业的安全责任区和相应的责任人',740)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('2BE8EA0D-85EC-4E08-BFB7-B423F7F19791','2C0660F9-D093-46E8-93E9-1D01D05EF718','检修项目的置换、吹扫、隔离、化验分析合格',750)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('F82127A5-1FC0-4395-91BC-FD06D742B397','2C0660F9-D093-46E8-93E9-1D01D05EF718','检修施工人员的教育、交底严格按照检修施工要求进行，履行检修的相应手续',760)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('06A8CCDD-A51A-4799-9FBE-CF334078A342','A321A0E8-C438-4AAD-BDA1-460083ECDBF7','有高处作业技术方案/措施，交底清楚、到位',770)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('47443105-B3C8-47A4-839E-01D59B216B05','A321A0E8-C438-4AAD-BDA1-460083ECDBF7','作业人员身体条件符合要求',780)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('FDD2402D-4B96-4AEF-B6D2-346F49B90CDD','A321A0E8-C438-4AAD-BDA1-460083ECDBF7','作业人员着装符合工作要求、佩戴安全带、携带有工具袋',790)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('382B979C-1D07-4DA0-BDC3-FFC3127DC332','A321A0E8-C438-4AAD-BDA1-460083ECDBF7','作业人员佩戴 A、过滤式呼吸器 B、空气式呼吸器',800)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('C0691603-7DDC-4803-9369-8919CAE579A8','A321A0E8-C438-4AAD-BDA1-460083ECDBF7','现场搭设的脚手架、防护围栏符合安全规程',810)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('68D036AC-8483-4699-84D6-BE2D217398FF','A321A0E8-C438-4AAD-BDA1-460083ECDBF7','垂直分层作业中间有隔离设施',820)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('B03C209B-427F-4709-9D6E-6B4528385C06','A321A0E8-C438-4AAD-BDA1-460083ECDBF7','梯子或绳梯符合安全规定',830)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('56A18A12-1055-421D-8A19-6B9A5C0D9FB7','A321A0E8-C438-4AAD-BDA1-460083ECDBF7','在石棉瓦等不承重物上作业应搭设并站在固定承重板上',840)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('D66B349C-18CC-4631-9786-A166DC6F2A58','A321A0E8-C438-4AAD-BDA1-460083ECDBF7','高处作业有充足照明，安装临时灯规范、合理',850)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('6B238AAF-28C5-4F7C-95C9-2CB82F9C40AE','A321A0E8-C438-4AAD-BDA1-460083ECDBF7','特级高处作业配有通讯工具',860)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('239509AE-751E-47F3-800D-E213E39E40D8','A3E0CB1E-FC5D-4C8F-B76D-E9E21311C184','有该项目作业技术方案/措施，交底清楚、到位',870)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('1A4F7A8E-82CA-4B04-89B7-590CEB87F76E','A3E0CB1E-FC5D-4C8F-B76D-E9E21311C184','作业人员身体条件符合要求',880)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('73B491BB-27BA-4AB5-8B8F-B4B968410A3B','A3E0CB1E-FC5D-4C8F-B76D-E9E21311C184','作业人员着装符合工作要求、佩戴安全带、携带工具袋',890)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('3FC25B82-FE6F-406A-9F60-D2D3B00755FE','A3E0CB1E-FC5D-4C8F-B76D-E9E21311C184','作业处有充足照明，安装临时灯规范、合理',900)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('3971E0BC-7FB5-49C2-BB6C-B96AF3667C01','A3E0CB1E-FC5D-4C8F-B76D-E9E21311C184','特级高处作业配有通讯工具',910)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('0F6C44C6-6033-4F14-BDC1-1B08760EE65B','A3E0CB1E-FC5D-4C8F-B76D-E9E21311C184','符合临边作业之3项具体要求',920)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('1CDBA1E6-CBF0-4BC6-B004-DD6D021FB7C5','A3E0CB1E-FC5D-4C8F-B76D-E9E21311C184','符合洞口作业之5项具体要求',930)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('5EBE4302-5D3C-41CD-8FC8-3FDF582FCF8F','A3E0CB1E-FC5D-4C8F-B76D-E9E21311C184','符合攀登作业之6项具体要求',940)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('FDD25720-79ED-470C-A075-907C8BF203CB','A3E0CB1E-FC5D-4C8F-B76D-E9E21311C184','符合悬空作业之2项具体要求',950)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('84C26759-2DE8-4425-9F06-03583BA769C5','79211283-4A46-4321-BF6E-0C349F24C16D','有使用危险化学物品的技术方案/措施，交底清楚、到位',960)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('613B27CB-0552-41EC-AB39-8144A7F26344','79211283-4A46-4321-BF6E-0C349F24C16D','作业人员是否具有使用危险物品资质',970)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('0C93FEF6-BA48-4A2E-9C3C-0858A0089040','79211283-4A46-4321-BF6E-0C349F24C16D','是否了解所用危险物品的性能、操作规程和防护措施',980)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('336A2E4B-5AB9-442F-921F-7CC6381D617E','79211283-4A46-4321-BF6E-0C349F24C16D','作业人员个人防护用品是否选用合适',990)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('35F149AE-0FAA-4DC1-993F-D4C538500036','79211283-4A46-4321-BF6E-0C349F24C16D','现场是否具备各种防护设施',1000)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('74B54AB9-DD13-4F37-8AB0-77826D7A1A36','79211283-4A46-4321-BF6E-0C349F24C16D','所使用的工具是否安全可靠',1010)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('E6BC7BA0-3A3E-4493-9555-AA209CA0BE89','79211283-4A46-4321-BF6E-0C349F24C16D','醒目位置是否设置警示标志，围设警示带',1020)
GO

--HSSE管理行为检查表
 INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('D9CBD92D-2620-464A-9CEF-8229A01AB6EB','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','是否编制临时用电施工组织设计；是否办理临时用电票；',1030)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('45B59E53-26CD-4A5A-A9D4-96D9D40B7097','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','临时用电是否采用TN－S三相五线制系统；',1040)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('4C43E6CA-DB9B-45C8-811C-923509349767','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','是否实行三级配电、两级保护、做到“一机一闸一保护”；',1050)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('CB90F4D0-30B2-4A3D-B6AE-FE8EEA177E5D','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','电缆是否沿地面明设；是否架设在树木或脚手架上；',1060)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('B9467DF2-1707-4087-8C60-3461343EF15F','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','电缆接头是否牢固可靠，绝缘良好。采取防潮措施，有醒目的警告牌；',1070)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('28DC1137-631C-4A70-8806-D0EB4B3C127A','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','电缆与钢管、脚手架、管道之间是否绝缘防护，不得用金属丝绑扎电缆；',1080)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('0328CAF9-5539-44E7-A068-5EC840E33C14','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','配电箱和开关箱箱体是否用铁板制作，厚度大于1.5mm；',1090)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('7374A38B-54FC-4094-A6A1-9720E6D95CE6','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','是否存在用金属丝代替熔丝的违规现象；',1100)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('B442004C-83BB-438E-B2DD-36C44A2DE160','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','配电箱和开关箱进线口和出线口是否设在箱的下面，电源的引出线是否设防水弯头；',1110)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('6C684E7C-25A3-4397-B187-698A09E5889B','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','导线端头是否采用螺栓连接或压接，是否存在将芯线直接挂在电源开关上的现象；',1120)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('9A40909C-984C-4E5C-9777-FC59D1B779AB','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','接触器、开关等，是否动作灵活，接触良好可靠，触头是否有烧蚀现象；',1130)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('440B466E-46CD-47E4-B50B-1FCEC25C376A','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','配电箱和开关箱是否防雨、防尘，有门、有锁；',1140)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('BA8D99DB-965A-4A78-8E0B-11B50F7523EF','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','开关箱中每路是否装设漏电保护器；',1150)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('B5015C44-D032-4C8B-AC62-B08BDF52AFC7','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','是否做到配电箱和开关箱漏电保护器的漏电电流应不大于30ｍA,额定漏电动作时间应小于0.1S；',1160)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('22349C64-B2AB-440A-BB9C-812F09FE6E0A','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','移动式和手持式电动工具是否装设额定漏电动作电流不大于15mA，额定漏电动作时间小于0.1S的漏电保护器；',1170)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('D9542FB7-462E-49F4-BE74-6AF12917884D','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','移动式和手持式电动工具电源线是否采用铜芯多股软电缆；',1180)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('4D330906-70A8-48FD-BD5A-8BEB47D71F6A','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','中小型起重机或其附近，是否设能断电开关；',1190)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('FB003CD0-2046-45CC-9CF0-79F2F9D00304','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','现场照明行灯电压是否超过36V；',1200)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('5C70449B-3C8C-49EC-8B16-7FC5B2260775','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','金属容器内及潮湿环境下使用的行灯，其电压是否超过12V；',1210)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('75D6EA13-12FD-405A-AE00-14B569F9C198','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','电焊机外壳是否接地可靠，是否多台串联接地；',1220)
GO
INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('287B1022-DE1D-4411-812F-95085D348B8D','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','电焊机一次侧的电源线是否绝缘良好，其长度是否大于5米；	',1230)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('33AF2677-02F5-49FE-8559-A4010AA2437F','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','电焊机二次侧引出线是否采用橡皮绝缘铜芯软电缆，其长度是否大于30m；',1240)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('5702F223-FF15-4C5D-889D-31E6B6ED7B77','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','工作零线和保护零线是否均采用电缆芯线；',1250)
GO
INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('F01EC02A-7310-4047-A517-E21A87E8A549','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','现场保护接零的低压系统、变压器低压侧中性点是否直接接地，其接地电阻是否大于4Ω；',1260)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('1F87772A-6BB7-4DC0-9C4F-3CA251614268','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','与用电设备相关的电焊机房、金属板房、钢平台、金属构架等是否作接零或接地保护；',1270)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('91B29B1C-1322-4A0A-95F3-3C5E47854702','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','用电设备的保护零线或保护地线是否并联；',1280)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('208DC3D1-DDB2-4DAE-AED9-8473496FDCAE','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','用电设备的保护零线或保护地线是否采用焊接、压接、螺栓连接或其他可靠方法连接；',1290)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('BE73E705-D436-4EDD-90F2-1126A9BD79F6','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','是否保存有自动开关调整记录、电表校验记录、接地电阻测试记录；',1300)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('BE1EED85-19A8-4CEE-89E0-6935FA79B007','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','是否有电工日检记录，且按时按点；',1310)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('B34CB203-538C-47F2-9385-533F015ECC51','52AD156A-C6A6-4FFB-B9BD-7A1588E4CD0A','是否办理破土作业工作票；',1320)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('97DFC510-66B9-4BEE-9309-E12BF25AB2AF','52AD156A-C6A6-4FFB-B9BD-7A1588E4CD0A','作业票是否标明破土作业的平面位置、深度和范围及作业手段（机械或人工开挖），是否建设单位、监理公司、总承包单位审核批准；',1330)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('6B914C6B-7089-498A-8635-4CB2BC08F90E','52AD156A-C6A6-4FFB-B9BD-7A1588E4CD0A','作业前是否对地下隐蔽工程和地质资料情况掌握清楚；',1340)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('64EA3AA1-2734-4E77-87B3-59619FE7BA1C','52AD156A-C6A6-4FFB-B9BD-7A1588E4CD0A','作业前是否制定施工方案，落实HSE管理措施；',1350)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('B9FE4AA5-5995-47B9-8B1B-623F3D2E50F3','52AD156A-C6A6-4FFB-B9BD-7A1588E4CD0A','施工单位是否明确作业现场HSE负责人，对施工过程的安全作业全面负责；',1360)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('DBA711E2-B33F-4CC9-9524-0F61F1ABF6AB','52AD156A-C6A6-4FFB-B9BD-7A1588E4CD0A','在生产装置、罐区内施工时，是否设专人负责监护；',1370)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('4396E81E-4591-46DC-967B-644B739CEF1F','52AD156A-C6A6-4FFB-B9BD-7A1588E4CD0A','破土前，作业单位是否逐条落实审核单位意见及有关HSE措施，并对所有作业人员进行HSE教育和HSE技术交底；',1380)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('1206407F-2D26-4CCF-9B84-A3F007EDD294','52AD156A-C6A6-4FFB-B9BD-7A1588E4CD0A','作业人员在作业中是否按规定着装和佩戴劳动保护用品；',1390)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('974D952C-0251-411A-A2EC-9E5A439D26FF','52AD156A-C6A6-4FFB-B9BD-7A1588E4CD0A','在道路上、生产装置、罐区内施工时，是否在现场设围栏及警告牌；',1400)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('48BB029D-9C1E-4EF5-818E-34EA5239164C','52AD156A-C6A6-4FFB-B9BD-7A1588E4CD0A','夜间动土作业时是否设警示灯；',1410)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('B854FA85-94BB-4585-AF44-56290589C50E','52AD156A-C6A6-4FFB-B9BD-7A1588E4CD0A','获准破土作业许可后，施工单位是否根据作业票要求事项和地下隐蔽工程情况进行现场标识，明确破土作业范围和施工方法；',1420)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('BD4E6F26-335E-48D0-B1ED-91B887735FDD','52AD156A-C6A6-4FFB-B9BD-7A1588E4CD0A','在地下管道、电缆等不清楚时，是否使用机械开挖；',1430)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('9E8390F1-46EF-490B-B0EC-8AD991D88518','52AD156A-C6A6-4FFB-B9BD-7A1588E4CD0A','发现事先预料不到的地下设备、管道、电缆及其它不可辨别的埋设物时，是否立即停止作业，报告建设单位，经处理后再进行作业；',1440)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('F4E7F7A3-B7B8-4CA8-9193-901D8827D695','52AD156A-C6A6-4FFB-B9BD-7A1588E4CD0A','出现有毒、有害气体或不明性质的物料时，是否立即停止作业，及时向上风向撤离，并报告厂方处理；',1450)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('245BD81C-DE03-45B3-A801-E34CCF051934','52AD156A-C6A6-4FFB-B9BD-7A1588E4CD0A','当确定为有害气体或物料时，是否按进入设备作业要求办理票证，重新作业时要采取防毒措施，并派专人监护；',1460)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('4DC17FE3-FC82-404C-9F8F-0A1C5E2EDE2B','0CD8C338-07B9-4AE3-A2A6-04485098FE91','是否办理动火作业工作票；',1470)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('5BA5D95C-E1E9-4D15-849E-16C778A81F66','0CD8C338-07B9-4AE3-A2A6-04485098FE91','是否确保灭火器配置数量、有效性并放在合适位置；',1480)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('CCC3A185-751D-4859-9953-5A8C2B6120D6','0CD8C338-07B9-4AE3-A2A6-04485098FE91','是否会使用消防器材，熟悉防火预案、作业环境和安全撤离路线；',1490)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('A4FE62F3-B118-4DD8-8559-F8F0A3AD2953','0CD8C338-07B9-4AE3-A2A6-04485098FE91','是否一张用火票只限一处用火作业；',1500)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('C34ADBFB-69F0-4AA9-AB30-8B3CF30EC4BA','0CD8C338-07B9-4AE3-A2A6-04485098FE91','用火票是否由用火执行人随身携带；',1510)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('3043EDAA-C5DA-4C6B-BB72-73215EB44441','0CD8C338-07B9-4AE3-A2A6-04485098FE91','是否严格执行“三不动火”；',1520)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('D172A2F6-788B-425B-A924-31A4D0C53E75','0CD8C338-07B9-4AE3-A2A6-04485098FE91','用火作业结束后，是否检查确认无火种遗留，切断电源后方可离开现场；',1530)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('05096855-B601-495A-90B8-8AA04D233929','0CD8C338-07B9-4AE3-A2A6-04485098FE91','固定施工用火区是否配置消防器材、砂池、消防水源，保持消防通道畅通；',1540)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('70E83E78-EAF4-4FDD-944A-9E44AA152F29','0CD8C338-07B9-4AE3-A2A6-04485098FE91','易燃易爆场所施工动火作业前是否采取拆迁、隔离、置换、清洗、敞开、提高湿度、加强通风等防火措施；',1550)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('1037C3E3-74C3-46E4-8861-F0857578F29E','0CD8C338-07B9-4AE3-A2A6-04485098FE91','高处动火作业是否设置防止火花飞溅坠落的设施，并对其下方的可燃物、易燃物、机械设备、电缆、气瓶等采取可靠的防护措施；',1560)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('C9C9B882-0252-4DD0-B7EC-2199948C437A','0CD8C338-07B9-4AE3-A2A6-04485098FE91','高处动火作业是否与防腐施工同时进行垂直交叉作业；',1570)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('F4AE7DA3-7FA0-45EA-AE00-A6966DD440CB','0CD8C338-07B9-4AE3-A2A6-04485098FE91','高处电焊、氩弧焊作业人员在未到达作业位置之前，是否开启电源；',1580)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('D4DC4573-E3B3-4D46-9F90-C74CE96A1ADF','0CD8C338-07B9-4AE3-A2A6-04485098FE91','使用气瓶的工人是否培训考核合格，持证上岗；',1590)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('A03B7635-17AE-4654-97F0-81EC6B952428','0CD8C338-07B9-4AE3-A2A6-04485098FE91','乙炔瓶是否立放稳固，使用时是否安装阻火器；',1600)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('48FE0E6A-31B4-4C61-9D3E-964F595B2DB6','0CD8C338-07B9-4AE3-A2A6-04485098FE91','氧气瓶库与乙炔瓶等易燃气瓶库相距是否大于10米；',1610)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('F32C2075-E496-4BDC-AC5F-FE535BD6B7FF','FD18318D-CF10-47A9-86C5-CC066B5119B3','搭设前，是否根据施工要求报审搭设方案；',1620)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('D9276F82-C04A-45B5-A6E2-45AB8D394D9D','FD18318D-CF10-47A9-86C5-CC066B5119B3','脚手架是否选用外径48～51mm,壁厚为3～3.5mm的钢管；',1630)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('3808F29E-1549-4495-8944-11AE9D9B9A5C','FD18318D-CF10-47A9-86C5-CC066B5119B3','脚手板绑扎材料是否用8号镀锌铁丝；',1640)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('6FCD12A3-004A-4B54-A98A-6B6450CEE1E7','FD18318D-CF10-47A9-86C5-CC066B5119B3','作业人员是否取得特种作业操作证，且身体状况符合高处作业的要求；',1650)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('6F574A3D-585C-45BA-8676-F63B8A4863D5','FD18318D-CF10-47A9-86C5-CC066B5119B3','大型和特殊脚手架施工方案，是否经项目技术负责人、业主、监理公司和总承包方审批，向作业人员技术交底；',1660)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('C3E69E25-561B-4A3E-A211-F5E0D852F402','FD18318D-CF10-47A9-86C5-CC066B5119B3','大型和特殊脚手架施工方案，是否向作业人员技术交底；',1670)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('DD9D4C1A-14E2-42BF-AD34-65AA5E7D5ED2','FD18318D-CF10-47A9-86C5-CC066B5119B3','在电力线路附近搭设脚手架时，是否与电线保持规定的安全距离；',1680)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('A6B315F2-D5C6-42E4-9A9E-7C98BBF296D3','FD18318D-CF10-47A9-86C5-CC066B5119B3','作业区域是否设置警示带，非作业人员不得入内；',1690)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('1033D022-64BE-4FAF-91A6-D0AD6A2A2EDC','FD18318D-CF10-47A9-86C5-CC066B5119B3','在搭设脚手架过程中，如脚手板、杆未绑扎、锁紧，是否中途停止作业；',1700)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('D7845732-45D5-4A04-8F50-177BC775C943','FD18318D-CF10-47A9-86C5-CC066B5119B3','从地面搭设时，地基是否平整、坚实；',1710)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('1C926BD6-1D6C-43F7-B35D-4FDA73C16368','FD18318D-CF10-47A9-86C5-CC066B5119B3','从地面搭设时，是否增设扫地杆弥补地基的不足；',1720)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('7D8F4314-EB19-443F-BE5D-F057711D5B2A','FD18318D-CF10-47A9-86C5-CC066B5119B3','脚手架是否从下而上逐渐扩大，形成倒塔式；',1730)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('AE27596B-44F9-45DD-8662-CD0A518B907B','FD18318D-CF10-47A9-86C5-CC066B5119B3','脚手架整体是否稳定牢固，不得摇摆晃动；',1740)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('A73206BC-2FE9-419D-A9AD-D991100F0846','FD18318D-CF10-47A9-86C5-CC066B5119B3','从地面或操作基础面至脚手架作业面，是否有上下梯子和通道；',1750)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('FDB5E915-E08A-417A-9080-B4E442B58F18','FD18318D-CF10-47A9-86C5-CC066B5119B3','脚手架的作业面脚手板是否满铺，绑扎应牢固，探头板的长度≯300mm；',1760)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('4D94E21E-5702-4F40-BFA7-F01A4E6900BE','FD18318D-CF10-47A9-86C5-CC066B5119B3','脚手架的走道和平台外侧，是否设置挡脚板；',1770)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('A6C816AD-B3EE-46E9-93A9-103FEE729516','FD18318D-CF10-47A9-86C5-CC066B5119B3','搭设完毕，是否通知HSE主管部门和脚手架使用单位，三方共同检查验收，经确认合格，填写《脚手架交接验收单》，并签字确认，挂“脚手架已验收合格” 牌后方可使用；',1780)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('9F5A59A7-E4B5-43FF-8CA5-7E2D20922944','FD18318D-CF10-47A9-86C5-CC066B5119B3','验收后的脚手架任何人不得擅自改动，特殊情况下需作局部改动时是否经施工负责人同意，由原架设班组操作，完成后仍须履行检查、交接、验收手续；',1790)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('14C44CE9-C0AF-436E-8B3D-3E5C16B20FD8','FD18318D-CF10-47A9-86C5-CC066B5119B3','脚手架是否定期检查，大风暴和雨后是否进行全面检查；',1800)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('451EE759-9657-4C76-84A7-3C66DB545100','FD18318D-CF10-47A9-86C5-CC066B5119B3','脚手架在使用过程中，是否随意拆除架杆和脚手板；',1810)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('BE42AF7E-EE97-4E4C-868C-80E019819598','FD18318D-CF10-47A9-86C5-CC066B5119B3','拆除脚手架时，是否周围设警戒区，并派专人监护，禁止行人进入作业区内；',1820)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('C5397629-7119-4038-AAF2-4821A345E69B','FD18318D-CF10-47A9-86C5-CC066B5119B3','拆除作业是否按顺序由上而下拆除，不准上下同时作业；',1830)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('43612FA2-22D3-42EC-B926-BFDA55E55498','FD18318D-CF10-47A9-86C5-CC066B5119B3','拆卸下的架杆、连接件、跳板等材料，是否采用溜放，严禁向下投掷；',1840)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('76F1EE8C-5909-4C41-9C0B-3E2AA53DA70B','FD18318D-CF10-47A9-86C5-CC066B5119B3','作业人员、架杆及作业面等与电线的安全距离不足时，是否切断电源；',1850)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('E381EA5F-65AA-4028-9F7C-EAAB1A313210','FD18318D-CF10-47A9-86C5-CC066B5119B3','已卸（解）开的脚手杆、板，是否一次全部拆完。',1860)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('204A96C4-4AAB-40AD-9DBA-8BAE6E650155','EC986070-16BF-4343-8850-252D9A747358','进行三级（15～30米）、以上高处作业时，是否办理了《高处作业票》；',1870)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('B2A358BC-9374-4652-8810-EA3149B8BA60','EC986070-16BF-4343-8850-252D9A747358','高处作业区域四周是否张挂警戒带；',1880)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('43437189-E576-4D84-98FA-1C1901C1FC2A','EC986070-16BF-4343-8850-252D9A747358','夜间高处作业是否有充足的照明；',1890)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('A8F65ABE-4A76-4EDD-9FC5-C34109CB684C','EC986070-16BF-4343-8850-252D9A747358','是否进行安全教育及技术交底，落实安全措施；',1900)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('A6BDDB8F-25F2-4C5C-B306-D145A93FBFB1','EC986070-16BF-4343-8850-252D9A747358','是否系好安全带、戴好安全帽，衣着灵便；',1910)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('C66E7CF9-0DB5-4A61-9EC8-59999A713D52','EC986070-16BF-4343-8850-252D9A747358','高处作业与电气架空线是否保持足够的安全距离；',1920)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('16D5F259-51A6-4241-8CAC-0653155588B6','EC986070-16BF-4343-8850-252D9A747358','在六级风以上和雷电、暴雨、大雾等恶劣气候条件下是否进行露天高处作业；',1930)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('3724A8FF-C046-4091-95C8-8347FC5C02E4','EC986070-16BF-4343-8850-252D9A747358','工具应放入工具袋，是否上下投掷工具、余料和废料等；',1940)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('21036925-88BA-42E5-BA66-060853842853','EC986070-16BF-4343-8850-252D9A747358','建筑工程的防护栏杆，是否自上而下用安全立网封闭；',1950)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('4CDA7FA8-3DAF-4F03-9395-560B11540103','EC986070-16BF-4343-8850-252D9A747358','接料平台两侧的栏杆，是否自上而下加挂安全立网； ',1960)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('3844AAAA-FBC7-405A-B1BA-E33088A0A51E','EC986070-16BF-4343-8850-252D9A747358','是否5米以上的一次性攀登作业，办理审批手续后，方可使用吊篮等垂直载人设施进行；',1970)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('DA4F95B8-06D1-4719-AE0E-D66DAD3C5308','EC986070-16BF-4343-8850-252D9A747358','钢柱、钢梁、屋架、管廊等构件吊装前，是否先设置爬梯、脚手架等高处作业工具；',1980)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('6D536F83-B501-4CD0-A2B5-A1BDAE71E547','EC986070-16BF-4343-8850-252D9A747358','构件吊装时，是否搭设进行临时高空作业安全设施，随构件同时上吊就位；',1990)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('16FEF6EE-D64A-417D-909E-EB93DD50498E','EC986070-16BF-4343-8850-252D9A747358','吊装中的大模板等屋面板上,是否站人和行走；',2000)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('3A7B8E6C-3168-449B-85AD-B446964E6094','EC986070-16BF-4343-8850-252D9A747358','模板未固定前是否进行下道工序；',2010)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('AA6DBECA-0C45-40A5-9A82-50B20FF48950','EC986070-16BF-4343-8850-252D9A747358','支设高度在3米以上的柱模板，四周是否设斜撑，是否设平台；',2020)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('42D95ECF-ABB0-4558-A2F5-63D99DD664D8','EC986070-16BF-4343-8850-252D9A747358','绑扎和安装钢筋骨架时,是否搭设脚手架和马道；',2030)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('1C859B86-6B6E-437A-848A-6B10BB42CABD','EC986070-16BF-4343-8850-252D9A747358','绑扎3米以上的柱钢筋,是否搭设操作平台；',2040)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('320DA4DB-DF15-4CEE-9987-2ACFCF9438A8','EC986070-16BF-4343-8850-252D9A747358','浇筑离地2米以上框架、过梁等构件,是否设操作平台；',2050)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('BD5C1E35-1E8B-4F16-996C-5D4043BAFF49','EC986070-16BF-4343-8850-252D9A747358','移动式平台的面积是否超过10M2,高度超过5米；',2060)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('077040A2-7342-41CC-9673-0013669D554D','EC986070-16BF-4343-8850-252D9A747358','模板、脚手架等拆除时,是否下方有人；',2070)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('89D7D995-BECF-42AD-A47D-F2C0A0861387','EC986070-16BF-4343-8850-252D9A747358','结构施工自二层起，是否凡人员通道口均搭设安全防护棚；',2080)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('DD2384ED-F794-4FED-9829-F10BD93F2855','EC986070-16BF-4343-8850-252D9A747358','由于上下施工可能坠落物件的通道，在其受影响的范围内，是否搭设顶部能防止穿透的双层防护廊；',2090)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('5991001A-885C-40EF-BCD4-380F19DEADDC','EC986070-16BF-4343-8850-252D9A747358','处于起重机吊臂回转半径内的通道，在其受影响的范围内，是否搭设顶部能防止穿透的双层防护廊；',2100)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('DBEF8245-76C9-4B86-BFFF-35D4B0B68EF9','82884781-F5B6-4623-A0BC-112DCA6665D9','起重机械是否有产品合格证、安全使用、维护、保养说明书；',2110)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('849ED22A-9452-4C60-AD1F-076EBD3E3F19','82884781-F5B6-4623-A0BC-112DCA6665D9','是否每天作业前进行安全检查，发现问题的起重设备，必须进行检修处理；',2120)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('6DB8C30A-4253-4631-8C6C-F17E4C477274','82884781-F5B6-4623-A0BC-112DCA6665D9','钢丝绳、吊钩、卡环、卸扣、绳卡及卷扬机等是否具有合格证及使用说明书；',2130)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('69482A77-87FC-4542-A2F9-1660FA05EA6F','82884781-F5B6-4623-A0BC-112DCA6665D9','大中型设备、构件的吊装，是否编制吊装方案，并审批；',2140)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('34BC768D-AF17-4F59-B59B-ACCEF28B9B91','82884781-F5B6-4623-A0BC-112DCA6665D9','作业前是否由技术人员向起重作业人员进行技术交底；',2150)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('2BF872B1-87B3-4093-9594-D74526D34644','82884781-F5B6-4623-A0BC-112DCA6665D9','起重作业中，起重指挥是否严格执行吊装方案；',2160)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('62086234-4BD3-4155-B5F8-DB8ED5F1E397','82884781-F5B6-4623-A0BC-112DCA6665D9','是否由起重总指挥签发“大型设备吊装起吊令”方可进行试吊和吊装作业；',2170)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('BFE48435-908B-46EB-8D6F-48B0170103B5','82884781-F5B6-4623-A0BC-112DCA6665D9','起重指挥人员是否分工明确、调度到位，并佩戴鲜明的标志上岗指挥；',2180)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('3EDD8C19-E597-4469-AB1F-CEED99DADF44','82884781-F5B6-4623-A0BC-112DCA6665D9','多台起重机吊运同一重物时，是否选用相同机种和相同起重能力的起重机械；',2190)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('BFFD87C5-E305-4F1C-A08D-25F472B5B906','82884781-F5B6-4623-A0BC-112DCA6665D9','是否经过安全技术培训，取得地方主管部门签发的特种作业操作证后，方可从事起重指挥和操作作业；',2200)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('E2E14DB4-418D-49FB-A841-E499BA378C6C','82884781-F5B6-4623-A0BC-112DCA6665D9','是否按规定的指挥信号进行指挥；',2210)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('5DAE1453-0DD3-43F2-839C-5DF9D14CEAC7','82884781-F5B6-4623-A0BC-112DCA6665D9','是否正式起吊前应进行试吊；',2220)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('19626525-0E8A-4ADD-93E4-C5A78008B09E','82884781-F5B6-4623-A0BC-112DCA6665D9','吊装过程中，任何岗位出现故障，是否立即向指挥者报告；',2230)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('3E49BC1A-BD06-4629-9DC0-68794F16B71F','82884781-F5B6-4623-A0BC-112DCA6665D9','重物就位前，是否解开吊装索具；',2240)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('2158B654-1CE5-4808-B761-C4BC815571C8','82884781-F5B6-4623-A0BC-112DCA6665D9','起重操作人员是否按指挥人员的信号进行操作，对紧急停车信号，不论由何人发出，均应立即执行；',2250)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('A5AD1815-DDCC-4BD0-B7BC-3943D2009914','82884781-F5B6-4623-A0BC-112DCA6665D9','是否使用起重机或其它起重机械起吊超载或重量不清的物品和埋置物；',2260)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('73DF6796-6289-4DD9-87C8-A768301472D5','82884781-F5B6-4623-A0BC-112DCA6665D9','是否在制动器、安全装置失灵、钢丝绳损伤等情况下禁止起重操作；',2270)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('C670A478-3016-488C-AA90-A78CA09A447F','82884781-F5B6-4623-A0BC-112DCA6665D9','吊物捆绑、吊挂不牢或不平衡、吊物棱角处与钢丝绳之间未加衬垫时是否不得起重；',2280)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('02F2DA05-C419-4396-9F1B-A59116B8B665','82884781-F5B6-4623-A0BC-112DCA6665D9','无法看清场地、吊物情况和指挥信号时是否停止进行起重操作；',2290)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('895A961A-4937-48BE-A7C4-8F0A9BE38448','82884781-F5B6-4623-A0BC-112DCA6665D9','起重机械及其臂架、吊具、辅具、钢丝绳、缆风绳和吊物是否远离高低压输电线路；',2300)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('E7922276-2414-46ED-B335-09129F7F470A','82884781-F5B6-4623-A0BC-112DCA6665D9','在停工或休息时，是否将吊物、吊笼、吊具和吊索悬吊在空中；',2310)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('DD76328A-D90F-4AA6-AA6B-0F8332A070B8','82884781-F5B6-4623-A0BC-112DCA6665D9','不得 利用极限位置限制器停车；',2320)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('045D1F48-FF21-4D92-8405-291F596E2C4C','82884781-F5B6-4623-A0BC-112DCA6665D9','两台或多台起重机械吊运同一重物时，钢丝绳是否保持垂直； ',2330)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('CD56903C-588D-46BA-B670-6A30564FDA2B','82884781-F5B6-4623-A0BC-112DCA6665D9','两台或多台起重机械吊运同一重物时，升降、运行是否保持同步；各台起重机械所承载荷不得超过其额定能力的75％；',2340)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('BABD897F-404E-4E8E-96AD-CF7689D20F6F','82884781-F5B6-4623-A0BC-112DCA6665D9','两台或多台起重机械吊运同一重物时，各台起重机械所承载荷是否超过其额定能力的75％；',2350)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('D31172A7-AA0E-47D8-BBBC-AEE4346E19D7','82884781-F5B6-4623-A0BC-112DCA6665D9','司索人员是否按吊装方案选择吊具与吊索并保证正确使用；',2360)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('0BDF1ABA-545E-4E40-A265-2FDF61CA99F8','82884781-F5B6-4623-A0BC-112DCA6665D9','吊物捆绑是否牢靠，吊点和吊物的重心应在同一垂直线；',2370)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('40AD6858-FE74-4827-BEF9-20650217FDA1','82884781-F5B6-4623-A0BC-112DCA6665D9','司索人员是否随吊物起吊或在吊钩、吊物下停留；',2380)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('0D12CA89-27DE-4B95-BF6C-6DF113E9B196','82884781-F5B6-4623-A0BC-112DCA6665D9','吊挂重物时，起吊绳、链所经过的棱角处是否加衬垫；',2390)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('18B35FC9-810F-449C-A9EC-3FBF93BAF483','99431E70-833A-464D-8066-E41E230646DA','是否具有Ｘ射线机使用合格证；',2400)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('EC4A7073-6C10-4752-B9F4-065485DE0356','99431E70-833A-464D-8066-E41E230646DA','是否具有放射工作人员资质证；',2410)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('7693D0EC-9894-41A9-AA8D-518F8D72C7F1','99431E70-833A-464D-8066-E41E230646DA','是否具有射线装置使用登记证；',2420)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('99D56128-76D8-4571-B9C1-CF0783C94B08','99431E70-833A-464D-8066-E41E230646DA','是否具有射线装置工作许可证；',2430)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('13D889BA-070F-4E1F-B486-1E6DCAF221DE','99431E70-833A-464D-8066-E41E230646DA','是否申请办理射线作业许可证，并经施工分包方HSE管理部门和主管领导批准后，方可进行射线作业；',2440)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('0BD5BED4-2A05-4705-A34F-7D150CB1E3F2','99431E70-833A-464D-8066-E41E230646DA','在作业前是否制定安全技术措施，并落实到位；',2450)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('444A904F-C146-4438-8AD9-E65460430D97','99431E70-833A-464D-8066-E41E230646DA','使用射线装置的部门是否在作业前必须到其HSE管理部门、设备部门办理登记手续；',2460)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('7E790E6B-68D8-4D64-98FB-3661E99F957C','99431E70-833A-464D-8066-E41E230646DA','作业前，是否划定好作业区间，确定作业时间，确保周围无关人员安全撤离。正式作业前，还要进行清场；',2470)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('25BD3FC0-4610-4173-AE1D-8CEF0E4A3F1F','99431E70-833A-464D-8066-E41E230646DA','作业前，是否勘察好施工现场的地形，正确设置好警戒线、警戒灯，确保警戒线外射线瞬时剂量率小于2微戈瑞/小时；',2480)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('A44D50C3-D57D-4D1C-B7E4-C777E95D3B11','99431E70-833A-464D-8066-E41E230646DA','对重要路口和人员经常出入口是否派专人看守；',2490)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('5FE9D368-6B6E-498A-A235-004E93A7FD25','99431E70-833A-464D-8066-E41E230646DA','作业时，现场是否有两名及以上射线作业人员才能进行射线作业；',2500)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('91D10C1D-6515-4F98-8FA2-19BB62E7777D','99431E70-833A-464D-8066-E41E230646DA','放射人员是否持证上岗，熟悉有关安全注意事项，做到四会（会使用、会保养、会检查、会排除故障），三好（用好、管好、维护保养好）；',2510)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('7A208414-DDDE-475D-ADFB-F4FD913F0376','99431E70-833A-464D-8066-E41E230646DA','作业前是否穿戴好防护用具；',2520)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('5FBD1BFB-0EAF-4016-A83A-88AAFE723F5E','99431E70-833A-464D-8066-E41E230646DA','夜间作业是否有充足的照明；',2530)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('5D8D11C9-9BD2-4531-A67D-58CD5A6BD702','99431E70-833A-464D-8066-E41E230646DA','在金属容器内作业，是否有相应的安全措施；',2540)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('2335B7BF-E1B5-4DD8-9905-6D65B8E31AC7','99431E70-833A-464D-8066-E41E230646DA','在射线装置、设备使用过程中，如果有射线装置、设备的交接是否做好交接记录；',2550)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('5939E1A2-7827-4413-AC9F-F083A3BD1F9C','99431E70-833A-464D-8066-E41E230646DA','放射性同位素在运输前是否按照国家规定向当地卫生防疫部门办理准运手续；',2560)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('448F239A-D850-49D9-A13B-E5923DDA70FB','99431E70-833A-464D-8066-E41E230646DA','自行运输是否由随身携带剂量监测仪的安全人员或射线作业人员押运，对其进行不间断监测，以防意外丢失和泄漏，同时穿戴好防护用品；',2570)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('9BA8E101-EA35-4469-B30C-74871166EDCF','99431E70-833A-464D-8066-E41E230646DA','每天使用结束后，是否将成套设备一起送回，并存放在专用处所，不得与易燃、易爆、易腐蚀物品摆放在一起，指派专人负责保管；',2580)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('D810BE0C-4CB4-4EDA-ACBA-CEB1C688CD8C','99431E70-833A-464D-8066-E41E230646DA','每天使用结束后，必须将成套设备一起送回，十分指派专人负责保管；',2590)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('CBE6CBA9-7DC4-419C-815F-F1EA34A5DD57','99431E70-833A-464D-8066-E41E230646DA','贮存是否实行双人双锁制，责任到人，同时做好防火、防盗、防泄漏工作；',2600)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('341A5209-26F2-4285-ADD8-07D945939343','99431E70-833A-464D-8066-E41E230646DA','贮存场所是否有明显的国际放射性标志；',2610)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('C5E943B0-78A7-4328-BEE4-7D2312EB43CE','99431E70-833A-464D-8066-E41E230646DA','贮存、领取、使用、归还是否经使用单位所在HSE管理部门、设备部门核实，做到帐物相符；',2620)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('0FC81248-816B-4DD0-A3DF-02D5F32BD050','99431E70-833A-464D-8066-E41E230646DA','γ射线探伤一旦出现放射源失控故障，是否采取紧急补救措施；',2630)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('79BE2EF1-E5EE-40FB-9D32-BB5A19C81A40','77205883-AE5F-4047-8241-6922A2CCE6C4','是否编制受限空间作业施工安全技术方案，并审批；',2640)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('483E77F6-B415-470F-A283-B2D30345ABDE','77205883-AE5F-4047-8241-6922A2CCE6C4','作业前是否由技术人员向受限空间作业人员进行安全技术交底；',2650)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('34D946F0-5ABB-415F-95AA-BC435783AEA4','77205883-AE5F-4047-8241-6922A2CCE6C4','作业前是否由技术人员向受限空间作业人员进行安全技术交底；',2660)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('F2CC8471-61D0-4CDF-8CD9-3E7A2D94E9BD','77205883-AE5F-4047-8241-6922A2CCE6C4','安全技术交底是否做好记录；',2670)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('5D6B4418-9FAF-4728-9484-C824756AEC5E','77205883-AE5F-4047-8241-6922A2CCE6C4','接受交底的施工人员是否在记录上签字；',2680)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('A828A009-89C8-4157-ADB8-88DEE2273E2D','77205883-AE5F-4047-8241-6922A2CCE6C4','进入设备、装置、容器、坑道、井下前是否进行有害物质毒性、可燃性、爆炸性、腐蚀性监测分析；',2690)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('A91C5F65-4C58-4CEE-92CD-951BDB77CDAF','77205883-AE5F-4047-8241-6922A2CCE6C4','是否经检验合格，办理相关的作业票证后方可进入设备、装置、容器、坑道、井下作业；',2700)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('389B5744-CE21-493A-AB36-E5020E6E5C9B','77205883-AE5F-4047-8241-6922A2CCE6C4','受限空间之大件吊装前是否办理起重吊装令；',2710)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('98E70408-041F-4F7C-A636-69583787575E','77205883-AE5F-4047-8241-6922A2CCE6C4','受限空间之动火作业前是否办理动火作业许可证；',2720)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('897E8E7A-0113-4B81-9ED0-0F7505D32B46','77205883-AE5F-4047-8241-6922A2CCE6C4','受限空间之挖沟、动土作业前是否办理动土作业许可证；',2730)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('124DAF9A-9479-450C-AEF9-FD58EB622872','77205883-AE5F-4047-8241-6922A2CCE6C4','受限空间之登高作业前是否办理高处作业许可证令；',2740)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('B9B69AEA-A04E-4447-8A86-B3F6F0D02B4E','77205883-AE5F-4047-8241-6922A2CCE6C4','受限空间之射线作业前是否办理射线作业许可证；',2750)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('58B95955-6A8C-41F5-920E-50ECA4C30138','77205883-AE5F-4047-8241-6922A2CCE6C4','作业人员是否正确配戴必要的劳动保护用品；',2760)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('CA779737-EE85-445A-9EB4-46EC55DB1BE6','77205883-AE5F-4047-8241-6922A2CCE6C4','作业时，现场是否有专人负责监护；',2770)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('D3E9F211-FC8C-4025-A6AC-6F5ED1FC6832','77205883-AE5F-4047-8241-6922A2CCE6C4','工作中，各工种是否严格遵守本工种的安全操作规程；',2780)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('928EE1A2-240D-4284-B2CB-E69ABA940F43','77205883-AE5F-4047-8241-6922A2CCE6C4','工作中，是否存在违章指挥、违章作业；',2790)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('A31E31DD-C24E-45D9-82D9-D04EB5DE1853','77205883-AE5F-4047-8241-6922A2CCE6C4','现场HSE人员是否不间断进行现场安全巡检，发现问题及时处理；',2800)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('B2182A60-2953-45EB-A523-69230EEC7793','77205883-AE5F-4047-8241-6922A2CCE6C4','多工种混合交叉作业，是否充分考虑各工种间的相互影响及其潜在的危险。',2810)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('447F7482-3DEE-462F-B6E0-49DC11680FCF','8DC2F97B-CB4F-4848-B528-6A8155C26771','氧气瓶是否与乙炔气瓶同车运输；',2820)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('B06E7898-D14A-4405-9196-FE840D26EACD','8DC2F97B-CB4F-4848-B528-6A8155C26771','气瓶装车前是否戴好防护帽和防震圈；',2830)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('070AD806-77AC-4F59-9755-ACBE2B30DB75','8DC2F97B-CB4F-4848-B528-6A8155C26771','所有的运输车辆是否配有干粉灭火器； ',2840)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('1B2B77D4-64DC-4596-83FD-53CF82113D1C','8DC2F97B-CB4F-4848-B528-6A8155C26771','运回气瓶后是否立即卸车；',2850)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('877E724D-5666-4B1A-8CF0-B0D9DA2BEE86','8DC2F97B-CB4F-4848-B528-6A8155C26771','气瓶是否置于专用仓库贮存。应使用铁栅栏与外界隔开；',2860)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('5E0BFB3A-B8F8-4ECB-8737-B41FD8F1D81B','8DC2F97B-CB4F-4848-B528-6A8155C26771','气瓶专用贮存仓库是否使用铁栅栏与外界隔开；',2870)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('0467F788-D51F-4B43-95B9-3179224A21F4','8DC2F97B-CB4F-4848-B528-6A8155C26771','气瓶堆放处是否有照明；',2880)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('253E60E1-66F0-4BAC-8E36-913472C03F9B','8DC2F97B-CB4F-4848-B528-6A8155C26771','氧气瓶库与乙炔瓶等易燃气瓶库相距是否大于10米；',2890)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('45BCE2BB-2971-403E-A20A-5F5CD3B0339C','8DC2F97B-CB4F-4848-B528-6A8155C26771','使用气瓶的工人是否培训考核合格，持证上岗；',2900)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('D9107273-5C07-4AA4-B2D5-9E3287558B35','8DC2F97B-CB4F-4848-B528-6A8155C26771','气瓶使用前是否进行安全状况检查，对盛装气体进行确认； ',2910)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('7E5902A2-BEB6-4178-A12B-65932CB8FF46','8DC2F97B-CB4F-4848-B528-6A8155C26771','气瓶是否立放；',2920)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('95F0F40D-7140-4BF0-AA79-17E1B55B39F5','8DC2F97B-CB4F-4848-B528-6A8155C26771','瓶内气体不得用尽，是否留有不小于0.05MPa的剩余压力；',2930)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('D68829C8-F622-4179-8A0A-28AED0BF4B18','8DC2F97B-CB4F-4848-B528-6A8155C26771','乙炔瓶是否立放稳固；',2940)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('5ACC74FC-0162-4958-A152-4BA9DB77E9EF','8DC2F97B-CB4F-4848-B528-6A8155C26771','乙炔瓶是否安装使用阻火器；',2950)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('7BD9098F-0FBE-4A3D-BE51-7EFDD36448C3','8DC2F97B-CB4F-4848-B528-6A8155C26771','气瓶使用人员是否严格执行气焊、割安全操作规程；',2960)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('D2A550C0-07DF-427D-A7EB-E77594710A7E','8DC2F97B-CB4F-4848-B528-6A8155C26771','气瓶使用人员是否采取措施预防回火；',2970)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('CD767E03-A2C9-4DBB-A4C5-94B4E71A4447','C9288081-8BD3-4949-A9C6-6320F827D35B','使用单位使用危险物品时，是否填写危险物品申请单；',2980)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('F8F2D562-79CB-462B-BAA5-DB309C15DEA0','C9288081-8BD3-4949-A9C6-6320F827D35B','采购部门在接到危险物品申请单后是否做到认真审核；',2990)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('52736519-2AC6-4002-9DF9-C84FF1A06FF8','C9288081-8BD3-4949-A9C6-6320F827D35B','采购部门在接到危险物品申请单后是否填写危险物品跟踪单；',3000)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('A432604A-1366-4D1F-9876-8A5A6E93BB25','C9288081-8BD3-4949-A9C6-6320F827D35B','危险物品运送到现场时，是否附有危险物品跟踪单；',3010)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('31360DFE-31E4-47DE-9380-1A62D3A7E606','C9288081-8BD3-4949-A9C6-6320F827D35B','危险物品的运输部门是否持物资供应部门签证的申请单、购销合同或调拨单，到使用地公安机关办理相关手续；',3020)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('431C0905-074D-42CC-8F03-BECA772F047D','C9288081-8BD3-4949-A9C6-6320F827D35B','危险物品是否有专人押运和装卸；',3030)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('1C5779BC-ED1F-439D-8DC5-EB47A5757B10','C9288081-8BD3-4949-A9C6-6320F827D35B','押运、装卸人员是否经过培训，掌握所押运、装卸危险物品的性质、危害等安全常识；',3040)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('BE56D3F0-D769-475D-B6B9-9CCC0FE60C20','C9288081-8BD3-4949-A9C6-6320F827D35B','装卸时是否轻拿轻放，装车不能过高，要捆紧捆牢；',3050)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('B60B101D-E9E1-4B3E-B2D7-B5071A27D1EC','C9288081-8BD3-4949-A9C6-6320F827D35B','必须夜间装卸时，是否有充分可靠的照明；',3060)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('58E42E05-DE77-4A9A-96B0-E47772B5754E','C9288081-8BD3-4949-A9C6-6320F827D35B','专用运输车辆是否保持良好车况，限速运输；',3070)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('E8C72140-E34C-4CFC-A959-D86CB12BB3E6','C9288081-8BD3-4949-A9C6-6320F827D35B','专用运输车上是否明显悬挂“危险”标识；',3080)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('7CFBEEA8-9296-4548-9526-41B07626E585','C9288081-8BD3-4949-A9C6-6320F827D35B','危险物品入库前，是否进行认真的验收；',3090)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('A815225F-ABB5-46A6-A5C6-F5FBDA86CF24','C9288081-8BD3-4949-A9C6-6320F827D35B','危险物品是否分类隔离储存；',3100)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('0C61CD00-547D-4D10-BBC4-36F6D564427D','C9288081-8BD3-4949-A9C6-6320F827D35B','是否经常检查危险物品的物理性能和形态，作好记录，采取相应措施，防止危险物品质量下降而引起事故；',3110)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('54D12F64-E33B-4CF5-BB76-C45940FF7224','C9288081-8BD3-4949-A9C6-6320F827D35B','对特殊物质的储存，是否按国家有关规定加强管理，必须实行双人、双锁保管，严格遵守保管制度，并做好安全保卫工作；',3120)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('9FD6FC0D-8707-49D3-84AF-109C1D603647','C9288081-8BD3-4949-A9C6-6320F827D35B','储存危险物品的库房，是否注意季节性预防；',3130)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('B4A7F1A8-D231-40AF-9C56-5BBA354585C5','C9288081-8BD3-4949-A9C6-6320F827D35B','作业人员在使用危险物品前，是否办理危险物品的使用许可证；',3140)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('99AFBC33-60EF-473E-B492-D75BA5049874','C9288081-8BD3-4949-A9C6-6320F827D35B','许可证签发人员是否根据危险物品跟踪单中的有关要求对相关事项进行检查确认；',3150)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('D6B2463B-2FF3-400F-9AF7-C851CB1C3916','C9288081-8BD3-4949-A9C6-6320F827D35B','在使用危险性较大的危险物品的地方，是否在醒目位置设置警示标志，围设警示带；',3160)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('70A9E544-0001-41AA-945F-C5E0DD2E76A1','C9288081-8BD3-4949-A9C6-6320F827D35B','当发生事故时，是否立即组织实施应急措施，使事故损失降低到最小程度；',3170)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('8A5FA335-DDE3-4FBD-B285-C4909BB48D40','C9288081-8BD3-4949-A9C6-6320F827D35B','危险物品在作业后，是否按规定妥善保管；',3180)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('9518E65A-C31B-4468-8AD4-FB22B83EB9C3','C9288081-8BD3-4949-A9C6-6320F827D35B','废弃的危险物品是否擅自处理；',3190)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('04E95DBB-9DFC-45CB-B94B-976AFBD84634','C9288081-8BD3-4949-A9C6-6320F827D35B','废弃的危险物品不允许擅自处理，是否由有关部门认可的有资格单位进行处理； ',3200)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('67FEF797-02EC-484D-9B31-DD9A632161F0','C9288081-8BD3-4949-A9C6-6320F827D35B','危险物品的储存、消耗和废弃数量是否由危险物品使用负责人认真核对和记录在危险物品清单上，并报HSE主管部门；',3210)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('973780F4-DA83-4E28-8D3C-6F498004D931','10A8AF77-8103-422D-AE72-FAEB058C4770','特种设备若有规定在使用前必须向所在地、市监督部门申请取得特种设备准用证者，使用单位是否申请取证；',3220)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('974B0C09-55AD-4744-8239-E01F6BCFDDCB','10A8AF77-8103-422D-AE72-FAEB058C4770','特种设备是否经地、市劳动部门检验合格；',3230)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('81AE9631-941B-4882-AB97-66F99355B98C','10A8AF77-8103-422D-AE72-FAEB058C4770','操作人员是否持有劳动部门考核后签发的安全操作证；',3240)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('009DEEEF-6784-4F0F-B74D-4D4D5140476D','10A8AF77-8103-422D-AE72-FAEB058C4770','是否建立健全安全管理规章制度和安全操作规程；',3250)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('FCA30BB2-E290-40DE-A80A-CE76BEF8EE60','10A8AF77-8103-422D-AE72-FAEB058C4770','检查特种设备的主管部门是否存档设备出厂技术文件；',3260)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('D34F0163-C957-4022-920A-F7F1FF4C3BE8','10A8AF77-8103-422D-AE72-FAEB058C4770','检查特种设备的主管部门是否存档使用、维护、保养、检查和试验记录；',3270)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('5F5C112E-1339-4CDF-ABD1-4312C491E672','10A8AF77-8103-422D-AE72-FAEB058C4770','检查特种设备的主管部门是否存档设备及人身事故记录；',3280)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('73221886-3511-4B2D-9791-7B13D24C1D29','10A8AF77-8103-422D-AE72-FAEB058C4770','检查特种设备的主管部门是否存档安装、修理记录和验收资料；',3290)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('FF9AE840-E6E0-4202-8127-997E6A55A174','10A8AF77-8103-422D-AE72-FAEB058C4770','每日使用前是否检查各类限位保护装置、制动器、控制器以及电梯厅门联锁开关、紧急报警装置、升降机的安全钩的安全性能等；',3300)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('6F8C577C-79A7-4F27-9380-26253B8CFD5A','10A8AF77-8103-422D-AE72-FAEB058C4770','每日使用前是否检查轨道及紧固件的安全状况；',3310)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('7B6DFC2D-2220-45E4-BC64-AEAF6A6638A1','10A8AF77-8103-422D-AE72-FAEB058C4770','每日使用前是否检查钢丝绳的安全状况；',3320)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('734C08F9-3308-4A01-B8FD-1F686A27CC41','10A8AF77-8103-422D-AE72-FAEB058C4770','每日使用前是否检查安全防护装置的安全性能等；',3330)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('B8F2403C-A48A-41FE-BC6E-D89C6DB38616','10A8AF77-8103-422D-AE72-FAEB058C4770','起重机械和电动葫芦是否检验各类极限位置限制器和超载限制器；',3340)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('649B8CE7-65D8-40B4-8D35-38046D18D2D1','10A8AF77-8103-422D-AE72-FAEB058C4770','起重机械和电动葫芦是否检验幅度指示器；',3350)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('EDBB4D8A-58D2-4C78-9685-C413C048D0E7','10A8AF77-8103-422D-AE72-FAEB058C4770','起重机械和电动葫芦是否检验锚定装置、防倾翻安全钩；',3360)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('A947472D-A331-4084-A74D-4E60AB2A1A17','10A8AF77-8103-422D-AE72-FAEB058C4770','起重机械和电动葫芦是否检验防止吊臂后倾装置；',3370)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('C5356402-9051-4766-97A6-7DF34ABBC8DF','10A8AF77-8103-422D-AE72-FAEB058C4770','起重机械和电动葫芦是否检验缓冲器和夹轨钳；',3380)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('7764B1D7-1B01-433E-A496-3A08FC2CE4C3','10A8AF77-8103-422D-AE72-FAEB058C4770','电梯和升降机是否检验超重保护装置；',3390)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('846DA683-FFC0-4023-933C-26F9795DCD96','10A8AF77-8103-422D-AE72-FAEB058C4770','电梯和升降机是否检验供电系统相位和错相保护装置；',3400)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('E388F2FD-8407-44FF-94A1-51D35D95D614','10A8AF77-8103-422D-AE72-FAEB058C4770','电梯和升降机是否检验撞底缓冲装置、超越上、下极限工作位置时的保护装置；',3410)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('90F0B890-AE84-47D7-8014-CE41BC6550C4','10A8AF77-8103-422D-AE72-FAEB058C4770','电梯和升降机是否检验防止超重或断绳保护装置；',3420)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('A9D7DB36-F8AE-4073-8193-885ABF07D520','10A8AF77-8103-422D-AE72-FAEB058C4770','电梯和升降机是否检验停电或电气系统发生故障时轿厢慢速移动装置及安全门停止装置；',3430)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('9EC96748-DE84-4362-9B00-976E8F0C6E1F','10A8AF77-8103-422D-AE72-FAEB058C4770','电梯和升降机是否检验紧急报警装置；',3440)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('8671B9A9-4A1C-45D1-A4A7-7F1E14E4A497','10A8AF77-8103-422D-AE72-FAEB058C4770','停用一年以上的特种设备是否重新检查检验；',3450)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('2DF5B53E-6179-40D8-80B9-73BA09165C74','10A8AF77-8103-422D-AE72-FAEB058C4770','经过大修和改造的特种设备是否重新检查检验；',3460)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('DF47319E-4910-4B70-8B2E-C7C64517EA00','10A8AF77-8103-422D-AE72-FAEB058C4770','发生过重大事故的特种设备是否重新检查检验；',3470)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('DF8400D6-EA46-4ACD-A134-D17D8C3F247C','10A8AF77-8103-422D-AE72-FAEB058C4770','经过4级以上地震后的特种设备是否重新检查检验；',3480)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('3ACAA79F-6A7E-4A39-AD47-79599A948E4A','10A8AF77-8103-422D-AE72-FAEB058C4770','露天作业的起重机经受9级以上大风的，是否重新检查检验；',3490)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('9E039563-9447-4F84-8100-EDB23DBB92EA','B8940917-27F4-438A-BA8E-744B54691F09','车辆是否进行年审，不合格车辆严禁使用；',3500)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('228A9F70-CC21-44DA-BA16-09AF8993023E','B8940917-27F4-438A-BA8E-744B54691F09','是否检查车辆处于完好状态，严禁带病出车；',3510)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('FD150890-1CC1-4691-8600-6212D16B8020','B8940917-27F4-438A-BA8E-744B54691F09','是否发动机动力性能良好，运转平稳、不得有异响，怠速稳定，机油压力正常，功率不低于额定功率的75%；',3520)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('C7DA0B86-9A18-45EF-99F0-C0A1D1D30E73','B8940917-27F4-438A-BA8E-744B54691F09','是否转向系方向盘应转动灵活，操纵轻便，无阻滞现象，车轮转到极限位置时，不得与其它部件有干涉现象；',3530)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('C70F42A8-D175-480A-944E-8181B26B728F','B8940917-27F4-438A-BA8E-744B54691F09','是否制动系统有效，制动力平衡，行驶系统、传动系统、电气仪表及信号装置符合有关标准要求；',3540)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('42919F64-C4BF-4438-B846-0D365429912F','B8940917-27F4-438A-BA8E-744B54691F09','车辆是否配备一定数量的灭火器，且应处于良好有效状态；',3550)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('2774BCCD-831A-4F82-B0CF-B7F490DF784D','B8940917-27F4-438A-BA8E-744B54691F09','废气排放和噪音是否符合国家标准要求；',3560)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('9E6F1975-7DED-47B0-9C89-AFDD866C0EF3','B8940917-27F4-438A-BA8E-744B54691F09','驾驶员是否持有车辆驾驶证和项目内部车辆驾驶上岗证后才准予驾驶车辆；',3570)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('33D83FE1-F31D-432D-8D00-CBC935ABCFA4','B8940917-27F4-438A-BA8E-744B54691F09','驾驶车辆时是否携带驾驶证、行驶证；',3580)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('2A4689C3-49E4-4A83-AA58-922D592D0FFB','B8940917-27F4-438A-BA8E-744B54691F09','驾驶车辆时是否正确使用劳动防护用品；',3590)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('E6E4746D-420B-40CF-A8D7-56A7BAA1DFE6','B8940917-27F4-438A-BA8E-744B54691F09','是否驾驶与执照不符合的车辆；',3600)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('EA19A74D-1576-42A4-B474-A9D196DA909A','B8940917-27F4-438A-BA8E-744B54691F09','是否酒后驾车；',3610)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('E7A38368-BE56-46A7-B063-79E298290D42','B8940917-27F4-438A-BA8E-744B54691F09','是否在行驶中吸烟、饮食、攀谈或做其它有碍行车安全的活动；',3620)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('6E5F61FF-A930-48CC-AF95-F110F66AF6C2','B8940917-27F4-438A-BA8E-744B54691F09','身体过度疲劳或患有疾病有碍行车安全时，是否驾驶车辆；',3630)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('C68F4C85-BF15-4299-A6CF-266AC87DFEF6','B8940917-27F4-438A-BA8E-744B54691F09','驾驶员应谨慎驾驶，确保安全、是否超额载人；',3640)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('CC720FD7-51C7-4ADB-AF8B-F80EF7013EFF','B8940917-27F4-438A-BA8E-744B54691F09','出车前是否做好“三交待”，即交待乘车人数、路线和安全措施；',3650)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('477D95D3-0D42-49B5-8558-FB3E0058A75D','B8940917-27F4-438A-BA8E-744B54691F09','货车载人是否办理“代客证”；',3660)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('030622CB-91CC-4759-B7FB-6444C488F111','B8940917-27F4-438A-BA8E-744B54691F09','行车前检查车辆的灯光是否符合要求，车灯有故障不得行车；',3670)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('0BB0DDE3-03EB-456B-AEDD-E1D8D1C116EC','B8940917-27F4-438A-BA8E-744B54691F09','夜间是否高速行车；',3680)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('4643C2EE-BB2A-4EC2-A29F-8C021C85748F','B8940917-27F4-438A-BA8E-744B54691F09','会车是否在150m以外关闭远光大灯，开近光灯、小灯，并减速；',3690)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('7C3902D6-21C4-48F8-810D-0477397311A8','B8940917-27F4-438A-BA8E-744B54691F09','夜间超车时，是否变换近远灯光，打开转向灯以示意；',3700)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('0074CF6C-3965-40A4-BAA6-2AAAF8A916D1','B8940917-27F4-438A-BA8E-744B54691F09','夜间临时停车是否靠路右边，并打开小灯、尾灯和牌照灯，防止与往来车辆发生碰挂；',3710)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('C06786E5-E344-46FA-9903-0C565D0B4235','B8940917-27F4-438A-BA8E-744B54691F09','雨雪中行车是否保证雨刮器性能正常，不得使电气线路受潮、漏电；',3720)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('C7AB9C4F-6A5D-41A1-B59B-45994D3385D7','B8940917-27F4-438A-BA8E-744B54691F09','雨雪中行车是否特别注意行人和往来车辆，要减速行驶，防止打滑；',3730)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('1A9DD590-13E2-4BD0-87B1-92619D939A77','B8940917-27F4-438A-BA8E-744B54691F09','有雾时，是否打开防雾灯，缓慢行驶，并注意保持车距，遇大雾时，要停止行车；',3740)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('F3D558AA-715F-4BC8-98A7-49390CE4EA22','B8940917-27F4-438A-BA8E-744B54691F09','雨、雪、雾天气行车，是否与前车保持一定的距离，尽量少用制动，禁止滑行和急打方向；',3750)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('52CAC3B8-A53B-4DE5-BBA3-BE8DD8C5D73C','B8940917-27F4-438A-BA8E-744B54691F09','发生事故时，驾驶员和乘客，是否实施自救互救；',3760)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('73267DFE-D425-424D-A21B-BEAA654FD973','E6635238-4A3D-4101-B8E2-8356CBF046C2','是否建立健全现场环境保护管理机构和网络；',3770)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('EE3D6367-FB74-473E-9405-97332FC637DF','E6635238-4A3D-4101-B8E2-8356CBF046C2','是否设专（兼）职人员负责施工现场的管理和监督；',3780)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('87012A60-B752-4E8A-8292-E3715DB97A1D','E6635238-4A3D-4101-B8E2-8356CBF046C2','是否制订本单位环境保护管理办法和实施细则；',3790)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('5C5D4FFC-389C-4C52-ADDF-7646CF631A24','E6635238-4A3D-4101-B8E2-8356CBF046C2','是否建立健全各种报表制度，做好环境统计工作；',3800)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('24B6DA4F-9A0E-4619-8FD1-456535BC059B','E6635238-4A3D-4101-B8E2-8356CBF046C2','是否做好环境保护的宣传、教育工作；',3810)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('C0E4BACF-7A6D-45D4-96CF-F59D8C20E932','E6635238-4A3D-4101-B8E2-8356CBF046C2','作业现场休息室、工具房和设备、器材，是否按施工总平面图布置要求，摆放整齐有序，各种标志、标识正确醒目；',3820)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('E7877ADD-2364-4DB4-A879-582B4EA7FFD6','E6635238-4A3D-4101-B8E2-8356CBF046C2','现场道路是否平整通畅，用电线路布置符合要求，水源设置合理，排水应通畅无阻；',3830)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('584BD139-03F8-4050-99FD-FBAC625ED459','E6635238-4A3D-4101-B8E2-8356CBF046C2','有毒有害物品、易燃易爆物品等是否设专用仓库保管；在作业现场临时放置时，应设警示标识牌，必要时应设专人看护；',3840)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('E4EBF6C2-9477-4381-8B18-9AEDE0E4901D','E6635238-4A3D-4101-B8E2-8356CBF046C2','有毒有害物品、易燃易爆物品等在作业现场临时放置时，是否设警示标识牌，必要时设专人看护；',3850)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('98018D10-8DF7-4355-8B26-92F77C78A477','E6635238-4A3D-4101-B8E2-8356CBF046C2','是否各种油料在容器内存放，废油及时回收集中储存，严禁就地倾倒，油料对地面造成污染时应采取措施进行清理；',3860)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('607C3D85-B046-4B31-BE38-B04307BF6648','E6635238-4A3D-4101-B8E2-8356CBF046C2','防腐保温用油漆、岩棉、绝缘脂和易产生粉尘的材料等是否妥善保管；',3870)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('6931DA98-25EE-4F05-AD75-3482C3B0A0EF','E6635238-4A3D-4101-B8E2-8356CBF046C2','防腐保温用油漆、岩棉、绝缘脂和易产生粉尘的材料等对现场地面或设施造成污染时是否及时清理；',3880)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('FCF9625C-CBF2-49DC-8D8A-7F41954D9CCE','E6635238-4A3D-4101-B8E2-8356CBF046C2','作业现场是否经常打扫并保持清洁，垃圾应集中堆放并及时清理、运送至指定地点；',3890)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('BC87C434-24B2-433F-A1C3-EAB6EBD7AA7D','E6635238-4A3D-4101-B8E2-8356CBF046C2','生活暂设区设置是否远离有毒有害、噪声及射线检测作业场所；',3900)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('5B77B35C-CE6E-48FB-BE6D-1EF7C19F3DB1','E6635238-4A3D-4101-B8E2-8356CBF046C2','生活暂设区区内的道路是否平坦通畅，有足够的照明设施；',3910)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('DF02D437-BE27-45FE-9855-E2D84291456D','E6635238-4A3D-4101-B8E2-8356CBF046C2','生活垃圾是否及时清理，并按规定运至远离生活区的指定地点；',3920)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('BF5BDA83-73A3-44B4-91DC-4F92AB3908E1','E6635238-4A3D-4101-B8E2-8356CBF046C2','厕所设置是否远离饮食卫生场所并通风良好；',3930)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('B64A052E-8353-407A-8F90-98D58ED37B64','E6635238-4A3D-4101-B8E2-8356CBF046C2','生活污水是否设置管道，排放至规定沟渠；',3940)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('BA4FB38F-D853-401F-8928-8EC5C9C17D85','E6635238-4A3D-4101-B8E2-8356CBF046C2','各种建筑、施工垃圾和生活垃圾等，是否倾倒到指定地点；',3950)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('6EB3AE26-F439-4E00-AB2E-181FFC7751BE','E6635238-4A3D-4101-B8E2-8356CBF046C2','运送各种建筑、施工垃圾和生活垃圾车辆是否有防撒播的措施；',3960)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('84738CA6-28A2-4698-846C-2AC3C682A4B1','E6635238-4A3D-4101-B8E2-8356CBF046C2','施工、生活污水是否排放到指定的排水渠内，且应符合国家污水排放标准；',3970)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('E219B0C8-C783-4EF3-A1AA-F2DA1C478A08','E6635238-4A3D-4101-B8E2-8356CBF046C2','可能对周围外部环境造成破坏或影响的施工生产性噪声、光、振动、射线、粉尘、毒物等污染源是否采取相应的保护措施；',3980)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('ACDADF07-24B1-4649-9C37-2B3BD6BEBA92','E6635238-4A3D-4101-B8E2-8356CBF046C2','施工生产、工作或生活中接触到的化学危险品的处理是否依据《危险物品管理规定》执行；',3990)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('2317A213-EF21-4AC2-8AF9-9107D3135A72','E6635238-4A3D-4101-B8E2-8356CBF046C2','施工生产过程中是否注意对发现的各种文物的保护，并及时报告文物保护部门；',4000)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('8B54BD91-93E1-4827-B5B1-ED819640FE89','E6635238-4A3D-4101-B8E2-8356CBF046C2','生活污水、粪便，经化粪池处理后，是否有组织排放到当地环保部门指定的沟渠或河道里；',4010)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('9D8666AC-1440-444E-B5E9-60901BA13D19','E6635238-4A3D-4101-B8E2-8356CBF046C2','化粪池是否定期进行清理，并做好消毒工作；',4020)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('E83E12DA-EBD8-4487-874B-A33AF5A1304C','E6635238-4A3D-4101-B8E2-8356CBF046C2','生活垃圾是否有专人负责定期收集、清除，运走；',4030)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('3F79EF0D-3C29-4267-B8D2-1A3F879EE0BA','E6635238-4A3D-4101-B8E2-8356CBF046C2','运送垃圾的车辆，是否加盖、密封，防止途中撒落，造成环境污染；',4040)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('3A357EB1-6494-460A-9DE1-0D0C2ADDCB52','E6635238-4A3D-4101-B8E2-8356CBF046C2','垃圾箱是否定期喷洒药物杀灭苍蝇、老鼠等；',4050)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('B1986C0E-37D4-4210-8511-79059933E4D6','E6635238-4A3D-4101-B8E2-8356CBF046C2','生活锅炉排出的废气，是否达到国家规定允许排放的标准，否则，必须进行治理；',4060)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('35B89224-3561-4EBC-80CF-EC863B26EF07','E6635238-4A3D-4101-B8E2-8356CBF046C2','是否积极配合当地环保部门经常性监督和定期抽查、监测。',4070)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('DD2867C5-E587-4270-BCE4-0B0BC978D0F9','18D13FB6-0B9D-4CB0-AC3C-AAA67F27F419','是否结合自身实际，制订职工消防培训教育计划，提高全员消防意识；',4080)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('65AC23FB-EC24-489B-B326-B1281B63981E','18D13FB6-0B9D-4CB0-AC3C-AAA67F27F419','对各类人员进行HSE知识教育时，是否有相应的消防安全知识内容；',4090)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('AA461D90-D445-405C-9C2E-D80F3DB68023','18D13FB6-0B9D-4CB0-AC3C-AAA67F27F419','是否建立防火档案；',4100)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('77E14C20-A222-4CE4-A8D4-6DE2BAA9195D','18D13FB6-0B9D-4CB0-AC3C-AAA67F27F419','是否设置防火标志；',4110)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('4980BB91-E7B7-4F4B-88DB-B65405D3CE5B','18D13FB6-0B9D-4CB0-AC3C-AAA67F27F419','是否确定火灾危险源（点），实行严格的管理；',4120)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('67838BB1-D260-49C9-9A73-FA3AEEEF16F1','18D13FB6-0B9D-4CB0-AC3C-AAA67F27F419','是否实行防火巡检，做好巡检记录；',4130)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('8DB511AB-7790-4C7F-ACDD-25DBC8A81DEB','18D13FB6-0B9D-4CB0-AC3C-AAA67F27F419','是否制订灭火和应急疏散预案；',4140)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('8EC16597-B071-4A93-B3FD-8E32AA64E0F9','18D13FB6-0B9D-4CB0-AC3C-AAA67F27F419','是否定期组织消防演练；',4150)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('EF2770B7-B79B-401A-AF9C-EEA83E640450','18D13FB6-0B9D-4CB0-AC3C-AAA67F27F419','是否任何单位、个人不得损坏或者擅自使用、拆除、停用消防设施、器材，不得埋压、圈占消火栓；',4160)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('27547867-E33E-4044-A1D0-F2C38635AA30','18D13FB6-0B9D-4CB0-AC3C-AAA67F27F419','是否占用防火间距； ',4170)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('0C9F8839-E3B4-4CD1-A2FA-C1306580D372','18D13FB6-0B9D-4CB0-AC3C-AAA67F27F419','是否堵塞消防通道；',4180)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('94F55EB1-4653-47FC-80D5-D18B6AF13990','18D13FB6-0B9D-4CB0-AC3C-AAA67F27F419','移动式消防灭火器材是否按消防设计规范和施工现场实际需要，进行合理配置；',4190)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('C7EF79BD-0795-47FE-9709-F8F205897585','18D13FB6-0B9D-4CB0-AC3C-AAA67F27F419','器材的摆放位置是否设立标志，不得随意挪置；',4200)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('D3CF500A-3D84-4677-A60A-F5BDC6D2EAF8','18D13FB6-0B9D-4CB0-AC3C-AAA67F27F419','是否按照各类移动式消防器材的使用及性能要求，按期检查、充装药剂；',4210)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('91B69EEB-608E-403C-93D2-BA677565FE1B','18D13FB6-0B9D-4CB0-AC3C-AAA67F27F419','各类移动式消防灭火器材，是否挂牌标明充装和检查药剂日期，并由专人负责维护保养；',4220)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('07E13966-8560-4A11-B04E-24BEE081B1FC','18D13FB6-0B9D-4CB0-AC3C-AAA67F27F419','灭火器零部件是否完好，保险铅封可靠；',4230)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('ADF2FB16-F38C-4CC2-8402-EC3D214E0B1A','18D13FB6-0B9D-4CB0-AC3C-AAA67F27F419','是否建立健全消防设施、器材管理台帐；',4240)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('9101E9C4-1AEF-4566-85A7-D9CE9D10EC48','18D13FB6-0B9D-4CB0-AC3C-AAA67F27F419','是否如实记录消防设施的日常管理和检查情况；',4250)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('EFE497D7-C2B6-4AF8-91ED-530E7B6C224D','B1758ADE-5B0C-40EC-B400-5C382EDCF4CA','是否建立健全了项目HSE组织机构',4260)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('B1989595-91A5-47F3-8B7F-AC3B96B7B383','B1758ADE-5B0C-40EC-B400-5C382EDCF4CA','是否建立健全了项目HSE管理体系',4270)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('AE42E8DE-9795-4204-840A-D049DE1F49F7','B1758ADE-5B0C-40EC-B400-5C382EDCF4CA','项目HSE组织机构及管理体系运行是否经过报审',4280)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('6A7E24FD-5C35-483A-B7E7-69B01842464F','B1758ADE-5B0C-40EC-B400-5C382EDCF4CA','是否建立健全了项目HSE管理记录及台账',4290)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('6B81B783-8EC6-410D-A5D3-3B7C379CC0B9','B1758ADE-5B0C-40EC-B400-5C382EDCF4CA','是否定期检查施工单位HSE管理记录及台账',4300)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('E2A3F1AA-BCCB-4076-B21F-7D065B4448C4','803A5E17-7DF1-4B6D-9409-E0E0F5D39DDD','在开工前是否必须编制安全技术方案/措施',4310)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('05FF76AC-0254-4007-8520-783270CF8C26','803A5E17-7DF1-4B6D-9409-E0E0F5D39DDD','是否编制临时用电安全技术方案；',4320)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('64BD9A68-6F3B-4FDA-A13B-EEE712C1C999','803A5E17-7DF1-4B6D-9409-E0E0F5D39DDD','是否编制高处作业安全技术方案/措施；',4330)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('77BC8332-7AE8-483A-B9E4-7AD4A1A30CC6','803A5E17-7DF1-4B6D-9409-E0E0F5D39DDD','是否编制起重、运输作业安全技术方案/措施；',4340)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('1AD429A1-6009-4072-9A36-359AFBC87C75','803A5E17-7DF1-4B6D-9409-E0E0F5D39DDD','是否必须编制寒冷季节施工作业安全技术方案/措施；（寒冷区域）',4350)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('D3743142-372D-443F-B220-8D7BF0663C7E','803A5E17-7DF1-4B6D-9409-E0E0F5D39DDD','是否必须编制射线作业安全技术方案/措施；',4360)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('6EF7D2FA-0616-4764-A2BD-36C1F8A56964','803A5E17-7DF1-4B6D-9409-E0E0F5D39DDD','安全技术方案/措施是否包括如下主要内容：编制说明和编制的依据、工程项目概况、主要施工作业程序步骤、具体的安全管理措施、安全措施中发生的机、索、工、器具和材料、相关的图表及文字说明等；',4370)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('A6CDD328-5397-4E18-865B-2CA5C54C49F7','803A5E17-7DF1-4B6D-9409-E0E0F5D39DDD','是否符合编写、审查和批准程序',4380)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('BFC2457D-3AFA-488E-AF03-314CE052BE14','803A5E17-7DF1-4B6D-9409-E0E0F5D39DDD','施工分包方是否组织技术人员向全体施工人员进行交底，并做好记录，接受交底的施工人员应在记录上签字；',4390)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('9243AD28-649B-40BF-8BBB-87760F77723D','803A5E17-7DF1-4B6D-9409-E0E0F5D39DDD','施工分包方是否负责组织其有关部门人员协调、落实、检查安全技术方案/措施中的各项工作。',4400)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('99075B34-E0EC-4C3E-905E-93BC1C4B192A','B8F280FA-3CAC-43FD-98AE-B759FCD8287D','是否进入施工现场所有人员在所有时间内，必须统一穿防护服、戴安全帽、穿护趾鞋；',4410)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('D78571AC-4734-444E-BA27-36C71AEDE51E','B8F280FA-3CAC-43FD-98AE-B759FCD8287D','个人防护用品是否正确配戴，严禁防护服不系扣、安全帽不系带、护趾鞋当拖鞋穿等不规范行为；',4420)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('03A8306C-E432-420F-88B8-79846D5D9275','B8F280FA-3CAC-43FD-98AE-B759FCD8287D','个人防护服、安全帽、护目镜、护趾鞋是否存在混（借）用现象；',4430)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('4EB9FAFC-C889-4AD2-A2EC-67BF5828C709','B8F280FA-3CAC-43FD-98AE-B759FCD8287D','是否根据造成危害或需要某种防护功能，选用或禁止选用某种个人防护用品；',4440)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('75157A2D-01B9-499B-AD18-80B4B4F60277','B8F280FA-3CAC-43FD-98AE-B759FCD8287D','施工单位HSE管理部门是否定期检查个人防护用品使用情况，并做好检查记录。',4450)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('C0DF4B57-EDBC-46DC-80DE-7923BCC8F9E1','DE7930B3-94A0-44AE-8479-39592EC9BAAB','施工分包方应是否采取各种方式进行HSE方面的宣传；',4460)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('A55088FB-D36B-4D73-9DEE-BE2D8BF3F9CA','DE7930B3-94A0-44AE-8479-39592EC9BAAB','施工分包方是否在国家“安全生产月”，“  119”活动周，“世界环境日”期间对员工进行HSE方面的宣传；',4470)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('260AA45A-A89C-4AB6-B429-F6D11EDA89A3','DE7930B3-94A0-44AE-8479-39592EC9BAAB','施工分包方是否在其施工区域内设置相关警示标志；HSE警示标识包括安全警示标志、防火警示标志、固体废物分类标志、消防安全标志等；',4480)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('EF56C7C4-A662-4765-A36A-C14C64C09D34','DE7930B3-94A0-44AE-8479-39592EC9BAAB','在从事危险性高的作业时，例如：吊装作业、高处作业、有限空间作业、夜间作业、放射性环境作业时是否进行安全警示；',4490)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('B0BA1C0F-6C2B-4890-894B-5D043D38BB70','DE7930B3-94A0-44AE-8479-39592EC9BAAB','危险部位的警示标志是否设立，如楼梯口、电梯井口、孔洞口、桥梁口、隧道口、基坑边沿等；',4500)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('B962DA39-DD78-4DAA-99B3-E4618E50296D','DE7930B3-94A0-44AE-8479-39592EC9BAAB','是否在紧急场所设置指令标志，如紧急出口方向、疏散通道方向等；',4510)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('6768C9A2-2665-4A2E-9EF9-0F7B4271118E','DE7930B3-94A0-44AE-8479-39592EC9BAAB','是否设立固体废物分类标志，生活垃圾和工业固体废物分开存放，并分别进行标识；',4520)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('0F8353DB-6E22-45ED-A36D-10B674AF5F1E','DE7930B3-94A0-44AE-8479-39592EC9BAAB','是否对消防设施进行提示性标识，如火警电话、消防栓、消防水带、灭火器等存放的位置。',4530)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('660D5D97-A4BD-4209-B144-9A1F3D03B61B','D3ADAF1D-7799-42E9-BBFD-EB89D93DBED6','全体员工是否参加了业主组织的一级HSE培训；',4540)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('41F8B528-3695-41AE-8D19-61FE8B26ADC1','D3ADAF1D-7799-42E9-BBFD-EB89D93DBED6','全体员工是否参加了总承包方组织的二级HSE培训；',4550)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('2CC203C3-4639-4CCA-A584-8B1BD0EC91D4','D3ADAF1D-7799-42E9-BBFD-EB89D93DBED6','是否对全体员工进行了进入现场前的三级HSE培训；考核成绩是否报LPEC HSE管理部确认并备案；',4560)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('A2028EB9-87B6-47C1-84DC-CAD9955850F8','D3ADAF1D-7799-42E9-BBFD-EB89D93DBED6','是否对特种作业人员进行了培训；',4570)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('AD9A6482-A252-4C19-8846-6567B5557265','D3ADAF1D-7799-42E9-BBFD-EB89D93DBED6','所有进入施工现场的工作人员，进场之前，是否办理了一级HSE培训合格证，持证上岗；',4580)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('034246CA-CF2E-4F3B-9278-5176A3DEFF7D','D3ADAF1D-7799-42E9-BBFD-EB89D93DBED6','所有进入施工现场的工作人员，进场之前，是否办理二级HSE培训合格证，二级HSE培训合格证以“帽签”的形式标识清楚；',4590)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('BDC6D8DC-1431-401C-AF99-96E74C773C28','D3ADAF1D-7799-42E9-BBFD-EB89D93DBED6','是否存在无HSE培训合格证者进入施工现场的现象；',4600)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('BA776D04-038F-4929-A3C0-967FFD39EF63','5AEB3327-BA14-4405-A687-B30AAA81D5A8','是否进行了不少于1小时的HSE培训；',4610)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('C23C4E32-1076-4AFA-906A-832F0ECAF0DD','5AEB3327-BA14-4405-A687-B30AAA81D5A8','是否存档HSE培训记录；',4620)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('7B886ED1-7C70-4047-8BF8-A30592A684AB','5AEB3327-BA14-4405-A687-B30AAA81D5A8','是否做到所有访客，进场之前，必须借领访客证，持证入场；',4630)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('26849148-9F1B-4B3E-BF76-9C410301F3B3','5AEB3327-BA14-4405-A687-B30AAA81D5A8','是否存在无访客证的访客进入施工现场的现象；',4640)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('4AFEB979-9833-47DF-BBDE-0D9D347523DC','5AEB3327-BA14-4405-A687-B30AAA81D5A8','临时访客进入现场是否穿戴工装、安全帽；',4650)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('E09803D8-4102-44D5-ACE9-DC8E4CBA0163','5AEB3327-BA14-4405-A687-B30AAA81D5A8','临时访客进入现场是否违规携带烟火；',4660)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('E0A7D084-1A74-4290-871D-AD96C116A10C','6FF1023B-FCDE-4EC5-9778-439CA1D1D0D7','是否有施工现场通行证；',4670)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('716C2ABD-770E-4573-9541-781943BA8669','6FF1023B-FCDE-4EC5-9778-439CA1D1D0D7','司机是否有驾驶证、行车证；',4680)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('C1FBF300-A2BE-47BA-B48E-90F1C391AF76','6FF1023B-FCDE-4EC5-9778-439CA1D1D0D7','是否按规定路线、速度行驶；',4690)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('78D4137B-6399-4181-B1CA-1EC3EE6FC97F','6FF1023B-FCDE-4EC5-9778-439CA1D1D0D7','是否按指定位置停放；',4700)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('24BCE911-6542-4E93-98AF-28553185D14C','6FF1023B-FCDE-4EC5-9778-439CA1D1D0D7','是否有安全防护措施；',4710)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('1FC75E2D-B7FE-4D84-ABBE-AC0341C6F337','6FF1023B-FCDE-4EC5-9778-439CA1D1D0D7','司机是否过度疲劳或酒后驾车；',4720)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('96550036-7E3A-4092-81CA-597EA9F6BC4F','6FF1023B-FCDE-4EC5-9778-439CA1D1D0D7','是否搭乘无HSE培训合格证或无访客证人员；',4730)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('CB4BB408-7A09-4499-BFE7-337C34A132B8','6FF1023B-FCDE-4EC5-9778-439CA1D1D0D7','运载物品是否影响环境；',4740)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('6CD12146-0EDE-48D1-A96B-BD8A169FDC16','6FF1023B-FCDE-4EC5-9778-439CA1D1D0D7','是否搭运载违禁物品；',4750)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('5909A868-89CC-4467-94F1-B27EDD7160A7','A44B1736-4563-4773-8C2D-140C6A76F103','是否设有风险评估组织机构并有效运行；',4760)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('20D9E3B3-86C8-4ABF-B9C1-146E69A3268E','A44B1736-4563-4773-8C2D-140C6A76F103','是否编制了风险评估结果及隐患治理报告；',4770)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('7CB59FEF-863D-4B6B-8D15-B9FE29A9C0DA','A44B1736-4563-4773-8C2D-140C6A76F103','报告内容是否缺项？至少应包括下列四项内容：a)	分项（分部）或单位工程名称及简介；b)	评估小组组成及评估时间；c)	评估方法及手段；d）评估结果及隐患治理措施，以表格形式列示。',4780)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('7C15A070-60BA-4CD6-BAF6-DF42D0C98B1D','A44B1736-4563-4773-8C2D-140C6A76F103','报告是否经LPEC HSE经理审批，（重大问题由LPEC项目经理审批）；',4790)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('D9AA06FF-E48F-4866-9BB2-EF0C28A4D594','A44B1736-4563-4773-8C2D-140C6A76F103','施工分包方是否依据报告组织实施了隐患治理；',4800)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('86F55BBA-1F87-4430-8C65-FAC700A55519','A44B1736-4563-4773-8C2D-140C6A76F103','施工分包方是否对隐患治理结果进行了自检；',4810)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('1309205F-ED13-480B-9FE5-D27DA572C642','A44B1736-4563-4773-8C2D-140C6A76F103','施工分包方是否对隐患治理结果上报LPEC项目部考核验收；',4820)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('D0E10844-A4A1-48EF-990F-F7AB385EAD4B','0DE6C919-02AD-4297-B6E1-D0D60C31DEA7','是否编制了现场HSE应急预案；',4830)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('6DAB73C4-0EC1-43B7-9234-1FD8AC5D73E5','0DE6C919-02AD-4297-B6E1-D0D60C31DEA7','应急预案内容是否缺项？至少应包括下列九项内容：
a)	评估潜在事故危险的性质、规模及紧急状态发生时的可能关系；
b)	制订与外部机构联系的计划，包括与紧急救援服务机构的联系；
c)	设施内外报警和通讯联络的步骤；
d)	应急指挥中心的地点和组织；
e)	在紧急状态中现场人员的行为（包括撤离步骤）；
f)	在紧急状态下，非现场人员和其他人员的行为；
g)	应急预案所需的资源（人、物资设备）获得的渠道和方式；
h)	地方政府和紧急服务机构的地址和电话及其它联络方式；
i)	应急设备、物资：',4840)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('2AC2B10D-7A96-4A8E-B48F-E307B9F46733','0DE6C919-02AD-4297-B6E1-D0D60C31DEA7','施工分包方是否成立了成立应急指挥部，并明确主要职责：',4850)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('E8892F7C-4204-4B64-A2C3-4B83225C4439','0DE6C919-02AD-4297-B6E1-D0D60C31DEA7','施工分包方是否按照应急预案的计划，组织实施了应急演练（一般每半年一次）：',4860)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('24A81BA6-7F36-400D-B95F-481051B3445F','0DE6C919-02AD-4297-B6E1-D0D60C31DEA7','施工分包方是否存档有应急演练记录；',4870)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('9305942E-EC46-4461-9EF0-E2CC36BBC7A6','0DE6C919-02AD-4297-B6E1-D0D60C31DEA7','施工分包方是否有紧急状态下的应急事件处置步骤；',4880)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('016609DB-78E8-4488-9C12-11B628E12B18','0DE6C919-02AD-4297-B6E1-D0D60C31DEA7','施工分包方是否对事故进行调查分析，并按规定处理善后事宜；',4890)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('1D000E88-3599-4459-BB2D-248225824243','1AFA2D62-681A-4D58-86FA-E40C8B13DD88','是否明确规定了文件、资料的控制范围；',4900)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('E86D19BB-77B2-48AA-A6C0-C5FF9DF3507C','1AFA2D62-681A-4D58-86FA-E40C8B13DD88','是否明确HSE信息及文件处理的权限；',4910)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('F9EE02E6-7B80-49DD-93BF-666FF1851B38','1AFA2D62-681A-4D58-86FA-E40C8B13DD88','施工分包方是否专人对HSE信息及处理结果反馈进行收集、整理、归类、传递等；',4920)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('01EC3F28-A91E-46E9-B2D2-D8D5C901D4F3','1AFA2D62-681A-4D58-86FA-E40C8B13DD88','是否所有与HSE有关的文件、记录、报告、表格等均分类建立台帐，并交资料员进行登记存档；',4930)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('581E13C1-F16F-4ACE-B400-F40C6C097C01','1AFA2D62-681A-4D58-86FA-E40C8B13DD88','施工分包方是否所有归档资料均有唯一的编号且编号连续；',4940)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('31B45DAA-5BD6-4CC7-83B5-16D6A09641A8','1AFA2D62-681A-4D58-86FA-E40C8B13DD88','施工分包方HSE信息及文件借阅共享是否履行借阅共享手续；',4950)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('9390BD32-7DE0-4A34-96D9-BAB69C55D800','F7AA4D86-D92A-4683-B7AD-A11BF9D9EA5B','是否建立班组长安全生产责任制度；',4960)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('15835C33-C89E-4661-B2F4-5F4FEE81FCA7','F7AA4D86-D92A-4683-B7AD-A11BF9D9EA5B','是否建立职工安全生产责任制度；',4970)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('187FAF71-0A83-4A53-A3C7-EF3C735ED511','F7AA4D86-D92A-4683-B7AD-A11BF9D9EA5B','是否对所有职工进行了工种（岗位）安全生产教育，并考试合格；',4980)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('57378A1F-FE57-4895-B3EC-1CD2655ABBD7','F7AA4D86-D92A-4683-B7AD-A11BF9D9EA5B','对严重违章职工，施工单位是否进行违章者再教育，并考试合格；',4990)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('29265703-23FB-4BAD-B47C-F7699CE2874B','F7AA4D86-D92A-4683-B7AD-A11BF9D9EA5B','是否做到班组每周一早上利用1个小时左右的时间开展安全活动，每月安全活动时间不得少于4小时；',5000)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('50A6AC69-49F2-4E3A-A8D9-E159022B9F67','F7AA4D86-D92A-4683-B7AD-A11BF9D9EA5B','班前安全讲话是否做到“三交一清”；',5010)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('F5954DFE-7C8B-4893-81CC-80DA82E872B2','F7AA4D86-D92A-4683-B7AD-A11BF9D9EA5B','是否做到班组安全活动情况和班前安全讲话由班组长指派一名职工负责记录，记录要与班组长的讲话同步进行；',5020)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('9C49D294-C005-4259-8BC7-9901AE4E28D3','889BE6F2-C413-4EC5-8F42-6CAA3EB2724D','是否做到严格按施工总平面布置施工，暂设、机具、材料不得随意摆放或无计划搭设；',5030)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('D147FE77-F7F0-460E-AC9C-A96C53C6F61B','889BE6F2-C413-4EC5-8F42-6CAA3EB2724D','是否正确佩戴劳动保护用品，统一着装并符合HSE规定；',5040)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('8F56B6B3-C76E-45B0-BDED-718DD76554EA','889BE6F2-C413-4EC5-8F42-6CAA3EB2724D','是否现场定期组织清扫，保持现场环境卫生、干净、整洁；严禁随处大小便；设备、配件或材料上保持无泥土、污物和不文明的漫画和文字；',5050)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('8E9FC292-5832-4F77-BBE9-75C9D96EB843','889BE6F2-C413-4EC5-8F42-6CAA3EB2724D','是否施工现场按区域设置废料箱和垃圾箱，及时回收余料、废料；',5060)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('9C98ABED-0D8E-4FCE-8732-BF8870A8286F','889BE6F2-C413-4EC5-8F42-6CAA3EB2724D','工具房等是否按要求整齐摆放，做到工完料尽场地清；',5070)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('F556EE5F-0AC3-48F5-A7CD-84F864F06B3F','889BE6F2-C413-4EC5-8F42-6CAA3EB2724D','现场的水线、电缆、导线、电焊把线、二次线是否统一规划，合理布置；',5080)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('6EBACB4C-EEB1-4A9A-A68B-DE0E72C28AC8','889BE6F2-C413-4EC5-8F42-6CAA3EB2724D','是否做到班组安全活动情况和班前安全讲话由班组长指派一名职工负责记录，记录要与班组长的讲话同步进行；做到氧气带、电焊把线每日收工后盘好；',5090)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('8F47290E-18DB-4CA3-AFBB-E942A5A3EF9B','889BE6F2-C413-4EC5-8F42-6CAA3EB2724D','施工现场是否配备必要的急救用品和救护车辆；',5100)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('EA26D0B2-4FB3-4CB4-A064-DAEEE7C3174F','889BE6F2-C413-4EC5-8F42-6CAA3EB2724D','施工现场道路是否指定专人清扫，定期洒水，防止尘土飞扬；',5110)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('83F8C4ED-9695-4E17-B01C-3CD257B3BCC8','889BE6F2-C413-4EC5-8F42-6CAA3EB2724D','密闭容器内施工是否采取通风措施，在粉尘环境作业的人员，是否配戴防尘口罩；',5120)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('2C9724D0-B1AD-4DAC-935B-099C97600F99','889BE6F2-C413-4EC5-8F42-6CAA3EB2724D','食堂是否做到保证饭菜质量，防止食物中毒事件的发生。',5130)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('D275A8B0-EE2A-4B23-9426-2A9BACE156AC','8A6E4DD8-8433-4080-8F91-A538EA8F0CFE','施工分包方项目部是否制定了本单位的职业卫生管理职责；',5140)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('A537B032-ED18-470F-A861-D31ED3EF0BA5','8A6E4DD8-8433-4080-8F91-A538EA8F0CFE','是否建立和完善项目职业卫生与职业病防治管理机构，健全职业卫生管理规章制度，制订本项目职业卫生与职业病防治工作计划和职业卫生管理实施细则，并监督实施；',5150)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('51D72675-154B-459E-B598-9D5CEAF556D1','8A6E4DD8-8433-4080-8F91-A538EA8F0CFE','是否教育职工执行操作规程，普及防尘防毒知识，正确使用劳动保护用品和防尘防毒器材；',5160)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('C749B642-15D0-403D-8D74-AF26DFB1DC3B','8A6E4DD8-8433-4080-8F91-A538EA8F0CFE','是否按规定组织安排作业人员进行健康检查；',5170)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('F05D05B8-7849-41C3-B15B-98E3FDEE3DAA','8A6E4DD8-8433-4080-8F91-A538EA8F0CFE','施工企业的尘、毒、射线、噪声等防护设施，是否加强维修管理，确保完好；',5180)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('249ACBF2-07B0-447C-A415-409D825061DA','8A6E4DD8-8433-4080-8F91-A538EA8F0CFE','在具有酸、碱等腐蚀物质或化学烧伤危险的场所是否设冲洗设备；',5190)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('EDFEDA04-68F9-4901-973E-28E811212F78','8A6E4DD8-8433-4080-8F91-A538EA8F0CFE','是否严格执行防尘防毒措施和管理制度；',5200)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('BDF99630-4919-4F30-9B2C-1490AC8C1B07','8A6E4DD8-8433-4080-8F91-A538EA8F0CFE','职业卫生与职业病防治工作所需的管理经费、仪器设备购置费，是否得以保证，专款专用；',5210)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('4C151F05-AF68-4084-A85C-454F223D65E3','8A6E4DD8-8433-4080-8F91-A538EA8F0CFE','施工分包方是否做到职工总数超过1000人设专职职业卫生管理人员1人，不足1000人设兼职职业卫生管理人员1人；',5220)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('EA323602-4145-481B-A04C-E40680EB9AA9','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','施工分包方项目部是否建立健全施工现场的公共安全与治安保卫组织机构，落实各级安全保卫责任制；',5230)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('7A905765-D116-40E2-A03D-590B606337A8','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','是否建立健全公共安全与治安保卫各项管理制度，确保文明施工；',5240)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('923C3BFA-593E-4A5A-ABF5-EB366B555D38','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','是否进入现场的所有人员佩戴业主统一制作的现场出入证，所有人员在办理出入证之前是否经过业主的一级HSE教育；',5250)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('8384E6B9-F47C-4C8E-86FC-A1D2649554C0','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','进行工作时是否按规定着装，穿符合工作要求的劳保服装；',5260)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('A137CE85-6F29-48AA-A860-309C3099391C','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','是否存在厂区内违规吸烟行为；',5270)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('95942586-E9E9-4EF2-932C-6BADC43BE92D','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','是否存在厂区内饮酒和吸毒行为；',5280)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('C4708DB3-8B4A-492A-928F-D9353A1E2DE9','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','是否存在厂区内斗殴和赌博行为；',5290)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('153AF25E-FA1B-4FE4-84E7-DAFD7681F00A','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','是否携带、使用武器、管制刀具或用其它物体作为武器；',5300)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('96B8A94F-7546-4F04-9EB3-FCF2C6C731C8','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','施工分包方是否在自己的施工区域和临时设施周围安装围栏和大门，并设置门卫；',5310)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('0ED14A5A-221F-493F-8E42-395C45C80575','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','是否有人在施工现场内过夜，夜间施工是否事先向业主报批；',5320)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('A128C4B0-2900-4028-A6A5-D49D7843E8D8','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','是否存在不服从门卫管理，无理取闹，谩骂和侮辱门卫人员的现象。',5330)
GO


INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('3EC2676A-70EB-400E-BE17-EEBBA0B7E9D7','安全巡检类型*','BaseInfo/HazardRegisterTypes.aspx','BookNext',280,'0','Menu_BaseInfo',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('9DC6A654-B014-48DA-9A33-972FC782D2B3','3EC2676A-70EB-400E-BE17-EEBBA0B7E9D7','增加',1)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('AB4EFF59-5CEA-41CA-AA62-58EA1A4CEF39','3EC2676A-70EB-400E-BE17-EEBBA0B7E9D7','修改',2)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('D9CCA30D-CEAA-4D67-A252-508479C474D5','3EC2676A-70EB-400E-BE17-EEBBA0B7E9D7','删除',3)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('7F9EAADC-69F4-4D97-8E0B-B6DB4919225E','3EC2676A-70EB-400E-BE17-EEBBA0B7E9D7','保存',4)   
GO

INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('60BFBA33-B5C7-4EBF-A4AE-1B820559676D','领导督察类型*','BaseInfo/HazardRegisterTypesSupervision.aspx','StatusBeRightBack',290,'0','Menu_BaseInfo',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('4168B0FC-DE0F-44EB-817B-7C4A9CF0A935','60BFBA33-B5C7-4EBF-A4AE-1B820559676D','增加',1)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('597FE459-20B4-49A5-9BAD-9400DA097804','60BFBA33-B5C7-4EBF-A4AE-1B820559676D','修改',2)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('55375D6F-F54D-48B5-9CCF-E413EADFFB25','60BFBA33-B5C7-4EBF-A4AE-1B820559676D','删除',3)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('189F09F3-8EE4-4D16-A5BD-18A48309300A','60BFBA33-B5C7-4EBF-A4AE-1B820559676D','保存',4)   
GO

INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('015F94F0-F2EB-403F-B8CA-FF44AB9BDA5B','处罚项信息*','BaseInfo/PunishItem.aspx','Vcard',300,'0','Menu_BaseInfo',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('36236A68-5D44-4C0A-9C49-11C3C0975865','015F94F0-F2EB-403F-B8CA-FF44AB9BDA5B','增加',1)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('74E06191-73D1-49C9-8B1E-167DA39FD5A3','015F94F0-F2EB-403F-B8CA-FF44AB9BDA5B','修改',2)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('5C7A5EA3-5F4E-47D5-A983-4CAE54F682D7','015F94F0-F2EB-403F-B8CA-FF44AB9BDA5B','删除',3)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('D77409F9-2900-4013-8FB0-565F79D8E830','015F94F0-F2EB-403F-B8CA-FF44AB9BDA5B','保存',4)   
GO

--APP检查管理
INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('7E7245CF-9820-43A6-AD45-D156601467DD','APP检查管理','','Phone',105,'0','Menu_Project',0,0)
GO

	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('2FC8AA2A-F421-4174-A05E-2711167AF141','日常巡检','HiddenInspection/HiddenRectificationList.aspx','PageHeaderFooter',10,'7E7245CF-9820-43A6-AD45-D156601467DD','Menu_Project',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('E831F780-BDC2-4644-B132-40E27518805E','2FC8AA2A-F421-4174-A05E-2711167AF141','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('9112B8B8-50A0-4592-AE06-2AC24E07E20B','2FC8AA2A-F421-4174-A05E-2711167AF141','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('3FF03C33-A07D-48CF-A0E2-D7A7542FBD69','2FC8AA2A-F421-4174-A05E-2711167AF141','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('55598440-05EF-4E70-86E6-81317BF19D94','2FC8AA2A-F421-4174-A05E-2711167AF141','保存',4)
	GO
	
	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('23855EB9-0BB1-4B3E-BA69-3C0222F5E2A4','日常巡检记录','HiddenInspection/HiddenRectificationRecord.aspx','PageHeaderFooter',20,'7E7245CF-9820-43A6-AD45-D156601467DD','Menu_Project',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('020C87A9-3C0A-4FF1-83F0-4F97015D8F43','23855EB9-0BB1-4B3E-BA69-3C0222F5E2A4','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('B8609CF6-5D2E-4C9C-AF2A-EF4A2AAF265A','23855EB9-0BB1-4B3E-BA69-3C0222F5E2A4','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('9E976E09-D98E-4577-98D5-908CFD142AE6','23855EB9-0BB1-4B3E-BA69-3C0222F5E2A4','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('E1BDC47A-CB50-4210-ACE6-604589BE22F2','23855EB9-0BB1-4B3E-BA69-3C0222F5E2A4','保存',4)
	GO
	
	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('B7A5F84B-843A-4C13-9844-023D8B4A41AC','专项检查','HiddenInspection/CheckSpecial.aspx','PageHeaderFooter',30,'7E7245CF-9820-43A6-AD45-D156601467DD','Menu_Project',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('FFE04B9A-7BAE-4409-ADFA-971954E1BA59','B7A5F84B-843A-4C13-9844-023D8B4A41AC','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('81D6834F-0080-4C80-9A97-FAF9D001E474','B7A5F84B-843A-4C13-9844-023D8B4A41AC','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('52760F7F-08A6-4D2C-94BF-781FFA0DD6BD','B7A5F84B-843A-4C13-9844-023D8B4A41AC','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('28B81B5F-33DF-40EA-866F-0BB1D0422F05','B7A5F84B-843A-4C13-9844-023D8B4A41AC','保存',4)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('1197B868-1152-46E3-9892-0A2C403D4A53','B7A5F84B-843A-4C13-9844-023D8B4A41AC','提交',5)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('00CF924E-70DE-4130-AF7D-58B93E0D3AB7','B7A5F84B-843A-4C13-9844-023D8B4A41AC','审核',6)
	GO
	
	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('247B76AA-01BF-4A40-BB4C-B3EAF441F538','领导督察','HiddenInspection/SafeSupervision.aspx','PageHeaderFooter',40,'7E7245CF-9820-43A6-AD45-D156601467DD','Menu_Project',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('784A73D6-BE99-41CF-97CA-EB123EF00825','247B76AA-01BF-4A40-BB4C-B3EAF441F538','删除',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('5221A77B-1891-40E1-AB7B-6D7EE0D7F633','247B76AA-01BF-4A40-BB4C-B3EAF441F538','保存',2)
	GO
	
	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('D322F726-B4D3-4807-BA5F-3ADF91E1F084','巡检分析(图表)','HiddenInspection/RiskAnalysisChart.aspx','PageHeaderFooter',50,'7E7245CF-9820-43A6-AD45-D156601467DD','Menu_Project',1,0)
	GO
	
	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('D0A9B1CC-493F-4CAC-9EC9-C3A89D1D5DB3','管理人员履职情况','HiddenInspection/ManagerPerformance.aspx','PageHeaderFooter',60,'7E7245CF-9820-43A6-AD45-D156601467DD','Menu_Project',1,0)
	GO

    INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('9959896B-67DB-43C8-B1D2-EDAFDD7F5A27','单位违章统计明细表','HiddenInspection/UnitViolationStatistics.aspx','PageHeaderFooter',70,'7E7245CF-9820-43A6-AD45-D156601467DD','Menu_Project',1,0)
	GO
	
	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('3A6E2DC0-3983-4040-BE13-3A6BDA338FED','违章分类占比统计','HiddenInspection/ViolationClassificationStatistics.aspx','PageHeaderFooter',80,'7E7245CF-9820-43A6-AD45-D156601467DD','Menu_Project',1,0)
	GO
	
	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('36FDA642-5BB9-4C29-AFF2-190397242F0A','分包商占比统计','HiddenInspection/SubUnitRateStatistics.aspx','PageHeaderFooter',90,'7E7245CF-9820-43A6-AD45-D156601467DD','Menu_Project',1,0)
	GO
	
	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('710A1A13-89C2-4DBA-B940-99D1B91E8F3E','违章分类比较图','HiddenInspection/ViolationClassificationComparison.aspx','PageHeaderFooter',100,'7E7245CF-9820-43A6-AD45-D156601467DD','Menu_Project',1,0)
	GO
	
	


/**********隐患巡检（手机端）视图*************/
CREATE VIEW [dbo].[View_Hazard_HazardRegister]
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
	User2.UserName AS CheckManName,
	User3.UserName AS ConfirmManName,
	User4.UserName AS ResponsibilityManName2,
	(CASE Registration.states WHEN '1' THEN '待整改' WHEN '2' THEN '已整改' WHEN '3' THEN '已闭环' ELSE '已作废' END ) AS StatesStr,
	RegisterTypes.RegisterTypesId,
	RegisterTypes.RegisterTypesName,
	CheckItemDetail.CheckContent,  --专项检查项内容
	Registration.DIC_ID
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





CREATE VIEW [dbo].[View_Common_PunishRecord]
AS
SELECT PunishRecord.PunishRecordId,
Person.PersonId,
Person.CardNo,
Person.PersonName,
Person.IdentityCard, 
Person.ProjectId, 
Person.InTime, 
Person.OutTime, 
Person.ProjectCode,
Person.ProjectName,
Person.UnitId,
Person.UnitCode,
Person.UnitName,
Person.TeamGroupName,
Person.WorkPostName as PostName,
PunishItem.PunishItemContent,
PunishItem.Deduction,
PunishItem.PunishMoney,
PunishRecord.PunishReason,
PunishRecord.HazardRegisterId,
PunishRecord.PunishDate
FROM HSSE_Hazard_PunishRecord AS PunishRecord
LEFT JOIN View_SitePerson_Person AS Person ON Person.PersonId=PunishRecord.PersonId
LEFT JOIN HSSE_Hazard_PunishItem AS PunishItem ON PunishItem.PunishItemId=PunishRecord.PunishItemId






GO



CREATE TABLE [dbo].[HSSE_Hazard_HazardRegisterRecord](
	[HazardRegisterRecordId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[HazardRegisterIds] [nvarchar](2000) NULL,
	[CheckDate] [datetime] NULL,
	[CheckPerson] [nvarchar](50) NULL,
	[CheckType] [char](1) NULL,
	[CompileMan] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
 CONSTRAINT [PK_HSSE_Hazard_HazardRegisterRecord] PRIMARY KEY CLUSTERED 
(
	[HazardRegisterRecordId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_HazardRegisterRecord', @level2type=N'COLUMN',@level2name=N'HazardRegisterRecordId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_HazardRegisterRecord', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'明细表Ids' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_HazardRegisterRecord', @level2type=N'COLUMN',@level2name=N'HazardRegisterIds'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'巡检日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_HazardRegisterRecord', @level2type=N'COLUMN',@level2name=N'CheckDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'巡检人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_HazardRegisterRecord', @level2type=N'COLUMN',@level2name=N'CheckPerson'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'检查类型（1-安全，2-质量）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_HazardRegisterRecord', @level2type=N'COLUMN',@level2name=N'CheckType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'隐患巡检记录表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_HazardRegisterRecord'
GO

ALTER TABLE [dbo].[HSSE_Hazard_HazardRegisterRecord]  WITH CHECK ADD  CONSTRAINT [FK_HSSE_Hazard_HazardRegisterRecord_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[HSSE_Hazard_HazardRegisterRecord] CHECK CONSTRAINT [FK_HSSE_Hazard_HazardRegisterRecord_Base_Project]
GO

ALTER TABLE [dbo].[HSSE_Hazard_HazardRegisterRecord]  WITH CHECK ADD  CONSTRAINT [FK_HSSE_Hazard_HazardRegisterRecord_Sys_User] FOREIGN KEY([CheckPerson])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[HSSE_Hazard_HazardRegisterRecord] CHECK CONSTRAINT [FK_HSSE_Hazard_HazardRegisterRecord_Sys_User]
GO



CREATE VIEW [dbo].[HSSE_View_HazardRegisterRecord]
/*手机APP隐患巡检记录列表视图*/
AS
SELECT h.HazardRegisterRecordId,
    h.ProjectId,
	h.HazardRegisterIds,            
	(select convert(varchar(100),h.CheckDate,23)+' '+(select datename(weekday,h.CheckDate))) as Date,
	h.CheckDate,
	user1.UserName as CheckPersonMan,
	h.CheckPerson,
	h.CheckType,
	h.CompileMan,
	h.CompileDate
	,(LEN(HazardRegisterIds)-LEN(REPLACE(HazardRegisterIds,',',''))+1) AS RecordCount
FROM dbo.HSSE_Hazard_HazardRegisterRecord AS h
LEFT JOIN dbo.Sys_User AS user1 ON user1.UserId =h.CheckPerson


GO



CREATE TABLE [dbo].[HSSE_Hazard_CheckSpecial](
	[CheckSpecialId] [nvarchar](50) NOT NULL,
	[CheckSpecialCode] [nvarchar](50) NULL,
	[ProjectId] [nvarchar](50) NULL,
	[UnitId] [nvarchar](50) NULL,
	[Date] [datetime] NULL,
	[CheckMan] [nvarchar](500) NULL,
	[JointCheckMan] [nvarchar](500) NULL,
	[States] [char](1) NULL,
	[IsReceived] [bit] NULL,
 CONSTRAINT [PK_HSSE_Hazard_CheckSpecial] PRIMARY KEY CLUSTERED 
(
	[CheckSpecialId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_CheckSpecial', @level2type=N'COLUMN',@level2name=N'CheckSpecialId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_CheckSpecial', @level2type=N'COLUMN',@level2name=N'CheckSpecialCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_CheckSpecial', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'受检单位' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_CheckSpecial', @level2type=N'COLUMN',@level2name=N'UnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_CheckSpecial', @level2type=N'COLUMN',@level2name=N'Date'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'检查人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_CheckSpecial', @level2type=N'COLUMN',@level2name=N'CheckMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'陪检人员' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_CheckSpecial', @level2type=N'COLUMN',@level2name=N'JointCheckMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态（0-重新编制，1-编制，2-办理中，3-审批完成）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_CheckSpecial', @level2type=N'COLUMN',@level2name=N'States'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'施工单位是否已接收（true-是，false-否）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_CheckSpecial', @level2type=N'COLUMN',@level2name=N'IsReceived'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'APP专项检查表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_CheckSpecial'
GO

ALTER TABLE [dbo].[HSSE_Hazard_CheckSpecial]  WITH CHECK ADD  CONSTRAINT [FK_HSSE_Hazard_CheckSpecial_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[HSSE_Hazard_CheckSpecial] CHECK CONSTRAINT [FK_HSSE_Hazard_CheckSpecial_Base_Project]
GO

ALTER TABLE [dbo].[HSSE_Hazard_CheckSpecial]  WITH CHECK ADD  CONSTRAINT [FK_HSSE_Hazard_CheckSpecial_Base_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[HSSE_Hazard_CheckSpecial] CHECK CONSTRAINT [FK_HSSE_Hazard_CheckSpecial_Base_Unit]
GO



CREATE TABLE [dbo].[HSSE_Hazard_CheckSpecialAudit](
	[CheckSpecialAuditId] [nvarchar](50) NOT NULL,
	[CheckSpecialId] [nvarchar](50) NULL,
	[AuditMan] [nvarchar](50) NULL,
	[AuditDate] [datetime] NULL,
	[AuditStep] [char](1) NULL,
 CONSTRAINT [PK_HSSE_Hazard_CheckSpecialAudit] PRIMARY KEY CLUSTERED 
(
	[CheckSpecialAuditId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_CheckSpecialAudit', @level2type=N'COLUMN',@level2name=N'CheckSpecialAuditId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主表Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_CheckSpecialAudit', @level2type=N'COLUMN',@level2name=N'CheckSpecialId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'办理人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_CheckSpecialAudit', @level2type=N'COLUMN',@level2name=N'AuditMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'办理日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_CheckSpecialAudit', @level2type=N'COLUMN',@level2name=N'AuditDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'办理步骤（0-重新编制，1-编制，2-办理中，3-审批完成）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_CheckSpecialAudit', @level2type=N'COLUMN',@level2name=N'AuditStep'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'APP专项检查审批表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_CheckSpecialAudit'
GO

ALTER TABLE [dbo].[HSSE_Hazard_CheckSpecialAudit]  WITH CHECK ADD  CONSTRAINT [FK_HSSE_Hazard_CheckSpecialAudit_HSSE_Hazard_CheckSpecial] FOREIGN KEY([CheckSpecialId])
REFERENCES [dbo].[HSSE_Hazard_CheckSpecial] ([CheckSpecialId])
GO

ALTER TABLE [dbo].[HSSE_Hazard_CheckSpecialAudit] CHECK CONSTRAINT [FK_HSSE_Hazard_CheckSpecialAudit_HSSE_Hazard_CheckSpecial]
GO

ALTER TABLE [dbo].[HSSE_Hazard_CheckSpecialAudit]  WITH CHECK ADD  CONSTRAINT [FK_HSSE_Hazard_CheckSpecialAudit_Sys_User] FOREIGN KEY([AuditMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[HSSE_Hazard_CheckSpecialAudit] CHECK CONSTRAINT [FK_HSSE_Hazard_CheckSpecialAudit_Sys_User]
GO



CREATE VIEW [dbo].[View_Hazard_CheckSpecial]
/*安全施工方案列表视图*/
AS
SELECT 
    c.CheckSpecialId,
    c.CheckSpecialCode,
	c.ProjectId,
    c.UnitId,
    c.Date,                      
    c.CheckMan,
	c.JointCheckMan,
	c.States,
	c.IsReceived,
	unit.UnitName,
	user2.UserName as AuditManName,
	case c.States when '0' then '重报中'
	             when '1' then '编制中'
	             when '2' then '办理中'
	             else '审批完成' end as StateStr
FROM dbo.HSSE_Hazard_CheckSpecial AS c
LEFT JOIN dbo.Base_Unit AS unit ON unit.UnitId =c.UnitId
LEFT JOIN dbo.Sys_User AS user2 ON  user2.UserId =(select AuditMan from dbo.HSSE_Hazard_CheckSpecialAudit ca 
where ca.CheckSpecialId=c.CheckSpecialId and ca.AuditDate is null)


GO





CREATE VIEW [dbo].[View_Hazard_SafeSupervision]
/*安全施工方案列表视图*/
AS
SELECT 
    c.SafeSupervisionId,
    c.SafeSupervisionCode,
    c.ProjectId,
    c.CheckType,
    case c.CheckType when '1' then '公司领导班子'
                     when '2' then '职能管理部门领导'
                     when '3' then '业务单位领导班子'
                     when '4' then '业务单位部门领导'
                     else '' end as CheckTypeStr,
	c.CheckManId,
    CONVERT(varchar(100), c.CheckDate, 23) as CheckDate,                   
    user1.UserName as CheckMan,
	project.ProjectName
FROM dbo.HSSE_Hazard_SafeSupervision AS c
LEFT JOIN dbo.Base_Project AS project ON project.ProjectId =c.ProjectId
LEFT JOIN dbo.Sys_User AS user1 ON  user1.UserId =c.CheckManId




GO




CREATE PROCEDURE [dbo].[SpGetSysQueryResult]
@projectId nvarchar(100),	--施工项目Id
@queryFlag int,	--查询操作标志
@queryPk nvarchar(100),	--查询操作主键
@queryNo nvarchar(100)	--查询操作参数值
AS
BEGIN

 DECLARE @sqlCommand AS NVARCHAR(4000)
 SELECT @sqlCommand =  QuerySql  FROM Sys_Query WHERE QueryId = @queryPk
 SET @sqlCommand =  ' DECLARE @query_No nvarchar(100) ' + ' SET @query_No ='''+@queryNo+''' ' 
                   +' DECLARE @project_Id nvarchar(100) ' + ' SET @project_Id ='''+@projectId+''' ' 
				   + @sqlCommand
 PRINT @sqlCommand
 EXEC (@sqlCommand)
 END  
 









GO




CREATE PROCEDURE [dbo].[HSSE_SpEnableCueQualityDesktop]
    @projectId nvarchar(50)
AS
BEGIN
(select pq.PersonQualityId as QualityId, '证书编号：' + pq.CertificateNo + '，(特殊岗位人员资质：姓名：' + p.PersonName + ')' +  
'，还有' + convert(nvarchar(6),DATEDIFF(day,getdate(),dateadd(YEAR,EnableYear,SendDate))) + '天到期' as QualityDec , 'person' as QualityType
from dbo.HSSE_QualityAudit_PersonQuality pq
left join dbo.Base_Person p on p.PersonId=pq.PersonId
where p.ProjectId=@projectId and dateadd(month,-1,dateadd(YEAR,EnableYear,SendDate))<=getdate() and getdate()<dateadd(YEAR,EnableYear,SendDate)
and LateCheckDate is null and IsSee is null) 
UNION
(select pq.PersonQualityId as QualityId, '证书编号：' + pq.CertificateNo + '，(特殊岗位人员资质：姓名：' + p.PersonName + ')' +  
'，还有' + convert(nvarchar(6),DATEDIFF(day,getdate(),dateadd(YEAR,EnableYear,LateCheckDate))) + '天到期' as QualityDec , 'person' as QualityType
from dbo.HSSE_QualityAudit_PersonQuality pq
left join dbo.Base_Person p on p.PersonId=pq.PersonId
where p.ProjectId=@projectId and dateadd(month,-1,dateadd(YEAR,EnableYear,LateCheckDate))<=getdate() and getdate()<dateadd(YEAR,EnableYear,LateCheckDate)
and LateCheckDate is not null  and IsSee is null )
UNION
(select pq.PersonQualityId as QualityId, '证书编号：' + pq.CertificateNo + '，(特殊岗位人员资质：姓名：' + p.PersonName + ')' +  
'，已过期' + convert(nvarchar(6),DATEDIFF(day,dateadd(YEAR,EnableYear,SendDate),getdate())) + '天' as QualityDec  , 'person' as QualityType
from dbo.HSSE_QualityAudit_PersonQuality pq
left join dbo.Base_Person p on p.PersonId=pq.PersonId
where p.ProjectId=@projectId and dateadd(month,-1,dateadd(YEAR,EnableYear,SendDate))<=getdate() and getdate()>=dateadd(YEAR,EnableYear,SendDate)
and LateCheckDate is null and IsSee is null)
UNION
(select pq.PersonQualityId as QualityId, '证书编号：' + pq.CertificateNo + '，(特殊岗位人员资质：姓名：' + p.PersonName + ')' +  
'，已过期' + convert(nvarchar(6),DATEDIFF(day,dateadd(YEAR,EnableYear,LateCheckDate),getdate())) + '天' as QualityDec  , 'person' as QualityType
from dbo.HSSE_QualityAudit_PersonQuality pq
left join dbo.Base_Person p on p.PersonId=pq.PersonId
where p.ProjectId=@projectId and dateadd(month,-1,dateadd(YEAR,EnableYear,LateCheckDate))<=getdate() and getdate()>=dateadd(YEAR,EnableYear,LateCheckDate)
and LateCheckDate is not null and IsSee is null)
UNION
(select eq.EquipmentQualityCode as QualityId, '合格证编号：' + eq.CertificateCode + '，(特殊机具设备资质：设备名称：' + eq.EquipmentName + ')' + 
'，还有' + convert(nvarchar(6),DATEDIFF(day,getdate(),dateadd(YEAR,EnableYear,ProvidedDate))) + '天到期' as QualityDec , 'equipment' as QualityType
from dbo.HSSE_QualityAudit_EquipmentQuality eq
left join dbo.HSSE_Base_Equipment e on e.EquipmentId=eq.SpecialEquipmentType
where eq.ProjectId=@projectId and dateadd(month,-1,dateadd(YEAR,EnableYear,ProvidedDate))<=getdate() and getdate()<dateadd(YEAR,EnableYear,ProvidedDate) and IsSee is null and AprovalState='1')
UNION
(select eq.EquipmentQualityCode as QualityId, '合格证编号：' + eq.CertificateCode + '，(特殊机具设备资质：设备名称：' + eq.EquipmentName + ')' + 
'，已过期' + convert(nvarchar(6),DATEDIFF(day,dateadd(YEAR,EnableYear,ProvidedDate),getdate())) + '天' as QualityDec , 'equipment' as QualityType
from dbo.HSSE_QualityAudit_EquipmentQuality eq
left join dbo.HSSE_Base_Equipment e on e.EquipmentId=eq.SpecialEquipmentType
where eq.ProjectId=@projectId and dateadd(month,-1,dateadd(YEAR,EnableYear,ProvidedDate))<=getdate() and getdate()>=dateadd(YEAR,EnableYear,ProvidedDate) and isSee is null and AprovalState='1')
END

GO



CREATE TABLE [dbo].[Training_TestTraining](
	[TrainingId] [nvarchar](50) NOT NULL,
	[TrainingCode] [nvarchar](50) NULL,
	[TrainingName] [nvarchar](100) NULL,
	[SupTrainingId] [nvarchar](50) NULL,
	[IsEndLever] [bit] NULL,
 CONSTRAINT [PK_Training_TestTraining] PRIMARY KEY CLUSTERED 
(
	[TrainingId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'教育培训id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestTraining', @level2type=N'COLUMN',@level2name=N'TrainingId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'教育培训资源编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestTraining', @level2type=N'COLUMN',@level2name=N'TrainingCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'教育培训名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestTraining', @level2type=N'COLUMN',@level2name=N'TrainingName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否末级' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestTraining', @level2type=N'COLUMN',@level2name=N'IsEndLever'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'教育培训资源' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestTraining'
GO




CREATE TABLE [dbo].[Training_TestTrainingItem](
	[TrainingItemId] [nvarchar](50) NOT NULL,
	[TrainingId] [nvarchar](50) NULL,
	[TrainingItemCode] [nvarchar](50) NULL,
	[TrainingItemName] [nvarchar](100) NULL,
	[Abstracts] [nvarchar](2000) NULL,
	[AttachUrl] [nvarchar](2000) NULL,
	[VersionNum] [nvarchar](50) NULL,
	[TestType] [char](1) NULL,
	[WorkPostIds] [nvarchar](max) NULL,
	[WorkPostNames] [nvarchar](max) NULL,
	[AItem] [nvarchar](500) NULL,
	[BItem] [nvarchar](500) NULL,
	[CItem] [nvarchar](500) NULL,
	[DItem] [nvarchar](500) NULL,
	[EItem] [nvarchar](500) NULL,
	[Score] [int] NULL,
	[AnswerItems] [nvarchar](50) NULL,
 CONSTRAINT [PK_Training_TestTrainingItem] PRIMARY KEY CLUSTERED 
(
	[TrainingItemId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'教育培训明细id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestTrainingItem', @level2type=N'COLUMN',@level2name=N'TrainingItemId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'教育培训主键id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestTrainingItem', @level2type=N'COLUMN',@level2name=N'TrainingId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'明细编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestTrainingItem', @level2type=N'COLUMN',@level2name=N'TrainingItemCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'明细名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestTrainingItem', @level2type=N'COLUMN',@level2name=N'TrainingItemName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'摘要' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestTrainingItem', @level2type=N'COLUMN',@level2name=N'Abstracts'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'附件' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestTrainingItem', @level2type=N'COLUMN',@level2name=N'AttachUrl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'版本' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestTrainingItem', @level2type=N'COLUMN',@level2name=N'VersionNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'题型（1-单选；2-多选；3-判断题）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestTrainingItem', @level2type=N'COLUMN',@level2name=N'TestType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'适合岗位ID(多岗位)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestTrainingItem', @level2type=N'COLUMN',@level2name=N'WorkPostIds'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'适合岗位ID(多岗位)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestTrainingItem', @level2type=N'COLUMN',@level2name=N'WorkPostNames'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'答案项A' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestTrainingItem', @level2type=N'COLUMN',@level2name=N'AItem'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'答案项B' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestTrainingItem', @level2type=N'COLUMN',@level2name=N'BItem'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'答案项C' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestTrainingItem', @level2type=N'COLUMN',@level2name=N'CItem'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'答案项D' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestTrainingItem', @level2type=N'COLUMN',@level2name=N'DItem'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'答案项E' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestTrainingItem', @level2type=N'COLUMN',@level2name=N'EItem'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestTrainingItem', @level2type=N'COLUMN',@level2name=N'Score'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'正确答案项' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestTrainingItem', @level2type=N'COLUMN',@level2name=N'AnswerItems'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'培训资源明细表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestTrainingItem'
GO

ALTER TABLE [dbo].[Training_TestTrainingItem]  WITH CHECK ADD  CONSTRAINT [FK_Training_TestTrainingItem_Training_TestTraining] FOREIGN KEY([TrainingId])
REFERENCES [dbo].[Training_TestTraining] ([TrainingId])
GO

ALTER TABLE [dbo].[Training_TestTrainingItem] CHECK CONSTRAINT [FK_Training_TestTrainingItem_Training_TestTraining]
GO

ALTER TABLE [dbo].[Training_TestTrainingItem]  WITH CHECK ADD  CONSTRAINT [FK_Training_TestTrainingItem_Training_TestTraining1] FOREIGN KEY([TrainingId])
REFERENCES [dbo].[Training_TestTraining] ([TrainingId])
GO

ALTER TABLE [dbo].[Training_TestTrainingItem] CHECK CONSTRAINT [FK_Training_TestTrainingItem_Training_TestTraining1]
GO





CREATE TABLE [dbo].[Training_ModelTestRecord](
	[ModelTestRecordId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[TestManId] [nvarchar](50) NULL,
	[TestStartTime] [datetime] NULL,
	[TestEndTime] [datetime] NULL,
	[TestScores] [decimal](18, 1) NULL,
	[TrainingId] [nvarchar](50) NULL,
 CONSTRAINT [PK_Training_ModelTestRecord] PRIMARY KEY CLUSTERED 
(
	[ModelTestRecordId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'考试记录主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_ModelTestRecord', @level2type=N'COLUMN',@level2name=N'ModelTestRecordId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_ModelTestRecord', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'考生id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_ModelTestRecord', @level2type=N'COLUMN',@level2name=N'TestManId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'考试开始时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_ModelTestRecord', @level2type=N'COLUMN',@level2name=N'TestStartTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'考试结束时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_ModelTestRecord', @level2type=N'COLUMN',@level2name=N'TestEndTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'考试成绩' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_ModelTestRecord', @level2type=N'COLUMN',@level2name=N'TestScores'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'考试题型id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_ModelTestRecord', @level2type=N'COLUMN',@level2name=N'TrainingId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'模拟考试记录表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_ModelTestRecord'
GO

ALTER TABLE [dbo].[Training_ModelTestRecord]  WITH CHECK ADD  CONSTRAINT [FK_Training_ModelTestRecord_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[Training_ModelTestRecord] CHECK CONSTRAINT [FK_Training_ModelTestRecord_Base_Project]
GO

ALTER TABLE [dbo].[Training_ModelTestRecord]  WITH CHECK ADD  CONSTRAINT [FK_Training_ModelTestRecord_SitePerson_Person] FOREIGN KEY([TestManId])
REFERENCES [dbo].[SitePerson_Person] ([PersonId])
GO

ALTER TABLE [dbo].[Training_ModelTestRecord] CHECK CONSTRAINT [FK_Training_ModelTestRecord_SitePerson_Person]
GO

ALTER TABLE [dbo].[Training_ModelTestRecord]  WITH CHECK ADD  CONSTRAINT [FK_Training_ModelTestRecord_Training_TestTraining] FOREIGN KEY([TrainingId])
REFERENCES [dbo].[Training_TestTraining] ([TrainingId])
GO

ALTER TABLE [dbo].[Training_ModelTestRecord] CHECK CONSTRAINT [FK_Training_ModelTestRecord_Training_TestTraining]
GO






CREATE TABLE [dbo].[Training_ModelTestRecordItem](
	[ModelTestRecordItemId] [nvarchar](50) NOT NULL,
	[ModelTestRecordId] [nvarchar](50) NULL,
	[TrainingItemName] [nvarchar](100) NULL,
	[Abstracts] [nvarchar](2000) NULL,
	[AttachUrl] [nvarchar](2000) NULL,
	[TestType] [char](1) NULL,
	[AItem] [nvarchar](500) NULL,
	[BItem] [nvarchar](500) NULL,
	[CItem] [nvarchar](500) NULL,
	[DItem] [nvarchar](500) NULL,
	[EItem] [nvarchar](500) NULL,
	[AnswerItems] [nvarchar](50) NULL,
	[Score] [int] NULL,
	[SubjectScore] [decimal](18, 1) NULL,
	[SelectedItem] [nvarchar](50) NULL,
 CONSTRAINT [PK_Training_ModelTestRecordItem] PRIMARY KEY CLUSTERED 
(
	[ModelTestRecordItemId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'考试记录明细主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_ModelTestRecordItem', @level2type=N'COLUMN',@level2name=N'ModelTestRecordItemId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'考试记录主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_ModelTestRecordItem', @level2type=N'COLUMN',@level2name=N'ModelTestRecordId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'题目名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_ModelTestRecordItem', @level2type=N'COLUMN',@level2name=N'TrainingItemName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'题目内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_ModelTestRecordItem', @level2type=N'COLUMN',@level2name=N'Abstracts'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'题目附件' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_ModelTestRecordItem', @level2type=N'COLUMN',@level2name=N'AttachUrl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'题型（1-单选；2-多选；3-判断题）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_ModelTestRecordItem', @level2type=N'COLUMN',@level2name=N'TestType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'答案项A' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_ModelTestRecordItem', @level2type=N'COLUMN',@level2name=N'AItem'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'答案项B' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_ModelTestRecordItem', @level2type=N'COLUMN',@level2name=N'BItem'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'答案项C' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_ModelTestRecordItem', @level2type=N'COLUMN',@level2name=N'CItem'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'答案项D' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_ModelTestRecordItem', @level2type=N'COLUMN',@level2name=N'DItem'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'答案项E' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_ModelTestRecordItem', @level2type=N'COLUMN',@level2name=N'EItem'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'正确答案项' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_ModelTestRecordItem', @level2type=N'COLUMN',@level2name=N'AnswerItems'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'题目分值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_ModelTestRecordItem', @level2type=N'COLUMN',@level2name=N'Score'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'题目得分' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_ModelTestRecordItem', @level2type=N'COLUMN',@level2name=N'SubjectScore'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'回答项' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_ModelTestRecordItem', @level2type=N'COLUMN',@level2name=N'SelectedItem'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'考试记录明细表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_ModelTestRecordItem'
GO

ALTER TABLE [dbo].[Training_ModelTestRecordItem]  WITH CHECK ADD  CONSTRAINT [FK_Training_ModelTestRecordItem_Training_ModelTestRecord] FOREIGN KEY([ModelTestRecordId])
REFERENCES [dbo].[Training_ModelTestRecord] ([ModelTestRecordId])
GO

ALTER TABLE [dbo].[Training_ModelTestRecordItem] CHECK CONSTRAINT [FK_Training_ModelTestRecordItem_Training_ModelTestRecord]
GO



CREATE TABLE [dbo].[Training_Plan](
	[PlanId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[PlanCode] [nvarchar](50) NULL,
	[DesignerId] [nvarchar](50) NULL,
	[DesignerDate] [datetime] NULL,
	[WorkPostId] [nvarchar](2000) NULL,
	[States] [varchar](2) NULL,
	[PlanName] [nvarchar](300) NULL,
	[WorkPostNames] [nvarchar](2000) NULL,
 CONSTRAINT [PK_Training_Plan] PRIMARY KEY CLUSTERED 
(
	[PlanId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_Plan', @level2type=N'COLUMN',@level2name=N'PlanId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_Plan', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'计划编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_Plan', @level2type=N'COLUMN',@level2name=N'PlanCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'计划制定人id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_Plan', @level2type=N'COLUMN',@level2name=N'DesignerId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'计划制定日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_Plan', @level2type=N'COLUMN',@level2name=N'DesignerDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'岗位id集合（逗号隔开） ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_Plan', @level2type=N'COLUMN',@level2name=N'WorkPostId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'计划状态（0-待提交；1-已提交；2-已推送；-1-已作废）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_Plan', @level2type=N'COLUMN',@level2name=N'States'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'计划名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_Plan', @level2type=N'COLUMN',@level2name=N'PlanName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'岗位名称集合（逗号隔开） ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_Plan', @level2type=N'COLUMN',@level2name=N'WorkPostNames'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'培训计划表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_Plan'
GO

ALTER TABLE [dbo].[Training_Plan]  WITH CHECK ADD  CONSTRAINT [FK_Training_Plan_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[Training_Plan] CHECK CONSTRAINT [FK_Training_Plan_Base_Project]
GO

ALTER TABLE [dbo].[Training_Plan]  WITH CHECK ADD  CONSTRAINT [FK_Training_Plan_Sys_User] FOREIGN KEY([DesignerId])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[Training_Plan] CHECK CONSTRAINT [FK_Training_Plan_Sys_User]
GO



CREATE TABLE [dbo].[Training_PlanItem](
	[PlanItemId] [nvarchar](50) NOT NULL,
	[PlanId] [nvarchar](50) NULL,
	[TrainingEduId] [nvarchar](50) NULL,
	[TrainingEduItemId] [nvarchar](50) NULL,
 CONSTRAINT [PK_Training_PlanItem] PRIMARY KEY CLUSTERED 
(
	[PlanItemId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'明细表id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_PlanItem', @level2type=N'COLUMN',@level2name=N'PlanItemId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主表id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_PlanItem', @level2type=N'COLUMN',@level2name=N'PlanId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'培训教材库id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_PlanItem', @level2type=N'COLUMN',@level2name=N'TrainingEduId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'培训教材明细id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_PlanItem', @level2type=N'COLUMN',@level2name=N'TrainingEduItemId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'培训计划明细表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_PlanItem'
GO

ALTER TABLE [dbo].[Training_PlanItem]  WITH CHECK ADD  CONSTRAINT [FK_Training_PlanItem_Training_Plan] FOREIGN KEY([PlanId])
REFERENCES [dbo].[Training_Plan] ([PlanId])
GO

ALTER TABLE [dbo].[Training_PlanItem] CHECK CONSTRAINT [FK_Training_PlanItem_Training_Plan]
GO

ALTER TABLE [dbo].[Training_PlanItem]  WITH CHECK ADD  CONSTRAINT [FK_Training_PlanItem_Training_Training] FOREIGN KEY([TrainingEduId])
REFERENCES [dbo].[Training_Training] ([TrainingId])
GO

ALTER TABLE [dbo].[Training_PlanItem] CHECK CONSTRAINT [FK_Training_PlanItem_Training_Training]
GO

ALTER TABLE [dbo].[Training_PlanItem]  WITH CHECK ADD  CONSTRAINT [FK_Training_PlanItem_Training_TrainingItem] FOREIGN KEY([TrainingEduItemId])
REFERENCES [dbo].[Training_TrainingItem] ([TrainingItemId])
GO

ALTER TABLE [dbo].[Training_PlanItem] CHECK CONSTRAINT [FK_Training_PlanItem_Training_TrainingItem]
GO



CREATE TABLE [dbo].[Training_Task](
	[TaskId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[PlanId] [nvarchar](50) NULL,
	[UserId] [nvarchar](50) NULL,
	[TaskDate] [datetime] NULL,
	[States] [varchar](2) NULL,
 CONSTRAINT [PK_Training_Task] PRIMARY KEY CLUSTERED 
(
	[TaskId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'培训任务id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_Task', @level2type=N'COLUMN',@level2name=N'TaskId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_Task', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'计划单id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_Task', @level2type=N'COLUMN',@level2name=N'PlanId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'人员id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_Task', @level2type=N'COLUMN',@level2name=N'UserId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'任务日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_Task', @level2type=N'COLUMN',@level2name=N'TaskDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'任务状态（0-未响应；1-已响应；2-已完成）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_Task', @level2type=N'COLUMN',@level2name=N'States'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'培训任务表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_Task'
GO

ALTER TABLE [dbo].[Training_Task]  WITH CHECK ADD  CONSTRAINT [FK_Training_Task_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[Training_Task] CHECK CONSTRAINT [FK_Training_Task_Base_Project]
GO

ALTER TABLE [dbo].[Training_Task]  WITH CHECK ADD  CONSTRAINT [FK_Training_Task_SitePerson_Person] FOREIGN KEY([UserId])
REFERENCES [dbo].[SitePerson_Person] ([PersonId])
GO

ALTER TABLE [dbo].[Training_Task] CHECK CONSTRAINT [FK_Training_Task_SitePerson_Person]
GO

ALTER TABLE [dbo].[Training_Task]  WITH CHECK ADD  CONSTRAINT [FK_Training_Task_Training_Plan] FOREIGN KEY([PlanId])
REFERENCES [dbo].[Training_Plan] ([PlanId])
GO

ALTER TABLE [dbo].[Training_Task] CHECK CONSTRAINT [FK_Training_Task_Training_Plan]
GO




CREATE TABLE [dbo].[Training_TestPlan](
	[TestPlanId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[PlanCode] [nvarchar](50) NULL,
	[PlanManId] [nvarchar](50) NULL,
	[PlanDate] [datetime] NULL,
	[TestStartTime] [datetime] NULL,
	[Duration] [int] NULL,
	[TotalScore] [int] NULL,
	[QuestionCount] [int] NULL,
	[TestPalce] [nvarchar](500) NULL,
	[UnitIds] [nvarchar](max) NULL,
	[UnitNames] [nvarchar](max) NULL,
	[DepartIds] [nvarchar](max) NULL,
	[DepartNames] [nvarchar](max) NULL,
	[WorkPostIds] [nvarchar](max) NULL,
	[WorkPostNames] [nvarchar](max) NULL,
	[QRCodeUrl] [nvarchar](2000) NULL,
	[States] [varchar](2) NULL,
	[PlanName] [nvarchar](300) NULL,
	[TestEndTime] [datetime] NULL,
 CONSTRAINT [PK_Training_TestPlan] PRIMARY KEY CLUSTERED 
(
	[TestPlanId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'考试计划主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestPlan', @level2type=N'COLUMN',@level2name=N'TestPlanId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestPlan', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestPlan', @level2type=N'COLUMN',@level2name=N'PlanCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'计划制定人id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestPlan', @level2type=N'COLUMN',@level2name=N'PlanManId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'计划制定时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestPlan', @level2type=N'COLUMN',@level2name=N'PlanDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'计划考试开始时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestPlan', @level2type=N'COLUMN',@level2name=N'TestStartTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'考试时长（单位：分钟）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestPlan', @level2type=N'COLUMN',@level2name=N'Duration'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'总分值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestPlan', @level2type=N'COLUMN',@level2name=N'TotalScore'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'题目数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestPlan', @level2type=N'COLUMN',@level2name=N'QuestionCount'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'考试地点' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestPlan', @level2type=N'COLUMN',@level2name=N'TestPalce'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'考试单位ids' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestPlan', @level2type=N'COLUMN',@level2name=N'UnitIds'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'考试单位名称s' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestPlan', @level2type=N'COLUMN',@level2name=N'UnitNames'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'考试部门ids' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestPlan', @level2type=N'COLUMN',@level2name=N'DepartIds'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'考试部门名称s' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestPlan', @level2type=N'COLUMN',@level2name=N'DepartNames'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'考生岗位ids' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestPlan', @level2type=N'COLUMN',@level2name=N'WorkPostIds'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'考生岗位名称s' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestPlan', @level2type=N'COLUMN',@level2name=N'WorkPostNames'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'二维码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestPlan', @level2type=N'COLUMN',@level2name=N'QRCodeUrl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'考试计划状态（0-待提交；1-已发布未考试；2-考试中；3考试结束；-1作废）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestPlan', @level2type=N'COLUMN',@level2name=N'States'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'计划名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestPlan', @level2type=N'COLUMN',@level2name=N'PlanName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'计划考试扫描结束时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestPlan', @level2type=N'COLUMN',@level2name=N'TestEndTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'考试计划表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestPlan'
GO

ALTER TABLE [dbo].[Training_TestPlan]  WITH CHECK ADD  CONSTRAINT [FK_Training_TestPlan_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[Training_TestPlan] CHECK CONSTRAINT [FK_Training_TestPlan_Base_Project]
GO

ALTER TABLE [dbo].[Training_TestPlan]  WITH CHECK ADD  CONSTRAINT [FK_Training_TestPlan_Sys_User] FOREIGN KEY([PlanManId])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[Training_TestPlan] CHECK CONSTRAINT [FK_Training_TestPlan_Sys_User]
GO



CREATE TABLE [dbo].[Training_TestPlanTraining](
	[TestPlanTrainingId] [nvarchar](50) NOT NULL,
	[TestPlanId] [nvarchar](50) NULL,
	[TrainingId] [nvarchar](50) NULL,
	[TestType1Count] [int] NULL,
	[TestType2Count] [int] NULL,
	[TestType3Count] [int] NULL,
 CONSTRAINT [PK_Training_TestPlanTraining] PRIMARY KEY CLUSTERED 
(
	[TestPlanTrainingId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'考试计划考题类型所占表主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestPlanTraining', @level2type=N'COLUMN',@level2name=N'TestPlanTrainingId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'考试计划id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestPlanTraining', @level2type=N'COLUMN',@level2name=N'TestPlanId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'考题类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestPlanTraining', @level2type=N'COLUMN',@level2name=N'TrainingId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单选题数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestPlanTraining', @level2type=N'COLUMN',@level2name=N'TestType1Count'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'多选题数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestPlanTraining', @level2type=N'COLUMN',@level2name=N'TestType2Count'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'判断题数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestPlanTraining', @level2type=N'COLUMN',@level2name=N'TestType3Count'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'考试类型所占数量表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestPlanTraining'
GO

ALTER TABLE [dbo].[Training_TestPlanTraining]  WITH CHECK ADD  CONSTRAINT [FK_Training_TestPlanTraining_Training_TestPlan] FOREIGN KEY([TestPlanId])
REFERENCES [dbo].[Training_TestPlan] ([TestPlanId])
GO

ALTER TABLE [dbo].[Training_TestPlanTraining] CHECK CONSTRAINT [FK_Training_TestPlanTraining_Training_TestPlan]
GO

ALTER TABLE [dbo].[Training_TestPlanTraining]  WITH CHECK ADD  CONSTRAINT [FK_Training_TestPlanTraining_Training_TestTraining] FOREIGN KEY([TrainingId])
REFERENCES [dbo].[Training_TestTraining] ([TrainingId])
GO

ALTER TABLE [dbo].[Training_TestPlanTraining] CHECK CONSTRAINT [FK_Training_TestPlanTraining_Training_TestTraining]
GO



CREATE TABLE [dbo].[Training_TestRecord](
	[TestRecordId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[TestPlanId] [nvarchar](50) NULL,
	[TestManId] [nvarchar](50) NULL,
	[TestStartTime] [datetime] NULL,
	[TestEndTime] [datetime] NULL,
	[TestScores] [decimal](18, 1) NULL,
	[TestType] [nvarchar](50) NULL,
	[TemporaryUser] [nvarchar](50) NULL,
	[isFiled] [bit] NULL,
 CONSTRAINT [PK_Training_TestRecord] PRIMARY KEY CLUSTERED 
(
	[TestRecordId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'考试记录主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestRecord', @level2type=N'COLUMN',@level2name=N'TestRecordId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestRecord', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'考试计划表id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestRecord', @level2type=N'COLUMN',@level2name=N'TestPlanId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'考生id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestRecord', @level2type=N'COLUMN',@level2name=N'TestManId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'考试开始时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestRecord', @level2type=N'COLUMN',@level2name=N'TestStartTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'考试结束时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestRecord', @level2type=N'COLUMN',@level2name=N'TestEndTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'考试成绩' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestRecord', @level2type=N'COLUMN',@level2name=N'TestScores'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'临时考生信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestRecord', @level2type=N'COLUMN',@level2name=N'TemporaryUser'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否归档' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestRecord', @level2type=N'COLUMN',@level2name=N'isFiled'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'考试记录表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestRecord'
GO

ALTER TABLE [dbo].[Training_TestRecord]  WITH CHECK ADD  CONSTRAINT [FK_Training_TestRecord_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[Training_TestRecord] CHECK CONSTRAINT [FK_Training_TestRecord_Base_Project]
GO

ALTER TABLE [dbo].[Training_TestRecord]  WITH CHECK ADD  CONSTRAINT [FK_Training_TestRecord_SitePerson_Person] FOREIGN KEY([TestManId])
REFERENCES [dbo].[SitePerson_Person] ([PersonId])
GO

ALTER TABLE [dbo].[Training_TestRecord] CHECK CONSTRAINT [FK_Training_TestRecord_SitePerson_Person]
GO

ALTER TABLE [dbo].[Training_TestRecord]  WITH CHECK ADD  CONSTRAINT [FK_Training_TestRecord_Training_TestPlan] FOREIGN KEY([TestPlanId])
REFERENCES [dbo].[Training_TestPlan] ([TestPlanId])
GO

ALTER TABLE [dbo].[Training_TestRecord] CHECK CONSTRAINT [FK_Training_TestRecord_Training_TestPlan]
GO



CREATE TABLE [dbo].[Training_TestRecordItem](
	[TestRecordItemId] [nvarchar](50) NOT NULL,
	[TestRecordId] [nvarchar](50) NULL,
	[TrainingItemName] [nvarchar](100) NULL,
	[Abstracts] [nvarchar](2000) NULL,
	[AttachUrl] [nvarchar](2000) NULL,
	[TestType] [char](1) NULL,
	[AItem] [nvarchar](500) NULL,
	[BItem] [nvarchar](500) NULL,
	[CItem] [nvarchar](500) NULL,
	[DItem] [nvarchar](500) NULL,
	[EItem] [nvarchar](500) NULL,
	[AnswerItems] [nvarchar](50) NULL,
	[Score] [int] NULL,
	[SubjectScore] [decimal](18, 1) NULL,
	[SelectedItem] [nvarchar](50) NULL,
	[TrainingItemCode] [nvarchar](50) NULL,
 CONSTRAINT [PK_Training_TestRecordItem] PRIMARY KEY CLUSTERED 
(
	[TestRecordItemId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'考试记录明细主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestRecordItem', @level2type=N'COLUMN',@level2name=N'TestRecordItemId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'考试记录主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestRecordItem', @level2type=N'COLUMN',@level2name=N'TestRecordId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'题目名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestRecordItem', @level2type=N'COLUMN',@level2name=N'TrainingItemName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'题目内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestRecordItem', @level2type=N'COLUMN',@level2name=N'Abstracts'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'题目附件' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestRecordItem', @level2type=N'COLUMN',@level2name=N'AttachUrl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'题型（1-单选；2-多选；3-判断题）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestRecordItem', @level2type=N'COLUMN',@level2name=N'TestType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'答案项A' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestRecordItem', @level2type=N'COLUMN',@level2name=N'AItem'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'答案项B' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestRecordItem', @level2type=N'COLUMN',@level2name=N'BItem'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'答案项C' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestRecordItem', @level2type=N'COLUMN',@level2name=N'CItem'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'答案项D' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestRecordItem', @level2type=N'COLUMN',@level2name=N'DItem'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'答案项E' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestRecordItem', @level2type=N'COLUMN',@level2name=N'EItem'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'正确答案项' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestRecordItem', @level2type=N'COLUMN',@level2name=N'AnswerItems'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'题目分值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestRecordItem', @level2type=N'COLUMN',@level2name=N'Score'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'题目得分' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestRecordItem', @level2type=N'COLUMN',@level2name=N'SubjectScore'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'回答项' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestRecordItem', @level2type=N'COLUMN',@level2name=N'SelectedItem'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'题目编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestRecordItem', @level2type=N'COLUMN',@level2name=N'TrainingItemCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'考试记录明细表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestRecordItem'
GO

ALTER TABLE [dbo].[Training_TestRecordItem]  WITH CHECK ADD  CONSTRAINT [FK_Training_TestRecordItem_Training_TestRecord] FOREIGN KEY([TestRecordId])
REFERENCES [dbo].[Training_TestRecord] ([TestRecordId])
GO

ALTER TABLE [dbo].[Training_TestRecordItem] CHECK CONSTRAINT [FK_Training_TestRecordItem_Training_TestRecord]
GO


alter table SitePerson_Person add Password nvarchar(50) null
GO
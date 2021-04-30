/*****ϵͳ���ñ�*****/
--Sys_User
ALTER TABLE Sys_User ADD DeviceId NVARCHAR(100) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�豸ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_User', @level2type=N'COLUMN',@level2name=N'DeviceId'
GO
ALTER TABLE Sys_User ADD SessionString NVARCHAR(MAX) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����ַ���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_User', @level2type=N'COLUMN',@level2name=N'SessionString'
GO
ALTER TABLE Sys_User ADD RCount INT NULL
GO
--Sys_Role
ALTER TABLE Sys_Role  ADD IsAPPLeaderRole BIT NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�Ƿ�app�쵼��ɫ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Role', @level2type=N'COLUMN',@level2name=N'IsAPPLeaderRole'
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

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ѯ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Query', @level2type=N'COLUMN',@level2name=N'QueryId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ѯ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Query', @level2type=N'COLUMN',@level2name=N'QueryName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Query', @level2type=N'COLUMN',@level2name=N'InputParams'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Query', @level2type=N'COLUMN',@level2name=N'OutputParams'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ѯ���� 1:��ȫ;2:����;3:����;4:����;' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Query', @level2type=N'COLUMN',@level2name=N'QueryType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����ѯ��־' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Query', @level2type=N'COLUMN',@level2name=N'QueryFlag'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Query', @level2type=N'COLUMN',@level2name=N'Sort'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Sql�ű����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Query', @level2type=N'COLUMN',@level2name=N'QuerySql'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ѯ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Query', @level2type=N'COLUMN',@level2name=N'AppQueryDesc'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�߼�ɾ����ʶ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Query', @level2type=N'COLUMN',@level2name=N'IsDelete'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ע' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Query', @level2type=N'COLUMN',@level2name=N'Remark'
GO

--Sys_Log
ALTER TABLE Sys_Log ADD LogSource TINYINT NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��־��Դ.1:PC; 2:APP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Log', @level2type=N'COLUMN',@level2name=N'LogSource'
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

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'UUID����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Attach_Image', @level2type=N'COLUMN',@level2name=N'attach_image_id'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ļ�ϵ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Attach_Image', @level2type=N'COLUMN',@level2name=N'image_series'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ļ�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Attach_Image', @level2type=N'COLUMN',@level2name=N'file_name'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ļ���С��λKB' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Attach_Image', @level2type=N'COLUMN',@level2name=N'file_size'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ļ�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Attach_Image', @level2type=N'COLUMN',@level2name=N'file_type'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Attach_Image', @level2type=N'COLUMN',@level2name=N'created_date'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Attach_Image', @level2type=N'COLUMN',@level2name=N'created_by'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ͼƬϵ������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Attach_Image', @level2type=N'COLUMN',@level2name=N'series_desc'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ͼƬ·��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Attach_Image', @level2type=N'COLUMN',@level2name=N'file_path'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ͼƬϵ�б�ʶ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Attach_Image', @level2type=N'COLUMN',@level2name=N'series_timestamp'
GO
--AttachFile
--AudiFlow
--AuditFlowApprove

/*****������Ϣ��*****/
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

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'APPģ��Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_Module', @level2type=N'COLUMN',@level2name=N'module_id'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ģ������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_Module', @level2type=N'COLUMN',@level2name=N'module_type'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ģ������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_Module', @level2type=N'COLUMN',@level2name=N'module_name'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�Ƿ���ʾ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_Module', @level2type=N'COLUMN',@level2name=N'is_show'
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

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_PersonBlackList', @level2type=N'COLUMN',@level2name=N'PersonBlackListId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ԱId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_PersonBlackList', @level2type=N'COLUMN',@level2name=N'PersonId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��Ա������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_PersonBlackList'
GO

/*****��Ŀ���ݱ�*****/
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

/*****��ȫ����*****/
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

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_QualityAudit_PersonQuality', @level2type=N'COLUMN',@level2name=N'PersonQualityId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��λ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_QualityAudit_PersonQuality', @level2type=N'COLUMN',@level2name=N'UnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��Ա' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_QualityAudit_PersonQuality', @level2type=N'COLUMN',@level2name=N'PersonId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����֤����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_QualityAudit_PersonQuality', @level2type=N'COLUMN',@level2name=N'CertificateNo'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ظ�֤������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_QualityAudit_PersonQuality', @level2type=N'COLUMN',@level2name=N'CertificateName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'׼����Ŀ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_QualityAudit_PersonQuality', @level2type=N'COLUMN',@level2name=N'Grade'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��֤��λ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_QualityAudit_PersonQuality', @level2type=N'COLUMN',@level2name=N'SendUnit'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��֤ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_QualityAudit_PersonQuality', @level2type=N'COLUMN',@level2name=N'SendDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��Ч����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_QualityAudit_PersonQuality', @level2type=N'COLUMN',@level2name=N'EnableYear'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_QualityAudit_PersonQuality', @level2type=N'COLUMN',@level2name=N'LateCheckDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_QualityAudit_PersonQuality', @level2type=N'COLUMN',@level2name=N'ApprovalPerson'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ɨ���·��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_QualityAudit_PersonQuality', @level2type=N'COLUMN',@level2name=N'ScanUrl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ע' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_QualityAudit_PersonQuality', @level2type=N'COLUMN',@level2name=N'Remark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����λ��Ա���ʱ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_QualityAudit_PersonQuality'
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

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���ֻ����豸����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Base_Equipment', @level2type=N'COLUMN',@level2name=N'EquipmentId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�豸����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Base_Equipment', @level2type=N'COLUMN',@level2name=N'EquipmentType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�Ƿ������豸��true-�����豸,false-���������豸��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Base_Equipment', @level2type=N'COLUMN',@level2name=N'IsSpecialEquipment'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Base_Equipment', @level2type=N'COLUMN',@level2name=N'SortIndex'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Base_Equipment', @level2type=N'COLUMN',@level2name=N'Def'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����豸��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Base_Equipment'
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

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_QualityAudit_EquipmentQuality', @level2type=N'COLUMN',@level2name=N'EquipmentQualityCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���ֻ����豸����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_QualityAudit_EquipmentQuality', @level2type=N'COLUMN',@level2name=N'SpecialEquipmentType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������Ŀ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_QualityAudit_EquipmentQuality', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������λ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_QualityAudit_EquipmentQuality', @level2type=N'COLUMN',@level2name=N'UnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_QualityAudit_EquipmentQuality', @level2type=N'COLUMN',@level2name=N'EquipmentName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����ͺ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_QualityAudit_EquipmentQuality', @level2type=N'COLUMN',@level2name=N'SizeModel'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_QualityAudit_EquipmentQuality', @level2type=N'COLUMN',@level2name=N'FactoryCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ϸ�֤���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_QualityAudit_EquipmentQuality', @level2type=N'COLUMN',@level2name=N'CertificateCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_QualityAudit_EquipmentQuality', @level2type=N'COLUMN',@level2name=N'ProvidedDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��Ч����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_QualityAudit_EquipmentQuality', @level2type=N'COLUMN',@level2name=N'EnableYear'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������鵥λ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_QualityAudit_EquipmentQuality', @level2type=N'COLUMN',@level2name=N'ApprovalPerson'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����ɨ���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_QualityAudit_EquipmentQuality', @level2type=N'COLUMN',@level2name=N'ScanUrl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ע' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_QualityAudit_EquipmentQuality', @level2type=N'COLUMN',@level2name=N'Remark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������豸���ʱ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_QualityAudit_EquipmentQuality'
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

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Solution_ConstructSolutionAudit', @level2type=N'COLUMN',@level2name=N'ConstructSolutionAuditId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ʩ���������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Solution_ConstructSolutionAudit', @level2type=N'COLUMN',@level2name=N'ConstructSolutionCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Solution_ConstructSolutionAudit', @level2type=N'COLUMN',@level2name=N'AuditMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Solution_ConstructSolutionAudit', @level2type=N'COLUMN',@level2name=N'AuditDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��鲽��(0-�޸����ƺ��ر���1-���ƣ�2-�ֳ�HSSE����ʦ���, 3-�ֳ�HSSE������飬4-��ĿHSSE������飬5-ʩ���������/��׼��6-��Ŀ������׼)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Solution_ConstructSolutionAudit', @level2type=N'COLUMN',@level2name=N'AuditStep'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ʩ����������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Solution_ConstructSolutionAudit'
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

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ѳ����������id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_HazardRegisterTypes', @level2type=N'COLUMN',@level2name=N'RegisterTypesId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ѳ����������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_HazardRegisterTypes', @level2type=N'COLUMN',@level2name=N'RegisterTypesName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_HazardRegisterTypes', @level2type=N'COLUMN',@level2name=N'TypeCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ѳ��(�ֻ�)�������ͱ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_HazardRegisterTypes'
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


EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_HazardRegister', @level2type=N'COLUMN',@level2name=N'HazardRegisterId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�۲�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_HazardRegister', @level2type=N'COLUMN',@level2name=N'RegisterDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�۲�˵��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_HazardRegister', @level2type=N'COLUMN',@level2name=N'RegisterDef'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���Ĵ�ʩ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_HazardRegister', @level2type=N'COLUMN',@level2name=N'Rectification'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ص�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_HazardRegister', @level2type=N'COLUMN',@level2name=N'Place'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���𷽣���λ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_HazardRegister', @level2type=N'COLUMN',@level2name=N'ResponsibleUnit'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�۲�Ա' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_HazardRegister', @level2type=N'COLUMN',@level2name=N'Observer'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_HazardRegister', @level2type=N'COLUMN',@level2name=N'RectifiedDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'״̬ 1�������ģ�2�������ģ���ȷ�ϣ�3����ȷ�ϣ����ѱջ���4��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_HazardRegister', @level2type=N'COLUMN',@level2name=N'states'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�Ƿ���� 0������ˣ�1�����ͨ���������ģ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_HazardRegister', @level2type=N'COLUMN',@level2name=N'IsEffective'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_HazardRegister', @level2type=N'COLUMN',@level2name=N'ResponsibleMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ѳ��Ա' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_HazardRegister', @level2type=N'COLUMN',@level2name=N'CheckManId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ѳ��ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_HazardRegister', @level2type=N'COLUMN',@level2name=N'CheckTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_HazardRegister', @level2type=N'COLUMN',@level2name=N'RectificationPeriod'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����ǰͼƬ·��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_HazardRegister', @level2type=N'COLUMN',@level2name=N'ImageUrl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���ĺ�ͼƬ·��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_HazardRegister', @level2type=N'COLUMN',@level2name=N'RectificationImageUrl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_HazardRegister', @level2type=N'COLUMN',@level2name=N'RectificationTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ȷ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_HazardRegister', @level2type=N'COLUMN',@level2name=N'ConfirmMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ȷ��ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_HazardRegister', @level2type=N'COLUMN',@level2name=N'ConfirmDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_HazardRegister', @level2type=N'COLUMN',@level2name=N'HandleIdea'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�������� 0����ȫ��1������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_HazardRegister', @level2type=N'COLUMN',@level2name=N'ProblemTypes'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ѳ����������id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_HazardRegister', @level2type=N'COLUMN',@level2name=N'RegisterTypesId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_HazardRegister', @level2type=N'COLUMN',@level2name=N'CheckCycle'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ϸId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_HazardRegister', @level2type=N'COLUMN',@level2name=N'CheckItemDetailId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ϼ�d' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_HazardRegister', @level2type=N'COLUMN',@level2name=N'SupCheckItemSetId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_HazardRegister', @level2type=N'COLUMN',@level2name=N'CheckItemSetId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'װ��Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_HazardRegister', @level2type=N'COLUMN',@level2name=N'InstallationId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����Ѳ����������id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_HazardRegister', @level2type=N'COLUMN',@level2name=N'DIC_ID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Σ�չ۲�Ǽ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_HazardRegister'
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

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_PunishItem', @level2type=N'COLUMN',@level2name=N'PunishItemId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_PunishItem', @level2type=N'COLUMN',@level2name=N'PunishItemCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���ͣ�1-��ȫ��2-������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_PunishItem', @level2type=N'COLUMN',@level2name=N'PunishItemType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_PunishItem', @level2type=N'COLUMN',@level2name=N'PunishItemContent'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�۷֣�һ��(1)�����أ�3�������أ�6�����ǳ����أ�9�����������أ�12����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_PunishItem', @level2type=N'COLUMN',@level2name=N'Deduction'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_PunishItem', @level2type=N'COLUMN',@level2name=N'PunishMoney'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����������Ϣ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_PunishItem'
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

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_PunishRecord', @level2type=N'COLUMN',@level2name=N'PunishRecordId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ԱId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_PunishRecord', @level2type=N'COLUMN',@level2name=N'PersonId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_PunishRecord', @level2type=N'COLUMN',@level2name=N'PunishItemId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_PunishRecord', @level2type=N'COLUMN',@level2name=N'PunishDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_PunishRecord', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������������ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_PunishRecord', @level2type=N'COLUMN',@level2name=N'HazardRegisterId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������¼��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_PunishRecord'
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

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Check_CheckItemSet', @level2type=N'COLUMN',@level2name=N'CheckItemSetId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����Ŀ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Check_CheckItemSet', @level2type=N'COLUMN',@level2name=N'CheckItemName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ϼ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Check_CheckItemSet', @level2type=N'COLUMN',@level2name=N'SupCheckItem'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�Ƿ�ĩ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Check_CheckItemSet', @level2type=N'COLUMN',@level2name=N'IsEndLever'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Check_CheckItemSet', @level2type=N'COLUMN',@level2name=N'SortIndex'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����Ŀ���ñ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Check_CheckItemSet'
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

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Check_CheckItemDetail', @level2type=N'COLUMN',@level2name=N'CheckItemDetailId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����Ŀ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Check_CheckItemDetail', @level2type=N'COLUMN',@level2name=N'CheckItemSetId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�������ϸ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Check_CheckItemDetail'
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

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Weather', @level2type=N'COLUMN',@level2name=N'WeatherId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Weather', @level2type=N'COLUMN',@level2name=N'WeatherStatus'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Weather'
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

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ţ�������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Check_CheckSpecial', @level2type=N'COLUMN',@level2name=N'CheckSpecialCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Check_CheckSpecial', @level2type=N'COLUMN',@level2name=N'CheckSpecialName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��Ŀ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Check_CheckSpecial', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��λ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Check_CheckSpecial', @level2type=N'COLUMN',@level2name=N'UnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ҵ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Check_CheckSpecial', @level2type=N'COLUMN',@level2name=N'WorkArea'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Check_CheckSpecial', @level2type=N'COLUMN',@level2name=N'WeatherId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�¶�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Check_CheckSpecial', @level2type=N'COLUMN',@level2name=N'Temperature'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ʪ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Check_CheckSpecial', @level2type=N'COLUMN',@level2name=N'Hnmidity'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Check_CheckSpecial', @level2type=N'COLUMN',@level2name=N'WindSpeed'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���֤����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Check_CheckSpecial', @level2type=N'COLUMN',@level2name=N'AllowType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��Ч��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Check_CheckSpecial', @level2type=N'COLUMN',@level2name=N'LimitTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�໤���ڳ���true-�ǣ�false-��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Check_CheckSpecial', @level2type=N'COLUMN',@level2name=N'IsField'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�໤��ʩ�Ƿ�λ��true-�ǣ�false-��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Check_CheckSpecial', @level2type=N'COLUMN',@level2name=N'IsInPlace'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Υ�´���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Check_CheckSpecial', @level2type=N'COLUMN',@level2name=N'ViolationRule'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����ˣ����ܶ��ˣ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Check_CheckSpecial', @level2type=N'COLUMN',@level2name=N'CheckPerson'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Check_CheckSpecial', @level2type=N'COLUMN',@level2name=N'CheckTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��֤�ˣ����ܶ��ˣ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Check_CheckSpecial', @level2type=N'COLUMN',@level2name=N'VerifyPerson'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��֤ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Check_CheckSpecial', @level2type=N'COLUMN',@level2name=N'VerifyTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�������(1-��ҵ��ɼ�飬2-������Ϊ��飬3-�ֳ���ҵ���̼��)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Check_CheckSpecial', @level2type=N'COLUMN',@level2name=N'CheckType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��Ӧ����֪ͨ���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Check_CheckSpecial', @level2type=N'COLUMN',@level2name=N'ToIncentiveNotice'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��Ӧͣ������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Check_CheckSpecial', @level2type=N'COLUMN',@level2name=N'ToPauseNotice'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��Ӧ������֪ͨ���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Check_CheckSpecial', @level2type=N'COLUMN',@level2name=N'ToRectifyNotice'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ר�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Check_CheckSpecial'
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

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Check_CheckSpecialDetail', @level2type=N'COLUMN',@level2name=N'CheckSpecialDetailId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ר����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Check_CheckSpecialDetail', @level2type=N'COLUMN',@level2name=N'CheckSpecialCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����Ŀ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Check_CheckSpecialDetail', @level2type=N'COLUMN',@level2name=N'CheckItemDetailId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�Ƿ���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Check_CheckSpecialDetail', @level2type=N'COLUMN',@level2name=N'IsCheck'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ר������ϸ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Check_CheckSpecialDetail'
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

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_SafeSupervision', @level2type=N'COLUMN',@level2name=N'SafeSupervisionId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ĿId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_SafeSupervision', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������ͣ�1-��˾�쵼���ӣ�2-ְ�ܹ������쵼��3-ҵ��λ�쵼���ӣ�4-ҵ��λ�����쵼��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_SafeSupervision', @level2type=N'COLUMN',@level2name=N'CheckType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_SafeSupervision', @level2type=N'COLUMN',@level2name=N'CheckManId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_SafeSupervision', @level2type=N'COLUMN',@level2name=N'CheckDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'APP��ȫ��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_SafeSupervision'
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

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_Geography', @level2type=N'COLUMN',@level2name=N'geography_id'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ѳ�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_Geography', @level2type=N'COLUMN',@level2name=N'HazardRegisterId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����[���ȣ�ά��]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_Geography', @level2type=N'COLUMN',@level2name=N'geography_coordinate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ر�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_Geography', @level2type=N'COLUMN',@level2name=N'landmark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_Geography', @level2type=N'COLUMN',@level2name=N'create_date'
GO

/*****��������*****/
--WBS_CnProfession
--Wbs_UnitProject		
--Wbs_WbsSet	
--CQMS_quality_three_check	

/*****�豸����*****/
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

/*****���ӹ���*****/
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

/*****��������*****/
--Indicator


--Sys_Query �����ѯ����
INSERT INTO Sys_Query(QueryId,QueryName,InputParams,OutputParams,QueryType,QueryFlag,Sort,QuerySql,AppQueryDesc,IsDelete) 
VALUES ('021EEEE8-63F4-4141-A27E-6D90FF0B4879','�������Ա��Ϣ��','[{"paramsEnName":"projectId","paramsZhName":"��ĿId","isNotNull":"true"},{"paramsEnName":"queryPk","paramsZhName":"��ѯ����","isNotNull":"true"},{"paramsEnName":"listIndex","paramsZhName":"�б���ʾ����","initValue":"0","isNotNull":"false"},{"paramsEnName":"queryNo","paramsZhName":"��Ա����","isNotNull":"true"}]','[{"paramsEnName":"CardNo","paramsZhDesc":"����"},{"paramsEnName":"PersonName","paramsZhDesc":"����"},{"paramsEnName":"IdentityCard","paramsZhDesc":"���֤��"},{"paramsEnName":"sex","paramsZhDesc":"�Ա�"},{"paramsEnName":"PhotoUrl","paramsZhDesc":"ͷ��"},{"paramsEnName":"Telephone","paramsZhDesc":"�ֻ�����"},{"paramsEnName":"UnitCode","paramsZhDesc":"������λ"},{"paramsEnName":"UnitName","paramsZhDesc":"��λ����"},{"paramsEnName":"WorkAreaCode","paramsZhDesc":"��������"},{"paramsEnName":"WorkAreaName","paramsZhDesc":"��������"},{"paramsEnName":"CertificateNo","paramsZhDesc":"֤����"},{"paramsEnName":"CertificateName","paramsZhDesc":"֤������"},{"paramsEnName":"SendUnit","paramsZhDesc":"��֤��λ"},{"paramsEnName":"SendDate","paramsZhDesc":"��֤����"},{"paramsEnName":"EnableYear","paramsZhDesc":"��Ч����"},{"paramsEnName":"LateCheckDate","paramsZhDesc":"���º�֤����"}]',1,1,5,' select   BP.CardNo,BP.PersonName,BP.IdentityCard,BP.Sex,BP.PhotoUrl,BP.Telephone,  BU.UnitCode,BU.UnitName,  WA.WorkAreaCode,WA.WorkAreaName,  PQ.CertificateNo,PQ.CertificateName,PQ.SendUnit,PQ.SendDate,PQ.EnableYear,PQ.LateCheckDate   from Base_Person BP   left join Base_Unit BU on BP.UnitId = BU.UnitId  left join Project_WorkArea WA on BP.WorkAreaId = WA.WorkAreaId  left join HSSE_QualityAudit_PersonQuality PQ on BP.PostId = PQ.PersonQualityId  where BP.projectId = @project_Id and CardNo = @query_No','ͨ��ɨ��������롾��Ա���š�����ʵ�ֳ���Ա������Ϣ(��������λ����λ������֤��������Ϣ)��',0) 
GO
INSERT INTO Sys_Query(QueryId,QueryName,InputParams,OutputParams,QueryType,QueryFlag,Sort,QuerySql,AppQueryDesc,IsDelete) 
VALUES ('05695D2F-CA26-44B3-B251-C8F358D170DA','�����ߺ�����Ϣ��ѯ���˶ԡ�','[{"paramsEnName":"projectId","paramsZhName":"��ĿId","isNotNull":"true"},{"paramsEnName":"queryPk","paramsZhName":"��ѯ����","isNotNull":"true"},{"paramsEnName":"listIndex","paramsZhName":"�б���ʾ����","initValue":"JOT_JointNo,JOT_WeldDate,CellWelderName","isNotNull":"false"},{"paramsEnName":"queryNo","paramsZhName":"���߱��","isNotNull":"true"}]','[{"paramsEnName":"ISO_IsoNo","paramsZhDesc":"���߱��"},{"paramsEnName":"JOT_JointNo","paramsZhDesc":"���ڴ���"},{"paramsEnName":"CellWelderCode","paramsZhDesc":"���溸�����"},{"paramsEnName":"CellWelderName","paramsZhDesc":"���溸������"},{"paramsEnName":"FloorWelderCode","paramsZhDesc":"��׺������"},{"paramsEnName":"FloorWelderName","paramsZhDesc":"��׺�������"},{"paramsEnName":"JOT_DoneDin","paramsZhDesc":"��ɴ���"},{"paramsEnName":"JOT_Dia","paramsZhDesc":"���ڴ���"},{"paramsEnName":"JOT_WeldDate","paramsZhDesc":"�����ձ�����"},{"paramsEnName":"JOT_DailyReportNo","paramsZhDesc":"�����ձ����"},{"paramsEnName":"UserName","paramsZhDesc":"�����ձ��Ʊ���"},{"paramsEnName":"CHT_TableDate","paramsZhDesc":"�����ձ��Ʊ�����"},{"paramsEnName":"WLO_Code","paramsZhDesc":"Ԥ��/��װ"},{"paramsEnName":"JOT_Size","paramsZhDesc":"�ߴ�"},{"paramsEnName":"JOT_Sch","paramsZhDesc":"�ں�"},{"paramsEnName":"JOT_JointDesc","paramsZhDesc":"���ڹ��"},{"paramsEnName":"JOT_Location","paramsZhDesc":"����λ��"},{"paramsEnName":"WMT_MatCode","paramsZhDesc":"���Ӳ���"}]',3,7,20,'select PW.ISO_IsoNo,JOT_JointNo,BW.WED_Code AS CellWelderCode,BW.WED_Name AS CellWelderName,  BE.WED_Code AS FloorWelderCode,BE.WED_Name AS FloorWelderName,JOT_DoneDin,JOT_Dia,JOT_WeldDate,  JOT_DailyReportNo,UserName,CHT_TableDate,  WLO_Code,JOT_Size,JOT_Sch,JOT_JointDesc,JOT_Location,WM.WMT_MatCode  from HJGL_PW_JointInfo PJ   left join HJGL_PW_IsoInfo PW on PJ.ISO_ID = PW.ISO_ID  left join HJGL_BS_Welder BW on BW.WED_ID = JOT_CellWelder  left join HJGL_BS_Welder BE on BE.WED_ID = JOT_FloorWelder  left join HJGL_BS_WeldMaterial WM on WME_ID = JOT_WeldMat  left join HJGL_BO_WeldReportMain WR on WR.DReportID = PJ.DReportID   left join Sys_User SU on SU.UserId = WR.CHT_Tabler  where PW.projectId = @project_Id and  PW.ISO_IsoNo = @query_No  order by JOT_JointNo','ͨ��ɨ��������롾���߱�š���ѯ�ù��ߵ����к�����Ϣ��������ֳ���ʱ�˶ԡ�',0) 
GO
INSERT INTO Sys_Query(QueryId,QueryName,InputParams,OutputParams,QueryType,QueryFlag,Sort,QuerySql,AppQueryDesc,IsDelete) 
VALUES ('06EFB24C-DE2C-4F60-965F-D1734ED7AD52','��ʩ����HSEר�����ѯ��','[{"paramsEnName":"projectId","paramsZhName":"��ĿId","isNotNull":"true"},{"paramsEnName":"queryPk","paramsZhName":"��ѯ����","isNotNull":"true"},{"paramsEnName":"listIndex","paramsZhName":"�б���ʾ����","initValue":"0","isNotNull":"false"},{"paramsEnName":"queryNo","paramsZhName":"���������","isNotNull":"true"}]','[{"paramsEnName":"ConstructSolutionCode","paramsZhDesc":"���������"},{"paramsEnName":"FileName","paramsZhDesc":"��������"},{"paramsEnName":"VersionNo","paramsZhDesc":"�汾��"},{"paramsEnName":"ProjectCode","paramsZhDesc":"������Ŀ"},{"paramsEnName":"ProjectName","paramsZhDesc":"��Ŀ����"},{"paramsEnName":"UnitCode","paramsZhDesc":"������λ"},{"paramsEnName":"UnitName","paramsZhDesc":"��λ����"},{"paramsEnName":"SolutionName","paramsZhDesc":"��������"},{"paramsEnName":"State","paramsZhDesc":"����״̬"},{"paramsEnName":"StateDesc","paramsZhDesc":"״̬����"},{"paramsEnName":"CompileUserName","paramsZhDesc":"������"},{"paramsEnName":"CompileDate","paramsZhDesc":"����ʱ��"},{"paramsEnName":"AuditUserName","paramsZhDesc":"�����"},{"paramsEnName":"AuditDate","paramsZhDesc":"���ʱ��"}]',1,6,15,' select SC.ConstructSolutionCode,FileName,VersionNo ,BP.ProjectCode,BP.ProjectName,BU.UnitCode,BU.UnitName,  SS.SolutionName,SC.State,''0-�޸����ƺ��ر���1-���ƣ�2-�ֳ�HSSE����ʦ���, 3-�ֳ�HSSE������飬4-��ĿHSSE������飬5-ʩ���������/��׼��6-��Ŀ������׼��7-�������'' as StateDesc,  SU.UserName as CompileUserName,SC.CompileDate,UU.UserName as AuditUserName,CS.AuditDate  from HSSE_Solution_ConstructSolution SC  left join HSSE_Solution_ConstructSolutionAudit CS on SC.ConstructSolutionCode = CS.ConstructSolutionCode  left join Base_Project BP on BP.ProjectId = SC.ProjectId  left join Base_Unit BU on BU.UnitId = SC.UnitId  left join Sys_User  SU on SU.UserId = SC.CompileMan   left join Sys_User  UU on SU.UserId = CS.AuditMan   left join HSSE_Solution_SolutionSet SS on SS.SolutionSetId = SC.SolutinType  where BP.projectId = @project_Id and  SC.ConstructSolutionCode = @query_No','ͨ��ɨ��������롾��������š���ѯʩ�������е�HSE�������ݻ�HSEר������ݡ�',0) 
GO
INSERT INTO Sys_Query(QueryId,QueryName,InputParams,OutputParams,QueryType,QueryFlag,Sort,QuerySql,AppQueryDesc,IsDelete) 
VALUES ('08F41137-5339-49EB-B519-EA5352CEAC6B','��������⹤����ҵ��Ա��Ϣ��','[{"paramsEnName":"projectId","paramsZhName":"��ĿId","isNotNull":"true"},{"paramsEnName":"queryPk","paramsZhName":"��ѯ����","isNotNull":"true"},{"paramsEnName":"listIndex","paramsZhName":"�б���ʾ����","initValue":"0","isNotNull":"false"},{"paramsEnName":"queryNo","paramsZhName":"��Ա����","isNotNull":"true"}]','[{"paramsEnName":"CardNo","paramsZhDesc":"����"},{"paramsEnName":"PersonName","paramsZhDesc":"����"},{"paramsEnName":"IdentityCard","paramsZhDesc":"���֤��"},{"paramsEnName":"sex","paramsZhDesc":"�Ա�"},{"paramsEnName":"PhotoUrl","paramsZhDesc":"ͷ��"},{"paramsEnName":"Telephone","paramsZhDesc":"�ֻ�����"},{"paramsEnName":"UnitCode","paramsZhDesc":"������λ"},{"paramsEnName":"UnitName","paramsZhDesc":"��λ����"},{"paramsEnName":"WorkAreaCode","paramsZhDesc":"��������"},{"paramsEnName":"WorkAreaName","paramsZhDesc":"��������"},{"paramsEnName":"CertificateNo","paramsZhDesc":"֤����"},{"paramsEnName":"CertificateName","paramsZhDesc":"֤������"},{"paramsEnName":"SendUnit","paramsZhDesc":"��֤��λ"},{"paramsEnName":"SendDate","paramsZhDesc":"��֤����"},{"paramsEnName":"LimitDate","paramsZhDesc":"��Ч����"},{"paramsEnName":"LateCheckDate","paramsZhDesc":"���º�֤����"},{"paramsEnName":"ApprovalPerson","paramsZhDesc":"�����"}]',2,8,5,'select BP.CardNo,BP.PersonName,BP.IdentityCard,BP.Sex,BP.PhotoUrl,BP.Telephone,  BU.UnitCode,BU.UnitName,WA.WorkAreaCode,WA.WorkAreaName,  PQ.CertificateNo,PQ.CertificateName,PQ.SendUnit,PQ.SendDate,PQ.LimitDate,  PQ.ApprovalPerson,PQ.LateCheckDate  from CQMS_QualityAudit_PersonQuality PQ  left join Base_Person BP on BP.PersonId = PQ.PersonId  left join Base_Unit BU on BU.UnitId = PQ.UnitId  left join Project_WorkArea WA on BP.WorkAreaId = WA.WorkAreaId  where BP.projectId = @project_Id and  CardNo = @query_No','ͨ��ɨ��������롾��Ա���š�����ʵ�ֳ����⹤����Ա������Ϣ(��������λ����λ������֤��������Ϣ)��',0) 
GO
INSERT INTO Sys_Query(QueryId,QueryName,InputParams,OutputParams,QueryType,QueryFlag,Sort,QuerySql,AppQueryDesc,IsDelete) 
VALUES ('185F5797-C51F-4876-A13C-2FE1A49863CA','��������Ϣ��ѯ��','[{"paramsEnName":"projectId","paramsZhName":"��ĿId","isNotNull":"true"},{"paramsEnName":"queryPk","paramsZhName":"��ѯ����","isNotNull":"true"},{"paramsEnName":"listIndex","paramsZhName":"�б���ʾ����","initValue":"0","isNotNull":"false"},{"paramsEnName":"queryNo","paramsZhName":"���֤��","isNotNull":"true"}]','[{"paramsEnName":"WED_Code","paramsZhDesc":"��������"},{"paramsEnName":"WED_Name","paramsZhDesc":"��������"},{"paramsEnName":"IdentityCard","paramsZhDesc":"���֤��"},{"paramsEnName":"UnitName","paramsZhDesc":"��λ����"},{"paramsEnName":"TeamGroupName","paramsZhDesc":"��������"},       {"paramsEnName":"WED_WorkCode","paramsZhDesc":"֤����"},{"paramsEnName":"WED_Class","paramsZhDesc":"�����ȼ�"}]',3,15,10,'SELECT Welder.WED_ID,         Welder.WED_Code,         Welder.WED_Name,         Welder.IdentityCard,         Welder.WED_Unit,         Unit.UnitName,         Welder.EDU_ID,         Education.TeamGroupName,         Welder.WED_WorkCode,         Welder.WED_Class         FROM HJGL_BS_Welder AS Welder    LEFT JOIN Base_Unit AS Unit ON Welder.WED_Unit = Unit.UnitId   LEFT JOIN Base_TeamGroup AS Education ON Welder.EDU_ID = Education.TeamGroupId   WHERE Welder.ProjectId=@project_Id and Welder.IdentityCard=@query_No','ͨ��ɨ��������롾���֤�š���ѯ�ú����Ļ�����Ϣ��',0) 
GO
INSERT INTO Sys_Query(QueryId,QueryName,InputParams,OutputParams,QueryType,QueryFlag,Sort,QuerySql,AppQueryDesc,IsDelete) 
VALUES ('37F4B825-40DA-4589-AF38-EE7D71F3CC6C','��ʩ������Ԥ�����ܡ�','[{"paramsEnName":"projectId","paramsZhName":"��ĿId","isNotNull":"true"},{"paramsEnName":"queryPk","paramsZhName":"��ѯ����","isNotNull":"true"},{"paramsEnName":"listIndex","paramsZhName":"�б���ʾ����","initValue":"QualityId,QualityDec,QualityType","isNotNull":"false"},{"paramsEnName":"queryNo","paramsZhName":"ʩ����ĿId","isNotNull":"true"}]','[{"paramsEnName":"QualityId","paramsZhDesc":"Ԥ��Id"},{"paramsEnName":"QualityDec","paramsZhDesc":"Ԥ������"},{"paramsEnName":"QualityType","paramsZhDesc":"Ԥ������"}]',2,11,20,'EXEC CQMS_SpEnableCueQualityDesktop @query_No','�ò�ѯ�����������λ���ʵ���Ԥ�����ظ�������Ա����֤�鵽��Ԥ���������豸��Ч��Ԥ�����豸�����춨����Ԥ����רҵ�����������⵽��Ԥ����',0) 
GO
INSERT INTO Sys_Query(QueryId,QueryName,InputParams,OutputParams,QueryType,QueryFlag,Sort,QuerySql,AppQueryDesc,IsDelete) 
VALUES ('43A8A222-4028-4F3B-B760-ED51AC5843C6','��ʩ����ȫԤ�����ܡ�','[{"paramsEnName":"projectId","paramsZhName":"��ĿId","isNotNull":"true"},{"paramsEnName":"queryPk","paramsZhName":"��ѯ����","isNotNull":"true"},{"paramsEnName":"listIndex","paramsZhName":"�б���ʾ����","initValue":"QualityId,QualityDec,QualityType","isNotNull":"false"},{"paramsEnName":"queryNo","paramsZhName":"ʩ����ĿId","isNotNull":"true"}]','[{"paramsEnName":"QualityId","paramsZhDesc":"Ԥ��Id"},{"paramsEnName":"QualityDec","paramsZhDesc":"Ԥ������"},{"paramsEnName":"QualityType","paramsZhDesc":"Ԥ������"}]',1,10,20,'EXEC HSSE_SpEnableCueQualityDesktop @query_No','�ò�ѯ�����������λ���ʵ���Ԥ�����ظ�������Ա����֤�鵽��Ԥ���������豸��Ч��Ԥ�����豸�����춨����Ԥ����',0) 
GO
INSERT INTO Sys_Query(QueryId,QueryName,InputParams,OutputParams,QueryType,QueryFlag,Sort,QuerySql,AppQueryDesc,IsDelete) 
VALUES ('57790C1C-A9FF-41B2-BFDD-C4FEBEB98841','������ʩ��ר�����ѯ��','[{"paramsEnName":"projectId","paramsZhName":"��ĿId","isNotNull":"true"},{"paramsEnName":"queryPk","paramsZhName":"��ѯ����","isNotNull":"true"},{"paramsEnName":"listIndex","paramsZhName":"�б���ʾ����","initValue":"0","isNotNull":"false"},{"paramsEnName":"queryNo","paramsZhName":"���������","isNotNull":"true"}]','[{"paramsEnName":"ConstructSolutionCode","paramsZhDesc":"���������"},{"paramsEnName":"FileName","paramsZhDesc":"��������"},{"paramsEnName":"VersionNo","paramsZhDesc":"�汾��"},{"paramsEnName":"ProjectCode","paramsZhDesc":"������Ŀ"},{"paramsEnName":"ProjectName","paramsZhDesc":"��Ŀ����"},{"paramsEnName":"UnitCode","paramsZhDesc":"������λ"},{"paramsEnName":"UnitName","paramsZhDesc":"��λ����"},{"paramsEnName":"SolutionName","paramsZhDesc":"��������"},{"paramsEnName":"State","paramsZhDesc":"����״̬"},{"paramsEnName":"StateDesc","paramsZhDesc":"״̬����"},{"paramsEnName":"CompileUserName","paramsZhDesc":"������"},{"paramsEnName":"CompileDate","paramsZhDesc":"����ʱ��"},{"paramsEnName":"AuditUserName","paramsZhDesc":"�����"},{"paramsEnName":"AuditDate","paramsZhDesc":"���ʱ��"}]',2,9,10,'select SC.ConstructSolutionCode,FileName,VersionNo ,BP.ProjectCode,BP.ProjectName,BU.UnitCode,BU.UnitName,  SS.SolutionName,SC.State,''0-�޸����ƺ��ر���1-���ƣ�2-�ֳ�HSSE����ʦ���, 3-�ֳ�HSSE������飬4-��ĿHSSE������飬5-ʩ���������/��׼��6-��Ŀ������׼��7-�������'' as StateDesc,  SU.UserName as CompileUserName,SC.CompileDate,UU.UserName as AuditUserName,CS.AuditDate  from CQMS_Solution_ConstructSolution SC  left join CQMS_Solution_ConstructSolutionAudit CS on SC.ConstructSolutionId = CS.ConstructSolutionId  left join Base_Project BP on BP.ProjectId = SC.ProjectId  left join Base_Unit BU on BU.UnitId = SC.UnitId  left join Sys_User  SU on SU.UserId = SC.CompileMan   left join Sys_User  UU on SU.UserId = CS.AuditMan   left join HSSE_Solution_SolutionSet SS on SS.SolutionSetId = SC.CnProfessionId  where BP.projectId = @project_Id and SC.ConstructSolutionCode = @query_No','ͨ��ɨ��������롾������������š���ѯ����ʩ�����������ڸ�������������Ա��ʩ��������Ա����ʩ����ҵ���֤����Ϣ��',0) 
GO
INSERT INTO Sys_Query(QueryId,QueryName,InputParams,OutputParams,QueryType,QueryFlag,Sort,QuerySql,AppQueryDesc,IsDelete) 
VALUES ('5AE3E1D1-C26C-4250-8960-AF3CE7F647EE','������ҵ�������˶ԡ�','[{"paramsEnName":"projectId","paramsZhName":"��ĿId","isNotNull":"true"},{"paramsEnName":"queryPk","paramsZhName":"��ѯ����","isNotNull":"true"},{"paramsEnName":"listIndex","paramsZhName":"�б���ʾ����","initValue":"0","isNotNull":"false"},{"paramsEnName":"queryNo","paramsZhName":"�������","isNotNull":"true"}]','[{"paramsEnName":"UnitName","paramsZhDesc":"������λ"}, {"paramsEnName":"EDU_Name","paramsZhDesc":"��������"}, {"paramsEnName":"WED_Code","paramsZhDesc":"�������"}, {"paramsEnName":"WED_Name","paramsZhDesc":"��������"}, {"paramsEnName":"WED_Sex","paramsZhDesc":"�Ա�"}, {"paramsEnName":"WED_Birthday","paramsZhDesc":"��������"}, {"paramsEnName":"WED_WorkCode","paramsZhDesc":"�ϸ�֤��"}, {"paramsEnName":"WED_Class","paramsZhDesc":"�����ȼ�"}, {"paramsEnName":"WED_IfOnGuard","paramsZhDesc":"�ڸ�״̬"}, {"paramsEnName":"total_jot","paramsZhDesc":"�ܺ�����"}, {"paramsEnName":"totaldin","paramsZhDesc":"�ܴ�����"}, {"paramsEnName":"total_repairjot","paramsZhDesc":"�ܷ�����"}, {"paramsEnName":"repairrate","paramsZhDesc":"������%"}, {"paramsEnName":"totalfilm","paramsZhDesc":"��Ƭ��"}, {"paramsEnName":"passfilm","paramsZhDesc":"�ϸ�Ƭ��"}, {"paramsEnName":"notpassfilm","paramsZhDesc":"���ϸ�Ƭ��"}, {"paramsEnName":"passrate","paramsZhDesc":"�ϸ���%"}, {"paramsEnName":"unpassrate","paramsZhDesc":"���ϸ���%"}]',3,3,5,'SELECT  welder.ProjectId,   welder.wed_code,-- ��������   welder.wed_name,--��������   welder.WED_Sex, --�Ա�   welder.WED_Birthday, --��������   welder.WED_WorkCode, --֤��   welder.WED_Class,  --�ȼ�   unit.UnitName,   --������λ   education.EDU_Name AS education,  --���ڰ���   (CASE WHEN welder.WED_IfOnGuard=1 THEN ''�ڸ�'' else ''���ڸ�'' end) as WED_IfOnGuard, --�ڸ�״̬      ISNULL(totaldin.total_jot,0) AS total_jot , --�ܺ���    CAST(ISNULL(totaldin.totaldin,0) AS DECIMAL(19,2))AS totaldin, ----�ܴ���ֵ     ISNULL(total_repairjot.total_repairjot,0) AS total_repairjot,  --�ܷ�����   CAST((CASE ISNULL(totaldin.total_jot,0) WHEN 0 THEN 0     ELSE 100.0 * isnull(total_repairjot.total_repairjot,0)/(1.0 * totaldin.total_jot) END) AS DECIMAL(19,3))    AS repairrate, -- ������   ISNULL(totalfilm.totalfilm,0) AS totalfilm, --��Ƭ��   ISNULL(totalfilm.passfilm,0) AS passfilm, --�ϸ�Ƭ��   (ISNULL(totalfilm.totalfilm , 0) - ISNULL(totalfilm.passfilm ,0)) AS notpassfilm, --���ϸ�Ƭ��   CAST((CASE ISNULL(totalfilm.totalfilm,0) WHEN 0 THEN 0     ELSE 100.0 * isnull(totalfilm.passfilm,0)/(1.0 * totalfilm.totalfilm) END) AS DECIMAL(19,3))    AS passrate,--�ϸ���       CAST((CASE ISNULL(totalfilm.totalfilm,0) WHEN 0 THEN 0     ELSE 100.0 * (ISNULL(totalfilm.totalfilm , 0) - ISNULL(totalfilm.passfilm ,0)) /(1.0 * totalfilm.totalfilm) END) AS DECIMAL(19,3))     AS unpassrate--���ϸ���      FROM HJGL_BS_Welder AS welder  LEFT JOIN HJGL_HS_Education AS education  ON education.EDU_ID= welder.EDU_ID   LEFT JOIN Base_Unit unit on welder.WED_Unit = unit.UnitId     --�ܴ���ֵ --�ܺ���  LEFT JOIN (SELECT SUM(jot_donedin) AS totaldin     ,COUNT(*) AS total_jot     ,HJGL_pw_jointinfo.JOT_CellWelder     FROM HJGL_pw_jointinfo        GROUP  BY  HJGL_pw_jointinfo.JOT_CellWelder) AS totaldin ON totaldin.JOT_CellWelder = welder.WED_ID  --�ܷ�����  LEFT JOIN (SELECT  COUNT(*) AS total_repairjot     ,HJGL_pw_jointinfo.JOT_CellWelder     FROM HJGL_pw_jointinfo        LEFT JOIN dbo.HJGL_CH_TrustItem AS TrustItem ON HJGL_pw_jointinfo.JOT_ID = TrustItem.JOT_ID      LEFT JOIN dbo.HJGL_CH_Trust AS Trust ON Trust.CH_TrustID= TrustItem.CH_TrustID          LEFT JOIN HJGL_BO_WeldReportMain ON HJGL_pw_jointinfo.DReportID = HJGL_BO_WeldReportMain.DReportID         WHERE Trust.CH_TrustType=''2'' and JOT_JointStatus !=''102''    GROUP BY HJGL_pw_jointinfo.JOT_CellWelder) AS total_repairjot ON total_repairjot.JOT_CellWelder = welder.WED_ID  --��Ƭ�� --�ϸ�Ƭ��  LEFT JOIN (SELECT SUM(cht_totalfilm) AS totalfilm      ,SUM(cht_passfilm) AS passfilm      ,HJGL_pw_jointinfo.JOT_CellWelder     FROM HJGL_CH_CheckItem     LEFT JOIN HJGL_pw_jointinfo ON HJGL_pw_jointinfo.jot_id=HJGL_CH_CheckItem.jot_id         WHERE HJGL_CH_CheckItem.jot_id is not null     GROUP  BY HJGL_pw_jointinfo.JOT_CellWelder) AS totalfilm ON totalfilm.JOT_CellWelder = welder.WED_ID      WHERE welder.ProjectId = @project_Id AND welder.WED_Code=@query_No','ͨ��ɨ��������롾������š���ѯ������Ա�Ļ�����Ϣ(������λ���������������ʺ�ҵ����)��',0) 
GO
INSERT INTO Sys_Query(QueryId,QueryName,InputParams,OutputParams,QueryType,QueryFlag,Sort,QuerySql,AppQueryDesc,IsDelete) 
VALUES ('7D670242-4FE0-4E37-9883-B9C2AEA18C53','����������Ϣ��','[{"paramsEnName":"projectId","paramsZhName":"��ĿId","isNotNull":"true"},{"paramsEnName":"queryPk","paramsZhName":"��ѯ����","isNotNull":"true"},{"paramsEnName":"listIndex","paramsZhName":"�б���ʾ����","initValue":"0","isNotNull":"false"},{"paramsEnName":"queryNo","paramsZhName":"���߱��","isNotNull":"true"}]','[{"paramsEnName":"ProjectId","paramsZhDesc":"������Ŀ"},{"paramsEnName":"UnitId","paramsZhDesc":"������λ"},{"paramsEnName":"EquipmentName","paramsZhDesc":"��������"},{"paramsEnName":"SizeModel","paramsZhDesc":"���ߴ�"},{"paramsEnName":"FactoryCode","paramsZhDesc":"��������"},{"paramsEnName":"CertificateCode","paramsZhDesc":"�ϸ�֤��"},{"paramsEnName":"ProvidedDate","paramsZhDesc":"��������"},{"paramsEnName":"EnableYear","paramsZhDesc":"��Ч����"},{"paramsEnName":"ApprovalPerson","paramsZhDesc":"���������"},{"paramsEnName":"ScanUrl","paramsZhDesc":"����ɨ���"},{"paramsEnName":"AprovalCode","paramsZhDesc":"������鵥λ"}]',1,2,10,'select    ProjectId  ,   UnitId  ,   EquipmentName  ,   SizeModel  ,   FactoryCode  ,   CertificateCode  ,   ProvidedDate  ,   EnableYear  ,   ApprovalPerson  ,   ScanUrl ,    AprovalCode  ,   AprovalNumber  ,   AprovalState     from HSSE_QualityAudit_EquipmentQuality   where  projectId = @project_Id and CertificateCode = @query_No','ͨ��ɨ��������롾���߱�š�����ʵ���ߵĻ�����Ϣ(������λ���������ڡ��������Һͺͼ�����Ϣ)��',0)
 GO
INSERT INTO Sys_Query(QueryId,QueryName,InputParams,OutputParams,QueryType,QueryFlag,Sort,QuerySql,AppQueryDesc,IsDelete) 
VALUES ('B380596C-CA38-471A-8A18-74F8E1CC40B4','���ֳ���ѹ����ѯ���˶ԡ�','[{"paramsEnName":"projectId","paramsZhName":"��ĿId","isNotNull":"true"},{"paramsEnName":"queryPk","paramsZhName":"��ѯ����","isNotNull":"true"},{"paramsEnName":"listIndex","paramsZhName":"�б���ʾ����","initValue":"0","isNotNull":"false"},{"paramsEnName":"queryNo","paramsZhName":"���߱��","isNotNull":"true"}]','[{"paramsEnName":"ISO_ID","paramsZhDesc":"���߱��"},{"paramsEnName":"PTP_TestPackageNo","paramsZhDesc":"��ѹ���"},{"paramsEnName":"PTP_TestPackageCode","paramsZhDesc":"��ѹ����"},{"paramsEnName":"PTP_TestPackageName","paramsZhDesc":"ϵͳ����"},{"paramsEnName":"PTP_TestHeat","paramsZhDesc":"����ѹ��"},{"paramsEnName":"PTP_TestService","paramsZhDesc":"�������"},{"paramsEnName":"PTP_TestAmbientTemp","paramsZhDesc":"���黷���¶�"},{"paramsEnName":"PTP_TestMediumTemp","paramsZhDesc":"��������¶�"},{"paramsEnName":"PTP_TestType","paramsZhDesc":"��������"},{"paramsEnName":"PTP_Finisher","paramsZhDesc":"�깤��"},{"paramsEnName":"PTP_FinishDate","paramsZhDesc":"�깤ʱ��"},{"paramsEnName":"PTP_Tabler","paramsZhDesc":"������"},{"paramsEnName":"PTP_TableDate","paramsZhDesc":"����ʱ��"},{"paramsEnName":"PTP_Modifier","paramsZhDesc":"�޸���"},{"paramsEnName":"PTP_ModifyDate","paramsZhDesc":"�޸�����"},{"paramsEnName":"PTP_Auditer","paramsZhDesc":"�����"},{"paramsEnName":"PTP_AduditDate","paramsZhDesc":"�������"}]',3,4,10,'select  PW.ISO_IsoNo as ISO_ID,TT.PTP_TestPackageNo,PTP_TestPackageCode,PTP_TestPackageName,PTP_TestHeat,PTP_TestService,  PTP_TestAmbientTemp,PTP_TestMediumTemp,PTP_TestType,PTP_Finisher,PTP_FinishDate,SU.UserName as PTP_Tabler,PTP_TableDate,  US.UserName as PTP_Modifier,PTP_ModifyDate,PTP_Auditer,PTP_AduditDate  from HJGL_TP_IsoList TI  left join HJGL_TP_TestPackage TT on TI.PTP_ID = TT.PTP_ID  left join HJGL_PW_IsoInfo PW on TI.ISO_ID = PW.ISO_ID  left join Sys_User SU on SU.UserId = TT.PTP_Tabler  left join Sys_User US on US.UserId = TT.PTP_Modifier  where TI.ISO_ID in (select ISO_ID from HJGL_PW_IsoInfo where projectId = @project_Id and ISO_IsoNo = @query_No)','ͨ��ɨ��������롾���ߺš���ѯ�ù�����������ѹ������ѹ�����Ϣ��',0) 
GO
INSERT INTO Sys_Query(QueryId,QueryName,InputParams,OutputParams,QueryType,QueryFlag,Sort,QuerySql,AppQueryDesc,IsDelete) 
VALUES ('B4CE3E14-A4AE-4287-8CF5-E96B12F147C3','�������ϸ���Ŀ��Ϣ��ѯ��','[{"paramsEnName":"projectId","paramsZhName":"��ĿId","isNotNull":"true"},{"paramsEnName":"queryPk","paramsZhName":"��ѯ����","isNotNull":"true"},{"paramsEnName":"listIndex","paramsZhName":"�б���ʾ����","initValue":"QualifiedProjectCode,WED_Code,WED_Name","isNotNull":"false"},{"paramsEnName":"queryNo","paramsZhName":"���֤��","isNotNull":"true"}]','[{"paramsEnName":"QualifiedProjectCode","paramsZhDesc":"�ϸ���Ŀ����"},{"paramsEnName":"WED_Code","paramsZhDesc":"��������"},{"paramsEnName":"WED_Name","paramsZhDesc":"��������"},{"paramsEnName":"IdentityCard","paramsZhDesc":"���֤��"},{"paramsEnName":"LimitDate","paramsZhDesc":"��Ч����"},{"paramsEnName":"GTAWMax","paramsZhDesc":"GTAW�����"},       {"paramsEnName":"SMAWMax","paramsZhDesc":"SMAW�����"},{"paramsEnName":"DiaMin","paramsZhDesc":"��С�ھ�"}]',3,16,11,'select WelderQualifiedProject.WelderQualifiedProjectId,         Welder.WED_Name,          Welder.WED_Code,          WelderQualifiedProject.QualifiedProjectCode,         CONVERT(varchar(100), WelderQualifiedProject.LimitDate, 23) as LimitDate,          WelderQualifiedProject.GTAWMax,          WelderQualifiedProject.SMAWMax,          WelderQualifiedProject.DiaMin          from HJGL_BS_WelderQualifiedProject as WelderQualifiedProject  left join HJGL_BS_Welder as Welder on Welder.WED_ID=WelderQualifiedProject.WED_ID  WHERE Welder.ProjectId=@project_Id and Welder.IdentityCard=@query_No','ͨ��ɨ��������롾���֤�š���ѯ�ú����Ļ�����Ϣ��',0)
 GO
INSERT INTO Sys_Query(QueryId,QueryName,InputParams,OutputParams,QueryType,QueryFlag,Sort,QuerySql,AppQueryDesc,IsDelete) 
VALUES ('D3B6517A-52DA-479C-82A5-653C8C109A0A','�����ӽ��Ⱥ�������ѯ���˶ԡ�','[{"paramsEnName":"projectId","paramsZhName":"��ĿId","isNotNull":"true"},{"paramsEnName":"queryPk","paramsZhName":"��ѯ����","isNotNull":"true"},{"paramsEnName":"listIndex","paramsZhName":"�б���ʾ����","initValue":"0","isNotNull":"false"},{"paramsEnName":"queryNo","paramsZhName":"���߱��","isNotNull":"true"}]','[{"paramsEnName":"ISO_IsoNo","paramsZhDesc":"���߱��"},{"paramsEnName":"baw_areano","paramsZhDesc":"��������"},{"paramsEnName":"bsu_unitcode","paramsZhDesc":"��λ����"},{"paramsEnName":"bsu_unitname","paramsZhDesc":"��λ����"},{"paramsEnName":"maxdate","paramsZhDesc":"�������"},{"paramsEnName":"total_jot","paramsZhDesc":"�ܺ���"},{"paramsEnName":"total_sjot","paramsZhDesc":"Ԥ���ܺ�����"},{"paramsEnName":"total_fjot","paramsZhDesc":"��װ�ܺ�����"},{"paramsEnName":"finished_total_jot","paramsZhDesc":"����ܺ���"},{"paramsEnName":"finished_total_sjot","paramsZhDesc":"Ԥ������ܺ�����"},{"paramsEnName":"finished_total_fjot","paramsZhDesc":"��װ����ܺ�����"},{"paramsEnName":"cut_total_jot","paramsZhDesc":"�г�����"},{"paramsEnName":"finisedrate","paramsZhDesc":"��ɱ���/����"},{"paramsEnName":"finisedrate_s","paramsZhDesc":"Ԥ����ɱ���/����"},{"paramsEnName":"finisedrate_f","paramsZhDesc":"��װ��ɱ���/����"},{"paramsEnName":"total_din","paramsZhDesc":"�����ܴ���"},{"paramsEnName":"total_Sdin","paramsZhDesc":"Ԥ���ܴ���"},{"paramsEnName":"total_Fdin","paramsZhDesc":"��װ�ܴ���"},{"paramsEnName":"finished_total_din","paramsZhDesc":"����ܴ���"},{"paramsEnName":"finished_total_Sdin","paramsZhDesc":"Ԥ������ܴ���"},{"paramsEnName":"finished_total_Fdin","paramsZhDesc":"��װ����ܴ���"},{"paramsEnName":"finisedrate_din","paramsZhDesc":"��ɱ���/����"},{"paramsEnName":"finisedrate_din_s","paramsZhDesc":"Ԥ����ɱ���/����"},{"paramsEnName":"finisedrate_din_f","paramsZhDesc":"��װ��ɱ���/����"},{"paramsEnName":"total_film","paramsZhDesc":"����Ƭ��"},{"paramsEnName":"pass_film","paramsZhDesc":"�ϸ�Ƭ��"},{"paramsEnName":"passreate","paramsZhDesc":"�ϸ���"},{"paramsEnName":"ext_total_film","paramsZhDesc":"��͸��Ƭ��"},{"paramsEnName":"ext_pass_film","paramsZhDesc":"��͸�ϸ�Ƭ��"},{"paramsEnName":"ext_passreate","paramsZhDesc":"��͸�ϸ���"},{"paramsEnName":"point_total_film","paramsZhDesc":"�����Ƭ��"},{"paramsEnName":"point_pass_film","paramsZhDesc":"��ںϸ�Ƭ��"},{"paramsEnName":"point_passreate","paramsZhDesc":"��ںϸ���"},{"paramsEnName":"cut_total_film","paramsZhDesc":"�г���Ƭ��"},{"paramsEnName":"cut_pass_film","paramsZhDesc":"�г��ϸ�Ƭ��"},{"paramsEnName":"ext_jot","paramsZhDesc":"��͸����"},{"paramsEnName":"point_jot","paramsZhDesc":"�������"},{"paramsEnName":"trust_total_jot","paramsZhDesc":"ί������"},{"paramsEnName":"check_total_jot","paramsZhDesc":"����̽��"},{"paramsEnName":"total_repairjot","paramsZhDesc":"�ܷ�����"},{"paramsEnName":"source_rate","paramsZhDesc":"Ҫ�����"},{"paramsEnName":"trustrate","paramsZhDesc":"ί�б���"},{"paramsEnName":"checkrate","paramsZhDesc":"��̽����"}]',3,5,15,'EXEC HJGL_sp_rpt_iso_analyze null,@query_No,null,null,null','ͨ��ɨ��������롾���߱�š���ѯ�ù��ߵĺ��ӽ��Ⱥ�������������ֳ���ʱ�˶ԡ�',0) 
GO

INSERT INTO dbo.Base_Module (module_id,module_type,module_name,is_show)
VALUES ('67BF2119-EA34-48F8-9901-C0A959F90DE7',1,'ʩ����ȫ����APP',1)
GO
INSERT INTO dbo.Base_Module (module_id,module_type,module_name,is_show)
VALUES ('12AC48F8-75A3-4867-8BCD-DBC05D85A817',2,'ʩ����������APP',1)
GO
INSERT INTO dbo.Base_Module (module_id,module_type,module_name,is_show)
VALUES ('A1431AA0-9C77-430C-865A-F29EF49DAEFF',3,'������������APP',1)
GO

--HSSE_Hazard_HazardRegisterTypes
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) 
VALUES('0cb4043c-2461-46f9-b9cc-d0ceef9939df','��Ȼ��������ȡ��Ӧ��ʩ','501',2,5,'',NULL)  
GO
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) 
VALUES('0EDAE644-DA8B-49F1-9AA4-6EF4F11F67BD','���а���λ�쵼���ӻᡢHSEר��ᡢ����Э�������Ƿ�Խ��׶α���λ��ȫ�������ƽ��з���������ν�����ڵ������Ƿ�������۲���ȷ���β��ź�����Ҫ��','6',3,1,'������Ҫ',NULL) 
GO
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) 
VALUES('1122D210-39D5-4C5A-B10E-67BD6CD9ECB3','���а���λ�ش�ʩ�����������ı��ơ���ˡ�������ʵʩ�Ƿ���Ϲ涨','19',3,2,'���ֳ�������ؼ�¼',NULL)  
GO
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) 
VALUES('1381bd4a-b74f-48e9-9b55-f28406f65117','�����������ļ�ִ��','403',2,4,'1����������2������ִ��',NULL)  
GO
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) 
VALUES('14a0cca0-d9f7-40bc-82e7-10256b535399','���⹤�ֳ�֤���','102',2,1,'',NULL)  
GO
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) 
VALUES('17F0550E-2B43-4132-A782-1631B6542306','���ڼ���ǰ�󿪸�����ȫ���������Ƿ�����ذ��źͲ��ã��Ƿ����ʵʩ','10',3,1,'����ؼ�¼',NULL)  
GO
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) VALUES('1fb18723-b800-45f9-96fd-67045568e88b','��װ��ҵ','3',1,NULL,NULL,'1') ;
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) VALUES('2029B471-5A81-4CB8-BD20-D64DAD72BBD6','�Ƿ��ڲ����ڲμӻ��㵥λ�������һ��ȫ����Ի����ǰ�����Ŀ�չ������м�顢ָ��','7',3,1,'����ʩ����־',NULL) ;
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) VALUES('2034e6c6-3e09-4cb2-9b87-8cd49ec42f7e','����','19',1,NULL,NULL,'1') ;
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) VALUES('20a5b715-c739-43b6-a3fc-80fec338899c','�豸����','15',1,NULL,NULL,'1') ;
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) VALUES('21253a36-1dde-4ed8-abaa-470ac0a11eb6','���޿ռ�','16',1,NULL,NULL,'1') ;
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) VALUES('23a36c8c-9e3d-4d4d-9562-3d78d668849f','������ҵ','8',1,NULL,NULL,'1') ;
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) VALUES('2A1CE5F8-C696-4785-AF75-ACA198D64C15','���а���λHSEĿ�ꡢָ��ֽ���ʵ���','2',3,1,'������ļ�',NULL) ;
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) VALUES('42FEA50B-E21E-4B17-BF63-D6A623916376','���а���λHSE��ϵ�Ƿ����ơ�������Դ�Ƿ���ʵ���ƶȽ����Ƿ�����','18',3,2,'������ļ������ֳ�',NULL) ;
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) VALUES('4644954e-4668-4176-a133-5609ab7c64c3','��ʱ�õ�','12',1,NULL,NULL,'1') ;
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) VALUES('4c81310d-0150-4c38-b631-0491ae7168b1','���ּ�','9',1,NULL,NULL,'1') ;
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) VALUES('57849043-F64D-4343-AD17-F64A2060B44C','���а���λ�쵼��ȫ�а�������չ��������ɲ����л��㰲ȫ�а����Ƶ���Ƿ���ϳа��ƻ��������Ƿ���ʵ��Ч��չ','9',3,1,'��а������ƻ���ʵʩ��¼',NULL) ;
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) VALUES('598CC4AD-F38A-41A7-A6CD-9E30E0C45A1F','���а���λ������֯�����HSE�����з��Ӽල�������ã����а���λԱ���Ͷ�������ְҵ���������Ƿ������Ϲ�','20',3,2,'���ֳ�������ؼ�¼',NULL) ;
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) VALUES('5aebe6e2-e975-4666-86e4-df267dde69e0','������ʶ','104',2,1,'',NULL) ;
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) VALUES('618AB14A-FF5C-4910-9421-F8A072B9F4E3','���а���λHSE����ʶ�������Ϳ���״�����ر����ش���չܿ�����������ʶ�����̡��ش���ճа���ʵ��������ո�֪�����ճа���ʾ���','4',3,1,'��ʩ�������ֳ�������ؼ�¼',NULL) ;
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) VALUES('6253B63B-F5F7-4D64-83E0-2DF78EE1CE8A','���������ֹ������ֹ�ҵ��Χ�ڵ�HSE��Ҫ������ͻ����������Ҫ���','17',3,2,'����ؼ�¼',NULL) ;
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) VALUES('65CE5D51-FC4B-498D-AEA2-90A74D6919D9','���а���λ��ʵ��˾��Ȱ�ȫ�������龫���������Ƿ��о���Ĳ���Ͱ���','1',3,1,'������Ҫ���ļ����ƻ��ͷ���',NULL) ;
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) VALUES('719342EF-4ACA-48E5-A496-2878046D2D25','���а���λӦ������������Ӧ��Ԥ�����޶�������������Ƿ����Ҫ��','13',3,2,'����ؼ�¼',NULL) ;
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) VALUES('7537C8A7-B9D3-4F00-901D-D526ECA45EE9','���а���λһ���ֵġ����ء�������ְ������Ƿ�֪�������ء��Ĺ������ݺ�Ҫ��','3',3,1,'Ѷ�ʡ���̸������ؼ�¼',NULL) ;
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) VALUES('7b091bbc-1270-4490-a418-adbcd8657fd0','��������','301',2,3,'1������2��ʹ��3��̨��',NULL) ;
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) VALUES('7D7230DD-B6FF-470C-BF5D-5BE7C005508B','���а���λ�쵼�����»��㰲ȫ���鿪չ������ص��顰���ء��ڼ䰲ȫ�������','8',3,1,'������ؼ�¼',NULL) ;
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) VALUES('85a06721-c367-435d-905f-f78f05987778','�����볡����','201',2,2,'1����ۼ���2������֤���ļ�3������',NULL) ;
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) VALUES('8a42aed7-e4a6-45cc-9423-bb0dcb7e0cea','��������','103',2,1,'',NULL) ;
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) VALUES('908c3ae4-49cd-4c17-b39a-d5c09cf1aeb3','��ű���','202',2,2,'1�����ࡢ��ʶ2���ѷ�3��ɫ��4���濾��',NULL) ;
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) VALUES('9226bdab-94ca-4906-ab93-7406217ae2e9','������','6',1,NULL,NULL,'1') ;
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) VALUES('9556a932-d657-4121-9cba-3c59332e6158','��Ʒ����','601',2,6,'',NULL) ;
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) VALUES('975b8867-023d-466d-9b78-8db032290c50','��ȫͨ��','2',1,NULL,NULL,'1') ;
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) VALUES('a2aeee07-39da-4599-a932-7a4a2c5c0186','PPE','1',1,NULL,NULL,'1') ;
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) VALUES('a3222e78-eb23-4e52-9509-61c71f702ff9','��������','14',1,NULL,NULL,'1') ;
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) VALUES('a94f1eb6-b165-4d60-b31b-8783d0bdfe2d','��Ա����','13',1,NULL,NULL,'1') ;
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) VALUES('ac25ec0d-af27-4bf8-b79d-72c88ce6f249','������ҵ','10',1,NULL,NULL,'1') ;
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) VALUES('afb023c4-49f8-494a-968b-f5abf97d4e7f','�ȴ�����ҵ','20',1,NULL,NULL,'1') ;
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) VALUES('B085C17C-1D4F-4ACB-AEFB-76A7F0EF2390','���а���λ�ڽڼ��ռ��������ʱ���쵼�ɲ��ֳ������ƶ�ִ�����','5',3,1,'���Ĵ����¼',NULL) ;
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) VALUES('B248AC5E-79CD-4DB0-AE58-6436F3F66945','���а���λHSEר�������ȡ��ʹ���Ƿ�ר��ר�á�����Ϲ棬���а���λ�Ƿ�HSE�������뾭��������','22',3,2,'���������',NULL) ;
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) VALUES('B6B5B70C-2C6C-43CC-AE57-3F30127CBBA1','���а���λHSE��ѵ��չ���','11',3,1,'����ؼ�¼',NULL) ;
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) VALUES('b9a15752-3545-4b45-a285-91cdea368908','����ʩ��','17',1,NULL,NULL,'1') ;
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) VALUES('BE7786A9-3264-4FE6-A858-DC51ACC3AE92','���а���λ����֯�����HSE��������ñ�֤�ල���ã��Ƿ��о�����ж�','16',3,2,'���ֳ�������ؼ�¼',NULL) ;
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) VALUES('c0c97679-c292-4957-a534-7a1101239082','����Χ��','7',1,NULL,NULL,'1') ;
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) VALUES('c308ae13-a543-403f-b2f7-59d845803098','�ʱ���ϵ��Ա���ڵ�λ����֤���','101',2,1,'',NULL) ;
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) VALUES('c65eda41-bf7b-44c4-a6f1-ed78074fa851','��ҵƽ̨','18',1,NULL,NULL,'1') ;
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) VALUES('C960A346-AF55-4AE1-9328-82B9AEB04ACD','���а���λ�ڿ�չЧ�ܼ��ʱ���Ƿ�HSE��������Ч�ܼ�췶Χ','21',3,2,'����ؼ�¼',NULL) ;
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) VALUES('ca230861-3f88-4817-9aa6-97bd8a28a367','�����������ļ�����','402',2,4,'1��ͼֽ����2����ƽ���3����������4��ר�������',NULL) ;
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) VALUES('CAC44DA0-15B6-4CCC-A09A-8665A34768D2','���а���λ�Ƿ��HSE������Ϊ����˼�빤������Ҫ����','15',3,2,'����ؼ�¼',NULL) ;
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) VALUES('d1cc27da-acd7-4230-be73-d2324606b62c','�ٱ߶���','11',1,NULL,NULL,'1') ;
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) VALUES('D2B153DB-7878-42B8-B437-CBD5147F7C29','���а���λ�쵼�����Ƿ����С�һ��˫�𣬵���ͬ�𡱵İ�ȫ����ְ��','14',3,2,'���ֳ�����ؼ�¼',NULL) ;
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) VALUES('deabf3d6-0cd4-4300-9908-87c1e72d5f01','�ߴ���ҵ','5',1,NULL,NULL,'1') ;
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) VALUES('e4bc771c-f040-46b4-baaf-283ab7010a6c','ʹ��','203',2,2,'1������2����׷����',NULL) ;
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) VALUES('ea6a3105-c524-4a19-9242-7e7ee8c3be87','�Ϸ��Ϲ���','401',2,4,'1��ִ�з��ɷ����׼�淶����ļ�2����Ŀ��������ļ�',NULL) ;
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) VALUES('f844e83c-2da3-4e6a-9194-def31c4f84c0','������ҵ','4',1,NULL,NULL,'1') ;
INSERT INTO dbo.HSSE_Hazard_HazardRegisterTypes(RegisterTypesId,RegisterTypesName,TypeCode,HazardRegisterType,GroupType,Remark,IsPunished) VALUES('FB0F0B8C-F403-4763-A9A2-2AD474DA6A79','���а���λ�ְ�����������ر��ǺϷ��Ϲ�ְ����ְ��ؼ���Ա���ڵ�λ��������齨�����','12',3,1,'���ֳ�������ؼ�¼',NULL) ;
--����
INSERT INTO dbo.HSSE_Weather(WeatherId,WeatherStatus) VALUES(	1,'��');
INSERT INTO dbo.HSSE_Weather(WeatherId,WeatherStatus) VALUES(	2,'��');
INSERT INTO dbo.HSSE_Weather(WeatherId,WeatherStatus) VALUES(	3,'С��');
INSERT INTO dbo.HSSE_Weather(WeatherId,WeatherStatus) VALUES(	4,'������');
INSERT INTO dbo.HSSE_Weather(WeatherId,WeatherStatus) VALUES(	5,'Сѩ');
INSERT INTO dbo.HSSE_Weather(WeatherId,WeatherStatus) VALUES(	6,'��ѩ');
INSERT INTO dbo.HSSE_Weather(WeatherId,WeatherStatus) VALUES(	7,'˪��');
INSERT INTO dbo.HSSE_Weather(WeatherId,WeatherStatus) VALUES(	8,'��');
INSERT INTO dbo.HSSE_Weather(WeatherId,WeatherStatus) VALUES(	9,'�ﳾ');
INSERT INTO dbo.HSSE_Weather(WeatherId,WeatherStatus) VALUES(	10,'ɳ����');
GO



--����ר��������
INSERT INTO dbo.HSSE_Check_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex)
VALUES('0BDE0BAF-4633-4864-90EF-AD9FF7266FC8','��ҵ���֤���','0','1','false',10)
GO

INSERT INTO dbo.HSSE_Check_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex)
VALUES('B4B5CF58-2DE6-4086-B5FA-2CA3F11A3178','������Ϊ���','0','2','false',20)
GO

INSERT INTO dbo.HSSE_Check_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex)
VALUES('72B74888-8190-40B4-8C5D-9344F44C9683','�ֳ���ҵ���̼��','0','3','false',30)
GO

INSERT INTO dbo.HSSE_Check_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex)
VALUES('448B443C-B477-4C67-AAFA-DB03A0C5D17F','������ҵ���֤','0BDE0BAF-4633-4864-90EF-AD9FF7266FC8','1A','true',40)
GO

INSERT INTO dbo.HSSE_Check_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex)
VALUES('14F2DA76-A9A9-4CAD-ADFE-D9C42F6AEF63','������ҵ���֤','0BDE0BAF-4633-4864-90EF-AD9FF7266FC8','1B','true',50)
GO

INSERT INTO dbo.HSSE_Check_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex)
VALUES('29828709-D103-413D-902F-1CDB90E2CFC1','��ʱ�õ���ҵ���֤','0BDE0BAF-4633-4864-90EF-AD9FF7266FC8','1C','true',60)
GO

INSERT INTO dbo.HSSE_Check_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex)
VALUES('48F06310-5C74-4696-8249-3F5E1863D90C','���ּ�ʹ�����֤','0BDE0BAF-4633-4864-90EF-AD9FF7266FC8','1D','true',70)
GO

INSERT INTO dbo.HSSE_Check_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex)
VALUES('366AC069-60BB-4D0A-A049-63CCCAEFC48C','���ص�װ��ҵ���֤','0BDE0BAF-4633-4864-90EF-AD9FF7266FC8','1E','true',80)
GO

INSERT INTO dbo.HSSE_Check_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex)
VALUES('D61D5E9C-3378-4FC1-83F6-FB4F66B2EAC5','������ҵ���֤','0BDE0BAF-4633-4864-90EF-AD9FF7266FC8','1F','true',90)
GO

INSERT INTO dbo.HSSE_Check_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex)
VALUES('B57C6ECB-1891-49EC-9D21-1DF4FD07C9B1','���޿ռ���ҵ���֤','0BDE0BAF-4633-4864-90EF-AD9FF7266FC8','1G','true',100)
GO

INSERT INTO dbo.HSSE_Check_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex)
VALUES('2C0660F9-D093-46E8-93E9-1D01D05EF718','�¿���Ŀ��ȫ���֤','0BDE0BAF-4633-4864-90EF-AD9FF7266FC8','1H','true',110)
GO

INSERT INTO dbo.HSSE_Check_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex)
VALUES('A321A0E8-C438-4AAD-BDA1-460083ECDBF7','�ߴ���ҵ���֤','0BDE0BAF-4633-4864-90EF-AD9FF7266FC8','1I','true',120)
GO

INSERT INTO dbo.HSSE_Check_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex)
VALUES('A3E0CB1E-FC5D-4C8F-B76D-E9E21311C184','�ٱ�(���ڡ��ʵǡ�����)��ҵ���֤','0BDE0BAF-4633-4864-90EF-AD9FF7266FC8','1J','true',130)
GO

INSERT INTO dbo.HSSE_Check_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex)
VALUES('79211283-4A46-4321-BF6E-0C349F24C16D','Σ�ջ�ѧ��Ʒʹ�����֤','0BDE0BAF-4633-4864-90EF-AD9FF7266FC8','1K','true',140)
GO

INSERT INTO dbo.HSSE_Check_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex)
VALUES('B1758ADE-5B0C-40EC-B400-5C382EDCF4CA','HSE��֯������������ϵ����','B4B5CF58-2DE6-4086-B5FA-2CA3F11A3178','2A','true',150)
GO

INSERT INTO dbo.HSSE_Check_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex)
VALUES('803A5E17-7DF1-4B6D-9409-E0E0F5D39DDD','�ֳ���ȫ����/��ʩ����涨','B4B5CF58-2DE6-4086-B5FA-2CA3F11A3178','2B','true',160)
GO

INSERT INTO dbo.HSSE_Check_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex)
VALUES('B8F280FA-3CAC-43FD-98AE-B759FCD8287D','���˷�����Ʒʹ��','B4B5CF58-2DE6-4086-B5FA-2CA3F11A3178','2C','true',170)
GO

INSERT INTO dbo.HSSE_Check_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex)
VALUES('DE7930B3-94A0-44AE-8479-39592EC9BAAB','HSE�����뾯ʾ����','B4B5CF58-2DE6-4086-B5FA-2CA3F11A3178','2D','true',180)
GO

INSERT INTO dbo.HSSE_Check_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex)
VALUES('D3ADAF1D-7799-42E9-BBFD-EB89D93DBED6','HSE��ѵ����֤�ϸ�','B4B5CF58-2DE6-4086-B5FA-2CA3F11A3178','2E','true',190)
GO

INSERT INTO dbo.HSSE_Check_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex)
VALUES('5AEB3327-BA14-4405-A687-B30AAA81D5A8','��ʱ�ÿ�HSE����','B4B5CF58-2DE6-4086-B5FA-2CA3F11A3178','2F','true',200)
GO

INSERT INTO dbo.HSSE_Check_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex)
VALUES('6FF1023B-FCDE-4EC5-9778-439CA1D1D0D7','�ֳ�������������','B4B5CF58-2DE6-4086-B5FA-2CA3F11A3178','2G','true',210)
GO

INSERT INTO dbo.HSSE_Check_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex)
VALUES('A44B1736-4563-4773-8C2D-140C6A76F103','HSE������������������','B4B5CF58-2DE6-4086-B5FA-2CA3F11A3178','2H','true',220)
GO

INSERT INTO dbo.HSSE_Check_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex)
VALUES('0DE6C919-02AD-4297-B6E1-D0D60C31DEA7','�ֳ�HSEӦ������','B4B5CF58-2DE6-4086-B5FA-2CA3F11A3178','2I','true',230)
GO

INSERT INTO dbo.HSSE_Check_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex)
VALUES('1AFA2D62-681A-4D58-86FA-E40C8B13DD88','HSE��Ϣ����涨','B4B5CF58-2DE6-4086-B5FA-2CA3F11A3178','2J','true',240)
GO

INSERT INTO dbo.HSSE_Check_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex)
VALUES('F7AA4D86-D92A-4683-B7AD-A11BF9D9EA5B','ʩ���ӡ����鰲ȫ�����','B4B5CF58-2DE6-4086-B5FA-2CA3F11A3178','2K','true',250)
GO

INSERT INTO dbo.HSSE_Check_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex)
VALUES('889BE6F2-C413-4EC5-8F42-6CAA3EB2724D','����ʩ�������鰲ȫ�����','B4B5CF58-2DE6-4086-B5FA-2CA3F11A3178','2L','true',260)
GO

INSERT INTO dbo.HSSE_Check_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex)
VALUES('8A6E4DD8-8433-4080-8F91-A538EA8F0CFE','ְҵ��������','B4B5CF58-2DE6-4086-B5FA-2CA3F11A3178','2M','true',270)
GO

INSERT INTO dbo.HSSE_Check_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex)
VALUES('DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','�õ����','72B74888-8190-40B4-8C5D-9344F44C9683','3A','true',280)
GO

INSERT INTO dbo.HSSE_Check_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex)
VALUES('52AD156A-C6A6-4FFB-B9BD-7A1588E4CD0A','������ҵ��ȫ����','72B74888-8190-40B4-8C5D-9344F44C9683','3B','true',290)
GO

INSERT INTO dbo.HSSE_Check_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex)
VALUES('0CD8C338-07B9-4AE3-A2A6-04485098FE91','�������','72B74888-8190-40B4-8C5D-9344F44C9683','3C','true',300)
GO

INSERT INTO dbo.HSSE_Check_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex)
VALUES('FD18318D-CF10-47A9-86C5-CC066B5119B3','���ּܹ���','72B74888-8190-40B4-8C5D-9344F44C9683','3D','true',310)
GO

INSERT INTO dbo.HSSE_Check_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex)
VALUES('EC986070-16BF-4343-8850-252D9A747358','�ߴ���ҵ����','72B74888-8190-40B4-8C5D-9344F44C9683','3E','true',320)
GO

INSERT INTO dbo.HSSE_Check_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex)
VALUES('82884781-F5B6-4623-A0BC-112DCA6665D9','������ҵ����','72B74888-8190-40B4-8C5D-9344F44C9683','3F','true',330)
GO

INSERT INTO dbo.HSSE_Check_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex)
VALUES('99431E70-833A-464D-8066-E41E230646DA','������ҵ��ȫ����','72B74888-8190-40B4-8C5D-9344F44C9683','3G','true',340)
GO

INSERT INTO dbo.HSSE_Check_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex)
VALUES('77205883-AE5F-4047-8241-6922A2CCE6C4','���޿ռ���ҵ��ȫ����','72B74888-8190-40B4-8C5D-9344F44C9683','3H','true',350)
GO

INSERT INTO dbo.HSSE_Check_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex)
VALUES('8DC2F97B-CB4F-4848-B528-6A8155C26771','��ƿ��ȫ����','72B74888-8190-40B4-8C5D-9344F44C9683','3I','true',360)
GO

INSERT INTO dbo.HSSE_Check_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex)
VALUES('C9288081-8BD3-4949-A9C6-6320F827D35B','Σ����Ʒ����','72B74888-8190-40B4-8C5D-9344F44C9683','3J','true',370)
GO

INSERT INTO dbo.HSSE_Check_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex)
VALUES('10A8AF77-8103-422D-AE72-FAEB058C4770','�����豸����','72B74888-8190-40B4-8C5D-9344F44C9683','3K','true',380)
GO

INSERT INTO dbo.HSSE_Check_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex)
VALUES('B8940917-27F4-438A-BA8E-744B54691F09','��������','72B74888-8190-40B4-8C5D-9344F44C9683','3L','true',390)
GO

INSERT INTO dbo.HSSE_Check_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex)
VALUES('E6635238-4A3D-4101-B8E2-8356CBF046C2','������������','72B74888-8190-40B4-8C5D-9344F44C9683','3M','true',400)
GO

INSERT INTO dbo.HSSE_Check_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex)
VALUES('18D13FB6-0B9D-4CB0-AC3C-AAA67F27F419','������ȫ����','72B74888-8190-40B4-8C5D-9344F44C9683','3N','true',410)
GO



--����������
INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('20900CE0-1993-4800-8775-52F4FDDD0143','448B443C-B477-4C67-AAFA-DB03A0C5D17F','��������ҵ�ļ�������/��ʩ�������������λ',10)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('192906F1-2155-4AD5-9D47-E166D0A786E8','448B443C-B477-4C67-AAFA-DB03A0C5D17F','������ҵǰ������������ʵ��˵�λ������й�HSE��ʩ������������ҵ��Ա����HSE������HSE�������׺󷽿�ʩ��',20)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('103953E3-85B9-4063-BDA0-538E074B6DD9','448B443C-B477-4C67-AAFA-DB03A0C5D17F','��ȷʩ��������ʡ�ˮ�ġ����¹���ˮ����',30)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('FD94D84B-A417-4054-8F00-DFA05B10E835','448B443C-B477-4C67-AAFA-DB03A0C5D17F','��ȷ��عܵ������¡�������ʩ',40)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('F1E5D1AF-AC3E-403E-9077-E9B694E7F12A','448B443C-B477-4C67-AAFA-DB03A0C5D17F','��ȷ�����õ������Ա�־�����ʺ͵��������õĳ��ڹ۲��',50)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('1D5E572E-1F38-466E-93D8-E80F7465C26B','448B443C-B477-4C67-AAFA-DB03A0C5D17F','��ȷ���²����ɰ������',60)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('5986D8D5-8ECA-4C80-BC2C-2495C520D1D2','448B443C-B477-4C67-AAFA-DB03A0C5D17F','������ҵƱҪ������͵������ι�����������ֳ���ʶ����ȷ������ҵ�ķ�Χ��ʩ������',70)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('F12B2ADF-3C34-49EE-AEE5-1F9181E4A5FF','448B443C-B477-4C67-AAFA-DB03A0C5D17F','������װ�á�������ʩ����Ӧ��ר�˸���໤',80)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('BB15FD0C-1110-4018-9EE6-0655FDE2525B','448B443C-B477-4C67-AAFA-DB03A0C5D17F','������ҵ��Ա�Ƿ�������������֮һҪ��ʱ���棬��ͬ����ܼ�����ҵ��a)��Ҫռ�ù滮��׼��Χ����ĳ��أ�b)�����𻵵�·�����ߡ��������ʵ�ͨѶ�ȹ�����ʩ�ģ�c)��Ҫ��ʱͣˮ��ͣ�硢�жϵ�·��ͨ�ģ�d)��Ҫ���б��Ƶġ�',90)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('63F5F0B6-E1AE-45E0-9817-398CF0103617','448B443C-B477-4C67-AAFA-DB03A0C5D17F','�ڵ�·��(����������)���ɲ�װ�á�������ʩ��ʱ��Ӧ���ֳ���Χ���������ƣ�ҹ��Ӧ�辯ʾ��',100)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('ACB485AE-0649-436F-929B-85E4888F8635','448B443C-B477-4C67-AAFA-DB03A0C5D17F','���ڵع����ӡ���ʱ�����ݿ�����Ȱ��涨��ȡ���»�ӹ̵�ר�Ŵ�ʩ����ֹ̮�����ˣ���Ӧ������Χ����Χ���;����־��ҹ�����ƾ�ʾ��',110)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('827B6FF5-4FC1-44DA-BA14-B10C2A45848B','14F2DA76-A9A9-4CAD-ADFE-D9C42F6AEF63','�ж�����ҵ�ļ�������/��ʩ�������������λ',120)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('AF93F228-1D59-4B17-84B5-B7AF2877F0F8','14F2DA76-A9A9-4CAD-ADFE-D9C42F6AEF63','������ҵ��Ա�ϸ�ǰ�����밴�涨�����ϸ�ǰ�Ķ���ȫ���������ն�����ҵ�İ�ȫ����֪ʶ������ʹ����������',130)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('2711B5D3-CF0D-47DD-BE70-379A5B96B4C9','14F2DA76-A9A9-4CAD-ADFE-D9C42F6AEF63','������ҵ��Ա�Ƿ���Ϥ��Χ�����ͳ���·��',140)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('7BCDFB08-00C7-4193-BBEB-FD16B3F97BED','14F2DA76-A9A9-4CAD-ADFE-D9C42F6AEF63','������ҵ��ʩ���ֳ������밴�涨�����������ģ�������������·��ͨ',150)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('7E1C5703-386F-4B3B-9E05-E81A2CEBE93C','14F2DA76-A9A9-4CAD-ADFE-D9C42F6AEF63','������ҵ��λ�����Ƿ��п�ȼ����ȼ���ױ���Ʒ���Ƿ���������ȡ����Ч�İ�ȫ������ʩ',160)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('47842163-042E-4A5B-AD48-9D49D0A0E923','14F2DA76-A9A9-4CAD-ADFE-D9C42F6AEF63','���ⲿ�����Ĺܵ����豸���Ƿ������������',170)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('88E8255A-D474-47A4-86FE-7FB05BDE137D','14F2DA76-A9A9-4CAD-ADFE-D9C42F6AEF63','�����Ƿ�����������ҵ��ִ��Ĺ�������ҵ',180)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('2DFA56AB-801B-4F5F-879A-304717F395CA','14F2DA76-A9A9-4CAD-ADFE-D9C42F6AEF63','���п�ȼ���ױ������������б��ƺʹ�����ҵʱ���Ƿ��Ѷ��ֳ��Ŀ�ȼ���ױ����庬�����з����кϸ�',190)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('D651EBAB-E825-4609-9096-3C43D63AFB45','14F2DA76-A9A9-4CAD-ADFE-D9C42F6AEF63','�Ƿ�����������ҵ����Ҫ��',200)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('8E296E80-E9ED-46BD-A252-35E0FA407E3F','14F2DA76-A9A9-4CAD-ADFE-D9C42F6AEF63','�Ƿ�����߿���ҵ����Ҫ��',210)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('A30AA4B5-759F-4804-AD75-9F5ECEEB41E7','29828709-D103-413D-902F-1CDB90E2CFC1','���岼�߹淶������������ʱ�õ缼������/��ʩ��Ҫ��',220)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('83BC3116-8028-4C64-92D1-3CE451A9F659','29828709-D103-413D-902F-1CDB90E2CFC1','��/�������ֲ��������ڵ������á���������ɿ���������������',230)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('3BC4A468-4B8E-41D0-BC21-E715244A9798','29828709-D103-413D-902F-1CDB90E2CFC1','������������·����ѹ�ȼ�����Ҫ�󣬲��Ժϸ���·����λ�á��߶ȡ�֧�ŷ���Ҫ��',240)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('01AFADBA-6F7A-4215-9CF5-EEE9354C02CD','29828709-D103-413D-902F-1CDB90E2CFC1','����Ԫ�����õ��豸����·��������������Ҫ��',250)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('0B3EDCA4-5598-4BED-9490-9A7BD51412C9','29828709-D103-413D-902F-1CDB90E2CFC1','��������װ��©�籣����������������Ҫ�����õ��¡����߽������Ҫ�󣬿��ص��������໥ƥ��',260)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('0FC369CF-A331-4AA5-82B6-8DF6A9925662','29828709-D103-413D-902F-1CDB90E2CFC1','����䡢������ı�������(�ӵ�)��ʩ��ȷ�淶��������࣬�������������',270)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('32E962C0-CC90-4AFE-8ED6-79A0107DD2DE','29828709-D103-413D-902F-1CDB90E2CFC1','������·����ͷ��Ե���ã�����Ƥ��©������',280)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('752D7F3C-5E46-4782-933F-5B47AFEDFBC4','29828709-D103-413D-902F-1CDB90E2CFC1','�����豸�������ã��з��������ʩ���й淶���ɿ��Ľ��㡢�ӵش�ʩ',290)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('F345D6B5-C78D-441C-8452-C0C7A8B0C22C','29828709-D103-413D-902F-1CDB90E2CFC1','��װ��ʱ��·����Ա�е繤֤',300)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('7C27769D-4828-4CC6-9E71-E5AC03D4EF2B','29828709-D103-413D-902F-1CDB90E2CFC1','���������Χ����������������Ҫ�󣻲�����ά��ͨ���������ӵء������ظ��ӵط���Ҫ��',310)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('67E9E7F5-97DE-475D-ADDB-82C9614C4904','48F06310-5C74-4696-8249-3F5E1863D90C','���ּ���������ȶ��ԣ�����ʩ����������/��ʩ��Ҫ��',320)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('C1588ECA-04B6-4FFB-BB15-ECED1C538A47','48F06310-5C74-4696-8249-3F5E1863D90C','���ּ����˼���2m,���˼���1.6m,��ҵ�洦С��˼���1m',330)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('0E89DFD9-5BCF-40E8-AE42-40EDF3092135','48F06310-5C74-4696-8249-3F5E1863D90C','ɨ�ظ���ȫ,��Ҫʱ����Ҫ�е��',340)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('A1C53824-C683-4C84-88C6-9EEF2B35F882','48F06310-5C74-4696-8249-3F5E1863D90C','���ּ���������ͨ��,�ݽ�(̤��)����400mm',350)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('E854751B-8D8D-4EA3-AF01-183CEE8C9281','48F06310-5C74-4696-8249-3F5E1863D90C','��ҵ����������,��������������ȡ�600mm',360)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('E4BE11E3-90A7-4BA3-BC18-9937AED09F07','48F06310-5C74-4696-8249-3F5E1863D90C','���ּ���ҵ������Ԥ�����ڷ�����λ',370)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('A8AD3B4D-E9E2-46A0-9D82-DE0913A76BFE','48F06310-5C74-4696-8249-3F5E1863D90C','���ּ���ҵ��,¥�ݼ�Ȼ���Ϊ˫����,�����ø߶�:��һ��������400mmΪ��,�ڶ���������1mΪ��',380)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('F76A6D99-B784-434D-8E50-3509AC463413','48F06310-5C74-4696-8249-3F5E1863D90C','�ۼ���ֹ������ɽ�����,���˼���ͷ����',390)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('031AF968-0EE2-4FD7-90E6-D2C8EE2F0F02','48F06310-5C74-4696-8249-3F5E1863D90C','�����š��׳š��̶��˴�����ȫ',400)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('C9F121A4-2051-4BF2-92F1-C6E1DA37B170','48F06310-5C74-4696-8249-3F5E1863D90C','���ͽ��ּܽӵط���Ҫ��',410)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('6395B9A9-24EC-4E9B-AACC-D4FF813C1132','48F06310-5C74-4696-8249-3F5E1863D90C','���ּ��ܹ�����ʩ��(����)��Ҫ��',420)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('84A2B5DA-0660-4E98-9323-43EA2771E7AB','366AC069-60BB-4D0A-A049-63CCCAEFC48C','�и����װ��ҵ�ļ�������/��ʩ,�����涨�����˽���',430)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('CD86C50D-E202-47B0-9E68-E975FC38E5D1','366AC069-60BB-4D0A-A049-63CCCAEFC48C','���ػ�е��װ���ܵ���ã����������װҪ��',440)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('1D9BC5C7-84E0-4F99-BCE6-7AD098C3E2F1','366AC069-60BB-4D0A-A049-63CCCAEFC48C','���ػ�е˾����������ҵ��Ա��֤�ϸ�',450)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('CD2D63F5-E6F6-45F0-A329-4E49E1AF5406','366AC069-60BB-4D0A-A049-63CCCAEFC48C','������ҵ�����Ͷ�������Ʒ��ȫ����λ���ܹ�����ʩ��Ҫ��',460)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('BABC5D6F-6FD1-445A-A0F3-353FED97BBE6','366AC069-60BB-4D0A-A049-63CCCAEFC48C','���ص�װָ�Ӻ�˾���ԡ�ʮ�������͸��Ը�λ��ȫ�ɲ����������',470)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('35D3AD57-4E1C-4FD8-9532-1B4AE67EE78D','366AC069-60BB-4D0A-A049-63CCCAEFC48C','�����Լ�ϸ�',480)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('97EFD3FD-9EF2-45D7-8D22-87B62AC986E1','366AC069-60BB-4D0A-A049-63CCCAEFC48C','רҵ����ϸ�',490)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('D81F93D7-9725-48B9-85EE-3E79A436A8C7','366AC069-60BB-4D0A-A049-63CCCAEFC48C','��ع���λ���ϼ��ϸ�',500)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('0A1BFF93-CEDA-4DB9-9AA7-A354142B4772','D61D5E9C-3378-4FC1-83F6-FB4F66B2EAC5','ʹ�÷���Դ������Ӧ�İ�ȫ������ʩ�����¹�Ӧ��Ԥ������Ӧ��Ӧ����ʩ���豸',510)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('0323C0AB-618A-425E-B560-6D77DDC0CCC0','D61D5E9C-3378-4FC1-83F6-FB4F66B2EAC5','����ʩ����ҵǰ����������ҵʱ�䡢�ص㡢���ݡ������ʩ�����ڸõص㼰�����ܷ�����ҵ���ܷ��䵽��ʩ����ҵ��Ա�������',520)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('A9E9F659-4C03-48F3-8FDD-CC2C39AC82AA','D61D5E9C-3378-4FC1-83F6-FB4F66B2EAC5','�����в��������ҵʩ����ȫ����Ա���������ҵʱ�䡢�ص㡢���ݡ���ʩ��ʩ����������ʩ���¹�Ӧ����ʩ��',530)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('5AE4E4AC-0A68-4FFF-B9D9-FD32B6ADBB4E','D61D5E9C-3378-4FC1-83F6-FB4F66B2EAC5','����ʩ����ҵʩ����������������ô�С���Ϲ涨Ҫ�󣬡���-����������Ŀ(������ʩ����ҵ���Ӻ�ɫ��ʾ��)������ר�˸���໤',540)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('AA622D3A-4C85-4D40-B51A-90AA8B4F255D','D61D5E9C-3378-4FC1-83F6-FB4F66B2EAC5','����ʩ����ҵ��ʹ�õ��豸�ȷ����йع涨Ҫ��',550)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('B25A79CB-549B-49F9-A448-97D4167CB725','D61D5E9C-3378-4FC1-83F6-FB4F66B2EAC5','����ʩ����ҵ��Ա�����ȷ����йع涨Ҫ��',560)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('4F300DCB-786B-4EE4-B28D-E065FC77B1D0','B57C6ECB-1891-49EC-9D21-1DF4FD07C9B1','�н����޿ռ���ҵ��������/��ʩ�������������λ',570)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('54A720FC-3CF4-4411-B8DD-BF8AEA2D91CE','B57C6ECB-1891-49EC-9D21-1DF4FD07C9B1','���������޿ռ�����ϵ�ķ��š����߼�ä��Ͽ������й��մ�ɨ����',580)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('67EFB3D1-59D2-44A0-BC94-8E0F22A8E0CB','B57C6ECB-1891-49EC-9D21-1DF4FD07C9B1','ʢװ����ȼ�к�Һ�塢��������޿ռ䣬�������ȼ���壬���䱬ը����>4%ʱŨ��Ӧ<0.5%����ը����<4%ʱŨ��Ӧ<2%������19.5%~23.%Ϊ�ϸ��ж��к����ʲ��������ҹ涨�ġ�����������ж��к����ʵ��������Ũ�ȡ�ָ��',590)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('64B33809-C9C8-4451-BB5B-B89DF0AE9974','B57C6ECB-1891-49EC-9D21-1DF4FD07C9B1','���޿ռ��ͨ������Ȼͨ����Сʱ���ϣ���Ҫʱ����ǿ��ͨ�������������������޿ռ��ڶ���ȱ��ʱ���Ͻ���ͨ������������',600)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('8DD20933-A830-44E8-B823-8FEAD2F7F0AD','B57C6ECB-1891-49EC-9D21-1DF4FD07C9B1','ʹ�ò������𻨵Ĺ��ߣ�ʹ���ֳֵ綯����Ӧ��©�籣��',610)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('735D0042-A51F-404E-9DCC-4BCA68201749','B57C6ECB-1891-49EC-9D21-1DF4FD07C9B1','������������޿ռ�Ҫ�жϵ�Դ���ڿ����Ϲҡ����˼��ޣ���ֹ��բ����־�ƣ���������ר�˼໤',620)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('A0D6743F-9183-41E0-9A0A-1C8666694B22','B57C6ECB-1891-49EC-9D21-1DF4FD07C9B1','��������Ӧʹ�ð�ȫ��ѹ�����߾�Ե���á��ر�ʪ�����ͽ������޿ռ�����ҵ���еƵ�ѹӦ12V���»�ʹ��1:1�����ѹ��',630)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('BA8F697C-F960-4F31-B13B-FCBB6C9F5622','B57C6ECB-1891-49EC-9D21-1DF4FD07C9B1','�������޿ռ�����ҵ����������ר�˼໤�����涨�������緽�����źţ����޿ռ������������ϰ����֤��ͨ����',640)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('7B0D34E2-BB33-4F51-8845-23C9FDE4BB6F','B57C6ECB-1891-49EC-9D21-1DF4FD07C9B1','��ҵ��Ա���봩���ϰ�ȫ�涨���Ͷ�������װ�ͷ�������',650)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('1B149431-DBD6-4FBD-B831-47EF58B02B8D','B57C6ECB-1891-49EC-9D21-1DF4FD07C9B1','�Ͻ�ʹ�õ����������������ҵ��Ա',660)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('940A90E4-F42F-48A7-8C69-C85E34457F56','B57C6ECB-1891-49EC-9D21-1DF4FD07C9B1','ʢװ�ܲ����Ծ�������޿ռ�Ҫ�󰴹涨��������ۺ�������',670)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('6E15FE1F-5AA4-408F-B686-6E757E0A8CEE','B57C6ECB-1891-49EC-9D21-1DF4FD07C9B1','���޿ռ����䱸һ��������Ӧ���Ȼ��þߺ�һ���������������',680)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('C919BF5F-48E4-42D4-8DB7-884D1C6744D9','B57C6ECB-1891-49EC-9D21-1DF4FD07C9B1','��ҵǰ��Ǽ������Ա�����ߡ����ϵȣ���ֹ���������޿ռ���',690)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('9531CC02-FB0F-4CF9-A6E0-8CB224E1C14B','B57C6ECB-1891-49EC-9D21-1DF4FD07C9B1','�Խ����޿ռ���ҵ��Ա���໤�˽��а�ȫӦ�������Ȼ������ȷ������������ȷÿ���˵�ְ��',700)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('3464F684-BCDF-4BA5-A65B-47AB8EECBB07','2C0660F9-D093-46E8-93E9-1D01D05EF718','�и���Ŀʩ����ҵ�ļ�������/��ʩ',710)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('4C6791A8-416E-4465-8C00-5E4998D64339','2C0660F9-D093-46E8-93E9-1D01D05EF718','��ҵǰ�����չ涨�����˼������׺���Ӧ�İ�ȫ����(����)',720)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('8E1C765A-78A7-4F14-BAC9-0B814F24B165','2C0660F9-D093-46E8-93E9-1D01D05EF718','ʩ����ҵ��Ա�Ͷ�������Ʒ�䱸��λ�����ϸ���Ŀʩ����ҵ��Ҫ��',730)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('3F7BD28A-0146-4822-9979-6AF5C85994F2','2C0660F9-D093-46E8-93E9-1D01D05EF718','��ʵ�˸���Ŀʩ����ҵ�İ�ȫ����������Ӧ��������',740)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('2BE8EA0D-85EC-4E08-BFB7-B423F7F19791','2C0660F9-D093-46E8-93E9-1D01D05EF718','������Ŀ���û�����ɨ�����롢��������ϸ�',750)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('F82127A5-1FC0-4395-91BC-FD06D742B397','2C0660F9-D093-46E8-93E9-1D01D05EF718','����ʩ����Ա�Ľ����������ϸ��ռ���ʩ��Ҫ����У����м��޵���Ӧ����',760)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('06A8CCDD-A51A-4799-9FBE-CF334078A342','A321A0E8-C438-4AAD-BDA1-460083ECDBF7','�иߴ���ҵ��������/��ʩ�������������λ',770)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('47443105-B3C8-47A4-839E-01D59B216B05','A321A0E8-C438-4AAD-BDA1-460083ECDBF7','��ҵ��Ա������������Ҫ��',780)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('FDD2402D-4B96-4AEF-B6D2-346F49B90CDD','A321A0E8-C438-4AAD-BDA1-460083ECDBF7','��ҵ��Ա��װ���Ϲ���Ҫ�������ȫ����Я���й��ߴ�',790)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('382B979C-1D07-4DA0-BDC3-FFC3127DC332','A321A0E8-C438-4AAD-BDA1-460083ECDBF7','��ҵ��Ա��� A������ʽ������ B������ʽ������',800)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('C0691603-7DDC-4803-9369-8919CAE579A8','A321A0E8-C438-4AAD-BDA1-460083ECDBF7','�ֳ�����Ľ��ּܡ�����Χ�����ϰ�ȫ���',810)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('68D036AC-8483-4699-84D6-BE2D217398FF','A321A0E8-C438-4AAD-BDA1-460083ECDBF7','��ֱ�ֲ���ҵ�м��и�����ʩ',820)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('B03C209B-427F-4709-9D6E-6B4528385C06','A321A0E8-C438-4AAD-BDA1-460083ECDBF7','���ӻ����ݷ��ϰ�ȫ�涨',830)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('56A18A12-1055-421D-8A19-6B9A5C0D9FB7','A321A0E8-C438-4AAD-BDA1-460083ECDBF7','��ʯ���ߵȲ�����������ҵӦ���貢վ�ڹ̶����ذ���',840)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('D66B349C-18CC-4631-9786-A166DC6F2A58','A321A0E8-C438-4AAD-BDA1-460083ECDBF7','�ߴ���ҵ�г�����������װ��ʱ�ƹ淶������',850)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('6B238AAF-28C5-4F7C-95C9-2CB82F9C40AE','A321A0E8-C438-4AAD-BDA1-460083ECDBF7','�ؼ��ߴ���ҵ����ͨѶ����',860)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('239509AE-751E-47F3-800D-E213E39E40D8','A3E0CB1E-FC5D-4C8F-B76D-E9E21311C184','�и���Ŀ��ҵ��������/��ʩ�������������λ',870)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('1A4F7A8E-82CA-4B04-89B7-590CEB87F76E','A3E0CB1E-FC5D-4C8F-B76D-E9E21311C184','��ҵ��Ա������������Ҫ��',880)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('73B491BB-27BA-4AB5-8B8F-B4B968410A3B','A3E0CB1E-FC5D-4C8F-B76D-E9E21311C184','��ҵ��Ա��װ���Ϲ���Ҫ�������ȫ����Я�����ߴ�',890)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('3FC25B82-FE6F-406A-9F60-D2D3B00755FE','A3E0CB1E-FC5D-4C8F-B76D-E9E21311C184','��ҵ���г�����������װ��ʱ�ƹ淶������',900)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('3971E0BC-7FB5-49C2-BB6C-B96AF3667C01','A3E0CB1E-FC5D-4C8F-B76D-E9E21311C184','�ؼ��ߴ���ҵ����ͨѶ����',910)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('0F6C44C6-6033-4F14-BDC1-1B08760EE65B','A3E0CB1E-FC5D-4C8F-B76D-E9E21311C184','�����ٱ���ҵ֮3�����Ҫ��',920)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('1CDBA1E6-CBF0-4BC6-B004-DD6D021FB7C5','A3E0CB1E-FC5D-4C8F-B76D-E9E21311C184','���϶�����ҵ֮5�����Ҫ��',930)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('5EBE4302-5D3C-41CD-8FC8-3FDF582FCF8F','A3E0CB1E-FC5D-4C8F-B76D-E9E21311C184','�����ʵ���ҵ֮6�����Ҫ��',940)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('FDD25720-79ED-470C-A075-907C8BF203CB','A3E0CB1E-FC5D-4C8F-B76D-E9E21311C184','����������ҵ֮2�����Ҫ��',950)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('84C26759-2DE8-4425-9F06-03583BA769C5','79211283-4A46-4321-BF6E-0C349F24C16D','��ʹ��Σ�ջ�ѧ��Ʒ�ļ�������/��ʩ�������������λ',960)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('613B27CB-0552-41EC-AB39-8144A7F26344','79211283-4A46-4321-BF6E-0C349F24C16D','��ҵ��Ա�Ƿ����ʹ��Σ����Ʒ����',970)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('0C93FEF6-BA48-4A2E-9C3C-0858A0089040','79211283-4A46-4321-BF6E-0C349F24C16D','�Ƿ��˽�����Σ����Ʒ�����ܡ�������̺ͷ�����ʩ',980)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('336A2E4B-5AB9-442F-921F-7CC6381D617E','79211283-4A46-4321-BF6E-0C349F24C16D','��ҵ��Ա���˷�����Ʒ�Ƿ�ѡ�ú���',990)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('35F149AE-0FAA-4DC1-993F-D4C538500036','79211283-4A46-4321-BF6E-0C349F24C16D','�ֳ��Ƿ�߱����ַ�����ʩ',1000)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('74B54AB9-DD13-4F37-8AB0-77826D7A1A36','79211283-4A46-4321-BF6E-0C349F24C16D','��ʹ�õĹ����Ƿ�ȫ�ɿ�',1010)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('E6BC7BA0-3A3E-4493-9555-AA209CA0BE89','79211283-4A46-4321-BF6E-0C349F24C16D','��Ŀλ���Ƿ����þ�ʾ��־��Χ�辯ʾ��',1020)
GO

--HSSE������Ϊ����
 INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('D9CBD92D-2620-464A-9CEF-8229A01AB6EB','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','�Ƿ������ʱ�õ�ʩ����֯��ƣ��Ƿ������ʱ�õ�Ʊ��',1030)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('45B59E53-26CD-4A5A-A9D4-96D9D40B7097','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','��ʱ�õ��Ƿ����TN��S����������ϵͳ��',1040)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('4C43E6CA-DB9B-45C8-811C-923509349767','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','�Ƿ�ʵ��������硢����������������һ��һբһ��������',1050)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('CB90F4D0-30B2-4A3D-B6AE-FE8EEA177E5D','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','�����Ƿ��ص������裻�Ƿ��������ľ����ּ��ϣ�',1060)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('B9467DF2-1707-4087-8C60-3461343EF15F','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','���½�ͷ�Ƿ��ι̿ɿ�����Ե���á���ȡ������ʩ������Ŀ�ľ����ƣ�',1070)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('28DC1137-631C-4A70-8806-D0EB4B3C127A','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','������ֹܡ����ּܡ��ܵ�֮���Ƿ��Ե�����������ý���˿�������£�',1080)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('0328CAF9-5539-44E7-A068-5EC840E33C14','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','�����Ϳ����������Ƿ���������������ȴ���1.5mm��',1090)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('7374A38B-54FC-4094-A6A1-9720E6D95CE6','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','�Ƿ�����ý���˿������˿��Υ������',1100)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('B442004C-83BB-438E-B2DD-36C44A2DE160','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','�����Ϳ�������߿ںͳ��߿��Ƿ�����������棬��Դ���������Ƿ����ˮ��ͷ��',1110)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('6C684E7C-25A3-4397-B187-698A09E5889B','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','���߶�ͷ�Ƿ������˨���ӻ�ѹ�ӣ��Ƿ���ڽ�о��ֱ�ӹ��ڵ�Դ�����ϵ�����',1120)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('9A40909C-984C-4E5C-9777-FC59D1B779AB','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','�Ӵ��������صȣ��Ƿ������Ӵ����ÿɿ�����ͷ�Ƿ�����ʴ����',1130)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('440B466E-46CD-47E4-B50B-1FCEC25C376A','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','�����Ϳ������Ƿ���ꡢ���������š�������',1140)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('BA8D99DB-965A-4A78-8E0B-11B50F7523EF','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','��������ÿ·�Ƿ�װ��©�籣������',1150)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('B5015C44-D032-4C8B-AC62-B08BDF52AFC7','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','�Ƿ����������Ϳ�����©�籣������©�����Ӧ������30��A,�©�綯��ʱ��ӦС��0.1S��',1160)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('22349C64-B2AB-440A-BB9C-812F09FE6E0A','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','�ƶ�ʽ���ֳ�ʽ�綯�����Ƿ�װ��©�綯������������15mA���©�綯��ʱ��С��0.1S��©�籣������',1170)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('D9542FB7-462E-49F4-BE74-6AF12917884D','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','�ƶ�ʽ���ֳ�ʽ�綯���ߵ�Դ���Ƿ����ͭо�������£�',1180)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('4D330906-70A8-48FD-BD5A-8BEB47D71F6A','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','��С�����ػ����丽�����Ƿ����ܶϵ翪�أ�',1190)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('FB003CD0-2046-45CC-9CF0-79F2F9D00304','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','�ֳ������еƵ�ѹ�Ƿ񳬹�36V��',1200)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('5C70449B-3C8C-49EC-8B16-7FC5B2260775','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','���������ڼ���ʪ������ʹ�õ��еƣ����ѹ�Ƿ񳬹�12V��',1210)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('75D6EA13-12FD-405A-AE00-14B569F9C198','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','�纸������Ƿ�ӵؿɿ����Ƿ��̨�����ӵأ�',1220)
GO
INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('287B1022-DE1D-4411-812F-95085D348B8D','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','�纸��һ�β�ĵ�Դ���Ƿ��Ե���ã��䳤���Ƿ����5�ף�	',1230)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('33AF2677-02F5-49FE-8559-A4010AA2437F','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','�纸�����β��������Ƿ������Ƥ��Եͭо����£��䳤���Ƿ����30m��',1240)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('5702F223-FF15-4C5D-889D-31E6B6ED7B77','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','�������ߺͱ��������Ƿ�����õ���о�ߣ�',1250)
GO
INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('F01EC02A-7310-4047-A517-E21A87E8A549','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','�ֳ���������ĵ�ѹϵͳ����ѹ����ѹ�����Ե��Ƿ�ֱ�ӽӵأ���ӵص����Ƿ����4����',1260)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('1F87772A-6BB7-4DC0-9C4F-3CA251614268','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','���õ��豸��صĵ纸�����������巿����ƽ̨���������ܵ��Ƿ��������ӵر�����',1270)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('91B29B1C-1322-4A0A-95F3-3C5E47854702','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','�õ��豸�ı������߻򱣻������Ƿ�����',1280)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('208DC3D1-DDB2-4DAE-AED9-8473496FDCAE','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','�õ��豸�ı������߻򱣻������Ƿ���ú��ӡ�ѹ�ӡ���˨���ӻ������ɿ��������ӣ�',1290)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('BE73E705-D436-4EDD-90F2-1126A9BD79F6','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','�Ƿ񱣴����Զ����ص�����¼�����У���¼���ӵص�����Լ�¼��',1300)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('BE1EED85-19A8-4CEE-89E0-6935FA79B007','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','�Ƿ��е繤�ռ��¼���Ұ�ʱ���㣻',1310)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('B34CB203-538C-47F2-9385-533F015ECC51','52AD156A-C6A6-4FFB-B9BD-7A1588E4CD0A','�Ƿ����������ҵ����Ʊ��',1320)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('97DFC510-66B9-4BEE-9309-E12BF25AB2AF','52AD156A-C6A6-4FFB-B9BD-7A1588E4CD0A','��ҵƱ�Ƿ����������ҵ��ƽ��λ�á���Ⱥͷ�Χ����ҵ�ֶΣ���е���˹����ڣ����Ƿ��赥λ������˾���ܳа���λ�����׼��',1330)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('6B914C6B-7089-498A-8635-4CB2BC08F90E','52AD156A-C6A6-4FFB-B9BD-7A1588E4CD0A','��ҵǰ�Ƿ�Ե������ι��̺͵�������������������',1340)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('64EA3AA1-2734-4E77-87B3-59619FE7BA1C','52AD156A-C6A6-4FFB-B9BD-7A1588E4CD0A','��ҵǰ�Ƿ��ƶ�ʩ����������ʵHSE�����ʩ��',1350)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('B9FE4AA5-5995-47B9-8B1B-623F3D2E50F3','52AD156A-C6A6-4FFB-B9BD-7A1588E4CD0A','ʩ����λ�Ƿ���ȷ��ҵ�ֳ�HSE�����ˣ���ʩ�����̵İ�ȫ��ҵȫ�渺��',1360)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('DBA711E2-B33F-4CC9-9524-0F61F1ABF6AB','52AD156A-C6A6-4FFB-B9BD-7A1588E4CD0A','������װ�á�������ʩ��ʱ���Ƿ���ר�˸���໤��',1370)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('4396E81E-4591-46DC-967B-644B739CEF1F','52AD156A-C6A6-4FFB-B9BD-7A1588E4CD0A','����ǰ����ҵ��λ�Ƿ�������ʵ��˵�λ������й�HSE��ʩ������������ҵ��Ա����HSE������HSE�������ף�',1380)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('1206407F-2D26-4CCF-9B84-A3F007EDD294','52AD156A-C6A6-4FFB-B9BD-7A1588E4CD0A','��ҵ��Ա����ҵ���Ƿ񰴹涨��װ������Ͷ�������Ʒ��',1390)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('974D952C-0251-411A-A2EC-9E5A439D26FF','52AD156A-C6A6-4FFB-B9BD-7A1588E4CD0A','�ڵ�·�ϡ�����װ�á�������ʩ��ʱ���Ƿ����ֳ���Χ���������ƣ�',1400)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('48BB029D-9C1E-4EF5-818E-34EA5239164C','52AD156A-C6A6-4FFB-B9BD-7A1588E4CD0A','ҹ�䶯����ҵʱ�Ƿ��辯ʾ�ƣ�',1410)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('B854FA85-94BB-4585-AF44-56290589C50E','52AD156A-C6A6-4FFB-B9BD-7A1588E4CD0A','��׼������ҵ��ɺ�ʩ����λ�Ƿ������ҵƱҪ������͵������ι�����������ֳ���ʶ����ȷ������ҵ��Χ��ʩ��������',1420)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('BD4E6F26-335E-48D0-B1ED-91B887735FDD','52AD156A-C6A6-4FFB-B9BD-7A1588E4CD0A','�ڵ��¹ܵ������µȲ����ʱ���Ƿ�ʹ�û�е���ڣ�',1430)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('9E8390F1-46EF-490B-B0EC-8AD991D88518','52AD156A-C6A6-4FFB-B9BD-7A1588E4CD0A','��������Ԥ�ϲ����ĵ����豸���ܵ������¼��������ɱ���������ʱ���Ƿ�����ֹͣ��ҵ�����潨�赥λ����������ٽ�����ҵ��',1440)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('F4E7F7A3-B7B8-4CA8-9193-901D8827D695','52AD156A-C6A6-4FFB-B9BD-7A1588E4CD0A','�����ж����к�����������ʵ�����ʱ���Ƿ�����ֹͣ��ҵ����ʱ���Ϸ����룬�����泧������',1450)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('245BD81C-DE03-45B3-A801-E34CCF051934','52AD156A-C6A6-4FFB-B9BD-7A1588E4CD0A','��ȷ��Ϊ�к����������ʱ���Ƿ񰴽����豸��ҵҪ�����Ʊ֤��������ҵʱҪ��ȡ������ʩ������ר�˼໤��',1460)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('4DC17FE3-FC82-404C-9F8F-0A1C5E2EDE2B','0CD8C338-07B9-4AE3-A2A6-04485098FE91','�Ƿ��������ҵ����Ʊ��',1470)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('5BA5D95C-E1E9-4D15-849E-16C778A81F66','0CD8C338-07B9-4AE3-A2A6-04485098FE91','�Ƿ�ȷ�������������������Ч�Բ����ں���λ�ã�',1480)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('CCC3A185-751D-4859-9953-5A8C2B6120D6','0CD8C338-07B9-4AE3-A2A6-04485098FE91','�Ƿ��ʹ���������ģ���Ϥ����Ԥ������ҵ�����Ͱ�ȫ����·�ߣ�',1490)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('A4FE62F3-B118-4DD8-8559-F8F0A3AD2953','0CD8C338-07B9-4AE3-A2A6-04485098FE91','�Ƿ�һ���û�Ʊֻ��һ���û���ҵ��',1500)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('C34ADBFB-69F0-4AA9-AB30-8B3CF30EC4BA','0CD8C338-07B9-4AE3-A2A6-04485098FE91','�û�Ʊ�Ƿ����û�ִ��������Я����',1510)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('3043EDAA-C5DA-4C6B-BB72-73215EB44441','0CD8C338-07B9-4AE3-A2A6-04485098FE91','�Ƿ��ϸ�ִ�С��������𡱣�',1520)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('D172A2F6-788B-425B-A924-31A4D0C53E75','0CD8C338-07B9-4AE3-A2A6-04485098FE91','�û���ҵ�������Ƿ���ȷ���޻����������жϵ�Դ�󷽿��뿪�ֳ���',1530)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('05096855-B601-495A-90B8-8AA04D233929','0CD8C338-07B9-4AE3-A2A6-04485098FE91','�̶�ʩ���û����Ƿ������������ġ�ɰ�ء�����ˮԴ����������ͨ����ͨ��',1540)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('70E83E78-EAF4-4FDD-944A-9E44AA152F29','0CD8C338-07B9-4AE3-A2A6-04485098FE91','��ȼ�ױ�����ʩ��������ҵǰ�Ƿ��ȡ��Ǩ�����롢�û�����ϴ�����������ʪ�ȡ���ǿͨ��ȷ����ʩ��',1550)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('1037C3E3-74C3-46E4-8861-F0857578F29E','0CD8C338-07B9-4AE3-A2A6-04485098FE91','�ߴ�������ҵ�Ƿ����÷�ֹ�𻨷ɽ�׹�����ʩ���������·��Ŀ�ȼ���ȼ���е�豸�����¡���ƿ�Ȳ�ȡ�ɿ��ķ�����ʩ��',1560)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('C9C9B882-0252-4DD0-B7EC-2199948C437A','0CD8C338-07B9-4AE3-A2A6-04485098FE91','�ߴ�������ҵ�Ƿ������ʩ��ͬʱ���д�ֱ������ҵ��',1570)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('F4AE7DA3-7FA0-45EA-AE00-A6966DD440CB','0CD8C338-07B9-4AE3-A2A6-04485098FE91','�ߴ��纸��벻�����ҵ��Ա��δ������ҵλ��֮ǰ���Ƿ�����Դ��',1580)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('D4DC4573-E3B3-4D46-9F90-C74CE96A1ADF','0CD8C338-07B9-4AE3-A2A6-04485098FE91','ʹ����ƿ�Ĺ����Ƿ���ѵ���˺ϸ񣬳�֤�ϸڣ�',1590)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('A03B7635-17AE-4654-97F0-81EC6B952428','0CD8C338-07B9-4AE3-A2A6-04485098FE91','��Ȳƿ�Ƿ������ȹ̣�ʹ��ʱ�Ƿ�װ�������',1600)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('48FE0E6A-31B4-4C61-9D3E-964F595B2DB6','0CD8C338-07B9-4AE3-A2A6-04485098FE91','����ƿ������Ȳƿ����ȼ��ƿ������Ƿ����10�ף�',1610)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('F32C2075-E496-4BDC-AC5F-FE535BD6B7FF','FD18318D-CF10-47A9-86C5-CC066B5119B3','����ǰ���Ƿ����ʩ��Ҫ������跽����',1620)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('D9276F82-C04A-45B5-A6E2-45AB8D394D9D','FD18318D-CF10-47A9-86C5-CC066B5119B3','���ּ��Ƿ�ѡ���⾶48��51mm,�ں�Ϊ3��3.5mm�ĸֹܣ�',1630)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('3808F29E-1549-4495-8944-11AE9D9B9A5C','FD18318D-CF10-47A9-86C5-CC066B5119B3','���ְ���������Ƿ���8�Ŷ�п��˿��',1640)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('6FCD12A3-004A-4B54-A98A-6B6450CEE1E7','FD18318D-CF10-47A9-86C5-CC066B5119B3','��ҵ��Ա�Ƿ�ȡ��������ҵ����֤��������״�����ϸߴ���ҵ��Ҫ��',1650)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('6F574A3D-585C-45BA-8676-F63B8A4863D5','FD18318D-CF10-47A9-86C5-CC066B5119B3','���ͺ�������ּ�ʩ���������Ƿ���Ŀ���������ˡ�ҵ��������˾���ܳа�������������ҵ��Ա�������ף�',1660)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('C3E69E25-561B-4A3E-A211-F5E0D852F402','FD18318D-CF10-47A9-86C5-CC066B5119B3','���ͺ�������ּ�ʩ���������Ƿ�����ҵ��Ա�������ף�',1670)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('DD9D4C1A-14E2-42BF-AD34-65AA5E7D5ED2','FD18318D-CF10-47A9-86C5-CC066B5119B3','�ڵ�����·����������ּ�ʱ���Ƿ�����߱��ֹ涨�İ�ȫ���룻',1680)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('A6B315F2-D5C6-42E4-9A9E-7C98BBF296D3','FD18318D-CF10-47A9-86C5-CC066B5119B3','��ҵ�����Ƿ����þ�ʾ��������ҵ��Ա�������ڣ�',1690)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('1033D022-64BE-4FAF-91A6-D0AD6A2A2EDC','FD18318D-CF10-47A9-86C5-CC066B5119B3','�ڴ�����ּܹ����У�����ְ塢��δ�������������Ƿ���;ֹͣ��ҵ��',1700)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('D7845732-45D5-4A04-8F50-177BC775C943','FD18318D-CF10-47A9-86C5-CC066B5119B3','�ӵ������ʱ���ػ��Ƿ�ƽ������ʵ��',1710)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('1C926BD6-1D6C-43F7-B35D-4FDA73C16368','FD18318D-CF10-47A9-86C5-CC066B5119B3','�ӵ������ʱ���Ƿ�����ɨ�ظ��ֲ��ػ��Ĳ��㣻',1720)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('7D8F4314-EB19-443F-BE5D-F057711D5B2A','FD18318D-CF10-47A9-86C5-CC066B5119B3','���ּ��Ƿ���¶����������γɵ���ʽ��',1730)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('AE27596B-44F9-45DD-8662-CD0A518B907B','FD18318D-CF10-47A9-86C5-CC066B5119B3','���ּ������Ƿ��ȶ��ι̣�����ҡ�ڻζ���',1740)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('A73206BC-2FE9-419D-A9AD-D991100F0846','FD18318D-CF10-47A9-86C5-CC066B5119B3','�ӵ������������������ּ���ҵ�棬�Ƿ����������Ӻ�ͨ����',1750)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('FDB5E915-E08A-417A-9080-B4E442B58F18','FD18318D-CF10-47A9-86C5-CC066B5119B3','���ּܵ���ҵ����ְ��Ƿ����̣�����Ӧ�ι̣�̽ͷ��ĳ��ȡ�300mm��',1760)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('4D94E21E-5702-4F40-BFA7-F01A4E6900BE','FD18318D-CF10-47A9-86C5-CC066B5119B3','���ּܵ��ߵ���ƽ̨��࣬�Ƿ����õ��Ű壻',1770)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('A6C816AD-B3EE-46E9-93A9-103FEE729516','FD18318D-CF10-47A9-86C5-CC066B5119B3','������ϣ��Ƿ�֪ͨHSE���ܲ��źͽ��ּ�ʹ�õ�λ��������ͬ������գ���ȷ�Ϻϸ���д�����ּܽ������յ�������ǩ��ȷ�ϣ��ҡ����ּ������պϸ� �ƺ󷽿�ʹ�ã�',1780)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('9F5A59A7-E4B5-43FF-8CA5-7E2D20922944','FD18318D-CF10-47A9-86C5-CC066B5119B3','���պ�Ľ��ּ��κ��˲������ԸĶ�����������������ֲ��Ķ�ʱ�Ƿ�ʩ��������ͬ�⣬��ԭ��������������ɺ��������м�顢���ӡ�����������',1790)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('14C44CE9-C0AF-436E-8B3D-3E5C16B20FD8','FD18318D-CF10-47A9-86C5-CC066B5119B3','���ּ��Ƿ��ڼ�飬��籩������Ƿ����ȫ���飻',1800)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('451EE759-9657-4C76-84A7-3C66DB545100','FD18318D-CF10-47A9-86C5-CC066B5119B3','���ּ���ʹ�ù����У��Ƿ��������ܸ˺ͽ��ְ壻',1810)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('BE42AF7E-EE97-4E4C-868C-80E019819598','FD18318D-CF10-47A9-86C5-CC066B5119B3','������ּ�ʱ���Ƿ���Χ�辯����������ר�˼໤����ֹ���˽�����ҵ���ڣ�',1820)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('C5397629-7119-4038-AAF2-4821A345E69B','FD18318D-CF10-47A9-86C5-CC066B5119B3','�����ҵ�Ƿ�˳�����϶��²������׼����ͬʱ��ҵ��',1830)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('43612FA2-22D3-42EC-B926-BFDA55E55498','FD18318D-CF10-47A9-86C5-CC066B5119B3','��ж�µļܸˡ����Ӽ�������Ȳ��ϣ��Ƿ������ţ��Ͻ�����Ͷ����',1840)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('76F1EE8C-5909-4C41-9C0B-3E2AA53DA70B','FD18318D-CF10-47A9-86C5-CC066B5119B3','��ҵ��Ա���ܸ˼���ҵ�������ߵİ�ȫ���벻��ʱ���Ƿ��жϵ�Դ��',1850)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('E381EA5F-65AA-4028-9F7C-EAAB1A313210','FD18318D-CF10-47A9-86C5-CC066B5119B3','��ж���⣩���Ľ��ָˡ��壬�Ƿ�һ��ȫ�����ꡣ',1860)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('204A96C4-4AAB-40AD-9DBA-8BAE6E650155','EC986070-16BF-4343-8850-252D9A747358','����������15��30�ף������ϸߴ���ҵʱ���Ƿ�����ˡ��ߴ���ҵƱ����',1870)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('B2A358BC-9374-4652-8810-EA3149B8BA60','EC986070-16BF-4343-8850-252D9A747358','�ߴ���ҵ���������Ƿ��ŹҾ������',1880)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('43437189-E576-4D84-98FA-1C1901C1FC2A','EC986070-16BF-4343-8850-252D9A747358','ҹ��ߴ���ҵ�Ƿ��г����������',1890)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('A8F65ABE-4A76-4EDD-9FC5-C34109CB684C','EC986070-16BF-4343-8850-252D9A747358','�Ƿ���а�ȫ�������������ף���ʵ��ȫ��ʩ��',1900)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('A6BDDB8F-25F2-4C5C-B306-D145A93FBFB1','EC986070-16BF-4343-8850-252D9A747358','�Ƿ�ϵ�ð�ȫ�������ð�ȫñ��������㣻',1910)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('C66E7CF9-0DB5-4A61-9EC8-59999A713D52','EC986070-16BF-4343-8850-252D9A747358','�ߴ���ҵ������ܿ����Ƿ񱣳��㹻�İ�ȫ���룻',1920)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('16D5F259-51A6-4241-8CAC-0653155588B6','EC986070-16BF-4343-8850-252D9A747358','�����������Ϻ��׵硢���ꡢ����ȶ��������������Ƿ����¶��ߴ���ҵ��',1930)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('3724A8FF-C046-4091-95C8-8347FC5C02E4','EC986070-16BF-4343-8850-252D9A747358','����Ӧ���빤�ߴ����Ƿ�����Ͷ�����ߡ����Ϻͷ��ϵȣ�',1940)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('21036925-88BA-42E5-BA66-060853842853','EC986070-16BF-4343-8850-252D9A747358','�������̵ķ������ˣ��Ƿ����϶����ð�ȫ������գ�',1950)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('4CDA7FA8-3DAF-4F03-9395-560B11540103','EC986070-16BF-4343-8850-252D9A747358','����ƽ̨��������ˣ��Ƿ����϶��¼ӹҰ�ȫ������ ',1960)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('3844AAAA-FBC7-405A-B1BA-E33088A0A51E','EC986070-16BF-4343-8850-252D9A747358','�Ƿ�5�����ϵ�һ�����ʵ���ҵ���������������󣬷���ʹ�õ����ȴ�ֱ������ʩ���У�',1970)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('DA4F95B8-06D1-4719-AE0E-D66DAD3C5308','EC986070-16BF-4343-8850-252D9A747358','�������������ݼܡ����ȵȹ�����װǰ���Ƿ����������ݡ����ּܵȸߴ���ҵ���ߣ�',1980)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('6D536F83-B501-4CD0-A2B5-A1BDAE71E547','EC986070-16BF-4343-8850-252D9A747358','������װʱ���Ƿ���������ʱ�߿���ҵ��ȫ��ʩ���湹��ͬʱ�ϵ���λ��',1990)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('16FEF6EE-D64A-417D-909E-EB93DD50498E','EC986070-16BF-4343-8850-252D9A747358','��װ�еĴ�ģ����������,�Ƿ�վ�˺����ߣ�',2000)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('3A7B8E6C-3168-449B-85AD-B446964E6094','EC986070-16BF-4343-8850-252D9A747358','ģ��δ�̶�ǰ�Ƿ�����µ�����',2010)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('AA6DBECA-0C45-40A5-9A82-50B20FF48950','EC986070-16BF-4343-8850-252D9A747358','֧��߶���3�����ϵ���ģ�壬�����Ƿ���б�ţ��Ƿ���ƽ̨��',2020)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('42D95ECF-ABB0-4558-A2F5-63D99DD664D8','EC986070-16BF-4343-8850-252D9A747358','�����Ͱ�װ�ֽ�Ǽ�ʱ,�Ƿ������ּܺ������',2030)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('1C859B86-6B6E-437A-848A-6B10BB42CABD','EC986070-16BF-4343-8850-252D9A747358','����3�����ϵ����ֽ�,�Ƿ�������ƽ̨��',2040)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('320DA4DB-DF15-4CEE-9987-2ACFCF9438A8','EC986070-16BF-4343-8850-252D9A747358','�������2�����Ͽ�ܡ������ȹ���,�Ƿ������ƽ̨��',2050)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('BD5C1E35-1E8B-4F16-996C-5D4043BAFF49','EC986070-16BF-4343-8850-252D9A747358','�ƶ�ʽƽ̨������Ƿ񳬹�10M2,�߶ȳ���5�ף�',2060)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('077040A2-7342-41CC-9673-0013669D554D','EC986070-16BF-4343-8850-252D9A747358','ģ�塢���ּܵȲ��ʱ,�Ƿ��·����ˣ�',2070)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('89D7D995-BECF-42AD-A47D-F2C0A0861387','EC986070-16BF-4343-8850-252D9A747358','�ṹʩ���Զ������Ƿ���Աͨ���ھ����谲ȫ�����',2080)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('DD2384ED-F794-4FED-9829-F10BD93F2855','EC986070-16BF-4343-8850-252D9A747358','��������ʩ������׹�������ͨ����������Ӱ��ķ�Χ�ڣ��Ƿ���趥���ܷ�ֹ��͸��˫������ȣ�',2090)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('5991001A-885C-40EF-BCD4-380F19DEADDC','EC986070-16BF-4343-8850-252D9A747358','�������ػ����ۻ�ת�뾶�ڵ�ͨ����������Ӱ��ķ�Χ�ڣ��Ƿ���趥���ܷ�ֹ��͸��˫������ȣ�',2100)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('DBEF8245-76C9-4B86-BFFF-35D4B0B68EF9','82884781-F5B6-4623-A0BC-112DCA6665D9','���ػ�е�Ƿ��в�Ʒ�ϸ�֤����ȫʹ�á�ά��������˵���飻',2110)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('849ED22A-9452-4C60-AD1F-076EBD3E3F19','82884781-F5B6-4623-A0BC-112DCA6665D9','�Ƿ�ÿ����ҵǰ���а�ȫ��飬��������������豸��������м��޴���',2120)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('6DB8C30A-4253-4631-8C6C-F17E4C477274','82884781-F5B6-4623-A0BC-112DCA6665D9','��˿����������������ж�ۡ���������������Ƿ���кϸ�֤��ʹ��˵���飻',2130)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('69482A77-87FC-4542-A2F9-1660FA05EA6F','82884781-F5B6-4623-A0BC-112DCA6665D9','�������豸�������ĵ�װ���Ƿ���Ƶ�װ��������������',2140)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('34BC768D-AF17-4F59-B59B-ACCEF28B9B91','82884781-F5B6-4623-A0BC-112DCA6665D9','��ҵǰ�Ƿ��ɼ�����Ա��������ҵ��Ա���м������ף�',2150)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('2BF872B1-87B3-4093-9594-D74526D34644','82884781-F5B6-4623-A0BC-112DCA6665D9','������ҵ�У�����ָ���Ƿ��ϸ�ִ�е�װ������',2160)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('62086234-4BD3-4155-B5F8-DB8ED5F1E397','82884781-F5B6-4623-A0BC-112DCA6665D9','�Ƿ���������ָ��ǩ���������豸��װ�������ɽ����Ե��͵�װ��ҵ��',2170)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('BFE48435-908B-46EB-8D6F-48B0170103B5','82884781-F5B6-4623-A0BC-112DCA6665D9','����ָ����Ա�Ƿ�ֹ���ȷ�����ȵ�λ������������ı�־�ϸ�ָ�ӣ�',2180)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('3EDD8C19-E597-4469-AB1F-CEED99DADF44','82884781-F5B6-4623-A0BC-112DCA6665D9','��̨���ػ�����ͬһ����ʱ���Ƿ�ѡ����ͬ���ֺ���ͬ�������������ػ�е��',2190)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('BFFD87C5-E305-4F1C-A08D-25F472B5B906','82884781-F5B6-4623-A0BC-112DCA6665D9','�Ƿ񾭹���ȫ������ѵ��ȡ�õط����ܲ���ǩ����������ҵ����֤�󣬷��ɴ�������ָ�ӺͲ�����ҵ��',2200)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('E2E14DB4-418D-49FB-A841-E499BA378C6C','82884781-F5B6-4623-A0BC-112DCA6665D9','�Ƿ񰴹涨��ָ���źŽ���ָ�ӣ�',2210)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('5DAE1453-0DD3-43F2-839C-5DF9D14CEAC7','82884781-F5B6-4623-A0BC-112DCA6665D9','�Ƿ���ʽ���ǰӦ�����Ե���',2220)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('19626525-0E8A-4ADD-93E4-C5A78008B09E','82884781-F5B6-4623-A0BC-112DCA6665D9','��װ�����У��κθ�λ���ֹ��ϣ��Ƿ�������ָ���߱��棻',2230)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('3E49BC1A-BD06-4629-9DC0-68794F16B71F','82884781-F5B6-4623-A0BC-112DCA6665D9','�����λǰ���Ƿ�⿪��װ���ߣ�',2240)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('2158B654-1CE5-4808-B761-C4BC815571C8','82884781-F5B6-4623-A0BC-112DCA6665D9','���ز�����Ա�Ƿ�ָ����Ա���źŽ��в������Խ���ͣ���źţ������ɺ��˷�������Ӧ����ִ�У�',2250)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('A5AD1815-DDCC-4BD0-B7BC-3943D2009914','82884781-F5B6-4623-A0BC-112DCA6665D9','�Ƿ�ʹ�����ػ����������ػ�е������ػ������������Ʒ�������',2260)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('73DF6796-6289-4DD9-87C8-A768301472D5','82884781-F5B6-4623-A0BC-112DCA6665D9','�Ƿ����ƶ�������ȫװ��ʧ�顢��˿�����˵�����½�ֹ���ز�����',2270)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('C670A478-3016-488C-AA90-A78CA09A447F','82884781-F5B6-4623-A0BC-112DCA6665D9','�������󡢵��Ҳ��λ�ƽ�⡢������Ǵ����˿��֮��δ�ӳĵ�ʱ�Ƿ񲻵����أ�',2280)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('02F2DA05-C419-4396-9F1B-A59116B8B665','82884781-F5B6-4623-A0BC-112DCA6665D9','�޷����峡�ء����������ָ���ź�ʱ�Ƿ�ֹͣ�������ز�����',2290)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('895A961A-4937-48BE-A7C4-8F0A9BE38448','82884781-F5B6-4623-A0BC-112DCA6665D9','���ػ�е����ۼܡ����ߡ����ߡ���˿�����·����͵����Ƿ�Զ��ߵ�ѹ�����·��',2300)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('E7922276-2414-46ED-B335-09129F7F470A','82884781-F5B6-4623-A0BC-112DCA6665D9','��ͣ������Ϣʱ���Ƿ񽫵�����������ߺ͵��������ڿ��У�',2310)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('DD76328A-D90F-4AA6-AA6B-0F8332A070B8','82884781-F5B6-4623-A0BC-112DCA6665D9','���� ���ü���λ��������ͣ����',2320)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('045D1F48-FF21-4D92-8405-291F596E2C4C','82884781-F5B6-4623-A0BC-112DCA6665D9','��̨���̨���ػ�е����ͬһ����ʱ����˿���Ƿ񱣳ִ�ֱ�� ',2330)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('CD56903C-588D-46BA-B670-6A30564FDA2B','82884781-F5B6-4623-A0BC-112DCA6665D9','��̨���̨���ػ�е����ͬһ����ʱ�������������Ƿ񱣳�ͬ������̨���ػ�е�����غɲ��ó�����������75����',2340)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('BABD897F-404E-4E8E-96AD-CF7689D20F6F','82884781-F5B6-4623-A0BC-112DCA6665D9','��̨���̨���ػ�е����ͬһ����ʱ����̨���ػ�е�����غ��Ƿ񳬹���������75����',2350)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('D31172A7-AA0E-47D8-BBBC-AEE4346E19D7','82884781-F5B6-4623-A0BC-112DCA6665D9','˾����Ա�Ƿ񰴵�װ����ѡ��������������֤��ȷʹ�ã�',2360)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('0BDF1ABA-545E-4E40-A265-2FDF61CA99F8','82884781-F5B6-4623-A0BC-112DCA6665D9','���������Ƿ��ο�������͵��������Ӧ��ͬһ��ֱ�ߣ�',2370)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('40AD6858-FE74-4827-BEF9-20650217FDA1','82884781-F5B6-4623-A0BC-112DCA6665D9','˾����Ա�Ƿ������������ڵ�����������ͣ����',2380)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('0D12CA89-27DE-4B95-BF6C-6DF113E9B196','82884781-F5B6-4623-A0BC-112DCA6665D9','��������ʱ���������������������Ǵ��Ƿ�ӳĵ棻',2390)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('18B35FC9-810F-449C-A9EC-3FBF93BAF483','99431E70-833A-464D-8066-E41E230646DA','�Ƿ���У����߻�ʹ�úϸ�֤��',2400)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('EC4A7073-6C10-4752-B9F4-065485DE0356','99431E70-833A-464D-8066-E41E230646DA','�Ƿ���з��乤����Ա����֤��',2410)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('7693D0EC-9894-41A9-AA8D-518F8D72C7F1','99431E70-833A-464D-8066-E41E230646DA','�Ƿ��������װ��ʹ�õǼ�֤��',2420)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('99D56128-76D8-4571-B9C1-CF0783C94B08','99431E70-833A-464D-8066-E41E230646DA','�Ƿ��������װ�ù������֤��',2430)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('13D889BA-070F-4E1F-B486-1E6DCAF221DE','99431E70-833A-464D-8066-E41E230646DA','�Ƿ��������������ҵ���֤������ʩ���ְ���HSE�����ź������쵼��׼�󣬷��ɽ���������ҵ��',2440)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('0BD5BED4-2A05-4705-A34F-7D150CB1E3F2','99431E70-833A-464D-8066-E41E230646DA','����ҵǰ�Ƿ��ƶ���ȫ������ʩ������ʵ��λ��',2450)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('444A904F-C146-4438-8AD9-E65460430D97','99431E70-833A-464D-8066-E41E230646DA','ʹ������װ�õĲ����Ƿ�����ҵǰ���뵽��HSE�����š��豸���Ű���Ǽ�������',2460)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('7E790E6B-68D8-4D64-98FB-3661E99F957C','99431E70-833A-464D-8066-E41E230646DA','��ҵǰ���Ƿ񻮶�����ҵ���䣬ȷ����ҵʱ�䣬ȷ����Χ�޹���Ա��ȫ���롣��ʽ��ҵǰ����Ҫ�����峡��',2470)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('25BD3FC0-4610-4173-AE1D-8CEF0E4A3F1F','99431E70-833A-464D-8066-E41E230646DA','��ҵǰ���Ƿ񿱲��ʩ���ֳ��ĵ��Σ���ȷ���úþ����ߡ�����ƣ�ȷ��������������˲ʱ������С��2΢����/Сʱ��',2480)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('A44D50C3-D57D-4D1C-B7E4-C777E95D3B11','99431E70-833A-464D-8066-E41E230646DA','����Ҫ·�ں���Ա����������Ƿ���ר�˿��أ�',2490)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('5FE9D368-6B6E-498A-A235-004E93A7FD25','99431E70-833A-464D-8066-E41E230646DA','��ҵʱ���ֳ��Ƿ�������������������ҵ��Ա���ܽ���������ҵ��',2500)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('91D10C1D-6515-4F98-8FA2-19BB62E7777D','99431E70-833A-464D-8066-E41E230646DA','������Ա�Ƿ��֤�ϸڣ���Ϥ�йذ�ȫע����������Ļᣨ��ʹ�á��ᱣ�������顢���ų����ϣ������ã��úá��ܺá�ά�������ã���',2510)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('7A208414-DDDE-475D-ADFB-F4FD913F0376','99431E70-833A-464D-8066-E41E230646DA','��ҵǰ�Ƿ񴩴��÷����þߣ�',2520)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('5FBD1BFB-0EAF-4016-A83A-88AAFE723F5E','99431E70-833A-464D-8066-E41E230646DA','ҹ����ҵ�Ƿ��г����������',2530)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('5D8D11C9-9BD2-4531-A67D-58CD5A6BD702','99431E70-833A-464D-8066-E41E230646DA','�ڽ�����������ҵ���Ƿ�����Ӧ�İ�ȫ��ʩ��',2540)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('2335B7BF-E1B5-4DD8-9905-6D65B8E31AC7','99431E70-833A-464D-8066-E41E230646DA','������װ�á��豸ʹ�ù����У����������װ�á��豸�Ľ����Ƿ����ý��Ӽ�¼��',2550)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('5939E1A2-7827-4413-AC9F-F083A3BD1F9C','99431E70-833A-464D-8066-E41E230646DA','������ͬλ��������ǰ�Ƿ��չ��ҹ涨�򵱵��������߲��Ű���׼��������',2560)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('448F239A-D850-49D9-A13B-E5923DDA70FB','99431E70-833A-464D-8066-E41E230646DA','���������Ƿ�������Я����������ǵİ�ȫ��Ա��������ҵ��ԱѺ�ˣ�������в���ϼ�⣬�Է����ⶪʧ��й©��ͬʱ�����÷�����Ʒ��',2570)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('9BA8E101-EA35-4469-B30C-74871166EDCF','99431E70-833A-464D-8066-E41E230646DA','ÿ��ʹ�ý������Ƿ񽫳����豸һ���ͻأ��������ר�ô�������������ȼ���ױ����׸�ʴ��Ʒ�ڷ���һ��ָ��ר�˸��𱣹ܣ�',2580)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('D810BE0C-4CB4-4EDA-ACBA-CEB1C688CD8C','99431E70-833A-464D-8066-E41E230646DA','ÿ��ʹ�ý����󣬱��뽫�����豸һ���ͻأ�ʮ��ָ��ר�˸��𱣹ܣ�',2590)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('CBE6CBA9-7DC4-419C-815F-F1EA34A5DD57','99431E70-833A-464D-8066-E41E230646DA','�����Ƿ�ʵ��˫��˫���ƣ����ε��ˣ�ͬʱ���÷��𡢷�������й©������',2600)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('341A5209-26F2-4285-ADD8-07D945939343','99431E70-833A-464D-8066-E41E230646DA','���泡���Ƿ������ԵĹ��ʷ����Ա�־��',2610)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('C5E943B0-78A7-4328-BEE4-7D2312EB43CE','99431E70-833A-464D-8066-E41E230646DA','���桢��ȡ��ʹ�á��黹�Ƿ�ʹ�õ�λ����HSE�����š��豸���ź�ʵ���������������',2620)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('0FC81248-816B-4DD0-A3DF-02D5F32BD050','99431E70-833A-464D-8066-E41E230646DA','������̽��һ�����ַ���Դʧ�ع��ϣ��Ƿ��ȡ�������ȴ�ʩ��',2630)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('79BE2EF1-E5EE-40FB-9D32-BB5A19C81A40','77205883-AE5F-4047-8241-6922A2CCE6C4','�Ƿ�������޿ռ���ҵʩ����ȫ������������������',2640)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('483E77F6-B415-470F-A283-B2D30345ABDE','77205883-AE5F-4047-8241-6922A2CCE6C4','��ҵǰ�Ƿ��ɼ�����Ա�����޿ռ���ҵ��Ա���а�ȫ�������ף�',2650)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('34D946F0-5ABB-415F-95AA-BC435783AEA4','77205883-AE5F-4047-8241-6922A2CCE6C4','��ҵǰ�Ƿ��ɼ�����Ա�����޿ռ���ҵ��Ա���а�ȫ�������ף�',2660)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('F2CC8471-61D0-4CDF-8CD9-3E7A2D94E9BD','77205883-AE5F-4047-8241-6922A2CCE6C4','��ȫ���������Ƿ����ü�¼��',2670)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('5D6B4418-9FAF-4728-9484-C824756AEC5E','77205883-AE5F-4047-8241-6922A2CCE6C4','���ܽ��׵�ʩ����Ա�Ƿ��ڼ�¼��ǩ�֣�',2680)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('A828A009-89C8-4157-ADB8-88DEE2273E2D','77205883-AE5F-4047-8241-6922A2CCE6C4','�����豸��װ�á��������ӵ�������ǰ�Ƿ�����к����ʶ��ԡ���ȼ�ԡ���ը�ԡ���ʴ�Լ�������',2690)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('A91C5F65-4C58-4CEE-92CD-951BDB77CDAF','77205883-AE5F-4047-8241-6922A2CCE6C4','�Ƿ񾭼���ϸ񣬰�����ص���ҵƱ֤�󷽿ɽ����豸��װ�á��������ӵ���������ҵ��',2700)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('389B5744-CE21-493A-AB36-E5020E6E5C9B','77205883-AE5F-4047-8241-6922A2CCE6C4','���޿ռ�֮�����װǰ�Ƿ�������ص�װ�',2710)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('98E70408-041F-4F7C-A636-69583787575E','77205883-AE5F-4047-8241-6922A2CCE6C4','���޿ռ�֮������ҵǰ�Ƿ��������ҵ���֤��',2720)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('897E8E7A-0113-4B81-9ED0-0F7505D32B46','77205883-AE5F-4047-8241-6922A2CCE6C4','���޿ռ�֮�ڹ���������ҵǰ�Ƿ��������ҵ���֤��',2730)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('124DAF9A-9479-450C-AEF9-FD58EB622872','77205883-AE5F-4047-8241-6922A2CCE6C4','���޿ռ�֮�Ǹ���ҵǰ�Ƿ����ߴ���ҵ���֤�',2740)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('B9B69AEA-A04E-4447-8A86-B3F6F0D02B4E','77205883-AE5F-4047-8241-6922A2CCE6C4','���޿ռ�֮������ҵǰ�Ƿ����������ҵ���֤��',2750)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('58B95955-6A8C-41F5-920E-50ECA4C30138','77205883-AE5F-4047-8241-6922A2CCE6C4','��ҵ��Ա�Ƿ���ȷ�����Ҫ���Ͷ�������Ʒ��',2760)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('CA779737-EE85-445A-9EB4-46EC55DB1BE6','77205883-AE5F-4047-8241-6922A2CCE6C4','��ҵʱ���ֳ��Ƿ���ר�˸���໤��',2770)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('D3E9F211-FC8C-4025-A6AC-6F5ED1FC6832','77205883-AE5F-4047-8241-6922A2CCE6C4','�����У��������Ƿ��ϸ����ر����ֵİ�ȫ������̣�',2780)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('928EE1A2-240D-4284-B2CB-E69ABA940F43','77205883-AE5F-4047-8241-6922A2CCE6C4','�����У��Ƿ����Υ��ָ�ӡ�Υ����ҵ��',2790)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('A31E31DD-C24E-45D9-82D9-D04EB5DE1853','77205883-AE5F-4047-8241-6922A2CCE6C4','�ֳ�HSE��Ա�Ƿ񲻼�Ͻ����ֳ���ȫѲ�죬�������⼰ʱ����',2800)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('B2182A60-2953-45EB-A523-69230EEC7793','77205883-AE5F-4047-8241-6922A2CCE6C4','�๤�ֻ�Ͻ�����ҵ���Ƿ��ֿ��Ǹ����ּ���໥Ӱ�켰��Ǳ�ڵ�Σ�ա�',2810)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('447F7482-3DEE-462F-B6E0-49DC11680FCF','8DC2F97B-CB4F-4848-B528-6A8155C26771','����ƿ�Ƿ�����Ȳ��ƿͬ�����䣻',2820)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('B06E7898-D14A-4405-9196-FE840D26EACD','8DC2F97B-CB4F-4848-B528-6A8155C26771','��ƿװ��ǰ�Ƿ���÷���ñ�ͷ���Ȧ��',2830)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('070AD806-77AC-4F59-9755-ACBE2B30DB75','8DC2F97B-CB4F-4848-B528-6A8155C26771','���е����䳵���Ƿ����иɷ�������� ',2840)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('1B2B77D4-64DC-4596-83FD-53CF82113D1C','8DC2F97B-CB4F-4848-B528-6A8155C26771','�˻���ƿ���Ƿ�����ж����',2850)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('877E724D-5666-4B1A-8CF0-B0D9DA2BEE86','8DC2F97B-CB4F-4848-B528-6A8155C26771','��ƿ�Ƿ�����ר�òֿ����档Ӧʹ����դ������������',2860)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('5E0BFB3A-B8F8-4ECB-8737-B41FD8F1D81B','8DC2F97B-CB4F-4848-B528-6A8155C26771','��ƿר������ֿ��Ƿ�ʹ����դ������������',2870)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('0467F788-D51F-4B43-95B9-3179224A21F4','8DC2F97B-CB4F-4848-B528-6A8155C26771','��ƿ�ѷŴ��Ƿ���������',2880)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('253E60E1-66F0-4BAC-8E36-913472C03F9B','8DC2F97B-CB4F-4848-B528-6A8155C26771','����ƿ������Ȳƿ����ȼ��ƿ������Ƿ����10�ף�',2890)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('45BCE2BB-2971-403E-A20A-5F5CD3B0339C','8DC2F97B-CB4F-4848-B528-6A8155C26771','ʹ����ƿ�Ĺ����Ƿ���ѵ���˺ϸ񣬳�֤�ϸڣ�',2900)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('D9107273-5C07-4AA4-B2D5-9E3287558B35','8DC2F97B-CB4F-4848-B528-6A8155C26771','��ƿʹ��ǰ�Ƿ���а�ȫ״����飬��ʢװ�������ȷ�ϣ� ',2910)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('7E5902A2-BEB6-4178-A12B-65932CB8FF46','8DC2F97B-CB4F-4848-B528-6A8155C26771','��ƿ�Ƿ����ţ�',2920)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('95F0F40D-7140-4BF0-AA79-17E1B55B39F5','8DC2F97B-CB4F-4848-B528-6A8155C26771','ƿ�����岻���þ����Ƿ����в�С��0.05MPa��ʣ��ѹ����',2930)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('D68829C8-F622-4179-8A0A-28AED0BF4B18','8DC2F97B-CB4F-4848-B528-6A8155C26771','��Ȳƿ�Ƿ������ȹ̣�',2940)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('5ACC74FC-0162-4958-A152-4BA9DB77E9EF','8DC2F97B-CB4F-4848-B528-6A8155C26771','��Ȳƿ�Ƿ�װʹ���������',2950)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('7BD9098F-0FBE-4A3D-BE51-7EFDD36448C3','8DC2F97B-CB4F-4848-B528-6A8155C26771','��ƿʹ����Ա�Ƿ��ϸ�ִ���������ȫ������̣�',2960)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('D2A550C0-07DF-427D-A7EB-E77594710A7E','8DC2F97B-CB4F-4848-B528-6A8155C26771','��ƿʹ����Ա�Ƿ��ȡ��ʩԤ���ػ�',2970)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('CD767E03-A2C9-4DBB-A4C5-94B4E71A4447','C9288081-8BD3-4949-A9C6-6320F827D35B','ʹ�õ�λʹ��Σ����Ʒʱ���Ƿ���дΣ����Ʒ���뵥��',2980)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('F8F2D562-79CB-462B-BAA5-DB309C15DEA0','C9288081-8BD3-4949-A9C6-6320F827D35B','�ɹ������ڽӵ�Σ����Ʒ���뵥���Ƿ�����������ˣ�',2990)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('52736519-2AC6-4002-9DF9-C84FF1A06FF8','C9288081-8BD3-4949-A9C6-6320F827D35B','�ɹ������ڽӵ�Σ����Ʒ���뵥���Ƿ���дΣ����Ʒ���ٵ���',3000)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('A432604A-1366-4D1F-9876-8A5A6E93BB25','C9288081-8BD3-4949-A9C6-6320F827D35B','Σ����Ʒ���͵��ֳ�ʱ���Ƿ���Σ����Ʒ���ٵ���',3010)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('31360DFE-31E4-47DE-9380-1A62D3A7E606','C9288081-8BD3-4949-A9C6-6320F827D35B','Σ����Ʒ�����䲿���Ƿ�����ʹ�Ӧ����ǩ֤�����뵥��������ͬ�����������ʹ�õع������ذ������������',3020)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('431C0905-074D-42CC-8F03-BECA772F047D','C9288081-8BD3-4949-A9C6-6320F827D35B','Σ����Ʒ�Ƿ���ר��Ѻ�˺�װж��',3030)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('1C5779BC-ED1F-439D-8DC5-EB47A5757B10','C9288081-8BD3-4949-A9C6-6320F827D35B','Ѻ�ˡ�װж��Ա�Ƿ񾭹���ѵ��������Ѻ�ˡ�װжΣ����Ʒ�����ʡ�Σ���Ȱ�ȫ��ʶ��',3040)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('BE56D3F0-D769-475D-B6B9-9CCC0FE60C20','C9288081-8BD3-4949-A9C6-6320F827D35B','װжʱ�Ƿ�������ţ�װ�����ܹ��ߣ�Ҫ�������Σ�',3050)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('B60B101D-E9E1-4B3E-B2D7-B5071A27D1EC','C9288081-8BD3-4949-A9C6-6320F827D35B','����ҹ��װжʱ���Ƿ��г�ֿɿ���������',3060)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('58E42E05-DE77-4A9A-96B0-E47772B5754E','C9288081-8BD3-4949-A9C6-6320F827D35B','ר�����䳵���Ƿ񱣳����ó������������䣻',3070)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('E8C72140-E34C-4CFC-A959-D86CB12BB3E6','C9288081-8BD3-4949-A9C6-6320F827D35B','ר�����䳵���Ƿ��������ҡ�Σ�ա���ʶ��',3080)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('7CFBEEA8-9296-4548-9526-41B07626E585','C9288081-8BD3-4949-A9C6-6320F827D35B','Σ����Ʒ���ǰ���Ƿ������������գ�',3090)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('A815225F-ABB5-46A6-A5C6-F5FBDA86CF24','C9288081-8BD3-4949-A9C6-6320F827D35B','Σ����Ʒ�Ƿ������봢�棻',3100)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('0C61CD00-547D-4D10-BBC4-36F6D564427D','C9288081-8BD3-4949-A9C6-6320F827D35B','�Ƿ񾭳����Σ����Ʒ���������ܺ���̬�����ü�¼����ȡ��Ӧ��ʩ����ֹΣ����Ʒ�����½��������¹ʣ�',3110)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('54D12F64-E33B-4CF5-BB76-C45940FF7224','C9288081-8BD3-4949-A9C6-6320F827D35B','���������ʵĴ��棬�Ƿ񰴹����йع涨��ǿ��������ʵ��˫�ˡ�˫�����ܣ��ϸ����ر����ƶȣ������ð�ȫ����������',3120)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('9FD6FC0D-8707-49D3-84AF-109C1D603647','C9288081-8BD3-4949-A9C6-6320F827D35B','����Σ����Ʒ�Ŀⷿ���Ƿ�ע�⼾����Ԥ����',3130)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('B4A7F1A8-D231-40AF-9C56-5BBA354585C5','C9288081-8BD3-4949-A9C6-6320F827D35B','��ҵ��Ա��ʹ��Σ����Ʒǰ���Ƿ����Σ����Ʒ��ʹ�����֤��',3140)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('99AFBC33-60EF-473E-B492-D75BA5049874','C9288081-8BD3-4949-A9C6-6320F827D35B','���֤ǩ����Ա�Ƿ����Σ����Ʒ���ٵ��е��й�Ҫ������������м��ȷ�ϣ�',3150)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('D6B2463B-2FF3-400F-9AF7-C851CB1C3916','C9288081-8BD3-4949-A9C6-6320F827D35B','��ʹ��Σ���Խϴ��Σ����Ʒ�ĵط����Ƿ�����Ŀλ�����þ�ʾ��־��Χ�辯ʾ����',3160)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('70A9E544-0001-41AA-945F-C5E0DD2E76A1','C9288081-8BD3-4949-A9C6-6320F827D35B','�������¹�ʱ���Ƿ�������֯ʵʩӦ����ʩ��ʹ�¹���ʧ���͵���С�̶ȣ�',3170)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('8A5FA335-DDE3-4FBD-B285-C4909BB48D40','C9288081-8BD3-4949-A9C6-6320F827D35B','Σ����Ʒ����ҵ���Ƿ񰴹涨���Ʊ��ܣ�',3180)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('9518E65A-C31B-4468-8AD4-FB22B83EB9C3','C9288081-8BD3-4949-A9C6-6320F827D35B','������Σ����Ʒ�Ƿ����Դ���',3190)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('04E95DBB-9DFC-45CB-B94B-976AFBD84634','C9288081-8BD3-4949-A9C6-6320F827D35B','������Σ����Ʒ���������Դ����Ƿ����йز����Ͽɵ����ʸ�λ���д��� ',3200)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('67FEF797-02EC-484D-9B31-DD9A632161F0','C9288081-8BD3-4949-A9C6-6320F827D35B','Σ����Ʒ�Ĵ��桢���ĺͷ��������Ƿ���Σ����Ʒʹ�ø���������˶Ժͼ�¼��Σ����Ʒ�嵥�ϣ�����HSE���ܲ��ţ�',3210)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('973780F4-DA83-4E28-8D3C-6F498004D931','10A8AF77-8103-422D-AE72-FAEB058C4770','�����豸���й涨��ʹ��ǰ���������ڵء��мල��������ȡ�������豸׼��֤�ߣ�ʹ�õ�λ�Ƿ�����ȡ֤��',3220)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('974B0C09-55AD-4744-8239-E01F6BCFDDCB','10A8AF77-8103-422D-AE72-FAEB058C4770','�����豸�Ƿ񾭵ء����Ͷ����ż���ϸ�',3230)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('81AE9631-941B-4882-AB97-66F99355B98C','10A8AF77-8103-422D-AE72-FAEB058C4770','������Ա�Ƿ�����Ͷ����ſ��˺�ǩ���İ�ȫ����֤��',3240)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('009DEEEF-6784-4F0F-B74D-4D4D5140476D','10A8AF77-8103-422D-AE72-FAEB058C4770','�Ƿ�����ȫ��ȫ��������ƶȺͰ�ȫ������̣�',3250)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('FCA30BB2-E290-40DE-A80A-CE76BEF8EE60','10A8AF77-8103-422D-AE72-FAEB058C4770','��������豸�����ܲ����Ƿ�浵�豸���������ļ���',3260)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('D34F0163-C957-4022-920A-F7F1FF4C3BE8','10A8AF77-8103-422D-AE72-FAEB058C4770','��������豸�����ܲ����Ƿ�浵ʹ�á�ά�������������������¼��',3270)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('5F5C112E-1339-4CDF-ABD1-4312C491E672','10A8AF77-8103-422D-AE72-FAEB058C4770','��������豸�����ܲ����Ƿ�浵�豸�������¹ʼ�¼��',3280)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('73221886-3511-4B2D-9791-7B13D24C1D29','10A8AF77-8103-422D-AE72-FAEB058C4770','��������豸�����ܲ����Ƿ�浵��װ�������¼���������ϣ�',3290)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('FF9AE840-E6E0-4202-8127-997E6A55A174','10A8AF77-8103-422D-AE72-FAEB058C4770','ÿ��ʹ��ǰ�Ƿ��������λ����װ�á��ƶ������������Լ����������������ء���������װ�á��������İ�ȫ���İ�ȫ���ܵȣ�',3300)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('6F8C577C-79A7-4F27-9380-26253B8CFD5A','10A8AF77-8103-422D-AE72-FAEB058C4770','ÿ��ʹ��ǰ�Ƿ����������̼��İ�ȫ״����',3310)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('7B6DFC2D-2220-45E4-BC64-AEAF6A6638A1','10A8AF77-8103-422D-AE72-FAEB058C4770','ÿ��ʹ��ǰ�Ƿ����˿���İ�ȫ״����',3320)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('734C08F9-3308-4A01-B8FD-1F686A27CC41','10A8AF77-8103-422D-AE72-FAEB058C4770','ÿ��ʹ��ǰ�Ƿ��鰲ȫ����װ�õİ�ȫ���ܵȣ�',3330)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('B8F2403C-A48A-41FE-BC6E-D89C6DB38616','10A8AF77-8103-422D-AE72-FAEB058C4770','���ػ�е�͵綯��«�Ƿ������༫��λ���������ͳ�����������',3340)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('649B8CE7-65D8-40B4-8D35-38046D18D2D1','10A8AF77-8103-422D-AE72-FAEB058C4770','���ػ�е�͵綯��«�Ƿ�������ָʾ����',3350)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('EDBB4D8A-58D2-4C78-9685-C413C048D0E7','10A8AF77-8103-422D-AE72-FAEB058C4770','���ػ�е�͵綯��«�Ƿ����ê��װ�á����㷭��ȫ����',3360)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('A947472D-A331-4084-A74D-4E60AB2A1A17','10A8AF77-8103-422D-AE72-FAEB058C4770','���ػ�е�͵綯��«�Ƿ�����ֹ���ۺ���װ�ã�',3370)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('C5356402-9051-4766-97A6-7DF34ABBC8DF','10A8AF77-8103-422D-AE72-FAEB058C4770','���ػ�е�͵綯��«�Ƿ���黺�����ͼй�ǯ��',3380)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('7764B1D7-1B01-433E-A496-3A08FC2CE4C3','10A8AF77-8103-422D-AE72-FAEB058C4770','���ݺ��������Ƿ���鳬�ر���װ�ã�',3390)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('846DA683-FFC0-4023-933C-26F9795DCD96','10A8AF77-8103-422D-AE72-FAEB058C4770','���ݺ��������Ƿ���鹩��ϵͳ��λ�ʹ��ౣ��װ�ã�',3400)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('E388F2FD-8407-44FF-94A1-51D35D95D614','10A8AF77-8103-422D-AE72-FAEB058C4770','���ݺ��������Ƿ����ײ�׻���װ�á���Խ�ϡ��¼��޹���λ��ʱ�ı���װ�ã�',3410)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('90F0B890-AE84-47D7-8014-CE41BC6550C4','10A8AF77-8103-422D-AE72-FAEB058C4770','���ݺ��������Ƿ�����ֹ���ػ��������װ�ã�',3420)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('A9D7DB36-F8AE-4073-8193-885ABF07D520','10A8AF77-8103-422D-AE72-FAEB058C4770','���ݺ��������Ƿ����ͣ������ϵͳ��������ʱ���������ƶ�װ�ü���ȫ��ֹͣװ�ã�',3430)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('9EC96748-DE84-4362-9B00-976E8F0C6E1F','10A8AF77-8103-422D-AE72-FAEB058C4770','���ݺ��������Ƿ�����������װ�ã�',3440)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('8671B9A9-4A1C-45D1-A4A7-7F1E14E4A497','10A8AF77-8103-422D-AE72-FAEB058C4770','ͣ��һ�����ϵ������豸�Ƿ����¼����飻',3450)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('2DF5B53E-6179-40D8-80B9-73BA09165C74','10A8AF77-8103-422D-AE72-FAEB058C4770','�������޺͸���������豸�Ƿ����¼����飻',3460)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('DF47319E-4910-4B70-8B2E-C7C64517EA00','10A8AF77-8103-422D-AE72-FAEB058C4770','�������ش��¹ʵ������豸�Ƿ����¼����飻',3470)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('DF8400D6-EA46-4ACD-A134-D17D8C3F247C','10A8AF77-8103-422D-AE72-FAEB058C4770','����4�����ϵ����������豸�Ƿ����¼����飻',3480)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('3ACAA79F-6A7E-4A39-AD47-79599A948E4A','10A8AF77-8103-422D-AE72-FAEB058C4770','¶����ҵ�����ػ�����9�����ϴ��ģ��Ƿ����¼����飻',3490)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('9E039563-9447-4F84-8100-EDB23DBB92EA','B8940917-27F4-438A-BA8E-744B54691F09','�����Ƿ�������󣬲��ϸ����Ͻ�ʹ�ã�',3500)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('228A9F70-CC21-44DA-BA16-09AF8993023E','B8940917-27F4-438A-BA8E-744B54691F09','�Ƿ��鳵���������״̬���Ͻ�����������',3510)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('FD150890-1CC1-4691-8600-6212D16B8020','B8940917-27F4-438A-BA8E-744B54691F09','�Ƿ񷢶��������������ã���תƽ�ȡ����������죬�����ȶ�������ѹ�����������ʲ����ڶ���ʵ�75%��',3520)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('C7DA0B86-9A18-45EF-99F0-C0A1D1D30E73','B8940917-27F4-438A-BA8E-744B54691F09','�Ƿ�ת��ϵ������Ӧת����������㣬���������󣬳���ת������λ��ʱ�����������������и�������',3530)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('C70F42A8-D175-480A-944E-8181B26B728F','B8940917-27F4-438A-BA8E-744B54691F09','�Ƿ��ƶ�ϵͳ��Ч���ƶ���ƽ�⣬��ʻϵͳ������ϵͳ�������Ǳ��ź�װ�÷����йر�׼Ҫ��',3540)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('42919F64-C4BF-4438-B846-0D365429912F','B8940917-27F4-438A-BA8E-744B54691F09','�����Ƿ��䱸һ�����������������Ӧ����������Ч״̬��',3550)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('2774BCCD-831A-4F82-B0CF-B7F490DF784D','B8940917-27F4-438A-BA8E-744B54691F09','�����ŷź������Ƿ���Ϲ��ұ�׼Ҫ��',3560)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('9E6F1975-7DED-47B0-9C89-AFDD866C0EF3','B8940917-27F4-438A-BA8E-744B54691F09','��ʻԱ�Ƿ���г�����ʻ֤����Ŀ�ڲ�������ʻ�ϸ�֤���׼���ʻ������',3570)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('33D83FE1-F31D-432D-8D00-CBC935ABCFA4','B8940917-27F4-438A-BA8E-744B54691F09','��ʻ����ʱ�Ƿ�Я����ʻ֤����ʻ֤��',3580)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('2A4689C3-49E4-4A83-AA58-922D592D0FFB','B8940917-27F4-438A-BA8E-744B54691F09','��ʻ����ʱ�Ƿ���ȷʹ���Ͷ�������Ʒ��',3590)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('E6E4746D-420B-40CF-A8D7-56A7BAA1DFE6','B8940917-27F4-438A-BA8E-744B54691F09','�Ƿ��ʻ��ִ�ղ����ϵĳ�����',3600)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('EA19A74D-1576-42A4-B474-A9D196DA909A','B8940917-27F4-438A-BA8E-744B54691F09','�Ƿ�ƺ�ݳ���',3610)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('E7A38368-BE56-46A7-B063-79E298290D42','B8940917-27F4-438A-BA8E-744B54691F09','�Ƿ�����ʻ�����̡���ʳ����̸���������а��г���ȫ�Ļ��',3620)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('6E5F61FF-A930-48CC-AF95-F110F66AF6C2','B8940917-27F4-438A-BA8E-744B54691F09','�������ƣ�ͻ��м����а��г���ȫʱ���Ƿ��ʻ������',3630)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('C68F4C85-BF15-4299-A6CF-266AC87DFEF6','B8940917-27F4-438A-BA8E-744B54691F09','��ʻԱӦ������ʻ��ȷ����ȫ���Ƿ񳬶����ˣ�',3640)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('CC720FD7-51C7-4ADB-AF8B-F80EF7013EFF','B8940917-27F4-438A-BA8E-744B54691F09','����ǰ�Ƿ����á������������������˳�������·�ߺͰ�ȫ��ʩ��',3650)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('477D95D3-0D42-49B5-8558-FB3E0058A75D','B8940917-27F4-438A-BA8E-744B54691F09','���������Ƿ��������֤����',3660)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('030622CB-91CC-4759-B7FB-6444C488F111','B8940917-27F4-438A-BA8E-744B54691F09','�г�ǰ��鳵���ĵƹ��Ƿ����Ҫ�󣬳����й��ϲ����г���',3670)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('0BB0DDE3-03EB-456B-AEDD-E1D8D1C116EC','B8940917-27F4-438A-BA8E-744B54691F09','ҹ���Ƿ�����г���',3680)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('4643C2EE-BB2A-4EC2-A29F-8C021C85748F','B8940917-27F4-438A-BA8E-744B54691F09','�ᳵ�Ƿ���150m����ر�Զ���ƣ�������ơ�С�ƣ������٣�',3690)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('7C3902D6-21C4-48F8-810D-0477397311A8','B8940917-27F4-438A-BA8E-744B54691F09','ҹ�䳬��ʱ���Ƿ�任��Զ�ƹ⣬��ת�����ʾ�⣻',3700)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('0074CF6C-3965-40A4-BAA6-2AAAF8A916D1','B8940917-27F4-438A-BA8E-744B54691F09','ҹ����ʱͣ���Ƿ�·�ұߣ�����С�ơ�β�ƺ����յƣ���ֹ�����������������ң�',3710)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('C06786E5-E344-46FA-9903-0C565D0B4235','B8940917-27F4-438A-BA8E-744B54691F09','��ѩ���г��Ƿ�֤�������������������ʹ������·�ܳ���©�磻',3720)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('C7AB9C4F-6A5D-41A1-B59B-45994D3385D7','B8940917-27F4-438A-BA8E-744B54691F09','��ѩ���г��Ƿ��ر�ע�����˺�����������Ҫ������ʻ����ֹ�򻬣�',3730)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('1A9DD590-13E2-4BD0-87B1-92619D939A77','B8940917-27F4-438A-BA8E-744B54691F09','����ʱ���Ƿ�򿪷���ƣ�������ʻ����ע�Ᵽ�ֳ��࣬������ʱ��Ҫֹͣ�г���',3740)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('F3D558AA-715F-4BC8-98A7-49390CE4EA22','B8940917-27F4-438A-BA8E-744B54691F09','�ꡢѩ���������г����Ƿ���ǰ������һ���ľ��룬���������ƶ�����ֹ���кͼ�����',3750)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('52CAC3B8-A53B-4DE5-BBA3-BE8DD8C5D73C','B8940917-27F4-438A-BA8E-744B54691F09','�����¹�ʱ����ʻԱ�ͳ˿ͣ��Ƿ�ʵʩ�ԾȻ��ȣ�',3760)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('73267DFE-D425-424D-A21B-BEAA654FD973','E6635238-4A3D-4101-B8E2-8356CBF046C2','�Ƿ�����ȫ�ֳ���������������������磻',3770)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('EE3D6367-FB74-473E-9405-97332FC637DF','E6635238-4A3D-4101-B8E2-8356CBF046C2','�Ƿ���ר���棩ְ��Ա����ʩ���ֳ��Ĺ���ͼල��',3780)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('87012A60-B752-4E8A-8292-E3715DB97A1D','E6635238-4A3D-4101-B8E2-8356CBF046C2','�Ƿ��ƶ�����λ������������취��ʵʩϸ��',3790)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('5C5D4FFC-389C-4C52-ADDF-7646CF631A24','E6635238-4A3D-4101-B8E2-8356CBF046C2','�Ƿ�����ȫ���ֱ����ƶȣ����û���ͳ�ƹ�����',3800)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('24B6DA4F-9A0E-4619-8FD1-456535BC059B','E6635238-4A3D-4101-B8E2-8356CBF046C2','�Ƿ����û�������������������������',3810)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('C0E4BACF-7A6D-45D4-96CF-F59D8C20E932','E6635238-4A3D-4101-B8E2-8356CBF046C2','��ҵ�ֳ���Ϣ�ҡ����߷����豸�����ģ��Ƿ�ʩ����ƽ��ͼ����Ҫ�󣬰ڷ��������򣬸��ֱ�־����ʶ��ȷ��Ŀ��',3820)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('E7877ADD-2364-4DB4-A879-582B4EA7FFD6','E6635238-4A3D-4101-B8E2-8356CBF046C2','�ֳ���·�Ƿ�ƽ��ͨ�����õ���·���÷���Ҫ��ˮԴ���ú�����ˮӦͨ�����裻',3830)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('584BD139-03F8-4050-99FD-FBAC625ED459','E6635238-4A3D-4101-B8E2-8356CBF046C2','�ж��к���Ʒ����ȼ�ױ���Ʒ���Ƿ���ר�òֿⱣ�ܣ�����ҵ�ֳ���ʱ����ʱ��Ӧ�辯ʾ��ʶ�ƣ���ҪʱӦ��ר�˿�����',3840)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('E4EBF6C2-9477-4381-8B18-9AEDE0E4901D','E6635238-4A3D-4101-B8E2-8356CBF046C2','�ж��к���Ʒ����ȼ�ױ���Ʒ������ҵ�ֳ���ʱ����ʱ���Ƿ��辯ʾ��ʶ�ƣ���Ҫʱ��ר�˿�����',3850)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('98018D10-8DF7-4355-8B26-92F77C78A477','E6635238-4A3D-4101-B8E2-8356CBF046C2','�Ƿ���������������ڴ�ţ����ͼ�ʱ���ռ��д��棬�Ͻ��͵��㵹�����϶Ե��������ȾʱӦ��ȡ��ʩ��������',3860)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('607C3D85-B046-4B31-BE38-B04307BF6648','E6635238-4A3D-4101-B8E2-8356CBF046C2','�������������ᡢ���ޡ���Ե֬���ײ����۳��Ĳ��ϵ��Ƿ����Ʊ��ܣ�',3870)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('6931DA98-25EE-4F05-AD75-3482C3B0A0EF','E6635238-4A3D-4101-B8E2-8356CBF046C2','�������������ᡢ���ޡ���Ե֬���ײ����۳��Ĳ��ϵȶ��ֳ��������ʩ�����Ⱦʱ�Ƿ�ʱ����',3880)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('FCF9625C-CBF2-49DC-8D8A-7F41954D9CCE','E6635238-4A3D-4101-B8E2-8356CBF046C2','��ҵ�ֳ��Ƿ񾭳���ɨ��������࣬����Ӧ���жѷŲ���ʱ����������ָ���ص㣻',3890)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('BC87C434-24B2-433F-A1C3-EAB6EBD7AA7D','E6635238-4A3D-4101-B8E2-8356CBF046C2','���������������Ƿ�Զ���ж��к������������߼����ҵ������',3900)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('5B77B35C-CE6E-48FB-BE6D-1EF7C19F3DB1','E6635238-4A3D-4101-B8E2-8356CBF046C2','�������������ڵĵ�·�Ƿ�ƽ̹ͨ�������㹻��������ʩ��',3910)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('DF02D437-BE27-45FE-9855-E2D84291456D','E6635238-4A3D-4101-B8E2-8356CBF046C2','���������Ƿ�ʱ���������涨����Զ����������ָ���ص㣻',3920)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('BF5BDA83-73A3-44B4-91DC-4F92AB3908E1','E6635238-4A3D-4101-B8E2-8356CBF046C2','���������Ƿ�Զ����ʳ����������ͨ�����ã�',3930)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('B64A052E-8353-407A-8F90-98D58ED37B64','E6635238-4A3D-4101-B8E2-8356CBF046C2','������ˮ�Ƿ����ùܵ����ŷ����涨������',3940)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('BA4FB38F-D853-401F-8928-8EC5C9C17D85','E6635238-4A3D-4101-B8E2-8356CBF046C2','���ֽ�����ʩ�����������������ȣ��Ƿ��㵹��ָ���ص㣻',3950)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('6EB3AE26-F439-4E00-AB2E-181FFC7751BE','E6635238-4A3D-4101-B8E2-8356CBF046C2','���͸��ֽ�����ʩ���������������������Ƿ��з������Ĵ�ʩ��',3960)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('84738CA6-28A2-4698-846C-2AC3C682A4B1','E6635238-4A3D-4101-B8E2-8356CBF046C2','ʩ����������ˮ�Ƿ��ŷŵ�ָ������ˮ���ڣ���Ӧ���Ϲ�����ˮ�ŷű�׼��',3970)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('E219B0C8-C783-4EF3-A1AA-F2DA1C478A08','E6635238-4A3D-4101-B8E2-8356CBF046C2','���ܶ���Χ�ⲿ��������ƻ���Ӱ���ʩ���������������⡢�񶯡����ߡ��۳����������ȾԴ�Ƿ��ȡ��Ӧ�ı�����ʩ��',3980)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('ACDADF07-24B1-4649-9C37-2B3BD6BEBA92','E6635238-4A3D-4101-B8E2-8356CBF046C2','ʩ�������������������нӴ����Ļ�ѧΣ��Ʒ�Ĵ����Ƿ����ݡ�Σ����Ʒ����涨��ִ�У�',3990)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('2317A213-EF21-4AC2-8AF9-9107D3135A72','E6635238-4A3D-4101-B8E2-8356CBF046C2','ʩ�������������Ƿ�ע��Է��ֵĸ�������ı���������ʱ�������ﱣ�����ţ�',4000)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('8B54BD91-93E1-4827-B5B1-ED819640FE89','E6635238-4A3D-4101-B8E2-8356CBF046C2','������ˮ����㣬������ش�����Ƿ�����֯�ŷŵ����ػ�������ָ���Ĺ�����ӵ��',4010)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('9D8666AC-1440-444E-B5E9-60901BA13D19','E6635238-4A3D-4101-B8E2-8356CBF046C2','������Ƿ��ڽ�����������������������',4020)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('E83E12DA-EBD8-4487-874B-A33AF5A1304C','E6635238-4A3D-4101-B8E2-8356CBF046C2','���������Ƿ���ר�˸������ռ�����������ߣ�',4030)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('3F79EF0D-3C29-4267-B8D2-1A3F879EE0BA','E6635238-4A3D-4101-B8E2-8356CBF046C2','���������ĳ������Ƿ�Ӹǡ��ܷ⣬��ֹ;�����䣬��ɻ�����Ⱦ��',4040)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('3A357EB1-6494-460A-9DE1-0D0C2ADDCB52','E6635238-4A3D-4101-B8E2-8356CBF046C2','�������Ƿ�������ҩ��ɱ���Ӭ������ȣ�',4050)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('B1986C0E-37D4-4210-8511-79059933E4D6','E6635238-4A3D-4101-B8E2-8356CBF046C2','�����¯�ų��ķ������Ƿ�ﵽ���ҹ涨�����ŷŵı�׼�����򣬱����������',4060)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('35B89224-3561-4EBC-80CF-EC863B26EF07','E6635238-4A3D-4101-B8E2-8356CBF046C2','�Ƿ������ϵ��ػ������ž����Լල�Ͷ��ڳ�顢��⡣',4070)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('DD2867C5-E587-4270-BCE4-0B0BC978D0F9','18D13FB6-0B9D-4CB0-AC3C-AAA67F27F419','�Ƿ�������ʵ�ʣ��ƶ�ְ��������ѵ�����ƻ������ȫԱ������ʶ��',4080)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('65AC23FB-EC24-489B-B326-B1281B63981E','18D13FB6-0B9D-4CB0-AC3C-AAA67F27F419','�Ը�����Ա����HSE֪ʶ����ʱ���Ƿ�����Ӧ��������ȫ֪ʶ���ݣ�',4090)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('AA461D90-D445-405C-9C2E-D80F3DB68023','18D13FB6-0B9D-4CB0-AC3C-AAA67F27F419','�Ƿ������𵵰���',4100)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('77E14C20-A222-4CE4-A8D4-6DE2BAA9195D','18D13FB6-0B9D-4CB0-AC3C-AAA67F27F419','�Ƿ����÷����־��',4110)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('4980BB91-E7B7-4F4B-88DB-B65405D3CE5B','18D13FB6-0B9D-4CB0-AC3C-AAA67F27F419','�Ƿ�ȷ������Σ��Դ���㣩��ʵ���ϸ�Ĺ���',4120)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('67838BB1-D260-49C9-9A73-FA3AEEEF16F1','18D13FB6-0B9D-4CB0-AC3C-AAA67F27F419','�Ƿ�ʵ�з���Ѳ�죬����Ѳ���¼��',4130)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('8DB511AB-7790-4C7F-ACDD-25DBC8A81DEB','18D13FB6-0B9D-4CB0-AC3C-AAA67F27F419','�Ƿ��ƶ�����Ӧ����ɢԤ����',4140)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('8EC16597-B071-4A93-B3FD-8E32AA64E0F9','18D13FB6-0B9D-4CB0-AC3C-AAA67F27F419','�Ƿ�����֯����������',4150)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('EF2770B7-B79B-401A-AF9C-EEA83E640450','18D13FB6-0B9D-4CB0-AC3C-AAA67F27F419','�Ƿ��κε�λ�����˲����𻵻�������ʹ�á������ͣ��������ʩ�����ģ�������ѹ��Ȧռ����˨��',4160)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('27547867-E33E-4044-A1D0-F2C38635AA30','18D13FB6-0B9D-4CB0-AC3C-AAA67F27F419','�Ƿ�ռ�÷����ࣻ ',4170)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('0C9F8839-E3B4-4CD1-A2FA-C1306580D372','18D13FB6-0B9D-4CB0-AC3C-AAA67F27F419','�Ƿ��������ͨ����',4180)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('94F55EB1-4653-47FC-80D5-D18B6AF13990','18D13FB6-0B9D-4CB0-AC3C-AAA67F27F419','�ƶ�ʽ������������Ƿ�������ƹ淶��ʩ���ֳ�ʵ����Ҫ�����к������ã�',4190)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('C7EF79BD-0795-47FE-9709-F8F205897585','18D13FB6-0B9D-4CB0-AC3C-AAA67F27F419','���ĵİڷ�λ���Ƿ�������־����������Ų�ã�',4200)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('D3CF500A-3D84-4677-A60A-F5BDC6D2EAF8','18D13FB6-0B9D-4CB0-AC3C-AAA67F27F419','�Ƿ��ո����ƶ�ʽ�������ĵ�ʹ�ü�����Ҫ�󣬰��ڼ�顢��װҩ����',4210)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('91B69EEB-608E-403C-93D2-BA677565FE1B','18D13FB6-0B9D-4CB0-AC3C-AAA67F27F419','�����ƶ�ʽ����������ģ��Ƿ���Ʊ�����װ�ͼ��ҩ�����ڣ�����ר�˸���ά��������',4220)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('07E13966-8560-4A11-B04E-24BEE081B1FC','18D13FB6-0B9D-4CB0-AC3C-AAA67F27F419','������㲿���Ƿ���ã�����Ǧ��ɿ���',4230)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('ADF2FB16-F38C-4CC2-8402-EC3D214E0B1A','18D13FB6-0B9D-4CB0-AC3C-AAA67F27F419','�Ƿ�����ȫ������ʩ�����Ĺ���̨�ʣ�',4240)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('9101E9C4-1AEF-4566-85A7-D9CE9D10EC48','18D13FB6-0B9D-4CB0-AC3C-AAA67F27F419','�Ƿ���ʵ��¼������ʩ���ճ�����ͼ�������',4250)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('EFE497D7-C2B6-4AF8-91ED-530E7B6C224D','B1758ADE-5B0C-40EC-B400-5C382EDCF4CA','�Ƿ�����ȫ����ĿHSE��֯����',4260)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('B1989595-91A5-47F3-8B7F-AC3B96B7B383','B1758ADE-5B0C-40EC-B400-5C382EDCF4CA','�Ƿ�����ȫ����ĿHSE������ϵ',4270)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('AE42E8DE-9795-4204-840A-D049DE1F49F7','B1758ADE-5B0C-40EC-B400-5C382EDCF4CA','��ĿHSE��֯������������ϵ�����Ƿ񾭹�����',4280)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('6A7E24FD-5C35-483A-B7E7-69B01842464F','B1758ADE-5B0C-40EC-B400-5C382EDCF4CA','�Ƿ�����ȫ����ĿHSE�����¼��̨��',4290)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('6B81B783-8EC6-410D-A5D3-3B7C379CC0B9','B1758ADE-5B0C-40EC-B400-5C382EDCF4CA','�Ƿ��ڼ��ʩ����λHSE�����¼��̨��',4300)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('E2A3F1AA-BCCB-4076-B21F-7D065B4448C4','803A5E17-7DF1-4B6D-9409-E0E0F5D39DDD','�ڿ���ǰ�Ƿ������ư�ȫ��������/��ʩ',4310)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('05FF76AC-0254-4007-8520-783270CF8C26','803A5E17-7DF1-4B6D-9409-E0E0F5D39DDD','�Ƿ������ʱ�õ簲ȫ����������',4320)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('64BD9A68-6F3B-4FDA-A13B-EEE712C1C999','803A5E17-7DF1-4B6D-9409-E0E0F5D39DDD','�Ƿ���Ƹߴ���ҵ��ȫ��������/��ʩ��',4330)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('77BC8332-7AE8-483A-B9E4-7AD4A1A30CC6','803A5E17-7DF1-4B6D-9409-E0E0F5D39DDD','�Ƿ�������ء�������ҵ��ȫ��������/��ʩ��',4340)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('1AD429A1-6009-4072-9A36-359AFBC87C75','803A5E17-7DF1-4B6D-9409-E0E0F5D39DDD','�Ƿ������ƺ��伾��ʩ����ҵ��ȫ��������/��ʩ������������',4350)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('D3743142-372D-443F-B220-8D7BF0663C7E','803A5E17-7DF1-4B6D-9409-E0E0F5D39DDD','�Ƿ�������������ҵ��ȫ��������/��ʩ��',4360)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('6EF7D2FA-0616-4764-A2BD-36C1F8A56964','803A5E17-7DF1-4B6D-9409-E0E0F5D39DDD','��ȫ��������/��ʩ�Ƿ����������Ҫ���ݣ�����˵���ͱ��Ƶ����ݡ�������Ŀ�ſ�����Ҫʩ����ҵ�����衢����İ�ȫ�����ʩ����ȫ��ʩ�з����Ļ��������������ߺͲ��ϡ���ص�ͼ������˵���ȣ�',4370)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('A6CDD328-5397-4E18-865B-2CA5C54C49F7','803A5E17-7DF1-4B6D-9409-E0E0F5D39DDD','�Ƿ���ϱ�д��������׼����',4380)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('BFC2457D-3AFA-488E-AF03-314CE052BE14','803A5E17-7DF1-4B6D-9409-E0E0F5D39DDD','ʩ���ְ����Ƿ���֯������Ա��ȫ��ʩ����Ա���н��ף������ü�¼�����ܽ��׵�ʩ����ԱӦ�ڼ�¼��ǩ�֣�',4390)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('9243AD28-649B-40BF-8BBB-87760F77723D','803A5E17-7DF1-4B6D-9409-E0E0F5D39DDD','ʩ���ְ����Ƿ�����֯���йز�����ԱЭ������ʵ����鰲ȫ��������/��ʩ�еĸ������',4400)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('99075B34-E0EC-4C3E-905E-93BC1C4B192A','B8F280FA-3CAC-43FD-98AE-B759FCD8287D','�Ƿ����ʩ���ֳ�������Ա������ʱ���ڣ�����ͳһ��������������ȫñ������ֺЬ��',4410)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('D78571AC-4734-444E-BA27-36C71AEDE51E','B8F280FA-3CAC-43FD-98AE-B759FCD8287D','���˷�����Ʒ�Ƿ���ȷ������Ͻ���������ϵ�ۡ���ȫñ��ϵ������ֺЬ����Ь���Ȳ��淶��Ϊ��',4420)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('03A8306C-E432-420F-88B8-79846D5D9275','B8F280FA-3CAC-43FD-98AE-B759FCD8287D','���˷���������ȫñ����Ŀ������ֺЬ�Ƿ���ڻ죨�裩������',4430)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('4EB9FAFC-C889-4AD2-A2EC-67BF5828C709','B8F280FA-3CAC-43FD-98AE-B759FCD8287D','�Ƿ�������Σ������Ҫĳ�ַ������ܣ�ѡ�û��ֹѡ��ĳ�ָ��˷�����Ʒ��',4440)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('75157A2D-01B9-499B-AD18-80B4B4F60277','B8F280FA-3CAC-43FD-98AE-B759FCD8287D','ʩ����λHSE�������Ƿ��ڼ����˷�����Ʒʹ������������ü���¼��',4450)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('C0DF4B57-EDBC-46DC-80DE-7923BCC8F9E1','DE7930B3-94A0-44AE-8479-39592EC9BAAB','ʩ���ְ���Ӧ�Ƿ��ȡ���ַ�ʽ����HSE�����������',4460)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('A55088FB-D36B-4D73-9DEE-BE2D8BF3F9CA','DE7930B3-94A0-44AE-8479-39592EC9BAAB','ʩ���ְ����Ƿ��ڹ��ҡ���ȫ�����¡�����  119����ܣ������绷���ա��ڼ��Ա������HSE�����������',4470)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('260AA45A-A89C-4AB6-B429-F6D11EDA89A3','DE7930B3-94A0-44AE-8479-39592EC9BAAB','ʩ���ְ����Ƿ�����ʩ��������������ؾ�ʾ��־��HSE��ʾ��ʶ������ȫ��ʾ��־������ʾ��־�������������־��������ȫ��־�ȣ�',4480)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('EF56C7C4-A662-4765-A36A-C14C64C09D34','DE7930B3-94A0-44AE-8479-39592EC9BAAB','�ڴ���Σ���Ըߵ���ҵʱ�����磺��װ��ҵ���ߴ���ҵ�����޿ռ���ҵ��ҹ����ҵ�������Ի�����ҵʱ�Ƿ���а�ȫ��ʾ��',4490)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('B0BA1C0F-6C2B-4890-894B-5D043D38BB70','DE7930B3-94A0-44AE-8479-39592EC9BAAB','Σ�ղ�λ�ľ�ʾ��־�Ƿ���������¥�ݿڡ����ݾ��ڡ��׶��ڡ������ڡ�����ڡ����ӱ��صȣ�',4500)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('B962DA39-DD78-4DAA-99B3-E4618E50296D','DE7930B3-94A0-44AE-8479-39592EC9BAAB','�Ƿ��ڽ�����������ָ���־����������ڷ�����ɢͨ������ȣ�',4510)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('6768C9A2-2665-4A2E-9EF9-0F7B4271118E','DE7930B3-94A0-44AE-8479-39592EC9BAAB','�Ƿ����������������־�����������͹�ҵ�������ֿ���ţ����ֱ���б�ʶ��',4520)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('0F8353DB-6E22-45ED-A36D-10B674AF5F1E','DE7930B3-94A0-44AE-8479-39592EC9BAAB','�Ƿ��������ʩ������ʾ�Ա�ʶ����𾯵绰������˨������ˮ����������ȴ�ŵ�λ�á�',4530)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('660D5D97-A4BD-4209-B144-9A1F3D03B61B','D3ADAF1D-7799-42E9-BBFD-EB89D93DBED6','ȫ��Ա���Ƿ�μ���ҵ����֯��һ��HSE��ѵ��',4540)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('41F8B528-3695-41AE-8D19-61FE8B26ADC1','D3ADAF1D-7799-42E9-BBFD-EB89D93DBED6','ȫ��Ա���Ƿ�μ����ܳа�����֯�Ķ���HSE��ѵ��',4550)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('2CC203C3-4639-4CCA-A584-8B1BD0EC91D4','D3ADAF1D-7799-42E9-BBFD-EB89D93DBED6','�Ƿ��ȫ��Ա�������˽����ֳ�ǰ������HSE��ѵ�����˳ɼ��Ƿ�LPEC HSE����ȷ�ϲ�������',4560)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('A2028EB9-87B6-47C1-84DC-CAD9955850F8','D3ADAF1D-7799-42E9-BBFD-EB89D93DBED6','�Ƿ��������ҵ��Ա��������ѵ��',4570)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('AD9A6482-A252-4C19-8846-6567B5557265','D3ADAF1D-7799-42E9-BBFD-EB89D93DBED6','���н���ʩ���ֳ��Ĺ�����Ա������֮ǰ���Ƿ������һ��HSE��ѵ�ϸ�֤����֤�ϸڣ�',4580)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('034246CA-CF2E-4F3B-9278-5176A3DEFF7D','D3ADAF1D-7799-42E9-BBFD-EB89D93DBED6','���н���ʩ���ֳ��Ĺ�����Ա������֮ǰ���Ƿ�������HSE��ѵ�ϸ�֤������HSE��ѵ�ϸ�֤�ԡ�ñǩ������ʽ��ʶ�����',4590)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('BDC6D8DC-1431-401C-AF99-96E74C773C28','D3ADAF1D-7799-42E9-BBFD-EB89D93DBED6','�Ƿ������HSE��ѵ�ϸ�֤�߽���ʩ���ֳ�������',4600)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('BA776D04-038F-4929-A3C0-967FFD39EF63','5AEB3327-BA14-4405-A687-B30AAA81D5A8','�Ƿ�����˲�����1Сʱ��HSE��ѵ��',4610)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('C23C4E32-1076-4AFA-906A-832F0ECAF0DD','5AEB3327-BA14-4405-A687-B30AAA81D5A8','�Ƿ�浵HSE��ѵ��¼��',4620)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('7B886ED1-7C70-4047-8BF8-A30592A684AB','5AEB3327-BA14-4405-A687-B30AAA81D5A8','�Ƿ��������зÿͣ�����֮ǰ���������ÿ�֤����֤�볡��',4630)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('26849148-9F1B-4B3E-BF76-9C410301F3B3','5AEB3327-BA14-4405-A687-B30AAA81D5A8','�Ƿ�����޷ÿ�֤�ķÿͽ���ʩ���ֳ�������',4640)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('4AFEB979-9833-47DF-BBDE-0D9D347523DC','5AEB3327-BA14-4405-A687-B30AAA81D5A8','��ʱ�ÿͽ����ֳ��Ƿ񴩴���װ����ȫñ��',4650)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('E09803D8-4102-44D5-ACE9-DC8E4CBA0163','5AEB3327-BA14-4405-A687-B30AAA81D5A8','��ʱ�ÿͽ����ֳ��Ƿ�Υ��Я���̻�',4660)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('E0A7D084-1A74-4290-871D-AD96C116A10C','6FF1023B-FCDE-4EC5-9778-439CA1D1D0D7','�Ƿ���ʩ���ֳ�ͨ��֤��',4670)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('716C2ABD-770E-4573-9541-781943BA8669','6FF1023B-FCDE-4EC5-9778-439CA1D1D0D7','˾���Ƿ��м�ʻ֤���г�֤��',4680)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('C1FBF300-A2BE-47BA-B48E-90F1C391AF76','6FF1023B-FCDE-4EC5-9778-439CA1D1D0D7','�Ƿ񰴹涨·�ߡ��ٶ���ʻ��',4690)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('78D4137B-6399-4181-B1CA-1EC3EE6FC97F','6FF1023B-FCDE-4EC5-9778-439CA1D1D0D7','�Ƿ�ָ��λ��ͣ�ţ�',4700)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('24BCE911-6542-4E93-98AF-28553185D14C','6FF1023B-FCDE-4EC5-9778-439CA1D1D0D7','�Ƿ��а�ȫ������ʩ��',4710)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('1FC75E2D-B7FE-4D84-ABBE-AC0341C6F337','6FF1023B-FCDE-4EC5-9778-439CA1D1D0D7','˾���Ƿ����ƣ�ͻ�ƺ�ݳ���',4720)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('96550036-7E3A-4092-81CA-597EA9F6BC4F','6FF1023B-FCDE-4EC5-9778-439CA1D1D0D7','�Ƿ�����HSE��ѵ�ϸ�֤���޷ÿ�֤��Ա��',4730)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('CB4BB408-7A09-4499-BFE7-337C34A132B8','6FF1023B-FCDE-4EC5-9778-439CA1D1D0D7','������Ʒ�Ƿ�Ӱ�컷����',4740)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('6CD12146-0EDE-48D1-A96B-BD8A169FDC16','6FF1023B-FCDE-4EC5-9778-439CA1D1D0D7','�Ƿ������Υ����Ʒ��',4750)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('5909A868-89CC-4467-94F1-B27EDD7160A7','A44B1736-4563-4773-8C2D-140C6A76F103','�Ƿ����з���������֯��������Ч���У�',4760)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('20D9E3B3-86C8-4ABF-B9C1-146E69A3268E','A44B1736-4563-4773-8C2D-140C6A76F103','�Ƿ�����˷���������������������棻',4770)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('7CB59FEF-863D-4B6B-8D15-B9FE29A9C0DA','A44B1736-4563-4773-8C2D-140C6A76F103','���������Ƿ�ȱ�����Ӧ���������������ݣ�a)	����ֲ�����λ�������Ƽ���飻b)	����С����ɼ�����ʱ�䣻c)	�����������ֶΣ�d��������������������ʩ���Ա����ʽ��ʾ��',4780)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('7C15A070-60BA-4CD6-BAF6-DF42D0C98B1D','A44B1736-4563-4773-8C2D-140C6A76F103','�����Ƿ�LPEC HSE�������������ش�������LPEC��Ŀ������������',4790)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('D9AA06FF-E48F-4866-9BB2-EF0C28A4D594','A44B1736-4563-4773-8C2D-140C6A76F103','ʩ���ְ����Ƿ����ݱ�����֯ʵʩ����������',4800)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('86F55BBA-1F87-4430-8C65-FAC700A55519','A44B1736-4563-4773-8C2D-140C6A76F103','ʩ���ְ����Ƿ�������������������Լ죻',4810)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('1309205F-ED13-480B-9FE5-D27DA572C642','A44B1736-4563-4773-8C2D-140C6A76F103','ʩ���ְ����Ƿ�������������ϱ�LPEC��Ŀ���������գ�',4820)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('D0E10844-A4A1-48EF-990F-F7AB385EAD4B','0DE6C919-02AD-4297-B6E1-D0D60C31DEA7','�Ƿ�������ֳ�HSEӦ��Ԥ����',4830)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('6DAB73C4-0EC1-43B7-9234-1FD8AC5D73E5','0DE6C919-02AD-4297-B6E1-D0D60C31DEA7','Ӧ��Ԥ�������Ƿ�ȱ�����Ӧ�������о������ݣ�
a)	����Ǳ���¹�Σ�յ����ʡ���ģ������״̬����ʱ�Ŀ��ܹ�ϵ��
b)	�ƶ����ⲿ������ϵ�ļƻ��������������Ԯ�����������ϵ��
c)	��ʩ���ⱨ����ͨѶ����Ĳ��裻
d)	Ӧ��ָ�����ĵĵص����֯��
e)	�ڽ���״̬���ֳ���Ա����Ϊ���������벽�裩��
f)	�ڽ���״̬�£����ֳ���Ա��������Ա����Ϊ��
g)	Ӧ��Ԥ���������Դ���ˡ������豸����õ������ͷ�ʽ��
h)	�ط������ͽ�����������ĵ�ַ�͵绰���������緽ʽ��
i)	Ӧ���豸�����ʣ�',4840)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('2AC2B10D-7A96-4A8E-B48F-E307B9F46733','0DE6C919-02AD-4297-B6E1-D0D60C31DEA7','ʩ���ְ����Ƿ�����˳���Ӧ��ָ�Ӳ�������ȷ��Ҫְ��',4850)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('E8892F7C-4204-4B64-A2C3-4B83225C4439','0DE6C919-02AD-4297-B6E1-D0D60C31DEA7','ʩ���ְ����Ƿ���Ӧ��Ԥ���ļƻ�����֯ʵʩ��Ӧ��������һ��ÿ����һ�Σ���',4860)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('24A81BA6-7F36-400D-B95F-481051B3445F','0DE6C919-02AD-4297-B6E1-D0D60C31DEA7','ʩ���ְ����Ƿ�浵��Ӧ��������¼��',4870)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('9305942E-EC46-4461-9EF0-E2CC36BBC7A6','0DE6C919-02AD-4297-B6E1-D0D60C31DEA7','ʩ���ְ����Ƿ��н���״̬�µ�Ӧ���¼����ò��裻',4880)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('016609DB-78E8-4488-9C12-11B628E12B18','0DE6C919-02AD-4297-B6E1-D0D60C31DEA7','ʩ���ְ����Ƿ���¹ʽ��е�������������涨�����ƺ����ˣ�',4890)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('1D000E88-3599-4459-BB2D-248225824243','1AFA2D62-681A-4D58-86FA-E40C8B13DD88','�Ƿ���ȷ�涨���ļ������ϵĿ��Ʒ�Χ��',4900)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('E86D19BB-77B2-48AA-A6C0-C5FF9DF3507C','1AFA2D62-681A-4D58-86FA-E40C8B13DD88','�Ƿ���ȷHSE��Ϣ���ļ������Ȩ�ޣ�',4910)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('F9EE02E6-7B80-49DD-93BF-666FF1851B38','1AFA2D62-681A-4D58-86FA-E40C8B13DD88','ʩ���ְ����Ƿ�ר�˶�HSE��Ϣ�����������������ռ����������ࡢ���ݵȣ�',4920)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('01EC3F28-A91E-46E9-B2D2-D8D5C901D4F3','1AFA2D62-681A-4D58-86FA-E40C8B13DD88','�Ƿ�������HSE�йص��ļ�����¼�����桢���Ⱦ����ཨ��̨�ʣ���������Ա���еǼǴ浵��',4930)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('581E13C1-F16F-4ACE-B400-F40C6C097C01','1AFA2D62-681A-4D58-86FA-E40C8B13DD88','ʩ���ְ����Ƿ����й鵵���Ͼ���Ψһ�ı���ұ��������',4940)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('31B45DAA-5BD6-4CC7-83B5-16D6A09641A8','1AFA2D62-681A-4D58-86FA-E40C8B13DD88','ʩ���ְ���HSE��Ϣ���ļ����Ĺ����Ƿ����н��Ĺ���������',4950)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('9390BD32-7DE0-4A34-96D9-BAB69C55D800','F7AA4D86-D92A-4683-B7AD-A11BF9D9EA5B','�Ƿ������鳤��ȫ���������ƶȣ�',4960)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('15835C33-C89E-4661-B2F4-5F4FEE81FCA7','F7AA4D86-D92A-4683-B7AD-A11BF9D9EA5B','�Ƿ���ְ����ȫ���������ƶȣ�',4970)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('187FAF71-0A83-4A53-A3C7-EF3C735ED511','F7AA4D86-D92A-4683-B7AD-A11BF9D9EA5B','�Ƿ������ְ�������˹��֣���λ����ȫ���������������Ժϸ�',4980)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('57378A1F-FE57-4895-B3EC-1CD2655ABBD7','F7AA4D86-D92A-4683-B7AD-A11BF9D9EA5B','������Υ��ְ����ʩ����λ�Ƿ����Υ�����ٽ����������Ժϸ�',4990)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('29265703-23FB-4BAD-B47C-F7699CE2874B','F7AA4D86-D92A-4683-B7AD-A11BF9D9EA5B','�Ƿ���������ÿ��һ��������1��Сʱ���ҵ�ʱ�俪չ��ȫ���ÿ�°�ȫ�ʱ�䲻������4Сʱ��',5000)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('50A6AC69-49F2-4E3A-A8D9-E159022B9F67','F7AA4D86-D92A-4683-B7AD-A11BF9D9EA5B','��ǰ��ȫ�����Ƿ�����������һ�塱��',5010)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('F5954DFE-7C8B-4893-81CC-80DA82E872B2','F7AA4D86-D92A-4683-B7AD-A11BF9D9EA5B','�Ƿ��������鰲ȫ�����Ͱ�ǰ��ȫ�����ɰ��鳤ָ��һ��ְ�������¼����¼Ҫ����鳤�Ľ���ͬ�����У�',5020)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('9C49D294-C005-4259-8BC7-9901AE4E28D3','889BE6F2-C413-4EC5-8F42-6CAA3EB2724D','�Ƿ������ϸ�ʩ����ƽ�沼��ʩ�������衢���ߡ����ϲ�������ڷŻ��޼ƻ����裻',5030)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('D147FE77-F7F0-460E-AC9C-A96C53C6F61B','889BE6F2-C413-4EC5-8F42-6CAA3EB2724D','�Ƿ���ȷ����Ͷ�������Ʒ��ͳһ��װ������HSE�涨��',5040)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('8F56B6B3-C76E-45B0-BDED-718DD76554EA','889BE6F2-C413-4EC5-8F42-6CAA3EB2724D','�Ƿ��ֳ�������֯��ɨ�������ֳ������������ɾ������ࣻ�Ͻ��洦��С�㣻�豸�����������ϱ���������������Ͳ����������������֣�',5050)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('8E9FC292-5832-4F77-BBE9-75C9D96EB843','889BE6F2-C413-4EC5-8F42-6CAA3EB2724D','�Ƿ�ʩ���ֳ����������÷�����������䣬��ʱ�������ϡ����ϣ�',5060)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('9C98ABED-0D8E-4FCE-8732-BF8870A8286F','889BE6F2-C413-4EC5-8F42-6CAA3EB2724D','���߷����Ƿ�Ҫ������ڷţ����������Ͼ������壻',5070)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('F556EE5F-0AC3-48F5-A7CD-84F864F06B3F','889BE6F2-C413-4EC5-8F42-6CAA3EB2724D','�ֳ���ˮ�ߡ����¡����ߡ��纸���ߡ��������Ƿ�ͳһ�滮�������ã�',5080)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('6EBACB4C-EEB1-4A9A-A68B-DE0E72C28AC8','889BE6F2-C413-4EC5-8F42-6CAA3EB2724D','�Ƿ��������鰲ȫ�����Ͱ�ǰ��ȫ�����ɰ��鳤ָ��һ��ְ�������¼����¼Ҫ����鳤�Ľ���ͬ�����У��������������纸����ÿ���չ����̺ã�',5090)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('8F47290E-18DB-4CA3-AFBB-E942A5A3EF9B','889BE6F2-C413-4EC5-8F42-6CAA3EB2724D','ʩ���ֳ��Ƿ��䱸��Ҫ�ļ�����Ʒ�;Ȼ�������',5100)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('EA26D0B2-4FB3-4CB4-A064-DAEEE7C3174F','889BE6F2-C413-4EC5-8F42-6CAA3EB2724D','ʩ���ֳ���·�Ƿ�ָ��ר����ɨ��������ˮ����ֹ�������',5110)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('83F8C4ED-9695-4E17-B01C-3CD257B3BCC8','889BE6F2-C413-4EC5-8F42-6CAA3EB2724D','�ܱ�������ʩ���Ƿ��ȡͨ���ʩ���ڷ۳�������ҵ����Ա���Ƿ�����������֣�',5120)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('2C9724D0-B1AD-4DAC-935B-099C97600F99','889BE6F2-C413-4EC5-8F42-6CAA3EB2724D','ʳ���Ƿ�������֤������������ֹʳ���ж��¼��ķ�����',5130)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('D275A8B0-EE2A-4B23-9426-2A9BACE156AC','8A6E4DD8-8433-4080-8F91-A538EA8F0CFE','ʩ���ְ�����Ŀ���Ƿ��ƶ��˱���λ��ְҵ��������ְ��',5140)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('A537B032-ED18-470F-A861-D31ED3EF0BA5','8A6E4DD8-8433-4080-8F91-A538EA8F0CFE','�Ƿ�����������Ŀְҵ������ְҵ�����ι����������ȫְҵ������������ƶȣ��ƶ�����Ŀְҵ������ְҵ�����ι����ƻ���ְҵ��������ʵʩϸ�򣬲��ලʵʩ��',5150)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('51D72675-154B-459E-B598-9D5CEAF556D1','8A6E4DD8-8433-4080-8F91-A538EA8F0CFE','�Ƿ����ְ��ִ�в�����̣��ռ���������֪ʶ����ȷʹ���Ͷ�������Ʒ�ͷ����������ģ�',5160)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('C749B642-15D0-403D-8D74-AF26DFB1DC3B','8A6E4DD8-8433-4080-8F91-A538EA8F0CFE','�Ƿ񰴹涨��֯������ҵ��Ա���н�����飻',5170)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('F05D05B8-7849-41C3-B15B-98E3FDEE3DAA','8A6E4DD8-8433-4080-8F91-A538EA8F0CFE','ʩ����ҵ�ĳ����������ߡ������ȷ�����ʩ���Ƿ��ǿά�޹���ȷ����ã�',5180)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('249ACBF2-07B0-447C-A415-409D825061DA','8A6E4DD8-8433-4080-8F91-A538EA8F0CFE','�ھ����ᡢ��ȸ�ʴ���ʻ�ѧ����Σ�յĳ����Ƿ����ϴ�豸��',5190)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('EDFEDA04-68F9-4901-973E-28E811212F78','8A6E4DD8-8433-4080-8F91-A538EA8F0CFE','�Ƿ��ϸ�ִ�з���������ʩ�͹����ƶȣ�',5200)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('BDF99630-4919-4F30-9B2C-1490AC8C1B07','8A6E4DD8-8433-4080-8F91-A538EA8F0CFE','ְҵ������ְҵ�����ι�������Ĺ����ѡ������豸���÷ѣ��Ƿ���Ա�֤��ר��ר�ã�',5210)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('4C151F05-AF68-4084-A85C-454F223D65E3','8A6E4DD8-8433-4080-8F91-A538EA8F0CFE','ʩ���ְ����Ƿ�����ְ����������1000����רְְҵ����������Ա1�ˣ�����1000�����ְְҵ����������Ա1�ˣ�',5220)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('EA323602-4145-481B-A04C-E40680EB9AA9','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','ʩ���ְ�����Ŀ���Ƿ�����ȫʩ���ֳ��Ĺ�����ȫ���ΰ�������֯��������ʵ������ȫ���������ƣ�',5230)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('7A905765-D116-40E2-A03D-590B606337A8','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','�Ƿ�����ȫ������ȫ���ΰ�������������ƶȣ�ȷ������ʩ����',5240)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('923C3BFA-593E-4A5A-ABF5-EB366B555D38','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','�Ƿ�����ֳ���������Ա���ҵ��ͳһ�������ֳ�����֤��������Ա�ڰ������֤֮ǰ�Ƿ񾭹�ҵ����һ��HSE������',5250)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('8384E6B9-F47C-4C8E-86FC-A1D2649554C0','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','���й���ʱ�Ƿ񰴹涨��װ�������Ϲ���Ҫ����ͱ���װ��',5260)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('A137CE85-6F29-48AA-A860-309C3099391C','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','�Ƿ���ڳ�����Υ��������Ϊ��',5270)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('95942586-E9E9-4EF2-932C-6BADC43BE92D','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','�Ƿ���ڳ��������ƺ�������Ϊ��',5280)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('C4708DB3-8B4A-492A-928F-D9353A1E2DE9','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','�Ƿ���ڳ����ڶ�Ź�ͶĲ���Ϊ��',5290)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('153AF25E-FA1B-4FE4-84E7-DAFD7681F00A','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','�Ƿ�Я����ʹ�����������Ƶ��߻�������������Ϊ������',5300)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('96B8A94F-7546-4F04-9EB3-FCF2C6C731C8','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','ʩ���ְ����Ƿ����Լ���ʩ���������ʱ��ʩ��Χ��װΧ���ʹ��ţ�������������',5310)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('0ED14A5A-221F-493F-8E42-395C45C80575','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','�Ƿ�������ʩ���ֳ��ڹ�ҹ��ҹ��ʩ���Ƿ�������ҵ��������',5320)
GO

INSERT INTO dbo.HSSE_Check_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('A128C4B0-2900-4028-A6A5-D49D7843E8D8','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','�Ƿ���ڲ�����������������ȡ�֣�á�������������Ա������',5330)
GO


INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('3EC2676A-70EB-400E-BE17-EEBBA0B7E9D7','��ȫѲ������*','BaseInfo/HazardRegisterTypes.aspx','BookNext',280,'0','Menu_BaseInfo',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('9DC6A654-B014-48DA-9A33-972FC782D2B3','3EC2676A-70EB-400E-BE17-EEBBA0B7E9D7','����',1)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('AB4EFF59-5CEA-41CA-AA62-58EA1A4CEF39','3EC2676A-70EB-400E-BE17-EEBBA0B7E9D7','�޸�',2)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('D9CCA30D-CEAA-4D67-A252-508479C474D5','3EC2676A-70EB-400E-BE17-EEBBA0B7E9D7','ɾ��',3)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('7F9EAADC-69F4-4D97-8E0B-B6DB4919225E','3EC2676A-70EB-400E-BE17-EEBBA0B7E9D7','����',4)   
GO

INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('60BFBA33-B5C7-4EBF-A4AE-1B820559676D','�쵼��������*','BaseInfo/HazardRegisterTypesSupervision.aspx','StatusBeRightBack',290,'0','Menu_BaseInfo',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('4168B0FC-DE0F-44EB-817B-7C4A9CF0A935','60BFBA33-B5C7-4EBF-A4AE-1B820559676D','����',1)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('597FE459-20B4-49A5-9BAD-9400DA097804','60BFBA33-B5C7-4EBF-A4AE-1B820559676D','�޸�',2)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('55375D6F-F54D-48B5-9CCF-E413EADFFB25','60BFBA33-B5C7-4EBF-A4AE-1B820559676D','ɾ��',3)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('189F09F3-8EE4-4D16-A5BD-18A48309300A','60BFBA33-B5C7-4EBF-A4AE-1B820559676D','����',4)   
GO

INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('015F94F0-F2EB-403F-B8CA-FF44AB9BDA5B','��������Ϣ*','BaseInfo/PunishItem.aspx','Vcard',300,'0','Menu_BaseInfo',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('36236A68-5D44-4C0A-9C49-11C3C0975865','015F94F0-F2EB-403F-B8CA-FF44AB9BDA5B','����',1)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('74E06191-73D1-49C9-8B1E-167DA39FD5A3','015F94F0-F2EB-403F-B8CA-FF44AB9BDA5B','�޸�',2)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('5C7A5EA3-5F4E-47D5-A983-4CAE54F682D7','015F94F0-F2EB-403F-B8CA-FF44AB9BDA5B','ɾ��',3)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('D77409F9-2900-4013-8FB0-565F79D8E830','015F94F0-F2EB-403F-B8CA-FF44AB9BDA5B','����',4)   
GO

--APP������
INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('7E7245CF-9820-43A6-AD45-D156601467DD','APP������','','Phone',105,'0','Menu_Project',0,0)
GO

	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('2FC8AA2A-F421-4174-A05E-2711167AF141','�ճ�Ѳ��','HiddenInspection/HiddenRectificationList.aspx','PageHeaderFooter',10,'7E7245CF-9820-43A6-AD45-D156601467DD','Menu_Project',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('E831F780-BDC2-4644-B132-40E27518805E','2FC8AA2A-F421-4174-A05E-2711167AF141','����',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('9112B8B8-50A0-4592-AE06-2AC24E07E20B','2FC8AA2A-F421-4174-A05E-2711167AF141','�޸�',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('3FF03C33-A07D-48CF-A0E2-D7A7542FBD69','2FC8AA2A-F421-4174-A05E-2711167AF141','ɾ��',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('55598440-05EF-4E70-86E6-81317BF19D94','2FC8AA2A-F421-4174-A05E-2711167AF141','����',4)
	GO
	
	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('23855EB9-0BB1-4B3E-BA69-3C0222F5E2A4','�ճ�Ѳ���¼','HiddenInspection/HiddenRectificationRecord.aspx','PageHeaderFooter',20,'7E7245CF-9820-43A6-AD45-D156601467DD','Menu_Project',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('020C87A9-3C0A-4FF1-83F0-4F97015D8F43','23855EB9-0BB1-4B3E-BA69-3C0222F5E2A4','����',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('B8609CF6-5D2E-4C9C-AF2A-EF4A2AAF265A','23855EB9-0BB1-4B3E-BA69-3C0222F5E2A4','�޸�',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('9E976E09-D98E-4577-98D5-908CFD142AE6','23855EB9-0BB1-4B3E-BA69-3C0222F5E2A4','ɾ��',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('E1BDC47A-CB50-4210-ACE6-604589BE22F2','23855EB9-0BB1-4B3E-BA69-3C0222F5E2A4','����',4)
	GO
	
	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('B7A5F84B-843A-4C13-9844-023D8B4A41AC','ר����','HiddenInspection/CheckSpecial.aspx','PageHeaderFooter',30,'7E7245CF-9820-43A6-AD45-D156601467DD','Menu_Project',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('FFE04B9A-7BAE-4409-ADFA-971954E1BA59','B7A5F84B-843A-4C13-9844-023D8B4A41AC','����',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('81D6834F-0080-4C80-9A97-FAF9D001E474','B7A5F84B-843A-4C13-9844-023D8B4A41AC','�޸�',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('52760F7F-08A6-4D2C-94BF-781FFA0DD6BD','B7A5F84B-843A-4C13-9844-023D8B4A41AC','ɾ��',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('28B81B5F-33DF-40EA-866F-0BB1D0422F05','B7A5F84B-843A-4C13-9844-023D8B4A41AC','����',4)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('1197B868-1152-46E3-9892-0A2C403D4A53','B7A5F84B-843A-4C13-9844-023D8B4A41AC','�ύ',5)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('00CF924E-70DE-4130-AF7D-58B93E0D3AB7','B7A5F84B-843A-4C13-9844-023D8B4A41AC','���',6)
	GO
	
	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('247B76AA-01BF-4A40-BB4C-B3EAF441F538','�쵼����','HiddenInspection/SafeSupervision.aspx','PageHeaderFooter',40,'7E7245CF-9820-43A6-AD45-D156601467DD','Menu_Project',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('784A73D6-BE99-41CF-97CA-EB123EF00825','247B76AA-01BF-4A40-BB4C-B3EAF441F538','ɾ��',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('5221A77B-1891-40E1-AB7B-6D7EE0D7F633','247B76AA-01BF-4A40-BB4C-B3EAF441F538','����',2)
	GO
	
	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('D322F726-B4D3-4807-BA5F-3ADF91E1F084','Ѳ�����(ͼ��)','HiddenInspection/RiskAnalysisChart.aspx','PageHeaderFooter',50,'7E7245CF-9820-43A6-AD45-D156601467DD','Menu_Project',1,0)
	GO
	
	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('D0A9B1CC-493F-4CAC-9EC9-C3A89D1D5DB3','������Ա��ְ���','HiddenInspection/ManagerPerformance.aspx','PageHeaderFooter',60,'7E7245CF-9820-43A6-AD45-D156601467DD','Menu_Project',1,0)
	GO

    INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('9959896B-67DB-43C8-B1D2-EDAFDD7F5A27','��λΥ��ͳ����ϸ��','HiddenInspection/UnitViolationStatistics.aspx','PageHeaderFooter',70,'7E7245CF-9820-43A6-AD45-D156601467DD','Menu_Project',1,0)
	GO
	
	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('3A6E2DC0-3983-4040-BE13-3A6BDA338FED','Υ�·���ռ��ͳ��','HiddenInspection/ViolationClassificationStatistics.aspx','PageHeaderFooter',80,'7E7245CF-9820-43A6-AD45-D156601467DD','Menu_Project',1,0)
	GO
	
	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('36FDA642-5BB9-4C29-AFF2-190397242F0A','�ְ���ռ��ͳ��','HiddenInspection/SubUnitRateStatistics.aspx','PageHeaderFooter',90,'7E7245CF-9820-43A6-AD45-D156601467DD','Menu_Project',1,0)
	GO
	
	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('710A1A13-89C2-4DBA-B940-99D1B91E8F3E','Υ�·���Ƚ�ͼ','HiddenInspection/ViolationClassificationComparison.aspx','PageHeaderFooter',100,'7E7245CF-9820-43A6-AD45-D156601467DD','Menu_Project',1,0)
	GO
	
	


/**********����Ѳ�죨�ֻ��ˣ���ͼ*************/
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
	(CASE Registration.states WHEN '1' THEN '������' WHEN '2' THEN '������' WHEN '3' THEN '�ѱջ�' ELSE '������' END ) AS StatesStr,
	RegisterTypes.RegisterTypesId,
	RegisterTypes.RegisterTypesName,
	CheckItemDetail.CheckContent,  --ר����������
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

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_HazardRegisterRecord', @level2type=N'COLUMN',@level2name=N'HazardRegisterRecordId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ĿId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_HazardRegisterRecord', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ϸ��Ids' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_HazardRegisterRecord', @level2type=N'COLUMN',@level2name=N'HazardRegisterIds'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ѳ������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_HazardRegisterRecord', @level2type=N'COLUMN',@level2name=N'CheckDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ѳ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_HazardRegisterRecord', @level2type=N'COLUMN',@level2name=N'CheckPerson'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������ͣ�1-��ȫ��2-������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_HazardRegisterRecord', @level2type=N'COLUMN',@level2name=N'CheckType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����Ѳ���¼��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_HazardRegisterRecord'
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
/*�ֻ�APP����Ѳ���¼�б���ͼ*/
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

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_CheckSpecial', @level2type=N'COLUMN',@level2name=N'CheckSpecialId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_CheckSpecial', @level2type=N'COLUMN',@level2name=N'CheckSpecialCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ĿId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_CheckSpecial', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ܼ쵥λ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_CheckSpecial', @level2type=N'COLUMN',@level2name=N'UnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_CheckSpecial', @level2type=N'COLUMN',@level2name=N'Date'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_CheckSpecial', @level2type=N'COLUMN',@level2name=N'CheckMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����Ա' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_CheckSpecial', @level2type=N'COLUMN',@level2name=N'JointCheckMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'״̬��0-���±��ƣ�1-���ƣ�2-�����У�3-������ɣ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_CheckSpecial', @level2type=N'COLUMN',@level2name=N'States'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ʩ����λ�Ƿ��ѽ��գ�true-�ǣ�false-��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_CheckSpecial', @level2type=N'COLUMN',@level2name=N'IsReceived'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'APPר�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_CheckSpecial'
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

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_CheckSpecialAudit', @level2type=N'COLUMN',@level2name=N'CheckSpecialAuditId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_CheckSpecialAudit', @level2type=N'COLUMN',@level2name=N'CheckSpecialId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_CheckSpecialAudit', @level2type=N'COLUMN',@level2name=N'AuditMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_CheckSpecialAudit', @level2type=N'COLUMN',@level2name=N'AuditDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����裨0-���±��ƣ�1-���ƣ�2-�����У�3-������ɣ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_CheckSpecialAudit', @level2type=N'COLUMN',@level2name=N'AuditStep'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'APPר����������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSE_Hazard_CheckSpecialAudit'
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
/*��ȫʩ�������б���ͼ*/
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
	case c.States when '0' then '�ر���'
	             when '1' then '������'
	             when '2' then '������'
	             else '�������' end as StateStr
FROM dbo.HSSE_Hazard_CheckSpecial AS c
LEFT JOIN dbo.Base_Unit AS unit ON unit.UnitId =c.UnitId
LEFT JOIN dbo.Sys_User AS user2 ON  user2.UserId =(select AuditMan from dbo.HSSE_Hazard_CheckSpecialAudit ca 
where ca.CheckSpecialId=c.CheckSpecialId and ca.AuditDate is null)


GO





CREATE VIEW [dbo].[View_Hazard_SafeSupervision]
/*��ȫʩ�������б���ͼ*/
AS
SELECT 
    c.SafeSupervisionId,
    c.SafeSupervisionCode,
    c.ProjectId,
    c.CheckType,
    case c.CheckType when '1' then '��˾�쵼����'
                     when '2' then 'ְ�ܹ������쵼'
                     when '3' then 'ҵ��λ�쵼����'
                     when '4' then 'ҵ��λ�����쵼'
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
@projectId nvarchar(100),	--ʩ����ĿId
@queryFlag int,	--��ѯ������־
@queryPk nvarchar(100),	--��ѯ��������
@queryNo nvarchar(100)	--��ѯ��������ֵ
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
(select pq.PersonQualityId as QualityId, '֤���ţ�' + pq.CertificateNo + '��(�����λ��Ա���ʣ�������' + p.PersonName + ')' +  
'������' + convert(nvarchar(6),DATEDIFF(day,getdate(),dateadd(YEAR,EnableYear,SendDate))) + '�쵽��' as QualityDec , 'person' as QualityType
from dbo.HSSE_QualityAudit_PersonQuality pq
left join dbo.Base_Person p on p.PersonId=pq.PersonId
where p.ProjectId=@projectId and dateadd(month,-1,dateadd(YEAR,EnableYear,SendDate))<=getdate() and getdate()<dateadd(YEAR,EnableYear,SendDate)
and LateCheckDate is null and IsSee is null) 
UNION
(select pq.PersonQualityId as QualityId, '֤���ţ�' + pq.CertificateNo + '��(�����λ��Ա���ʣ�������' + p.PersonName + ')' +  
'������' + convert(nvarchar(6),DATEDIFF(day,getdate(),dateadd(YEAR,EnableYear,LateCheckDate))) + '�쵽��' as QualityDec , 'person' as QualityType
from dbo.HSSE_QualityAudit_PersonQuality pq
left join dbo.Base_Person p on p.PersonId=pq.PersonId
where p.ProjectId=@projectId and dateadd(month,-1,dateadd(YEAR,EnableYear,LateCheckDate))<=getdate() and getdate()<dateadd(YEAR,EnableYear,LateCheckDate)
and LateCheckDate is not null  and IsSee is null )
UNION
(select pq.PersonQualityId as QualityId, '֤���ţ�' + pq.CertificateNo + '��(�����λ��Ա���ʣ�������' + p.PersonName + ')' +  
'���ѹ���' + convert(nvarchar(6),DATEDIFF(day,dateadd(YEAR,EnableYear,SendDate),getdate())) + '��' as QualityDec  , 'person' as QualityType
from dbo.HSSE_QualityAudit_PersonQuality pq
left join dbo.Base_Person p on p.PersonId=pq.PersonId
where p.ProjectId=@projectId and dateadd(month,-1,dateadd(YEAR,EnableYear,SendDate))<=getdate() and getdate()>=dateadd(YEAR,EnableYear,SendDate)
and LateCheckDate is null and IsSee is null)
UNION
(select pq.PersonQualityId as QualityId, '֤���ţ�' + pq.CertificateNo + '��(�����λ��Ա���ʣ�������' + p.PersonName + ')' +  
'���ѹ���' + convert(nvarchar(6),DATEDIFF(day,dateadd(YEAR,EnableYear,LateCheckDate),getdate())) + '��' as QualityDec  , 'person' as QualityType
from dbo.HSSE_QualityAudit_PersonQuality pq
left join dbo.Base_Person p on p.PersonId=pq.PersonId
where p.ProjectId=@projectId and dateadd(month,-1,dateadd(YEAR,EnableYear,LateCheckDate))<=getdate() and getdate()>=dateadd(YEAR,EnableYear,LateCheckDate)
and LateCheckDate is not null and IsSee is null)
UNION
(select eq.EquipmentQualityCode as QualityId, '�ϸ�֤��ţ�' + eq.CertificateCode + '��(��������豸���ʣ��豸���ƣ�' + eq.EquipmentName + ')' + 
'������' + convert(nvarchar(6),DATEDIFF(day,getdate(),dateadd(YEAR,EnableYear,ProvidedDate))) + '�쵽��' as QualityDec , 'equipment' as QualityType
from dbo.HSSE_QualityAudit_EquipmentQuality eq
left join dbo.HSSE_Base_Equipment e on e.EquipmentId=eq.SpecialEquipmentType
where eq.ProjectId=@projectId and dateadd(month,-1,dateadd(YEAR,EnableYear,ProvidedDate))<=getdate() and getdate()<dateadd(YEAR,EnableYear,ProvidedDate) and IsSee is null and AprovalState='1')
UNION
(select eq.EquipmentQualityCode as QualityId, '�ϸ�֤��ţ�' + eq.CertificateCode + '��(��������豸���ʣ��豸���ƣ�' + eq.EquipmentName + ')' + 
'���ѹ���' + convert(nvarchar(6),DATEDIFF(day,dateadd(YEAR,EnableYear,ProvidedDate),getdate())) + '��' as QualityDec , 'equipment' as QualityType
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

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������ѵid' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestTraining', @level2type=N'COLUMN',@level2name=N'TrainingId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������ѵ��Դ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestTraining', @level2type=N'COLUMN',@level2name=N'TrainingCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������ѵ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestTraining', @level2type=N'COLUMN',@level2name=N'TrainingName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�Ƿ�ĩ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestTraining', @level2type=N'COLUMN',@level2name=N'IsEndLever'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������ѵ��Դ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestTraining'
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

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������ѵ��ϸid' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestTrainingItem', @level2type=N'COLUMN',@level2name=N'TrainingItemId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������ѵ����id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestTrainingItem', @level2type=N'COLUMN',@level2name=N'TrainingId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ϸ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestTrainingItem', @level2type=N'COLUMN',@level2name=N'TrainingItemCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ϸ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestTrainingItem', @level2type=N'COLUMN',@level2name=N'TrainingItemName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ժҪ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestTrainingItem', @level2type=N'COLUMN',@level2name=N'Abstracts'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestTrainingItem', @level2type=N'COLUMN',@level2name=N'AttachUrl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�汾' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestTrainingItem', @level2type=N'COLUMN',@level2name=N'VersionNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���ͣ�1-��ѡ��2-��ѡ��3-�ж��⣩' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestTrainingItem', @level2type=N'COLUMN',@level2name=N'TestType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ʺϸ�λID(���λ)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestTrainingItem', @level2type=N'COLUMN',@level2name=N'WorkPostIds'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ʺϸ�λID(���λ)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestTrainingItem', @level2type=N'COLUMN',@level2name=N'WorkPostNames'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����A' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestTrainingItem', @level2type=N'COLUMN',@level2name=N'AItem'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����B' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestTrainingItem', @level2type=N'COLUMN',@level2name=N'BItem'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����C' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestTrainingItem', @level2type=N'COLUMN',@level2name=N'CItem'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����D' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestTrainingItem', @level2type=N'COLUMN',@level2name=N'DItem'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����E' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestTrainingItem', @level2type=N'COLUMN',@level2name=N'EItem'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ֵ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestTrainingItem', @level2type=N'COLUMN',@level2name=N'Score'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ȷ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestTrainingItem', @level2type=N'COLUMN',@level2name=N'AnswerItems'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ѵ��Դ��ϸ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestTrainingItem'
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

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���Լ�¼����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_ModelTestRecord', @level2type=N'COLUMN',@level2name=N'ModelTestRecordId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ĿId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_ModelTestRecord', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_ModelTestRecord', @level2type=N'COLUMN',@level2name=N'TestManId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���Կ�ʼʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_ModelTestRecord', @level2type=N'COLUMN',@level2name=N'TestStartTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���Խ���ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_ModelTestRecord', @level2type=N'COLUMN',@level2name=N'TestEndTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���Գɼ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_ModelTestRecord', @level2type=N'COLUMN',@level2name=N'TestScores'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_ModelTestRecord', @level2type=N'COLUMN',@level2name=N'TrainingId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ģ�⿼�Լ�¼��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_ModelTestRecord'
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

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���Լ�¼��ϸ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_ModelTestRecordItem', @level2type=N'COLUMN',@level2name=N'ModelTestRecordItemId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���Լ�¼����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_ModelTestRecordItem', @level2type=N'COLUMN',@level2name=N'ModelTestRecordId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��Ŀ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_ModelTestRecordItem', @level2type=N'COLUMN',@level2name=N'TrainingItemName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��Ŀ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_ModelTestRecordItem', @level2type=N'COLUMN',@level2name=N'Abstracts'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��Ŀ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_ModelTestRecordItem', @level2type=N'COLUMN',@level2name=N'AttachUrl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���ͣ�1-��ѡ��2-��ѡ��3-�ж��⣩' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_ModelTestRecordItem', @level2type=N'COLUMN',@level2name=N'TestType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����A' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_ModelTestRecordItem', @level2type=N'COLUMN',@level2name=N'AItem'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����B' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_ModelTestRecordItem', @level2type=N'COLUMN',@level2name=N'BItem'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����C' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_ModelTestRecordItem', @level2type=N'COLUMN',@level2name=N'CItem'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����D' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_ModelTestRecordItem', @level2type=N'COLUMN',@level2name=N'DItem'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����E' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_ModelTestRecordItem', @level2type=N'COLUMN',@level2name=N'EItem'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ȷ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_ModelTestRecordItem', @level2type=N'COLUMN',@level2name=N'AnswerItems'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��Ŀ��ֵ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_ModelTestRecordItem', @level2type=N'COLUMN',@level2name=N'Score'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��Ŀ�÷�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_ModelTestRecordItem', @level2type=N'COLUMN',@level2name=N'SubjectScore'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ش���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_ModelTestRecordItem', @level2type=N'COLUMN',@level2name=N'SelectedItem'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���Լ�¼��ϸ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_ModelTestRecordItem'
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

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_Plan', @level2type=N'COLUMN',@level2name=N'PlanId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ĿId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_Plan', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ƻ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_Plan', @level2type=N'COLUMN',@level2name=N'PlanCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ƻ��ƶ���id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_Plan', @level2type=N'COLUMN',@level2name=N'DesignerId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ƻ��ƶ�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_Plan', @level2type=N'COLUMN',@level2name=N'DesignerDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��λid���ϣ����Ÿ����� ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_Plan', @level2type=N'COLUMN',@level2name=N'WorkPostId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ƻ�״̬��0-���ύ��1-���ύ��2-�����ͣ�-1-�����ϣ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_Plan', @level2type=N'COLUMN',@level2name=N'States'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ƻ�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_Plan', @level2type=N'COLUMN',@level2name=N'PlanName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��λ���Ƽ��ϣ����Ÿ����� ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_Plan', @level2type=N'COLUMN',@level2name=N'WorkPostNames'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ѵ�ƻ���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_Plan'
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

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ϸ��id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_PlanItem', @level2type=N'COLUMN',@level2name=N'PlanItemId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_PlanItem', @level2type=N'COLUMN',@level2name=N'PlanId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ѵ�̲Ŀ�id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_PlanItem', @level2type=N'COLUMN',@level2name=N'TrainingEduId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ѵ�̲���ϸid' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_PlanItem', @level2type=N'COLUMN',@level2name=N'TrainingEduItemId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ѵ�ƻ���ϸ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_PlanItem'
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

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ѵ����id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_Task', @level2type=N'COLUMN',@level2name=N'TaskId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ĿId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_Task', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ƻ���id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_Task', @level2type=N'COLUMN',@level2name=N'PlanId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��Աid' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_Task', @level2type=N'COLUMN',@level2name=N'UserId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_Task', @level2type=N'COLUMN',@level2name=N'TaskDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����״̬��0-δ��Ӧ��1-����Ӧ��2-����ɣ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_Task', @level2type=N'COLUMN',@level2name=N'States'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ѵ�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_Task'
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

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���Լƻ�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestPlan', @level2type=N'COLUMN',@level2name=N'TestPlanId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ĿId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestPlan', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestPlan', @level2type=N'COLUMN',@level2name=N'PlanCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ƻ��ƶ���id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestPlan', @level2type=N'COLUMN',@level2name=N'PlanManId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ƻ��ƶ�ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestPlan', @level2type=N'COLUMN',@level2name=N'PlanDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ƻ����Կ�ʼʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestPlan', @level2type=N'COLUMN',@level2name=N'TestStartTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����ʱ������λ�����ӣ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestPlan', @level2type=N'COLUMN',@level2name=N'Duration'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ܷ�ֵ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestPlan', @level2type=N'COLUMN',@level2name=N'TotalScore'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��Ŀ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestPlan', @level2type=N'COLUMN',@level2name=N'QuestionCount'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���Եص�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestPlan', @level2type=N'COLUMN',@level2name=N'TestPalce'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���Ե�λids' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestPlan', @level2type=N'COLUMN',@level2name=N'UnitIds'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���Ե�λ����s' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestPlan', @level2type=N'COLUMN',@level2name=N'UnitNames'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���Բ���ids' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestPlan', @level2type=N'COLUMN',@level2name=N'DepartIds'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���Բ�������s' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestPlan', @level2type=N'COLUMN',@level2name=N'DepartNames'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������λids' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestPlan', @level2type=N'COLUMN',@level2name=N'WorkPostIds'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������λ����s' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestPlan', @level2type=N'COLUMN',@level2name=N'WorkPostNames'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ά��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestPlan', @level2type=N'COLUMN',@level2name=N'QRCodeUrl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���Լƻ�״̬��0-���ύ��1-�ѷ���δ���ԣ�2-�����У�3���Խ�����-1���ϣ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestPlan', @level2type=N'COLUMN',@level2name=N'States'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ƻ�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestPlan', @level2type=N'COLUMN',@level2name=N'PlanName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ƻ�����ɨ�����ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestPlan', @level2type=N'COLUMN',@level2name=N'TestEndTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���Լƻ���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestPlan'
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

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���Լƻ�����������ռ������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestPlanTraining', @level2type=N'COLUMN',@level2name=N'TestPlanTrainingId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���Լƻ�id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestPlanTraining', @level2type=N'COLUMN',@level2name=N'TestPlanId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestPlanTraining', @level2type=N'COLUMN',@level2name=N'TrainingId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ѡ������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestPlanTraining', @level2type=N'COLUMN',@level2name=N'TestType1Count'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ѡ������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestPlanTraining', @level2type=N'COLUMN',@level2name=N'TestType2Count'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ж�������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestPlanTraining', @level2type=N'COLUMN',@level2name=N'TestType3Count'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����������ռ������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestPlanTraining'
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

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���Լ�¼����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestRecord', @level2type=N'COLUMN',@level2name=N'TestRecordId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ĿId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestRecord', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���Լƻ���id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestRecord', @level2type=N'COLUMN',@level2name=N'TestPlanId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestRecord', @level2type=N'COLUMN',@level2name=N'TestManId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���Կ�ʼʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestRecord', @level2type=N'COLUMN',@level2name=N'TestStartTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���Խ���ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestRecord', @level2type=N'COLUMN',@level2name=N'TestEndTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���Գɼ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestRecord', @level2type=N'COLUMN',@level2name=N'TestScores'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ʱ������Ϣ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestRecord', @level2type=N'COLUMN',@level2name=N'TemporaryUser'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�Ƿ�鵵' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestRecord', @level2type=N'COLUMN',@level2name=N'isFiled'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���Լ�¼��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestRecord'
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

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���Լ�¼��ϸ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestRecordItem', @level2type=N'COLUMN',@level2name=N'TestRecordItemId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���Լ�¼����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestRecordItem', @level2type=N'COLUMN',@level2name=N'TestRecordId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��Ŀ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestRecordItem', @level2type=N'COLUMN',@level2name=N'TrainingItemName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��Ŀ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestRecordItem', @level2type=N'COLUMN',@level2name=N'Abstracts'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��Ŀ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestRecordItem', @level2type=N'COLUMN',@level2name=N'AttachUrl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���ͣ�1-��ѡ��2-��ѡ��3-�ж��⣩' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestRecordItem', @level2type=N'COLUMN',@level2name=N'TestType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����A' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestRecordItem', @level2type=N'COLUMN',@level2name=N'AItem'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����B' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestRecordItem', @level2type=N'COLUMN',@level2name=N'BItem'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����C' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestRecordItem', @level2type=N'COLUMN',@level2name=N'CItem'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����D' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestRecordItem', @level2type=N'COLUMN',@level2name=N'DItem'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����E' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestRecordItem', @level2type=N'COLUMN',@level2name=N'EItem'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ȷ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestRecordItem', @level2type=N'COLUMN',@level2name=N'AnswerItems'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��Ŀ��ֵ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestRecordItem', @level2type=N'COLUMN',@level2name=N'Score'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��Ŀ�÷�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestRecordItem', @level2type=N'COLUMN',@level2name=N'SubjectScore'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ش���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestRecordItem', @level2type=N'COLUMN',@level2name=N'SelectedItem'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��Ŀ���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestRecordItem', @level2type=N'COLUMN',@level2name=N'TrainingItemCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���Լ�¼��ϸ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestRecordItem'
GO

ALTER TABLE [dbo].[Training_TestRecordItem]  WITH CHECK ADD  CONSTRAINT [FK_Training_TestRecordItem_Training_TestRecord] FOREIGN KEY([TestRecordId])
REFERENCES [dbo].[Training_TestRecord] ([TestRecordId])
GO

ALTER TABLE [dbo].[Training_TestRecordItem] CHECK CONSTRAINT [FK_Training_TestRecordItem_Training_TestRecord]
GO


alter table SitePerson_Person add Password nvarchar(50) null
GO
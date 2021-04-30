
ALTER VIEW [dbo].[View_NewDynamic] 
AS
SELECT PersonQuality.PersonId AS Id
	,'�ظ���Ա����' AS Type, ( '[' + ISNULL(Person.CardNo,'') +']'+ Person.PersonName +'�ѹ��ڣ���Ŀ��'+ Project.ProjectName) AS Name
	,PersonQuality.LimitDate AS Date
	,'~/QualityAudit/PersonQualityEdit.aspx?PersonId={0}' AS Url
	,Project.ProjectId 
FROM QualityAudit_PersonQuality AS PersonQuality
	LEFT JOIN SitePerson_Person AS Person ON Person.PersonId = PersonQuality.PersonId
	LEFT JOIN Base_Project AS Project ON Person.ProjectId =Project.ProjectId
WHERE PersonQuality.LimitDate<=GETDATE() 
AND (GETDATE()< Person.OutTime OR Person.OutTime IS NULL)

UNION
SELECT EquipmentQuality.EquipmentQualityId
	,'�����豸����', EquipmentQuality.EquipmentQualityName+'�ѹ��ڣ���Ŀ��'+ Project.ProjectName
	,EquipmentQuality.LimitDate
	,'~/QualityAudit/EquipmentQualityEdit.aspx?EquipmentQualityId={0}' AS Url 
	,Project.ProjectId
FROM QualityAudit_EquipmentQuality AS EquipmentQuality 
	LEFT JOIN Base_SpecialEquipment AS SpecialEquipment ON SpecialEquipment.SpecialEquipmentId = EquipmentQuality.SpecialEquipmentId
	LEFT JOIN Base_Project AS Project ON EquipmentQuality.ProjectId =Project.ProjectId
WHERE EquipmentQuality.LimitDate<=GETDATE() 
	AND (GETDATE()< EquipmentQuality.OutDate OR EquipmentQuality.OutDate IS NULL)

UNION
SELECT CarManager.CarManagerId
	,'�ֳ���������', CarName+'����ѹ��ڣ���Ŀ��'+ Project.ProjectName
	,CarManager.LastYearCheckDate
	,'~/Administrative/CarManagerView.aspx?CarManagerId={0}' AS Url 
	,Project.ProjectId
FROM Administrative_CarManager AS CarManager 
	LEFT JOIN Base_Project AS Project ON CarManager.ProjectId =Project.ProjectId
WHERE CarManager.LastYearCheckDate<=GETDATE() 

UNION
SELECT CarManager.CarManagerId
	,'�ֳ���������', CarName+'�����ѹ��ڣ���Ŀ��'+ Project.ProjectName
	,CarManager.InsuranceDate
	,'~/Administrative/CarManagerView.aspx?CarManagerId={0}' AS Url 
	,Project.ProjectId
FROM Administrative_CarManager AS CarManager 
	LEFT JOIN Base_Project AS Project ON CarManager.ProjectId =Project.ProjectId
WHERE CarManager.InsuranceDate<=GETDATE() 

UNION
SELECT DriverManager.DriverManagerId
	,'��ʻԱ����', DriverName+'����ѹ��ڣ���Ŀ��'+ Project.ProjectName
	,DriverManager.CheckDate
	,'~/Administrative/DriverManagerView.aspx?DriverManagerId={0}' AS Url 
	,Project.ProjectId
FROM Administrative_DriverManager AS DriverManager 
	LEFT JOIN Base_Project AS Project ON DriverManager.ProjectId =Project.ProjectId
WHERE DriverManager.CheckDate<=GETDATE()

UNION
SELECT LicenseManager.LicenseManagerId
	,'��ҵ���֤', LicenseManagerCode+'�ѹ��ڣ���Ŀ��'+ Project.ProjectName
	,LicenseManager.EndDate
	,'~/License/LicenseManagerView.aspx?LicenseManagerId={0}' AS Url 
	,Project.ProjectId
FROM License_LicenseManager AS LicenseManager 
	LEFT JOIN Base_Project AS Project ON LicenseManager.ProjectId =Project.ProjectId
WHERE LicenseManager.EndDate<=GETDATE() AND  DATEADD(DAY,1,LicenseManager.EndDate)>=GETDATE()

UNION
SELECT PunishNotice.PunishNoticeId
	,'����֪ͨ��', PunishNoticeCode+'δ��Ӧ����Ŀ��'+ Project.ProjectName
	,PunishNotice.PunishNoticeDate
	,'~/Check/PunishNoticeEdit.aspx?PunishNoticeId={0}' AS Url 
	,Project.ProjectId
FROM Check_PunishNotice AS PunishNotice 
	LEFT JOIN Base_Project AS Project ON PunishNotice.ProjectId =Project.ProjectId
	LEFT JOIN AttachFile AS AttachFile ON PunishNotice.PunishNoticeId =AttachFile.ToKeyId
WHERE AttachFile.ToKeyId IS NULL AND PunishNotice.States='2'

UNION
SELECT item.HazardListId
	,'Σ��Դ��ʶ����', hList.HazardCode+'δ��Ӧ����Ŀ��'+ Project.ProjectName
	,hl.CompileDate
	,'~/Hazard/Response.aspx?HazardListId={0}' AS Url 
	,Project.ProjectId
FROM Hazard_HazardSelectedItem AS item 
	left join dbo.Hazard_HazardList hl on item.HazardListId=hl.HazardListId
	left join dbo.Technique_HazardList hList on item.HazardId=hList.HazardId
	LEFT JOIN Base_Project AS Project ON hl.ProjectId =Project.ProjectId
WHERE item.IsResponse = 0 and dateadd(wk,item.PromptTime,hl.CompileDate)<=GETDATE()

GO

CREATE TABLE [dbo].[QualityAudit_SubUnitQualityAuditDetail](
	[AuditDetailId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[UnitId] [nvarchar](50) NULL,
	[AuditContent] [nvarchar](200) NULL,
	[AuditMan] [nvarchar](50) NULL,
	[AuditDate] [datetime] NULL,
	[AuditResult] [nvarchar](500) NULL,
 CONSTRAINT [PK_QualityAudit_SubUnitQualityAuditDetail] PRIMARY KEY CLUSTERED 
(
	[AuditDetailId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_SubUnitQualityAuditDetail', @level2type=N'COLUMN',@level2name=N'AuditDetailId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ĿId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_SubUnitQualityAuditDetail', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��λId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_SubUnitQualityAuditDetail', @level2type=N'COLUMN',@level2name=N'UnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_SubUnitQualityAuditDetail', @level2type=N'COLUMN',@level2name=N'AuditContent'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_SubUnitQualityAuditDetail', @level2type=N'COLUMN',@level2name=N'AuditMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_SubUnitQualityAuditDetail', @level2type=N'COLUMN',@level2name=N'AuditDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_SubUnitQualityAuditDetail', @level2type=N'COLUMN',@level2name=N'AuditResult'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ʩ���ְ��������ϸ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_SubUnitQualityAuditDetail'
GO

ALTER TABLE [dbo].[QualityAudit_SubUnitQualityAuditDetail]  WITH CHECK ADD  CONSTRAINT [FK_QualityAudit_SubUnitQualityAuditDetail_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[QualityAudit_SubUnitQualityAuditDetail] CHECK CONSTRAINT [FK_QualityAudit_SubUnitQualityAuditDetail_Base_Project]
GO

ALTER TABLE [dbo].[QualityAudit_SubUnitQualityAuditDetail]  WITH CHECK ADD  CONSTRAINT [FK_QualityAudit_SubUnitQualityAuditDetail_Base_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[QualityAudit_SubUnitQualityAuditDetail] CHECK CONSTRAINT [FK_QualityAudit_SubUnitQualityAuditDetail_Base_Unit]
GO

ALTER TABLE [dbo].[QualityAudit_SubUnitQualityAuditDetail]  WITH CHECK ADD  CONSTRAINT [FK_QualityAudit_SubUnitQualityAuditDetail_Sys_User] FOREIGN KEY([AuditMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[QualityAudit_SubUnitQualityAuditDetail] CHECK CONSTRAINT [FK_QualityAudit_SubUnitQualityAuditDetail_Sys_User]
GO





CREATE VIEW [dbo].[View_QualityAudit_SubUnitQualityAuditDetail]  AS 
/*�ְ�����������¼�б���ͼ*/
SELECT detail.AuditDetailId, 
detail.ProjectId, 
detail.UnitId, 
detail.AuditContent,
detail.AuditMan,
detail.AuditDate,
detail.AuditResult,
user1.UserName as AuditManName
FROM dbo.QualityAudit_SubUnitQualityAuditDetail AS detail
LEFT JOIN Sys_User AS user1 ON user1.UserId = detail.AuditMan 





GO



CREATE TABLE [dbo].[QualityAudit_EquipmentQualityAuditDetail](
	[AuditDetailId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[EquipmentQualityId] [nvarchar](50) NULL,
	[AuditContent] [nvarchar](200) NULL,
	[AuditMan] [nvarchar](50) NULL,
	[AuditDate] [datetime] NULL,
	[AuditResult] [nvarchar](500) NULL,
 CONSTRAINT [PK_QualityAudit_EquipmentQualityAuditDetail] PRIMARY KEY CLUSTERED 
(
	[AuditDetailId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_EquipmentQualityAuditDetail', @level2type=N'COLUMN',@level2name=N'AuditDetailId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ĿId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_EquipmentQualityAuditDetail', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����豸����Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_EquipmentQualityAuditDetail', @level2type=N'COLUMN',@level2name=N'EquipmentQualityId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_EquipmentQualityAuditDetail', @level2type=N'COLUMN',@level2name=N'AuditContent'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_EquipmentQualityAuditDetail', @level2type=N'COLUMN',@level2name=N'AuditMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_EquipmentQualityAuditDetail', @level2type=N'COLUMN',@level2name=N'AuditDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_EquipmentQualityAuditDetail', @level2type=N'COLUMN',@level2name=N'AuditResult'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����豸��������¼��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_EquipmentQualityAuditDetail'
GO

ALTER TABLE [dbo].[QualityAudit_EquipmentQualityAuditDetail]  WITH CHECK ADD  CONSTRAINT [FK_QualityAudit_EquipmentQualityAuditDetail_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[QualityAudit_EquipmentQualityAuditDetail] CHECK CONSTRAINT [FK_QualityAudit_EquipmentQualityAuditDetail_Base_Project]
GO

ALTER TABLE [dbo].[QualityAudit_EquipmentQualityAuditDetail]  WITH CHECK ADD  CONSTRAINT [FK_QualityAudit_EquipmentQualityAuditDetail_QualityAudit_EquipmentQuality] FOREIGN KEY([EquipmentQualityId])
REFERENCES [dbo].[QualityAudit_EquipmentQuality] ([EquipmentQualityId])
GO

ALTER TABLE [dbo].[QualityAudit_EquipmentQualityAuditDetail] CHECK CONSTRAINT [FK_QualityAudit_EquipmentQualityAuditDetail_QualityAudit_EquipmentQuality]
GO

ALTER TABLE [dbo].[QualityAudit_EquipmentQualityAuditDetail]  WITH CHECK ADD  CONSTRAINT [FK_QualityAudit_EquipmentQualityAuditDetail_Sys_User] FOREIGN KEY([AuditMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[QualityAudit_EquipmentQualityAuditDetail] CHECK CONSTRAINT [FK_QualityAudit_EquipmentQualityAuditDetail_Sys_User]
GO


CREATE VIEW [dbo].[View_QualityAudit_EquipmentQualityAuditDetail]  AS 
/*�����豸��������¼�б���ͼ*/
SELECT detail.AuditDetailId, 
detail.ProjectId, 
detail.EquipmentQualityId, 
detail.AuditContent,
detail.AuditMan,
detail.AuditDate,
detail.AuditResult,
user1.UserName as AuditManName
FROM dbo.QualityAudit_EquipmentQualityAuditDetail AS detail
LEFT JOIN Sys_User AS user1 ON user1.UserId = detail.AuditMan 





GO


alter table dbo.QualityAudit_GeneralEquipmentQuality add InDate datetime null
GO
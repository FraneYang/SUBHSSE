CREATE TABLE [dbo].[EduTrain_TrainTest](
	[TrainTestId] [nvarchar](50) NOT NULL,
	[TrainingId] [nvarchar](50) NOT NULL,
	[QsnCode] [nvarchar](50) NULL,
	[QsnContent] [nvarchar](150) NULL,
	[QsnAnswer] [nvarchar](500) NULL,
	[QsnCategory] [nvarchar](10) NULL,
	[QsnKind] [nvarchar](10) NULL,
	[QsnImportant] [nvarchar](10) NULL,
	[Analysis] [nvarchar](500) NULL,
 CONSTRAINT [PK_EduTrain_TrainTest] PRIMARY KEY CLUSTERED 
(
	[TrainTestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


ALTER TABLE [dbo].[EduTrain_TrainTest]  WITH CHECK ADD  CONSTRAINT [FK_EduTrain_TrainTest_EduTrain_TrainRecord] FOREIGN KEY([TrainingId])
REFERENCES [dbo].[EduTrain_TrainRecord] ([TrainingId])
GO

ALTER TABLE [dbo].[EduTrain_TrainTest] CHECK CONSTRAINT [FK_EduTrain_TrainTest_EduTrain_TrainRecord]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainTest', @level2type=N'COLUMN',@level2name=N'TrainTestId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'培训记录ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainTest', @level2type=N'COLUMN',@level2name=N'TrainingId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainTest', @level2type=N'COLUMN',@level2name=N'QsnCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'试题内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainTest', @level2type=N'COLUMN',@level2name=N'QsnContent'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'答案' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainTest', @level2type=N'COLUMN',@level2name=N'QsnAnswer'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'试题分类（1-文字题，2-多媒体题，3-图片题）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainTest', @level2type=N'COLUMN',@level2name=N'QsnCategory'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'试题类型 （1-单选，2-多选，3-判断）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainTest', @level2type=N'COLUMN',@level2name=N'QsnKind'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'重要程度（0-容易，1-一般，2-困难）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainTest', @level2type=N'COLUMN',@level2name=N'QsnImportant'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'试题解析' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainTest', @level2type=N'COLUMN',@level2name=N'Analysis'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'培训试题表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainTest'
GO



ALTER TABLE [dbo].[License_LicenseManager] DROP CONSTRAINT [FK_License_LicenseManager_ProjectData_WorkArea]
GO

ALTER TABLE License_LicenseManager ALTER COLUMN WorkAreaId NVARCHAR(500)
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
	--WorkArea.WorkAreaName,
	LicenseManager.StartDate,
	LicenseManager.EndDate,
	LicenseManager.ApplicantMan,
	WorkAreaName = STUFF(( SELECT ',' + WorkAreaName FROM ProjectData_WorkArea
				    where PATINDEX('%,' + RTRIM(ProjectData_WorkArea.WorkAreaId) + ',%',',' + LicenseManager.WorkAreaId + ',')>0
					ORDER BY PATINDEX('%,' + RTRIM(LicenseManager.WorkAreaId) + ',%',',' + LicenseManager.WorkAreaId + ',')
					FOR XML PATH('')), 1, 1,'')
FROM dbo.License_LicenseManager AS LicenseManager
LEFT JOIN dbo.Base_Project AS Project ON Project.ProjectId = LicenseManager.ProjectId
LEFT JOIN dbo.Base_LicenseType AS LicenseType ON LicenseType.LicenseTypeId = LicenseManager.LicenseTypeId
LEFT JOIN dbo.Base_Unit AS Unit ON Unit.UnitId = LicenseManager.UnitId
LEFT JOIN dbo.Sys_User AS Users ON Users.UserId = LicenseManager.CompileMan
LEFT JOIN dbo.ProjectData_WorkArea AS WorkArea ON WorkArea.WorkAreaId = LicenseManager.WorkAreaId

GO


ALTER TABLE [dbo].[QualityAudit_ProjectRecord] DROP CONSTRAINT [FK_QualityAudit_ProjectRecord_Base_Unit]
GO

ALTER TABLE dbo.QualityAudit_ProjectRecord ALTER COLUMN UnitId NVARCHAR(500)



CREATE TABLE [dbo].[QualityAudit_ManagePersonQualityItem](
	[ManagePersonQualityItemId] [NVARCHAR](50) NOT NULL,
	[ManagePersonQualityId] [NVARCHAR](50) NULL,
	[CertificateNo] [NVARCHAR](50) NULL,
	[CertificateName] [NVARCHAR](50) NULL,
	[SendUnit] [NVARCHAR](50) NULL,
	[SendDate] [DATETIME] NULL,
	[LimitDate] [DATETIME] NULL,
 CONSTRAINT [PK_QualityAudit_ManagePersonQualityItem] PRIMARY KEY CLUSTERED 
(
	[ManagePersonQualityItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[QualityAudit_ManagePersonQualityItem]  WITH CHECK ADD  CONSTRAINT [FK_QualityAudit_ManagePersonQualityItem_QualityAudit_ManagePersonQuality] FOREIGN KEY([ManagePersonQualityId])
REFERENCES [dbo].[QualityAudit_ManagePersonQuality] ([ManagePersonQualityId])
GO

ALTER TABLE [dbo].[QualityAudit_ManagePersonQualityItem] CHECK CONSTRAINT [FK_QualityAudit_ManagePersonQualityItem_QualityAudit_ManagePersonQuality]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_ManagePersonQualityItem', @level2type=N'COLUMN',@level2name=N'ManagePersonQualityItemId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'管理人员资质ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_ManagePersonQualityItem', @level2type=N'COLUMN',@level2name=N'ManagePersonQualityId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'证书编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_ManagePersonQualityItem', @level2type=N'COLUMN',@level2name=N'CertificateNo'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'证书名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_ManagePersonQualityItem', @level2type=N'COLUMN',@level2name=N'CertificateName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发证单位' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_ManagePersonQualityItem', @level2type=N'COLUMN',@level2name=N'SendUnit'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发证时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_ManagePersonQualityItem', @level2type=N'COLUMN',@level2name=N'SendDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'有效期至' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_ManagePersonQualityItem', @level2type=N'COLUMN',@level2name=N'LimitDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'管理人员资质明细表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_ManagePersonQualityItem'
GO


ALTER TABLE dbo.SitePerson_Person ALTER COLUMN UnitId NVARCHAR(50)
GO

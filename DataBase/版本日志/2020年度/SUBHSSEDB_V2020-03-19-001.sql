ALTER TABLE SecuritySystem_SafetyOrganization ALTER COLUMN Duty nvarchar(2000) null
go
ALTER TABLE HSSESystem_HSSEManageItem ALTER COLUMN Duty nvarchar(2000) null
go
ALTER TABLE License_LicenseManager ALTER COLUMN WorkStates varchar(2) null
go
ALTER TABLE Training_PlanItem ADD CompanyTrainingItemId nvarchar(50) null
go

ALTER PROCEDURE [dbo].[Sp_GetTraining_TaskItemTraining]     
	@PlanId NVARCHAR(50),
	@WorkPostId NVARCHAR(200)=NULL
AS  
/*获取人员培训教材*/          
BEGIN
SELECT DISTINCT p.PlanId
	,p.ProjectId
	,P.PlanCode
	,P.PlanName 
	,CI.CompanyTrainingItemCode AS TrainingItemCode
	,CI.CompanyTrainingItemName AS TrainingItemName 
	,AttachFile.AttachUrl
FROM Training_Plan AS P
LEFT JOIN Training_PlanItem AS PLI ON PLI.PlanId=P.PlanId
LEFT JOIN Training_CompanyTraining AS C ON PLI.CompanyTrainingId = C.CompanyTrainingId 
LEFT JOIN Training_CompanyTrainingItem AS CI ON (PLI.CompanyTrainingItemId =CI.CompanyTrainingItemId OR (PLI.CompanyTrainingItemId IS NULL AND C.CompanyTrainingId =CI.CompanyTrainingId))
LEFT JOIN AttachFile AS AttachFile  ON CI.CompanyTrainingItemId =AttachFile.ToKeyId
WHERE P.PlanId =@PlanId AND (@WorkPostId IS NULL OR CI.WorkPostIds IS NULL OR CI.WorkPostIds LIKE ('%'+@WorkPostId+'%'))
   AND PLI.PlanItemId IS NOT NULL AND CI.CompanyTrainingId IS NOT NULL
END
GO


CREATE TABLE [dbo].[SeDin_MonthReport](
	[MonthReportId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[DueDate] [datetime] NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[ReporMonth] [datetime] NULL,
	[CompileManId] [nvarchar](50) NULL,
	[AuditManId] [nvarchar](50) NULL,
	[ApprovalManId] [nvarchar](50) NULL,
	[ThisSummary] [nvarchar](max) NULL,
	[NextPlan] [nvarchar](max) NULL,
 CONSTRAINT [PK_SeDin_MonthReport] PRIMARY KEY CLUSTERED 
(
	[MonthReportId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[SeDin_MonthReport]  WITH CHECK ADD  CONSTRAINT [FK_SeDin_MonthReport_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[SeDin_MonthReport] CHECK CONSTRAINT [FK_SeDin_MonthReport_Base_Project]
GO

ALTER TABLE [dbo].[SeDin_MonthReport]  WITH CHECK ADD  CONSTRAINT [FK_SeDin_MonthReport_Sys_User] FOREIGN KEY([CompileManId])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[SeDin_MonthReport] CHECK CONSTRAINT [FK_SeDin_MonthReport_Sys_User]
GO

ALTER TABLE [dbo].[SeDin_MonthReport]  WITH CHECK ADD  CONSTRAINT [FK_SeDin_MonthReport_Sys_User1] FOREIGN KEY([AuditManId])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[SeDin_MonthReport] CHECK CONSTRAINT [FK_SeDin_MonthReport_Sys_User1]
GO

ALTER TABLE [dbo].[SeDin_MonthReport]  WITH CHECK ADD  CONSTRAINT [FK_SeDin_MonthReport_Sys_User2] FOREIGN KEY([ApprovalManId])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[SeDin_MonthReport] CHECK CONSTRAINT [FK_SeDin_MonthReport_Sys_User2]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport', @level2type=N'COLUMN',@level2name=N'MonthReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报告截止日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport', @level2type=N'COLUMN',@level2name=N'DueDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报告月份' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport', @level2type=N'COLUMN',@level2name=N'ReporMonth'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制人Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport', @level2type=N'COLUMN',@level2name=N'CompileManId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'审核人ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport', @level2type=N'COLUMN',@level2name=N'AuditManId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'批准人ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport', @level2type=N'COLUMN',@level2name=N'ApprovalManId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'本月HSE活动综述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport', @level2type=N'COLUMN',@level2name=N'ThisSummary'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'下月HSE工作计划' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport', @level2type=N'COLUMN',@level2name=N'NextPlan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赛鼎月报' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport'
GO

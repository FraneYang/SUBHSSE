ALTER TABLE SafetyData_SafetyData ADD Remark NVARCHAR(500) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyData_SafetyData', @level2type=N'COLUMN',@level2name=N'Remark'
GO

CREATE TABLE [dbo].[SafetyData_SafetyDataPlan](
	[SafetyDataPlanId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[SafetyDataId] [nvarchar](50) NULL,
	[CheckDate] [datetime] NULL,
	[RealStartDate] [datetime] NULL,
	[RealEndDate] [datetime] NULL,
	[Score] [int] NULL,
	[Remark] [nvarchar](500) NULL,
 CONSTRAINT [PK_SafetyData_SafetyDataPlan] PRIMARY KEY CLUSTERED 
(
	[SafetyDataPlanId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[SafetyData_SafetyDataPlan]  WITH CHECK ADD  CONSTRAINT [FK_SafetyData_SafetyDataPlan_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[SafetyData_SafetyDataPlan] CHECK CONSTRAINT [FK_SafetyData_SafetyDataPlan_Base_Project]
GO

ALTER TABLE [dbo].[SafetyData_SafetyDataPlan]  WITH CHECK ADD  CONSTRAINT [FK_SafetyData_SafetyDataPlan_SafetyData_SafetyData] FOREIGN KEY([SafetyDataId])
REFERENCES [dbo].[SafetyData_SafetyData] ([SafetyDataId])
GO

ALTER TABLE [dbo].[SafetyData_SafetyDataPlan] CHECK CONSTRAINT [FK_SafetyData_SafetyDataPlan_SafetyData_SafetyData]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'考核计划总表主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyData_SafetyDataPlan', @level2type=N'COLUMN',@level2name=N'SafetyDataPlanId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyData_SafetyDataPlan', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'考核项id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyData_SafetyDataPlan', @level2type=N'COLUMN',@level2name=N'SafetyDataId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'考核截至日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyData_SafetyDataPlan', @level2type=N'COLUMN',@level2name=N'CheckDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'实际考核日期开始时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyData_SafetyDataPlan', @level2type=N'COLUMN',@level2name=N'RealStartDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'实际考核日期结束时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyData_SafetyDataPlan', @level2type=N'COLUMN',@level2name=N'RealEndDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyData_SafetyDataPlan', @level2type=N'COLUMN',@level2name=N'Score'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyData_SafetyDataPlan', @level2type=N'COLUMN',@level2name=N'Remark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'考核计划总表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyData_SafetyDataPlan'
GO





DELETE FROM Sys_Const WHERE GroupId='UnitClass'
GO
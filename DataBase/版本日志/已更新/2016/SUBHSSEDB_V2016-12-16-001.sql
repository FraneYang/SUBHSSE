ALTER TABLE SafetyData_SafetyData ADD Remark NVARCHAR(500) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ע' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyData_SafetyData', @level2type=N'COLUMN',@level2name=N'Remark'
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

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���˼ƻ��ܱ�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyData_SafetyDataPlan', @level2type=N'COLUMN',@level2name=N'SafetyDataPlanId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��Ŀid' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyData_SafetyDataPlan', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyData_SafetyDataPlan', @level2type=N'COLUMN',@level2name=N'SafetyDataId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���˽�������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyData_SafetyDataPlan', @level2type=N'COLUMN',@level2name=N'CheckDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ʵ�ʿ������ڿ�ʼʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyData_SafetyDataPlan', @level2type=N'COLUMN',@level2name=N'RealStartDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ʵ�ʿ������ڽ���ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyData_SafetyDataPlan', @level2type=N'COLUMN',@level2name=N'RealEndDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ֵ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyData_SafetyDataPlan', @level2type=N'COLUMN',@level2name=N'Score'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ע' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyData_SafetyDataPlan', @level2type=N'COLUMN',@level2name=N'Remark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���˼ƻ��ܱ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyData_SafetyDataPlan'
GO





DELETE FROM Sys_Const WHERE GroupId='UnitClass'
GO
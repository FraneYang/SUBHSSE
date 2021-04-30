ALTER TABLE SafetyData_SafetyData ADD IsCheck  BIT NULL
GO

CREATE TABLE [dbo].[SafetyData_SafetyDataPlanDelete](
	[SafetyDataPlanDeleteId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[SafetyDataId] [nvarchar](50) NULL,
	[DeleteDate] [datetime] NULL,
 CONSTRAINT [PK_SafetyData_SafetyDataPlanDelete] PRIMARY KEY CLUSTERED 
(
	[SafetyDataPlanDeleteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[SafetyData_SafetyDataPlanDelete]  WITH CHECK ADD  CONSTRAINT [FK_SafetyData_SafetyDataPlanDelete_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[SafetyData_SafetyDataPlanDelete] CHECK CONSTRAINT [FK_SafetyData_SafetyDataPlanDelete_Base_Project]
GO

ALTER TABLE [dbo].[SafetyData_SafetyDataPlanDelete]  WITH CHECK ADD  CONSTRAINT [FK_SafetyData_SafetyDataPlanDelete_SafetyData_SafetyData] FOREIGN KEY([SafetyDataId])
REFERENCES [dbo].[SafetyData_SafetyData] ([SafetyDataId])
GO

ALTER TABLE [dbo].[SafetyData_SafetyDataPlanDelete] CHECK CONSTRAINT [FK_SafetyData_SafetyDataPlanDelete_SafetyData_SafetyData]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���˼ƻ�ɾ��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyData_SafetyDataPlanDelete', @level2type=N'COLUMN',@level2name=N'SafetyDataPlanDeleteId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��Ŀid' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyData_SafetyDataPlanDelete', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyData_SafetyDataPlanDelete', @level2type=N'COLUMN',@level2name=N'SafetyDataId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ɾ������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyData_SafetyDataPlanDelete', @level2type=N'COLUMN',@level2name=N'DeleteDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���˼ƻ�ɾ����¼��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyData_SafetyDataPlanDelete'
GO


